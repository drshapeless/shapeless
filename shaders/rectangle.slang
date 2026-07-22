struct Rect {
    int2 origin;
    int2 size;
    float4 color;
};

struct Vertex_Input {
    float4x4 projection;
    Rect *rectangles;
};

struct Vertex_Output {
    float4 position : SV_Position;
    float4 color;
};

struct Params {
    Vertex_Input *vertex_input;
};

[vk::push_constant]
Params pc;

[shader("vertex")]
Vertex_Output vertex_main(uint vid : SV_VertexID, uint iid : SV_InstanceID) {
    Vertex_Output output;

    Vertex_Input *input = pc.vertex_input;

    Rect rect = input.rectangles[iid];

    float min_x = (float)rect.origin.x;
    float min_y = (float)rect.origin.y;
    float max_x = (float)(rect.origin.x + rect.size.x);
    float max_y = (float)(rect.origin.y + rect.size.y);

    float2 positions[4];

    positions[0] = float2(min_x, min_y);
    positions[1] = float2(min_x, max_y);
    positions[2] = float2(max_x, min_y);
    positions[3] = float2(max_x, max_y);

    output.position = mul(input.projection, float4(positions[vid], 0.0, 1.0));
    output.color = input.rectangles[iid].color;
    return output;
}

[shader("fragment")]
float4 fragment_main(Vertex_Output input) : SV_Target {
    return input.color;
}
