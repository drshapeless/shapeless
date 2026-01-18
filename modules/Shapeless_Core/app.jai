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

    image_info := VkImageCreateInfo.{
        imageType = .e2D,
        format = .R8G8B8A8_SRGB,
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
    result := check_vk(vmaCreateImage(vma, *image_info, *alloc_info, *image, *allocation, null));
    assert(result == .SUCCESS);

    texture: Renderer.Texture;
    texture.image.vk = image;
    texture.image.allocation = allocation;

    staging_info := VkBufferCreateInfo.{
        size = xx (font_surface.w * font_surface.h * 4),
        usage = .TRANSFER_SRC,
        sharingMode = .EXCLUSIVE
    };

    staging_alloc_info := VmaAllocationCreateInfo.{
        flags = xx VmaAllocationCreateFlagBits.HOST_ACCESS_SEQUENTIAL_WRITE_BIT | VmaAllocationCreateFlagBits.MAPPED_BIT,
        usage = .AUTO
    };

    staging_buf: VkBuffer;
    staging_alloc: VmaAllocation;
    mapped_ptr: *void;

    result = check_vk(vmaCreateBuffer(vma, *staging_info, *staging_alloc_info, *staging_buf, *staging_alloc, null));
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
        srcBuffer = staging_buf,
        dstImage = texture.image.vk,
        dstImageLayout = .TRANSFER_DST_OPTIMAL,
        regionCount = 1,
        pRegions = *region
    };

    vkCmdCopyBufferToImage2(command, *copy_info);

    end_single_time_commands(renderer, command);

    return texture;
}
