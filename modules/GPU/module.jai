// The GPU module is a very minimalistic GPU API targeting very new
// hardware. It uses Metal 4 on macOS, and Vulkan 1.4 on Linux. Windows platform is not tested, should works under Vulkan.

Texture_Type :: enum {
    e1D;
    e2D;
    e3D;
    CUBE;
    e2D_ARRAY;
    CUBE_ARRAY;
}

u32x3 :: struct {
    x: u32;
    y: u32;
    z: u32;
}

Format :: enum u32 {
    NONE :: 0;
    RGBA8_UNORM;
    D32_FLOAT;
    D24_UNORM_S8;
}

Texture_Usage :: enum_flags u32 {
    UNKNOWN       :: 0x0000;
    SHADER_READ   :: 0x0001;
    SHADER_WRITE  :: 0x0002;
    RENDER_TARGET :: 0x0004;
}

Texture_Desc :: struct {
    type:         Texture_Type = .e2D;
    dimensions:   u32x3;
    mip_count:    u32;
    layer_count:  u32;
    sample_count: u32;
    format:       Format = .NONE;
    usage:        Texture_Usage = 0;
}

Texture_Size_Align :: struct {
    size: u64;
    align: u64;
}

#if OS == .MACOS {
    #load "metal.jai";
} else {
    #load "vulkan.jai";
}
