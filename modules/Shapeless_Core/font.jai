Font_Atlas :: struct {
    distance_range: float32;
    em_size:        float32;
    line_height:    float32;
    width:          s32;
    height:         s32;
    glyphs:         Table(u32, Glyph); // key is unicode in u64

    Glyph :: struct {
        advance:      float32;
        plane_bounds: Vector4;
        atlas_bounds: Vector4;
    }
}

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
        unicode:     u32;
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

msdf_to_font_atlas :: (msdf: MSDF) -> Font_Atlas {
    fa: Font_Atlas;

    fa.distance_range = msdf.atlas.distanceRange;
    fa.em_size = msdf.metrics.emSize;
    fa.line_height = msdf.metrics.lineHeight;
    fa.width = msdf.atlas.width;
    fa.height = msdf.atlas.height;

    for msdf.glyphs {
        glyph: Font_Atlas.Glyph;
        glyph.advance = it.advance;
        glyph.plane_bounds = bound_to_vector4(it.planeBounds);
        glyph.atlas_bounds = bound_to_vector4(it.atlasBounds);

        // I am not usin table_add because it would add multiple value
        // of the same key into the table
        table_set(*fa.glyphs, it.unicode, glyph);
    }

    return fa;
}

Font_System :: struct {
    pipeline_id: Renderer.Pipeline.ID;
    descriptor_set: VkDescriptorSet;
    msdf_texture: Renderer.Texture;
    msdf_atlas:   Font_Atlas;

    Vertex_Instance :: struct {
        offset:   Vector2;
        color:    Vector3;
    }

    Push_Constant :: struct {
        ptr0: VkDeviceAddress; // I currently don't have a better name
    }
}

make_font_system :: (using renderer: *Renderer) -> Font_System {
    system: Font_System;
    result: VkResult;

    msdf := load_msdf("assets/font/hack/hack.json");
    log("loaded % glyphs", msdf.glyphs.count);
    system.msdf_atlas = msdf_to_font_atlas(msdf);

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
    set_input_topology(*pb, .TRIANGLE_LIST);
    set_polygon_mode(*pb, .FILL);
    set_cull_mode(*pb, .BACK, .COUNTER_CLOCKWISE);
    set_multisampling_none(*pb);
    disable_depthtest(*pb);
    enable_blending_alphablend(*pb);
    add_dynamic_state(*pb, .VIEWPORT);
    add_dynamic_state(*pb, .SCISSOR);

    result, system.pipeline_id = make_pipeline(renderer, *pb, pipeline_layout);
    assert(result == .SUCCESS);
    return system;
}

destroy_font_system :: (renderer: *Renderer, system: *Font_System) {
    destroy_texture(renderer, system.msdf_texture);
}
