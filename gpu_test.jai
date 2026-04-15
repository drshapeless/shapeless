main :: () {
    ok: bool;

    ok = SDL_Init(.VIDEO);
    if !ok {
        log("%", to_string(SDL_GetError()));
        return;
    }
    defer SDL_Quit();

    ok = SDL_Vulkan_LoadLibrary(null);
    if !ok {
        log("%", sdl_error());
        return;
    }

    gpu.init();
    defer gpu.deinit();

    log("rebar %", context.gpu_context.default_memory_index);
    log("gpu %", context.gpu_context.gpu_memory_index);
    log("readback %", context.gpu_context.readback_memory_index);
}

sdl_error :: () -> string {
    return to_string(SDL_GetError());
}

#import "Basic";
#import "SDL3";
gpu :: #import "GPU";
