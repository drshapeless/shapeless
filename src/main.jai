main :: () {
    SDL_Init(.VIDEO);
    defer SDL_Quit();

    window_flags: SDL_WindowFlags = .RESIZABLE;
    #if OS == .MACOS {
        window_flags |= .METAL;
    } else #if OS == .LINUX {
        window_flags |= .VULKAN;
    }

    window := SDL_CreateWindow("shapeless", 800, 600, .RESIZABLE | .METAL);
    defer SDL_DestroyWindow(window);

    GPU.init();
    defer GPU.deinit();
    GPU.init_swapchain(window);
    defer GPU.deinit_swapchain();

    allocation := GPU.alloc(1024);
    log("%", allocation);
}

#import "SDL3";
GPU :: #import "GPU";
#import "Basic";
