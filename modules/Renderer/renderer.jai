Renderer :: struct {
    vka:             *VkAllocationCallbacks;
    instance:        VkInstance;
    surface:         VkSurfaceKHR;
    debug_messenger: VkDebugUtilsMessengerEXT;
    physical_device: VkPhysicalDevice;
    device:          VkDevice;
    queue_indices:   Queue_Family_Indices;

    // There is no a separate compute queue here, as Nvidia, Intel and
    // Apple do not have a separated async compute family. Only AMD
    // has, and almost 100% of the case, the graphics queue does
    // compute thing, making a separated compute queue a pain in the
    // ass. So that the command pool created at init is for graphics
    // queue only.
    graphics_queue:  VkQueue;
    present_queue:   VkQueue;
    command_pool:    VkCommandPool;

    memory_indices:  Memory_Indices;

    // All properties below is for swapchain only. Do not access them
    // if your renderer is created without swapchina support.

    // internal memory pool is for draw image and depth image only, in
    // 1080p, they are just about 8.3MB respectively. So a 32MB pool
    // should be more than enough. But in the case of macbook retina
    // screen, 2560x1600, each would need 15.9MB. If there is even a
    // 4k screen, the number only goes up, but max below 64MB, which
    // is fine.
    internal_preallocated_memory:  Allocation;
    internal_memory_pool:          Memory_Pool;
    RENDERER_MEMORY_SIZE :: 64 * 1024 * 1024; // 64MB

    swapchain:       Swapchain;
    frames:          [] Frame_Data;
    frame_index:     u32;
    image_index:     u32;

    draw_texture:      Texture;
    depth_texture:     Texture;
    draw_extent:       VkExtent2D;

    // There are two bindless approach in descriptor set, Descriptor
    // indexing and descriptor buffer.
    //
    // Descriptor indexing is widely supported and is the standard in
    // the industry, while descriptor buffer is not.
    //
    // Descriptor Pool completely ditched with VK_EXT_descriptor_buffer.
    // https://github.com/KhronosGroup/Vulkan-Samples/tree/main/samples/extensions/descriptor_buffer_basic
    //
    // However, in my use case, which need to run well on both mac and
    // linux, we use descriptor indexing, it still need a descriptor
    // pool, but the same descriptor set can be reuse over and over
    // again. Complicated logic is no longer needed.

    // This is for dynamic rendering
    current_swapchain_command_buffer: VkCommandBuffer;
    clear_color: [4]float;

    resize_requested := false;

    next_pipeline_id: Pipeline.ID = 1;
    pipelines: Table(Pipeline.ID, Pipeline);

    Queue_Family_Indices :: struct {
        graphics: u32;
        present:  u32;
    }

    Swapchain :: struct {
        vk: VkSwapchainKHR;
        images: [] VkImage;
        image_views: [] VkImageView;
        format: VkFormat;
        extent: VkExtent2D;
    }

    Frame_Data :: struct {
        command_pool: VkCommandPool;
        swapchain_semaphore: VkSemaphore;
        render_semaphore: VkSemaphore;
        render_fence: VkFence;
    }

    Image :: struct {
        vk:         VkImage;
        allocation: Allocation;
    }

    Texture :: struct {
        image: Image;
        image_view: VkImageView;
        format: VkFormat;
    }

    Buffer :: struct {
        vk:         VkBuffer;
        allocation: Allocation;
        address:    VkDeviceAddress;
    }

    Pipeline :: struct {
        ID :: #type,distinct u64;
        vk:     VkPipeline;
        layout: VkPipelineLayout;
    }

    Memory_Indices :: struct {
        staging:  u32 = U32_MAX;
        gpu_only: u32 = U32_MAX;
        rebar:    u32 = U32_MAX;
        // rebar is an Nvidia name, other vendors may call it
        // differently, but it means GPU memory that is accessible by
        // CPU via PCIE magic.

        STAGING_FLAG :VkMemoryPropertyFlags : .HOST_VISIBLE | .HOST_COHERENT;
        GPU_ONLY_FLAG :VkMemoryPropertyFlags : .DEVICE_LOCAL;
        REBAR_FLAG :VkMemoryPropertyFlags : .DEVICE_LOCAL | .HOST_VISIBLE | .HOST_COHERENT;
    }

    Memory_Pool :: struct {
        allocation:  Allocation;
        current_pos: u64;
        bytes_left:  u64;
    }

    Allocation :: struct {
        memory_type: u32;
        memory:      VkDeviceMemory;
        size:        u64;
        offset:      u64;
        mapped_pointer: *void;
    }
}

init :: (using renderer: *Renderer, window: *SDL_Window) -> ok:bool {
    get_instance_proc_addr := SDL_Vulkan_GetVkGetInstanceProcAddr();
    vk_load_global_functions(xx SDL_Vulkan_GetVkGetInstanceProcAddr());
    instance_extensions := get_vk_instance_extensions();
    ok:, instance = make_instance(instance_extensions, vka);
    if !ok return false;

    vk_load_instance_functions(instance);

    ok = SDL_Vulkan_CreateSurface(window, instance, vka, xx *surface);
    if !ok {
        log_error("Cannot create vulkan surface");
        return false;
    }

    window_width: s32;
    window_height: s32;
    ok = SDL_GetWindowSize(window, *window_width, *window_height);
    if !ok {
        log_error("Cannot get window size");
        return false;
    }

    all_device_extensions: [..] *u8;
    all_device_extensions.allocator = temp;
    array_add(*all_device_extensions, ..ENABLED_DEVICE_EXTENSION_NAMES);
    array_add(*all_device_extensions, VK_KHR_SWAPCHAIN_EXTENSION_NAME);
    #if OS == .MACOS {
        array_add(*all_device_extensions, VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME);
    }

    physical_device, queue_indices = choose_physical_device(instance, surface, all_device_extensions);
    if !physical_device {
        log_error("Vulkan failed to find physical device");
        if surface vkDestroySurfaceKHR(instance, surface, vka);
        vkDestroyInstance(instance, vka);
        return false;
    }

    result: VkResult;
    result, device = make_device(renderer, all_device_extensions);
    if result {
        if surface vkDestroySurfaceKHR(instance, surface, vka);
        vkDestroyInstance(instance, vka);
        return false;
    }

    vk_load_device_functions(device);

    defer {
        if result deinit(renderer);
    }

    vkGetDeviceQueue(device, queue_indices.graphics, 0, *graphics_queue);
    vkGetDeviceQueue(device, queue_indices.present, 0, *present_queue);

    result, command_pool = make_command_pools(renderer);
    if result return false;

    memory_indices = get_memory_indices(renderer);

    result, internal_preallocated_memory = gpu_allocate(renderer, Renderer.RENDERER_MEMORY_SIZE, memory_indices.gpu_only);
    if result return false;
    internal_memory_pool = make_memory_pool(internal_preallocated_memory);

    result, swapchain = make_swapchain(renderer, .{xx window_width, xx window_height});
    if result return false;

    result, frames = make_frames(renderer);
    if result return false;

    result = make_draw_images(renderer, .{xx window_width, xx window_height});
    if result return false;

    reset_temporary_storage();
    return true;
}

// In some case, you may not need the swapchain, e.g. when you only
// uses compute shader to do some calculations. Is it bad to still
// call this thing a ...renderer?
init_without_swapchain :: (using renderer: *Renderer) -> bool {
    if SDL_Vulkan_GetVkGetInstanceProcAddr() == null {
        log("%", to_string(SDL_GetError()));
        return false;
    }
    vk_load_global_functions(xx SDL_Vulkan_GetVkGetInstanceProcAddr());
    instance_extensions := get_vk_instance_extensions();
    ok:, instance = make_instance(instance_extensions, vka);
    if !ok return false;

    vk_load_instance_functions(instance);

    result: VkResult;
    result = vkCreateDebugUtilsMessengerEXT(instance, *debug_utils_messenger_create_info, vka, *debug_messenger);
    if result {
        log_error("Cannot create debug messenger");
        vkDestroyInstance(instance, vka);
        return false;
    }

    all_device_extensions: [..] *u8;
    all_device_extensions.allocator = temp;
    array_add(*all_device_extensions, ..ENABLED_DEVICE_EXTENSION_NAMES);
    #if OS == .MACOS {
        array_add(*all_device_extensions, VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME);
    }

    physical_device, queue_indices = choose_physical_device(instance, null, all_device_extensions);
    if !physical_device {
        log_error("Vulkan failed to find physical device");
        vkDestroyInstance(instance, vka);
        return false;
    }

    result, device = make_device(renderer, all_device_extensions);
    if result {
        vkDestroyInstance(instance, vka);
        return false;
    }

    vk_load_device_functions(device);

    defer {
        if result deinit(renderer);
    }

    vkGetDeviceQueue(device, queue_indices.graphics, 0, *graphics_queue);
    vkGetDeviceQueue(device, queue_indices.present, 0, *present_queue);

    result, command_pool = make_command_pools(renderer);
    if result return false;

    memory_indices = get_memory_indices(renderer);

    reset_temporary_storage();
    return true;
}

// If the renderer is created with init_without_swapchain, you can
// still use the same deinit as the vulkan objects are null-checked
// before calling destruction.
deinit :: (using renderer: *Renderer) {
    if device vkDeviceWaitIdle(device);

    for pipelines {
        destroy_pipeline(renderer, it);
    }
    table_reset(*pipelines);

    destroy_draw_images(renderer);
    destroy_frames(renderer);
    destroy_swapchain(renderer, *swapchain);
    if surface {
        vkDestroySurfaceKHR(instance, surface, vka);
    }
    destroy_command_pools(renderer);
    gpu_free(renderer, internal_preallocated_memory);
    vkDestroyDevice(device, vka);
    if debug_messenger {
        vkDestroyDebugUtilsMessengerEXT(instance, debug_messenger, vka);
    }
    vkDestroyInstance(instance, vka);
}

// This is deprecated in Vulkan 1.4, but it is not yet supported by moltenvk
make_shader_module :: (using renderer: *Renderer, file_path: string) -> ok:bool, VkShaderModule {
    shader_code := read_entire_file(file_path);
    defer free(shader_code);

    create_info := VkShaderModuleCreateInfo.{
        codeSize = xx shader_code.count,
        pCode = cast(*u32) shader_code.data
    };

    module: VkShaderModule;
    result := check_vk(vkCreateShaderModule(device, *create_info, vka, *module));
    return result == .SUCCESS, module;
}

make_shader_module_create_info :: (file_path: string) -> VkShaderModuleCreateInfo, string {
    shader_code := read_entire_file(file_path);

    create_info := VkShaderModuleCreateInfo.{
        codeSize = xx shader_code.count,
        pCode = cast(*u32) shader_code.data
    };
    return create_info, shader_code;
}

destroy_shader_module :: (using renderer: *Renderer, module: VkShaderModule) {
    vkDestroyShaderModule(device, module, vka);
}

begin_draw :: (using renderer: *Renderer) -> bool {
    frame := *frames[frame_index];

    result: VkResult;
    if check_vk(vkWaitForFences(device, 1, *frame.render_fence, VK_TRUE, U64_MAX)) return false;
    if check_vk(vkResetFences(device, 1, *frame.render_fence)) return false;

    if check_vk(vkResetCommandPool(device, frame.command_pool, 0)) return false;

    command_buffer_alloc_info := VkCommandBufferAllocateInfo.{
        commandPool = frame.command_pool,
        commandBufferCount = 1
    };

    result = check_vk(vkAllocateCommandBuffers(device, *command_buffer_alloc_info, *current_swapchain_command_buffer));
    if result return false;

    ok := acquire_next_image_index(renderer);
    if !ok return false;

    command_buffer_begin_info := VkCommandBufferBeginInfo.{
        flags = .ONE_TIME_SUBMIT,
    };

    if check_vk(vkBeginCommandBuffer(current_swapchain_command_buffer, *command_buffer_begin_info)) return false;

    image_memory_barriers : [2]VkImageMemoryBarrier2;
    image_memory_barriers[0] = .{
        srcStageMask     = .ALL_COMMANDS,
        srcAccessMask    = .MEMORY_WRITE,
        dstStageMask     = .ALL_COMMANDS,
        dstAccessMask    = .MEMORY_WRITE | .MEMORY_READ,
        oldLayout        = .UNDEFINED,
        newLayout        = .GENERAL,
        image            = draw_texture.image.vk,
        subresourceRange = .{
            aspectMask   = .COLOR,
            baseMipLevel   = 0,
            levelCount     = VK_REMAINING_MIP_LEVELS,
            baseArrayLayer = 0,
            layerCount     = VK_REMAINING_ARRAY_LAYERS
        }
    };

    image_memory_barriers[1] = .{
        srcStageMask     = .ALL_COMMANDS,
        srcAccessMask    = .MEMORY_WRITE,
        dstStageMask     = .ALL_COMMANDS,
        dstAccessMask    = .MEMORY_WRITE | .MEMORY_READ,
        oldLayout        = .UNDEFINED,
        newLayout        = .ATTACHMENT_OPTIMAL,
        image            = depth_texture.image.vk,
        subresourceRange = .{
            aspectMask   = .DEPTH | .STENCIL,
            baseMipLevel   = 0,
            levelCount     = VK_REMAINING_MIP_LEVELS,
            baseArrayLayer = 0,
            layerCount     = VK_REMAINING_ARRAY_LAYERS
        }
    };
    // Image Layout is no longer relevant in modern hardware, with
    // device extension of VK_KHR_unified_image_layouts.
    // https://www.khronos.org/blog/so-long-image-layouts-simplifying-vulkan-synchronisation
    // Sadly, this is not supported in MoltenVK yet. So we still do it
    // in old way.

    dependency_info := VkDependencyInfo.{
        imageMemoryBarrierCount = xx image_memory_barriers.count,
        pImageMemoryBarriers    = image_memory_barriers.data
    };
    vkCmdPipelineBarrier2(current_swapchain_command_buffer, *dependency_info);

    color_attachment := VkRenderingAttachmentInfo.{
        imageView   = draw_texture.image_view,
        imageLayout = .GENERAL,
        loadOp      = .CLEAR,
        storeOp     = .STORE,
        clearValue  = .{ color.float32_ = clear_color }
    };

    depth_attachment := VkRenderingAttachmentInfo.{
        imageView   = depth_texture.image_view,
        imageLayout = .ATTACHMENT_OPTIMAL,
        loadOp      = .CLEAR,
        storeOp     = .STORE,
        clearValue  = .{
            depthStencil = .{depth = 1}
        }
    };

    rendering_info := VkRenderingInfo.{
        renderArea = .{offset = .{0, 0}, extent = swapchain.extent},
        layerCount = 1,
        colorAttachmentCount = 1,
        pColorAttachments = *color_attachment,
        pDepthAttachment = *depth_attachment,
        pStencilAttachment = null,
    };

    vkCmdBeginRendering(current_swapchain_command_buffer, *rendering_info);

    viewport := VkViewport.{
        x = 0,
        y = 0,
        width = xx swapchain.extent.width,
        height = xx swapchain.extent.height,
        minDepth = 0,
        maxDepth = 1,
    };

    vkCmdSetViewport(current_swapchain_command_buffer, 0, 1, *viewport);

    scissor := VkRect2D.{
        offset = .{0, 0},
        extent = swapchain.extent,
    };
    vkCmdSetScissor(current_swapchain_command_buffer, 0, 1, *scissor);

    return true;
}

end_draw :: (using renderer: *Renderer) {
    defer current_swapchain_command_buffer = null;
    frame := frames[frame_index];
    vkCmdEndRendering(current_swapchain_command_buffer);

    current_image := swapchain.images[image_index];

    image_memory_barriers : [2]VkImageMemoryBarrier2;
    image_memory_barriers[0] = .{
        srcStageMask     = .ALL_COMMANDS,
        srcAccessMask    = .MEMORY_WRITE,
        dstStageMask     = .ALL_COMMANDS,
        dstAccessMask    = .MEMORY_WRITE | .MEMORY_READ,
        oldLayout        = .GENERAL,
        newLayout        = .TRANSFER_SRC_OPTIMAL,
        image            = draw_texture.image.vk,
        subresourceRange = .{
            aspectMask   = .COLOR,
            baseMipLevel   = 0,
            levelCount     = VK_REMAINING_MIP_LEVELS,
            baseArrayLayer = 0,
            layerCount     = VK_REMAINING_ARRAY_LAYERS
        }
    };
    image_memory_barriers[1] = .{
        srcStageMask     = .ALL_COMMANDS,
        srcAccessMask    = .MEMORY_WRITE,
        dstStageMask     = .ALL_COMMANDS,
        dstAccessMask    = .MEMORY_WRITE | .MEMORY_READ,
        oldLayout        = .UNDEFINED,
        newLayout        = .TRANSFER_DST_OPTIMAL,
        image            = current_image,
        subresourceRange = .{
            aspectMask   = .COLOR,
            baseMipLevel   = 0,
            levelCount     = VK_REMAINING_MIP_LEVELS,
            baseArrayLayer = 0,
            layerCount     = VK_REMAINING_ARRAY_LAYERS
        }
    };

    dependency_info := VkDependencyInfo.{
        imageMemoryBarrierCount = xx image_memory_barriers.count,
        pImageMemoryBarriers    = image_memory_barriers.data
    };
    vkCmdPipelineBarrier2(current_swapchain_command_buffer, *dependency_info);

    blit_region := VkImageBlit2.{
        srcSubresource = .{
            aspectMask = .COLOR,
            layerCount = 1
        },
        dstSubresource = .{
            aspectMask = .COLOR,
            layerCount = 1
        },
    };
    blit_region.srcOffsets[1] = .{
        x = xx draw_extent.width,
        y = xx draw_extent.height,
        z = 1
    };
    blit_region.dstOffsets[1] = .{
        x = xx swapchain.extent.width,
        y = xx swapchain.extent.height,
        z = 1
    };
    blit_info := VkBlitImageInfo2.{
        srcImage       = draw_texture.image.vk,
        srcImageLayout = .TRANSFER_SRC_OPTIMAL,
        dstImage       = current_image,
        dstImageLayout = .TRANSFER_DST_OPTIMAL,
        regionCount    = 1,
        pRegions       = *blit_region,
        filter         = .LINEAR
    };
    vkCmdBlitImage2(current_swapchain_command_buffer, *blit_info);

    present_image_barrier := VkImageMemoryBarrier2.{
        srcStageMask     = .ALL_COMMANDS,
        srcAccessMask    = .MEMORY_WRITE,
        dstStageMask     = .ALL_COMMANDS,
        dstAccessMask    = .MEMORY_WRITE | .MEMORY_READ,
        oldLayout        = .TRANSFER_DST_OPTIMAL,
        newLayout        = .PRESENT_SRC_KHR,
        image            = current_image,
        subresourceRange = .{
            aspectMask   = .COLOR,
            baseMipLevel   = 0,
            levelCount     = VK_REMAINING_MIP_LEVELS,
            baseArrayLayer = 0,
            layerCount     = VK_REMAINING_ARRAY_LAYERS
        }
    };
    present_barrier_info := VkDependencyInfo.{
        imageMemoryBarrierCount = 1,
        pImageMemoryBarriers    = *present_image_barrier
    };
    vkCmdPipelineBarrier2(current_swapchain_command_buffer, *present_barrier_info);

    if check_vk(vkEndCommandBuffer(current_swapchain_command_buffer)) return;

    command_buffer_submit_info := VkCommandBufferSubmitInfo.{
        commandBuffer = current_swapchain_command_buffer,
    };
    wait_info := VkSemaphoreSubmitInfo.{
        semaphore = frame.swapchain_semaphore,
        value = 1,
        stageMask = .COLOR_ATTACHMENT_OUTPUT,
    };

    signal_info := VkSemaphoreSubmitInfo.{
        semaphore = frame.render_semaphore,
        value = 1,
        stageMask = .ALL_GRAPHICS,
    };

    submit := VkSubmitInfo2.{
        waitSemaphoreInfoCount = 1,
        pWaitSemaphoreInfos = *wait_info,
        commandBufferInfoCount = 1,
        pCommandBufferInfos = *command_buffer_submit_info,
        signalSemaphoreInfoCount = 1,
        pSignalSemaphoreInfos = *signal_info,
    };

    if check_vk(vkQueueSubmit2(graphics_queue, 1, *submit, frame.render_fence)) return;

    // TODO: Should I separate present from end_draw?
    present_info := VkPresentInfoKHR.{
        waitSemaphoreCount = 1,
        pWaitSemaphores = *frame.render_semaphore,
        swapchainCount = 1,
        pSwapchains = *swapchain.vk,
        pImageIndices = *image_index,
    };

    result := vkQueuePresentKHR(graphics_queue, *present_info);
    if result == {
    case .ERROR_OUT_OF_DATE_KHR;
        ;
    case .SUBOPTIMAL_KHR;
        ;
    case .SUCCESS;
        ;
    case;
        log_error("present failed");
        return;
    }

    frame_index = (frame_index + 1) % xx swapchain.images.count;
}

set_clear_color :: (using renderer: *Renderer, color: [4]float) {
    clear_color = color;
}

// All buffer are mapped and randomly accessed by default.
// In modern GPU, most of the GPU memory are accessible by the CPU.
// In M-series macOS, all of the memory are accessible by CPU.
make_buffer :: (renderer: *Renderer, memory_pool: *Renderer.Memory_Pool, size: VkDeviceSize, buffer_usage: VkBufferUsageFlags) -> VkResult, Renderer.Buffer {
    buffer_create_info := VkBufferCreateInfo.{
        size        = size,
        usage       = buffer_usage | .SHADER_DEVICE_ADDRESS,
        sharingMode = .EXCLUSIVE
    };

    buffer: Renderer.Buffer;
    result: VkResult;
    result = check_vk(vkCreateBuffer(renderer.device, *buffer_create_info, renderer.vka, *buffer.vk));
    if result return result, .{};

    memory_requirements: VkMemoryRequirements;
    vkGetBufferMemoryRequirements(renderer.device, buffer.vk, *memory_requirements);

    buffer.allocation = get(memory_pool, memory_requirements.size, memory_requirements.alignment);
    result = check_vk(vkBindBufferMemory(renderer.device, buffer.vk, buffer.allocation.memory, buffer.allocation.offset));
    if result return result, .{};

    address_info := VkBufferDeviceAddressInfo.{
        buffer = buffer.vk
    };
    buffer.address = vkGetBufferDeviceAddress(renderer.device, *address_info);

    return .SUCCESS, buffer;
}

destroy_buffer :: (renderer: *Renderer, buffer: Renderer.Buffer) {
    vkDestroyBuffer(renderer.device, buffer.vk, renderer.vka);
}

begin_single_time_commands :: (using renderer: *Renderer) -> VkResult, VkCommandBuffer {
    cmd_alloc_info := VkCommandBufferAllocateInfo.{
        commandPool = command_pool,
        commandBufferCount = 1,
        level = .PRIMARY,
    };
    command: VkCommandBuffer;
    result: VkResult;
    result = check_vk(vkAllocateCommandBuffers(device, *cmd_alloc_info, *command));
    if result return result, null;

    cmd_begin_info := VkCommandBufferBeginInfo.{
        flags = .ONE_TIME_SUBMIT,
    };
    result = check_vk(vkBeginCommandBuffer(command, *cmd_begin_info));
    if result return result, null;

    return .SUCCESS, command;
}

end_single_time_commands :: (using renderer: *Renderer, command: VkCommandBuffer) -> VkResult {
    result: VkResult;
    result = check_vk(vkEndCommandBuffer(command));
    if result return result;

    cmdinfo := VkCommandBufferSubmitInfo.{
        commandBuffer = command,
    };
    submit := VkSubmitInfo2.{
        commandBufferInfoCount = 1,
        pCommandBufferInfos = *cmdinfo,
    };
    result = check_vk(vkQueueSubmit2(graphics_queue, 1, *submit, null));
    if result return result;
    result = vkQueueWaitIdle(graphics_queue);
    if result return result;
    vkFreeCommandBuffers(device, command_pool, 1, *command);
    return .SUCCESS;
}

destroy_texture :: (using renderer: *Renderer, texture: Renderer.Texture) {
    if texture.image_view {
        vkDestroyImageView(device, texture.image_view, vka);
    }
    if texture.image.vk {
        vkDestroyImage(device, texture.image.vk, vka);
    }
}

destroy_pipeline :: (using renderer: *Renderer, pipeline: Renderer.Pipeline) {
    if pipeline.layout {
        vkDestroyPipelineLayout(device, pipeline.layout, vka);
    }

    if pipeline.vk {
        vkDestroyPipeline(device, pipeline.vk, vka);
    }
}

make_image :: (renderer: *Renderer, memory_pool: *Renderer.Memory_Pool, image_create_info: *VkImageCreateInfo) -> VkResult, Renderer.Image {
    image: Renderer.Image;
    result: VkResult;

    result = check_vk(vkCreateImage(renderer.device, image_create_info, renderer.vka, *image.vk));
    if result return result, .{};

    memory_requirements: VkMemoryRequirements;
    vkGetImageMemoryRequirements(renderer.device, image.vk, *memory_requirements);

    image.allocation = get(memory_pool, memory_requirements.size, memory_requirements.alignment);

    result = check_vk(vkBindImageMemory(renderer.device, image.vk, image.allocation.memory, image.allocation.offset));
    if result {
        vkDestroyImage(renderer.device, image.vk, renderer.vka);
        return result, .{};
    }

    return .SUCCESS, image;
}

make_image :: (
    renderer: *Renderer,
    memory_pool: *Renderer.Memory_Pool,
    extent: VkExtent2D,
    format: VkFormat,
    image_usage: VkImageUsageFlags,
    tiling: VkImageTiling = .OPTIMAL,
    image_type: VkImageType = .e2D,
    layer_count: u32 = 1,
    sample_count: VkSampleCountFlagBits = .e1,
    mip_levels: u32 = 1
) -> VkResult, Renderer.Image {
    image_create_info := VkImageCreateInfo.{
        imageType = image_type,
        format = format,
        extent = .{
            width = extent.width,
            height = extent.height,
            depth = 1
        },
        mipLevels = mip_levels,
        arrayLayers = layer_count,
        samples = sample_count,
        tiling = tiling,
        usage = image_usage,
        sharingMode = .EXCLUSIVE,
        initialLayout = .UNDEFINED
    };

    result, image := make_image(renderer, memory_pool, *image_create_info);
    return result, image;
}

// Is this function necessary? It is just for the api consistency.
make_image_view :: (using renderer: *Renderer, image_view_create_info: *VkImageViewCreateInfo) -> VkResult, VkImageView {
    view: VkImageView;
    result := check_vk(vkCreateImageView(device, image_view_create_info, vka, *view));
    return result, view;
}

make_image_view :: (renderer: *Renderer, image: VkImage, format: VkFormat, aspect_flag: VkImageAspectFlags, layer_count: u32 = 1, mip_levels: u32 = 1) -> VkResult, VkImageView {
    image_view_create_info := VkImageViewCreateInfo.{
        image = image,
        viewType = ifx layer_count > 1 then .e2D_ARRAY else .e2D,
        format = format,
        subresourceRange = .{
            aspectMask = aspect_flag,
            baseMipLevel = 0,
            levelCount = mip_levels,
            baseArrayLayer = 0,
            layerCount = layer_count,
        },
    };

    result, view := make_image_view(renderer, *image_view_create_info);
    return result, view;
}

// This version of make texture uses host image copy
// make_texture :: (renderer: *Renderer, memory_pool: *Renderer.Memory_Pool, data: *void, extent: VkExtent2D, format: VkFormat = .R8G8B8A8_UNORM) -> VkResult, Renderer.Texture {
//     texture: Renderer.Texture;
//     texture.format = format;
//     result: VkResult;
//     result, texture.image = make_image(renderer, memory_pool, extent, texture.format, .SAMPLED | .HOST_TRANSFER);
//     if result return result, .{};

//     result, texture.image_view = make_image_view(renderer, texture.image.vk, texture.format, .COLOR);
//     if result {
//         vkDestroyImage(renderer.device, texture.image.vk, renderer.vka);
//         return result, .{};
//     }

//     host_image_layout_transition_info := VkHostImageLayoutTransitionInfo.{
//         image = texture.image.vk,
//         oldLayout = .UNDEFINED,
//         newLayout = .SHADER_READ_ONLY_OPTIMAL,
//         subresourceRange = .{
//             aspectMask     = .COLOR,
//             baseMipLevel   = 0,
//             levelCount     = 1,
//             baseArrayLayer = 0,
//             layerCount     = 1
//         }
//     };

//     result = check_vk(vkTransitionImageLayout(renderer.device, 1, *host_image_layout_transition_info));
//     if result {
//         destroy_texture(renderer, texture);
//         return result, .{};
//     }

//     memory_to_image_copy := VkMemoryToImageCopy.{
//         imageSubresource = .{
//             aspectMask     = .COLOR,
//             mipLevel       = 0,
//             baseArrayLayer = 0,
//             layerCount     = 1
//         },
//         imageExtent = .{
//             width  = extent.width,
//             height = extent.height,
//             depth  = 1
//         },
//         pHostPointer = data
//     };

//     copy_memory_to_image_info := VkCopyMemoryToImageInfo.{
//         dstImage       = texture.image.vk,
//         dstImageLayout = .SHADER_READ_ONLY_OPTIMAL,
//         regionCount    = 1,
//         pRegions       = *memory_to_image_copy
//     };

//     result = check_vk(vkCopyMemoryToImage(renderer.device, *copy_memory_to_image_info));
//     if result {
//         destroy_texture(renderer, texture);
//         return result, .{};
//     }

//     return .SUCCESS, texture;
// }

// // This function relies on SDL_image
// make_texture_from_file :: (renderer: *Renderer, memory_pool: *Renderer.Memory_Pool, file_path: string, format: VkFormat = .R8G8B8A8_UNORM) -> VkResult, Renderer.Texture {
//     original_surface := IMG_Load(to_c_string(file_path));
//     assert(original_surface != null);
//     defer SDL_DestroySurface(original_surface);

//     converted_surface := SDL_ConvertSurface(original_surface, .RGBA32);
//     assert(converted_surface != null);
//     defer SDL_DestroySurface(converted_surface);

//     result, texture := make_texture(renderer, memory_pool, converted_surface.pixels, .{xx converted_surface.w, xx converted_surface.h}, format);
//     return result, texture;
// }

resize_callback :: (using renderer: *Renderer, extent: VkExtent2D) {
    vkDeviceWaitIdle(device);
    destroy_draw_images(renderer);
    reset(*renderer.internal_memory_pool);
    make_draw_images(renderer, extent);
    remake_swapchain(renderer, extent);
    resize_requested = false;
}

make_pipeline :: (renderer: *Renderer, builder: *Pipeline_Builder, pipeline_layout: VkPipelineLayout) -> VkResult, Renderer.Pipeline.ID {
    pipeline: Renderer.Pipeline;
    pipeline.layout = pipeline_layout;
    set_layout(builder, pipeline_layout);
    result: VkResult;
    result, pipeline.vk = builder_to_pipeline(builder, renderer);
    if result return result, 0;

    table_add(*renderer.pipelines, renderer.next_pipeline_id, pipeline);

    defer renderer.next_pipeline_id += 1;

    return .SUCCESS, renderer.next_pipeline_id;
}

gpu_allocate :: (renderer: *Renderer, size: u64, memory_type: u32) -> VkResult, Renderer.Allocation {
    allocation: Renderer.Allocation;

    // Not all memory should be device address compatible, e.g. the
    // draw texture and depth texture, but it doesn't matter that
    // much.
    memory_allocate_flags_info := VkMemoryAllocateFlagsInfo.{
        flags = .DEVICE_ADDRESS
    };

    memory_allocate_info := VkMemoryAllocateInfo.{
        pNext = *memory_allocate_flags_info,
        allocationSize = size,
        memoryTypeIndex = memory_type
    };

    allocation.memory_type = memory_type;
    allocation.size        = size;
    allocation.offset      = 0;
    result := check_vk(vkAllocateMemory(renderer.device, *memory_allocate_info, renderer.vka, *allocation.memory));
    if result return result, .{};

    return .SUCCESS, allocation;
}

gpu_allocate_mapped :: (renderer: *Renderer, size: u64, memory_type: u32) -> VkResult, Renderer.Allocation {
    result, allocation := gpu_allocate(renderer, size, memory_type);
    if result return result, .{};

    memory_map_info := VkMemoryMapInfo.{
        memory = allocation.memory,
        offset = 0,
        size   = allocation.size
    };

    result = check_vk(vkMapMemory2(renderer.device, *memory_map_info, *allocation.mapped_pointer));
    if result return result, .{};

    return .SUCCESS, allocation;
}

gpu_free :: (renderer: *Renderer, allocation: Renderer.Allocation) {
    if allocation.memory {
        vkFreeMemory(renderer.device, allocation.memory, renderer.vka);
    }
}

get :: (pool: *Renderer.Memory_Pool, size: u64, alignment: u64 = 8) -> Renderer.Allocation {
    mask := alignment - 1;
    padding := (alignment - (pool.current_pos & mask)) & mask;
    assert(pool.bytes_left >= (size + padding), "Renderer Memory Pool out of memory");

    allocation := pool.allocation;
    allocation.size = size;
    allocation.offset += pool.current_pos + padding;
    allocation.mapped_pointer += pool.current_pos + padding;

    pool.current_pos += size + padding;
    pool.bytes_left -= size + padding;

    return allocation;
}

reset :: (pool: *Renderer.Memory_Pool) {
    pool.bytes_left = pool.allocation.size;
    pool.current_pos = 0;
}

make_memory_pool :: (allocation: Renderer.Allocation) -> Renderer.Memory_Pool {
    pool := Renderer.Memory_Pool.{
        allocation = allocation,
        bytes_left = allocation.size
    };

    return pool;
}

#scope_file
// Initialization helpers
application_info :: VkApplicationInfo.{
    pApplicationName   = "Shapeless",
    applicationVersion = #run VK_MAKE_API_VERSION(0, 1, 0, 0),
    pEngineName        = "Shapeless Engine",
    engineVersion      = #run VK_MAKE_API_VERSION(0, 1, 0, 0),
    apiVersion         = VK_API_VERSION_1_3
};

validation_layers :: (*u8).["VK_LAYER_KHRONOS_validation", "VK_LAYER_KHRONOS_shader_object"];

make_instance_create_info :: (instance_extensions: [] *u8) -> VkInstanceCreateInfo {
    return .{
        flags = ifx OS == .MACOS then VkInstanceCreateFlags.ENUMERATE_PORTABILITY_KHR else 0,
        pApplicationInfo = *application_info,
        enabledLayerCount = xx ifx VALIDATION then 2 else 0,
        ppEnabledLayerNames = ifx VALIDATION then validation_layers.data else null,
        enabledExtensionCount = xx instance_extensions.count,
        ppEnabledExtensionNames = instance_extensions.data
    };
}

make_instance :: (instance_extensions: [] *u8, vka: *VkAllocationCallbacks) -> ok:bool, VkInstance {
    info := make_instance_create_info(instance_extensions);
    info.pNext = *debug_utils_messenger_create_info;
    instance: VkInstance;
    result := check_vk(vkCreateInstance(*info, vka, *instance));
    return result == .SUCCESS, instance;
}

choose_physical_device :: (instance: VkInstance, surface: VkSurfaceKHR, device_extensions: [] *u8) -> VkPhysicalDevice, Renderer.Queue_Family_Indices {
    result, devices := vkEnumeratePhysicalDevices(instance,, temp);
    if check_vk(result, vkEnumeratePhysicalDevices) return null, .{};

    best_score := 0;
    best_device: VkPhysicalDevice;
    best_device_queue_families: Renderer.Queue_Family_Indices;
    for device: devices {
        // Make sure the device has necessary queue families and supports required extensions
        found, queue_families := find_queue_families(device, surface);
        if !found || !device_supports_extensions(device, device_extensions)
            then continue;

        // If surface is present, make sure it has swapchain support
        if surface {
            swapchain_support := get_swapchain_support(device, surface);
            if swapchain_support.formats.count == 0
                || swapchain_support.present_modes.count == 0
                then continue;
        }

        score := 0;

        features: VkPhysicalDeviceFeatures;
        vkGetPhysicalDeviceFeatures(device, *features);
        if features.samplerAnisotropy {
            score += 5;
        }

        properties: VkPhysicalDeviceProperties;
        vkGetPhysicalDeviceProperties(device, *properties);

        if properties.deviceType == {
        case .DISCRETE_GPU;
            score += 100;
        case .INTEGRATED_GPU;
            score += 10;
        }

        if score > best_score {
            best_score = score;
            best_device = device;
            best_device_queue_families = queue_families;
        }
    }

    return best_device, best_device_queue_families;
}

find_queue_families :: (physical_device: VkPhysicalDevice, surface: VkSurfaceKHR) -> ok:bool, Renderer.Queue_Family_Indices {
    graphics := U32_MAX;
    present  := U32_MAX;

    queue_families := vkGetPhysicalDeviceQueueFamilyProperties(physical_device,, temp);

    for queue_families {
        if it.queueFlags & .GRAPHICS {
            graphics = xx it_index;
        }

        if surface {
            supports_present: VkBool32;
            if check_vk(vkGetPhysicalDeviceSurfaceSupportKHR(physical_device, xx it_index, surface, *supports_present)) return false, .{};
            if supports_present {
                present = xx it_index;
            }
        } else {
            present = xx it_index;
        }

        if graphics != U32_MAX && present != U32_MAX {
            return true, .{graphics = graphics, present = present};
        }
    }

    return false, .{};
}

device_supports_extensions :: (physical_device: VkPhysicalDevice, extensions: [] *u8) -> bool {
    result, available_extensions := vkEnumerateDeviceExtensionProperties(physical_device, null,, temp);
    if check_vk(result, vkEnumerateDeviceExtensionProperties) return false;

    for extension: extensions {
        supported := false;

        extension_string := to_string(extension);

        for available: available_extensions {
            if extension_string == to_string(available.extensionName.data) {
                supported = true;
                break;
            }
        }

        if !supported {
            log("device does not support %", to_string(extension));
            return false;
        };
    }

    return true;
}

Swapchain_Support :: struct {
    capabilities: VkSurfaceCapabilitiesKHR;
    formats: [] VkSurfaceFormatKHR;
    present_modes: [] VkPresentModeKHR;
}

get_swapchain_support :: (physical_device: VkPhysicalDevice, surface: VkSurfaceKHR) -> Swapchain_Support {
    capabilities: VkSurfaceCapabilitiesKHR;
    if check_vk(vkGetPhysicalDeviceSurfaceCapabilitiesKHR(physical_device, surface, *capabilities)) return .{};

    result, formats := vkGetPhysicalDeviceSurfaceFormatsKHR(physical_device, surface,, temp);
    if check_vk(result, vkGetPhysicalDeviceSurfaceFormatsKHR) return .{};

    result=, present_modes := vkGetPhysicalDeviceSurfacePresentModesKHR(physical_device, surface,, temp);
    if check_vk(result, vkGetPhysicalDeviceSurfacePresentModesKHR) return .{};

    return .{
        capabilities = capabilities,
        formats = formats,
        present_modes = present_modes
    };
}

get_vk_instance_extensions :: () -> [] *u8 {
    instance_extensions: [..]*u8;
    instance_extensions.allocator = temp;
    instance_extension_count: u32;
    instance_extension_data := SDL_Vulkan_GetInstanceExtensions(*instance_extension_count);

    for 0..instance_extension_count - 1 {
        array_add(*instance_extensions, instance_extension_data[it]);
    }
    array_add(*instance_extensions, VK_KHR_PORTABILITY_ENUMERATION_EXTENSION_NAME);
    array_add(*instance_extensions, VK_EXT_DEBUG_UTILS_EXTENSION_NAME);

    return instance_extensions;
}

make_device :: (renderer: *Renderer, device_extensions: [] *u8) -> VkResult, VkDevice {
    indices_array := u32.[renderer.queue_indices.graphics, renderer.queue_indices.present];

    queue_count := ifx renderer.queue_indices.graphics == renderer.queue_indices.present then 1 else 2;
    queue_create_infos := NewArray(queue_count, VkDeviceQueueCreateInfo, initialized = false,, temp);
    queue_priority : float32 = 1.0;

    for * queue_create_infos {
        it.* = .{
            queueFamilyIndex = indices_array[it_index],
            queueCount = 1,
            pQueuePriorities = *queue_priority
        };
    }

    // TODO: checking is a pain in the ass
    // // This is for deprecating shader module before 1.4
    // available_features_graphics_pipeline_library := VkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT.{};
    // available_features_host_image_copy := VkPhysicalDeviceHostImageCopyFeatures.{
    //     pNext = *available_features_graphics_pipeline_library
    // };
    // available_features13 := VkPhysicalDeviceVulkan13Features.{
    //     pNext = *available_features_host_image_copy
    // };
    // available_features12 := VkPhysicalDeviceVulkan12Features.{
    //     pNext = *available_features13
    // };
    // available_features11 := VkPhysicalDeviceVulkan11Features.{
    //     pNext = *available_features12
    // };
    // available_features := VkPhysicalDeviceFeatures2.{
    //     pNext = *available_features11
    // };
    // vkGetPhysicalDeviceFeatures2(renderer.physical_device, *available_features);

    features_shader_object := VkPhysicalDeviceShaderObjectFeaturesEXT.{
        shaderObject = VK_TRUE
    };
    features_graphics_pipeline_library := VkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT.{
        graphicsPipelineLibrary = VK_TRUE
    };
    features13 := VkPhysicalDeviceVulkan13Features.{
        pNext = *features_graphics_pipeline_library,
        dynamicRendering = VK_TRUE,
        synchronization2 = VK_TRUE
    };

    features12 := VkPhysicalDeviceVulkan12Features.{
        pNext = *features13,
        bufferDeviceAddress                           = VK_TRUE,
        descriptorIndexing                            = VK_TRUE,
        scalarBlockLayout                             = VK_TRUE,
        runtimeDescriptorArray                        = VK_TRUE,
        descriptorBindingVariableDescriptorCount      = VK_TRUE,
        descriptorBindingStorageBufferUpdateAfterBind = VK_TRUE,
        shaderInt8                                    = VK_TRUE
    };

    features11 := VkPhysicalDeviceVulkan11Features.{
        pNext = *features12,
        // This extension is necessary because how slang shader
        // compute SV_VertexID and SV_InstanceID
        shaderDrawParameters = VK_TRUE
    };

    device_features := VkPhysicalDeviceFeatures2.{
        pNext = *features11,
        features = .{
            samplerAnisotropy = VK_TRUE,
            fillModeNonSolid = VK_TRUE,
            shaderInt64      = VK_TRUE // For pointer math inside shader
        }
    };

    device_create_info := VkDeviceCreateInfo.{
        pNext = *device_features,
        queueCreateInfoCount = xx queue_create_infos.count,
        pQueueCreateInfos = queue_create_infos.data,
        enabledLayerCount = xx ifx VALIDATION then validation_layers.count else 0,
        ppEnabledLayerNames = ifx VALIDATION then validation_layers.data else null,
        enabledExtensionCount = xx device_extensions.count,
        ppEnabledExtensionNames = device_extensions.data,
        pEnabledFeatures = null
    };

    device: VkDevice;
    result := check_vk(vkCreateDevice(renderer.physical_device, *device_create_info, renderer.vka, *device));
    return result, device;
}

make_swapchain :: (renderer: *Renderer, extent: VkExtent2D, old_swapchain: VkSwapchainKHR = null) -> VkResult, Renderer.Swapchain {
    support := get_swapchain_support(renderer.physical_device, renderer.surface);

    format := support.formats[0];
    for support.formats {
        if it.format == SWAPCHAIN_SURFACE_FORMAT && it.colorSpace == SWAPCHAIN_COLOR_SPACE {
            format = it;
            break;
        }
    }

    present_mode := VkPresentModeKHR.FIFO;
    for support.present_modes {
        if it == .MAILBOX {
            present_mode = it;
            break;
        }
    }

    image_count := support.capabilities.minImageCount + 1;
    if support.capabilities.maxImageCount > 0 && image_count > support.capabilities.maxImageCount {
        image_count = support.capabilities.maxImageCount;
    }

    swapchain_extent := support.capabilities.currentExtent;
    if swapchain_extent.width == U32_MAX {
        swapchain_extent.width = clamp(extent.width, support.capabilities.minImageExtent.width, support.capabilities.maxImageExtent.width);
        swapchain_extent.height = clamp(extent.height, support.capabilities.minImageExtent.height, support.capabilities.maxImageExtent.height);
    }

    exclusive_queue := renderer.queue_indices.graphics == renderer.queue_indices.present;
    queue_indices_array := u32.[renderer.queue_indices.graphics, renderer.queue_indices.present];

    create_info := VkSwapchainCreateInfoKHR.{
        surface = renderer.surface,
        minImageCount = image_count,
        imageFormat = format.format,
        imageColorSpace = format.colorSpace,
        imageExtent = swapchain_extent,
        imageArrayLayers = 1,
        imageUsage = .TRANSFER_DST | .COLOR_ATTACHMENT,
        imageSharingMode = ifx exclusive_queue then .EXCLUSIVE else .CONCURRENT,
        queueFamilyIndexCount = xx ifx exclusive_queue then 0 else 2,
        pQueueFamilyIndices = ifx exclusive_queue then queue_indices_array.data else null,
        preTransform = support.capabilities.currentTransform,
        compositeAlpha = .OPAQUE,
        presentMode = present_mode,
        clipped = VK_TRUE,
        oldSwapchain = old_swapchain
    };

    swapchain := Renderer.Swapchain.{
        format = format.format,
        extent = extent
    };

    result := check_vk(vkCreateSwapchainKHR(renderer.device, *create_info, renderer.vka, *swapchain.vk));
    if result return result, .{};

    result, swapchain.images = vkGetSwapchainImagesKHR(renderer.device, swapchain.vk);
    if result return check_vk(result, vkGetSwapchainImagesKHR), swapchain;

    assert(swapchain.images.count > 0, "Swapchain should have images");

    swapchain.image_views = NewArray(image_count, VkImageView);
    for 0..swapchain.images.count - 1 {
        result=, view := make_image_view(renderer, swapchain.images[it], swapchain.format, .COLOR);
        if result return result, .{};
        swapchain.image_views[it] = view;
    }

    return .SUCCESS, swapchain;
}

destroy_swapchain :: (renderer: *Renderer, swapchain: *Renderer.Swapchain) {
    if swapchain.vk {
        array_free(swapchain.images);
        for view: swapchain.image_views {
            vkDestroyImageView(renderer.device, view, renderer.vka);
        }
        array_free(swapchain.image_views);
        vkDestroySwapchainKHR(renderer.device, swapchain.vk, renderer.vka);
        swapchain.vk = null;
    }
}

make_frames :: (renderer: *Renderer) -> VkResult, [] Renderer.Frame_Data {
    frames := NewArray(renderer.swapchain.images.count, Renderer.Frame_Data);
    cmd_pool_info := VkCommandPoolCreateInfo.{
        flags = .RESET_COMMAND_BUFFER,
        queueFamilyIndex = renderer.queue_indices.graphics
    };

    fence_info := VkFenceCreateInfo.{
        flags = .SIGNALED
    };

    semaphore_info := VkSemaphoreCreateInfo.{};

    result: VkResult;
    for * frame: frames {
        result = check_vk(vkCreateCommandPool(renderer.device, *cmd_pool_info, renderer.vka, *frame.command_pool));
        if result return result, .[];

        result = check_vk(vkCreateFence(renderer.device, *fence_info, renderer.vka, *frame.render_fence));
        if result return result, .[];

        result = check_vk(vkCreateSemaphore(renderer.device, *semaphore_info, renderer.vka, *frame.swapchain_semaphore));
        if result return result, .[];

        result = check_vk(vkCreateSemaphore(renderer.device, *semaphore_info, renderer.vka, *frame.render_semaphore));
        if result return result, .[];
    }

    return .SUCCESS, frames;
}

destroy_frames :: (using renderer: *Renderer) {
    for * frame: frames {
        vkDestroyCommandPool(device, frame.command_pool, vka);
        vkDestroyFence(device, frame.render_fence, vka);
        vkDestroySemaphore(device, frame.render_semaphore, vka);
        vkDestroySemaphore(device, frame.swapchain_semaphore, vka);
    }
    array_free(frames);
}

remake_swapchain :: (renderer: *Renderer, extent: VkExtent2D) -> VkResult {
    vkDeviceWaitIdle(renderer.device);
    result, new_swapchain := make_swapchain(renderer, extent, renderer.swapchain.vk);
    if result return result;

    destroy_swapchain(renderer, *renderer.swapchain);
    renderer.swapchain = new_swapchain;

    destroy_frames(renderer);
    result, renderer.frames = make_frames(renderer);
    if result return result;
    return .SUCCESS;
}

find_depth_format :: (using renderer: *Renderer) -> VkFormat {
    depth_formats :: VkFormat.[.D32_SFLOAT_S8_UINT, .D24_UNORM_S8_UINT];

    format := depth_formats[0];
    for depth_formats {
        format_properties : VkFormatProperties2;
        vkGetPhysicalDeviceFormatProperties2(physical_device, it, *format_properties);
        if format_properties.formatProperties.optimalTilingFeatures & .DEPTH_STENCIL_ATTACHMENT {
            format = it;
            break;
        }
    }

    return format;
}

// The word image here is not the same as Renderer.Image, it also
// includes an image view.
make_draw_images :: (renderer: *Renderer, extent: VkExtent2D) -> VkResult {
    renderer.draw_extent = extent;
    result, draw_image := make_image(renderer, *renderer.internal_memory_pool, extent, renderer.swapchain.format, .TRANSFER_SRC | .COLOR_ATTACHMENT);
    if result return result;

    result=, draw_image_view := make_image_view(renderer, draw_image.vk, renderer.swapchain.format, .COLOR);
    if result return result;

    renderer.draw_texture = .{
        image = draw_image,
        image_view = draw_image_view,
        format = renderer.swapchain.format
    };

    depth_format := find_depth_format(renderer);
    result=, depth_image := make_image(renderer, *renderer.internal_memory_pool, extent, depth_format, .DEPTH_STENCIL_ATTACHMENT);
    if result return result;

    result=, depth_image_view := make_image_view(renderer, depth_image.vk, depth_format, .DEPTH);
    if result return result;

    renderer.depth_texture = .{
        image = depth_image,
        image_view = depth_image_view,
        format = depth_format
    };

    return .SUCCESS;
}

destroy_draw_images :: (using renderer: *Renderer) {
    destroy_texture(renderer, draw_texture);
    destroy_texture(renderer, depth_texture);
}

make_command_pools :: (using renderer: *Renderer) -> VkResult, VkCommandPool {
    create_info := VkCommandPoolCreateInfo.{
        flags = .TRANSIENT | .RESET_COMMAND_BUFFER,
        queueFamilyIndex = queue_indices.graphics
    };

    pool: VkCommandPool;
    result := check_vk(vkCreateCommandPool(device, *create_info, vka, *pool));
    return result, pool;
}

destroy_command_pools :: (using renderer: *Renderer) {
    if command_pool {
        vkDestroyCommandPool(device, command_pool, vka);
    }
}

acquire_next_image_index :: (using renderer: *Renderer) -> bool {
    info := VkAcquireNextImageInfoKHR.{
        swapchain = swapchain.vk,
        timeout = U64_MAX,
        semaphore = frames[frame_index].swapchain_semaphore,
        fence = null,
        deviceMask = 1
    };

    result: VkResult;

    result = vkAcquireNextImage2KHR(device, *info, *image_index);

    if result == {
    case .ERROR_OUT_OF_DATE_KHR;
        resize_requested = true;
        return false;
    case .SUBOPTIMAL_KHR;
        ;
    case .SUCCESS;
        ;
    case;
        return false;
    }

    return true;
}

get_memory_indices :: (using renderer: *Renderer) -> Renderer.Memory_Indices {
    indices: Renderer.Memory_Indices;
    properties: VkPhysicalDeviceMemoryProperties;
    vkGetPhysicalDeviceMemoryProperties(physical_device, *properties);

    for i: 0..properties.memoryTypeCount - 1 {
        if properties.memoryTypes[i].propertyFlags & indices.GPU_ONLY_FLAG == indices.GPU_ONLY_FLAG {
            if indices.gpu_only == U32_MAX {
                indices.gpu_only = xx i;
            }
        }

        if properties.memoryTypes[i].propertyFlags & indices.REBAR_FLAG == indices.REBAR_FLAG {
            indices.rebar = xx i;
        }

        if properties.memoryTypes[i].propertyFlags & indices.STAGING_FLAG == indices.STAGING_FLAG {
            indices.staging = xx i;
        }

        if indices.staging != U32_MAX && indices.gpu_only != U32_MAX && indices.rebar != U32_MAX {
            break;
        }
    }

    return indices;
}

debug_utils_callback :: (messageSeverity: VkDebugUtilsMessageSeverityFlagBitsEXT, messageTypes: VkDebugUtilsMessageTypeFlagsEXT, pCallbackData: *VkDebugUtilsMessengerCallbackDataEXT, pUserData: *void) -> VkBool32 #c_call {
    push_context {
        if messageSeverity == {
        case .VERBOSE;
            ;
        case .INFO;
            ;
        case .WARNING;
            log("[WARN ] %", to_string(pCallbackData.pMessage));
        case .ERROR;
            log("[ERROR] %", to_string(pCallbackData.pMessage));
        }

    }
    return VK_FALSE;
}

debug_utils_messenger_create_info :: VkDebugUtilsMessengerCreateInfoEXT.{
    messageSeverity = .VERBOSE | .INFO | .WARNING | .ERROR,
    messageType     = .GENERAL | .VALIDATION | .PERFORMANCE,
    pfnUserCallback = debug_utils_callback
};
