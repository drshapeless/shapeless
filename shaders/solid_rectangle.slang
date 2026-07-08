struct Color_Rectangle {
    int2 origin;
    int2 size;
    float4 color;
};


struct Params {
    Color_Rectangle *rects;
    int64_t count;
    DescriptorHandle<RWTexture2D<float4>> texture;
};

[[vk::push_constant]]
Params *p;

[shader("compute")]
[numthreads(8, 8, 1)]
void compute_main(uint2 tid : SV_DispatchThreadID) {
    uint2 dimensions;
    p.texture.GetDimensions(dimensions.x, dimensions.y);
    if (tid.x >= dimensions.x || tid.y >= dimensions.y) {
        return;
    }

    for (int64_t i = p.count - 1; i >= 0; i--) {
        int2 mini = p.rects[i].origin;
        int2 maxi = p.rects[i].origin + p.rects[i].size;

        if ((tid.x >= mini.x && tid.x <= maxi.x) &&
            (tid.y >= mini.y && tid.y <= maxi.y)) {
            p.texture[tid] = p.rects[i].color;
            return;
        }
    }
}
