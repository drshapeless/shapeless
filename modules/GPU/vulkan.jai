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

Format :: VkFormat;

GPU_Context :: struct {
    sdl_window:           *SDL_Window;
    instance:             VkInstance;
    device:               VkDevice;
    vka:                  *VkAllocationCallbacks;
    surface:              VkSurfaceKHR;
    queue_family_indices: Queue_Family_Indices;
    physical_device:      VkPhysicalDevice;
    memory_properties:    VkPhysicalDeviceMemoryProperties;
    main_queue:           VkQueue;

    cpu_pointer_table: Table(*void, Allocation);
    gpu_pointer_table: Table(Ptr, Allocation);

    slang_global_session: *slang.IGlobalSession;

    swapchain:  Swapchain;

    // On the reason why present_semaphores are independent of frames,
    // starting from Vulkan SDK 1.4.313, present_semaphores is
    // strictly enforced to be with acquired_image_index instead of
    // current frame. Yet, no one has told me about that. Back in a
    // few years when I was learning Vulkan, the god-damn Vulkan
    // Tutorial is obsolete, (which still uses ancient render pass). I
    // then moved to vkguide, that knowledge is now obsolete
    // too. SaschaWillems's latest tutorial is somewhat lacking behind
    // the latest useful extensions. If you learn Vulkan, you are like
    // in the middle of an ocean, helpless. AI is somehow useful as
    // long as you know when it is hallucinating.
    //     -drshapeless 8 Jul 2026

    frames:     []Frame;
    frame_index: s64;
    acquired_image_index: u32 = 0;
    present_semaphores: [] VkSemaphore;

    // The command buffer count depends on frame count, if swapchain
    // is not supported, the command buffer count will be
    // DEFAULT_COMMAND_BUFFER_COUNT
    command_buffers: []Command_Buffer;
    command_buffer_index: s64;

    descriptor_heap_properties: VkPhysicalDeviceDescriptorHeapPropertiesEXT;
    descriptor_heap_allocation: Allocation;
    descriptor_heap_arena: Arena;

    // This contains sampler heap and texture heap, where sampler heap
    // is the first.
    set_and_binding_mapping: [2] VkDescriptorSetAndBindingMappingEXT;
}
#add_context gpu_context: GPU_Context;

Allocation :: struct {
    cpu:    *void;
    gpu:    Ptr;
    size:   u64;

    // The following fields are implementation specific
    memory: VkDeviceMemory;
    buffer: VkBuffer; // Keeping a mapped buffer here makes copying much easier
}

// TODO: the Texture struct has too many field, some of them should be removed.
Texture :: struct {
    image: VkImage;
    // I thought image view could be omitted, but color attachment
    // requires an image view.
    view:  VkImageView;
    format: VkFormat;
    dimensions: u32x3;
    gpu: Ptr;
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
    pool: VkCommandPool;
}

Semaphore :: struct {
    #as vk: VkSemaphore;
}

IR :: struct {
    spirv: string;
    entry_point: string;
}

Depth_Stencil_State :: struct {
    using desc: Depth_Stencil_Desc;
}

Blend_State :: struct {
    color_blend_equation: VkColorBlendEquationEXT;
    color_write_mask:     VkColorComponentFlags;
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

    vkGetPhysicalDeviceMemoryProperties(physical_device, *memory_properties);

    vkGetDeviceQueue(device, queue_family_indices.graphics, 0, *main_queue);

    if window {
        init_swapchain();

        frames = Basic.NewArray(swapchain.images.count, Frame);

        semaphore_create_info: VkSemaphoreCreateInfo;
        fence_create_info := VkFenceCreateInfo.{
            flags = .SIGNALED
        };

        for * frame: frames {
            result = check_vk(vkCreateSemaphore(device, *semaphore_create_info, vka, *frame.acquire_semaphore));
            assert_vk_result(result);

            result = check_vk(vkCreateFence(device, *fence_create_info, vka, *frame.render_fence));
            assert_vk_result(result);
        }

        present_semaphores = Basic.NewArray(swapchain.images.count, VkSemaphore);
        for * present_semaphore: present_semaphores {
            result = check_vk(vkCreateSemaphore(device, *semaphore_create_info, vka, present_semaphore));
            assert_vk_result(result);
        }

        command_buffers = Basic.NewArray(swapchain.images.count, Command_Buffer);
    } else {
        command_buffers = Basic.NewArray(DEFAULT_COMMAND_BUFFER_COUNT, Command_Buffer);
    }

    command_pool_create_info := VkCommandPoolCreateInfo.{
        // flags = .RESET_COMMAND_BUFFER,
        queueFamilyIndex = queue_family_indices.graphics,
    };
    for * cb: command_buffers {
        result = check_vk(vkCreateCommandPool(device, *command_pool_create_info, vka, *cb.pool));
        assert_vk_result(result);
    }

    slang_result := slang.slang_createGlobalSession(slang.SLANG_API_VERSION, *slang_global_session);
    Basic.assert(!slang.SLANG_FAILED(slang_result));

    // Here we query the device properties for descriptor heap, we may
    // do it in the physical device selection, but it is here now.
    physical_device_properties: VkPhysicalDeviceProperties2;
    physical_device_properties.pNext = *descriptor_heap_properties;
    vkGetPhysicalDeviceProperties2(physical_device, *physical_device_properties);

    Basic.assert(descriptor_heap_properties.minResourceHeapReservedRange == 0, "The minResourceHeapReservedRange is not zero, if you want to support your gpu, you have to work on the create_texture_heap function");

    Basic.assert(descriptor_heap_properties.samplerDescriptorSize == 16, "The sampler descriptor size is not 16, %", descriptor_heap_properties.samplerDescriptorSize);

    set_and_binding_mapping[0].descriptorSet = 0;
    set_and_binding_mapping[0].firstBinding = 2;
    set_and_binding_mapping[0].bindingCount = 1;
    set_and_binding_mapping[0].resourceMask = .SAMPLED_IMAGE | .READ_WRITE_IMAGE;
    set_and_binding_mapping[0].source = .HEAP_WITH_CONSTANT_OFFSET;
    set_and_binding_mapping[0].sourceData.constantOffset = .{
        heapOffset = 0,
        heapArrayStride = xx descriptor_heap_properties.imageDescriptorSize,
    };

    set_and_binding_mapping[1].descriptorSet = 0;
    set_and_binding_mapping[1].firstBinding = 0;
    set_and_binding_mapping[1].bindingCount = 1;
    set_and_binding_mapping[1].resourceMask = .SAMPLER;
    set_and_binding_mapping[1].source = .HEAP_WITH_CONSTANT_OFFSET;
    set_and_binding_mapping[1].sourceData.constantOffset = .{
        heapOffset = 0,
        heapArrayStride = xx descriptor_heap_properties.samplerDescriptorSize,
    };

    // 16 MB should be enough for all descriptor
    descriptor_heap_allocation = vulkan_allocate(16 * 1024 * 1024, .SHADER_DEVICE_ADDRESS | .DESCRIPTOR_HEAP_EXT);
    init_arena_with_vulkan_allocation(*descriptor_heap_arena, descriptor_heap_allocation);
}

deinit :: () {
    using context.gpu_context;
    result: VkResult;
    result = vkDeviceWaitIdle(device);
    assert_vk_result(result);

    vulkan_deallocate(descriptor_heap_allocation);
    if slang_global_session {
        slang.ISlangUnknown_release(xx slang_global_session);
    }

    for frames {
        vkDestroySemaphore(device, it.acquire_semaphore, vka);
        vkDestroyFence(device, it.render_fence, vka);
    }

    for present_semaphores {
        vkDestroySemaphore(device, it, vka);
    }

    for command_buffers {
        if it.pool vkDestroyCommandPool(device, it.pool, vka);
    }

    if sdl_window {
        vkDestroySwapchainKHR(device, swapchain.vk, vka);
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
vulkan_allocate :: (bytes: u64, usage: VkBufferUsageFlags = .SHADER_DEVICE_ADDRESS | .STORAGE_BUFFER | .TRANSFER_DST | .TRANSFER_SRC | .INDEX_BUFFER, required_flags: VkMemoryPropertyFlags = .DEVICE_LOCAL | .HOST_VISIBLE | .HOST_COHERENT, $mapped := true) -> Allocation {
    using context.gpu_context;
    buffer: VkBuffer;
    buffer_create_info := VkBufferCreateInfo.{
        flags = 0,
        size = bytes,
        usage = usage,
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
        memoryTypeIndex = find_memory_type_index(memory_requirements.memoryTypeBits, required_flags),
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
    allocation.memory = memory;
    allocation.buffer = buffer;
    allocation.size = bytes;

    #if mapped {
        result = check_vk(vkMapMemory(device, memory, 0, memory_requirements.size, 0, *allocation.cpu));
        Basic.assert(result == .SUCCESS);
    }

    table_add(*cpu_pointer_table, allocation.cpu, allocation);
    table_add(*gpu_pointer_table, allocation.gpu, allocation);
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
    table_remove(*cpu_pointer_table, allocation.cpu);
    table_remove(*gpu_pointer_table, allocation.gpu);
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

create_texture :: (desc: Texture_Desc, ptr_gpu: Ptr) -> Texture {
    using context.gpu_context;

    allocation := gpu_pointer_to_allocation(ptr_gpu);
    image_create_info := to_vulkan_image_create_info(desc);

    texture: Texture;
    texture.format = desc.format;
    texture.dimensions = desc.dimensions;
    texture.gpu = ptr_gpu;
    result: VkResult;
    result = check_vk(vkCreateImage(device, *image_create_info, vka, *texture.image));
    assert_vk_result(result);

    result = check_vk(vkBindImageMemory(device, texture.image, allocation.memory, ptr_gpu - allocation.gpu));
    assert_vk_result(result);

    transition_info := VkHostImageLayoutTransitionInfo.{
        image = texture.image,
        oldLayout = .UNDEFINED,
        newLayout = .GENERAL,
        subresourceRange = .{
            aspectMask   = .COLOR,
            baseMipLevel   = 0,
            levelCount     = VK_REMAINING_MIP_LEVELS,
            baseArrayLayer = 0,
            layerCount     = VK_REMAINING_ARRAY_LAYERS
        }
    };

    vkTransitionImageLayout(device, 1, *transition_info);

    // The image view is hard coded as 2D, it should only be used in
    // color attachment.
    image_view_create_info := VkImageViewCreateInfo.{
        image = texture.image,
        viewType = .e2D,
        format = desc.format,
        subresourceRange = .{
            aspectMask   = .COLOR,
            baseMipLevel   = 0,
            levelCount     = VK_REMAINING_MIP_LEVELS,
            baseArrayLayer = 0,
            layerCount     = VK_REMAINING_ARRAY_LAYERS
        },
    };

    result = check_vk(vkCreateImageView(device, *image_view_create_info, vka, *texture.view));
    assert_vk_result(result);

    return texture;
}

destroy_texture :: (texture: Texture) {
    using context.gpu_context;
    if texture.image {
        vkDestroyImage(device, texture.image, vka);
    }
    if texture.view {
        vkDestroyImageView(device, texture.view, vka);
    }
}

// This returns a 32 bytes texture descriptor that can be written in a texture heap
texture_view_descriptor :: (texture: Texture, desc: View_Desc, $read_write: bool = false) -> Texture_Descriptor {
    using context.gpu_context;
    image_view_create_info := to_vulkan_image_view_create_info(texture, desc);

    image_descriptor_info := VkImageDescriptorInfoEXT.{
        pView = *image_view_create_info,
        layout = .GENERAL,
    };

    resource_descriptor_info := VkResourceDescriptorInfoEXT.{};
    #if read_write {
        resource_descriptor_info.type = .STORAGE_IMAGE;
    } else {
        resource_descriptor_info.type = .SAMPLED_IMAGE;
    }
    resource_descriptor_info.data.pImage = *image_descriptor_info;

    texture_descriptor: Texture_Descriptor;
    host_address_range := VkHostAddressRangeEXT.{
        address = texture_descriptor.data,
        size = descriptor_heap_properties.imageDescriptorSize,
    };

    vkWriteResourceDescriptorsEXT(device, 1, *resource_descriptor_info, *host_address_range);

    return texture_descriptor;
}

texture_handle :: inline (cb: *Command_Buffer, index: u64) -> u64 {
    return index;
}

sampler_descriptor :: (desc: Sampler_Desc) -> Sampler_Descriptor {
    using context.gpu_context;
    sampler_create_info := to_vulkan_sampler_create_info(desc);

    sampler_descriptor: Sampler_Descriptor;
    host_address_range := VkHostAddressRangeEXT.{
        address = sampler_descriptor.data,
        size = descriptor_heap_properties.samplerDescriptorSize,
    };

    vkWriteSamplerDescriptorsEXT(device, 1, *sampler_create_info, *host_address_range);

    return sampler_descriptor;
}

sampler_handle :: inline (cb: *Command_Buffer, index: u64) -> u64 {
    return index;
}

load_spirv :: (spirv: string, entry_points: []string) -> []IR {
    irs := Basic.NewArray(entry_points.count, IR);

    for entry_points {
        irs[it_index].spirv = spirv;
        irs[it_index].entry_point = it;
    }

    return irs;
}

load_slang :: (shader: string, entry_points: [] string) -> []IR {
    spirv_code := slang_to_spirv(shader, entry_points, context.gpu_context.slang_global_session);
    return load_spirv(spirv_code, entry_points);
}

load_ir :: (shader_name: string, entry_points: []string) -> []IR {
    shader_path := Basic.tprint("%%.slang", SHADER_BASE_DIRECTORY, shader_name);

    shader_data, ok := File.read_entire_file(shader_path);
    Basic.assert(ok);
    return load_slang(shader_data, entry_points);
}

// This is a dummy function in Vulkan
destroy_ir :: (ir: IR) {

}

create_compute_pipeline :: (ir: IR) -> Pipeline {
    using context.gpu_context;
    Basic.auto_release_temp();
    descriptor_set_and_binding_mapping_info := VkShaderDescriptorSetAndBindingMappingInfoEXT.{
        mappingCount = xx set_and_binding_mapping.count,
        pMappings = set_and_binding_mapping.data,
    };
    create_info := VkShaderCreateInfoEXT.{
        pNext = *descriptor_set_and_binding_mapping_info,
        flags = .DESCRIPTOR_HEAP,
        stage = .COMPUTE,
        nextStage = 0, // because we don't know what the next will be
        codeType = .SPIRV,
        codeSize = xx ir.spirv.count, // This should be a multiple of 4
        pCode = ir.spirv.data,
        pName = Basic.temp_c_string(ir.entry_point),
        setLayoutCount = 0, // We don't use any descriptor set
        pSetLayouts = null,
        pushConstantRangeCount = 0,
        pPushConstantRanges = null,
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

    descriptor_set_and_binding_mapping_info := VkShaderDescriptorSetAndBindingMappingInfoEXT.{
        mappingCount = xx set_and_binding_mapping.count,
        pMappings = set_and_binding_mapping.data,
    };

    create_infos: [2]VkShaderCreateInfoEXT;

    create_infos[0] = VkShaderCreateInfoEXT.{
        pNext = *descriptor_set_and_binding_mapping_info,
        flags = .DESCRIPTOR_HEAP,
        stage = .VERTEX,
        nextStage = .FRAGMENT,
        codeType = .SPIRV,
        codeSize = xx vertex_ir.spirv.count, // This should be a multiple of 4
        pCode = vertex_ir.spirv.data,
        pName = Basic.temp_c_string(vertex_ir.entry_point),
        setLayoutCount = 0, // We don't use any descriptor set
        pSetLayouts = null,
        pushConstantRangeCount = 0,
        pPushConstantRanges = null,
        pSpecializationInfo = null, // Don't know what this is yet
    };

    create_infos[1] = VkShaderCreateInfoEXT.{
        pNext = *descriptor_set_and_binding_mapping_info,
        flags = .DESCRIPTOR_HEAP,
        stage = .FRAGMENT,
        nextStage = 0,
        codeType = .SPIRV,
        codeSize = xx fragment_ir.spirv.count, // This should be a multiple of 4
        pCode = fragment_ir.spirv.data,
        pName = Basic.temp_c_string(fragment_ir.entry_point),
        setLayoutCount = 0, // We don't use any descriptor set
        pSetLayouts = null,
        pushConstantRangeCount = 0,
        pPushConstantRanges = null,
        pSpecializationInfo = null, // Don't know what this is yet
    };

    result: VkResult;
    shaders: [2]VkShaderEXT;
    result = check_vk(vkCreateShadersEXT(device, 2, create_infos.data, vka, shaders.data));
    assert_vk_result(result);

    pipeline: Pipeline;
    pipeline.shaders[0] = shaders[0];
    pipeline.shaders[1] = shaders[1];
    pipeline.is_compute = false;

    return pipeline;
}

destroy_pipeline :: (pipeline: Pipeline) {
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

start_command_recording :: () -> *Command_Buffer {
    using context.gpu_context;

    result: VkResult;
    cb := *command_buffers[command_buffer_index];

    result = check_vk(vkResetCommandPool(device, cb.pool, 0));
    assert_vk_result(result);

    allocate_info := VkCommandBufferAllocateInfo.{
        commandPool = cb.pool,
        level = .PRIMARY,
        commandBufferCount = 1,
    };
    result = check_vk(vkAllocateCommandBuffers(device, *allocate_info, *cb.vk));
    assert_vk_result(result);

    begin_info := VkCommandBufferBeginInfo.{
        flags = .ONE_TIME_SUBMIT,
    };
    result = vkBeginCommandBuffer(cb.vk, *begin_info);
    assert_vk_result(result);

    if sdl_window {
        swapchain_image_barrier := VkImageMemoryBarrier2.{
            srcStageMask     = .ALL_COMMANDS,
            srcAccessMask    = .MEMORY_WRITE,
            dstStageMask     = .ALL_COMMANDS,
            dstAccessMask    = .MEMORY_WRITE | .MEMORY_READ,
            oldLayout        = .UNDEFINED,
            newLayout        = .GENERAL,
            image            = swapchain.images[acquired_image_index],
            subresourceRange = .{
                aspectMask   = .COLOR,
                baseMipLevel   = 0,
                levelCount     = VK_REMAINING_MIP_LEVELS,
                baseArrayLayer = 0,
                layerCount     = VK_REMAINING_ARRAY_LAYERS
            }
        };
        dependency_info := VkDependencyInfo.{
            imageMemoryBarrierCount = 1,
            pImageMemoryBarriers    = *swapchain_image_barrier,
        };
        vkCmdPipelineBarrier2(cb.vk, *dependency_info);
    }
    return cb;
}

submit :: (queue: Queue, command_buffer: *Command_Buffer, wait: []Semaphore_Pair = .[], signal: []Semaphore_Pair = .[]) {
    using context.gpu_context;
    Basic.auto_release_temp();
    Basic.push_allocator(Basic.temp);

    command_buffer_submit_info: VkCommandBufferSubmitInfo;

    vkEndCommandBuffer(command_buffer.vk);
    command_buffer_submit_info.commandBuffer = command_buffer.vk;

    submit_info := VkSubmitInfo2.{
        commandBufferInfoCount = 1,
        pCommandBufferInfos = *command_buffer_submit_info,
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

    command_buffer_index = (command_buffer_index + 1) % xx command_buffers.count;
}

// Very similar to submit() but consist of swapchain related semaphores
submit_and_present :: (queue: Queue, swapchain_texture: Texture, command_buffer: *Command_Buffer, wait: []Semaphore_Pair = .[], signal: []Semaphore_Pair = .[]) {
    using context.gpu_context;
    Basic.auto_release_temp();
    Basic.push_allocator(Basic.temp);

    frame := frames[frame_index];

    present_image_barrier := VkImageMemoryBarrier2.{
        srcStageMask     = .ALL_COMMANDS,
        srcAccessMask    = .MEMORY_WRITE,
        dstStageMask     = .ALL_COMMANDS,
        dstAccessMask    = .MEMORY_WRITE | .MEMORY_READ,
        oldLayout        = .GENERAL,
        newLayout        = .PRESENT_SRC_KHR,
        image            = swapchain_texture.image,
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

    vkCmdPipelineBarrier2(command_buffer.vk, *present_barrier_info);

    command_buffer_submit_info: VkCommandBufferSubmitInfo;

    vkEndCommandBuffer(command_buffer.vk);
    command_buffer_submit_info.commandBuffer = command_buffer.vk;


    submit_info := VkSubmitInfo2.{
        commandBufferInfoCount = 1,
        pCommandBufferInfos = *command_buffer_submit_info,
    };

    wait_infos: [..] VkSemaphoreSubmitInfo;
    wait_infos.allocator = Basic.temp;
    for wait {
        sema_info := VkSemaphoreSubmitInfo.{
            semaphore = it.semaphore,
            value = it.value,
            stageMask = .ALL_COMMANDS,
        };
        Basic.array_add(*wait_infos, sema_info);
    }

    wait_acquire_info := VkSemaphoreSubmitInfo.{
        semaphore = frame.acquire_semaphore,
        value = 1,
        stageMask = .COLOR_ATTACHMENT_OUTPUT, // Not sure about this
    };
    Basic.array_add(*wait_infos, wait_acquire_info);

    submit_info.waitSemaphoreInfoCount = xx wait_infos.count;
    submit_info.pWaitSemaphoreInfos = wait_infos.data;

    signal_infos: [..] VkSemaphoreSubmitInfo;
    signal_infos.allocator = Basic.temp;
    for signal {
        sema_info := VkSemaphoreSubmitInfo.{
            semaphore = it.semaphore,
            value = it.value,
        };
        Basic.array_add(*signal_infos, sema_info);
    }

    signal_present_info := VkSemaphoreSubmitInfo.{
        semaphore = present_semaphores[acquired_image_index],
        value = 1,
        stageMask = .ALL_GRAPHICS,
    };
    Basic.array_add(*signal_infos, signal_present_info);

    submit_info.signalSemaphoreInfoCount = xx signal_infos.count;
    submit_info.pSignalSemaphoreInfos = signal_infos.data;

    result: VkResult;
    result = check_vk(vkQueueSubmit2(queue.vk, 1, *submit_info, frame.render_fence));
    assert_vk_result(result);

    present_info := VkPresentInfoKHR.{
        waitSemaphoreCount = 1,
        pWaitSemaphores = *present_semaphores[acquired_image_index],
        swapchainCount = 1,
        pSwapchains = *swapchain.vk,
        pImageIndices = *acquired_image_index,
    };

    result = vkQueuePresentKHR(queue.vk, *present_info);
    if result == {
    case .ERROR_OUT_OF_DATE_KHR;
        ;
    case .SUBOPTIMAL_KHR;
        ;
    case .SUCCESS;
        ;
    case;
        Basic.log_error("present failed");
        return;
    }

    frame_index = (frame_index + 1) % xx frames.count;
    command_buffer_index = (command_buffer_index + 1) % xx command_buffers.count;
}

memcpy :: (cb: *Command_Buffer, dst: Ptr, src: Ptr, size: u64) {
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

    vkCmdCopyBuffer2(cb.vk, *copy_info);
}

// This perform image copy on host
host_copy_to_texture :: (dst: Texture, src: *void) {
    using context.gpu_context;
    memory_to_image_copy := VkMemoryToImageCopy.{
        pHostPointer = src,
        memoryRowLength = 0,
        memoryImageHeight = 0,
        imageSubresource = VkImageSubresourceLayers.{
            aspectMask = .COLOR,
            mipLevel = 0,
            baseArrayLayer = 0,
            layerCount = 1,
        },
        imageOffset = VkOffset3D.{},
        imageExtent = VkExtent3D.{
            width = dst.dimensions.x,
            height = dst.dimensions.y,
            depth = dst.dimensions.z,
        },
    };

    copy_memory_info := VkCopyMemoryToImageInfo.{
        dstImage = dst.image,
        dstImageLayout = .GENERAL,
        regionCount = 1,
        pRegions = *memory_to_image_copy,
    };

    vkCopyMemoryToImage(device, *copy_memory_info);
}

copy_to_texture :: (cb: *Command_Buffer, dst: Texture, src: Ptr) {
    copy_to_texture(cb, dst, src, .{0, 0, 0}, dst.dimensions);
}

copy_to_texture :: (cb: *Command_Buffer, dst: Texture, src: Ptr, image_offset: s32x3, image_extent: u32x3) {
    src_allocation := gpu_pointer_to_allocation(src);

    region := VkBufferImageCopy2.{
        bufferOffset = src - src_allocation.gpu,
        bufferRowLength = 0, // Let vulkan do the job
        bufferImageHeight = 0,
        imageSubresource = VkImageSubresourceLayers.{
            aspectMask = .COLOR,
            mipLevel = 0,
            baseArrayLayer = 0,
            layerCount = 1,
        },
        imageOffset = cast,force(VkOffset3D) image_offset,
        imageExtent = cast,force(VkExtent3D)image_extent,
    };

    info := VkCopyBufferToImageInfo2.{
        srcBuffer = src_allocation.buffer,
        dstImage = dst.image,
        dstImageLayout = .GENERAL,
        regionCount = 1,
        pRegions = *region,
    };

    vkCmdCopyBufferToImage2(cb.vk, *info);
}

copy_from_texture :: (cb: *Command_Buffer, dst: Ptr, src: Texture) {
    dst_allocation := gpu_pointer_to_allocation(dst);

    region := VkBufferImageCopy2.{
        bufferOffset = dst - dst_allocation.gpu,
        bufferRowLength = 0, // Let vulkan do the job
        bufferImageHeight = 0,
        imageSubresource = VkImageSubresourceLayers.{
            aspectMask = .COLOR,
            mipLevel = 0,
            baseArrayLayer = 0,
            layerCount = 1,
        },
        imageOffset = VkOffset3D.{0, 0, 0},
        imageExtent = src.dimensions,
    };

    info := VkCopyImageToBufferInfo2.{
        srcImage = src.image,
        srcImageLayout = .GENERAL,
        dstBuffer = dst_allocation.buffer,
        regionCount = 1,
        pRegions = *region,
    };
    vkCmdCopyImageToBuffer2(cb.vk, *info);
}

// It only supports color image
copy_texture :: (cb: *Command_Buffer, dst: Texture, src: Texture, $IDENTICAL := false) {
    region := VkImageBlit2.{
        srcSubresource = .{
            aspectMask = .COLOR,
            layerCount = 1
        },
        dstSubresource = .{
            aspectMask = .COLOR,
            layerCount = 1
        },
    };
    region.srcOffsets[1] = .{
        x = xx src.dimensions.x,
        y = xx src.dimensions.y,
        z = xx src.dimensions.z,
    };
    region.dstOffsets[1] = .{
        x = xx dst.dimensions.x,
        y = xx dst.dimensions.y,
        z = xx dst.dimensions.z,
    };
    info := VkBlitImageInfo2.{
        srcImage = src.image,
        srcImageLayout = .GENERAL,
        dstImage = dst.image,
        dstImageLayout = .GENERAL,
        regionCount = 1,
        pRegions = *region,
        filter = .LINEAR,
    };
    vkCmdBlitImage2(cb.vk, *info);
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

signal_semaphore :: (semaphore: Semaphore, value: u64) {
    using context.gpu_context;
    signal_info := VkSemaphoreSignalInfo.{
        semaphore = semaphore.vk,
        value = value,
    };
    result := check_vk(vkSignalSemaphore(device, *signal_info));
    assert_vk_result(result);
}

destroy_semaphore :: (semaphore: Semaphore) {
    using context.gpu_context;
    vkDestroySemaphore(device, semaphore, vka);
}

// This function is weird
barrier :: (cb: *Command_Buffer, before: Stage, after: Stage, hazards: Hazard = 0) {
    dependency_info := VkDependencyInfo.{
        dependencyFlags = 0,
    };

    memory_barrier := VkMemoryBarrier2.{
        srcStageMask = to_vulkan_pipeline_stage(before),
        srcAccessMask = .NONE,
        dstStageMask = to_vulkan_pipeline_stage(after),
        dstAccessMask = .NONE,
    };

    if before & .BLIT || before & .COPY || before & .TRANSFER {
        memory_barrier.srcAccessMask |= .TRANSFER_WRITE;
    }

    if hazards & .DRAW_ARGUMENTS {
        memory_barrier.srcAccessMask |= .SHADER_WRITE;
        memory_barrier.dstAccessMask |= .INDIRECT_COMMAND_READ;
    }

    if hazards & .DESCRIPTORS {
        memory_barrier.srcAccessMask |= .SHADER_WRITE;
        memory_barrier.dstAccessMask |= .SHADER_READ | .SHADER_STORAGE_READ;
    }

    if hazards & .DEPTH_STENCIL {
        memory_barrier.srcAccessMask |= .DEPTH_STENCIL_ATTACHMENT_WRITE;
        memory_barrier.dstAccessMask |= .DEPTH_STENCIL_ATTACHMENT_WRITE | .DEPTH_STENCIL_ATTACHMENT_READ;
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

set_pipeline :: (cb: *Command_Buffer, pipeline: Pipeline) {
    if pipeline.is_compute {
        stage: VkShaderStageFlagBits = .COMPUTE;
        vkCmdBindShadersEXT(cb, 1, *stage, pipeline.shaders.data);
    } else {
        stages := VkShaderStageFlagBits.[.VERTEX, .FRAGMENT];
        vkCmdBindShadersEXT(cb, 2, stages.data, pipeline.shaders.data);
    }
}

// Threads is ignored in Vulkan, they can only be set in shader.
dispatch :: (cb: *Command_Buffer, data_gpu: Ptr, groups: u32x3, threads: u32x3) {
    // We no longer use push constants.
    range := VkHostAddressRangeConstEXT.{
        address = *data_gpu,
        size = size_of(u64),
    };
    push_data_info := VkPushDataInfoEXT.{
        offset = 0,
        data = range,
    };
    vkCmdPushDataEXT(cb, *push_data_info);
    vkCmdDispatch(cb, groups.x, groups.y, groups.z);
}

dispatch :: (cb: *Command_Buffer, data_gpu: Ptr, count: u32) {
    dispatch(cb, data_gpu, .{count, 1, 1}, .{256, 1, 1});
}

acquire_swapchain_texture :: () -> success:bool, Texture {
    using context.gpu_context;

    frame := frames[frame_index];
    check_vk(vkWaitForFences(device, 1, *frame.render_fence, VK_TRUE, 10000));
    check_vk(vkResetFences(device, 1, *frame.render_fence));
    acquire_info := VkAcquireNextImageInfoKHR.{
        swapchain = swapchain.vk,
        timeout = 10000,
        semaphore = frame.acquire_semaphore,
        fence = null,
        deviceMask = 1, // I still do not understand what deviceMask is
    };

    result: VkResult;
    result = vkAcquireNextImage2KHR(device, *acquire_info, *acquired_image_index);
    if result != .SUCCESS && result != .SUBOPTIMAL_KHR {
        return false, .{};
    }

    current_image := swapchain.images[acquired_image_index];
    texture: Texture;
    texture.image = current_image;
    texture.dimensions = .{
        x = swapchain.extent.width,
        y = swapchain.extent.height,
        z = 1,
    };

    return true, texture;
}

begin_render_pass :: (cb: *Command_Buffer, desc: Render_Pass_Desc) {
    Basic.push_allocator(Basic.temp);
    Basic.auto_release_temp();
    rendering_info := to_vulkan_rendering_info(desc);
    vkCmdBeginRendering(cb.vk, *rendering_info);

    // There are a lot of dynamic states to set. If we truely follow
    // No Graphics API, we will end up calling disable on some
    // function and then enable it when binding to a state, which is
    // fine for now, because we want a sensible default to show
    // something on screen first.
    //
    // Most of the state only set for the first render target, which
    // should be the render texture. A lot of setting are commented
    // out just for reference.

    // No culling by default
    vkCmdSetCullMode(cb.vk, .NONE);

    // No blending by default, blend should be set by blend_state object.
    is_enable_blend: VkBool32 = VK_FALSE;
    vkCmdSetColorBlendEnableEXT(cb.vk, 0, 1, *is_enable_blend);
    // color_blend_equation := VkColorBlendEquationEXT.{

    // };
    // vkCmdSetColorBlendEquationEXT(cb.vk, 0, 1, *color_blend_equation);
    // blend_constants: float;
    // vkCmdSetBlendConstants(cb.vk, *blend_constants);
    // vkCmdSetLogicOpEnableEXT(cb.vk, VK_FALSE);

    // Allow 4-channel write by default
    color_write_mask: VkColorComponentFlags  = .R | .G | .B | .A;
    vkCmdSetColorWriteMaskEXT(cb.vk, 0, 1, *color_write_mask);


    // MSAA (multisample anti-aliasing), we don't want msaa, just set
    // to one bit.
    sample_mask: VkSampleMask = 0x1;
    vkCmdSetSampleMaskEXT(cb.vk, .e1, *sample_mask);
    vkCmdSetRasterizationSamplesEXT(cb.vk, .e1);
    vkCmdSetAlphaToCoverageEnableEXT(cb.vk, VK_FALSE);

    // This should never be discarded, otherwise fragment shader will
    // not be executed. Don't know why this is necessary.
    vkCmdSetRasterizerDiscardEnable(cb.vk, VK_FALSE);

    // If the default mode is FILL, line width does not matter, but I
    // just want to have a default width for future dynamically
    // changing polygon mode without validation error.
    vkCmdSetPolygonModeEXT(cb.vk, .FILL);
    vkCmdSetLineWidth(cb.vk, 1.0); // Not necessary

    // Depth
    vkCmdSetDepthTestEnable(cb.vk, VK_FALSE);
    vkCmdSetDepthBiasEnable(cb.vk, VK_FALSE);
    // vkCmdSetDepthWriteEnable(cb.vk, VK_FALSE);
    // vkCmdSetDepthCompareOp(cb.vk, .NEVER);
    vkCmdSetStencilTestEnable(cb.vk, VK_FALSE);
    // vkCmdSetStencilOp(cb.vk, .FRONT, .KEEP, .KEEP, .KEEP, .NEVER);

    // Vertex input is always nothing in No Graphics API
    vkCmdSetVertexInputEXT(cb.vk, 0, null, 0, null);

    // TODO: Understand this, this is index draw magic shit.
    vkCmdSetPrimitiveRestartEnable(cb.vk, VK_FALSE);
}

end_render_pass :: (cb: *Command_Buffer) {
    vkCmdEndRendering(cb.vk);
}

resize_callback :: (window_width: s32, window_height: s32) {
    using context.gpu_context;
    // Recreate swapchain here
    vkDeviceWaitIdle(device);
    vkDestroySwapchainKHR(device, swapchain.vk, vka);
    Basic.array_free(swapchain.images);

    support := swapchain.support;

    swapchain_extent: VkExtent2D;
    swapchain_extent.width = Basic.clamp(window_width.(u32),  support.capabilities.minImageExtent.width, support.capabilities.maxImageExtent.width);
    swapchain_extent.height = Basic.clamp(window_height.(u32), support.capabilities.minImageExtent.height, support.capabilities.maxImageExtent.height);

    swapchain.create_info.imageExtent = swapchain_extent;

    result: VkResult;
    result = check_vk(vkCreateSwapchainKHR(device, *swapchain.create_info, vka, *swapchain.vk));
    assert_vk_result(result);
    swapchain.extent = swapchain_extent;

    result, swapchain.images = vkGetSwapchainImagesKHR(device, swapchain.vk);
    assert_vk_result(result);
}

frame_count :: () -> s64 {
    using context.gpu_context;
    return command_buffers.count;
}

frame_index :: () -> s64 {
    using context.gpu_context;

    return command_buffer_index;
}

// Currently we do not support minResourceHeapReservedRange != 0
set_active_texture_heap :: (cb: *Command_Buffer, texture_heap: [] Texture_Descriptor) {
    gpu := host_to_device_pointer(texture_heap.data);
    bind_heap_info := VkBindHeapInfoEXT.{
        heapRange = .{
            address = gpu,
            size    = xx (size_of(Texture_Descriptor) * texture_heap.count),
        },
    };

    vkCmdBindResourceHeapEXT(cb.vk, *bind_heap_info);
}

// The reason why we have a dedicated function for creating texture
// heap than letting users to allocate arbitary buffer is because
// descriptor heap requires a special buffer flags
// DESCRIPTOR_HEAP_EXT. Making all memory allocated confront to
// DESCRIPTOR_HEAP seems to be a bad idea. Also, by making a special
// function, the Metal implementation can be a dummy function.
create_texture_heap :: (count: s64) -> [] Texture_Descriptor {
    using context.gpu_context;

    heap: [] Texture_Descriptor;
    heap.count = count;
    heap.data = get(*descriptor_heap_arena, count * size_of(Texture_Descriptor), xx descriptor_heap_properties.imageDescriptorAlignment);

    return heap;
}

create_sampler_heap :: (count: s64) -> [] Sampler_Descriptor {
    using context.gpu_context;

    heap: [] Sampler_Descriptor;
    heap.count = count;
    heap.data = get(*descriptor_heap_arena, count * size_of(Sampler_Descriptor), xx descriptor_heap_properties.samplerDescriptorAlignment);

    return heap;
}

reset_descriptor_heap_arena :: () {
    using context.gpu_context;
    reset(*descriptor_heap_arena);
}

set_viewport :: (cb: *Command_Buffer, viewport: Viewport) {
    vk: VkViewport;
    vk.x = viewport.x;
    vk.y = viewport.y;
    vk.width = viewport.width;
    vk.height = viewport.height;
    vk.minDepth = viewport.min_depth;
    vk.maxDepth = viewport.max_depth;
    // vkCmdSetViewport(cb.vk, 0, 1, *vk);
    vkCmdSetViewportWithCount(cb.vk, 1, *vk);
}

set_scissor :: (cb: *Command_Buffer, scissor: Rect) {
    rect: VkRect2D;
    rect.offset.x = xx scissor.origin.x;
    rect.offset.y = xx scissor.origin.y;
    rect.extent = cast,force(VkExtent2D) scissor.size;
    // vkCmdSetScissor(cb.vk, 0, 1, *rect);
    vkCmdSetScissorWithCount(cb.vk, 1, *rect);
}

set_topology :: (cb: *Command_Buffer, topology: Topology) {
    vkCmdSetPrimitiveTopology(cb.vk, to_vulkan_topology(topology));
}

draw_indexed_instanced :: (cb: *Command_Buffer, vertex_data_gpu: Ptr, fragment_data_gpu: Ptr, indices: Array, instance_count: u32) {
    using context.gpu_context;

    Params :: struct {
        vertex_input: Ptr;
        fragment_input: Ptr;
    }

    params := Params.{
        vertex_data_gpu,
        fragment_data_gpu,
    };

    push_data_info := VkPushDataInfoEXT.{
        data = VkHostAddressRangeConstEXT.{
            address = *params,
            size    = xx size_of(Params),
        },
    };
    vkCmdPushDataEXT(cb.vk, *push_data_info);
    index_buffer_info := VkBindIndexBuffer3InfoKHR.{
        addressRange = .{
            address = indices.gpu_ptr,
            size = xx (size_of(u32) * indices.count),
        },
        addressFlags = .STORAGE_BUFFER_USAGE,
        indexType = .UINT32,
    };
    vkCmdBindIndexBuffer3KHR(cb.vk, *index_buffer_info);

    vkCmdDrawIndexed(cb.vk, xx indices.count, instance_count, 0, 0, 0);
}

draw :: (cb: *Command_Buffer, vertex_data_gpu: Ptr, fragment_data_gpu: Ptr, vertex_count: u32, instance_count: u32) {
    using context.gpu_context;

    Params :: struct {
        vertex_input: Ptr;
        fragment_input: Ptr;
    }

    params := Params.{
        vertex_data_gpu,
        fragment_data_gpu,
    };

    push_data_info := VkPushDataInfoEXT.{
        data = VkHostAddressRangeConstEXT.{
            address = *params,
            size    = xx size_of(Params),
        },
    };
    vkCmdPushDataEXT(cb.vk, *push_data_info);

    vkCmdDraw(cb.vk, vertex_count, instance_count, 0, 0);
}

create_blend_state :: (desc: Blend_Desc) -> Blend_State {
    state: Blend_State;

    state.color_blend_equation = VkColorBlendEquationEXT.{
        srcColorBlendFactor = to_vulkan_blend_factor(desc.src_color_factor),
        dstColorBlendFactor = to_vulkan_blend_factor(desc.dst_color_factor),
        colorBlendOp = to_vulkan_blend_op(desc.color_op),
        srcAlphaBlendFactor = to_vulkan_blend_factor(desc.src_alpha_factor),
        dstAlphaBlendFactor = to_vulkan_blend_factor(desc.dst_alpha_factor),
        alphaBlendOp = to_vulkan_blend_op(desc.alpha_op),
    };
    state.color_write_mask = cast,force(VkColorWriteMask) desc.color_write_mask;

    return state;
}

// It only sets the first color attachment.
set_blend_state :: (cb: *Command_Buffer, state: Blend_State) {
    enable: VkBool32 = VK_TRUE;
    vkCmdSetColorBlendEnableEXT(cb.vk, 0, 1, *enable);
    vkCmdSetColorBlendEquationEXT(cb.vk, 0, 1, *state.color_blend_equation);
    // This constant should no matter if we are not using any CONSTANT
    // thing in blend factor.
    //
    // blend_constants: float;
    // vkCmdSetBlendConstants(cb.vk, *blend_constants);

    vkCmdSetColorWriteMaskEXT(cb.vk, 0, 1, *state.color_write_mask);
}

// There is no such a thing as depth stencil state in vulkan, we just
// set the related things dynamically according to desc.
create_depth_stencil_state :: (desc: Depth_Stencil_Desc) -> Depth_Stencil_State {
    state: Depth_Stencil_State;
    state.desc = desc;

    return state;
}

set_depth_stencil_state :: (cb: *Command_Buffer, state: Depth_Stencil_State) {
    vkCmdSetDepthTestEnable(cb.vk, ifx state.depth_mode & .READ then VK_TRUE else VK_FALSE);
    vkCmdSetDepthCompareOp(cb.vk, to_vulkan_compare_op(state.depth_test));
    vkCmdSetDepthWriteEnable(cb.vk, ifx state.depth_mode & .WRITE then VK_TRUE else VK_FALSE);

    // TODO: Always enableds this?
    vkCmdSetDepthBiasEnable(cb.vk, VK_TRUE);
    vkCmdSetDepthBias(cb.vk, state.depth_bias, state.depth_bias_clamp, state.depth_bias_slope_factor);

    // TODO: Is there any way to disable this?
    vkCmdSetStencilTestEnable(cb.vk, VK_TRUE);
    vkCmdSetStencilOp(cb.vk, .FRONT, to_vulkan_stencil_op(state.stencil_front.fail_op), to_vulkan_stencil_op(state.stencil_front.pass_op), to_vulkan_stencil_op(state.stencil_front.depth_fail_op), to_vulkan_stencil_op(state.stencil_front.test));
    vkCmdSetStencilOp(cb.vk, .BACK, to_vulkan_stencil_op(state.stencil_back.fail_op), to_vulkan_stencil_op(state.stencil_back.pass_op), to_vulkan_stencil_op(state.stencil_back.depth_fail_op), to_vulkan_stencil_op(state.stencil_back.test));
    vkCmdSetStencilCompareMask(cb.vk, .FRONT_AND_BACK, cast(u32) state.stencil_read_mask);
    vkCmdSetStencilWriteMask(cb.vk, .FRONT_AND_BACK, cast(u32) state.stencil_write_mask);
    vkCmdSetStencilReference(cb.vk, .FRONT, cast(u32)state.stencil_front.reference);
    vkCmdSetStencilReference(cb.vk, .BACK, cast(u32)state.stencil_back.reference);
}

wait_device_idle :: () {
    using context.gpu_context;
    vkDeviceWaitIdle(device);
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
    vk:          VkSwapchainKHR;
    format:      VkFormat;
    extent:      VkExtent2D;
    images:      []VkImage;
    // We are not rendering directly into swapchain images, so we can
    // omit the image view creation of swapchain images.

    create_info: VkSwapchainCreateInfoKHR;

    support: Swapchain_Support;
}

Frame :: struct {
    acquire_semaphore: VkSemaphore;

    render_fence: VkFence;

}

VALIDATION_LAYERS :: (*u8).["VK_LAYER_KHRONOS_validation"];
DEVICE_EXTENSIONS :: (*u8).[
VK_EXT_SHADER_OBJECT_EXTENSION_NAME,
VK_EXT_DESCRIPTOR_HEAP_EXTENSION_NAME,
VK_KHR_UNIFIED_IMAGE_LAYOUTS_EXTENSION_NAME,
VK_KHR_SHADER_UNTYPED_POINTERS_EXTENSION_NAME,
VK_KHR_DEVICE_ADDRESS_COMMANDS_EXTENSION_NAME,
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
        // case .VERBOSE;
        //     Basic.log("[VERBOSE] %", to_string(pCallbackData.pMessage));
        // case .INFO;
        //     Basic.log("[INFO ] %", to_string(pCallbackData.pMessage));
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
    features_device_address_commands := VkPhysicalDeviceDeviceAddressCommandsFeaturesKHR.{
        deviceAddressCommands = VK_TRUE,
    };
    chain = *features_device_address_commands;

    features_shader_untyped_pointer := VkPhysicalDeviceShaderUntypedPointersFeaturesKHR.{
        pNext = chain,
        shaderUntypedPointers = VK_TRUE,
    };
    chain = *features_shader_untyped_pointer;

    features_unified_image_layouts := VkPhysicalDeviceUnifiedImageLayoutsFeaturesKHR.{
        pNext = chain,
        unifiedImageLayouts = VK_TRUE,
    };
    chain = *features_unified_image_layouts;

    features_descriptor_heap := VkPhysicalDeviceDescriptorHeapFeaturesEXT.{
        pNext = chain,
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
        hostImageCopy = VK_TRUE,
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
        vulkanMemoryModel                             = VK_TRUE,
        vulkanMemoryModelDeviceScope                  = VK_TRUE,
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

find_memory_type_index :: (memory_type_bits: u32, required_flags: VkMemoryPropertyFlags) -> u32 {
    using context.gpu_context;
    for 0..memory_properties.memoryTypeCount - 1 {
        if (memory_type_bits & (1 << cast(u32)it)) &&
        (memory_properties.memoryTypes[it].propertyFlags & required_flags) == required_flags {
            return cast(u32)it;
        }
    }

    return Math.U32_MAX;
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
    case .e1D_ARRAY;
        image_type = .e1D;
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
    case .e1D_ARRAY;
        image_view_type = .e1D_ARRAY;
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
    return cast(VkImageUsageFlags) usage;
}

to_vulkan_image_create_info :: (desc: Texture_Desc) -> VkImageCreateInfo {
    info := VkImageCreateInfo.{
        imageType = to_vulkan_image_type(desc.type),
        format = desc.format,
        extent = cast,force(VkExtent3D) desc.dimensions,
        mipLevels = desc.mip_count,
        arrayLayers = desc.layer_count,
        samples = to_vulkan_sample_count(desc.sample_count),
        tiling = .OPTIMAL,
        usage = to_vulkan_image_usage(desc.usage) | .HOST_TRANSFER,
        sharingMode = .EXCLUSIVE,
        initialLayout = .UNDEFINED,
    };

    return info;
}

to_vulkan_image_view_create_info :: (texture: Texture, desc: View_Desc) -> VkImageViewCreateInfo {
    image_view_create_info := VkImageViewCreateInfo.{
        image = texture.image,
        viewType = to_vulkan_image_view_type(desc.type),
        format = desc.format,
        subresourceRange = VkImageSubresourceRange.{
            aspectMask     = .COLOR,
            baseMipLevel   = desc.base_mip,
            levelCount     = desc.mip_count,
            baseArrayLayer = desc.base_layer,
            layerCount     = desc.layer_count,
        }
    };

    return image_view_create_info;
}

to_vulkan_pipeline_stage :: (stage: Stage) -> VkPipelineStageFlags2 {
    vk: VkPipelineStageFlags2 = .NONE;
    if stage & .COMPUTE {
        vk |= .COMPUTE_SHADER;
    }
    if stage & .VERTEX {
        vk |= .VERTEX_SHADER;
    }
    if stage & .FRAGMENT {
        vk |= .FRAGMENT_SHADER;
    }
    if stage & .COPY {
        vk |= .COPY;
    }
    if stage & .BLIT {
        vk |= .BLIT;
    }
    if stage & .ALL {
        vk |= .ALL_COMMANDS;
    }
    if stage & .TRANSFER {
        vk |= .TRANSFER;
    }

    return vk;
}

init_swapchain :: () {
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

    window_width: s32;
    window_height: s32;
    ok := SDL_GetWindowSizeInPixels(sdl_window, *window_width, *window_height);
    if !ok return;

    swapchain_extent := support.capabilities.currentExtent;
    if swapchain_extent.width == Math.U32_MAX {
        swapchain_extent.width = Basic.clamp(window_width.(u32),  support.capabilities.minImageExtent.width, support.capabilities.maxImageExtent.width);
        swapchain_extent.height = Basic.clamp(window_height.(u32), support.capabilities.minImageExtent.height, support.capabilities.maxImageExtent.height);
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
    swapchain.format = format.format;
    swapchain.extent = swapchain_extent;
    swapchain.support = support;
    swapchain.create_info = swapchain_create_info;
    result = check_vk(vkCreateSwapchainKHR(device, *swapchain_create_info, vka, *swapchain.vk));
    assert_vk_result(result);

    result, swapchain.images = vkGetSwapchainImagesKHR(device, swapchain.vk);
    assert_vk_result(result);
}

find_depth_format :: () -> VkFormat {
    using context.gpu_context;

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

to_vulkan_load_op :: (op: Load_OP) -> VkAttachmentLoadOp {
    if #complete op == {
    case .DONT_CARE;
        return .DONT_CARE;
    case .LOAD;
        return .LOAD;
    case .CLEAR;
        return .CLEAR;
    }
}

to_vulkan_store_op :: (op: Store_OP) -> VkAttachmentStoreOp {
    if #complete op == {
    case .STORE;
        return .STORE;
    case .DONT_CARE;
        return .DONT_CARE;
    }
}

to_vulkan_clear_color :: (color: Math.Vector4) -> VkClearValue {
    clear_value: VkClearValue;

    memcpy(*clear_value.color.float32_, *color, size_of(float32) * 4);

    return clear_value;
}

// Recommend to use temp allocator
to_vulkan_rendering_info :: (desc: Render_Pass_Desc) -> VkRenderingInfo {
    using context.gpu_context;
    color_attachments: [..] VkRenderingAttachmentInfo;
    for desc.color_targets {
        color_attachment := VkRenderingAttachmentInfo.{
            imageView = it.texture.view,
            imageLayout = .GENERAL,
            loadOp = to_vulkan_load_op(it.load_op),
            storeOp = to_vulkan_store_op(it.store_op),
            clearValue = to_vulkan_clear_color(it.clear_color),
        };
        Basic.array_add(*color_attachments, color_attachment);
    }

    rendering_info := VkRenderingInfo.{
        renderArea = .{offset = .{0, 0}, extent = swapchain.extent},
        layerCount = 1,
        colorAttachmentCount = xx color_attachments.count,
        pColorAttachments = color_attachments.data,
    };

    if desc.depth_target.texture.image != null {
        depth_attachment := Basic.New(VkRenderingAttachmentInfo);
        depth_attachment.* = .{
            imageView = desc.depth_target.texture.view,
            imageLayout = .GENERAL,
            loadOp = to_vulkan_load_op(desc.depth_target.load_op),
            storeOp = to_vulkan_store_op(desc.depth_target.store_op),
        };
        depth_attachment.clearValue.depthStencil = .{depth = desc.depth_target.clear_value.depth};
        rendering_info.pDepthAttachment = depth_attachment;

    }

    if desc.stencil_target.texture.image != null {
        stencil_attachment := Basic.New(VkRenderingAttachmentInfo);
        stencil_attachment.* = .{
            imageView = desc.stencil_target.texture.view,
            imageLayout = .GENERAL,
            loadOp = to_vulkan_load_op(desc.stencil_target.load_op),
            storeOp = to_vulkan_store_op(desc.stencil_target.store_op),
        };
        stencil_attachment.clearValue.depthStencil = .{stencil = desc.stencil_target.clear_value.stencil};
        rendering_info.pStencilAttachment = stencil_attachment;
    }

    return rendering_info;
}

aligned_vk_size :: (value: u64, alignment: u64) -> u64 {
    return (value + alignment - 1) & ~(alignment - 1);
}

to_vulkan_topology :: (topology: Topology) -> VkPrimitiveTopology {
    return cast(VkPrimitiveTopology) topology;
}

to_vulkan_blend_op :: (blend: Blend) -> VkBlendOp {
    // It is the same
    return cast,force(VkBlendOp)blend;
}

to_vulkan_blend_factor :: (factor: Factor) -> VkBlendFactor {
    return cast,force(VkBlendFactor)factor;
}

to_vulkan_compare_op :: (op: OP) -> VkCompareOp {
    return cast,force(VkCompareOp) op;
}

to_vulkan_stencil_op :: (op: OP) -> VkStencilOp {
    return cast,force(VkStencilOp) op;
}

to_vulkan_filter :: (filter: Sampler_Min_Mag_Filter) -> VkFilter {
    vk: VkFilter;
    if #complete filter == {
    case .LINEAR;
        vk = .LINEAR;
    case .NEAREST;
        vk = .NEAREST;
    }

    return vk;
}

to_vulkan_mipmap_mode :: (mip_filter: Sampler_Mip_Filter) -> VkSamplerMipmapMode {
    vk: VkSamplerMipmapMode;
    if #complete mip_filter == {
    case .NONE;
    // Default to NEAREST
    case .NEAREST;
        vk = .NEAREST;
    case .LINEAR;
        vk = .LINEAR;
    }

    return vk;
}

to_vulkan_address_mode :: (mode: Sampler_Address_Mode) -> VkSamplerAddressMode {
    vk: VkSamplerAddressMode;
    if #complete mode == {
    case .CLAMP_TO_EDGE;
        vk = .CLAMP_TO_EDGE;
    case .MIRROR_CLAMP_TO_EDGE;
        vk = .MIRROR_CLAMP_TO_EDGE;
    case .REPEAT;
        vk = .REPEAT;
    case .MIRROR_REPEAT;
        vk = .MIRRORED_REPEAT;
    case .CLAMP_TO_ZERO;
        vk = .CLAMP_TO_EDGE;
    case .CLAMP_TO_BORDER_COLOR;
        vk = .CLAMP_TO_BORDER;
    }

    return vk;
}

to_vulkan_border_color :: (color: Sampler_Border_Color) -> VkBorderColor {
    vk: VkBorderColor;
    if #complete color == {
    case .TRANSPARENT_BLACK;
        vk = .FLOAT_TRANSPARENT_BLACK;
    case .OPAQUE_BLACK;
        vk = .FLOAT_OPAQUE_BLACK;
    case .OPAQUE_WHITE;
        vk = .FLOAT_OPAQUE_WHITE;
    }

    return vk;
}

to_vulkan_sampler_create_info :: (desc: Sampler_Desc) -> VkSamplerCreateInfo {
    info := VkSamplerCreateInfo.{
        magFilter = to_vulkan_filter(desc.mag_filter),
        minFilter = to_vulkan_filter(desc.min_filter),
        mipmapMode = to_vulkan_mipmap_mode(desc.mip_filter),
        addressModeU = to_vulkan_address_mode(desc.s_address_mode),
        addressModeV = to_vulkan_address_mode(desc.t_address_mode),
        addressModeW = to_vulkan_address_mode(desc.r_address_mode),
        mipLodBias = desc.lod_bias,
        anisotropyEnable = ifx desc.max_anisotropy == 1 then VK_FALSE else VK_TRUE,
        maxAnisotropy = xx desc.max_anisotropy,
        compareEnable = ifx desc.compare_op == .NEVER then VK_FALSE else VK_TRUE,
        compareOp = to_vulkan_compare_op(desc.compare_op),
        minLod = desc.lod_min_clamp,
        maxLod = desc.lod_max_clamp,
        borderColor = to_vulkan_border_color(desc.border_color),
        unnormalizedCoordinates = ifx desc.normalized_coordinates then VK_FALSE else VK_TRUE,
    };

    return info;
}

init_arena_with_vulkan_allocation :: (arena: *Arena, allocation: Allocation) {
    arena.memory_base = allocation.cpu;
    arena.current_point = allocation.cpu;
    arena.address_limit = allocation.cpu + allocation.size;
}

#import "Vulkan";
#import "SDL3";
Basic :: #import "Basic";
Math :: #import "Math";
Compiler :: #import "Compiler";
#import "Hash_Table";
slang :: #import "slang";
File :: #import "File";
#load "shader_conversion.jai";
