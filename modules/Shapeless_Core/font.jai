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
    unicode: u64;
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

load_msdf :: (file_path: string) -> MSDF {
    result, json := parse_json_from_file(file_path);
    assert(result == .OK, "Cannot parse json");

    msdf: MSDF;
    result = from_json(json, *msdf);
    assert(result == .OK, "Cannot from json");

    return msdf;
}
