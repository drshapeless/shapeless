struct Push_Constant {
    float4x4 projection;
    uint64_t header;
    uint64_t vertex_data;
};

struct Vertex_Instance {
    float4 fg_color;
    float4 atlas_bounds;
    float2 extent;
    float2 origin;
    float size;
};

struct Header {
    float2 texture_extent;
    float distance_range;
};

struct Vertex_Output {
    float4 fg_color : COLOR0;
    float4 pos : SV_Position;
    float2 uv : UV0;
    float size : SIZE0;
};

uniform Sampler2D font_texture;

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
    Header header = *(Header*)pc.header;
    Vertex_Output output = {};

    Vertex_Instance *instance = (Vertex_Instance*)(pc.vertex_data + sizeof(Vertex_Instance) * instance_id);

    // Hardcode for now
    float width = instance.extent.x;
    float height = instance.extent.y;

    float2 poss[4] = {
        {instance.origin.x, instance.origin.y},
        {instance.origin.x, instance.origin.y + height},
        {instance.origin.x + width, instance.origin.y},
        {instance.origin.x + width, instance.origin.y + height}
    };
    // This projection matrix needs to be transpose because of some
    // stupid slang shader shit, I don't really understand right now.
    //
    // TODO: understand this shit
    output.pos = mul(transpose(pc.projection), float4(poss[vertex_id], 0, 1));

    float u_min = instance.atlas_bounds.x / header.texture_extent.x;
    float u_max = instance.atlas_bounds.z / header.texture_extent.x;
    float v_min = instance.atlas_bounds.y / header.texture_extent.y;
    float v_max = instance.atlas_bounds.w / header.texture_extent.y;

    float2 uvs[4] = {
        {u_min, v_min},
        {u_min, v_max},
        {u_max, v_min},
        {u_max, v_max}
    };

    output.uv = uvs[vertex_id];

    output.fg_color = instance.fg_color;
    output.size = instance.size;
    return output;
}

float median(float r, float g, float b) {
    return max(min(r, g), min(max(r, g), b));
}

float2 sqr(float2 x) {
    return x * x;
}

float screen_px_range(float2 uv, float distance_range, float2 texture_extent) {
    float2 unit_range = float2(distance_range) / texture_extent;
    // This is approximation.
    // float2 screen_tex_size = float2(1.0) / fwidth(uv);
    float2 screen_tex_size = rsqrt(sqr(ddx(uv)) + sqr(ddy(uv)));
    return max(0.5 * dot(unit_range, screen_tex_size), 1.0);
}

[shader("fragment")]
float4 fragment_main(Vertex_Output input, uniform Push_Constant pc) {
    Header header = *(Header*)pc.header;

    float4 msd = font_texture.Sample(input.uv);
    float sd   = median(msd.r, msd.g, msd.b);
    float screen_px_distance = screen_px_range(input.uv, header.distance_range, header.texture_extent) * (sd - 0.5);
    float opacity = clamp(screen_px_distance + 0.5, 0.0, 1.0);

    // lerp() is mix() in glsl
    float4 color = float4(input.fg_color.rgb, opacity);
    return color;
}
