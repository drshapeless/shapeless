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

    simple_system: Simple_System;
    font_system: Font_System;

    monkey_texture: Renderer.Texture;
    square_mesh: Renderer.Mesh;

    last_render_time: float64;
}

appinit :: (appstate: **void, argc: s32, argv: **u8) -> SDL_AppResult {
    app := New(App);
    appstate.* = app;
    ok := SDL_Init(.VIDEO);
    assert(ok, "Cannot init SDL %", to_string(SDL_GetError()));

    using app;
    win = SDL_CreateWindow("Shapeless", 800, 600, .RESIZABLE | .VULKAN);
    assert(win != null, "Cannot create window %", to_string(SDL_GetError()));

    ok = init(*renderer, win);
    if !ok return .FAILURE;

    set_clear_color(*renderer, .[0.1, 0.2, 0.3, 1.0]);

    simple_system = make_simple_system(*renderer);
    font_system = make_font_system(*renderer);

    result: VkResult;
    result, square_mesh = make_mesh(*renderer, Simple_System.SQUARE_VERTICES, Simple_System.SQUARE_INDICES);
    if result return .FAILURE;

    result, monkey_texture = make_texture_from_file(*renderer, "assets/longhairmonkey.jpg");
    assert(result == .SUCCESS);

    writer: Descriptor_Writer;
    init(*writer);
    write_image(*writer, 0, monkey_texture.image_view, renderer.texture_sampler, .SHADER_READ_ONLY_OPTIMAL, .COMBINED_IMAGE_SAMPLER);
    update_set(*writer, renderer.device, simple_system.descriptor_set);

    last_render_time = to_float64_seconds(current_time_monotonic());

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

    current_time := to_float64_seconds(current_time_monotonic());
    delta := current_time - last_render_time;

    if renderer.resize_requested {
        width: s32;
        height: s32;
        SDL_GetWindowSize(app.win, *width , *height);
        resize_callback(*renderer, .{xx width ,xx height});
        update_font_system_screen_size(*font_system, renderer.draw_extent);
    }

    if delta > 1.0 / 60.0 {
        last_render_time = current_time;
        fps := 1.0 / delta;

        if begin_draw(*renderer) {
            cmd := renderer.cmd;
            draw_text(cmd, *font_system, tprint("%", fps), 102, .{10, 150});
            end_draw(*renderer);
        }
    }

    reset_temporary_storage();
    return .CONTINUE;
}

appquit :: (appstate: *void, result: SDL_AppResult) {
    app := cast(*App)appstate;

    vkDeviceWaitIdle(app.renderer.device);
    destroy_mesh(*app.renderer, app.square_mesh);
    destroy_font_system(*app.renderer, *app.font_system);
    destroy_texture(*app.renderer, app.monkey_texture);
    deinit(*app.renderer);
    SDL_Quit();
}
