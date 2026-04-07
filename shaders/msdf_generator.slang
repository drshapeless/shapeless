struct Metrics {
    float32_t scale;
    float32_t xoff;
    float32_t yoff;
    float32_t translate_x;
    float32_t translate_y;
    bool      y_flip;
};

struct Push_Constant {
    uint64_t block_memory;
    uint64_t output_memory;
    uint64_t windings;
    Metrics metrics;
};

struct Multi_Distance {
    float32_t r, g, b;
    float32_t med;
};

struct Edge_Segment {
    uint32_t type;
    int32_t  color;
    float2   start;
    float2   end;
    float2   control;
    float2   control1;
};

struct Signed_Distance {
    float32_t dist;
    float32_t d;
};

struct Edge_Point {
    Signed_Distance min_distance;
    Edge_Segment    near_edge;
    float32_t       near_param;
};

[vk::push_constant]
uniform Push_Constant pc;

[[numthreads(8, 8, 1)]]
[shader("compute")]
void main(uint3 dtid: SV_DispatchThreadID) {
    uint2 pixel = dtid.xy;

    // Hardcode as 32 for now
    if (pixel.x >= 32 || pixel.y >= 32) {
        return;
    }

    float* ptr = (float*)pc.output_memory;

    ptr[pixel.y * 32 * 3 + pixel.x * 3] = 3.33;
}
