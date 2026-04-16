#module_parameters(
    MOLTENVK := false,
    VALIDATION  := false
);

APPLICATION_VERSION :: #run VK_MAKE_VERSION(0, 1, 0);
ENGINE_VERSION :: #run VK_MAKE_VERSION(0, 1, 0);

DEVICE_EXTENSIONS :: (*u8).[
VK_EXT_SHADER_OBJECT_EXTENSION_NAME
];

// I am lazy
Result :: VkResult;
Format :: VkFormat;

// This name is so cursed.
Pointer :: VkDeviceMemory;
u32x3 :: VkExtent3D;
Usage_Flags :: VkImageUsageFlags;

Memory_Type :: enum {
    DEFAULT; // This is rebar
    GPU;
    READBACK;
}

Allocation :: struct {
    memory_type: Memory_Type;
    memory:      VkDeviceMemory;
    size:        u64;
    offset:      u64;
}

// This has nothing to do with Allocation, this is a handy function to
// store the user allocation informations
Allocation_Info :: struct {
    size: u64;
    alignment: u64;
}

GPU_Pool :: struct {
    allocation:       Allocation;
    cpu:              *void;
    gpu:              Pointer;
    current_position: u64;
    bytes_left:       u64;

    initialized := false;

    DEFAULT_SIZE :: 256 * 1024 * 1024; // 256MB
}

Queue_Type :: enum {
    GRAPHICS;
    COMPUTE;
}

// I think I made some mistake, this does not seem right
Queue :: struct {
    vk: VkQueue;
    index: u32;
}

Command_Buffer :: struct {
    vk: VkCommandBuffer;
}

Texture_Type :: VkImageViewType;

Texture_Description :: struct {
    type:         Texture_Type;
    format:       Format;
    dimensions:   u32x3;
    mip_count:    u32 = 1;
    layer_count:  u32 = 1;
    sample_count: u32 = 1;
    usage:        Usage_Flags;
}

Texture_Size_Alignment :: struct {
    size: u64;
    align: u64;
}

View_Description :: struct {
    format:       Format;
    base_mip:     u8 = 0;
    mip_count:    u8 = ALL_MIPS;
    base_layer:   u16 = 0;
    layer_count:  u16 = ALL_LAYERS;

    ALL_MIPS ::   ~cast(u8)0;
    ALL_LAYERS :: ~cast(u16)0;
}

GPU_Context :: struct {
    vka:                          *VkAllocationCallbacks;
    instance:                     VkInstance;
    physical_device:              VkPhysicalDevice;
    physical_device_properties:   VkPhysicalDeviceProperties2;
    device:                       VkDevice;
    debug_messenger:              VkDebugUtilsMessengerEXT;
    graphics_queue:               Queue;
    compute_queue:                Queue;
    graphics_command_pool:        VkCommandPool;
    compute_command_pool:         VkCommandPool;
    // Even if we just have one queue, we still have two command pools.

    // Memory related
    default_memory_index:  u32 = U32_MAX;
    gpu_memory_index:      u32 = U32_MAX;
    readback_memory_index: u32 = U32_MAX;
}

#add_context gpu_context: GPU_Context;

init :: () -> bool {
    using ctx := *context.gpu_context;
    get_instance_proc_addr := SDL_Vulkan_GetVkGetInstanceProcAddr();
    assert(get_instance_proc_addr != null);
    vk_load_global_functions(xx get_instance_proc_addr);

    result: Result;
    result = make_instance(ctx);
    if result return false;

    // TODO: should free the instance here when failed.
    result = make_device(ctx);
    if result return false;

    get_memory_indices(ctx);

    make_command_pools(ctx);

    return true;
}

deinit :: () {
    using context.gpu_context;

    if graphics_command_pool {
        vkDestroyCommandPool(device, graphics_command_pool, vka);
    }
    if compute_command_pool {
        vkDestroyCommandPool(device, compute_command_pool, vka);
    }
    if device {
        vkDestroyDevice(device, vka);
    }
    if debug_messenger {
        vkDestroyDebugUtilsMessengerEXT(instance, debug_messenger, vka);
    }
    if instance {
        vkDestroyInstance(instance, vka);
    }
}

//// Memory

// internal_allocate is for initializing memory_pool, you should not
// call it directly.
internal_allocate :: (size: u64, memory_type: Memory_Type = .DEFAULT) -> Allocation {
    using context.gpu_context;
    allocation: Allocation;
    result: VkResult;

    memory_allocate_flags_info := VkMemoryAllocateFlagsInfo.{
        flags = .DEVICE_ADDRESS
    };

    memory_allocate_info := VkMemoryAllocateInfo.{
        pNext = ifx memory_type == .DEFAULT then *memory_allocate_flags_info else null,
        allocationSize = size,
        memoryTypeIndex = memory_type_to_index(ctx, memory_type),
    };

    allocation.memory_type = memory_type;
    allocation.size = size;
    allocation.offset = 0;
    result: VkResult;
    result = check_vk(vkAllocateMemory(device, *memory_allocate_info, vka, *allocation.memory));
    assert(result == .SUCCESS);

    return allocation;
}

free :: (allocation: Allocation) {
    using context.gpu_context;
    if allocation.memory {
        vkFreeMemory(device, buffer.memory, vka);
    }
}

allocate :: (pool: *GPU_Pool, size: u64, alignment: u64 = 16) -> cpu:*void, gpu:Pointer {
    using context.gpu_context;
    if !pool.initialized {
        init(pool, GPU_Pool.DEFAULT_SIZE);
    }
    real_size := size;
    real_alignment := alignment;
    if buffer.memory_type != .GPU {
        // After some research, stating TRANSFER_SRC and TRANSFER_DST
        // on every buffer creation have almost no performance
        // difference. Nvidia does not care, AMD does not care since
        // RDNA2, Apple uses unified memory.
        buffer_create_info := VkBufferCreateInfo.{
            size = size,
            usage = .STORAGE_BUFFER | .SHADER_DEVICE_ADDRESS | .TRANSFER_SRC | .TRANSFER_DST,
            sharingMode = .EXCLUSIVE
        };

        query_info := VkDeviceBufferMemoryRequirements.{
            pCreateInfo = *buffer_create_info,
        };

        memory_requirements: VkMemoryRequirements2;

        vkGetDeviceBufferMemoryRequirements(device, *query_info, *memory_requirements);

        real_size = memory_requirements.memoryRequirements.size;
        real_alignment = memory_requirements.memoryRequirements.alignment;
    }

    mask := real_alignment - 1;
    padding := (real_alignment - (pool.current_position & mask)) & mask;
    increment := real_size + padding;
    assert(pool.bytes_left >= increment, "GPU pool out of memory");

    pool.current_position += increment;
    pool.bytes_left -= increment;

    real_offset := pool.current_position + padding;

    if pool.cpu == null {
        return null, pool.gpu + real_offset;
    }

    return pool.cpu + real_offset, pool.gpu + real_offset;
}

// The way it works is by creating a dummy buffer, get the
// mapped_pointer and BDA, then immediately destroy it. So as long as
// this memory is not free, those pointer would still be usable.
init :: (pool: *GPU_Pool, default_size: u64, memory_type: Memory_Type = .DEFAULT) {
    using context.gpu_context;
    if pool.initialized return;
    allocation = internal_allocate(ctx, size, memory_type);

    dummy_buffer: VkBuffer;
    buffer_create_info := VkBufferCreateInfo.{
        size = size,
        usage = .STORAGE_BUFFER | .SHADER_DEVICE_ADDRESS | .TRANSFER_SRC | .TRANSFER_DST,
        sharingMode = .EXCLUSIVE
    };
    result = check_vk(vkCreateBuffer(device, *buffer_create_info, vka, *buffer.vk));
    assert(result == .SUCCESS);
    defer vkDestroyBuffer(device, dummy_buffer, vka);

    // Here we don't care about the memory requirements, since the
    // memory allocated by vkAllocateMemory always fit the strictest
    // alignment requirement.

    if memory_type != .GPU {
        result = check_vk(vkMapMemory(device, allocation.memory, 0, allocation.size, 0, *pool.cpu));
        assert(result == .SUCCESS);
    }

    result = check_vk(vkBindBufferMemory(device, dummy_buffer, allocation.memory, 0));
    assert(result == .SUCCESS);

    buffer_device_address_info := VkBufferDeviceAddressInfo.{
        buffer = dummy_buffer
    };
    pool.gpu = vkGetBufferDeviceAddress(device, *buffer_device_address_info);

    pool.allocation = allocation;
    pool.current_position = 0;
    pool.bytes_left = buffer.size;
}

reset :: (pool: *GPU_Pool) {
    using context.gpu_context;
    pool.current_position = 0;
    pool.bytes_left = pool.buffer.size;
}

deinit :: (pool: GPU_Pool) {
    using context.gpu_context;
    free(pool.allocation);
}

make_queue :: (queue_type: Queue_Type) -> Queue {
    using context.gpu_context;
    queue: Queue;
    if queue_type == {
    case .GRAPHICS;
        queue = graphics_queue;
    case .COMPUTE;
        queue = compute_queue;
    }
    return queue;
}

start_command_recording :: (queue: Queue) -> Command_Buffer {
    using context.gpu_context;
    command_buffer_allocate_info := VkCommandBufferAllocateInfo.{
        commandPool = ifx queue.vk == graphics_queue.vk then graphics_command_pool else compute_command_pool,
        commandBufferCount = 1,
        level = .PRIMARY,
    };
    command_buffer: Command_Buffer;
    result: VkResult;
    result = check_vk(vkAllocateCommandBuffers(device, *command_buffer_allocate_info, *command_buffer.vk));
    assert(result == .SUCCESS);

    command_buffer_begin_info := VkCommandBufferBeginInfo.{
        flags = .ONE_TIME_SUBMIT,
    };
    result = check_vk(vkBeginCommandBuffer(command_buffer.vk, *command_buffer_begin_info));
    assert(result == .SUCCESS);

    return command_buffer;
}

submit :: (queue: Queue, command_buffers: []Command_Buffer) {
    using context.gpu_context;
    auto_release_temp();
    push_allocator(temp);

    result: VkResult;
    for command_buffers {
        result = check_vk(vkEndCommandBuffer(it.vk));
        assert(result == .SUCCESS);
    }

    command_buffer_infos := NewArray(command_buffer.count, VkCommandBufferSubmitInfo);
    for * command_buffer_infos {
        it.commandBuffer = command_buffers[it_index];
    }

    submit_info := VkSubmitInfo2.{
        commandBufferInfoCount = xx command_buffer_infos.count,
        pCommandBufferInfos = command_buffer_infos.data,
    };

    result = check_vk(vkQueueSubmit2(queue.vk, 1, *submit_info, null));
    assert(result == .SUCCESS);

    result = vkQueueWaitIdle(queue.vk);
    assert(result == .SUCCESS);

    result = vkResetCommandPool(device, ifx queue.vk == graphics_queue.vk then graphics_command_pool else compute_command_pool, 0);
    assert(result == .SUCCESS);
}

// GpuTextureSizeAlign gpuTextureSizeAlign(GpuTextureDesc desc);
//
// The original proposed name is fucked up, why would you call a
// function just like its return type.
get_texture_size_alignment :: (description: Texture_Description) -> Texture_Size_Alignment {
    using context.gpu_context;
    image_create_info := VkImageCreateInfo.{
        imageType     = texture_type_to_image_type(description.type),
        format        = description.format,
        extent        = description.dimensions,
        mipLevels     = description.mip_count,
        arrayLayers   = description.layer_count,
        samples       = description.sample_count,
        tiling        = .OPTIMAL,
        usage         = description.usage,
        sharingMode   = .EXCLUSIVE,
        initialLayout = .UNDEFINED
    };

    query_info := VkDeviceImageMemoryRequirements.{
        pCreateInfo = *image_create_info,
        planeAspect = .NONE // WTF is this
    };

    memory_requirements: VkMemoryRequirements2;
    vkGetDeviceImageMemoryRequirements(device, *query_info, *memory_requirements);

    return .{memory_requirements.memoryRequirements.size, memory_requirements.memoryRequirements.alignment};
}

#scope_module
return_if_error :: (result: VkResult) #expand {
    if result != .SUCCESS {
        `return result;
    }
}

make_instance :: (using ctx: *GPU_Context) -> Result {
    auto_release_temp();
    push_allocator(temp);

    result: VkResult;

    extensions: [..] *u8;
    #if OS == .MACOS && MOLTENVK {
        array_add(*extensions, VK_KHR_PORTABILITY_ENUMERATION_EXTENSION_NAME);
    }

    #if VALIDATION {
        array_add(*extensions, VK_EXT_DEBUG_UTILS_EXTENSION_NAME);
        array_add(*extensions, VK_EXT_DEBUG_REPORT_EXTENSION_NAME);
    }

    {
        result, available_extensions := vkEnumerateInstanceExtensionProperties(null);

        for extension: extensions {
            found := false;
            for available: available_extensions {
                if to_string(extension) == to_string(available.extensionName) {
                    found = true;
                    break available;
                }
            }

            if !found {
                return .ERROR_EXTENSION_NOT_PRESENT;
            }
        }
    }

    application_info := VkApplicationInfo.{
        pApplicationName   = "shapeless",
        applicationVersion = APPLICATION_VERSION,
        pEngineName        = "shapeless",
        engineVersion      = ENGINE_VERSION,
        apiVersion         = VK_API_VERSION_1_3
    };

    instance_create_info := VkInstanceCreateInfo.{
        pApplicationInfo        = *application_info,
        enabledExtensionCount   = extensions.count.(u32),
        ppEnabledExtensionNames = extensions.data
    };

    enabled_layers: [..] *u8;
    #if OS == .MACOS {
        // Both MoltenVK and KosmicKrisp use a layer to emulate shader object
        array_add(*enabled_layers, "VK_LAYER_KHRONOS_shader_object");
    }

    #if VALIDATION {
        array_add(*enabled_layers, "VK_LAYER_KHRONOS_validation");

        enabled_validation_features := VkValidationFeatureEnableEXT.[
        .SYNCHRONIZATION_VALIDATION
        ];

        validation_features := VkValidationFeaturesEXT.{
            enabledValidationFeatureCount = xx enabled_validation_features.count,
            pEnabledValidationFeatures = enabled_validation_features.data
        };
        debug_utils_messenger_create_info := VkDebugUtilsMessengerCreateInfoEXT.{
            messageSeverity = .VERBOSE | .INFO | .WARNING | .ERROR,
            messageType = .GENERAL | .VALIDATION | .PERFORMANCE,
            pfnUserCallback = debug_utils_messenger_callback,
            pNext = *validation_features
        };

        instance_create_info.pNext = *debug_utils_messenger_create_info;
    }

    #if OS == .MACOS && MOLTENVK {
        instance_create_info.flags |= .ENUMERATE_PORTABILITY_KHR;
    }

    instance_create_info.enabledLayerCount = xx enabled_layers.count;
    instance_create_info.ppEnabledLayerNames = enabled_layers.data;

    result = check_vk(vkCreateInstance(*instance_create_info, vka, *instance));
    return_if_error(result);

    vk_load_instance_functions(instance);

    #if VALIDATION {
        result = check_vk(vkCreateDebugUtilsMessengerEXT(instance, *debug_utils_messenger_create_info, vka, *debug_messenger));
        return_if_error(result);
    }

    return .SUCCESS;
}

make_device :: (using ctx: *GPU_Context) -> Result {
    auto_release_temp();
    push_allocator(temp);

    extensions: [..]*u8;
    array_add(*extensions, ..DEVICE_EXTENSIONS);

    #if OS == .MACOS && MOLTENVK {
        array_add(*extensions, VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME);
    }

    choose_physical_device(ctx, extensions);

    graphics_index, compute_index := get_queue_family_indices(ctx);
    queue_count := ifx graphics_index == compute_index then 1 else 2;
    queue_create_infos := NewArray(queue_count, VkDeviceQueueCreateInfo);
    queue_priority: float = 1.0;
    if graphics_index == compute_index {
        queue_create_infos[0] = .{
            queueFamilyIndex = graphics_index,
            queueCount = 1,
            pQueuePriorities = *queue_priority
        };
    } else {
        queue_create_infos[0] = .{
            queueFamilyIndex = graphics_index,
            queueCount = 1,
            pQueuePriorities = *queue_priority
        };
        queue_create_infos[1] = .{
            queueFamilyIndex = compute_index,
            queueCount = 1,
            pQueuePriorities = *queue_priority
        };
    }

    chain: *void;
    features_shader_object := VkPhysicalDeviceShaderObjectFeaturesEXT.{
        shaderObject = VK_TRUE
    };
    chain = *features_shader_object;
    features_13 := VkPhysicalDeviceVulkan13Features.{
        pNext = chain,
        dynamicRendering = VK_TRUE,
        synchronization2 = VK_TRUE,
        maintenance4     = VK_TRUE
    };
    chain = *features_13;
    features_12 := VkPhysicalDeviceVulkan12Features.{
        pNext = chain,
        bufferDeviceAddress                           = VK_TRUE,
        descriptorIndexing                            = VK_TRUE,
        scalarBlockLayout                             = VK_TRUE,
        runtimeDescriptorArray                        = VK_TRUE,
        descriptorBindingVariableDescriptorCount      = VK_TRUE,
        descriptorBindingStorageBufferUpdateAfterBind = VK_TRUE,
        shaderInt8                                    = VK_TRUE,
        timelineSemaphore                             = VK_TRUE
    };
    chain = *features_12;
    features_11 := VkPhysicalDeviceVulkan11Features.{
        pNext = chain,
        // This extension is necessary because how slang shader
        // compute SV_VertexID and SV_InstanceID
        shaderDrawParameters = VK_TRUE
    };
    chain = *features_11;
    features := VkPhysicalDeviceFeatures2.{
        pNext = chain,
        features = .{
            samplerAnisotropy = VK_TRUE,
            shaderInt64      = VK_TRUE // For pointer math inside shader
        }
    };

    device_create_info := VkDeviceCreateInfo.{
        pNext = *features,
        queueCreateInfoCount = xx queue_count,
        pQueueCreateInfos = queue_create_infos.data,
        enabledExtensionCount = xx extensions.count,
        ppEnabledExtensionNames = extensions.data,
    };

    result := check_vk(vkCreateDevice(physical_device, *device_create_info, vka, *device));
    return_if_error(result);

    vk_load_device_functions(device);

    // TODO: not very clean to put it here, but I don't want to query
    // the family indices again.
    vkGetDeviceQueue(device, graphics_index, 0, *graphics_queue.vk);
    graphics_queue.index = graphics_index;
    #if OS == .MACOS {
        compute_queue = graphics_queue;
    } else {
        vkGetDeviceQueue(device, compute_index,  0, *compute_queue.vk);
        compute_queue.index = compute_index;
    }
    return .SUCCESS;
}

choose_physical_device :: (using ctx: *GPU_Context, extensions: []*u8) -> Result {
    result: VkResult;
    // pick physical device
    result=, physical_devices := vkEnumeratePhysicalDevices(instance);
    return_if_error(result);

    device_scores := NewArray(physical_devices.count, s64);

    if physical_devices.count == 0 {
        log("There is no GPU");
        return .ERROR_UNKNOWN;
    }

    for pd: physical_devices {
        physical_device_properties_12: VkPhysicalDeviceVulkan12Properties;
        physical_device_properties: VkPhysicalDeviceProperties2;
        physical_device_properties.pNext = *physical_device_properties_12;
        vkGetPhysicalDeviceProperties2(pd, *physical_device_properties);

        #if OS == .MACOS {
            #if MOLTENVK {
                if physical_device_properties_12.driverID == .MOLTENVK {
                    device_scores[it_index] += 1000;
                }
            } else {
                if physical_device_properties_12.driverID == .MESA_KOSMICKRISP {
                    device_scores[it_index] += 1000;
                }
            }
            continue;
        }
        physical_device_features: VkPhysicalDeviceFeatures2;
        vkGetPhysicalDeviceFeatures2(pd, *physical_device_features);

        is_required_extensions_supported := true;
        result=, available_extensions := vkEnumerateDeviceExtensionProperties(pd, null);
        return_if_error(result);

        for e: extensions {
            extension_name := to_string(e);
            found := false;
            for ae: available_extensions {
                if to_string(ae.extensionName) == extension_name {
                    found = true;
                    break;
                }
            }
            if !found {
                is_required_extensions_supported = false;
                break;
            }
        }

        if !is_required_extensions_supported {
            continue;
        }

        if physical_device_properties.properties.deviceType == {
        case  .DISCRETE_GPU;
            device_scores[it_index] += 1000;
        case .VIRTUAL_GPU;
            device_scores[it_index] += 100;
        case .INTEGRATED_GPU;
            device_scores[it_index] += 10;
        }
    }

    best_device_index := 0;
    best_score := 0;
    for device_scores {
        if it > best_score {
            best_score = it;
            best_device_index = it_index;
        }
    }

    if best_score == 0 {
        assert(false, "There is no suitable gpu");
    }

    physical_device = physical_devices[best_device_index];
    vkGetPhysicalDeviceProperties2(physical_device, *physical_device_properties);

    return result;
}

get_queue_family_indices :: (using ctx: *GPU_Context) -> graphics:u32, compute:u32 {
    // I am not sure whether separating queues matters. On M-series
    // mac, the vulkan implementation lists 4 queues, but in reality,
    // there is only one queue. It is the same case in Intel. The only
    // useful hardware is my AMD GPU which has a non-graphics compute
    // queue. And there is no pure transfer queue anymore. So for any
    // transfer, use the graphics queue.
    graphics_queue_family_index := U32_MAX;
    compute_queue_family_index  := U32_MAX;

    #if OS == .MACOS {
        // On macOS, just use the first.
        graphics_queue_family_index = 0;
        compute_queue_family_index  = 0;
    } else {
        // This assumes the graphics queue supports present, which is most
        // of the case in modern hardware.
        queue_families := vkGetPhysicalDeviceQueueFamilyProperties(physical_device);
        for queue_families {
            if it.queueFlags & .GRAPHICS {
                graphics_queue_family_index = xx it_index;
                continue;
            }

            if !(it.queueFlags & .GRAPHICS) && it.queueFlags & .COMPUTE {
                compute_queue_family_index = xx it_index;
                continue;
            }
        }

        if graphics_queue_family_index == U32_MAX {
            assert(false, "There is no graphics queue in this hardware");
        }

        if compute_queue_family_index == U32_MAX {
            compute_queue_family_index = graphics_queue_family_index;
        }
    }
    return graphics_queue_family_index, compute_queue_family_index;
}

get_vk_instance_extensions :: () -> []*u8 {
    count: u32;
    data := SDL_Vulkan_GetInstanceExtensions(*count);

    extensions: []*u8;
    extensions.count = xx count;
    extensions.data = data;

    return extensions;
}

#if VALIDATION {
    debug_utils_messenger_callback :: (messageSeverity: VkDebugUtilsMessageSeverityFlagBitsEXT, messageTypes: VkDebugUtilsMessageTypeFlagsEXT, pCallbackData: *VkDebugUtilsMessengerCallbackDataEXT, pUserData: *void) -> VkBool32 #c_call {
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
}

get_memory_indices :: (using ctx: *GPU_Context) {
    #if OS == .MACOS {
        // There is only a big chunk of unified memory
        default_memory_index = 0;
        gpu_memory_index = 0;
        readback_memory_index = 0;
        return;
    }

    properties: VkPhysicalDeviceMemoryProperties;
    vkGetPhysicalDeviceMemoryProperties(physical_device, *properties);

    DEFAULT_FLAG: VkMemoryPropertyFlags: .DEVICE_LOCAL | .HOST_VISIBLE | .HOST_COHERENT;
    READBACK_FLAG: VkMemoryPropertyFlags: .HOST_VISIBLE | .HOST_COHERENT | .HOST_CACHED;

    for i: 0..properties.memoryTypeCount - 1 {
        flags := properties.memoryTypes[i].propertyFlags;

        if flags & DEFAULT_FLAG == DEFAULT_FLAG {
            if default_memory_index == U32_MAX default_memory_index = i;
        }

        if flags & .DEVICE_LOCAL == .DEVICE_LOCAL && flags & .HOST_VISIBLE == 0 {
            if gpu_memory_index == U32_MAX gpu_memory_index = i;
        }

        if flags & READBACK_FLAG == READBACK_FLAG {
            if readback_memory_index == U32_MAX readback_memory_index = i;
        }

        if default_memory_index != U32_MAX && gpu_memory_index != U32_MAX && readback_memory_index != U32_MAX {
            break;
        }
    }
}

memory_type_to_index :: (using ctx: *GPU_Context, memory_type: Memory_Type) -> u32 {
    index: u32;
    if memory_type == {
    case .DEFAULT;
        index = default_memory_index;
    case .GPU;
        index = gpu_memory_index;
    case .READBACK;
        index = readback_memory_index;
    case;
        assert(false, "Unexpected memory type");
    }

    return index;
}

make_command_pools :: (using ctx: *GPU_Context) {
    create_info := VkCommandPoolCreateInfo.{
        flags = .TRANSIENT | .RESET_COMMAND_BUFFER,
        queueFamilyIndex = graphics_queue.index
    };
    result: VkResult;
    result = check_vk(vkCreateCommandPool(device, *create_info, vka, *graphics_command_pool));
    assert(result == .SUCCESS);

    create_info.queueFamilyIndex = compute_queue.index;
    result = check_vk(vkCreateCommandPool(device, *create_info, vka, *compute_command_pool));
    assert(result == .SUCCESS);
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

texture_type_to_image_type :: (texture_type: Texture_Type) -> VkImageType {
    assert(texture_type < 3, "Invalid texture type");

    return cast(VkImageType) texture_type;
}

#import "Vulkan";
#import "SDL3";
#import "Basic";
#import "Math";
#import "Compiler";
