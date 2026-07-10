App_State :: struct {
    window:          *SDL_Window;
    is_running := true;

    queue: GPU.Queue;

    window_resize_requested := false;

    rect_origin: s32x2;
    rect_size: s32x2;
    rect_direction: s32x2 = .{1, 1};
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
    init_renderer(window);

    queue = GPU.create_queue();

    rect_origin = .{0, 0};
    rect_size = .{200, 200};

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
    if window_resize_requested {
        resize_callback();
        window_resize_requested = false;
        return .CONTINUE;
    }

    ok, swapchain_texture := GPU.acquire_swapchain_texture();
    if !ok return .CONTINUE;

    i := GPU.frame_index();
    GPU.reset(*frame_arenas[i]);

    cb := GPU.start_command_recording();

    color_target: GPU.Render_Pass_Attachment_Desc = .{
        texture = draw_texture,
    };
    color_target.clear_color = .{0.2, 0.3, 0.4, 1.0};
    render_pass_desc: GPU.Render_Pass_Desc = .{
        color_targets = .[color_target],
    };
    GPU.begin_render_pass(cb, render_pass_desc);

    GPU.set_pipeline(cb, simple_pipeline);
    GPU.set_topology(cb, .TRIANGLE_LIST);

    vertices: [3] Simple_Data;
    vertices[0].position = .{0.0, 0.0, 0.0, 1.0};
    vertices[1].position = .{0.5, 0.5, 0.0, 1.0};
    vertices[2].position = .{0, 0.5, 0.0, 1.0};
    vertices[0].color = .{0.0, 1.0, 0.0, 1.0};
    vertices[1].color = .{1.0, 0.0, 0.0, 1.0};
    vertices[2].color = .{1.0, 0.0, 0.0, 1.0};

    indices: [3]u32 = .[0, 1, 2];


    draw_simple(cb, vertices, indices);
    GPU.end_render_pass(cb);

    GPU.set_active_texture_heap(cb, draw_heap);
    // GPU.set_pipeline(cb, clear_pipeline);
    // clear_screen(cb, .{0.2, 0.3, 0.4, 1.0});

    GPU.barrier(cb, .FRAGMENT, .COMPUTE);
    GPU.set_pipeline(cb, solid_rectangle_pipeline);
    rect1: Color_Rectangle = .{
        origin = .{0, 0},
        size   = .{200, 200},
        color  = .{0.0, 1.0, 1.0, 1.0},
    };
    rect2: Color_Rectangle = .{
        origin = .{150, 200},
        size   = .{400, 700},
        color  = .{0.0, 0.7, 1.0, 1.0},
    };
    draw_rectangles(cb, rect2, rect1);


    GPU.barrier(cb, .COMPUTE, .BLIT);
    GPU.copy_texture(cb, swapchain_texture, draw_texture, true);

    GPU.submit_and_present(queue, swapchain_texture, cb);
    return .CONTINUE;
}

app_quit :: (appstate: *void, result: SDL_AppResult) {
    state := cast(*App_State) appstate;
    using state;

    deinit_renderer();
    GPU.deinit();
    SDL_DestroyWindow(window);
    SDL_Quit();
    free(appstate);

    // This line is not needed if SDL_EnterMain works
    if result == .SUCCESS then exit(0); else exit(1);
}

#scope_file
#import "SDL3";
GPU :: #import "GPU";
#import "Basic";
#import "File";
#import "Hash_Table";
#import "Renderer";
