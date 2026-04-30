#ifndef METAL_H
#define METAL_H

#include <stdint.h>
uint64_t get_gpu_context_size(void);

void gpu_init(void *ctx);
void gpu_deinit(void *ctx);

#endif /* METAL_H */
