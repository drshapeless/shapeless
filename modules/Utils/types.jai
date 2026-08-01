u32x2 :: struct {
    x, y: u32;
}

u32x3 :: struct {
    x, y, z: u32;

    #overlay (x) xy: u32x2;
    #overlay (y) yz: u32x2;
}

s32x2 :: struct {
    x, y: s32;
}

s32x3 :: struct {
    x, y, z: s32;

    #overlay (x) xy: s32x2;
    #overlay (y) yz: s32x2;
}

// This is the same as Rect in GetRect
Rect :: struct {
    x, y: float;
    w, h: float;
}
