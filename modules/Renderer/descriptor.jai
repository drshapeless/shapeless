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

Descriptor_Writer :: struct {
    writes:    [..] VkWriteDescriptorSet;
    pool:      Flat_Pool;
    allocator: Allocator;
    initialized := false;
}

init :: (using writer: *Descriptor_Writer) {
    allocator = .{flat_pool_allocator_proc, *pool};
    writes.allocator = allocator;
    initialized = true;
}

write_image :: (using writer: *Descriptor_Writer, binding: u32, image_view: VkImageView, sampler: VkSampler, image_layout: VkImageLayout, type: VkDescriptorType) {
    if !initialized init(writer);

    image_info := New(VkDescriptorImageInfo,, allocator);
    image_info.sampler     = sampler;
    image_info.imageView   = image_view;
    image_info.imageLayout = image_layout;

    write := VkWriteDescriptorSet.{
        dstBinding = binding,
        descriptorCount = 1,
        descriptorType = type,
        pImageInfo = image_info
    };

    array_add(*writes, write);
}

write_buffer :: (using writer: *Descriptor_Writer, binding: u32, buffer: VkBuffer, size: VkDeviceSize, offset: VkDeviceSize, type: VkDescriptorType) {
    if !initialized init(writer);

    buffer_info := New(VkDescriptorBufferInfo,, allocator);
    buffer_info.buffer = buffer;
    buffer_info.offset = offset;
    buffer_info.range  = size;

    write := VkWriteDescriptorSet.{
        dstBinding      = binding,
        descriptorCount = 1,
        descriptorType  = type,
        pBufferInfo     = buffer_info
    };

    array_add(*writes, write);
}

update_set :: (using writer: *Descriptor_Writer, device: VkDevice, set: VkDescriptorSet) {
    for * write: writes {
        write.dstSet = set;
    }

    vkUpdateDescriptorSets(device, xx writes.count, writes.data, 0, null);
}

reset :: (using writer: *Descriptor_Writer) {
    array_reset(*writes);
    reset(*pool);
}

deinit :: (using writer: *Descriptor_Writer) {
    fini(*pool);
}
