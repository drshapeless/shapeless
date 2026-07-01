App_State :: struct {
    window:          *SDL_Window;
    is_running := true;

    clear_pipeline:  GPU.Pipeline;
    arena: GPU.Arena;
    draw_arena: GPU.Arena;
    queue: GPU.Queue;

    params:          *Params;
    params_gpu:      u64;
    draw_texture:    GPU.Texture;

    window_resize_requested := false;
    resize_semaphore: GPU.Semaphore;
    window_width: s32;
    window_height: s32;
}

Params :: struct {
    clear_color: GPU.Color;
    texture: GPU.Texture_Descriptor;
}

app_init :: (appstate: **void, argc: s32, argv: **u8) -> SDL_AppResult {
    appstate.* = New(App_State);
    state: *App_State = appstate.*;
    using state;
    SDL_Init(.VIDEO);

    window_flags: SDL_WindowFlags = .RESIZABLE | .HIGH_PIXEL_DENSITY;
    #if OS == .MACOS {
        window_flags |= .METAL;
    } else #if OS == .LINUX {
        window_flags |= .VULKAN;
    }

    window = SDL_CreateWindow("shapeless", 800, 600, window_flags);

    GPU.init(window);

    clear_shader := read_entire_file("shaders/clear_texture.slang");
    clear_ir := GPU.load_compute_ir(clear_shader);
    defer GPU.destroy_ir(clear_ir);
    clear_pipeline = GPU.create_compute_pipeline(clear_ir);

    GPU.init(*arena);
    GPU.init(*draw_arena, 32 * 1024 * 1024); // 32MB should be enough for draw texture
    {
        GPU.push_allocator(GPU.arena_allocator_proc, *arena);

        params = GPU.New(Params);
        params_gpu = GPU.host_to_device_pointer(params);
        params.clear_color = .{0.2, 0.3, 0.4, 1.0};
    }

    ok: bool;
    ok, window_width, window_height = SDL_GetWindowSizeInPixels(window);
    assert(ok, "failed to get sdl window size");
    draw_texture_desc := GPU.Texture_Desc.{
        dimensions = .{xx window_width, xx window_height, 1},
        format = .B8G8R8A8_UNORM,
        usage = .STORAGE | .COLOR_ATTACHMENT,
    };
    draw_size_align := GPU.texture_size_align(draw_texture_desc);

    draw_ptr := GPU.get(*draw_arena, xx draw_size_align.size, xx draw_size_align.align);
    draw_ptr_gpu := GPU.host_to_device_pointer(draw_ptr);
    draw_texture = GPU.create_texture(draw_texture_desc, draw_ptr_gpu);

    queue = GPU.create_queue();

    resize_semaphore = GPU.create_semaphore(0);

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
    case .WINDOW_RESIZED;
        window_resize_requested = true;
    }

    return .CONTINUE;
}

app_iter :: (appstate: *void) -> SDL_AppResult {
    state := cast(*App_State) appstate;
    using state;

    if !is_running return .SUCCESS;

    ok, swapchain_texture := GPU.acquire_swapchain_texture();
    if !ok return .CONTINUE;

    cb := GPU.start_command_recording();
    params.texture = draw_texture.descriptor;

    GPU.set_pipeline(cb, clear_pipeline);
    group_size: GPU.u32x3 = .{
        x = cast(u32) ((window_width + 8 - 1) / 8),
        y = cast(u32) ((window_height + 8 - 1) / 8),
        z = 1
    };
    GPU.dispatch(cb, params_gpu, group_size, .{8, 8, 1});
    GPU.barrier(cb, .BLIT, .COMPUTE);
    GPU.copy_texture(cb, swapchain_texture, draw_texture);

    if window_resize_requested {
        GPU.submit_and_present(queue, swapchain_texture, cb, signal = .[.{resize_semaphore, 1}]);
        GPU.wait_semaphore(resize_semaphore, 1, 10000);
        resize_callback(state);
        window_resize_requested = false;
    } else {
        GPU.submit_and_present(queue, swapchain_texture, cb);
    }

    return .CONTINUE;
}

app_quit :: (appstate: *void, result: SDL_AppResult) {
    state := cast(*App_State) appstate;
    using state;

    GPU.free_pipeline(clear_pipeline);
    GPU.deinit();
    SDL_DestroyWindow(window);
    SDL_Quit();
    free(appstate);

    // This line is not needed if SDL_EnterMain works
    if result == .SUCCESS then exit(0); else exit(1);
}

resize_callback :: (using state: *App_State) {
    GPU.destroy_texture(draw_texture);
    GPU.reset(*draw_arena);
    ok: bool;
    ok, window_width, window_height = SDL_GetWindowSizeInPixels(window);
    assert(ok, "failed to get sdl window size");
    GPU.resize_callback(xx window_width, xx window_height);

    draw_texture_desc := GPU.Texture_Desc.{
        dimensions = .{xx window_width, xx window_height, 1},
        format = .B8G8R8A8_UNORM,
        usage = .STORAGE | .COLOR_ATTACHMENT,
    };
    draw_size_align := GPU.texture_size_align(draw_texture_desc);
    draw_ptr := GPU.get(*draw_arena, xx draw_size_align.size, xx draw_size_align.align);
    draw_ptr_gpu := GPU.host_to_device_pointer(draw_ptr);
    draw_texture = GPU.create_texture(draw_texture_desc, draw_ptr_gpu);

    GPU.signal_semaphore(resize_semaphore, 0);
}

#scope_file
#import "SDL3";
GPU :: #import "GPU";
#import "Basic";
#import "File";
#import "Hash_Table";
