struct Push_Constant {
    uint64_t ptr0;
};

struct Vertex_Output {
    float4 pos : SV_Position;
};

uniform Sampler2D font_texture;

[shader("vertex")]
Vertex_Output vertex_main(uniform Push_Constant pc) {
    Vertex_Output output = {};
    return output;
}

[shader("fragment")]
float4 fragment_main(float2 uv : UV, uniform Push_Constant pc) {
    return float4(1, 0, 0, 1);
}
