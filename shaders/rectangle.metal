#include <metal_stdlib>
using namespace metal;

struct Rect {
    int2 origin;
    int2 size;
    float4 color;
};

struct Vertex_Input {
    float4x4 projection;
    device Rect *rectangles;
};

struct Vertex_Output {
    float4 position [[position]];
    float4 color;
};

vertex Vertex_Output vertex_main(uint vid [[vertex_id]], uint iid [[instance_id]], constant Vertex_Input *input [[buffer(0)]]) {
    Vertex_Output output;

    Rect rect = input->rectangles[iid];

    float min_x = (float)rect.origin.x;
    float min_y = (float)rect.origin.y;
    float max_x = (float)(rect.origin.x + rect.size.x);
    float max_y = (float)(rect.origin.y + rect.size.y);

    float2 positions[4];

    positions[0] = float2(min_x, min_y);
    positions[1] = float2(min_x, max_y);
    positions[2] = float2(max_x, min_y);
    positions[3] = float2(max_x, max_y);

    output.position = input->projection * float4(positions[vid], 0.0, 1.0);
    output.color = input->rectangles[iid].color;

    return output;
}

fragment float4 fragment_main(Vertex_Output input [[stage_in]]) {
    return input.color;
}
