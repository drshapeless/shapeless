#language slang 2026
struct Vertex {
    float2 pos;
    float2 uv;
};

struct Vertex_Stage_Output {
    float4 sv_position : SV_Position;
    float2 uv : TEXCOORD0;
};


[shader("vertex")]
Vertex_Stage_Output vertex_main(Vertex vertex) {
    Vertex_Stage_Output output;

    output.uv = vertex.uv;
    output.sv_position = float4(vertex.pos, 0.0, 1.0);

    return output;
}

[shader("fragment")]
float4 fragment_main(float2 uv : TEXCOORD0) : SV_Target {
    return float4(1.0, 0, 0, 1);
}
