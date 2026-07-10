#include <metal_stdlib>
using namespace metal;

struct Params {
    float4 clear_color;
    texture2d<float, access::read_write> texture;
};

kernel void compute_main(uint3 tid [[thread_position_in_grid]], constant Params* params[[buffer(0)]]) {
    uint w = params->texture.get_width();
    uint h = params->texture.get_height();

    if (tid.x >= w || tid.y >= h) {
        return;
    }

    params->texture.write(params->clear_color, tid.xy);

    return;
}
