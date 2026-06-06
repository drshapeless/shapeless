// The GPU module is a very minimalistic GPU API targeting very new
// hardware. It uses Metal 4 on macOS, and Vulkan 1.4 on
// Linux. Windows platform is not tested, should works under Vulkan.

// There is no blend state object implementation currently, since both
// Metal and Vulkan do not have such a thing, the way to implement it
// is to create something that store a few options during command
// recording, when set_blend_state is called, it sets what we want in
// the description. One way of implementing it would be create a
// lambda function, or macros, which I don't really want to.

// Here are the functions that declared in different implementations,
// almost a one to one translation from No Graphics API.

//// If an SDL_Window is passed, the gpu would have swapchain support
// init :: (window: *SDL_Window = null)

// deinit :: ()

//// allocation with alignment specified is no use in both API
// alloc :: (bytes: u64) -> Allocation

// free :: (allocation: Allocation)

// texture_size_align :: (desc: Texture_Desc) -> Texture_Size_Align

#module_parameters(VALIDATION := true, DEBUG_ASSERT := true);

Memory_Type :: enum {
    SHARED;
    PRIVATE;

    DEFAULT :: SHARED;
    GPU :: PRIVATE;
}

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

View_Desc :: struct {
    format:      Format = .NONE;
    base_mip:    u8 = 0;
    mip_count:   u8;
    base_layer:  u16;
    layer_count: u16;
}

Texture_Descriptor :: struct {
    data: [4]u64;
}

Topology :: enum {
    TRIANGLE_LIST;
    TRIANGLE_STRIP;
    TRIANGLE_FAN;
}

Cull :: enum {
    NONE;
    CCW;
    CW;
    ALL;
}

Blend :: enum {
    ADD;
    SUBTRACT;
    REV_SUBTRACT;
    MIN;
    MAX;
}

Factor :: enum {
    ZERO;
    ONE;
    SRC_COLOR;
    DST_COLOR;
    SRC_ALPHA;
}

Blend_Desc :: struct {
    color_op:         Blend = .ADD;
    src_color_factor: Factor = .ONE;
    dst_color_factor: Factor = .ZERO;
    alpha_op:         Blend = .ADD;
    src_alpha_factor: Factor = .ONE;
    dst_alpha_factor: Factor = .ZERO;
    color_write_mask: u8 = 0xf;
}

Color_Target :: struct {
    format:     Format = .NONE;
    write_mask: u8 = 0xf;
}

Raster_Desc :: struct {
    // Both topology and cull are dynamically set in command buffer,
    // not in creating pipeline.
    topology:                     Topology = .TRIANGLE_LIST;
    cull:                         Cull = .NONE;

    alpha_to_coverage:            bool = false;
    support_dual_source_blending: bool = false; // This is implicitly set in Metal
    sample_count:                 u8 = 1;
    depth_format:                 Format = .NONE;
    stencil_format:               Format = .NONE;
    color_targets:                []Color_Target;
    blendstate:                   *Blend_Desc;
}

Depth_Flags :: enum_flags {
    READ :: 0x1;
    WRITE :: 0x2;
}

OP :: enum {
    NEVER;
    LESS;
    EQUAL;
    LESS_EQUAL;
    GREATER;
    NOT_EQUAL;
    GREATER_EQUAL;
    ALWAYS;
    KEEP;
    REPLACE;
    INCREMENT_CLAMP;
    DECREMENT_CLAMP;
    INVERT;
    INCREMENT_WRAP;
    DECREMENT_WRAP;
}

Stencil :: struct {
    test: OP = .ALWAYS;
    fail_op: OP = .KEEP;
    pass_op: OP = .KEEP;
    depth_fail_op: OP = .KEEP;
    reference: u8 = 0;
}

Depth_Stencil_Desc :: struct {
    depth_mode: Depth_Flags = 0;
    depth_test: OP = .ALWAYS;
    // The following three members are set dynamically, not part of
    // MTLDepthStencilDescriptor.
    depth_bias: float = 0.0;
    depth_bias_slope_factor: float = 0.0;
    depth_bias_clamp: float = 0.0;
    stencil_read_mask: u8 = 0xff;
    stencil_write_mask: u8 = 0xff;
    stencil_front: Stencil;
    stencil_back: Stencil;
}

Arena :: struct {
    base_allocation: Allocation;
    total: u64;
    current_position: u64;
    bytes_left: u64;
}

init_arena :: (arena: *Arena, size: u64) {
    arena.base_allocation = alloc(size);
    arena.total = size;
    arena.current_position = 0;
    arena.bytes_left = size;
}

deinit_arena :: (arena: *Arena) {
    free(arena.base_allocation);
}

arena_alloc :: (arena: *Arena, size: u64, alignment: u64) -> Allocation {
    padding := get_alignment_padding(arena.current_position, alignment);

    if padding + size > arena.bytes_left {
        return {};
    }

    allocation := arena.base_allocation;
    allocation.cpu += arena.current_position + padding;
    allocation.gpu += arena.current_position + padding;
    allocation.offset = arena.current_position + padding;
    arena.current_position += padding + size;
    arena.bytes_left -= padding + size;

    return allocation;
}

arena_reset :: (arena: *Arena) {
    arena.current_position = 0;
    arena.bytes_left = arena.total;
}

#add_context gpu_context: *GPU_Context;

#if OS == .MACOS {
    #load "metal.jai";
} else {
    #load "vulkan.jai";
}
