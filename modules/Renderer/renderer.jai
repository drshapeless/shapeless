Renderer :: struct {
    vka:             *VkAllocationCallbacks;
    instance:        VkInstance;
    surface:         VkSurfaceKHR;
    debug_messenger: VkDebugUtilsMessengerEXT;
    physical_device: VkPhysicalDevice;
    device:          VkDevice;
    queue_indices:   Queue_Family_Indices;
    graphics_queue:  VkQueue;
    present_queue:   VkQueue;
    vma:             VmaAllocator;

    command_pool:    VkCommandPool;

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

    // Persistent means the set in this pool is usually not changed
    // throughout the whole life of the app, like the font atlas
    // texture
    persistent_descriptor_pool: VkDescriptorPool;

    texture_sampler: VkSampler;
    texture_descriptor_set_layout: VkDescriptorSetLayout;

    // This is for dynamic rendering
    cmd: VkCommandBuffer;
    clear_color: [4]float;

    resize_requested := false;

    staging_pool: Staging_Pool;

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
        allocation: VmaAllocation;
    }

    Texture :: struct {
        image: Image;
        image_view: VkImageView;
        format: VkFormat;
    }

    Buffer :: struct {
        vk:         VkBuffer;
        allocation: VmaAllocation;
        size:       u64;
        mapped_ptr: *void;
        address:    VkDeviceAddress;
    }

    Mesh :: struct {
        vertex_buffer: Buffer;
        index_buffer:  Buffer;
    }

    Pipeline :: struct {
        ID :: #type,distinct u64;
        vk:     VkPipeline;
        layout: VkPipelineLayout;
    }

    Staging_Pool :: struct {
        // The block size should be adjust by staging pool info reported by the renderer
        BLOCK_SIZE :u64 : 4 * 1024 * 1024;

        buffers: [..] Buffer;

        current_pos: u64;
        bytes_left:  u64;

        // -1 means there is no buffer
        buffer_index: s64 = -1;
    }
}

init :: (using renderer: *Renderer, window: *SDL_Window) -> ok:bool {
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

    result, vma = make_vma(instance, physical_device, device);
    if result return false;

    result, staging_pool = make_staging_pool(renderer);
    if result return false;

    result, command_pool = make_command_pools(renderer);
    if result return false;

    result, swapchain = make_swapchain(renderer, .{xx window_width, xx window_height});
    if result return false;

    result, frames = make_frames(renderer);
    if result return false;

    result = make_draw_images(renderer, .{xx window_width, xx window_height});
    if result return false;

    // It may not be a good idea to write the pool size here.
    // But it needs constant fine tune, so be it.
    persistent_pool_sizes := VkDescriptorPoolSize.[
    .{
        type = .COMBINED_IMAGE_SAMPLER,
        descriptorCount = 10
    }
    ];

    result, persistent_descriptor_pool = make_descriptor_pool(renderer, persistent_pool_sizes, 10);
    if result return false;

    result, texture_sampler = make_sampler(renderer);
    if result return false;

    result, texture_descriptor_set_layout = make_descriptor_set_layout(renderer);
    if result return false;

    return true;
}

deinit :: (using renderer: *Renderer) {
    if device vkDeviceWaitIdle(device);

    for pipelines {
        destroy_pipeline(renderer, it);
    }
    table_reset(*pipelines);

    vkDestroyDescriptorSetLayout(device, texture_descriptor_set_layout, vka);
    vkDestroySampler(device, texture_sampler, vka);
    vkDestroyDescriptorPool(device, persistent_descriptor_pool, vka);

    destroy_command_pools(renderer);
    destroy_draw_images(renderer);
    destroy_frames(renderer);
    destroy_swapchain(renderer, *swapchain);
    vkDestroySurfaceKHR(instance, surface, vka);
    destroy_staging_pool(renderer);
    vmaDestroyAllocator(vma);
    vkDestroyDevice(device, vka);
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

destroy_shader_module :: (using renderer: *Renderer, module: VkShaderModule) {
    vkDestroyShaderModule(device, module, vka);
}

begin_draw :: (using renderer: *Renderer) -> bool {
    frame := *frames[frame_index];

    result: VkResult;
    if check_vk(vkWaitForFences(device, 1, *frame.render_fence, VK_TRUE, U64_MAX)) return false;
    if check_vk(vkResetFences(device, 1, *frame.render_fence)) return false;

    if check_vk(vkResetCommandPool(device, frame.command_pool, 0)) return false;

    cmd_alloc_info := VkCommandBufferAllocateInfo.{
        commandPool = frame.command_pool,
        commandBufferCount = 1
    };

    result = check_vk(vkAllocateCommandBuffers(device, *cmd_alloc_info, *cmd));
    if result return false;

    ok := acquire_next_image_index(renderer);
    if !ok return false;

    cmd_begin_info := VkCommandBufferBeginInfo.{
        flags = .ONE_TIME_SUBMIT,
    };

    if check_vk(vkBeginCommandBuffer(cmd, *cmd_begin_info)) return false;

    reset_staging_pool(*staging_pool);

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
    vkCmdPipelineBarrier2(cmd, *dependency_info);

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

    vkCmdBeginRendering(cmd, *rendering_info);

    viewport := VkViewport.{
        x = 0,
        y = 0,
        width = xx swapchain.extent.width,
        height = xx swapchain.extent.height,
        minDepth = 0,
        maxDepth = 1,
    };

    vkCmdSetViewport(cmd, 0, 1, *viewport);

    scissor := VkRect2D.{
        offset = .{0, 0},
        extent = swapchain.extent,
    };
    vkCmdSetScissor(cmd, 0, 1, *scissor);

    return true;
}

end_draw :: (using renderer: *Renderer) {
    defer cmd = null;
    frame := frames[frame_index];
    vkCmdEndRendering(cmd);

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
    vkCmdPipelineBarrier2(cmd, *dependency_info);

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
    vkCmdBlitImage2(cmd, *blit_info);

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
    vkCmdPipelineBarrier2(cmd, *present_barrier_info);

    if check_vk(vkEndCommandBuffer(cmd)) return;

    cmd_info := VkCommandBufferSubmitInfo.{
        commandBuffer = cmd,
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
        pCommandBufferInfos = *cmd_info,
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
make_buffer :: (using renderer: *Renderer, size: VkDeviceSize, buffer_usage: VkBufferUsageFlags, memory_usage: VmaMemoryUsage = .AUTO, flags: VmaAllocationCreateFlags = 0) -> VkResult, Renderer.Buffer {
    buffer_info := VkBufferCreateInfo.{
        size        = size,
        usage       = buffer_usage | .SHADER_DEVICE_ADDRESS,
        sharingMode = .EXCLUSIVE
    };

    alloc_create_info := VmaAllocationCreateInfo.{
        usage = memory_usage,
        flags = flags | .MAPPED_BIT | .HOST_ACCESS_RANDOM_BIT
    };

    buffer := Renderer.Buffer.{
        size = size
    };
    allocation_info: VmaAllocationInfo;
    result := check_vk(vmaCreateBuffer(vma, *buffer_info, *alloc_create_info, *buffer.vk, *buffer.allocation, *allocation_info));
    buffer.mapped_ptr = allocation_info.pMappedData;

    address_info := VkBufferDeviceAddressInfo.{
        buffer = buffer.vk
    };
    buffer.address = vkGetBufferDeviceAddress(device, *address_info);

    return result, buffer;
}

destroy_buffer :: (vma: VmaAllocator, buffer: Renderer.Buffer) {
    vmaDestroyBuffer(vma, buffer.vk, buffer.allocation);
}

// This function is obsolete when using host image copy, but it is
// currently kept because AMD driver does not support it well at the
// moment.
copy_buffer_to_image :: (command: VkCommandBuffer, source: Renderer.Buffer, offset: u64, destination: VkImage, extent: VkExtent2D) {
    barrier := VkImageMemoryBarrier2.{
        srcStageMask     = .TOP_OF_PIPE,
        srcAccessMask    = 0,
        dstStageMask     = .TRANSFER,
        dstAccessMask    = .TRANSFER_WRITE,
        oldLayout        = .UNDEFINED,
        newLayout        = .TRANSFER_DST_OPTIMAL,
        image            = destination,
        subresourceRange = .{
            aspectMask   = .COLOR,
            baseMipLevel   = 0,
            levelCount     = 1,
            baseArrayLayer = 0,
            layerCount     = 1
        }
    };

    dependency_info := VkDependencyInfo.{
        imageMemoryBarrierCount = 1,
        pImageMemoryBarriers    = *barrier
    };
    vkCmdPipelineBarrier2(command, *dependency_info);

    region := VkBufferImageCopy2.{
        bufferOffset = offset,
        bufferRowLength = 0,
        bufferImageHeight = 0,
        imageSubresource = .{.COLOR, 0, 0, 1},
        imageOffset = .{0, 0, 0},
        imageExtent = .{width = extent.width, height = extent.height, depth = 1}
    };

    copy_info := VkCopyBufferToImageInfo2.{
        srcBuffer = source.vk,
        dstImage = destination,
        dstImageLayout = .TRANSFER_DST_OPTIMAL,
        regionCount = 1,
        pRegions = *region
    };

    vkCmdCopyBufferToImage2(command, *copy_info);

    barrier.oldLayout = .TRANSFER_DST_OPTIMAL;
    barrier.newLayout = .SHADER_READ_ONLY_OPTIMAL;
    barrier.srcAccessMask = .TRANSFER_WRITE;
    barrier.dstAccessMask = .SHADER_READ;
    barrier.srcStageMask = .TRANSFER;
    barrier.dstStageMask = .FRAGMENT_SHADER;

    vkCmdPipelineBarrier2(command, *dependency_info);
}

// Is this function necessary?
make_buffer_copying_data :: (using renderer: *Renderer, data: [] $T, buffer_usage: VkBufferUsageFlags) -> VkResult, Renderer.Buffer {
    size := data.count * size_of(T);
    result, buffer := make_buffer(renderer, xx size, buffer_usage);
    if result return result, .{};

    memcpy(buffer.mapped_ptr, data.data, size);
    return result, buffer;
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
    vkDestroyImageView(device, texture.image_view, vka);
    vmaDestroyImage(vma, texture.image.vk, texture.image.allocation);
}

destroy_pipeline :: (using renderer: *Renderer, pipeline: Renderer.Pipeline) {
    if pipeline.layout {
        vkDestroyPipelineLayout(device, pipeline.layout, vka);
    }

    if pipeline.vk {
        vkDestroyPipeline(device, pipeline.vk, vka);
    }
}

make_mesh :: (using renderer: *Renderer, vertices: []$T, indices: []u32) -> VkResult, Renderer.Mesh {
    mesh: Renderer.Mesh;
    result: VkResult;
    result, mesh.vertex_buffer = make_buffer_copying_data(renderer, vertices, .VERTEX_BUFFER);
    if result return result, .{};

    result, mesh.index_buffer = make_buffer_copying_data(renderer, indices, .INDEX_BUFFER);
    if result return result, .{};

    return .SUCCESS, mesh;
}

destroy_mesh :: (using renderer: *Renderer, mesh: Renderer.Mesh) {
    destroy_buffer(vma, mesh.vertex_buffer);
    destroy_buffer(vma, mesh.index_buffer);
}

draw_mesh :: (command: VkCommandBuffer, mesh: Renderer.Mesh) {
    offsets: VkDeviceSize;
    vkCmdBindVertexBuffers(command, 0, 1, *mesh.vertex_buffer.vk, *offsets);
    vkCmdBindIndexBuffer(command, mesh.index_buffer.vk, 0, .UINT32);
    index_count: u32 = xx (mesh.index_buffer.size / size_of(u32));
    vkCmdDrawIndexed(command, index_count, 1, 0, 0, 0);
}

// This version of make texture uses host image copy
make_texture :: (using renderer: *Renderer, data: *void, extent: VkExtent2D, format: VkFormat = .R8G8B8A8_UNORM) -> VkResult, Renderer.Texture {
    texture: Renderer.Texture;
    texture.format = format;
    result: VkResult;
    result, texture.image = make_image(vma, extent, texture.format, .SAMPLED | .HOST_TRANSFER);
    if result return result, .{};

    result, texture.image_view = make_image_view(renderer, texture.image.vk, texture.format, .COLOR);
    if result {
        vmaDestroyImage(vma, texture.image.vk, texture.image.allocation);
        return result, .{};
    }

    host_image_layout_transition_info := VkHostImageLayoutTransitionInfo.{
        image = texture.image.vk,
        oldLayout = .UNDEFINED,
        newLayout = .SHADER_READ_ONLY_OPTIMAL,
        subresourceRange = .{
            aspectMask     = .COLOR,
            baseMipLevel   = 0,
            levelCount     = 1,
            baseArrayLayer = 0,
            layerCount     = 1
        }
    };

    result = check_vk(vkTransitionImageLayout(device, 1, *host_image_layout_transition_info));
    if result {
        destroy_texture(renderer, texture);
        return result, .{};
    }

    memory_to_image_copy := VkMemoryToImageCopy.{
        imageSubresource = .{
            aspectMask     = .COLOR,
            mipLevel       = 0,
            baseArrayLayer = 0,
            layerCount     = 1
        },
        imageExtent = .{
            width  = extent.width,
            height = extent.height,
            depth  = 1
        },
        pHostPointer = data
    };

    copy_memory_to_image_info := VkCopyMemoryToImageInfo.{
        dstImage       = texture.image.vk,
        dstImageLayout = .SHADER_READ_ONLY_OPTIMAL,
        regionCount    = 1,
        pRegions       = *memory_to_image_copy
    };

    result = check_vk(vkCopyMemoryToImage(device, *copy_memory_to_image_info));
    if result {
        destroy_texture(renderer, texture);
        return result, .{};
    }

    return .SUCCESS, texture;
}

// This function relies on SDL_image
make_texture_from_file :: (using renderer: *Renderer, file_path: string, format: VkFormat = .R8G8B8A8_UNORM) -> VkResult, Renderer.Texture {
    original_surface := IMG_Load(to_c_string(file_path));
    assert(original_surface != null);
    defer SDL_DestroySurface(original_surface);

    converted_surface := SDL_ConvertSurface(original_surface, .RGBA32);
    assert(converted_surface != null);
    defer SDL_DestroySurface(converted_surface);

    result, texture := make_texture(renderer, converted_surface.pixels, .{xx converted_surface.w, xx converted_surface.h}, format);
    return result, texture;
}

resize_callback :: (using renderer: *Renderer, extent: VkExtent2D) {
    vkDeviceWaitIdle(device);
    destroy_draw_images(renderer);
    make_draw_images(renderer, extent);
    remake_swapchain(renderer, extent);
    resize_requested = false;
}

allocate_staging_buffer :: (using renderer: *Renderer, size: u64) -> VkResult, Renderer.Buffer, u64 {
    while staging_pool.bytes_left < size {
        // First check if the current buffer is the last buffer
        if staging_pool.buffer_index == staging_pool.buffers.count - 1 {
            result := expand_staging_pool(renderer, *staging_pool, size);
            if result return result, .{}, 0;
        } else {
            staging_pool.buffer_index += 1;
            staging_pool.current_pos = 0;
            staging_pool.bytes_left = staging_pool.buffers[staging_pool.buffer_index].size;
        }
    }

    staging_buffer := staging_pool.buffers[staging_pool.buffer_index];
    staging_buffer.size = size;

    offset := staging_pool.current_pos;
    staging_pool.current_pos += size;
    staging_pool.bytes_left -= size;
    return .SUCCESS, staging_buffer, offset;
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

#scope_file
// Initialization helpers
application_info :: VkApplicationInfo.{
    pApplicationName   = "Shapeless",
    applicationVersion = #run VK_MAKE_API_VERSION(0, 1, 0, 0),
    pEngineName        = "Shapeless Engine",
    engineVersion      = #run VK_MAKE_API_VERSION(0, 1, 0, 0),
    apiVersion         = VK_API_VERSION_1_4
};

validation_layers :: (*u8).["VK_LAYER_KHRONOS_validation"];

make_instance_create_info :: (instance_extensions: [] *u8) -> VkInstanceCreateInfo {
    return .{
        flags = ifx OS == .MACOS then VkInstanceCreateFlags.ENUMERATE_PORTABILITY_KHR else 0,
        pApplicationInfo = *application_info,
        enabledLayerCount = xx ifx VALIDATION then 1 else 0,
        ppEnabledLayerNames = ifx VALIDATION then validation_layers.data else null,
        enabledExtensionCount = xx instance_extensions.count,
        ppEnabledExtensionNames = instance_extensions.data
    };
}

make_instance :: (instance_extensions: [] *u8, vka: *VkAllocationCallbacks) -> ok:bool, VkInstance {
    info := make_instance_create_info(instance_extensions);
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

        if !supported return false;
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
    instance_extensions: []*u8;
    instance_extension_count: u32;
    instance_extension_data := SDL_Vulkan_GetInstanceExtensions(*instance_extension_count);
    instance_extensions.count = instance_extension_count;
    instance_extensions.data = instance_extension_data;
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

    features14 := VkPhysicalDeviceVulkan14Features.{
        // I want to use this extension, but seems like it is not
        // supported in AMD GPU, but in mesa, we can enable this
        // experiment feature by RADV_PERFTEST=hic
        //
        hostImageCopy = VK_TRUE
    };

    features13 := VkPhysicalDeviceVulkan13Features.{
        pNext = *features14,
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
        descriptorBindingStorageBufferUpdateAfterBind = VK_TRUE
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

    // TODO: Check if the features are available before use. Now it is
    // not checked.

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

make_vma :: (instance: VkInstance, physical_device: VkPhysicalDevice, device: VkDevice) -> VkResult, VmaAllocator {
    vma_vulkan_functions := VmaVulkanFunctions.{
        vkGetInstanceProcAddr = vkGetInstanceProcAddr,
        vkGetDeviceProcAddr = vkGetDeviceProcAddr,
    };

    create_info := VmaAllocatorCreateInfo.{
        vulkanApiVersion = VK_API_VERSION_1_4,
        physicalDevice = physical_device,
        device = device,
        instance = instance,
        flags = .BUFFER_DEVICE_ADDRESS_BIT,
        pVulkanFunctions = *vma_vulkan_functions,
    };

    allocator: VmaAllocator;
    result := check_vk(vmaCreateAllocator(*create_info, *allocator));
    return result, allocator;
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
    array_free(swapchain.images);
    for view: swapchain.image_views {
        vkDestroyImageView(renderer.device, view, renderer.vka);
    }
    array_free(swapchain.image_views);
    vkDestroySwapchainKHR(renderer.device, swapchain.vk, renderer.vka);
    swapchain.vk = null;
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

make_image :: (
    vma: VmaAllocator,
    extent: VkExtent2D,
    format: VkFormat,
    image_usage: VkImageUsageFlags,
    memory_usage: VmaMemoryUsage = .AUTO,
    tiling: VkImageTiling = .OPTIMAL,
    image_type: VkImageType = .e2D,
    layer_count: u32 = 1,
    sample_count: VkSampleCountFlagBits = .e1,
    mip_levels: u32 = 1
) -> VkResult, Renderer.Image {
    image_info := VkImageCreateInfo.{
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
        usage = image_usage,
        sharingMode = .EXCLUSIVE,
        initialLayout = .UNDEFINED
    };

    alloc_info := VmaAllocationCreateInfo.{
        // flags = .DEDICATED_MEMORY_BIT,
        usage = memory_usage,
        // requiredFlags = .DEVICE_LOCAL
    };

    image: VkImage;
    allocation: VmaAllocation;
    result := check_vk(vmaCreateImage(vma, *image_info, *alloc_info, *image, *allocation, null));
    return result, .{vk = image, allocation = allocation};
}

make_image_view :: (using renderer: *Renderer, image: VkImage, format: VkFormat, aspect_flag: VkImageAspectFlags, layer_count: u32 = 1, mip_levels: u32 = 1) -> VkResult, VkImageView {
    view_info := VkImageViewCreateInfo.{
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

    view: VkImageView;
    result := check_vk(vkCreateImageView(device, *view_info, vka, *view));
    return result, view;
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
make_draw_images :: (using renderer: *Renderer, extent: VkExtent2D) -> VkResult {
    draw_extent = extent;
    result, draw_image := make_image(vma, extent, swapchain.format, .TRANSFER_SRC | .COLOR_ATTACHMENT);
    if result return result;

    result=, draw_image_view := make_image_view(renderer, draw_image.vk, swapchain.format, .COLOR);
    if result return result;

    draw_texture = .{
        image = draw_image,
        image_view = draw_image_view,
        format = swapchain.format
    };

    depth_format := find_depth_format(renderer);
    result=, depth_image := make_image(vma, extent, depth_format, .DEPTH_STENCIL_ATTACHMENT);
    if result return result;

    result=, depth_image_view := make_image_view(renderer, depth_image.vk, depth_format, .DEPTH);
    if result return result;

    depth_texture = .{
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
    vkDestroyCommandPool(device, command_pool, vka);
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

expand_staging_pool :: (renderer: *Renderer, pool: *Renderer.Staging_Pool, size: u64) -> VkResult {
    real_size := pool.BLOCK_SIZE;
    while size > real_size {
        real_size *= 2;
    }

    result, buffer := make_buffer(renderer, real_size, .TRANSFER_SRC);
    if result return result;

    array_add(*pool.buffers, buffer);
    pool.buffer_index = pool.buffers.count - 1;
    pool.current_pos  = 0;
    pool.bytes_left   = real_size;

    return .SUCCESS;
}

make_staging_pool :: (renderer: *Renderer) -> VkResult, Renderer.Staging_Pool {
    staging_pool: Renderer.Staging_Pool;

    result := expand_staging_pool(renderer, *staging_pool, staging_pool.BLOCK_SIZE);
    if result return result, .{};

    return .SUCCESS, staging_pool;
}

reset_staging_pool :: (pool: *Renderer.Staging_Pool) {
    if pool.buffer_index < 0 {
        return;
    }

    pool.current_pos = 0;
    pool.buffer_index = 0;
    pool.bytes_left  = pool.buffers[pool.buffer_index].size;
}

destroy_staging_pool :: (using renderer: *Renderer) {
    max_buffer_size :u64 = 0;
    for staging_pool.buffers {
        if it.size > max_buffer_size max_buffer_size = it.size;
        destroy_buffer(vma, it);
    }

    log("Staging pool info:\nBuffer count: %, Max buffer size in staging pool: %", staging_pool.buffers.count, max_buffer_size);

    array_free(staging_pool.buffers);
}

make_descriptor_pool :: (renderer: *Renderer, pool_sizes: [] VkDescriptorPoolSize, max_sets: u32) -> VkResult, VkDescriptorPool {
    pool_create_info := VkDescriptorPoolCreateInfo.{
        maxSets = max_sets,
        poolSizeCount = xx pool_sizes.count,
        pPoolSizes = pool_sizes.data
    };

    pool: VkDescriptorPool;
    result := check_vk(vkCreateDescriptorPool(renderer.device, *pool_create_info, renderer.vka, *pool));
    return result, pool;
}

make_sampler :: (renderer: *Renderer) -> VkResult, VkSampler {
    sampler_create_info := VkSamplerCreateInfo.{
        magFilter = .LINEAR,
        minFilter = .LINEAR,
        mipmapMode = .LINEAR,
        anisotropyEnable = VK_TRUE,
        maxAnisotropy  = 8
    };

    sampler: VkSampler;
    result := check_vk(vkCreateSampler(renderer.device, *sampler_create_info, renderer.vka, *sampler));
    return result, sampler;
}

make_descriptor_set_layout :: (renderer: *Renderer) -> VkResult, VkDescriptorSetLayout {
    binding := VkDescriptorSetLayoutBinding.{
        descriptorType = .COMBINED_IMAGE_SAMPLER,
        descriptorCount = 1,
        stageFlags = .FRAGMENT,
        pImmutableSamplers = null
    };

    layout_create_info := VkDescriptorSetLayoutCreateInfo.{
        bindingCount = 1,
        pBindings = *binding
    };

    layout: VkDescriptorSetLayout;
    result := check_vk(vkCreateDescriptorSetLayout(renderer.device, *layout_create_info, renderer.vka, *layout));
    return result, layout;
}
