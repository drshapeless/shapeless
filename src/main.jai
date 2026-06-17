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

    shader_code := read_entire_file("shaders/test_metal.metal");
    defer free(shader_code);

    pipeline := GPU.create_compute_pipeline_msl(shader_code);
    defer GPU.free_pipeline(pipeline);

    arena: GPU.Arena;
    GPU.init(*arena);
    defer GPU.fini(*arena);

    output_array := GPU.NewArray(256, float);
    output_array_gpu := GPU.host_to_device_pointer(output_array.data);

    cb := GPU.start_command_recording();

    GPU.set_pipeline(cb, pipeline);

    GPU.dispatch(cb, output_array_gpu, 1);

    queue_g := GPU.create_queue();
    queue := queue_g.mtl;

    sema := GPU.create_semaphore(0);

    GPU.submit(queue_g, .[cb], signal = .[.{sema, 1}]);

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
