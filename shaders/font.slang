struct Push_Constant {
    float4 color;
    float px_range;
};

struct Vertex_Input {
    float2 position : POSITION;
    float2 uv : UV;
};

struct Vertex_Output {
    float4 position : SV_POSITION;
    float2 uv : UV;
};

[shader("vertex")]
Vertex_Output vertex_main(Vertex_Input input) {
  Vertex_Output output;

  output.position = float4(input.position, 0.0, 1.0);
  output.uv = input.uv;

  return output;
}

uniform Sampler2D font_texture;

float median(float3 v) {
    return max(min(v.r, v.g), min(max(v.r, v.g), v.b));
}

float screen_px_range(Push_Constant pc, float2 uv) {
  float2 dimensions;
  font_texture.GetDimensions(dimensions.x, dimensions.y);
    float2 unit_range =
        float2(pc.px_range) / float2(dimensions);
    float2 screen_texture_size = float2(1.0) / fwidth(uv);
    return max(0.5 * dot(unit_range, screen_texture_size), 1.0);
}

[shader("fragment")]
float4 fragment_main(float2 uv : UV, uniform Push_Constant pc) {
  float3 msdf = font_texture.Sample(uv).rgb;
  float sd = median(msdf) - 0.5;
  float px_dist = screen_px_range(pc, uv) * sd;
  float opacity = clamp(px_dist + 0.5, 0.0, 1.0);
  return float4(pc.color.rgb, pc.color.a * opacity);
}
