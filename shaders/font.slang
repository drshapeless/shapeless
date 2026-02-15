struct Bound {
    float left;
    float top;
    float right;
    float bottom;
};

struct Push_Constant {
    float4x4 projection;
    uint64_t vertex_data;
};

struct Vertex_Instance {
    float4 fg_color;
    Bound uvs;
    Bound positions;
    float2 unit_range;
    uint32_t texture_index;
};

struct Vertex_Output {
    float4 fg_color : COLOR0;
    float4 pos : SV_Position;
    float2 uv : UV0;
    float size : SIZE0;
    uint32_t texture_index : INDEX0;
    float2 unit_range : RANGE0;
    float2 texture_extent : EXTENT0;
};

uniform SamplerState sampler;
uniform Texture2D textures[];
// uniform Sampler2D font_texture;

// This is a N shape like quad for triangle strip
// index(uv)
//
// 0(0,0)  2(1,0)
//  |    /|
//  |   / |
//  |  /  |
//  | /   |
//  |/    |
// 1(0,1)  3(1,1)
//
// The plane bounds generated here is in the order of left, top, right, bottom

[shader("vertex")]
Vertex_Output vertex_main(uint vertex_id : SV_VertexID, uint instance_id : SV_InstanceID, uniform Push_Constant pc) {
    Vertex_Output output = {};

    Vertex_Instance *instance = (Vertex_Instance*)(pc.vertex_data + sizeof(Vertex_Instance) * instance_id);

    // Hardcode for now
    float2 positions[4] = {
        {instance.positions.left, instance.positions.top},
        {instance.positions.left, instance.positions.bottom},
        {instance.positions.right, instance.positions.top},
        {instance.positions.right, instance.positions.bottom},
    };
    // This projection matrix needs to be transpose because of some
    // stupid slang shader shit, I don't really understand right now.
    //
    // TODO: understand this shit
    output.pos = mul(transpose(pc.projection), float4(positions[vertex_id], 0, 1));

    uint texture_width, texture_height;
    textures[NonUniformResourceIndex(instance.texture_index)].GetDimensions(texture_width, texture_height);

    float2 uvs[4] = {
        {instance.uvs.left, instance.uvs.top},
        {instance.uvs.left, instance.uvs.bottom},
        {instance.uvs.right, instance.uvs.top},
        {instance.uvs.right, instance.uvs.bottom},
    };

    output.uv = uvs[vertex_id];

    output.fg_color = instance.fg_color;
    output.texture_index = instance.texture_index;
    output.unit_range = instance.unit_range;
    output.texture_extent = float2(texture_width, texture_height);
    return output;
}

float median(float r, float g, float b) {
    return max(min(r, g), min(max(r, g), b));
}

float2 sqr(float2 x) {
    return x * x;
}

float screen_px_range(float2 uv, float2 unit_range, float2 texture_extent) {
    // Unit range is precalculated in CPU
    // float2 unit_range = float2(distance_range) / texture_extent;
    // This is approximation.
    // float2 screen_tex_size = float2(1.0) / fwidth(uv);
    float2 screen_tex_size = rsqrt(sqr(ddx(uv)) + sqr(ddy(uv)));
    return max(0.5 * dot(unit_range, screen_tex_size), 1.0);
}

[shader("fragment")]
float4 fragment_main(Vertex_Output input, uniform Push_Constant pc) {
    float4 msd = textures[NonUniformResourceIndex(input.texture_index)].Sample(sampler, input.uv);
    float sd   = median(msd.r, msd.g, msd.b);
    float screen_px_distance = screen_px_range(input.uv, input.unit_range, input.texture_extent) * (sd - 0.5);
    float opacity = clamp(screen_px_distance + 0.5, 0.0, 1.0);

    // lerp() is mix() in glsl
    float4 color = float4(input.fg_color.rgb, opacity);
    return color;
}
