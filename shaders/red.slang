[[vk::binding(0)]]
RWTexture2D<float4> output_image;

static float4 yellow = {1.0, 1.0, 0.0, 1.0};
static float4 blue   = {0.0, 0.0, 1.0, 1.0};

[[numthreads(8, 8, 1)]]
[shader("compute")]
void main(uint3 dtid: SV_DispatchThreadID) {
    uint2 pixel = dtid.xy;

    if (pixel.x >= 32 || pixel.y >= 32) {
        return;
    }

    if (pixel.x >= 16) {
        output_image[pixel] = yellow;
    } else {
        output_image[pixel] = blue;
    }
}
