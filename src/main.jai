main :: () {
    SDL_Init(.VIDEO);
    defer SDL_Quit();

    window_flags: SDL_WindowFlags = .RESIZABLE;
    #if OS == .MACOS {
        window_flags |= .METAL;
    } else #if OS == .LINUX {
        window_flags |= .VULKAN;
    }

    window := SDL_CreateWindow("shapeless", 800, 600, window_flags);
    defer SDL_DestroyWindow(window);

    GPU.init(window);
    defer GPU.deinit();

    shader_code := read_entire_file("shaders/test_apple.slang.spv");
    defer free(shader_code);

    compute_ir := GPU.load_compute_ir(shader_code);

    pipeline := GPU.create_compute_pipeline(compute_ir);
    defer GPU.free_pipeline(pipeline);

    arena: GPU.Arena;
    GPU.init(*arena);
    defer GPU.fini(*arena);

    queue := GPU.create_queue();

    is_running := true;
    while is_running {
        e: SDL_Event;
        while SDL_PollEvent(*e) {
            if e.type == {
            case .QUIT;
                is_running = false;
            case .WINDOW_CLOSE_REQUESTED;
                is_running = false;
            case .KEY_DOWN;
                if e.key.scancode == {
                case .ESCAPE;
                    is_running = false;
                }
            }
        }

        cb := GPU.start_command_recording();

        success, draw_texture := GPU.aquire_next_texture();
        if !success continue;

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
    }
}

#import "SDL3";
GPU :: #import "GPU";
#import "Basic";
#import "File";
#import "Hash_Table";
#import "Metal";
#import "Objective_C";
