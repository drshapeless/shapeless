#include <metal_stdlib>
using namespace metal;

struct Rect {
    float x, y;
    float w, h;
};

struct UV_Rect {
    Rect rect;
    Rect uv;
    float4 color;
};

struct Unified_Input {
    float4x4 projection;
    device UV_Rect *rectangles;
    texture2d<float> tex;
    sampler sam;
};

struct Vertex_Output {
    float4 position [[position]];
    float4 color;
    float2 uv;
};

vertex Vertex_Output vertex_main(uint vid [[vertex_id]], uint iid [[instance_id]], constant Unified_Input *input [[buffer(0)]]) {
    Vertex_Output output;

    Rect rect = input->rectangles[iid].rect;

    float min_x = rect.x;
    float min_y = rect.y;
    float max_x = rect.x + rect.w;
    float max_y = rect.y + rect.h;

    float2 positions[4];

    positions[0] = float2(min_x, min_y);
    positions[1] = float2(min_x, max_y);
    positions[2] = float2(max_x, min_y);
    positions[3] = float2(max_x, max_y);

    output.position = input->projection * float4(positions[vid], 0.0, 1.0);
    output.color = input->rectangles[iid].color;

    float2 texture_size;
    texture_size.x = input->tex.get_width();
    texture_size.y = input->tex.get_height();

    Rect uv = input->rectangles[iid].uv;
    float uv_min_x = uv.x / texture_size.x;
    float uv_min_y = uv.y / texture_size.y;
    float uv_max_x = (uv.x + uv.w) / texture_size.x;
    float uv_max_y = (uv.y + uv.h) / texture_size.y;

    float2 uvs[4];
    uvs[0] = float2(uv_min_x, uv_min_y);
    uvs[1] = float2(uv_min_x, uv_max_y);
    uvs[2] = float2(uv_max_x, uv_min_y);
    uvs[3] = float2(uv_max_x, uv_max_y);

    output.uv = uvs[vid];

    return output;
}

fragment float4 fragment_main(Vertex_Output vertex_output [[stage_in]], constant Unified_Input *input [[buffer(0)]]) {
    float4 value = input->tex.sample(input->sam, vertex_output.uv);
    return value;
}
