struct Push_Constant {
    uint64_t input_memory;
    uint64_t output_memory;
    int64_t  size_sdf;
    int64_t  size_bitmap;
};

[vk::push_constant]
uniform Push_Constant pc;

[[numthreads(8, 8, 1)]]
[shader("compute")]
void main(uint3 dtid: SV_DispatchThreadID) {
    uint2 pixel = dtid.xy;

    if (pixel.x >= pc.size_bitmap || pixel.y >= pc.size_bitmap) {
        return;
    }

    generate_image(pixel);
}

func generate_image(pixel: uint2) {
    float scale_bitmap = 0.75 * (float)pc.size_bitmap / (float)pc.size_sdf;

    int index = calc_index(pixel.x, pixel.y, pc.size_bitmap, 3);
    float gx = (float)pixel.x / (float)pc.size_bitmap * (float)pc.size_sdf;
    float gy = (float)pixel.y / (float)pc.size_bitmap * (float)pc.size_sdf;
    int gxi = (int)gx;
    int gyi = (int)gy;

    float *msdf = (float*)(pc.input_memory);
    float *c00 = msdf + calc_index(gxi,   gyi,   pc.size_sdf, 3);
    float *c10 = msdf + calc_index(gxi+1, gyi,   pc.size_sdf, 3);
    float *c01 = msdf + calc_index(gxi,   gyi+1, pc.size_sdf, 3);
    float *c11 = msdf + calc_index(gxi+1, gyi+1, pc.size_sdf, 3);

    float r = blerp(c00[0], c10[0], c01[0], c11[0], gx-(float)gxi, gy-(float)gyi);
    float g = blerp(c00[1], c10[1], c01[1], c11[1], gx-(float)gxi, gy-(float)gyi);
    float b = blerp(c00[2], c10[2], c01[2], c11[2], gx-(float)gxi, gy-(float)gyi);

    float signed_distance = scale_bitmap * (median3(r, g, b)-0.5);
    var a = clamp(signed_distance+0.5, 0.0, 1.0);

    uint8_t *bitmap = (uint8_t*)pc.output_memory;
    bitmap[index+0] = (uint8_t)(255*a);
    bitmap[index+1] = (uint8_t)(255*a);
    bitmap[index+2] = (uint8_t)(255*a);
}

func calc_index(x: int, y: int, size: int64_t, num_channels: int) -> int {
    var x0 = clamp(x, 0, size-1);
    var y0 = clamp(y, 0, size-1);

    return (int)(y0*size + x0) * num_channels;
}

func blerp(c00: float, c10: float, c01: float, c11: float, tx: float, ty: float) -> float {
    return lerp(lerp(c00, c10, tx), lerp(c01, c11, tx), ty);
}
