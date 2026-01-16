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
    descriptor_set_layout: VkDescriptorSetLayout;

    swapchain:       Swapchain;
    frames:          [] Frame_Data;
    frame_index:     u32;
    image_index:     u32;

    draw_texture:      Texture;
    depth_texture:     Texture;

    next_descriptor_pool_id: Descriptor_Pool.ID = 1;
    current_descriptor_pool_id: Descriptor_Pool.ID;
    descriptor_pools: Table(Descriptor_Pool.ID, Descriptor_Pool);

    // This is for dynamic rendering
    cmd: VkCommandBuffer;
    clear_color: VkClearValue;

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

    Descriptor_Pool :: struct {
        ID :: #type,distinct u64;
        id:              ID;
        vk:              VkDescriptorPool;
        allocated_count: u64;
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

    device_create_info := make_device_create_info(physical_device, surface, all_device_extensions, queue_indices);

    if check_vk(vkCreateDevice(physical_device, *device_create_info, vka, *device)) {
        if surface vkDestroySurfaceKHR(instance, surface, vka);
        vkDestroyInstance(instance, vka);
        return false;
    }

    vk_load_device_functions(device);

    result: VkResult;
    defer {
        if result deinit(renderer);
    }

    vkGetDeviceQueue(device, queue_indices.graphics, 0, *graphics_queue);
    vkGetDeviceQueue(device, queue_indices.present, 0, *present_queue);

    result, vma = make_vma(instance, physical_device, device);
    if result return false;

    result, command_pool = make_command_pools(renderer);
    if result return false;

    result, descriptor_set_layout = make_descriptor_set_layout(renderer);
    if result return false;

    result = make_swapchain_resources(renderer);
    if result return false;

    result = make_draw_images(renderer);
    if result return false;

    return true;
}

deinit :: (using renderer: *Renderer) {
    if device vkDeviceWaitIdle(device);

    destroy_descriptor_set_layout(renderer);
    destroy_command_pools(renderer);
    destroy_draw_images(renderer);
    destroy_swapchain_resources(renderer);
    vkDestroySurfaceKHR(instance, surface, vka);
    vmaDestroyAllocator(vma);
    vkDestroyDevice(device, vka);
    vkDestroyInstance(instance, vka);
}

// This is deprecated in Vulkan 1.4
make_shader_module :: (using renderer: *Renderer, file_path: string) -> ok:bool, VkShaderModule {
    shader_code := read_entire_file(file);
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

    // Image Layout is no longer relevant in modern hardware, with
    // device extension of VK_KHR_unified_image_layouts.
    // https://www.khronos.org/blog/so-long-image-layouts-simplifying-vulkan-synchronisation

    transition_image(cmd, draw_texture.image.vk, .UNDEFINED, .GENERAL);
    transition_image(cmd, depth_texture.image.vk, .UNDEFINED, .GENERAL);

    color_attachment := VkRenderingAttachmentInfo.{
        imageView   = draw_texture.image_view,
        imageLayout = .GENERAL,
        loadOp      = .CLEAR,
        storeOp     = .STORE,
        clearValue  = clear_color
    };

    depth_attachment := VkRenderingAttachmentInfo.{
        imageView   = depth_texture.image_view,
        imageLayout = .GENERAL,
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
    copy_image(cmd, draw_texture.image.vk, current_image, swapchain.extent, swapchain.extent);
    transition_image(cmd, current_image, .UNDEFINED, .PRESENT_SRC_KHR);

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
    clear_color.color.float32_ = color;
}

copy_image :: (cmd: VkCommandBuffer, src_image: VkImage, dst_image: VkImage, src_extent: VkExtent2D, dst_extent: VkExtent2D) {
    blit_region := VkImageBlit2.{
        srcSubresource = .{
            aspectMask     = .COLOR,
            baseArrayLayer = 0,
            layerCount     = 1,
            mipLevel       = 0,
        },
        dstSubresource = .{
            aspectMask     = .COLOR,
            baseArrayLayer = 0,
            layerCount     = 1,
            mipLevel       = 0,
        },
    };

    blit_region.srcOffsets[1] = .{
        x = xx src_extent.width,
        y = xx src_extent.height,
        z = 1,
    };

    blit_region.dstOffsets[1] = .{
        x = xx dst_extent.width,
        y = xx dst_extent.height,
        z = 1,
    };

    blit_info := VkBlitImageInfo2.{
        srcImage       = src_image,
        srcImageLayout = .GENERAL,
        dstImage       = dst_image,
        dstImageLayout = .GENERAL,
        regionCount    = 1,
        pRegions       = *blit_region,
        filter         = .LINEAR,
    };

    vkCmdBlitImage2(cmd, *blit_info);
}

transition_image :: (cmd: VkCommandBuffer, image: VkImage, old_layout: VkImageLayout, new_layout: VkImageLayout) {
    aspect_mask : VkImageAspectFlags;
    if new_layout == .DEPTH_ATTACHMENT_OPTIMAL {
        aspect_mask = .DEPTH;
    } else {
        aspect_mask = .COLOR;
    }

    sub_image := VkImageSubresourceRange.{
        aspectMask     = aspect_mask,
        baseMipLevel   = 0,
        levelCount     = VK_REMAINING_MIP_LEVELS,
        baseArrayLayer = 0,
        layerCount     = VK_REMAINING_ARRAY_LAYERS,
    };

    image_barrier := VkImageMemoryBarrier2.{
        srcStageMask     = .ALL_COMMANDS,
        srcAccessMask    = .MEMORY_WRITE,
        dstStageMask     = .ALL_COMMANDS,
        dstAccessMask    = .MEMORY_WRITE | .MEMORY_READ,
        oldLayout        = old_layout,
        newLayout        = new_layout,
        image            = image,
        subresourceRange = sub_image,
    };

    dep_info := VkDependencyInfo.{
        imageMemoryBarrierCount = 1,
        pImageMemoryBarriers    = *image_barrier,
    };

    vkCmdPipelineBarrier2(cmd, *dep_info);
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

make_device_create_info :: (physical_device: VkPhysicalDevice, surface: VkSurfaceKHR, device_extensions: [] *u8, queue_indices: Renderer.Queue_Family_Indices) -> VkDeviceCreateInfo {
    indices_array := u32.[queue_indices.graphics, queue_indices.present];

    queue_count := ifx queue_indices.graphics == queue_indices.present then 1 else 2;
    queue_create_infos := NewArray(queue_count, VkDeviceQueueCreateInfo, initialized = false,, temp);
    queue_priority := New(float, initialized = false,, temp);
    queue_priority.* = 1;

    for * queue_create_infos {
        it.* = .{
            queueFamilyIndex = indices_array[it_index],
            queueCount = 1,
            pQueuePriorities = queue_priority
        };
    }

    feature_unified_image_layouts := New(VkPhysicalDeviceUnifiedImageLayoutsFeaturesKHR,, temp);
    feature_unified_image_layouts.unifiedImageLayouts = VK_TRUE;

    features13 := New(VkPhysicalDeviceVulkan13Features,, temp);
    features13.dynamicRendering = VK_TRUE;
    features13.synchronization2 = VK_TRUE;
    features13.pNext = feature_unified_image_layouts;

    features12 := New(VkPhysicalDeviceVulkan12Features,, temp);
    features12.pNext = features13;
    features12.bufferDeviceAddress = VK_TRUE;
    features12.descriptorIndexing = VK_TRUE;

    device_features := New(VkPhysicalDeviceFeatures2,, temp);
    device_features.pNext = features12;
    device_features.features = .{
        samplerAnisotropy = VK_TRUE,
        fillModeNonSolid = VK_TRUE,
    };

    // TODO: Check if the features are available before use. Now it is
    // not checked.

    return .{
        pNext = device_features,
        queueCreateInfoCount = xx queue_create_infos.count,
        pQueueCreateInfos = queue_create_infos.data,
        enabledLayerCount = xx ifx VALIDATION then validation_layers.count else 0,
        ppEnabledLayerNames = ifx VALIDATION then validation_layers.data else null,
        enabledExtensionCount = xx device_extensions.count,
        ppEnabledExtensionNames = device_extensions.data,
        pEnabledFeatures = null,
    };
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
        flags = VMA_BUFFER_DEVICE_ADDRESS,
        pVulkanFunctions = *vma_vulkan_functions,
    };

    allocator: VmaAllocator;
    result := check_vk(vmaCreateAllocator(*create_info, *allocator));
    return result, allocator;
}

make_swapchain_resources :: (using renderer: *Renderer) -> VkResult {
    result := make_swapchain(renderer);
    if result return result;

    images := swapchain.images;
    assert(images.count > 0, "Swapchain should have images");

    resize_for_swapchain(renderer, *swapchain.image_views);

    for 0..images.count - 1 {
        result=, view := make_image_view(renderer, images[it], swapchain.format, .COLOR);
        if result return result;
        swapchain.image_views[it] = view;
    }

    resize_for_swapchain(renderer, *frames);

    // TODO: Omit multisample for now
    result = make_frames(renderer);

    return result;
}

destroy_swapchain_resources :: (using renderer: *Renderer) {
    destroy_frames(renderer);
    destroy_swapchain(renderer);
}

make_swapchain :: (using renderer: *Renderer) -> VkResult {
    support := get_swapchain_support(physical_device, surface);

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

    extent := support.capabilities.currentExtent;
    if extent.width == U32_MAX {
        extent = support.capabilities.maxImageExtent;
    }

    exclusive_queue := queue_indices.graphics == queue_indices.present;
    queue_indices_array := u32.[queue_indices.graphics, queue_indices.present];

    create_info := VkSwapchainCreateInfoKHR.{
        surface = surface,
        minImageCount = image_count,
        imageFormat = format.format,
        imageColorSpace = format.colorSpace,
        imageExtent = extent,
        imageArrayLayers = 1,
        imageUsage = .TRANSFER_DST | .COLOR_ATTACHMENT,
        imageSharingMode = ifx exclusive_queue then .EXCLUSIVE else .CONCURRENT,
        queueFamilyIndexCount = xx ifx exclusive_queue then 0 else 2,
        pQueueFamilyIndices = ifx exclusive_queue then queue_indices_array.data else null,
        preTransform = support.capabilities.currentTransform,
        compositeAlpha = .OPAQUE,
        presentMode = present_mode,
        clipped = VK_TRUE
    };

    // Note: providing an old swapchain does little to no help in
    // creating a new swapchain, so don't bother.

    swapchain = .{
        format = format.format,
        extent = extent
    };

    result := check_vk(vkCreateSwapchainKHR(device, *create_info, vka, *swapchain.vk));
    if result return result;

    result, swapchain.images = vkGetSwapchainImagesKHR(device, swapchain.vk);
    return check_vk(result, vkGetSwapchainImagesKHR);
}

destroy_swapchain :: (using renderer: *Renderer) {
    array_free(swapchain.images);
    for view: swapchain.image_views {
        vkDestroyImageView(device, view, vka);
    }
    vkDestroySwapchainKHR(device, swapchain.vk, vka);
    swapchain.vk = null;
}

resize_for_swapchain :: (renderer: *Renderer, array: *[] $T) {
    if array.count != renderer.swapchain.images.count {
        array_free(array.*);
        array.* = NewArray(renderer.swapchain.images.count, T);
    }
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

make_frames :: (using renderer: *Renderer) -> VkResult {
    cmd_pool_info := VkCommandPoolCreateInfo.{
        flags = .RESET_COMMAND_BUFFER,
        queueFamilyIndex = queue_indices.graphics
    };

    fence_info := VkFenceCreateInfo.{
        flags = .SIGNALED
    };

    semaphore_info := VkSemaphoreCreateInfo.{};

    result: VkResult;
    for * frame: frames {
        result = check_vk(vkCreateCommandPool(device, *cmd_pool_info, vka, *frame.command_pool));
        if result return result;

        result = check_vk(vkCreateFence(device, *fence_info, vka, *frame.render_fence));
        if result return result;

        result = check_vk(vkCreateSemaphore(device, *semaphore_info, vka, *frame.swapchain_semaphore));
        if result return result;

        result = check_vk(vkCreateSemaphore(device, *semaphore_info, vka, *frame.render_semaphore));
        if result return result;
    }

    return .SUCCESS;
}

destroy_frames :: (using renderer: *Renderer) {
    for * frame: frames {
        vkDestroyCommandPool(device, frame.command_pool, vka);
        vkDestroyFence(device, frame.render_fence, vka);
        vkDestroySemaphore(device, frame.render_semaphore, vka);
        vkDestroySemaphore(device, frame.swapchain_semaphore, vka);
    }
}

remake_swapchain_resources :: (using renderer: *Renderer) -> VkResult {
    vkDeviceWaitIdle(device);
    destroy_swapchain_resources(renderer);
    return make_swapchain_resources(renderer);
}

make_image :: (
    vma: VmaAllocator,
    extent: VkExtent2D,
    format: VkFormat,
    image_usage: VkImageUsageFlags,
    memory_usage: VmaMemoryUsage,
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
        usage = memory_usage,
        requiredFlags = .DEVICE_LOCAL
    };

    image: VkImage;
    allocation: VmaAllocation;
    result := check_vk(vmaCreateImage(vma, *image_info, *alloc_info, *image, *allocation, null));
    return result, .{vk = image, allocation = allocation};
}

// The word image here is not the same as Renderer.Image, it also
// includes an image view.
make_draw_images :: (using renderer: *Renderer) -> VkResult {
    result, draw_image := make_image(vma, swapchain.extent, swapchain.format, .TRANSFER_SRC | .COLOR_ATTACHMENT, .GPU_ONLY);
    if result return result;

    result=, draw_image_view := make_image_view(renderer, draw_image.vk, swapchain.format, .COLOR);
    if result return result;

    draw_texture = .{
        image = draw_image,
        image_view = draw_image_view,
        format = swapchain.format
    };

    // TODO: Should I select a depth format instead of hardcoding as D32_SFLOAT?
    result=, depth_image := make_image(vma, swapchain.extent, .D32_SFLOAT, .DEPTH_STENCIL_ATTACHMENT, .GPU_ONLY);
    if result return result;

    result=, depth_image_view := make_image_view(renderer, depth_image.vk, .D32_SFLOAT, .DEPTH);
    if result return result;

    depth_texture = .{
        image = depth_image,
        image_view = depth_image_view,
        format = swapchain.format
    };

    return .SUCCESS;
}

destroy_texture :: (using renderer: *Renderer, texture: Renderer.Texture) {
    vkDestroyImageView(device, texture.image_view, vka);
    vmaDestroyImage(vma, texture.image.vk, texture.image.allocation);
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

make_descriptor_set_layout :: (using renderer: *Renderer) -> VkResult, VkDescriptorSetLayout {
    uniform_layout_binding := VkDescriptorSetLayoutBinding.{
        binding = 0,
        descriptorType = .UNIFORM_BUFFER,
        descriptorCount = 1,
        stageFlags = .VERTEX | .FRAGMENT
    };

    bindings := VkDescriptorSetLayoutBinding.[
        uniform_layout_binding,
    ];

    layout_info := VkDescriptorSetLayoutCreateInfo.{
        bindingCount = xx bindings.count,
        pBindings = bindings.data
    };

    layout: VkDescriptorSetLayout;
    result := check_vk(vkCreateDescriptorSetLayout(device, *layout_info, vka, *layout));
    return result, layout;
}

destroy_descriptor_set_layout :: (using renderer: *Renderer) {
    vkDestroyDescriptorSetLayout(device, descriptor_set_layout, vka);
}

make_descriptor_pool :: (renderer: *Renderer, capacity: u32) -> VkResult, VkDescriptorPool {
    uniform_pool_size := VkDescriptorPoolSize.{
        type = .UNIFORM_BUFFER,
        descriptorCount = capacity
    };

    pool_sizes := VkDescriptorPoolSize.[
        uniform_pool_size
    ];

    pool_info := VkDescriptorPoolCreateInfo.{
        maxSets = capacity,
        poolSizeCount = xx pool_sizes.count,
        pPoolSizes = pool_sizes.data
    };

    pool: VkDescriptorPool;
    result := check_vk(vkCreateDescriptorPool(device, *pool_info, vka, *pool));
    return result, pool;
}

access_descriptor_pool :: (using renderer: *Renderer) -> VkResult, *Renderer.Descriptor_Pool {
    pool_capacity := swapchain.images.count * 1024;

    if current_descriptor_pool_id {
        pool := table_find_pointer(*descriptor_pools, current_descriptor_pool_id);
        if pool.allocated_count < pool_capacity {
            return .SUCCESS, pool;
        }
    }

    for * descriptor_pools {
        if it.allocated_count < pool_capacity {
            current_descriptor_pool_id = it.id;
            return .SUCCESS, it;
        }
    }

    result, pool := make_descriptor_pool(renderer, pool_capacity);
    if result return result, null;

    id := next_descriptor_pool_id;
    next_descriptor_pool_id += 1;

    return .SUCCESS, table_add(*descriptor_pools, key = id, value = .{id = id, vk = pool});
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

    result = check_vk(vkAcquireNextImage2KHR(device, *info, *image_index));

    if result == {
    case .ERROR_OUT_OF_DATE_KHR;
        result = remake_swapchain_resources(renderer);
        if result return false;

        result = check_vk(vkAcquireNextImage2KHR(device, *info, *image_index));
        if result return false;

    case .SUBOPTIMAL_KHR;
        ;
    case .SUCCESS;
        ;
    case;
        return false;
    }

    return true;
}
