struct Vertex_Input {
    float4 position;
    float4 color;
};

struct Vertex_Output {
    float4 position : SV_Position;
    float4 color;
};

struct Params {
    Vertex_Input *vertex_input;
};

[vk::push_constant]
Params *pc;

[shader("vertex")]
Vertex_Output vertex_main(uint vid : SV_VertexID, uint iid : SV_InstanceID) {
    Vertex_Output output;

    output.position = pc.vertex_input[vid].position;
    output.color = pc.vertex_input[vid].color;

    return output;
}

[shader("fragment")]
float4 fragment_main(Vertex_Output input) : SV_Target {
    return input.color;
}
