App :: struct {
    ctx: #Context;
    win: *SDL_Window;
    renderer: Renderer;

    functions: Table(string, Shapeless_Func);
    variables: Table(string, Any);
    modes: Table(string, Mode);
    keybinds: Table(string, Shapeless_Func);

    buffers: [..] Buffer;
    current_buffer_index: s64;
    frames: [..] Frame;

    render_resources: Render_Resources;
    font_atlas: Font_Atlas;
    simple_system: Renderer.System;

    dumb: Dumb;
}

Dumb :: struct {
    buffer: Renderer.Buffer;
    vertices: [] Simple_Vertex;
}

appinit :: (appstate: **void, argc: s32, argv: **u8) -> SDL_AppResult {
    app := New(App);
    appstate.* = app;
    ok := SDL_Init(.VIDEO);
    assert(ok, "Cannot init SDL %", to_string(SDL_GetError()));

    msdf := load_msdf("assets/font/hack/hack.json");

    log("loaded % glyphs", msdf.glyphs.count);

    using app;
    font_atlas = msdf_to_font_atlas(msdf);

    win = SDL_CreateWindow("Shapeless", 800, 600, .RESIZABLE | .VULKAN);
    assert(win != null, "Cannot create window %", to_string(SDL_GetError()));

    ok = init(*renderer, win);
    if !ok return .FAILURE;

    set_clear_color(*renderer, .[0.1, 0.2, 0.3, 1.0]);

    simple_system = make_simple_system(*renderer);

    // render_resources = make_msdf_resources(*renderer);

    // dumb.vertices = build_text_vertices("bello", 1, 0.5, 0.5, *font_atlas);

    dumb.vertices = .[.{pos = .{0.5, 0.5}}, .{pos = .{0.0, -0.5}}, .{pos = .{-0.5, 0.5}}];

    result:, dumb.buffer = make_buffer_copying_data(*renderer, dumb.vertices, .VERTEX_BUFFER);
    if result return .FAILURE;

    return .CONTINUE;
}

appevent :: (appstate: *void, event: *SDL_Event) -> SDL_AppResult {
    if event.type == {
    case .QUIT;
        #through;
    case .WINDOW_CLOSE_REQUESTED;
        return .SUCCESS;
    case .KEY_DOWN;
        if event.key.key == {
        case SDLK_ESCAPE;
            return .SUCCESS;
        }
    }

    return .CONTINUE;
}

appiter :: (appstate: *void) -> SDL_AppResult {
    app := cast(*App)appstate;
    using app;

    if begin_draw(*renderer) {
        vkCmdBindPipeline(renderer.cmd, .GRAPHICS, simple_system.pipeline);
        // vkCmdBindDescriptorSets(renderer.cmd, .GRAPHICS, render_resources.pipeline_layout, 0, 1, *render_resources.descriptor_set, 0, null);

        // push_constant: Push_Constant;
        // push_constant.mvp = Matrix4_Identity;
        // push_constant.color = .{0, 0, 0, 1};
        // push_constant.px_range = font_atlas.distance_range;
        // vkCmdPushConstants(renderer.cmd, render_resources.pipeline_layout, .VERTEX | .FRAGMENT, 0, size_of(Push_Constant), *push_constant);

        offsets :VkDeviceSize = 0;
        vkCmdBindVertexBuffers(renderer.cmd, 0, 1, *dumb.buffer.vk, *offsets);

        vkCmdDraw(renderer.cmd, xx dumb.vertices.count, 1, 0, 0);

        end_draw(*renderer);
    }
    return .CONTINUE;
}

appquit :: (appstate: *void, result: SDL_AppResult) {
    app := cast(*App)appstate;

    vkDeviceWaitIdle(app.renderer.device);
    destroy_system(*app.renderer, app.simple_system);
    destroy_buffer(app.renderer.vma, app.dumb.buffer);
    // destroy_resources(app.render_resources, *app.renderer);
    deinit(*app.renderer);
    SDL_Quit();
}

make_msdf_texture :: (using renderer: *Renderer) -> Renderer.Texture {
    font_surface := IMG_Load("assets/font/hack/hack.png");
    assert(font_surface != null, "Cannot load hack surface");
    defer SDL_DestroySurface(font_surface);

    converted_surface := SDL_ConvertSurface(font_surface, .RGBA8888);
    assert(converted_surface != null, "Cannot convert surface");
    defer SDL_DestroySurface(converted_surface);

    // My GPU does not support R8G8B8_SRGB
    texture: Renderer.Texture;
    texture.format = .R8G8B8A8_SRGB;

    image_info := VkImageCreateInfo.{
        imageType = .e2D,
        format = texture.format,
        extent = .{
            width = xx font_surface.w,
            height = xx font_surface.h,
            depth = 1
        },
        mipLevels = 1,
        arrayLayers = 1,
        samples = .e1,
        usage = .TRANSFER_DST | .SAMPLED,
        sharingMode = .EXCLUSIVE,
        initialLayout = .UNDEFINED
    };

    alloc_info := VmaAllocationCreateInfo.{
        flags = xx VmaAllocationCreateFlagBits.DEDICATED_MEMORY_BIT,
        usage = .AUTO,
        // requiredFlags = .DEVICE_LOCAL
    };

    image: VkImage;
    allocation: VmaAllocation;
    result := check_vk(vmaCreateImage(vma, *image_info, *alloc_info, *texture.image.vk, *texture.image.allocation, null));
    assert(result == .SUCCESS);

    staging_buffer: Buffer;
    staging_buffer.size = xx (font_surface.w * font_surface.h * 4);

    staging_info := VkBufferCreateInfo.{
        size = staging_buffer.size,
        usage = .TRANSFER_SRC,
        sharingMode = .EXCLUSIVE
    };

    staging_alloc_info := VmaAllocationCreateInfo.{
        flags = xx VmaAllocationCreateFlagBits.HOST_ACCESS_SEQUENTIAL_WRITE_BIT | VmaAllocationCreateFlagBits.MAPPED_BIT,
        usage = .AUTO
    };

    mapped_ptr: *void;

    result = check_vk(vmaCreateBuffer(vma, *staging_info, *staging_alloc_info, *staging_buffer.vk, *staging_buffer.allocation, null));
    assert(result == .SUCCESS);

    result=, command := begin_single_time_commands(renderer);
    assert(result == .SUCCESS);
    barrier := VkImageMemoryBarrier2.{
        srcStageMask     = .TOP_OF_PIPE,
        srcAccessMask    = 0,
        dstStageMask     = .TRANSFER,
        dstAccessMask    = .TRANSFER_WRITE,
        oldLayout        = .UNDEFINED,
        newLayout        = .TRANSFER_DST_OPTIMAL,
        image            = texture.image.vk,
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
        bufferOffset = 0,
        bufferRowLength = 0,
        bufferImageHeight = 0,
        imageSubresource = .{.COLOR, 0, 0, 1},
        imageOffset = .{0, 0, 0},
        imageExtent = .{width = xx font_surface.w, height = xx font_surface.h, depth = 1}
    };

    copy_info := VkCopyBufferToImageInfo2.{
        srcBuffer = staging_buffer.vk,
        dstImage = texture.image.vk,
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
    end_single_time_commands(renderer, command);

    result, texture.image_view = make_image_view(renderer, texture.image.vk, texture.format, .COLOR);
    assert(result == .SUCCESS);

    // array_add(*textures_for_destruction, texture);
    array_add(*buffers_queued_for_destruction[frame_index], staging_buffer);

    return texture;
}

Push_Constant :: struct {
    mvp: Matrix4;
    color: Vector4;
    px_range: float32;
}

Vertex :: struct {
    pos: Vector2;
    uv: Vector2;
}

// I don't have a better name at the moment.
Render_Resources :: struct {
    descriptor_set_layout: VkDescriptorSetLayout;
    descriptor_pool: VkDescriptorPool;
    descriptor_set: VkDescriptorSet;
    sampler: VkSampler;
    texture: Renderer.Texture;
    pipeline_layout: VkPipelineLayout;
    pipeline: VkPipeline;
}

make_msdf_resources :: (using renderer: *Renderer) -> Render_Resources {
    using resources: Render_Resources;

    texture = make_msdf_texture(renderer);

    sampler_create_info := VkSamplerCreateInfo.{
        magFilter = .LINEAR,
        minFilter = .LINEAR,
        mipmapMode = .LINEAR,
        addressModeU = .CLAMP_TO_EDGE,
        addressModeV = .CLAMP_TO_EDGE,
        addressModeW = .CLAMP_TO_EDGE,
        anisotropyEnable = VK_FALSE,
        borderColor = .FLOAT_OPAQUE_BLACK,
    };
    vkCreateSampler(device, *sampler_create_info, vka, *sampler);

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

    result: VkResult;
    result = check_vk(vkCreateDescriptorSetLayout(device, *layout_create_info, vka, *descriptor_set_layout));
    if result return .{};

    pool_size := VkDescriptorPoolSize.{
        type = .COMBINED_IMAGE_SAMPLER,
        descriptorCount = 1
    };

    pool_create_info := VkDescriptorPoolCreateInfo.{
        poolSizeCount = 1,
        pPoolSizes = *pool_size,
        maxSets = 1
    };
    result = check_vk(vkCreateDescriptorPool(device, *pool_create_info, vka, *descriptor_pool));
    if result return .{};

    allocate_info := VkDescriptorSetAllocateInfo.{
        descriptorPool = descriptor_pool,
        descriptorSetCount = 1,
        pSetLayouts = *descriptor_set_layout
    };
    result = check_vk(vkAllocateDescriptorSets(device, *allocate_info, *descriptor_set));
    if result return .{};

    descriptor_image_info := VkDescriptorImageInfo.{
        sampler = sampler,
        imageView = texture.image_view,
        imageLayout = .SHADER_READ_ONLY_OPTIMAL
    };

    write := VkWriteDescriptorSet.{
        dstSet = descriptor_set,
        dstBinding = 0,
        descriptorCount = 1,
        descriptorType = .COMBINED_IMAGE_SAMPLER,
        pImageInfo = *descriptor_image_info
    };

    vkUpdateDescriptorSets(device, 1, *write, 0, null);

    push_range := VkPushConstantRange.{
        stageFlags = .VERTEX | .FRAGMENT,
        offset = 0,
        size = size_of(Push_Constant)
    };

    pipeline_layout_create_info := VkPipelineLayoutCreateInfo.{
        setLayoutCount = 1,
        pSetLayouts = *descriptor_set_layout,
        pushConstantRangeCount = 1,
        pPushConstantRanges = *push_range
    };
    result = check_vk(vkCreatePipelineLayout(device, *pipeline_layout_create_info, vka, *pipeline_layout));
    if result return .{};

    pb: Pipeline_Builder;
    init(*pb);
    defer deinit(*pb);

    ok, vert_shader := make_shader_module(renderer, "shaders/msdf.vert.spv");
    if !ok return .{};
    defer destroy_shader_module(renderer, vert_shader);

    ok=, frag_shader := make_shader_module(renderer, "shaders/msdf.frag.spv");
    if !ok return .{};
    defer destroy_shader_module(renderer, frag_shader);

    set_shaders(*pb, vert_shader, frag_shader);
    set_layout(*pb, pipeline_layout);

    add_vertex_input_binding(*pb, 0, size_of(Vertex), .VERTEX);
    add_vertex_input_attribute(*pb, 0, 0, .R32G32_SFLOAT, xx offset_of(Vertex, "pos"));
    add_vertex_input_attribute(*pb, 1, 0, .R32G32_SFLOAT, xx offset_of(Vertex, "uv"));

    set_color_attachment_format(*pb, draw_texture.format);
    set_depth_format(*pb, depth_texture.format);
    set_input_topology(*pb, .TRIANGLE_STRIP);
    set_polygon_mode(*pb, .FILL);
    set_cull_mode(*pb, .NONE, .COUNTER_CLOCKWISE);
    set_multisampling_none(*pb);
    disable_depthtest(*pb);
    enable_blending_alphablend(*pb);
    add_dynamic_state(*pb, .VIEWPORT);
    add_dynamic_state(*pb, .SCISSOR);

    result, pipeline = builder_to_pipeline(*pb, renderer);
    if result return .{};

    return resources;
}

destroy_resources :: (using resource: Render_Resources, using renderer: *Renderer) {
    vkDestroyDescriptorSetLayout(device, descriptor_set_layout, vka);
    vkDestroyDescriptorPool(device, descriptor_pool, vka);
    vkDestroySampler(device, sampler, vka);
    destroy_texture(renderer, texture);
    vkDestroyPipelineLayout(device, pipeline_layout, vka);
    vkDestroyPipeline(device, pipeline, vka);
}

build_text_vertices :: (text: string, fontsize: float32, start_x: float32, start_y: float32, font: *Font_Atlas) -> [] Vertex {
    vertices := NewArray(text.count * 4, Vertex);

    count := 0;
    cursor_x := 0.0;
    for text {
        unicode :u64 = xx it;

        ok, glyph := table_find(*font.glyphs, unicode);
        if !ok continue;

        left := cursor_x + glyph.plane_bounds.x * fontsize;
        right := cursor_x + glyph.plane_bounds.z * fontsize;
        bottom := glyph.plane_bounds.y * fontsize;
        top := glyph.plane_bounds.w * fontsize;

        u_min := glyph.atlas_bounds.x / xx font.width;
        u_max := glyph.atlas_bounds.z / xx font.width;
        v_min := glyph.atlas_bounds.y / xx font.height;
        v_max := glyph.atlas_bounds.w / xx font.height;

        vertices[count] = .{ .{start_x + left, start_y + bottom}, .{u_min, v_min}};
        count += 1;
        vertices[count] = .{ .{start_x + right, start_y + bottom}, .{u_max, v_min}};
        count += 1;
        vertices[count] = .{ .{start_x + left, start_y + top}, .{u_min, v_max}};
        count += 1;
        vertices[count] = .{ .{start_x + right, start_y + top}, .{u_max, v_max}};
        count += 1;

        cursor_x += glyph.advance * fontsize;
    }

    return vertices;
}

create_vertex_buffer :: (vertices: [] Vertex, renderer: *Renderer) -> Renderer.Buffer {
    buffer: Renderer.Buffer;
    buffer.size = xx vertices.count * size_of(Vertex);

    buffer_create_info := VkBufferCreateInfo.{
        size = buffer.size,
        usage = .VERTEX_BUFFER,
        sharingMode = .EXCLUSIVE
    };

    allocation_create_info := VmaAllocationCreateInfo.{
        usage = .AUTO,
        flags = VmaAllocationCreateFlagBits.HOST_ACCESS_SEQUENTIAL_WRITE_BIT | VmaAllocationCreateFlagBits.MAPPED_BIT
    };

    result := check_vk(vmaCreateBuffer(renderer.vma, *buffer_create_info, *allocation_create_info, *buffer.vk, *buffer.allocation, null));
    if result return .{};

    mapped: *void;
    if check_vk(vmaMapMemory(renderer.vma, buffer.allocation, *mapped)) return .{};
    memcpy(mapped, vertices.data, buffer.size);
    vmaUnmapMemory(renderer.vma, buffer.allocation);

    return buffer;
}
