App_State :: struct {
    window: *SDL_Window;
    queue: GPU.Queue;
    is_running: bool = true;

    clear_pipeline: GPU.Pipeline;
    arena: GPU.Arena;
    params: *Params;
    params_gpu: u64;
    draw_texture: GPU.Texture;

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
    defer GPU.destroy_ir(clear_ir);
    clear_pipeline = GPU.create_compute_pipeline(clear_ir);

    GPU.init(*arena);
    {
        GPU.push_allocator(GPU.arena_allocator_proc, *arena);

        params = GPU.New(Params);
        params_gpu = GPU.host_to_device_pointer(params);
        params.clear_color = .{0.2, 0.3, 0.4, 1.0};

        ok, width, height := SDL_GetWindowSize(window);
        assert(ok);
        draw_texture_desc := GPU.Texture_Desc.{
            dimensions = .{xx width, xx height, 1},
            format = .B8G8R8A8_UNORM,
            usage = .STORAGE | .COLOR_ATTACHMENT,
        };
        draw_size_align := GPU.texture_size_align(draw_texture_desc);

        draw_ptr := GPU.get(*arena, xx draw_size_align.size, xx draw_size_align.align);
        draw_ptr_gpu := GPU.host_to_device_pointer(draw_ptr);
        draw_texture = GPU.create_texture(draw_texture_desc, draw_ptr_gpu);
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

    ok, swapchain_texture := GPU.acquire_swapchain_texture();
    if !ok return .CONTINUE;

    cb := GPU.start_command_recording();
    params.texture = draw_texture.gpu;

    GPU.set_pipeline(cb, clear_pipeline);
    GPU.dispatch(cb, params_gpu, 800 * 600 / 256);
    GPU.barrier(cb, .BLIT, .COMPUTE);
    GPU.copy_texture(cb, swapchain_texture, draw_texture);
    GPU.submit_and_present(queue, swapchain_texture, cb);
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
