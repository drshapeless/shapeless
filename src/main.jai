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

    allocation0 := GPU.alloc(1024);
    defer GPU.free(allocation0);

    allocation1 := GPU.alloc(1024);
    defer GPU.free(allocation1);

    some_numbers := int.[1, 2, 3, 3];
    memcpy(allocation0.cpu, some_numbers.data, size_of(int) * some_numbers.count);

    a0_num: []int;
    a0_num.count = 4;
    a0_num.data = allocation0.cpu;

    log("%", a0_num);

    a1_num: []int;
    a1_num.count = 4;
    a1_num.data = allocation1.cpu;
    log("%", a1_num);

    semaphore := GPU.create_semaphore(0);
    defer GPU.destroy_semaphore(semaphore);
    queue := GPU.create_queue();
    cb := GPU.start_command_recording(queue);
    GPU.memcpy(cb, allocation1, allocation0, size_of(int) * some_numbers.count);
    GPU.submit(queue, .[cb], signal = .[.{semaphore, 1}]);

    GPU.wait_semaphore(semaphore, 1);

    log("%", a1_num);


}

#import "SDL3";
GPU :: #import "GPU";
#import "Basic";
