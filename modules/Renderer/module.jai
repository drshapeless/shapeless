Renderer :: struct {
    instance: VkInstance;

    surface: VkSurfaceKHR;
    physical_device: VkPhysicalDevice;
    device: VkDevice;
    queue_indices:    Queue_Family_Indices;
    graphics_queue:   VkQueue;
    present_queue:    VkQueue;
    vma:              VmaAllocator;
    vka:              *VkAllocationCallbacks;

    max_sample_count: VkSampleCountFlags;
    sample_count:     VkSampleCountFlags;
    image_count: u32;

    command_pool: VkCommandPool;
    descriptor_set_layout: VkDescriptorSetLayout;

    // Synchronization
    max_frames_in_flight: u32;
    frame_syncs: [] Frame_Sync;
    frame_sync_index := 0;

    assets_directory: string;

    // Buffers that need to be destroyed are queued here to ensure that they are not
    // destroyed while being used for rendering
    buffers_queued_for_destruction: [] [..] Buffer;

    // Swapchain resources
    swapchain: Swapchain;
    swapchain_image_views: [] VkImageView;
    depth_image: Texture;
    // renderpass and framebuffer are no longer needed with dynamic
    // rendering
    command_buffers: [] VkCommandBuffer;
    image_fences_in_flight: [] VkFence;

    next_descriptor_pool_id: Descriptor_Pool.ID = 1;
    current_descriptor_pool_id: Descriptor_Pool.ID;
    descriptor_pools: Table(Descriptor_Pool.ID, Descriptor_Pool);

    next_pipeline_id: Pipeline.ID = 1;
    current_pipeline_id: Pipeline.ID;
    pipelines: Table(Pipeline.ID, Pipeline);

    Queue_Family_Indices :: struct {
        graphics: u32;
        present:  u32;
    }

    Swapchain :: struct {
        vk: VkSwapchainKHR;
        images: [] VkImage;
        format: VkFormat;
        extent: VkExtent2D;
    }

    Pipeline :: struct {
        ID :: #type,distinct u64;
        id: ID;
        vk: VkPipeline;
        layout: VkPipelineLayout;
    }

    Frame_Sync :: struct {
        image_available: VkSemaphore;
        render_finished: VkSemaphore;
        in_flight_fence: VkFence;
    }

    Buffer :: struct {
        vk:          VkBuffer;
        allocation:  VmaAllocation;
        size:        u64;
    }

    Mesh :: struct {
        vertex_buffer: Buffer;
        index_buffer:  Buffer;
    }

    Image :: struct {
        vk:         VkImage;
        allocation: VmaAllocation;
    }

    Texture :: struct {
        image:      Image;
        image_view: VkImageView;
        format:     VkFormat;
    }

    Descriptor_Pool :: struct {
        ID :: #type,distinct u64;
        id:              ID;
        vk:              VkDescriptorPool;
        allocated_count: int;
    }

    Model :: struct {
        mesh_key: string;
        pipeline_id: Pipeline.ID;
        descriptor_pool_id: Descriptor_Pool.ID;
        uniform_buffers: [] Buffer;
        descriptor_sets: [] VkDescriptorSet;
    }
}

// Stolen from JBlow's Vulkan_Renderer
// Generic api result logging helper, useful for Khronos apis
check_api_result :: (result: $Result, api: string, $call := #caller_code, loc := #caller_location) -> Result {
    call_string :: #run -> string {
        root := compiler_get_nodes(call);

        if root.kind == {
        case .PROCEDURE_CALL;
            proc_call := cast(*Code_Procedure_Call) root;
            expression := proc_call.arguments_sorted[0];

            if expression.kind != .PROCEDURE_CALL {
                return "";
            }

            call := cast(*Code_Procedure_Call) expression;
            if call.procedure_expression.kind != .IDENT {
                return "";
            }

            return (cast(*Code_Ident) call.procedure_expression).name;

        case .IDENT;
            return (cast(*Code_Ident) root).name;

        case;
            return "";
        }
    };

    if result != .SUCCESS {
        action := ifx call_string else api;

        result_string: string;
        {
            info := type_info(VkResult);
            for info.values {
                if xx result == it {
                    result_string = info.names[it_index];
                    break;
                }
            }
        }
        printed_result := ifx result_string
            then cast(Any) result_string
            else cast(Any) result;
        log_error("% '%' failed: %", api, action, printed_result, loc = loc);
        return result;
    }
    return .SUCCESS;
}

check_vk :: (result: VkResult, $call := #caller_code, loc := #caller_location) -> VkResult {
    return check_api_result(result, "Vulkan call", call, loc);
}

application_info :: VkApplicationInfo.{
    pApplicationName   = "Shapeless",
    applicationVersion = #run VK_MAKE_API_VERSION(0, 1, 0, 0),
    pEngineName        = "Shapeless Engine",
    engineVersion      = #run VK_MAKE_API_VERSION(0, 1, 0, 0),
    apiVersion         = VK_API_VERSION_1_4
};

validation_layers :: (*u8).["VK_LAYER_KHRONOS_validation"];

make_vk_instance_create_info :: (instance_extensions: [] *u8, enable_validation_layers: bool) -> VkInstanceCreateInfo {
    return .{
        pApplicationInfo = *application_info,
        enabledLayerCount = xx ifx enable_validation_layers then 1 else 0,
        ppEnabledLayerNames = ifx enable_validation_layers then validation_layers.data else null,
        enabledExtensionCount = xx instance_extensions.count,
        ppEnabledExtensionNames = instance_extensions.data
    };
}

make_vk_instance :: (instance_extensions: [] *u8, enable_validation_layers: bool, vka: *VkAllocationCallbacks = null) -> VkInstance, bool {
    instance_create_info := make_vk_instance_create_info(instance_extensions, enable_validation_layers);
    instance: VkInstance;
    result := check_vk(vkCreateInstance(*instance_create_info, vka, *instance));
    return instance, result == .SUCCESS;
}

max_supported_sample_count :: (physical_device: VkPhysicalDevice) -> VkSampleCountFlags {
    properties: VkPhysicalDeviceProperties;
    vkGetPhysicalDeviceProperties(physical_device, *properties);

    counts := properties.limits.framebufferColorSampleCounts
            & properties.limits.framebufferDepthSampleCounts;

    if counts & .e64 return .e64;
    if counts & .e32 return .e32;
    if counts & .e16 return .e16;
    if counts & .e8  return .e8;
    if counts & .e4  return .e4;
    if counts & .e2  return .e2;

    return .e1;
}

find_queue_families :: (physical_device: VkPhysicalDevice, surface: VkSurfaceKHR) -> Renderer.Queue_Family_Indices, bool {
    graphics := U32_MAX;
    present  := U32_MAX;

    queue_families_count: u32;
    vkGetPhysicalDeviceQueueFamilyProperties(physical_device, *queue_families_count, null);
    queue_families := NewArray(queue_families_count, VkQueueFamilyProperties, initialized = false,, temp);
    vkGetPhysicalDeviceQueueFamilyProperties(physical_device, *queue_families_count, queue_families.data);

    for queue_families {
        if it.queueFlags & .GRAPHICS {
            graphics = xx it_index;
        }

        if surface {
            supports_present: VkBool32;
            if check_vk(vkGetPhysicalDeviceSurfaceSupportKHR(physical_device, xx it_index, surface, *supports_present)) return .{}, false;
            if supports_present {
                present = xx it_index;
            }
        } else {
            present = xx it_index;
        }

        if graphics != U32_MAX && present != U32_MAX {
            return .{graphics = graphics, present = present}, true;
        }
    }

    return .{}, false;
}

make_vk_device_create_info :: (
    physical_device: VkPhysicalDevice,
    surface: VkSurfaceKHR,
    device_extensions: [] *u8,
    queue_indices: Renderer.Queue_Family_Indices,
    enable_validation_layers: bool
) -> VkDeviceCreateInfo {
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

    features13 := New(VkPhysicalDeviceVulkan13Features,, temp);
    features13.dynamicRendering = VK_TRUE;
    features13.synchronization2 = VK_TRUE;


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
        enabledLayerCount = xx ifx enable_validation_layers then validation_layers.count else 0,
        ppEnabledLayerNames = ifx enable_validation_layers then validation_layers.data else null,
        enabledExtensionCount = xx device_extensions.count,
        ppEnabledExtensionNames = device_extensions.data,
        pEnabledFeatures = null,
    };
}

// This will choose a physical device and create a logical device for you
make_renderer :: (
    instance: VkInstance,
    surface: VkSurfaceKHR,
    device_extensions: [] *u8,
    enable_validation_layers: bool,
    sample_count: VkSampleCountFlags = .e1,
    assets_directory := "",
    vka: *VkAllocationCallbacks = null
) -> Renderer, bool {
    all_device_extensions: [..] *u8;
    all_device_extensions.allocator = temp;
    array_add(*all_device_extensions, ..device_extensions);
    array_add(*all_device_extensions, VK_KHR_SWAPCHAIN_EXTENSION_NAME);

    physical_device, queue_indices := choose_physical_device(instance, surface, all_device_extensions);
    if !physical_device {
        log_error("Vulkan failed to find physical device");
        if surface vkDestroySurfaceKHR(instance, surface, vka);
        vkDestroyInstance(instance, vka);
        return .{}, false;
    }

    device_create_info := make_vk_device_create_info(
        physical_device,
        surface,
        all_device_extensions,
        queue_indices,
        enable_validation_layers = enable_validation_layers,
    );

    device: VkDevice;
    if check_vk(vkCreateDevice(physical_device, *device_create_info, vka, *device)) {
        if surface vkDestroySurfaceKHR(instance, surface, vka);
        vkDestroyInstance(instance, vka);
        return .{}, false;
    }

    // TODO: I think it is out of place to be here.
    vk_load_device_functions(device);

    renderer, success := make_renderer(
        instance,
        physical_device,
        device,
        queue_indices,
        surface,
        sample_count = sample_count,
        assets_directory = assets_directory,
        vka
    );
    return renderer, success;
}

make_renderer :: (
    instance: VkInstance,
    physical_device: VkPhysicalDevice,
    device: VkDevice,
    queue_indices: Renderer.Queue_Family_Indices,
    surface: VkSurfaceKHR,
    sample_count: VkSampleCountFlags = .e1,
    is_stereo := false,
    assets_directory := "",
    vka: *VkAllocationCallbacks = null
) -> Renderer, bool {
    max_sample_count := max_supported_sample_count(physical_device);

    assets := assets_directory;
    if !assets {
        assets = path_strip_filename(get_path_of_running_executable());
    }

    renderer := Renderer.{
        instance = instance,
        surface = surface,
        physical_device = physical_device,
        device = device,
        queue_indices = queue_indices,
        max_sample_count = max_sample_count,
        sample_count = min(sample_count, max_sample_count),
        assets_directory = copy_string(assets),
        vka = vka
    };

    result: VkResult;

    defer {
        if result deinit(*renderer);
    }

    vkGetDeviceQueue(device, queue_indices.graphics, 0, *renderer.graphics_queue);
    vkGetDeviceQueue(device, queue_indices.present, 0, *renderer.present_queue);

    renderer.vma, result = make_vma(instance, physical_device, device);
    if result return .{}, false;


    // TODO: A lot of things not implemented.

    // TODO: Swapchain here
    return renderer, true;
}

deinit :: (using renderer: *Renderer, check_for_memory_leaks := true) {
    if device vkDeviceWaitIdle(device);

    free(assets_directory);

    // for * models destroy_model_swapchain_resources(renderer, it);
    // deinit(*models);

    // for meshes destroy_mesh(renderer, it);
    // deinit(*meshes);

    // destroy_swapchain_resources(renderer);
    // vkDestroyDescriptorSetLayout(device, descriptor_set_layout, null);
    // destroy_frame_syncs(device, frame_syncs);
    // vkDestroyCommandPool(device, command_pool, null);

    if check_for_memory_leaks && vma {
        memory_stats: VmaTotalStatistics;
        vmaCalculateStatistics(vma, *memory_stats);
        if memory_stats.total.statistics.allocationCount > 0 {
            stats_string: *u8;
            vmaBuildStatsString(vma, *stats_string, detailedMap = VK_TRUE);
            log_error("Vulkan memory leaks, stats: %", to_string(stats_string));
            vmaFreeStatsString(vma, stats_string);
        }
    }

    vmaDestroyAllocator(vma);
    vkDestroyDevice(device, vka);

    if surface vkDestroySurfaceKHR(instance, surface, vka);

    vkDestroyInstance(instance, vka);
}

make_vma :: (instance: VkInstance, physical_device: VkPhysicalDevice, device: VkDevice) -> VmaAllocator, VkResult {
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
    return allocator, result;
}

make_command_pool :: (using renderer: *Renderer) -> VkCommandPool, VkResult {
    create_info := VkCommandPoolCreateInfo.{
        flags = .RESET_COMMAND_BUFFER,
        queueFamilyIndex = queue_indices.graphics
    };

    pool: VkCommandPool;
    result := check_vk(vkCreateCommandPool(device, *create_info, vka, *pool));
    return pool, result;
}

make_frame_syncs :: (using renderer: *Renderer) -> ([]Renderer.Frame_Sync, VkResult) {
    semaphore_info: VkSemaphoreCreateInfo;
    fence_info := VkFenceCreateInfo.{flags = .SIGNALED};

    syncs := NewArray(image_count, Frame_Sync, initialized = false);
    result: VkResult;

    defer {
        if result destroy_frame_syncs(renderer, syncs);
    }

    for * sync: syncs {
        result = check_vk(vkCreateSemaphore(device, *semaphore_info, vka, *sync.image_available));
        if result return syncs, result;

        result = check_vk(vkCreateSemaphore(device, *semaphore_info, vka, *sync.render_finished));
        if result return syncs, result;

        result = check_vk(vkCreateFence(device, *fence_info, vka, *sync.in_flight_fence));
        if result return syncs, result;
    }

    return syncs, .SUCCESS;
}

destroy_frame_syncs :: (using renderer: *Renderer, syncs: []Renderer.Frame_Sync) {
    for * sync: syncs {
        vkDestroySemaphore(device, sync.image_available, vka);
        vkDestroySemaphore(device, sync.render_finished, vka);
        vkDestroyFence(device, sync.in_flight_fence, vka);
    }

    array_free(syncs);
}

make_descriptor_set_layout :: (renderer: *Renderer) -> VkDescriptorSetLayout, VkResult {
    uniform_layout_binding := VkDescriptorSetLayoutBinding.{
        binding = 0,
        descriptorType = .UNIFORM_BUFFER,
        descriptorCount = 1,
        stageFlags = .VERTEX | .FRAGMENT
    };

    bindings := VkDescriptorSetLayoutBinding.[
        uniform_layout_binding,
        //sampler_layout_binding
    ];

    layout_info := VkDescriptorSetLayoutCreateInfo.{
        bindingCount = xx bindings.count,
        pBindings = bindings.data
    };

    layout: VkDescriptorSetLayout;
    result := check_vk(vkCreateDescriptorSetLayout(device, *layout_info, vka, *layout));
    return layout, result;
}

make_image_texture_sampler :: (renderer: *Renderer) -> VkSampler, VkResult {
    sampler_info := VkSamplerCreateInfo.{
        magFilter = .LINEAR,
        minFilter = .LINEAR,
        mipmapMode = .LINEAR,
        addressModeU = .REPEAT,
        addressModeV = .REPEAT,
        addressModeW = .REPEAT,
        mipLodBias = 0,
        anisotropyEnable = VK_TRUE,
        maxAnisotropy = 16,
        compareEnable = VK_FALSE,
        compareOp = .ALWAYS,
        minLod = 0,
        maxLod = VK_LOD_CLAMP_NONE,
        borderColor = .INT_OPAQUE_BLACK,
        unnormalizedCoordinates = VK_FALSE
    };

    sampler: VkSampler;
    result := check_vk(vkCreateSampler(device, *sampler_info, null, *sampler));
    return sampler, result;
}

resize_for_swapchain :: (renderer: *Renderer, array: *[] $T) {
    if array.count != renderer.swapchain.images.count {
        array_free(array.*);
        array.* = NewArray(renderer.swapchain.images.count, T);
    }
}

make_swapchain_resources :: (using renderer: *Renderer) -> VkResult {
    result: VkResult;
    assert(surface != NULL, "You don't have a surface yet");
    result = make_swapchain(renderer);
    if result return result;

    images := swapchain.images;
    assert(images.count > 0, "Swapchain should have images");

    resize_for_swapchain(renderer, *swapchain_image_views);

    for 0..images.count - 1 {
        view:, result = make_image_view(renderer, images[it], swapchain.format, .COLOR);
        if result return result;
        swapchain_image_views[it] = view;
    }

    resize_for_swapchain(renderer, *image_fences_in_flight);

    // TODO: implement multisample


}

make_swapchain :: (using renderer: *Renderer) -> VkResult {
    assert(surface != null);
    support := get_swapchain_support(physical_device, surface);

    format := support.formats[0];
    for support.formats {
        if it.format == .B8G8R8A8_UNORM && it.colorSpace == .SRGB_NONLINEAR {
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

    // renderer.image_count
    image_count = support.capabilities.minImageCount + 1;
    if swapchain_support.capabilities.maxImageCount > 0 && image_count > swapchain_support.capabilities.maxImageCount {
        image_count = swapchain_support.capabilities.maxImageCount;
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
        imageUsage = .COLOR_ATTACHMENT,
        imageSharingMode = ifx exclusive_queue then .EXCLUSIVE else .CONCURRENT,
        queueFamilyIndexCount = xx ifx exclusive_queue then 0 else 2,
        pQueueFamilyIndices = ifx exclusive_queue then queue_indices_array.data else null,
        preTransform = support.capabilities.currentTransform,
        compositeAlpha = .OPAQUE,
        presentMode = present_mode,
        clipped = VK_TRUE
    };

    swapchain = Renderer.Swapchain.{
        format = format.format,
        extent = extent
    };

    result := check_vk(vkCreateSwapchainKHR(device, *create_info, vka, *swapchain.vk));
    if result return result;

    swapchain_image_count: u32;
    result = check_vk(vkGetSwapchainImagesKHR(device, swapchain.vk, *swapchain_image_count, null));
    swapchain.images = NewArray(swapchain_image_count, VkImage, initialized = false);
    return check_vk(vkGetSwapchainImagesKHR(device, swapchain.vk, *swapchain_image_count, swapchain.images.data));
}

destroy_swapchain :: (using renderer: *Renderer) {
    vkDestroySwapchainKHR(device, swapchain.vk, vka);
    // TODO: Should I free the swapchain.images here?
    swapchain.vk = null;
}

make_image :: (
    renderer: *Renderer,
    extent: VkExtent2D,
    format: VkFormat,
    image_usage: VkImageUsageFlags,
    memory_usage: VmaMemoryUsage,
    tiling: VkImageTiling = .OPTIMAL,
    image_type := VkImageType.e2D,
    layer_count: u32 = 1,
    sample_count := VkSampleCountFlags.e1,
    mip_levels: u32 = 1
) -> Renderer.Image, VkResult {
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

    alloc_create_info := VmaAllocationCreateInfo.{
        usage = memory_usage,
        requiredFlags = .DEVICE_LOCAL, // TODO: Does this work?
    };

    image: VkImage;
    allocation: VmaAllocation;
    result := check_vk(vmaCreateImage(renderer.vma, *image_info, *alloc_create_info, *image, *allocation, null));
    return .{vk = image, allocation = allocation}, result;
}

make_image_view :: (renderer: *Renderer, image: VkImage, format: VkFormat, aspect_flags: VkImageAspectFlags, layer_count: u32 = 1, mip_levels: u32 = 1) -> VkImageView, VkResult {
    create_info := VkImageViewCreateInfo.{
        image = image,
        viewType = ifx layer_count > 1 then .e2D_ARRAY else .e2D,
        format = format,
        subresourceRange = .{
            aspectMask = aspect_flags,
            baseMipLevel = 0,
            levelCount = mip_levels,
            baseArrayLayer = 0,
            layerCount = layer_count
        }
    };

    view: VkImageView;
    result := check_vk(vkCreateImageView(device, *create_info, vka, *view));
    return view, result;
}

destroy_image :: (renderer: *Renderer, image: Renderer.Image) {
    vmaDestroyImage(renderer.vma, image.vk, image.allocation);
}

destroy_image_view :: (using renderer: *Renderer, image_view: VkImageView) {
    vkDestroyImageView(device, image_view, vka);
}

destroy_texture :: (using renderer: *Renderer, texture: Renderer.Texture) {
    destroy_image_view(renderer, texture.image_view);
    destroy_image(renderer, texture.image);
}

find_depth_format :: (physical_device: VkPhysicalDevice) -> VkFormat, bool {
    candidates := VkFormat.[
        .D24_UNORM_S8_UINT,
        .D32_SFLOAT_S8_UINT,
        .D32_SFLOAT
    ];

    for format: candidates {
        properties: VkFormatProperties;
        vkGetPhysicalDeviceFormatProperties(physical_device, format, *properties);
        if properties.optimalTilingFeatures & .DEPTH_STENCIL_ATTACHMENT {
            return format, true;
        }
    }

    return .UNDEFINED, false;
}

make_depth_image :: (using renderer: *Renderer) -> VkResult {
    format, found := find_depth_format(physical_device);

    image, result := make_image(
        vma,
        swapchain.extent,
        format,
        .DEPTH_STENCIL_ATTACHMENT,
        .GPU_ONLY,
    );
    if result return result;

    flags := VkImageAspectFlags.DEPTH;
    // TODO: Ignore stencil for now
    view:, result = make_image_view(device, image.vk, format, flags);
    if result destroy_image(vma, image);

    depth_image = .{image, view, format};
    return result;
}

make_command_buffers :: (using renderer: *Renderer) -> VkResult {
    resize_for_swapchain(renderer, *command_buffers);

    alloc_info := VkCommandBufferAllocateInfo.{
        commandPool = command_pool,
        level = .PRIMARY,
        commandBufferCount = xx swapchain.images.count
    };

    return check_vk(vkAllocateCommandBuffer(device, *alloc_info, command_buffers.data));
}

make_descriptor_pool :: (renderer: *Renderer, capacity: u32) -> VkDescriptorPool, VkResult {
    uniform_pool_size := VkDescriptorPoolSize.{
        type = .UNIFORM_BUFFER,
        descriptorCount = capacity
    };

    pool_sizes := VkDescriptorPoolSize.[ uniform_pool_size ];
    pool_info := VkDescriptorPoolCreateInfo.{
        maxSets = capacity,
        poolSizeCount = xx pool_sizes.count,
        pPoolSizes = pool_sizes.data
    };

    pool: VkDescriptorPool;
    result := check_vk(vkCreateDescriptorPool(device, *pool_info, vka, *pool));
    return pool, result;
}

access_descriptor_pool :: (using renderer: *Renderer) -> *Renderer.Descriptor_Pool, VkResult {
    pool_capacity := swapchain.images.count * 1024;

    if current_descriptor_pool_id {
        pool := table_find_pointer(*descriptor_pools, current_descriptor_pool_id);
        if pool.allocated_count < pool_capacity {
            return pool, .SUCCESS;
        }
    }

    for * descriptor_pools {
        if it.allocated_count < pool_capacity {
            current_descriptor_pool_id = it.id;
            return it, .SUCCESS;
        }
    }

    pool, result := make_descriptor_pool(device, pool_capacity);
    if result return null, result;

    id := next_descriptor_pool_id;
    next_descriptor_pool_id += 1;

    return table_add(*descriptor_pools, key = id, value = .{id = id, vk = pool}), .SUCCESS;
}

make_shader_module :: (using renderer: *Renderer, name: string) -> VkShaderModule, VkResult {
    file := tprint("%/shaders/%", assets_directory, name);

    shader_code := read_entire_file(file);
    defer free(shader_code);

    create_info := VkShaderModuleCreateInfo.{
        codeSize = xx shader_code.count,
        pCode = cast(*u32) shader_code.data
    };

    module: VkShaderModule;
    result := check_vk(vkCreateShaderModule(device, *create_info, vka, *module));
    return module, result;
}

#scope_file
// Helpers

choose_physical_device :: (instance: VkInstance, surface: VkSurfaceKHR, device_extensions: [] *u8) -> VkPhysicalDevice, Renderer.Queue_Family_Indices {
    device_count: u32;
    if check_vk(vkEnumeratePhysicalDevices(instance, *device_count, null)) return null, .{};
    devices := NewArray(device_count, VkPhysicalDevice, initialized = false,, temp);
    if check_vk(vkEnumeratePhysicalDevices(instance, *device_count, devices.data))  return null, .{};

    best_score := 0;
    best_device: VkPhysicalDevice;
    best_device_queue_families: Renderer.Queue_Family_Indices;
    for device: devices {
        // Make sure the device has necessary queue families and supports required extensions
        queue_families, found := find_queue_families(device, surface);
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

Swapchain_Support :: struct {
    capabilities: VkSurfaceCapabilitiesKHR;
    formats: [] VkSurfaceFormatKHR;
    present_modes: [] VkPresentModeKHR;
}

get_swapchain_support :: (physical_device: VkPhysicalDevice, surface: VkSurfaceKHR) -> Swapchain_Support {
    assert(surface != null);

    capabilities: VkSurfaceCapabilitiesKHR;
    if check_vk(vkGetPhysicalDeviceSurfaceCapabilitiesKHR(physical_device, surface, *capabilities)) return .{};

    format_count: u32;
    if check_vk(vkGetPhysicalDeviceSurfaceFormatsKHR(physical_device, surface, *format_count, null)) return .{};
    formats := NewArray(format_count, VkSurfaceFormatKHR, initialized = false,, temp);
    if check_vk(vkGetPhysicalDeviceSurfaceFormatsKHR(physical_device, surface, *format_count, formats.data)) return .{};

    present_mode_count: u32;
    if check_vk(vkGetPhysicalDeviceSurfacePresentModesKHR(physical_device, surface, *present_mode_count, null)) return .{};
    present_modes := NewArray(present_mode_count, VkPresentModeKHR, initialized = false,, temp);
    if check_vk(vkGetPhysicalDeviceSurfacePresentModesKHR(physical_device, surface, *present_mode_count, present_modes.data)) return .{};

    return .{
        capabilities = capabilities,
        formats = formats,
        present_modes = present_modes
    };
}

device_supports_extensions :: (physical_device: VkPhysicalDevice, extensions: [] *u8) -> bool {
    available_extension_count: u32;
    if check_vk(vkEnumerateDeviceExtensionProperties(physical_device, null, *available_extension_count, null)) return false;
    available_extensions := NewArray(available_extension_count, VkExtensionProperties, false,, temp);

    if check_vk(vkEnumerateDeviceExtensionProperties(physical_device, null, *available_extension_count, available_extensions.data)) return false;

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

#import "Vulkan";
#import "Vulkan_Memory_Allocator";
#import "Basic";
#import "String";
#import "Math";
#import "Compiler";
#import "System";
#import "Hash_Table";
