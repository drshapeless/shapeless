struct Params {
    float4 clear_color;
    DescriptorHandle<RWTexture2D<float4>> texture;
};

[[vk::push_constant]]
Params *p;

[shader("compute")]
[numthreads(256, 1, 1)]
void compute_main(uint2 thread_id : SV_DispatchThreadID) {
    int2 coords = thread_id;

    uint2 dimensions;
    p.texture.GetDimensions(dimensions.x, dimensions.y);

    if (coords.x < dimensions.x && coords.y < dimensions.y) {
        p.texture[coords] = p.clear_color;
    }
}
