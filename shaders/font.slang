struct Push_Constant {
    uint64_t header;
    uint64_t vertex_data;
};

struct Vertex_Instance {
    float4 bg_color;
    float4 fg_color;
    float4 plane_bounds;
    float4 atlas_bounds;
    float  x_offset;
    float  y_offset;
};

struct Header {
    uint32_t2 screen_extent;
    uint32_t2 texture_extent;
    float screen_px_range;
    float ndc_constant;
};

struct Vertex_Output {
    float4 bg_color : COLOR0;
    float4 fg_color : COLOR1;
    float4 pos : SV_Position;
    float2 uv : UV0;
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
//
// The so-called uv_array is like a boolean multiplier to calculate
// the current corner without much comparison
static const float4 uv_array[4] = {
    {1, 1, 0, 0},
    {1, 0, 0, 1},
    {0, 1, 1, 0},
    {0, 0, 1, 1}
};

[shader("vertex")]
Vertex_Output vertex_main(uint vertex_id : SV_VertexID, uint instance_id : SV_InstanceID, uniform Push_Constant pc) {
    Header header = *(Header*)pc.header;
    Vertex_Output output = {};

    Vertex_Instance *instance = (Vertex_Instance*)(pc.vertex_data + sizeof(Vertex_Instance) * instance_id);

    float4 uv_constant = uv_array[vertex_id];

    float4 temp = instance.plane_bounds * uv_constant;

    float2 pos = float2(temp.x + temp.z, temp.y + temp.w);
    pos = pos * header.ndc_constant;

    output.pos = float4(pos.x + instance.x_offset, pos.y + instance.y_offset, 0, 1);

    float u_min = instance.atlas_bounds.x / (float)header.texture_extent.x;
    float u_max = instance.atlas_bounds.z / (float)header.texture_extent.x;
    float v_min = instance.atlas_bounds.y / (float)header.texture_extent.y;
    float v_max = instance.atlas_bounds.w / (float)header.texture_extent.y;

    float2 uvs[4] = {
        {u_min, v_min},
        {u_min, v_max},
        {u_max, v_min},
        {u_max, v_max}
    };

    output.uv = uvs[vertex_id];

    output.bg_color = instance.bg_color;
    output.fg_color = instance.fg_color;
    return output;
}

float median(float r, float g, float b) {
    return max(min(r, g), min(max(r, g), b));
}

[shader("fragment")]
float4 fragment_main(Vertex_Output input, uniform Push_Constant pc) {
    Header header = *(Header*)pc.header;

    float4 msd = font_texture.Sample(input.uv);
    float sd   = median(msd.r, msd.g, msd.b);
    float screen_px_distance = header.screen_px_range * (sd - 0.5);
    float opacity = clamp(screen_px_distance + 0.5, 0.0, 1.0);
    // lerp is essentially mix
    float4 color = lerp(input.bg_color, input.fg_color, opacity);
    // float4 color = msd;
    return color;
}
