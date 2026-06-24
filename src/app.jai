App_State :: struct {
    window: *SDL_Window;
    queue: GPU.Queue;
    is_running: bool = true;
}

app_init :: (appstate: **void, argc: s32, argv: **u8) -> SDL_AppResult {
    state := New(App_State);
    appstate.* = xx state;

    using state;
    SDL_Init(.VIDEO);

    window_flags: SDL_WindowFlags = .RESIZABLE;
    #if OS == .MACOS {
        window_flags |= .METAL;
    } else #if OS == .LINUX {
        window_flags |= .VULKAN;
    }

    window = SDL_CreateWindow("shapeless", 800, 600, window_flags);

    GPU.init(window);

    queue = GPU.create_queue();

    return .CONTINUE;
}

app_event :: (appstate: *void, event: *SDL_Event) -> SDL_AppResult {
    state := cast(*App_State) appstate;
    using state;

    if event.type == {
    case .QUIT;
        return .SUCCESS;
    case .WINDOW_CLOSE_REQUESTED;
        return .SUCCESS;
    case .KEY_DOWN;
        if event.key.scancode == {
        case .ESCAPE;
            is_running = false;
        }
    }

    return .CONTINUE;
}

app_iter :: (appstate: *void) -> SDL_AppResult {
    state := cast(*App_State) appstate;
    using state;

    if !is_running return .SUCCESS;

    cb := GPU.start_command_recording();

    success, draw_texture := GPU.aquire_next_texture();
    if !success return .CONTINUE;

    color_attachment :GPU.Render_Pass_Attachment_Desc = .{
        texture = draw_texture,
        load_op = .CLEAR,
        store_op = .STORE,
        clear_color = .{0.2, 0.3, 0.4, 1.0}
    };

    render_pass_desc := GPU.Render_Pass_Desc.{
            color_targets = .[color_attachment],
            };

    GPU.begin_render_pass(cb, render_pass_desc);
    GPU.end_render_pass(cb);

    GPU.submit_and_present(queue, draw_texture, .[cb]);

    return .CONTINUE;
}

app_quit :: (appstate: *void, result: SDL_AppResult) {
    state := cast(*App_State) appstate;
    using state;

    GPU.deinit();
    SDL_DestroyWindow(window);
    SDL_Quit();
    free(appstate);
}

#scope_file
#import "SDL3";
GPU :: #import "GPU";
#import "Basic";
#import "File";
#import "Hash_Table";
