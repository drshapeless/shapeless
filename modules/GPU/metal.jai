#add_context gpu_context: *GPU_Context;

GPU_Context :: struct {
    device: *MTLDevice;
    sdl_window: *SDL_Window;
    view: SDL_MetalView;
    layer: *CAMetalLayer;
}

init :: () {
    context.gpu_context = alloc(size_of(GPU_Context));
    using context.gpu_context;

    device = MTLCreateSystemDefaultDevice();
}

deinit :: () {
    using context.gpu_context;
    CFRelease(device);
    free(context.gpu_context);
}

init_swapchain :: (window: *SDL_Window) {
    using context.gpu_context;
    sdl_window = window;
    view = SDL_Metal_CreateView(window);
    layer = SDL_Metal_GetLayer(view);
}

deinit_swapchain :: () {
    using context.gpu_context;
    SDL_Metal_DestroyView(view);
}

#scope_file
#import "Metal";
#import "Basic";
#import "SDL3";
#import "macOS";
