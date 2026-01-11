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
    assert(ok, "Cannot create vk instance");
    using app;
    win = SDL_CreateWindow("Shapeless", 800, 600, .RESIZABLE | .VULKAN);
    assert(win != null, "cannot create window %", to_string(SDL_GetError()));

    vk_load_global_functions(xx SDL_Vulkan_GetVkGetInstanceProcAddr());

    instance_extensions: []*u8;
    instance_extension_count: u32;
    instance_extension_data := SDL_Vulkan_GetInstanceExtensions(*instance_extension_count);
    instance_extensions.count = instance_extension_count;
    instance_extensions.data = instance_extension_data;

    instance:, ok = make_vk_instance(instance_extensions, true);
    assert(ok, "Cannot create vk instance");

    vk_load_instance_functions(instance);

    surface: VkSurfaceKHR;
    ok = SDL_Vulkan_CreateSurface(win, instance, null, *surface);
    assert(ok, "Cannot create vk surface");

    renderer, ok = make_renderer(instance, surface, ENABLED_EXTENSION_NAMES, true);
    assert(ok, "Cannot create renderer");

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
    return .CONTINUE;
}

appquit :: (appstate: *void, result: SDL_AppResult) {
    app := cast(*App)appstate;

    deinit(*app.renderer);
    SDL_Quit();
}
