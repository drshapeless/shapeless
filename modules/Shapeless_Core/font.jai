Glyph :: struct {
    advance: float32;
    plane_bounds: Vector4;
    atlas_bounds: Vector4;
}

Font_Atlas :: struct {
    distance_range: float32;
    em_size: float32;
    line_height: float32;
    width: s32;
    height: s32;
    glyphs: Table(u32, Glyph); // key is unicode in u64
}

MSDF :: struct {
    atlas: MSDF_Atlas;
    metrics: MSDF_Metrics;
    glyphs: []MSDF_Glyph;
    kerning: []MSDF_Kerning;
}

MSDF_Atlas :: struct {
    type: string;
    distanceRange: float;
    size: float32;
    width: s32;
    height: s32;
    yOrigin: string;
}

MSDF_Metrics :: struct {
    emSize: float32;
    lineHeight: float32;
    ascender: float32;
    descender: float32;
    underlineY: float32;
    underlineThickness: float32;
}

MSDF_Glyph :: struct {
    unicode: u32;
    advance: float32;
    planeBounds: Bound;
    atlasBounds: Bound;
}

Bound :: struct {
    left:   float32;
    bottom: float32;
    right:  float32;
    top:    float32;
}

MSDF_Kerning :: struct {
    unicode1: u64;
    unicode2: u64;
    advance:  float32;
}

bound_to_vector4 :: (using bound: Bound) -> Vector4 {
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
        glyph: Glyph;
        glyph.advance = it.advance;
        glyph.plane_bounds = bound_to_vector4(it.planeBounds);
        glyph.atlas_bounds = bound_to_vector4(it.atlasBounds);

        // I am not usin table_add because it would add multiple value
        // of the same key into the table
        table_set(*fa.glyphs, it.unicode, glyph);
    }

    return fa;
}

Font_Vertex :: struct {
    position: Vector2;
    uv: Vector2;
}

make_font_system :: (renderer: *Renderer) -> Renderer.System {
    system: Renderer.System;
    result: VkResult;

    sampler_create_info := VkSamplerCreateInfo.{
        magFilter = .LINEAR,
        minFilter = .LINEAR,
        mipmapMode = .LINEAR,
        anisotropyEnable = VK_TRUE,
        maxAnisotropy  = 8
    };

    result = check_vk(vkCreateSampler(device, *sampler_create_info, vka, *system.sampler));
    assert(result == .SUCCESS);

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

    result = check_vk(vkCreateDescriptorSetLayout(device, *layout_create_info, vka, *system.descriptor_set_layout));
    assert(result == .SUCCESS);

    pool_size := VkDescriptorPoolSize.{
        type = .COMBINED_IMAGE_SAMPLER,
        descriptorCount = 1
    };

    pool_create_info := VkDescriptorPoolCreateInfo.{
        poolSizeCount = 1,
        pPoolSizes = *pool_size,
        maxSets = 1
    };
    result = check_vk(vkCreateDescriptorPool(device, *pool_create_info, vka, *system.descriptor_pool));
    assert(result == .SUCCESS);

    allocate_info := VkDescriptorSetAllocateInfo.{
        descriptorPool = system.descriptor_pool,
        descriptorSetCount = 1,
        pSetLayouts = *system.descriptor_set_layout
    };
    result = check_vk(vkAllocateDescriptorSets(device, *allocate_info, *system.descriptor_set));
    assert(result == .SUCCESS);

    pipeline_layout_create_info := VkPipelineLayoutCreateInfo.{
        setLayoutCount = 1,
        pSetLayouts = *system.descriptor_set_layout
    };
    result = check_vk(vkCreatePipelineLayout(device, *pipeline_layout_create_info, vka, *system.pipeline_layout));
    assert(result == .SUCCESS);

    pb: Pipeline_Builder;
    init(*pb);
    defer deinit(*pb);

    ok, shader_module := make_shader_module(renderer, "shaders/texture.slang.spv");
    if !ok return .{};
    defer destroy_shader_module(renderer, shader_module);

    add_shader(*pb, shader_module, .VERTEX, "vertex_main");
    add_shader(*pb, shader_module, .FRAGMENT, "fragment_main");

    set_layout(*pb, system.pipeline_layout);
    add_vertex_input_binding(*pb, 0, size_of(Simple_Vertex), .VERTEX);
    add_vertex_input_attribute(*pb, 0, 0, .R32G32_SFLOAT, 0);
    add_vertex_input_attribute(*pb, 1, 0, .R32G32_SFLOAT, xx offset_of(Simple_Vertex, "uv"));

    set_color_attachment_format(*pb, draw_texture.format);
    set_depth_format(*pb, depth_texture.format);
    set_input_topology(*pb, .TRIANGLE_STRIP);
    set_polygon_mode(*pb, .FILL);
    set_cull_mode(*pb, .BACK, .COUNTER_CLOCKWISE);
    set_multisampling_none(*pb);
    disable_depthtest(*pb);
    enable_blending_alphablend(*pb);
    add_dynamic_state(*pb, .VIEWPORT);
    add_dynamic_state(*pb, .SCISSOR);

    result, system.pipeline = builder_to_pipeline(*pb, renderer);
    assert(result == .SUCCESS);

    return system;
}
