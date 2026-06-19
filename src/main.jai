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

    shader_code := read_entire_file("shaders/test_apple.slang.spv");
    defer free(shader_code);

    pipeline := GPU.create_compute_pipeline(shader_code);
    defer GPU.free_pipeline(pipeline);

    arena: GPU.Arena;
    GPU.init(*arena);
    defer GPU.fini(*arena);

    input_array := GPU.NewArray(256, float);
    input_array_gpu := GPU.host_to_device_pointer(input_array.data);

    for * input_array {
        it.* = xx it_index;
    }

    output_array := GPU.NewArray(256, float);
    output_array_gpu := GPU.host_to_device_pointer(output_array.data);

    Params :: struct {
        input: u64;
        output: u64;
    }

    params := GPU.New(Params);
    params_gpu := GPU.host_to_device_pointer(params);

    params.input = input_array_gpu;
    params.output = output_array_gpu;

    cb := GPU.start_command_recording();

    GPU.set_pipeline(cb, pipeline);

    GPU.dispatch(cb, params_gpu, 1);

    queue := GPU.create_queue();

    sema := GPU.create_semaphore(0);

    GPU.submit(queue, .[cb], signal = .[.{sema, 1}]);

    GPU.wait_semaphore(sema, 1, 10000);

    for 0..10 {
        log("%", output_array[it]);
    }

}

#import "SDL3";
GPU :: #import "GPU";
#import "Basic";
#import "File";
#import "Hash_Table";
#import "Metal";
#import "Objective_C";
