App_State :: struct {
    window: *SDL_Window;
    queue: GPU.Queue;
    is_running: bool = true;

    clear_pipeline: GPU.Pipeline;
    arena: GPU.Arena;
    params: *Params;
    params_gpu: u64;

    last_frame_time: Apollo_Time;
}

Params :: struct {
    texture: u64;
    clear_color: GPU.Color;
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

    clear_shader := read_entire_file("shaders/clear.slang.spv");
    clear_ir := GPU.load_compute_ir(clear_shader);
    clear_pipeline = GPU.create_compute_pipeline(clear_ir);

    GPU.init(*arena, 1024);
    {
        GPU.push_allocator(GPU.arena_allocator_proc, *arena);

        params = GPU.New(Params);
        params_gpu = GPU.host_to_device_pointer(params);
        params.clear_color = .{0.2, 0.3, 0.4, 1.0};
    }

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

    // current_frame_time := current_time_monotonic();

    // if to_milliseconds(current_frame_time - last_frame_time) < 13000 return .CONTINUE;

    // last_frame_time = current_frame_time;

    cb := GPU.start_command_recording();

    draw_texture := GPU.draw_texture();
    params.texture = draw_texture.gpu;

    GPU.set_pipeline(cb, clear_pipeline);
    GPU.dispatch(cb, params_gpu, 800 * 600 / 256);
    GPU.submit_and_present(queue, cb);
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
