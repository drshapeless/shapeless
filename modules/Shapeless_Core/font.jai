MSDF :: struct {
    atlas:   Atlas;
    metrics: Metrics;
    glyphs:  [] Glyph;
    kerning: [] Kerning;

    Atlas :: struct {
        type:          string;
        distanceRange: float;
        size:          float32;
        width:         s32;
        height:        s32;
        yOrigin:       string;
    }

    Metrics :: struct {
        emSize:             float32;
        lineHeight:         float32;
        ascender:           float32;
        descender:          float32;
        underlineY:         float32;
        underlineThickness: float32;
    }

    Glyph :: struct {
        index:       u32;
        advance:     float32;
        planeBounds: Bound;
        atlasBounds: Bound;
    }

    Bound :: struct {
        left:   float32;
        bottom: float32;
        right:  float32;
        top:    float32;
    }

    Kerning :: struct {
        unicode1: u64;
        unicode2: u64;
        advance:  float32;
    }
}

bound_to_vector4 :: (using bound: MSDF.Bound) -> Vector4 {
    // In theory, a memcpy is enough.
    return .{left, bottom, right, top};
}

load_msdf :: (file_path: string) -> MSDF {
    result, json := parse_json_from_file(file_path);
    assert(result == .OK, "Cannot parse json");
    defer json_free(json);

    msdf: MSDF;
    result = from_json(json, *msdf);
    assert(result == .OK, "Cannot from json");

    return msdf;
}

Font_System :: struct {
    pipeline_id:    Renderer.Pipeline.ID;
    pipeline:       Renderer.Pipeline;
    descriptor_set: VkDescriptorSet;
    msdf_texture:   Renderer.Texture;
    msdf:           MSDF;
    glyphs:         Table(u32, Glyph);

    block_buffer: Renderer.Buffer;

    screen_size:  VkExtent2D;

    Glyph :: struct {
        advance:      float32;
        plane_bounds: Vector4;
        atlas_bounds: Vector4;
    }

    Vertex_Instance :: struct {
        bg_color:     Vector4;
        fg_color:     Vector4;
        plane_bounds: Vector4;
        atlas_bounds: Vector4;
        x_offset:     float32;
        y_offset:     float32;
    }

    Header :: struct {
        screen_extent: VkExtent2D;
        texture_extent: VkExtent2D;
        // screen_px_range is calculated by the desired pixel /
        // generated pixel * pixel range
        //
        // For example a 32x32 atlas is generated, and a 72 pixel
        // character is displayed on screen, and the distance range is
        // 2, the screen_px_range is 72/32 * 2 = 4.5
        screen_px_range: float32;
        ndc_constant:    float32; // TODO: Bad name change later
    }

    Push_Constant :: struct {
        header: VkDeviceAddress;
        vertex_data: VkDeviceAddress;
    }
}

make_font_system :: (using renderer: *Renderer) -> Font_System {
    system: Font_System;
    result: VkResult;

    system.msdf = load_msdf("assets/font/hack/hack.json");
    log("loaded % glyphs", system.msdf.glyphs.count);

    for system.msdf.glyphs {
        glyph: Font_System.Glyph;
        glyph.advance = it.advance;
        glyph.plane_bounds = bound_to_vector4(it.planeBounds);
        glyph.atlas_bounds = bound_to_vector4(it.atlasBounds);

        table_set(*system.glyphs, it.index, glyph);
    }

    result, system.msdf_texture = make_texture_from_file(renderer, "assets/font/hack/hack.png");
    assert(result == .SUCCESS);

    descriptor_set_allocate_info := VkDescriptorSetAllocateInfo.{
        descriptorPool = persistent_descriptor_pool,
        descriptorSetCount = 1,
        pSetLayouts = *texture_descriptor_set_layout
    };

    result = check_vk(vkAllocateDescriptorSets(device, *descriptor_set_allocate_info, *system.descriptor_set));
    assert(result == .SUCCESS);

    push_constant_range := VkPushConstantRange.{
        stageFlags = .ALL_GRAPHICS,
        offset = 0,
        size = size_of(Font_System.Push_Constant)
    };

    writer: Descriptor_Writer;
    init(*writer);
    write_image(*writer, 0, system.msdf_texture.image_view, texture_sampler, .SHADER_READ_ONLY_OPTIMAL, .COMBINED_IMAGE_SAMPLER);
    update_set(*writer, device, system.descriptor_set);

    pipeline_layout_create_info := VkPipelineLayoutCreateInfo.{
        setLayoutCount = 1,
        pSetLayouts = *texture_descriptor_set_layout,
        pushConstantRangeCount = 1,
        pPushConstantRanges = *push_constant_range
    };
    pipeline_layout: VkPipelineLayout;
    result = check_vk(vkCreatePipelineLayout(device, *pipeline_layout_create_info, vka, *pipeline_layout));
    assert(result == .SUCCESS);

    pb: Pipeline_Builder;
    init(*pb);
    defer deinit(*pb);

    ok, shader_module := make_shader_module(renderer, "shaders/font.slang.spv");
    assert(ok);
    defer vkDestroyShaderModule(device, shader_module, vka);

    add_shader(*pb, shader_module, .VERTEX, "vertex_main");
    add_shader(*pb, shader_module, .FRAGMENT, "fragment_main");

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

    result, system.pipeline_id = make_pipeline(renderer, *pb, pipeline_layout);
    assert(result == .SUCCESS);

    result, system.block_buffer = make_buffer(renderer, 1024, .STORAGE_BUFFER);
    assert(result == .SUCCESS);

    ok, system.pipeline = table_find(*pipelines, system.pipeline_id);
    assert(ok);

    header := Font_System.Header.{
        screen_extent = renderer.draw_extent,
        texture_extent = .{xx system.msdf.atlas.width, xx system.msdf.atlas.height}
    };

    memcpy(system.block_buffer.mapped_ptr, *header, size_of(*Font_System.Header));

    return system;
}

destroy_font_system :: (renderer: *Renderer, system: *Font_System) {
    destroy_buffer(renderer.vma, system.block_buffer);
    destroy_texture(renderer, system.msdf_texture);
}

update_font_system_screen_size :: (system: *Font_System, extent: VkExtent2D) {
    system.screen_size = extent;
}

pixel_to_ndc :: (pixel: s32, screen: u32) -> float32 {
    return cast(float32) pixel / cast(float32) screen * 2.0 - 1.0;
}

// draw_text
// The size parameter means the height in pixels of a character
draw_text :: (command: VkCommandBuffer, system: *Font_System, text: string, size: u32, offset: VkOffset2D) {
    // This is a bad name
    ndc_constant := cast(float32) size / cast(float32) system.screen_size.height * 2.0;

    header_ptr := cast(*Font_System.Header) system.block_buffer.mapped_ptr;
    header_ptr.screen_px_range = cast(float32)size / cast(float32)system.msdf.atlas.size * cast(float32)system.msdf.atlas.distanceRange;
    header_ptr.ndc_constant = ndc_constant;
    header_ptr.screen_extent = system.screen_size;

    instance := Font_System.Vertex_Instance.{
        bg_color = .{1, 0, 0, 1}, // Black
        fg_color = .{1, 1, 1, 1}, // White
        x_offset = pixel_to_ndc(offset.x, system.screen_size.width),
        y_offset = pixel_to_ndc(offset.y, system.screen_size.height)
    };

    vertex_data_ptr := system.block_buffer.mapped_ptr + size_of(Font_System.Header);
    for c: text {
        ok, glyph := table_find(*system.glyphs, cast(u32) c);
        assert(ok, "character % not found", c);

        instance.plane_bounds = glyph.plane_bounds;
        instance.atlas_bounds = glyph.atlas_bounds;
        memcpy(vertex_data_ptr + it_index * size_of(Font_System.Vertex_Instance), *instance, size_of(Font_System.Vertex_Instance));

        instance.x_offset += ndc_constant * glyph.advance;
    }

    ps := Font_System.Push_Constant.{
        header     = system.block_buffer.address,
        vertex_data = system.block_buffer.address + size_of(Font_System.Header)
    };

    vkCmdBindPipeline(command, .GRAPHICS, system.pipeline.vk);
    vkCmdBindDescriptorSets(command, .GRAPHICS, system.pipeline.layout, 0, 1, *system.descriptor_set, 0, null);
    vkCmdPushConstants(command, system.pipeline.layout, .ALL_GRAPHICS, 0, size_of(Font_System.Push_Constant), *ps);
    vkCmdDraw(command, 4, xx text.count, 0, 0);
}
