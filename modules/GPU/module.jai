// The GPU module is a very minimalistic GPU API targeting very new
// hardware. It uses Metal 4 on macOS, and Vulkan 1.4 on
// Linux. Windows platform is not tested, should works under Vulkan.

// There is no blend state object implementation currently, since both
// Metal and Vulkan do not have such a thing, the way to implement it
// is to create something that store a few options during command
// recording, when set_blend_state is called, it sets what we want in
// the description. One way of implementing it would be create a
// lambda function, or macros, which I don't really want to.

// GPU allocation is identical to Jai built-in Allocator, change
// context.gpu_allocator to do any allocation by GPU.alloc or
// GPU.free, currently, resize is not supported.

// Here are the functions that declared in different implementations,
// almost a one to one translation from No Graphics API.

//// If an SDL_Window is passed, the gpu would have swapchain support
// init :: (window: *SDL_Window = null)

// deinit :: ()

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

Queue_Type :: enum {
    MAIN     :: 0;
    COMPUTE  :: 1;
    TRANSFER :: 2;
}

u32x3 :: struct {
    x: u32;
    y: u32;
    z: u32;
}

Texture_Usage :: enum_flags u32 {
    UNKNOWN                  :: 0x0000;
    TRANSFER_SRC             :: 1 << 0;
    TRANSFER_DST             :: 1 << 1;
    SAMPLED                  :: 1 << 2;
    STORAGE                  :: 1 << 3;
    COLOR_ATTACHMENT         :: 1 << 4;
    DEPTH_STENCIL_ATTACHMENT :: 1 << 5;
}

Texture_Desc :: struct {
    type:         Texture_Type = .e2D;
    dimensions:   u32x3;
    mip_count:    u32 = 1;
    layer_count:  u32 = 1;
    sample_count: u32 = 1;
    format:       Format;
    usage:        Texture_Usage = 0;
}

Texture_Size_Align :: struct {
    size: u64;
    align: u64;
}

View_Desc :: struct {
    format:      Format;
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
    format:     Format;
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
    depth_format:                 Format;
    stencil_format:               Format;
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

Semaphore_Pair :: struct {
    semaphore: Semaphore;
    value: u64;
}

Stage :: enum {
    TOP;
    TRANSFER;
    COMPUTE;
    VERTEX;
    FRAGMENT;
    BOTTOM;
    ALL_GRAPHICS;
    ALL_COMMANDS;
}

Hazard :: enum_flags {
    DRAW_ARGUMENTS :: 0x1;
    DESCRIPTORS :: 0x2;
    DEPTH_STENCIL :: 0x4;
}

Color :: struct {
    r: float;
    g: float;
    b: float;
    a: float;
}

Load_OP :: enum {
    DONT_CARE;
    LOAD;
    CLEAR;
}

Store_OP :: enum {
    DONT_CARE;
    STORE;
}

Render_Pass_Attachment_Desc :: struct {
    texture: Texture;
    load_op: Load_OP;
    store_op: Store_OP;
    union {
        clear_color: Color;
        clear_value: struct {
            depth: float;
            stencil: u32;
        };
    };
}

Render_Pass_Desc :: struct {
    depth_target: Render_Pass_Attachment_Desc;
    stencil_target: Render_Pass_Attachment_Desc;
    color_targets: [] Render_Pass_Attachment_Desc;
}

// Allocator
// A GPU allocator has the same interface as a Jai allocator
alloc :: (size: s64) -> *void {
    a := context.gpu_allocator;

    result := a.proc(.ALLOCATE, size, 0, null, a.data);

    return result;
}

free :: (memory: *void) {
    a := context.gpu_allocator;

    a.proc(.FREE, 0, 0, memory, a.data);
}

array_free :: inline (array: [] $T) {
    free(array.data);
}

New :: ($T: Type, $initialized := true) -> *T {
    memory := alloc(size_of(T));

    // Since New gets called a lot, we just roll Initialize() into here, so that
    // we don't kick off so many extra polymorphs.
    #if initialized {
        ini :: initializer_of(T);

        #if ini  inline ini(memory);
        else     memset(memory, 0, size_of(T));
    }

    return cast(*T) memory;
}

// This is a direct copy of the Basic.NewArray, only modifying the allocator
NewArray :: (count: s64, $T: Type, $initialized := true, alignment: s32 = -1) -> (result: [] T, unaligned_base: *void) {
    if !count return .[], null;

    a := context.gpu_allocator;

    extra: s32 = 0;
    if alignment > 0 {
        extra = alignment;
    }

    original_memory := cast(*void) alloc(size_of(T) * count + extra);

    memory: *void;
    if alignment > 0 {
        memory = cast(*void) Basic.align_forward(cast(s64)original_memory, alignment);
    } else {
        memory = original_memory;
    }

    result: [] T = ---;
    result.count = count;
    result.data  = memory;

    #if initialized {
        ini :: initializer_of(T);

        #if ini {
            for 0..count-1 {
                inline ini(memory);
                memory += size_of(T);
            }
        } else {
            memset(memory, 0, count * size_of(T));
        }
    }

    return result, original_memory;
}

push_allocator :: (allocator: Allocator) #expand #no_debug {
    old_allocator := context.gpu_allocator;
    context.gpu_allocator = allocator;

    `defer context.gpu_allocator = old_allocator;
}

push_allocator :: (proc: Allocator_Proc, data: *void) #expand #no_debug {
    old_allocator     := context.gpu_allocator;

    context.gpu_allocator.proc = proc;
    context.gpu_allocator.data = data;

    `defer context.gpu_allocator = old_allocator;
}

host_to_device_pointer :: (ptr: *void) -> u64 {
    using context.gpu_context;

    allocation: Allocation;
    found := false;
    for cpu_pointer_table {
        if ptr >= it.cpu && ptr < (it.cpu + it.size) {
            found = true;
            allocation = it;
        }
    }
    Basic.assert(found, "Invalid cpu host pointer");

    offset := ptr - allocation.cpu;

    return allocation.gpu + xx offset;
}

cpu_pointer_to_allocation :: (ptr: *void) -> Allocation {
    using context.gpu_context;

    allocation: Allocation;
    found := false;
    for cpu_pointer_table {
        if ptr >= it.cpu && ptr < (it.cpu + it.size) {
            found = true;
            allocation = it;
        }
    }
    Basic.assert(found, "Invalid cpu host pointer");

    return allocation;
}

gpu_pointer_to_allocation :: (ptr: u64) -> Allocation {
    using context.gpu_context;

    allocation: Allocation;
    found := false;
    for gpu_pointer_table {
        if ptr >= it.gpu && ptr < (it.gpu + it.size) {
            found = true;
            allocation = it;
        }
    }
    Basic.assert(found, "Invalid gpu device pointer");

    return allocation;
}

#if OS == .MACOS {
    #load "metal.jai";
} else {
    #load "vulkan.jai";
}
#load "arena.jai";

#scope_file
Basic :: #import "Basic";
get_alignment_padding :: (current_position: u64, alignment: u64) -> u64 {
    return (alignment - (current_position % alignment)) % alignment;
}
