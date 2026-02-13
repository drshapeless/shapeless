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

    font_system: Font_System;

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

    font_system = make_font_system(*renderer);

    last_render_time = to_float64_seconds(current_time_monotonic());

    log("renderer frame count: %", renderer.frames.count);

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
    }

    if delta > 1.0 / 60.0 {
        last_render_time = current_time;
        fps := 1.0 / delta;

        if begin_draw(*renderer) {
            begin_text_draw(*font_system, *renderer);
            append_text(*font_system, tprint("%", cast(u32) fps), 16, .{10, 30});
            append_text(*font_system, "hello, world", 32, .{10, 150});
            end_text_draw(*font_system, *renderer);
            end_draw(*renderer);
        }
    }

    reset_temporary_storage();
    return .CONTINUE;
}

appquit :: (appstate: *void, result: SDL_AppResult) {
    app := cast(*App)appstate;

    vkDeviceWaitIdle(app.renderer.device);
    destroy_font_system(*app.renderer, *app.font_system);
    deinit(*app.renderer);
    SDL_Quit();
}
