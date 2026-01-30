struct Push_Constant {
    float    px_range;
    float4   bg_color;
    float4   fg_color;
    uint64_t ptr0;
};

struct Vertex_Output {
    float4 pos : SV_Position;
    float2 uv : UV0;
};

uniform Sampler2D font_texture;

struct Vertex {
    float2 pos;
    float2 uv;
};

static const Vertex SQUARE_VERTICES[4] = {
    { float2(-0.5, -0.5), float2(0.0, 0.0) },
    { float2(-0.5,  0.5), float2(0.0, 1.0) },
    { float2( 0.5,  0.5), float2(1.0, 1.0) },
    { float2( 0.5, -0.5), float2(1.0, 0.0) },
};

static const uint SQUARE_INDICES[6] = {
    0, 1, 2, 0, 2, 3
};

[shader("vertex")]
Vertex_Output vertex_main(uint vertex_id : SV_VertexID, uint instance_id : SV_InstanceID, uniform Push_Constant pc) {
    Vertex_Output output = {};

    Vertex v = SQUARE_VERTICES[SQUARE_INDICES[vertex_id]];
    output.pos = float4(v.pos, 0, 1);

    return output;
}

[shader("fragment")]
float4 fragment_main(Vertex_Output input, uniform Push_Constant pc) {
    float4 color = *(float4*)pc.ptr0;
    return color;
}
