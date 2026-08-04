App_State :: struct {
    window:          *SDL_Window;
    is_running := true;

    queue: GPU.Queue;

    window_resize_requested := false;
}

app_arena: GPU.Arena;
monkey_texture: GPU.Texture;
texture_heap: [] GPU.Texture_Descriptor;
sampler_heap: [] GPU.Sampler_Descriptor;
font: Font;

loaded_ascii := false;

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
    init_font();

    queue = GPU.create_queue();

    // TEMP

    {
        GPU.init(*app_arena);
        image_width, image_height: s32;
        channels: s32;
        image_data := stbi_load("longhairmonkey.jpg", *image_width, *image_height, *channels, 4);

        desc: GPU.Texture_Desc = .{
            dimensions = .{xx image_width, xx image_height, 1},
            format = .R8G8B8A8_UNORM,
            usage = .SAMPLED | .TRANSFER_DST,
        };
        size_align := GPU.texture_size_align(desc);
        ptr := GPU.get(*app_arena, xx size_align.size, xx size_align.align);
        gpu_ptr := GPU.host_to_device_pointer(ptr);
        monkey_texture = GPU.create_texture(desc, gpu_ptr);

        GPU.host_copy_to_texture(monkey_texture, image_data);

        texture_heap = GPU.create_texture_heap(1);
        texture_heap[0] = GPU.texture_view_descriptor(monkey_texture, .{format = .R8G8B8A8_UNORM});
        sampler_heap = GPU.create_sampler_heap(1);
        sampler_heap[0] = simple_sampler_descriptor;

    }

    font = create_font("Hack-Regular.ttf");
    set_font_size(*font, 48);

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

    if !loaded_ascii {
        load_ascii(cb, *font);
        loaded_ascii = true;
    }

    color_target: GPU.Render_Pass_Attachment_Desc = .{
        texture = draw_texture,
    };
    color_target.clear_color = .{0.2, 0.3, 0.4, 1.0};
    render_pass_desc: GPU.Render_Pass_Desc = .{
        color_targets = .[color_target],
    };
    GPU.begin_render_pass(cb, render_pass_desc);

    viewport: GPU.Viewport;
    viewport.width = xx draw_texture.dimensions.x;
    viewport.height = xx draw_texture.dimensions.y;
    GPU.set_viewport(cb, viewport);
    scissor: Rect;
    scissor.w = xx draw_texture.dimensions.x;
    scissor.h = xx draw_texture.dimensions.y;
    GPU.set_scissor(cb, scissor);

    GPU.set_pipeline(cb, simple_uv_pipeline);
    GPU.set_topology(cb, .TRIANGLE_STRIP);

    GPU.set_active_texture_heap(cb, texture_heap);
    GPU.set_active_sampler_heap(cb, sampler_heap);
    rect := UV_Rectangle.{
        rect = .{50, 100, 300, 300},
        uv   = .{0, 0, xx monkey_texture.dimensions.x, xx monkey_texture.dimensions.y},
    };

    draw_uv(cb, rect);

    begin_draw_text(cb);
    draw_text(cb, *font, "bello", .{50, 50}, .{1, 1, 1, 1});

    GPU.end_render_pass(cb);

    GPU.barrier(cb, .ALL, .BLIT);
    GPU.copy_texture(cb, swapchain_texture, draw_texture, true);

    GPU.submit_and_present(queue, swapchain_texture, cb);
    return .CONTINUE;
}

app_quit :: (appstate: *void, result: SDL_AppResult) {
    state := cast(*App_State) appstate;
    using state;

    GPU.destroy_texture(monkey_texture);
    GPU.fini(*app_arena);
    destroy_font(font);
    deinit_font();
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
#import "Utils/types";
#import "stb_image";
#import "Font";
