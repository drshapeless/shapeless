struct Color {
    float r;
    float g;
    float b;
    float a;
};

struct Params {
    uint8_t *texture;
};

[shader("compute")]
[numthreads(256, 1, 1)]
void compute_main(uint thread_id : SV_DispatchThreadID, ParameterBlock<Params> p) {
    var i = thread_id * 4;

    p.texture[i] = 0xaa;
    p.texture[i+1] = 0x55;
    p.texture[i+2] = 0x33;
    p.texture[i+3] = 0xff;
}
