#add_context gpu_context: *GPU_Context;

GPU_Context :: struct {
    device: *MTLDevice;
    sdl_window: *SDL_Window;
    view: SDL_MetalView;
    layer: *CAMetalLayer;
}

Allocation :: struct {
    cpu: *void;
    gpu: u64;
    buffer: *MTLBuffer;
}

init :: () {
    init_metal();
    context.gpu_context = Basic.alloc(size_of(GPU_Context));
    using context.gpu_context;

    device = MTLCreateSystemDefaultDevice();
}

deinit :: () {
    using context.gpu_context;
    CFRelease(device);
    Basic.free(context.gpu_context);
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

// Allocatiing some memory in Metal is just allocating a buffer
alloc :: (bytes: u64) -> Allocation {
    using context.gpu_context;

    buffer := MTLDevice.newBufferWithLength_options_(device, bytes, .StorageModeShared);
    allocation: Allocation;
    allocation.cpu = MTLBuffer.contents(buffer);
    allocation.gpu = MTLBuffer.gpuAddress(buffer);
    allocation.buffer = buffer;

    return allocation;
}

alloc :: (bytes: u64, align: u64) -> Allocation {
    allocation: Allocation;

    return allocation;
}

#scope_file
#import "Metal";
Basic :: #import "Basic";
#import "SDL3";
#import "macOS";
