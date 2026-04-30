// I don't want to use ARC on any code I write.

#include "metal.h"

@import Metal;

typedef struct GPU_Context {
    id<MTLDevice> device;
} GPU_Context;

uint64_t get_gpu_context_size() {
    return sizeof(GPU_Context);
}

void gpu_init(void *ctx) {
    GPU_Context *context = (GPU_Context *)ctx;
    context->device = MTLCreateSystemDefaultDevice();
}

void gpu_deinit(void *ctx) {
    GPU_Context *context = (GPU_Context *)ctx;
    [context->device release];
}
