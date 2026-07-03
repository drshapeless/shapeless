struct Params {
    float4 color;
    int2  origin;
    int2  size;
    DescriptorHandle<RWTexture2D<float4>> texture;
};

[[vk::push_constant]]
Params *p;

[shader("compute")]
[numthreads(8, 8, 1)]
void compute_main(uint2 tid : SV_DispatchThreadID) {
    if (tid.x >= p.size.x || tid.y >= p.size.y) {
        return;
    }

    uint2 coords = p.origin + tid;
    uint2 dimensions;
    p.texture.GetDimensions(dimensions.x, dimensions.y);

    if (coords.x < dimensions.x && coords.y < dimensions.y) {
        p.texture[coords] = p.color;
    }
}
