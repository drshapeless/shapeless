main :: () {
    SDL_Init(.VIDEO);
    defer SDL_Quit();
    #if OS == .MACOS {
        SDL_SetHint(SDL_HINT_VULKAN_LIBRARY, "/Users/jacky/VulkanSDK/1.4.341.1/macOS/lib/libvulkan.dylib");
        SDL_Vulkan_LoadLibrary("/Users/jacky/VulkanSDK/1.4.341.1/macOS/lib/libvulkan.dylib");

    } else {
        SDL_Vulkan_LoadLibrary(null);
    }

    ok: bool;
    result: VkResult;

    renderer: Renderer;
    ok = init_without_swapchain(*renderer);
    assert(ok);
    defer deinit(*renderer);

    using renderer;

    result=, gpu_memory := gpu_allocate_mapped(*renderer, 256 * 1024 * 1024, renderer.memory_indices.rebar);
    assert(result == .SUCCESS);
    defer gpu_free(*renderer, gpu_memory);

    gpu_pool := make_memory_pool(gpu_memory);

    texture: Renderer.Texture;
    texture.format = .R8G8B8A8_UNORM;

    image_create_info := VkImageCreateInfo.{
        flags                 = 0,
        imageType             = .e2D,
        format                = texture.format,
        extent                = .{32, 32, 1},
        mipLevels             = 1,
        arrayLayers           = 1,
        samples               = .e1,
        tiling                = .OPTIMAL,
        usage                 = .STORAGE | .TRANSFER_SRC,
        sharingMode           = .EXCLUSIVE,
        queueFamilyIndexCount = 0,
        pQueueFamilyIndices   = null,
        initialLayout         = .UNDEFINED
    };
    result, texture.image = make_image(*renderer, *gpu_pool, *image_create_info);
    assert(result == .SUCCESS);

    image_view_create_info := VkImageViewCreateInfo.{
        flags            = 0,
        image            = texture.image.vk,
        viewType         = .e2D,
        format           = texture.format,
        components       = .{},
        subresourceRange = .{
            aspectMask     = .COLOR,
            baseMipLevel   = 0,
            levelCount     = 1,
            baseArrayLayer = 0,
            layerCount     = 1
        }
    };
    result, texture.image_view = make_image_view(*renderer, *image_view_create_info);
    assert(result == .SUCCESS);

    defer destroy_texture(*renderer, texture);

    descriptor_set_layout_binding := VkDescriptorSetLayoutBinding.{
        binding = 0,
        descriptorType = .STORAGE_IMAGE,
        descriptorCount = 1,
        stageFlags = .COMPUTE
    };

    descriptor_set_layout_create_info := VkDescriptorSetLayoutCreateInfo.{
        bindingCount = 1,
        pBindings = *descriptor_set_layout_binding
    };

    descriptor_set_layout: VkDescriptorSetLayout;
    result = check_vk(vkCreateDescriptorSetLayout(device, *descriptor_set_layout_create_info, vka, *descriptor_set_layout));
    assert(result == .SUCCESS);
    defer vkDestroyDescriptorSetLayout(device, descriptor_set_layout, vka);

    pipeline_layout_create_info := VkPipelineLayoutCreateInfo.{
        setLayoutCount = 1,
        pSetLayouts = *descriptor_set_layout
    };

    pipeline_layout: VkPipelineLayout;
    result = check_vk(vkCreatePipelineLayout(device, *pipeline_layout_create_info, vka, *pipeline_layout));
    assert(result == .SUCCESS);
    defer vkDestroyPipelineLayout(device, pipeline_layout, vka);

    ok=, compute_module := make_shader_module(*renderer, "shaders/red.slang.spv");
    assert(ok);
    defer vkDestroyShaderModule(device, compute_module, vka);

    pipeline_shader_stage_create_info := VkPipelineShaderStageCreateInfo.{
        stage = .COMPUTE,
        module = compute_module,
        pName = "main"
    };

    compute_pipeline_create_info := VkComputePipelineCreateInfo.{
        flags = 0,
        stage = pipeline_shader_stage_create_info,
        layout = pipeline_layout
    };
    compute_pipeline: VkPipeline;
    result = check_vk(vkCreateComputePipelines(device, null, 1, *compute_pipeline_create_info, vka, *compute_pipeline));
    assert(result == .SUCCESS);
    defer vkDestroyPipeline(device, compute_pipeline, vka);

    descriptor_pool_size := VkDescriptorPoolSize.{
        type = .STORAGE_IMAGE,
        descriptorCount = 1
    };

    descriptor_pool_create_info := VkDescriptorPoolCreateInfo.{
        maxSets = 1,
        poolSizeCount = 1,
        pPoolSizes = *descriptor_pool_size
    };

    descriptor_pool: VkDescriptorPool;
    result = check_vk(vkCreateDescriptorPool(device, *descriptor_pool_create_info, vka, *descriptor_pool));
    assert(result == .SUCCESS);
    defer vkDestroyDescriptorPool(device, descriptor_pool, vka);

    descriptor_set_allocate_info := VkDescriptorSetAllocateInfo.{
        descriptorPool = descriptor_pool,
        descriptorSetCount = 1,
        pSetLayouts = *descriptor_set_layout
    };

    descriptor_set: VkDescriptorSet;
    result = check_vk(vkAllocateDescriptorSets(device, *descriptor_set_allocate_info, *descriptor_set));
    assert(result == .SUCCESS);

    descriptor_image_info := VkDescriptorImageInfo.{
        imageView = texture.image_view,
        imageLayout = .GENERAL
    };

    write := VkWriteDescriptorSet.{
        dstSet          = descriptor_set,
        dstBinding      = 0,
        descriptorCount = 1,
        descriptorType  = .STORAGE_IMAGE,
        pImageInfo      = *descriptor_image_info
    };
    vkUpdateDescriptorSets(device, 1, *write, 0, null);

    result=, cmd := begin_single_time_commands(*renderer);
    assert(result == .SUCCESS);

    image_memory_barrier := VkImageMemoryBarrier2.{
        srcStageMask        = .TOP_OF_PIPE,
        srcAccessMask       = 0,
        dstStageMask        = .COMPUTE_SHADER,
        dstAccessMask       = .SHADER_WRITE,
        oldLayout           = .UNDEFINED,
        newLayout           = .GENERAL,
        srcQueueFamilyIndex = VK_QUEUE_FAMILY_IGNORED,
        dstQueueFamilyIndex = VK_QUEUE_FAMILY_IGNORED,
        image               = texture.image.vk,
        subresourceRange    = .{
            aspectMask     = .COLOR,
            baseMipLevel   = 0,
            levelCount     = 1,
            baseArrayLayer = 0,
            layerCount     = 1
        }
    };

    dependency_info := VkDependencyInfo.{
        imageMemoryBarrierCount = 1,
        pImageMemoryBarriers = *image_memory_barrier
    };

    vkCmdPipelineBarrier2(cmd, *dependency_info);
    vkCmdBindPipeline(cmd, .COMPUTE, compute_pipeline);
    bind_descriptor_set_info := VkBindDescriptorSetsInfo.{
        stageFlags = .COMPUTE,
        layout = pipeline_layout,
        firstSet = 0,
        descriptorSetCount = 1,
        pDescriptorSets = *descriptor_set,
        dynamicOffsetCount = 0,
        pDynamicOffsets = null
    };
    vkCmdBindDescriptorSets(cmd, .COMPUTE, pipeline_layout, 0, 1, *descriptor_set, 0, null);
    // vkCmdBindDescriptorSets2(cmd, *bind_descriptor_set_info);
    vkCmdDispatch(cmd, 4, 4, 1);

    // This is a barrier that convert the image to host visible
    //
    // This affects all global memory, that's why we don't tell what
    // memory we are operating on. (Weird)
    //
    // I am really not sure whether this is necessary, we can still
    // get a picture from without this barrier.
    memory_barrier := VkMemoryBarrier2.{
        srcStageMask = .COMPUTE_SHADER,
        srcAccessMask = .SHADER_WRITE,
        dstStageMask = .HOST,
        dstAccessMask = .HOST_READ
    };
    memory_dependency := VkDependencyInfo.{
        memoryBarrierCount = 1,
        pMemoryBarriers = *memory_barrier
    };
    vkCmdPipelineBarrier2(cmd, *memory_dependency);

    result = end_single_time_commands(*renderer, cmd);
    assert(result == .SUCCESS);

    my_surface := SDL_CreateSurfaceFrom(32, 32, .RGBA32, texture.image.allocation.mapped_pointer, 32 * 4);
    assert(my_surface != null, "Cannot create sdl surface %", to_string(SDL_GetError()));

    ok = IMG_SavePNG(my_surface, "my_surface.png");
    assert(ok, "%", to_string(SDL_GetError()));
}

#import "Basic";
#import "Renderer";
#import "SDL3";
#import "Vulkan";
