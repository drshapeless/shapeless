struct Color {
    float r;
    float g;
    float b;
    float a;
};

struct Params {
    uint8_t *texture;
    Color clear_color;
};

[shader("compute")]
[numthreads(256, 1, 1)]
void compute_main(uint thread_id : SV_DispatchThreadID, ParameterBlock<Params> p) {
    var i = thread_id * 4;

    p.texture[i+0] = (uint8_t)(p.clear_color.b * 255.0);
    p.texture[i+1] = (uint8_t)(p.clear_color.g * 255.0);
    p.texture[i+2] = (uint8_t)(p.clear_color.r * 255.0);
    p.texture[i+3] = (uint8_t)(p.clear_color.a * 255.0);
}
