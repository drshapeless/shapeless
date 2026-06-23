// This Vulkan implementation depends on several very new features,
// like VkPhysicalDeviceShaderObjectFeaturesEXT and
// VkPhysicalDeviceDescriptorHeapFeaturesEXT. This is likely to be an
// experiment at the moment, all the Vulkan related flow is vastly
// different from most of the tutorials that you can find in the
// Internet, including SaschaWillems' HowToVulkan in 2026. We don't
// care about older hardware and Apple machines, because we implement
// the same API in Metal directly. We can have a lot of freedom to try
// the latest extensions.
//
// For radeon GPU, you need to 'export RADV_EXPERIMENTAL=hic,heap' in
// the environment.

//// Several implementation details.
//
//// 1.
// We are using descriptor heap, push constants and descriptor
// set are no longer useful. Also, VkPipelineLayoutCreateInfo is also
// deprecated.
//
//// 2.
// Fences are no longer useful, we heavily depends on timeline
// semaphores to sychronize all the actions.

DEFAULT_COMMAND_BUFFER_COUNT :: 5;

GPU_Context :: struct {
    sdl_window                 : *SDL_Window;
    instance                   : VkInstance;
    device                     : VkDevice;
    vka                        : *VkAllocationCallbacks;
    surface                    : VkSurfaceKHR;
    queue_family_indices       : Queue_Family_Indices;
    physical_device            : VkPhysicalDevice;
    memory_indices             : Memory_Indices;
    main_queue                 : VkQueue;
    command_pools              : [DEFAULT_COMMAND_BUFFER_COUNT]VkCommandPool;
    current_command_pool_index := 0;

    cpu_pointer_table: Table(*void, Allocation);
    gpu_pointer_table: Table(u64, Allocation);

    swapchain: Swapchain;
    frame:     []FRAME;
}
#add_context gpu_context: GPU_Context;

Allocation :: struct {
    cpu:    *void;
    gpu:    u64;
    size:   u64;

    // The following fields are implementation specific
    memory: VkDeviceMemory;
    buffer: VkBuffer; // Keeping a mapped buffer here makes copying much easier
}

Texture :: struct {
    image: VkImage;
    format: VkFormat;
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

IR :: struct {
    spirv: string;
    entry_point: string;
}

init :: (window: *SDL_Window = null) {
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

    if window {
        create_swapchain();
    }
}

deinit :: () {
    using context.gpu_context;
    result: VkResult;
    result = vkDeviceWaitIdle(device);
    assert_vk_result(result);

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
}

#add_context gpu_allocator: Allocator = vulkan_allocator;
vulkan_allocator :: Allocator.{vulkan_allocator_proc, null};

vulkan_allocator_proc :: (mode: Allocator_Mode, requested_size: s64, old_size: s64, old_memory: *void, allocator_data: *void) -> *void {
    using context.gpu_context;

    if mode == {
    case .ALLOCATE;
        allocation := vulkan_allocate(xx requested_size);
        table_add(*cpu_pointer_table, allocation.cpu, allocation);
        table_add(*gpu_pointer_table, allocation.gpu, allocation);
        return allocation.cpu;
    case .FREE;
        found, allocation := table_find(*cpu_pointer_table, old_memory);
        if found {
            vulkan_deallocate(allocation);
        }
    case;
        Basic.assert(false, "% mode is not supported in Vulkan allocator", mode);
    }

    return null;
}

// This only allocates shared memory (rebar).
vulkan_allocate :: (bytes: u64) -> Allocation {
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
    allocation.size = bytes;

    return allocation;
}

vulkan_deallocate :: (allocation: Allocation) {
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

create_texture :: (desc: Texture_Desc, ptr_gpu: u64) -> Texture {
    using context.gpu_context;

    allocation := gpu_pointer_to_allocation(ptr_gpu);
    image_create_info := to_vulkan_image_create_info(desc);
    texture: Texture;
    result: VkResult;
    result = check_vk(vkCreateImage(device, *image_create_info, vka, *texture.image));
    assert_vk_result(result);

    result = check_vk(vkBindImageMemory(device, texture.image, allocation.memory, allocation.offset));
    assert_vk_result(result);

    return texture;
}

load_spirv :: (spirv: string, entry_points: []string) -> []IR {
    irs := Basic.NewArray(entry_points.count, IR);

    for entry_points {
        irs[it_index].spirv = spirv;
        irs[it_index].entry_point = it;
    }

    return irs;
}

load_compute_ir :: inline (spirv: string, entry_point: string = "compute_main") -> IR {
    Basic.auto_release_temp();
    irs := load_spirv(spirv, .[entry_point],, Basic.temp);
    return irs[0];
}

load_graphics_ir :: #bake_arguments load_spirv(entry_points = .["vertex_main", "fragment_main"]);

create_compute_pipeline :: (ir: IR) -> Pipeline {
    using context.gpu_context;
    Basic.auto_release_temp();
    create_info := VkShaderCreateInfoEXT.{
        stage = .COMPUTE,
        nextStage = 0, // because we don't know what the next will be
        codeType = .SPIRV,
        codeSize = xx ir.spirv.count, // This should be a multiple of 4
        pCode = ir.spirv.data,
        pName = Basic.temp_c_string(ir.entry_point),
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

create_graphics_pipeline :: (vertex_ir: IR, fragment_ir: IR, desc: Raster_Desc) -> Pipeline {
    using context.gpu_context;
    Basic.auto_release_temp();

    create_infos: [2]VkShaderCreateInfoEXT;

    create_infos[0] = VkShaderCreateInfoEXT.{
        stage = .VERTEX,
        nextStage = .FRAGMENT,
        codeType = .SPIRV,
        codeSize = xx vertex_ir.spirv.count, // This should be a multiple of 4
        pCode = vertex_ir.spirv.data,
        pName = Basic.temp_c_string(vertex_ir.entry_point),
        setLayoutCount = 0, // We don't use any descriptor set
        pSetLayouts = null,
        pushConstantRangeCount = 1,
        pPushConstantRanges = *PUSH_CONSTANT_RANGE,
        pSpecializationInfo = null, // Don't know what this is yet
    };

    create_infos[1] = VkShaderCreateInfoEXT.{
        stage = .FRAGMENT,
        nextStage = 0,
        codeType = .SPIRV,
        codeSize = xx fragment_ir.spirv.count, // This should be a multiple of 4
        pCode = fragment_ir.spirv.data,
        pName = Basic.temp_c_string(fragment_ir.entry_point),
        setLayoutCount = 0, // We don't use any descriptor set
        pSetLayouts = null,
        pushConstantRangeCount = 1,
        pPushConstantRanges = *PUSH_CONSTANT_RANGE,
        pSpecializationInfo = null, // Don't know what this is yet
    };

    result: VkResult;
    shaders: [2]VkShaderEXT;
    result = check_vk(vkCreateShadersEXT(device, 1, create_infos.data, vka, shaders.data));
    assert_vk_result(result);

    pipeline: Pipeline;
    pipeline.shaders[0] = shaders[0];
    pipeline.shaders[1] = shaders[1];
    pipeline.is_compute = false;

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
start_command_recording :: () -> Command_Buffer {
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

memcpy :: (cb: Command_Buffer, dst: u64, src: u64, size: u64) {
    using context.gpu_context;

    dst_allocation := gpu_pointer_to_allocation(dst);
    src_allocation := gpu_pointer_to_allocation(src);

    copy_region := VkBufferCopy2.{
        srcOffset = src - src_allocation.gpu,
        dstOffset = dst - dst_allocation.gpu,
        size = size,
    };

    copy_info := VkCopyBufferInfo2.{
        srcBuffer = src_allocation.buffer,
        dstBuffer = dst_allocation.buffer,
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

dispatch :: (cb: Command_Buffer, data_gpu: u64, count: u32) {
    using context.gpu_context;

    // We no longer use push constants.

    vkCmdDispatch(cb, count, 1, 1);
}

aquire_next_texture :: () -> success:bool, Texture {
    using context.gpu_context;
}

#scope_file
application_info :: VkApplicationInfo.{
    pApplicationName = "shapeless",
    applicationVersion = #run VK_MAKE_API_VERSION(0, 0, 1, 0),
    pEngineName = "shapeless",
    engineVersion = #run VK_MAKE_API_VERSION(0, 0, 1, 0),
    apiVersion = VK_API_VERSION_1_4,
};

Swapchain :: struct {
    vk: VkSwapchainKHR;
    format: VkFormat;
    extent: VkExtent3D;
    images: []VkImage;
    image_views: []VkImageView;
}

Frame :: struct {
    acquire_semaphore: VkSemaphore;
    present_semaphore: VkSemaphore;

    timeline_semaphore: VkSemaphore;

    command_pool: VkCommandPool;
}

VALIDATION_LAYERS :: (*u8).["VK_LAYER_KHRONOS_validation"];
DEVICE_EXTENSIONS :: (*u8).[
VK_EXT_SHADER_OBJECT_EXTENSION_NAME,
VK_EXT_DESCRIPTOR_HEAP_EXTENSION_NAME,
];

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
    features_descriptor_heap := VkPhysicalDeviceDescriptorHeapFeaturesEXT.{
        descriptorHeap = VK_TRUE,
    };
    chain = *features_descriptor_heap;

    features_shader_object := VkPhysicalDeviceShaderObjectFeaturesEXT.{
        pNext = chain,
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

    if current_command_pool_index >= DEFAULT_COMMAND_BUFFER_COUNT - 1 {
        current_command_pool_index = 0;
    } else {
        current_command_pool_index += 1;
    }
}

create_swapchain :: () {
    using context.gpu_context;

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

    image_count := support.capabilities.minImageCount + 1;
    if support.capabilities.maxImageCount > 0 && image_count > support.capabilities.maxImageCount {
        image_count = support.capabilities.maxImageCount;
    }

    swapchain_extent := support.capabilities.currentExtent;
    if swapchain_extent.width == Math.U32_MAX {
        swapchain_extent.width = Math.clamp(extent.width, support.capabilities.minImageExtent.width, support.capabilities.maxImageExtent.width);
        swapchain_extent.height = Math.clamp(extent.height, support.capabilities.minImageExtent.height, support.capabilities.maxImageExtent.height);
    }

    swapchain_create_info := VkSwapchainCreateInfoKHR.{
        surface = surface,
        minImageCount = image_count,
        imageFormat = format.format,
        imageColorSpace = format.colorSpace,
        imageExtent = swapchain_extent,
        imageArrayLayers = 1,
        imageUsage = .TRANSFER_DST | .COLOR_ATTACHMENT,
        imageSharingMode = .EXCLUSIVE, // We only use one queue for everything
        queueFamilyIndexCount = 0,
        pQueueFamilyIndices = null,
        preTransform = support.capabilities.currentTransform,
        compositeAlpha = .OPAQUE,
        presentMode = present_mode,
        clipped = VK_TRUE,
        // oldSwapchain = old_swapchain, // I don't care about oldswapchain
    };

    result: VkResult;
    swapchain.format = format;
    swapchain.extent = extent;
    result = check_vk(vkCreateSwapchainKHR(device, *swapchain_create_info, vka, *swapchain.vk));
    assert_vk_result(result);

    result, swapchain.images = vkGetSwapchainImagesKHR(device, swapchain.vk);
    assert_vk_result(result);

    swapchain.image_views = Basic.NewArray(image_count, VkImageView);
    for * swapchain.image_views {
        image_view_create_info := VkImageViewCreateInfo.{
            image = image,
            viewType = .e2D,
            format = swapchain.format,
            subresourceRange = .{
                aspectMask = .COLOR,
                baseMipLevel = 0,
                levelCount = 1,
                baseArrayLayer = 0,
                layerCount = 1,
            },
        };

        result = check_vk(vkCreateImageView(device, *image_view_create_info, vka, it));
        assert_vk_result(result);
    }
}



#import "Vulkan";
#import "SDL3";
Basic :: #import "Basic";
Math :: #import "Math";
Compiler :: #import "Compiler";
#import "Hash_Table";
