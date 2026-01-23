Pipeline_Builder :: struct {
    initialized := false;
    pool: Flat_Pool;
    allocator: Allocator;

    shader_stages:           [..]VkPipelineShaderStageCreateInfo;
    vertex_bindings:         [..]VkVertexInputBindingDescription;
    vertex_attributes:       [..]VkVertexInputAttributeDescription;
    color_blend_attachments: [..]VkPipelineColorBlendAttachmentState;
    dynamic_states:          [..]VkDynamicState;
    vertex_input_info:       VkPipelineVertexInputStateCreateInfo;
    input_assembly_info:     VkPipelineInputAssemblyStateCreateInfo;
    tessellation_info:       VkPipelineTessellationStateCreateInfo; // No use ATM
    viewport_info:           VkPipelineViewportStateCreateInfo;
    rasterization_info:      VkPipelineRasterizationStateCreateInfo;
    multisample_info:        VkPipelineMultisampleStateCreateInfo;
    depth_stencil_info:      VkPipelineDepthStencilStateCreateInfo;
    color_blend_info:        VkPipelineColorBlendStateCreateInfo;
    dynamic_info:            VkPipelineDynamicStateCreateInfo;
    layout:                  VkPipelineLayout;
    render_info:             VkPipelineRenderingCreateInfo;
    color_attachment_format: VkFormat;
}

init :: (using builder: *Pipeline_Builder) {
    // This is just a handy way to pass allocator around.
    allocator = .{flat_pool_allocator_proc, *pool};
    shader_stages.allocator          = allocator;
    vertex_bindings.allocator        = allocator;
    vertex_attributes.allocator      = allocator;
    color_blend_attachments.allocator = allocator;
    dynamic_states.allocator         = allocator;

    reset(builder);

    initialized = true;
}

builder_to_pipeline :: (using builder: *Pipeline_Builder, renderer: *Renderer) -> VkResult, VkPipeline {
    vertex_input_info.vertexBindingDescriptionCount = xx vertex_bindings.count;
    vertex_input_info.pVertexBindingDescriptions = vertex_bindings.data;

    vertex_input_info.vertexAttributeDescriptionCount = xx vertex_attributes.count;
    vertex_input_info.pVertexAttributeDescriptions = vertex_attributes.data;

    color_blend_info.attachmentCount = xx color_blend_attachments.count;
    color_blend_info.pAttachments = color_blend_attachments.data;

    dynamic_info.pDynamicStates = dynamic_states.data;
    dynamic_info.dynamicStateCount = xx dynamic_states.count;

    pipeline_info := VkGraphicsPipelineCreateInfo.{
        stageCount = xx shader_stages.count,
        pStages = shader_stages.data,
        pVertexInputState = *vertex_input_info,
        pInputAssemblyState = *input_assembly_info,
        pTessellationState  = *tessellation_info,
        pViewportState      = *viewport_info,
        pRasterizationState = *rasterization_info,
        pMultisampleState   = *multisample_info,
        pDepthStencilState  = *depth_stencil_info,
        pColorBlendState    = *color_blend_info,
        pDynamicState       = *dynamic_info,
        layout              = layout,
        renderPass          = null,
        subpass             = 0,
        basePipelineHandle  = null,
        basePipelineIndex   = -1,
        pNext               = *render_info,
    };

    pipeline: VkPipeline;
    result := check_vk(vkCreateGraphicsPipelines(renderer.device, null, 1, *pipeline_info, renderer.vka, *pipeline));
    return result, pipeline;
}

deinit :: (using builder: *Pipeline_Builder) {
    fini(*pool);
}

reset :: (using builder: *Pipeline_Builder) {
    array_reset_keeping_memory(*shader_stages);
    array_reset_keeping_memory(*vertex_bindings);
    array_reset_keeping_memory(*vertex_attributes);
    array_reset_keeping_memory(*color_blend_attachments);
    array_reset_keeping_memory(*dynamic_states);

    vertex_input_info   = .{};
    input_assembly_info = .{};
    tessellation_info   = .{};
    viewport_info = .{
        viewportCount = 1,
        scissorCount  = 1,
    };
    rasterization_info = .{};
    multisample_info   = .{};
    depth_stencil_info = .{};

    color_blend_info = .{
        logicOpEnable = VK_FALSE,
        logicOp       = .COPY,
    };

    dynamic_info = .{};
    layout = null;
    render_info = .{};
}

set_shaders :: (using builder: *Pipeline_Builder, vert_shader_path: string, frag_shader_path: string) {
    // This is new in Vulkan 1.4 where shader module is deprecated. We
    // now just pass the VkShaderCreateInfo as an extension to the
    // VkPipelineShaderStageCreateInfo.

    array_reset_keeping_memory(*shader_stages);

    vert_shader_code := read_entire_file(vert_shader_path,, allocator);
    vert_create_info := New(VkShaderModuleCreateInfo,, allocator);
    vert_create_info.* = .{
        codeSize = xx vert_shader_code.count,
        pCode = cast(*u32) vert_shader_code.data
    };

    vert_info := VkPipelineShaderStageCreateInfo.{
        pNext = vert_create_info,
        stage = .VERTEX,
        pName = "main",
    };

    array_add(*shader_stages, vert_info);

    frag_shader_code := read_entire_file(frag_shader_path,, allocator);
    frag_create_info := New(VkShaderModuleCreateInfo,, allocator);
    frag_create_info.* = .{
        codeSize = xx frag_shader_code.count,
        pCode = cast(*u32) frag_shader_code.data
    };

    frag_info := VkPipelineShaderStageCreateInfo.{
        pNext = frag_create_info,
        stage = .FRAGMENT,
        pName = "main",
    };

    array_add(*shader_stages, frag_info);
}

// This is deprecated.
set_shaders :: (using builder: *Pipeline_Builder, vert_shader: VkShaderModule, frag_shader: VkShaderModule) {
    array_reset_keeping_memory(*shader_stages);
    add_shader(builder, vert_shader, .VERTEX);
    add_shader(builder, frag_shader, .FRAGMENT);
}

add_shader :: (using builder: *Pipeline_Builder, shader_module: VkShaderModule, stage: VkShaderStageFlags, entry_point := "main") {
    pipeline_shader_stage_create_info := VkPipelineShaderStageCreateInfo.{
        stage = stage,
        module = shader_module,
        pName = to_c_string(entry_point,, allocator)
    };

    array_add(*shader_stages, pipeline_shader_stage_create_info);
}

set_layout :: (builder: *Pipeline_Builder, layout: VkPipelineLayout) {
    builder.layout = layout;
}

set_input_topology :: (using builder: *Pipeline_Builder, topology: VkPrimitiveTopology) {
    input_assembly_info.topology = topology;
    input_assembly_info.primitiveRestartEnable = VK_FALSE;
}

set_polygon_mode :: (using builder: *Pipeline_Builder, mode: VkPolygonMode) {
    rasterization_info.polygonMode = mode;
    rasterization_info.lineWidth = 1;
}

set_cull_mode :: (using builder: *Pipeline_Builder, cull_mode: VkCullModeFlags, front_face: VkFrontFace) {
    rasterization_info.cullMode = cull_mode;
    rasterization_info.frontFace = front_face;
}

set_multisampling_none :: (using builder: *Pipeline_Builder) {
    multisample_info.sampleShadingEnable   = VK_FALSE;
    multisample_info.rasterizationSamples  = .e1;
    multisample_info.minSampleShading      = 1;
    multisample_info.pSampleMask           = null;
    multisample_info.alphaToCoverageEnable = VK_FALSE;
    multisample_info.alphaToOneEnable      = VK_FALSE;
}

disable_blending :: (using builder: *Pipeline_Builder) {
    color_blend_attachment := VkPipelineColorBlendAttachmentState.{
        colorWriteMask = .R | .G | .B | .A,
        blendEnable = VK_FALSE,
    };

    array_reset_keeping_memory(*color_blend_attachments);
    array_add(*color_blend_attachments, color_blend_attachment);
}

set_color_attachment_format :: (using builder: *Pipeline_Builder, format: VkFormat) {
    color_attachment_format = format;

    render_info.colorAttachmentCount = 1;
    render_info.pColorAttachmentFormats = *color_attachment_format;
}

set_depth_format :: (using builder: *Pipeline_Builder, format: VkFormat) {
    render_info.depthAttachmentFormat = format;
}

disable_depthtest :: (using builder: *Pipeline_Builder) {
    depth_stencil_info.depthTestEnable = VK_FALSE;
    depth_stencil_info.depthWriteEnable = VK_FALSE;
    depth_stencil_info.depthCompareOp = .NEVER;
    depth_stencil_info.depthBoundsTestEnable = VK_FALSE;
    depth_stencil_info.stencilTestEnable = VK_FALSE;
    depth_stencil_info.front = .{};
    depth_stencil_info.back = .{};
    depth_stencil_info.minDepthBounds = 0;
    depth_stencil_info.maxDepthBounds = 1;
}

enable_depthtest :: (using builder: *Pipeline_Builder, depth_write_enable: VkBool32, op: VkCompareOp) {
    depth_stencil_info.depthTestEnable = VK_TRUE;
    depth_stencil_info.depthBoundsTestEnable = VK_TRUE;
    depth_stencil_info.depthWriteEnable = depth_write_enable;
    depth_stencil_info.depthCompareOp = op;
    depth_stencil_info.stencilTestEnable = VK_FALSE;
    depth_stencil_info.front = .{};
    depth_stencil_info.back = .{};
    depth_stencil_info.minDepthBounds = 0;
    depth_stencil_info.maxDepthBounds = 1;
}

enable_blending_additive :: (using builder: *Pipeline_Builder) {
    color_blend_attachment := VkPipelineColorBlendAttachmentState.{
        colorWriteMask      = .R | .G | .B | .A,
        blendEnable         = VK_TRUE,
        srcColorBlendFactor = .SRC_ALPHA,
        dstColorBlendFactor = .ONE,
        colorBlendOp        = .ADD,
        srcAlphaBlendFactor = .ONE,
        dstAlphaBlendFactor = .ZERO,
        alphaBlendOp        = .ADD,
    };

    array_add(*color_blend_attachments, color_blend_attachment);
}

enable_blending_alphablend :: (using builder: *Pipeline_Builder) {
    color_blend_attachment := VkPipelineColorBlendAttachmentState.{
        colorWriteMask      = .R | .G | .B | .A,
        blendEnable         = VK_TRUE,
        srcColorBlendFactor = .SRC_ALPHA,
        dstColorBlendFactor = .ONE_MINUS_SRC_ALPHA,
        colorBlendOp        = .ADD,
        srcAlphaBlendFactor = .ONE,
        dstAlphaBlendFactor = .ZERO,
        alphaBlendOp        = .ADD,
    };

    array_add(*color_blend_attachments, color_blend_attachment);
}

add_vertex_input_binding :: (using builder: *Pipeline_Builder, binding: u32, stride: u32, input_rate: VkVertexInputRate) {
    description := VkVertexInputBindingDescription.{
        binding   = binding,
        stride    = stride,
        inputRate = input_rate,
    };

    array_add(*vertex_bindings, description);
}

add_vertex_input_attribute :: (using builder: *Pipeline_Builder, location: u32, binding: u32, format: VkFormat, offset: u32) {
    description := VkVertexInputAttributeDescription.{
        location = location,
        binding  = binding,
        format   = format,
        offset   = offset,
    };

    array_add(*vertex_attributes, description);
}

reset_vertex_input :: (using builder: *Pipeline_Builder) {
    array_reset_keeping_memory(*vertex_attributes);
    array_reset_keeping_memory(*vertex_bindings);
}

add_dynamic_state :: (using builder: *Pipeline_Builder, state: VkDynamicState) {
    array_add(*dynamic_states, state);
}

reset_dynamic_state :: (using builder: *Pipeline_Builder) {
    array_reset_keeping_memory(*dynamic_states);
}
