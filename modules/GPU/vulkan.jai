GPU_Context :: struct {
    sdl_window: *SDL_Window;
    instance: VkInstance;
    device: VkDevice;
    vka: *VkAllocationCallbacks;
    surface: VkSurfaceKHR;
    queue_family_indices: Queue_Family_Indices;
    physical_device: VkPhysicalDevice;
    memory_indices: Memory_Indices;
    main_queue: VkQueue;
    command_pools: [5]VkCommandPool;
    current_command_pool_index := 0;
    pipeline_layout: VkPipelineLayout;
}

Allocation :: struct {
    cpu: *void;
    gpu: u64;
    offset: u64;

    // The following fields are implementation specific
    memory: VkDeviceMemory;
    buffer: VkBuffer; // Keeping a mapped buffer here makes copying much easier
}

Texture :: struct {
    image: VkImage;
    view: VkImageView;
}

Pipeline :: struct {
    // At most we can have two shaders in a pipeline
    // For compute shader, only the first is useful
    shaders: [2]VkShaderEXT;
    is_compute: bool;
}

Queue :: struct {
    type: Queue_Type;
    vk: VkQueue;
}

Command_Buffer :: struct {
    #as vk: VkCommandBuffer;
}

Semaphore :: struct {
    #as vk: VkSemaphore;
}

init :: (window: *SDL_Window = null) {
    context.gpu_context = Basic.alloc(size_of(GPU_Context));
    using context.gpu_context;
    get_instance_proc_addr := SDL_Vulkan_GetVkGetInstanceProcAddr();
    Basic.assert(get_instance_proc_addr != null);

    vk_load_global_functions(xx get_instance_proc_addr);

    result: VkResult;
    result, instance = make_instance();

    vk_load_instance_functions(instance);

    device_extensions: [..] *u8;
    device_extensions.allocator = Basic.temp;
    Basic.array_add(*device_extensions, ..DEVICE_EXTENSIONS);
    if window {
        sdl_window = window;
        ok := SDL_Vulkan_CreateSurface(window, instance, vka, *surface);
        Basic.assert(ok);
        Basic.array_add(*device_extensions, VK_KHR_SWAPCHAIN_EXTENSION_NAME);
    }

    physical_device, queue_family_indices = choose_physical_device(instance, surface, device_extensions);
    if !physical_device {
        Basic.log_error("Vulkan failed to find physical device");
        deinit();
        return;
    }

    result, device = make_device(device_extensions);
    if result {
        Basic.log_error("Vulkan failed to create device");
        deinit();
        return;
    }
    vk_load_device_functions(device);

    memory_indices = get_memory_indices();

    vkGetDeviceQueue(device, queue_family_indices.graphics, 0, *main_queue);

    command_pool_create_info := VkCommandPoolCreateInfo.{
        // flags = .RESET_COMMAND_BUFFER,
        queueFamilyIndex = queue_family_indices.graphics,
    };

    for command_pools {
        result = check_vk(vkCreateCommandPool(device, *command_pool_create_info, vka, *command_pools[it_index]));
        assert_vk_result(result);
    }

    pipeline_layout_create_info := VkPipelineLayoutCreateInfo.{
        pushConstantRangeCount = 1,
        pPushConstantRanges = *PUSH_CONSTANT_RANGE,
    };

    result = check_vk(vkCreatePipelineLayout(device, *pipeline_layout_create_info, vka, *pipeline_layout));
    assert_vk_result(result);
}

deinit :: () {
    using context.gpu_context;
    result: VkResult;
    result = vkDeviceWaitIdle(device);
    assert_vk_result(result);

    if pipeline_layout {
        vkDestroyPipelineLayout(device, pipeline_layout, vka);
    }

    for command_pools {
        if it vkDestroyCommandPool(device, it, vka);
    }

    if device {
        vkDestroyDevice(device, vka);
    }

    if surface {
        SDL_Vulkan_DestroySurface(instance, surface, vka);
    }

    if instance {
        vkDestroyInstance(instance, vka);
    }
    Basic.free(context.gpu_context);
}

// This only allocates shared memory (rebar).
alloc :: (bytes: u64) -> Allocation {
    using context.gpu_context;
    buffer: VkBuffer;
    buffer_create_info := VkBufferCreateInfo.{
        flags = 0,
        size = bytes,
        usage = .SHADER_DEVICE_ADDRESS | .STORAGE_BUFFER | .TRANSFER_DST | .TRANSFER_SRC,
        sharingMode = .EXCLUSIVE,
    };
    result: VkResult;
    result = check_vk(vkCreateBuffer(device, *buffer_create_info, vka, *buffer));
    assert_vk_result(result);

    memory_requirements: VkMemoryRequirements;
    vkGetBufferMemoryRequirements(device, buffer, *memory_requirements);

    memory_allocate_flags := VkMemoryAllocateFlagsInfo.{
        flags = .DEVICE_ADDRESS,
    };
    allocation_info := VkMemoryAllocateInfo.{
        pNext = *memory_allocate_flags,
        allocationSize = memory_requirements.size,
        memoryTypeIndex = memory_indices.shared,
    };

    memory: VkDeviceMemory;
    result = check_vk(vkAllocateMemory(device, *allocation_info, vka, *memory));
    Basic.assert(result == .SUCCESS);

    result = check_vk(vkBindBufferMemory(device, buffer, memory, 0));
    Basic.assert(result == .SUCCESS);

    address_info := VkBufferDeviceAddressInfo.{
        buffer = buffer
    };

    allocation: Allocation;
    allocation.gpu = vkGetBufferDeviceAddress(device, *address_info);

    check_vk(vkMapMemory(device, memory, 0, memory_requirements.size, 0, *allocation.cpu));
    Basic.assert(result == .SUCCESS);
    allocation.memory = memory;
    allocation.buffer = buffer;

    return allocation;
}

free :: (allocation: Allocation) {
    using context.gpu_context;
    if allocation.buffer {
        vkDestroyBuffer(device, allocation.buffer, vka);
    }
    if allocation.memory {
        vkFreeMemory(device, allocation.memory, vka);
    }
}

texture_size_align :: (desc: Texture_Desc) -> Texture_Size_Align {
    using context.gpu_context;
    image_create_info := to_vulkan_image_create_info(desc);

    image_memory_requirements := VkDeviceImageMemoryRequirements.{
        pCreateInfo = *image_create_info,
    };

    memory_requirements: VkMemoryRequirements2;

    vkGetDeviceImageMemoryRequirements(device, *image_memory_requirements, *memory_requirements);

    size_align := Texture_Size_Align.{
        size = memory_requirements.memoryRequirements.size,
        align = memory_requirements.memoryRequirements.alignment,
    };

    return size_align;
}

create_texture :: (desc: Texture_Desc, allocation: Allocation) -> Texture {
    using context.gpu_context;
    image_create_info := to_vulkan_image_create_info(desc);
    texture: Texture;
    result: VkResult;
    result = check_vk(vkCreateImage(device, *image_create_info, vka, *texture.image));
    assert_vk_result(result);

    result = check_vk(vkBindImageMemory(device, texture.image, allocation.memory, allocation.offset));
    assert_vk_result(result);

    return texture;
}

// In this implementation, I use shader object as the primary pipeline
// alternative, even though it is still called pipeline, it is in fact
// shader object underneath.
create_compute_pipeline :: (ir: string, entry_point: string = "main") -> Pipeline {
    using context.gpu_context;
    Basic.auto_release_temp();
    create_info := VkShaderCreateInfoEXT.{
        stage = .COMPUTE,
        nextStage = .ALL, // because we don't know what the next will be
        codeType = .SPIRV,
        codeSize = ir.count, // This should be a multiple of 4
        pCode = ir.data,
        pName = Basic.temp_c_string(entry_point),
        setLayoutCount = 0, // We don't use any descriptor set
        pSetLayouts = null,
        pushConstantRangeCount = 1,
        pPushConstantRanges = *PUSH_CONSTANT_RANGE,
        pSpecializationInfo = null, // Don't know what this is yet
    };

    shader: VkShaderEXT;
    result := check_vk(vkCreateShadersEXT(device, 1, *create_info, vka, *shader));
    assert_vk_result(result);

    pipeline: Pipeline;
    pipeline.shaders[0] = shader;
    pipeline.is_compute = true;

    return pipeline;
}

free_pipeline :: (pipeline: Pipeline) {
    using context.gpu_context;
    if pipeline.is_compute {
        vkDestroyShaderEXT(device, pipeline.shaders[0], vka);
    } else {
        vkDestroyShaderEXT(device, pipeline.shaders[0], vka);
        vkDestroyShaderEXT(device, pipeline.shaders[1], vka);
    }
}

// This is not create queue, but aquire one. We currently push
// everything into the main graphics queue
create_queue :: () -> Queue {
    using context.gpu_context;
    return .{vk = main_queue};
}

// TODO: the command pool selection should base on the queue passed
start_command_recording :: (queue: Queue) -> Command_Buffer {
    using context.gpu_context;

    bump_command_pool_index();

    result: VkResult;
    cb: Command_Buffer;
    // Here we optimistically reset the command pool
    // TODO: we should have a semaphore to track the finish of the command pool
    command_pool := command_pools[current_command_pool_index];
    result = check_vk(vkResetCommandPool(device, command_pool, 0));
    assert_vk_result(result);

    allocate_info := VkCommandBufferAllocateInfo.{
        commandPool = command_pool,
        level = .PRIMARY,
        commandBufferCount = 1,
    };
    result = check_vk(vkAllocateCommandBuffers(device, *allocate_info, *cb.vk));
    assert_vk_result(result);

    begin_info := VkCommandBufferBeginInfo.{
        flags = .ONE_TIME_SUBMIT,
    };
    result = vkBeginCommandBuffer(cb, *begin_info);
    assert_vk_result(result);
    return cb;
}

submit :: (queue: Queue, command_buffers: []Command_Buffer, wait: []Semaphore_Pair = .[], signal: []Semaphore_Pair = .[]) {
    Basic.auto_release_temp();
    Basic.push_allocator(Basic.temp);

    command_buffer_submit_infos := Basic.NewArray(command_buffers.count, VkCommandBufferSubmitInfo);

    for 0..command_buffers.count - 1 {
        vkEndCommandBuffer(command_buffers[it]);
        command_buffer_submit_infos[it].commandBuffer = command_buffers[it];
    }


    submit_info := VkSubmitInfo2.{
        commandBufferInfoCount = xx command_buffers.count,
        pCommandBufferInfos = command_buffer_submit_infos.data,
    };

    if wait.count > 0 {
        semaphore_infos := Basic.NewArray(wait.count, VkSemaphoreSubmitInfo);
        for wait {
            semaphore_infos[it_index].semaphore = it.semaphore;
            semaphore_infos[it_index].value = it.value;
            semaphore_infos[it_index].stageMask = .ALL_COMMANDS;
        }

        submit_info.waitSemaphoreInfoCount = xx semaphore_infos.count;
        submit_info.pWaitSemaphoreInfos = semaphore_infos.data;
    }

    if signal.count > 0 {
        semaphore_infos := Basic.NewArray(signal.count, VkSemaphoreSubmitInfo);

        for signal {
            semaphore_infos[it_index].semaphore = it.semaphore;
            semaphore_infos[it_index].value = it.value;
        }

        submit_info.signalSemaphoreInfoCount = xx semaphore_infos.count;
        submit_info.pSignalSemaphoreInfos = semaphore_infos.data;
    }

    result := check_vk(vkQueueSubmit2(queue.vk, 1, *submit_info, null));
    assert_vk_result(result);
}

memcpy :: (cb: Command_Buffer, dst: Allocation, src: Allocation, size: u64) {
    copy_region := VkBufferCopy2.{
        srcOffset = src.offset,
        dstOffset = dst.offset,
        size = size,
    };

    copy_info := VkCopyBufferInfo2.{
        srcBuffer = src.buffer,
        dstBuffer = dst.buffer,
        regionCount = 1,
        pRegions = *copy_region,
    };

    vkCmdCopyBuffer2(cb, *copy_info);
}

create_semaphore :: (init_value: u64) -> Semaphore {
    using context.gpu_context;

    semaphore_type_create_info := VkSemaphoreTypeCreateInfo.{
        semaphoreType = .TIMELINE,
        initialValue = init_value,
    };
    semaphore_create_info := VkSemaphoreCreateInfo.{
        pNext = *semaphore_type_create_info,
    };
    semaphore: Semaphore;
    result: VkResult;
    result = check_vk(vkCreateSemaphore(device, *semaphore_create_info, vka, *semaphore.vk));
    assert_vk_result(result);

    return semaphore;
}

wait_semaphore :: (semaphore: Semaphore, value: u64, timeout: u64 = 1000000) {
    using context.gpu_context;
    wait_info := VkSemaphoreWaitInfo.{
        semaphoreCount = 1,
        pSemaphores = *semaphore.vk,
        pValues = *value,
    };

    result := check_vk(vkWaitSemaphores(device, *wait_info, timeout));
    assert_vk_result(result);
}

destroy_semaphore :: (semaphore: Semaphore) {
    using context.gpu_context;
    vkDestroySemaphore(device, semaphore, vka);
}

// This function is weird
barrier :: (cb: Command_Buffer, before: Stage, after: Stage, hazards: Hazard = 0) {
    dependency_info := VkDependencyInfo.{
        dependencyFlags = 0,
    };

    memory_barrier := VkMemoryBarrier2.{
        srcStageMask = to_vulkan_pipeline_stage(before),
        srcAccessMask = .NONE,
        dstStageMask = to_vulkan_pipeline_stage(after),
        dstAccessMask = .NONE,
    };

    if hazards & .DRAW_ARGUMENTS {
        memory_barrier.srcAccessMask |= .SHADER_WRITE;
        memory_barrier.dstAccessMask |= .INDIRECT_COMMAND_READ;
    }

    if hazards & .DESCRIPTORS {
        memory_barrier.srcAccessMask |= .SHADER_WRITE;
        memory_barrier.dstAccessMask |= .SHADER_READ;
    }

    if hazards & .DEPTH_STENCIL {
        memory_barrier.srcAccessMask |= .DEPTH_STENCIL_ATTACHMENT_WRITE;
        memory_barrier.dstAccessMask |= .DEPTH_STENCIL_ATTACHMENT_WRITE | DEPTH_STENCIL_ATTACHMENT_READ;
    }

    // Generic
    if hazards == 0 {
        memory_barrier.srcAccessMask = .MEMORY_WRITE;
        memory_barrier.dstAccessMask = .MEMORY_READ;
    }

    dependency_info.memoryBarrierCount = 1;
    dependency_info.pMemoryBarriers = *memory_barrier;

    vkCmdPipelineBarrier2(cb, *dependency_info);
}

set_pipeline :: (cb: Command_Buffer, pipeline: Pipeline) {
    if pipeline.is_compute {
        stage: VkShaderStageFlagBits = .COMPUTE;
        vkCmdBindShadersEXT(cb, 1, *stage, pipeline.shaders.data);
    } else {
        stages := VkShaderStageFlagBits.[.VERTEX, .FRAGMENT];
        vkCmdBindShadersEXT(cb, 2, stages.data, pipeline.shaders.data);
    }
}

dispatch :: (cb: Command_Buffer, data: Allocation, count: u32) {
    using context.gpu_context;
    pc := Push_Constant.{
        in_out = data.gpu,
    };

    vkCmdPushConstants(cb, pipeline_layout, .COMPUTE, 0, size_of(Push_Constant), *pc);
    vkCmdDispatch(cb, count, 1, 1);
}

#scope_file
application_info :: VkApplicationInfo.{
    pApplicationName = "shapeless",
    applicationVersion = #run VK_MAKE_API_VERSION(0, 0, 1, 0),
    pEngineName = "shapeless",
    engineVersion = #run VK_MAKE_API_VERSION(0, 0, 1, 0),
    apiVersion = VK_API_VERSION_1_4,
};

VALIDATION_LAYERS :: (*u8).["VK_LAYER_KHRONOS_validation"];
DEVICE_EXTENSIONS :: (*u8).[
VK_EXT_SHADER_OBJECT_EXTENSION_NAME,
];

// This is the sole push constant struct that will ever pass to the shader
Push_Constant :: struct {
    in_out: VkDeviceAddress;
    textures: VkDeviceAddress; // TODO: I am not sure whether this could work
}

PUSH_CONSTANT_RANGE :: VkPushConstantRange.{
    stageFlags = .ALL,
    offset = 0,
    size = size_of(Push_Constant),
};

assert_vk_result :: (result: VkResult) #expand {
    #if DEBUG_ASSERT {
        `Basic.assert(result == .SUCCESS);
    }
}

// Stolen from JBlow's Vulkan_Renderer
// Generic api result logging helper, useful for Khronos apis
check_api_result :: (result: $Result, api: string, $call := #caller_code, loc := #caller_location) -> Result {
    call_string :: #run -> string {
        root := Compiler.compiler_get_nodes(call);

        if root.kind == {
        case .PROCEDURE_CALL;
            proc_call := cast(*Compiler.Code_Procedure_Call) root;
            expression := proc_call.arguments_sorted[0];

            if expression.kind != .PROCEDURE_CALL {
                return "";
            }

            call := cast(*Compiler.Code_Procedure_Call) expression;
            if call.procedure_expression.kind != .IDENT {
                return "";
            }

            return (cast(*Compiler.Code_Ident) call.procedure_expression).name;

        case .IDENT;
            return (cast(*Compiler.Code_Ident) root).name;

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
        Basic.log_error("% '%' failed: %", api, action, printed_result, loc = loc);
        return result;
    }
    return .SUCCESS;
}

check_vk :: (result: VkResult, $call := #caller_code, loc := #caller_location) -> VkResult {
    return check_api_result(result, "Vulkan call", call, loc);
}

get_vk_instance_extensions :: () -> [] *u8 {
    instance_extensions: [..]*u8;
    instance_extension_count: u32;
    instance_extension_data := SDL_Vulkan_GetInstanceExtensions(*instance_extension_count);

    for 0..instance_extension_count - 1 {
        Basic.array_add(*instance_extensions, instance_extension_data[it]);
    }
    Basic.array_add(*instance_extensions, VK_EXT_DEBUG_UTILS_EXTENSION_NAME);

    return instance_extensions;
}

debug_utils_callback :: (messageSeverity: VkDebugUtilsMessageSeverityFlagBitsEXT, messageTypes: VkDebugUtilsMessageTypeFlagsEXT, pCallbackData: *VkDebugUtilsMessengerCallbackDataEXT, pUserData: *void) -> VkBool32 #c_call {
    push_context {
        if messageSeverity == {
        case .VERBOSE;
            ;
        case .INFO;
            ;
        case .WARNING;
            Basic.log("[WARN ] %", to_string(pCallbackData.pMessage));
        case .ERROR;
            Basic.log("[ERROR] %", to_string(pCallbackData.pMessage));
        }

    }
    return VK_FALSE;
}

debug_utils_messenger_create_info :: VkDebugUtilsMessengerCreateInfoEXT.{
    messageSeverity = .VERBOSE | .INFO | .WARNING | .ERROR,
    messageType     = .GENERAL | .VALIDATION | .PERFORMANCE,
    pfnUserCallback = debug_utils_callback
};

make_instance :: () -> VkResult, VkInstance {
    using context.gpu_context;
    instance_extensions := get_vk_instance_extensions();
    instance_create_info := VkInstanceCreateInfo.{
        pNext = *debug_utils_messenger_create_info,
        flags = 0,
        pApplicationInfo = *application_info,
        enabledExtensionCount = xx instance_extensions.count,
        ppEnabledExtensionNames = xx instance_extensions.data,
    };

    #if VALIDATION {
        instance_create_info.enabledLayerCount = xx VALIDATION_LAYERS.count;
        instance_create_info.ppEnabledLayerNames = VALIDATION_LAYERS.data;
    }

    my_instance: VkInstance;
    result := check_vk(vkCreateInstance(*instance_create_info, vka, *my_instance));
    return result, my_instance;
}

Queue_Family_Indices :: struct {
    graphics: u32;
    present: u32;
}

find_queue_families :: (physical_device: VkPhysicalDevice, surface: VkSurfaceKHR) -> ok:bool, Queue_Family_Indices {
    graphics := Math.U32_MAX;
    present  := Math.U32_MAX;

    queue_families := vkGetPhysicalDeviceQueueFamilyProperties(physical_device,, Basic.temp);

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

        if graphics != Math.U32_MAX && present != Math.U32_MAX {
            return true, .{graphics = graphics, present = present};
        }
    }

    return false, .{};
}

device_supports_extensions :: (physical_device: VkPhysicalDevice, extensions: [] *u8) -> bool {
    result, available_extensions := vkEnumerateDeviceExtensionProperties(physical_device, null,, Basic.temp);
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
            Basic.log("device does not support %", to_string(extension));
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

    result, formats := vkGetPhysicalDeviceSurfaceFormatsKHR(physical_device, surface,, Basic.temp);
    if check_vk(result, vkGetPhysicalDeviceSurfaceFormatsKHR) return .{};

    result=, present_modes := vkGetPhysicalDeviceSurfacePresentModesKHR(physical_device, surface,, Basic.temp);
    if check_vk(result, vkGetPhysicalDeviceSurfacePresentModesKHR) return .{};

    return .{
        capabilities = capabilities,
        formats = formats,
        present_modes = present_modes
    };
}

choose_physical_device :: (instance: VkInstance, surface: VkSurfaceKHR, device_extensions: [] *u8) -> VkPhysicalDevice, Queue_Family_Indices {
    result, devices := vkEnumeratePhysicalDevices(instance);
    if check_vk(result, vkEnumeratePhysicalDevices) return null, .{};

    best_score := 0;
    best_device: VkPhysicalDevice;
    best_device_queue_families: Queue_Family_Indices;
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

make_device :: (device_extensions: [] *u8) -> VkResult, VkDevice {
    using context.gpu_context;

    indices_array := u32.[queue_family_indices.graphics, queue_family_indices.present];

    queue_count := ifx queue_family_indices.graphics == queue_family_indices.present then 1 else 2;
    queue_create_infos := Basic.NewArray(queue_count, VkDeviceQueueCreateInfo, initialized = false,, Basic.temp);
    queue_priority : float32 = 1.0;

    for * queue_create_infos {
        it.* = .{
            queueFamilyIndex = indices_array[it_index],
            queueCount = 1,
            pQueuePriorities = *queue_priority
        };
    }

    chain: *void;
    features_shader_object := VkPhysicalDeviceShaderObjectFeaturesEXT.{
        shaderObject = VK_TRUE
    };
    chain = *features_shader_object;
    features14 := VkPhysicalDeviceVulkan14Features.{
        pNext = chain,
        maintenance5 = VK_TRUE,
    };
    chain = *features14;
    features13 := VkPhysicalDeviceVulkan13Features.{
        pNext = chain,
        dynamicRendering = VK_TRUE,
        synchronization2 = VK_TRUE,
        maintenance4 = VK_TRUE,
    };
    chain = *features13;
    features12 := VkPhysicalDeviceVulkan12Features.{
        pNext                                         = chain,
        bufferDeviceAddress                           = VK_TRUE,
        descriptorIndexing                            = VK_TRUE,
        scalarBlockLayout                             = VK_TRUE,
        runtimeDescriptorArray                        = VK_TRUE,
        descriptorBindingVariableDescriptorCount      = VK_TRUE,
        descriptorBindingStorageBufferUpdateAfterBind = VK_TRUE,
        shaderInt8                                    = VK_TRUE,
        timelineSemaphore                             = VK_TRUE,
    };
    chain = *features12;
    features11 := VkPhysicalDeviceVulkan11Features.{
        pNext = chain,
        // This extension is necessary because how slang shader
        // compute SV_VertexID and SV_InstanceID
        shaderDrawParameters = VK_TRUE
    };
    chain = *features11;
    device_features := VkPhysicalDeviceFeatures2.{
        pNext = chain,
        features = .{
            samplerAnisotropy = VK_TRUE,
            fillModeNonSolid = VK_TRUE,
            shaderInt64      = VK_TRUE // For pointer math inside shader
        }
    };

    // Device layers are deprecated
    device_create_info := VkDeviceCreateInfo.{
        pNext = *device_features,
        queueCreateInfoCount = xx queue_create_infos.count,
        pQueueCreateInfos = queue_create_infos.data,
        enabledExtensionCount = xx device_extensions.count,
        ppEnabledExtensionNames = device_extensions.data,
        pEnabledFeatures = null
    };

    my_device: VkDevice;
    result: VkResult;
    result = check_vk(vkCreateDevice(physical_device, *device_create_info, vka, *my_device));
    return result, my_device;
}

Memory_Indices :: struct {
    shared: u32 = Math.U32_MAX;
    private: u32 = Math.U32_MAX;
}

get_memory_indices :: () -> Memory_Indices {
    using context.gpu_context;

    indices: Memory_Indices;
    properties: VkPhysicalDeviceMemoryProperties;
    vkGetPhysicalDeviceMemoryProperties(physical_device, *properties);

    SHARED_FLAGS: VkMemoryPropertyFlags = .DEVICE_LOCAL | .HOST_VISIBLE | .HOST_COHERENT;

    for i: 0..properties.memoryTypeCount - 1 {
        f := properties.memoryTypes[i].propertyFlags;
        if (f & SHARED_FLAGS) == SHARED_FLAGS {
            indices.shared = i;
        }

        // This ensure the private index return is not cpu visible
        if (f & .DEVICE_LOCAL == .DEVICE_LOCAL) && (f & .HOST_VISIBLE == 0) {
            indices.private = i;
        }

        if indices.shared != Math.U32_MAX && indices.private != Math.U32_MAX {
            break;
        }
    }

    return indices;
}

to_vulkan_format :: (format: Format) -> VkFormat {
    vk_format: VkFormat = UNDEFINED;
    if format == {
    case .NONE;
        vk_format = .UNDEFINED;
    case .RGBA8_UNORM;
        vk_format = .R8G8B8A8_UNORM;
    case .D32_FLOAT;
        vk_format = .D32_SFLOAT;
    case .D24_UNORM_S8;
        vk_format = .D24_UNORM_S8_UINT;
    }

    return vk_format;
}

to_vulkan_image_type :: (type: Texture_Type) -> VkImageType {
    image_type: VkImageType;
    if type == {
    case .e1D;
        image_type = .e1D;
    case .e2D;
        image_type = .e2D;
    case .e3D;
        image_type = .e3D;
    case .CUBE;
        image_type = .e2D;
    case .e2D_ARRAY;
        image_type = .e2D;
    case .CUBE_ARRAY;
        image_type = .e2D;
    }

    return image_type;
}

to_vulkan_image_view_type :: (type: Texture_Type) -> VkImageViewType {
    image_view_type: VkImageViewType;
    if type == {
    case .e1D;
        image_view_type = .e1D;
    case .e2D;
        image_view_type = .e2D;
    case .e3D;
        image_view_type = .e3D;
    case .CUBE;
        image_view_type = .CUBE;
    case .e2D_ARRAY;
        image_view_type = .e2D_ARRAY;
    case .CUBE_ARRAY;
        image_view_type = .CUBE_ARRAY;
    }

    return image_view_type;
}

to_vulkan_sample_count :: (count: u32) -> VkSampleCountFlagBits {
    return cast(VkSampleCountFlags) count;
}

to_vulkan_image_usage :: (usage: Texture_Usage) -> VkImageUsageFlags {

}

to_vulkan_image_create_info :: (desc: Texture_Desc) -> VkImageCreateInfo {
    info := VkImageCreateInfo.{
        imageType = to_vulkan_image_type(desc.type),
        format = to_vulkan_format(desc.format),
        extent = cast(VkExtent3D) desc.dimensions,
        mipLevels = desc.mip_count,
        arrayLayers = desc.layer_count,
        samples = to_vulkan_sample_count(desc.sample_count),
        tiling = .OPTIMAL,
        usage = .TRANSFER_SRC | .TRANSFER_DST | .SAMPLED | .STORAGE,
        sharingMode = .EXCLUSIVE,
        initialLayout = UNDEFINED,
    };

    return info;
}

to_vulkan_pipeline_stage :: (stage: Stage) -> VkPipelineStageFlags2 {
    vk: VkPipelineStageFlags2 = .NONE;
    if stage == {
    case .TOP;
        vk = .TOP_OF_PIPE;
    case .BOTTOM;
        vk = .BOTTOM_OF_PIPE;
    case .COMPUTE;
        vk = .COMPUTE_SHADER;
    case .TRANSFER;
        vk = .ALL_TRANSFER;
    case .VERTEX;
        vk = .VERTEX_SHADER;
    case .FRAGMENT;
        vk = .FRAGMENT_SHADER;
    case .ALL_GRAPHICS;
        vk = .ALL_GRAPHICS;
    case .ALL_COMMANDS;
        vk = .ALL_COMMANDS;
    }

    return vk;
}

bump_command_pool_index :: () {
    using context.gpu_context;

    if current_command_pool_index >= 4 {
        current_command_pool_index = 0;
    } else {
        current_command_pool_index += 1;
    }
}

#import "Vulkan";
#import "SDL3";
Basic :: #import "Basic";
Math :: #import "Math";
Compiler :: #import "Compiler";
