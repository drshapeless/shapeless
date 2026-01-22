Glyph :: struct {
    advance: float32;
    plane_bounds: Vector4;
    atlas_bounds: Vector4;
}

Font_Atlas :: struct {
    distance_range: float32;
    em_size: float32;
    line_height: float32;
    width: s32;
    height: s32;
    glyphs: Table(u32, Glyph); // key is unicode in u64
}

MSDF :: struct {
    atlas: MSDF_Atlas;
    metrics: MSDF_Metrics;
    glyphs: []MSDF_Glyph;
    kerning: []MSDF_Kerning;
}

MSDF_Atlas :: struct {
    type: string;
    distanceRange: float;
    size: float32;
    width: s32;
    height: s32;
    yOrigin: string;
}

MSDF_Metrics :: struct {
    emSize: float32;
    lineHeight: float32;
    ascender: float32;
    descender: float32;
    underlineY: float32;
    underlineThickness: float32;
}

MSDF_Glyph :: struct {
    unicode: u32;
    advance: float32;
    planeBounds: Bound;
    atlasBounds: Bound;
}

Bound :: struct {
    left:   float32;
    bottom: float32;
    right:  float32;
    top:    float32;
}

MSDF_Kerning :: struct {
    unicode1: u64;
    unicode2: u64;
    advance:  float32;
}

bound_to_vector4 :: (using bound: Bound) -> Vector4 {
    // In theory, a memcpy is enough.
    return .{left, bottom, right, top};
}

load_msdf :: (file_path: string) -> MSDF {
    result, json := parse_json_from_file(file_path);
    assert(result == .OK, "Cannot parse json");
    defer json_free(json);

    msdf: MSDF;
    result = from_json(json, *msdf);
    assert(result == .OK, "Cannot from json");

    return msdf;
}

msdf_to_font_atlas :: (msdf: MSDF) -> Font_Atlas {
    fa: Font_Atlas;

    fa.distance_range = msdf.atlas.distanceRange;
    fa.em_size = msdf.metrics.emSize;
    fa.line_height = msdf.metrics.lineHeight;
    fa.width = msdf.atlas.width;
    fa.height = msdf.atlas.height;

    for msdf.glyphs {
        glyph: Glyph;
        glyph.advance = it.advance;
        glyph.plane_bounds = bound_to_vector4(it.planeBounds);
        glyph.atlas_bounds = bound_to_vector4(it.atlasBounds);

        // I am not usin table_add because it would add multiple value
        // of the same key into the table
        table_set(*fa.glyphs, it.unicode, glyph);
    }

    return fa;
}
