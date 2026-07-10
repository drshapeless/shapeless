#include <metal_stdlib>
using namespace metal;

struct Vertex_Input {
    float2 position;
    float4 color;
};

struct Vertex_Output {
    float4 position [[position]];
    float4 color;
};

vertex Vertex_Output vertex_main(uint vid [[vertex_id]], uint iid [[instance_id]], constant Vertex_Input *input [[buffer(0)]]) {
    Vertex_Output output;

    output.position = float4(input[vid].position, 0.0, 1.0);
    output.color = input[vid].color;

    return output;
}

fragment float4 fragment_main(Vertex_Output input [[stage_in]]) {
    return input.color;
}
