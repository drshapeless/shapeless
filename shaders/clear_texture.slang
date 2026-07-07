struct Params {
    float4 clear_color;
    DescriptorHandle<RWTexture2D<float4>> texture;
};

[[vk::push_constant]]
Params *p;

[shader("compute")]
[numthreads(8, 8, 1)]
void compute_main(uint2 thread_id : SV_DispatchThreadID) {
    int2 coords = thread_id;

    var tex = p.texture;
    uint2 dimensions;
    tex.GetDimensions(dimensions.x, dimensions.y);

    if (coords.x < dimensions.x && coords.y < dimensions.y) {
        tex[coords] = p.clear_color;
    }
}
