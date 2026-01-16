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

#if OS == .MACOS {
    ENABLED_EXTENSION_NAMES :: (*u8).[VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME, VK_EXT_EXTENDED_DYNAMIC_STATE_3_EXTENSION_NAME];
} else {
    ENABLED_EXTENSION_NAMES :: (*u8).[VK_EXT_EXTENDED_DYNAMIC_STATE_3_EXTENSION_NAME];
}


appinit :: (appstate: **void, argc: s32, argv: **u8) -> SDL_AppResult {
    app := New(App);
    appstate.* = app;
    ok := SDL_Init(.VIDEO);
    assert(ok, "Cannot init SDL %", to_string(SDL_GetError()));

    app.win = SDL_CreateWindow("Shapeless", 800, 600, .RESIZABLE | .VULKAN);
    assert(app.win != null, "Cannot create window %", to_string(SDL_GetError()));

    ok = init(*app.renderer, app.win);
    if !ok return .FAILURE;

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

    set_clear_color(*renderer, .[0.8, 0.4, 0.3, 1.0]);
    if begin_draw(*renderer) {
        end_draw(*renderer);
    }
    return .CONTINUE;
    // return .SUCCESS;
}

appquit :: (appstate: *void, result: SDL_AppResult) {
    app := cast(*App)appstate;

    deinit(*app.renderer);
    SDL_Quit();
}
