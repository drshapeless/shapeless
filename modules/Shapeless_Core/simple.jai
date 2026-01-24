Simple_Vertex :: struct {
    pos: Vector2;
    uv:  Vector2;
}

SQUARE_VERTICES :: Simple_Vertex.[
.{
    pos = .{0.5, 0.5}, uv = .{1, 1}
},
.{
    pos = .{0.5, -0.5}, uv = .{1, 0}
},
.{
    pos = .{-0.5, -0.5}, uv = .{0, 0}
},
.{
    pos = .{-0.5, 0.5}, uv = .{0, 1}
}
];

SQUARE_INDICES :: u32.[0, 1, 2, 0, 2, 3];

make_simple_system :: (using renderer: *Renderer) -> Renderer.System {
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
    set_input_topology(*pb, .TRIANGLE_LIST);
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
