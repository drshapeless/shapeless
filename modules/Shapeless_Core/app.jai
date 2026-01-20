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


}

appinit :: (appstate: **void, argc: s32, argv: **u8) -> SDL_AppResult {
    app := New(App);
    appstate.* = app;
    ok := SDL_Init(.VIDEO);
    assert(ok, "Cannot init SDL %", to_string(SDL_GetError()));

    msdf := load_msdf("assets/font/hack/hack.json");

    log("loaded % glyphs", msdf.glyphs.count);


    using app;

    win = SDL_CreateWindow("Shapeless", 800, 600, .RESIZABLE | .VULKAN);
    assert(win != null, "Cannot create window %", to_string(SDL_GetError()));

    ok = init(*renderer, win);
    if !ok return .FAILURE;

    set_clear_color(*renderer, .[0.8, 0.4, 0.3, 1.0]);

    // Create the texture for msdf png

    make_msdf_texture(*renderer);

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
        end_draw(*renderer);
    }
    return .CONTINUE;
}

appquit :: (appstate: *void, result: SDL_AppResult) {
    app := cast(*App)appstate;

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
        srcStageMask     = .ALL_COMMANDS,
        srcAccessMask    = .MEMORY_WRITE,
        dstStageMask     = .ALL_COMMANDS,
        dstAccessMask    = .MEMORY_WRITE | .MEMORY_READ,
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

    end_single_time_commands(renderer, command);

    result, texture.image_view = make_image_view(renderer, texture.image.vk, texture.format, .COLOR);
    assert(result == .SUCCESS);

    array_add(*textures_for_destruction, texture);
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

make_msdf_resources :: (using renderer: *Renderer) {
    descriptor_set_layout: VkDescriptorSetLayout;
    descriptor_pool: VkDescriptorPool;
    descriptor_set: VkDescriptorSet;
    sampler: VkSampler;

    texture := make_msdf_texture(*renderer);

    sampler_create_info := VkSamplerCreateInfo.{
        magFilter = .LINEAR,
        minFilter = .LINEAR,
        mipmapMode = .LINEAR,
        addressModeU = .CLAMP_TO_EDGE,
        addressModeV = .CLAMP_TO_EDGE,
        addressModeW = .CLAMP_TO_EDGE,
        anisotropyEnable = VK_FALSE,
        borderColor = FLOAT_OPAQUE_BLACK,
    };
    vkCreateSampler(device, *sampler_create_info, vka, *sampler);

    binding := VkDescriptorSetLayoutBinding.{
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
    if result return;

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
    if result return;

    allocate_info := VkDescriptorSetAllocateInfo.{
        descriptorPool = descriptor_pool,
        descriptorSetCount = 1,
        pSetLayouts = *descriptor_set_layout
    };
    result = check_vk(vkAllocateDescriptorSets(device, *allocate_info, *descriptor_set));
    if result return;

    descriptor_image_info := VkDescriptorImageInfo.{
        sampler = sampler,
        imageView = texture.image_view,
        imageLayout = SHADER_READ_ONLY_OPTIMAL
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

    pipeline_layout: VkPipelineLayout;
    pipeline_layout_create_info := VkPipelineLayoutCreateInfo.{
        setLayoutCount = 1,
        pSetLayouts = *descriptor_set_layout,
        pushConstantRangeCount = 1,
        pPushConstantRanges = *push_range
    };
    result = check_vk(vkCreatePipelineLayout(device, *pipeline_layout_create_info, vka, *pipeline_layout));
    if result return;


}

make_msdf_pipeline :: (renderer: *Renderer) -> VkResult, Renderer.Pipeline {
    pb: Pipeline_Builder;
    init(*pb);
    defer deinit(*pb);

    set_shaders(*pb, "shaders/msdf.vert.spv", "shaders/msdf.frag.spv");

}
