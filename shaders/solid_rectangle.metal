#include <metal_stdlib>
using namespace metal;

struct Color_Rectangle {
    int2 origin;
    int2 size;
    float4 color;
};

struct Params {
    device Color_Rectangle *rects;
    int64_t count;
    texture2d<float, access::read_write> texture;
};

kernel void compute_main(uint3 tid [[thread_position_in_grid]], constant Params *params[[buffer(0)]]) {
    uint w = params->texture.get_width();
    uint h = params->texture.get_height();
    if (tid.x >= w || tid.y >= h) {
        return;
    }

    int x = (int)tid.x;
    int y = (int)tid.y;
    for (int64_t i = params->count - 1; i >= 0; i--) {
        Color_Rectangle rect = params->rects[i];
        int2 mi = rect.origin;
        int2 ma = rect.origin + rect.size;

        if ((x >= mi.x && x <= ma.x) &&
            (y >= mi.y && y <= ma.y)) {
            params->texture.write(rect.color, tid.xy);
            return;
        }
    }
}
