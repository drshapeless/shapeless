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

    GPU.init();
    defer GPU.deinit();

    shader_code := read_entire_file("shaders/test_color.slang.spv");
    defer free(shader_code);

    queue := GPU.create_queue();
    pipeline := GPU.create_compute_pipeline(shader_code);
    defer GPU.free_pipeline(pipeline);

    arena: GPU.Arena;
    GPU.init_arena(*arena, 128 * 1024 * 1024);
    defer GPU.deinit_arena(*arena);

    My_Struct :: struct {
        input: u64;
        output: u64;
    }

    gpu_data := GPU.arena_alloc(*arena, size_of(My_Struct));
    input_data := GPU.arena_alloc(*arena, size_of(float) * 256);
    output_data := GPU.arena_alloc(*arena, size_of(float) * 256);
    gpu_data.cpu.(*My_Struct).input = input_data.gpu;
    gpu_data.cpu.(*My_Struct).output = output_data.gpu;

    input_array: []float = .{count = 256, data = input_data.cpu};

    for * input_array {
        it.* = it_index.(float) * 1.7;
    }

    cmd := GPU.start_command_recording(queue);
    GPU.set_pipeline(cmd, pipeline);
    GPU.dispatch(cmd, gpu_data, 256);
    sema := GPU.create_semaphore(0);
    GPU.submit(queue, .[cmd], signal = .[.{sema, 1}]);

    GPU.wait_semaphore(sema, 1);
    defer GPU.destroy_semaphore(sema);

    output_array: []float = .{count = 256, data = output_data.cpu};
    for 0..10 {
        log("%", output_array[it]);
    }
}

#import "SDL3";
GPU :: #import "GPU";
#import "Basic";
#import "File";
