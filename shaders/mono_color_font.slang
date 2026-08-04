struct Rect {
    float x, y;
    float w, h;
};

struct UV_Rect {
    Rect rect;
    Rect uv;
};

struct Vertex_Output {
    float4 position : SV_Position;
    float2 uv;
};

struct Vertex_Input {
    float4x4 projection;
    UV_Rect *rectangles;
    DescriptorHandle<Texture2D<float4>> tex;
};

struct Fragment_Input {
    float4 color;
    DescriptorHandle<Texture2D<float4>> tex;
    DescriptorHandle<SamplerState> sam;
};

struct Params {
    Vertex_Input *vertex_input;
    Fragment_Input *fragment_input;
};

[vk::push_constant]
Params pc;

[shader("vertex")]
Vertex_Output vertex_main(uint vid : SV_VertexID, uint iid : SV_InstanceID) {
    Vertex_Output output;

    Rect rect = pc.vertex_input->rectangles[iid].rect;

    float min_x = rect.x;
    float min_y = rect.y;
    float max_x = rect.x + rect.w;
    float max_y = rect.y + rect.h;

    float2 positions[4];

    positions[0] = float2(min_x, min_y);
    positions[1] = float2(min_x, max_y);
    positions[2] = float2(max_x, min_y);
    positions[3] = float2(max_x, max_y);

    output.position = mul(pc.vertex_input->projection, float4(positions[vid], 0.0, 1.0));

    uint width, height;
    pc.vertex_input.tex.GetDimensions(width, height);

    float2 texture_size;
    texture_size.x = (float)width;
    texture_size.y = (float)height;

    Rect uv = pc.vertex_input.rectangles[iid].uv;
    float uv_min_x = uv.x / texture_size.x;
    float uv_min_y = uv.y / texture_size.y;
    float uv_max_x = (uv.x + rect.w) / texture_size.x;
    float uv_max_y = (uv.y + rect.h) / texture_size.y;

    float2 uvs[4];
    uvs[0] = float2(uv_min_x, uv_min_y);
    uvs[1] = float2(uv_min_x, uv_max_y);
    uvs[2] = float2(uv_max_x, uv_min_y);
    uvs[3] = float2(uv_max_x, uv_max_y);

    output.uv = uvs[vid];

    return output;
}

[shader("fragment")]
float4 fragment_main(Vertex_Output vertex_output) : SV_Target {
    float value = pc.fragment_input.tex.Sample(pc.fragment_input.sam, vertex_output.uv).r;
    return float4(pc.fragment_input.color.xyz, value);
}
