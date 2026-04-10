main :: () {
    SDL_Init(.VIDEO);
    defer SDL_Quit();
    ok: bool;
    result: VkResult;
    ok = SDL_Vulkan_LoadLibrary(null);
    assert(ok, "%", to_string(SDL_GetError()));


    renderer: Renderer;
    ok = init_without_swapchain(*renderer);
    assert(ok);
    defer deinit(*renderer);

    using renderer;

    result=, gpu_memory := gpu_allocate_mapped(*renderer, 256 * 1024 * 1024, renderer.memory_indices.rebar);
    assert(result == .SUCCESS);
    defer gpu_free(*renderer, gpu_memory);

    gpu_pool := make_memory_pool(gpu_memory);

    size_sdf := 32;
    size_bitmap := 256;

    face := hb_face_create_from_file_or_fail("assets/font/hack/Hack-Regular.ttf", 0);
    assert(face != null);
    upem := hb_face_get_upem(face);
    defer hb_face_destroy(face);

    font := hb_font_create(face);
    defer hb_font_destroy(font);

    glyph_index: hb_codepoint_t;
    success := hb_font_get_nominal_glyph(font, #char "J", *glyph_index);
    assert(xx success);

    draw_funcs := make_draw_funcs();
    defer hb_draw_funcs_destroy(draw_funcs);

    shape, metrics := make_shape(font, glyph_index, size_sdf, size_sdf, draw_funcs, upem, true);
    windings := prepare_shape(*shape);

    memory_size := get_shape_memory_size(shape);
    result=, shape_buffer := make_buffer(*renderer, *gpu_pool, xx memory_size, .STORAGE_BUFFER);
    defer destroy_buffer(*renderer, shape_buffer);

    shape_to_block_memory(shape, shape_buffer.allocation.mapped_pointer);

    result=, winding_buffer := make_buffer(*renderer, *gpu_pool, xx (size_of(s32) * windings.count), .STORAGE_BUFFER);
    memcpy(winding_buffer.allocation.mapped_pointer, windings.data, size_of(s32) * windings.count);
    defer destroy_buffer(*renderer, winding_buffer);

    // We need an output memory here
    result=, output_buffer := make_buffer(*renderer, *gpu_pool, xx (size_sdf * size_sdf * 3 * size_of(float)), .STORAGE_BUFFER);
    defer destroy_buffer(*renderer, output_buffer);

    push_constant_range := VkPushConstantRange.{
        stageFlags = .COMPUTE,
        offset = 0,
        size = size_of(Push_Constant)
    };

    pipeline_layout_create_info := VkPipelineLayoutCreateInfo.{
        pushConstantRangeCount = 1,
        pPushConstantRanges = *push_constant_range
    };
    pipeline_layout: VkPipelineLayout;
    result = check_vk(vkCreatePipelineLayout(device, *pipeline_layout_create_info, vka, *pipeline_layout));
    assert(result == .SUCCESS);
    defer vkDestroyPipelineLayout(device, pipeline_layout, vka);

    compute_shader_info, compute_shader_string := make_shader_module_create_info("shaders/msdf_generator.slang.spv");
    defer free(compute_shader_string);

    pipeline_shader_stage_create_info := VkPipelineShaderStageCreateInfo.{
        pNext = *compute_shader_info,
        stage = .COMPUTE,
        // module = compute_module,
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

    result=, cmd := begin_single_time_commands(*renderer);
    assert(result == .SUCCESS);

    // memory_barriers := VkBufferMemoryBarrier2.[
    // .{
    //     srcStageMask = .TOP_OF_PIPE,
    //     srcAccessMask = 0,
    //     dstStageMask = .COMPUTE_SHADER,
    //     dstAccessMask = .SHADER_READ,
    //     srcQueueFamilyIndex = VK_QUEUE_FAMILY_IGNORED,
    //     dstQueueFamilyIndex = VK_QUEUE_FAMILY_IGNORED,
    //     buffer = shape_buffer.vk,
    //     offset = 0,
    //     size = xx shape_buffer.allocation.size
    // },
    // .{
    //     srcStageMask = .TOP_OF_PIPE,
    //     srcAccessMask = 0,
    //     dstStageMask = .COMPUTE_SHADER,
    //     dstAccessMask = .SHADER_WRITE,
    //     srcQueueFamilyIndex = VK_QUEUE_FAMILY_IGNORED,
    //     dstQueueFamilyIndex = VK_QUEUE_FAMILY_IGNORED,
    //     buffer = output_buffer.vk,
    //     offset = 0,
    //     size = xx output_buffer.allocation.size
    // }
    // ];

    // dependency_info := VkDependencyInfo.{
    //     bufferMemoryBarrierCount = 2,
    //     pBufferMemoryBarriers = memory_barriers.data
    // };

    // vkCmdPipelineBarrier2(cmd, *dependency_info);
    vkCmdBindPipeline(cmd, .COMPUTE, compute_pipeline);

    pc := Push_Constant.{
        block_memory = shape_buffer.address,
        output_memory = output_buffer.address,
        windings = winding_buffer.address,
        metrics = metrics,
        size_sdf = size_sdf
    };

    push_constants_info := VkPushConstantsInfo.{
        layout = pipeline_layout,
        stageFlags = .COMPUTE,
        offset = 0,
        size = size_of(Push_Constant),
        pValues = *pc
    };
    vkCmdPushConstants2(cmd, *push_constants_info);

    vkCmdDispatch(cmd, 4, 4, 1);

    result = end_single_time_commands(*renderer, cmd);
    assert(result == .SUCCESS);

    bitmap_gpu: []float;
    bitmap_gpu.data = output_buffer.allocation.mapped_pointer;
    bitmap_gpu.count = size_sdf * size_sdf * 3;

    sdf_image := make_bitmap_sdf(bitmap_gpu, size_sdf);
    stbi_write_png("gpu_msdf.png", xx size_sdf, xx size_sdf, 3, sdf_image.data, xx (size_sdf*3));


    report_memory_leaks();
}

Push_Constant :: struct {
    block_memory: VkDeviceAddress;
    output_memory: VkDeviceAddress;
    windings: VkDeviceAddress;
    metrics: Metrics;
    size_sdf: s64;
}

#import "Renderer";
#import "MSDF"(HARFBUZZ=true);
#import "SDL3";
#import "Vulkan";
#import "Basic"()(MEMORY_DEBUGGER=true);
#import "HarfBuzz";
#import "stb_image_write";
