Descriptor_Layout_Builder :: struct {
    initialized := false;
    bindings: [..] VkDescriptorSetLayoutBinding;
}

init :: (using builder: *Descriptor_Layout_Builder) {
    bindings.allocator = context.allocator;
    initialized = true;
}

free :: (builder: *Descriptor_Layout_Builder) {
    array_free(builder.bindings);
}

reset :: (builder: *Descriptor_Layout_Builder) {
    array_reset_keeping_memory(builder.bindings);
}

add_binding :: (using builder: *Descriptor_Layout_Builder, binding: u32, descriptor_type: VkDescriptorType, stage_flags: VkShaderStageFlags) {
    if !initialized init(builder);
    bind := VkDescriptorSetLayoutBinding.{
        binding         = binding,
        descriptorCount = 1,
        descriptorType  = descriptor_type,
        stageFlags      = stage_flags,
    };

    array_add(*bindings, bind);
}

builder_to_descriptor_set :: (builder: *Descriptor_Layout_Builder, using renderer: *Renderer, pNext: *void = null, flags: VkDescriptorSetLayoutCreateFlags = 0) -> VkResult, VkDescriptorSetLayout {
    info := VkDescriptorSetLayoutCreateInfo.{
        pNext        = pNext,
        pBindings    = builder.bindings.data,
        bindingCount = builder.bindings.count,
        flags        = flags,
    };

    set : VkDescriptorSetLayout;
    result := check_vk(vkCreateDescriptorSetLayout(device, *info, vka, *set));
    return result, set;
}
