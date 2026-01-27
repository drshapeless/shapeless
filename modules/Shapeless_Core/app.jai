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

    font_atlas: Font_Atlas;
    simple_system: Renderer.System.ID;

    dumb: Dumb;
}

Dumb :: struct {
    mesh: Renderer.Mesh;
    texture: Renderer.Texture;
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

    result: VkResult;
    result, dumb.mesh = make_mesh(*renderer, SQUARE_VERTICES, SQUARE_INDICES);
    if result return .FAILURE;

    monkey_surface := IMG_Load("assets/longhairmonkey.jpg");
    assert(monkey_surface != null);
    converted_surface := SDL_ConvertSurface(monkey_surface, .RGBA32);
    assert(converted_surface != null);

    result, dumb.texture = make_texture(*renderer, converted_surface.pixels, .{xx converted_surface.w, xx converted_surface.h});
    assert(result == .SUCCESS);

    writer: Descriptor_Writer;
    init(*writer);
    write_image(*writer, 0, dumb.texture.image_view, renderer.texture_sampler, .SHADER_READ_ONLY_OPTIMAL, .COMBINED_IMAGE_SAMPLER);
    update_set(*writer, renderer.device, get_system(*renderer, simple_system).descriptor_set);

    return .CONTINUE;
}

appevent :: (appstate: *void, event: *SDL_Event) -> SDL_AppResult {
    app := cast(*App)appstate;
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
    case .WINDOW_RESIZED;
        app.renderer.resize_requested = true;
    }

    return .CONTINUE;
}

appiter :: (appstate: *void) -> SDL_AppResult {
    app := cast(*App)appstate;
    using app;

    if renderer.resize_requested {
        width: s32;
        height: s32;
        SDL_GetWindowSize(app.win, *width , *height);
        resize_callback(*renderer, .{xx width ,xx height});
    }

    if begin_draw(*renderer) {
        system := get_system(*renderer, simple_system);
        vkCmdBindPipeline(renderer.cmd, .GRAPHICS, system.pipeline);
        vkCmdBindDescriptorSets(renderer.cmd, .GRAPHICS, system.pipeline_layout, 0, 1, *system.descriptor_set, 0, null);
        // vkCmdBindDescriptorSets(renderer.cmd, .GRAPHICS, render_resources.pipeline_layout, 0, 1, *render_resources.descriptor_set, 0, null);

        // push_constant: Push_Constant;
        // push_constant.mvp = Matrix4_Identity;
        // push_constant.color = .{0, 0, 0, 1};
        // push_constant.px_range = font_atlas.distance_range;
        // vkCmdPushConstants(renderer.cmd, render_resources.pipeline_layout, .VERTEX | .FRAGMENT, 0, size_of(Push_Constant), *push_constant);

        draw_mesh(renderer.cmd, dumb.mesh);

        end_draw(*renderer);
    }
    return .CONTINUE;
}

appquit :: (appstate: *void, result: SDL_AppResult) {
    app := cast(*App)appstate;

    vkDeviceWaitIdle(app.renderer.device);
    destroy_mesh(*app.renderer, app.dumb.mesh);
    destroy_texture(*app.renderer, app.dumb.texture);
    deinit(*app.renderer);
    SDL_Quit();
}
