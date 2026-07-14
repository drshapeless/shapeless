#module_parameters(VALIDATION := true, DEBUG_ASSERT := true, SHADER_BASE_DIRECTORY := "shaders/");

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

// One major thing in this implementation is the abstraction of IR,
// works well in Metal, but somewhat stupid in Vulkan

// Here are the functions that declared in different implementations,
// almost a one to one translation from No Graphics API.

//// If an SDL_Window is passed, the gpu would have swapchain support
// init :: (window: *SDL_Window = null)

// deinit :: ()

// texture_size_align :: (desc: Texture_Desc) -> Texture_Size_Align

// create_texture :: (desc: Texture_Desc, ptr_gpu: u64) -> Texture

// load_spirv :: (spirv: string, entry_points: []string) -> []IR
// create_compute_pipeline :: (compute_ir: IR) -> Pipeline
// create_graphics_pipeline :: (vertex_ir: IR, fragment_ir: IR, desc: Raster_Desc) -> Pipeline
// destroy_pipeline :: (pipeline: Pipeline)

// create_queue :: () -> Queue
// start_command_recording :: () -> *Command_Buffer
// submit :: (queue: Queue, command_buffers: ..*Command_Buffer, wait: []Semaphore_Pair = .[], signal: []Semaphore_Pair = .[])

// create_semaphore :: (init_value: u64) -> Semaphore
// wait_semaphore :: (sema: Semaphore, value: u64, timeout: u64 = 0)
// destroy_semaphore :: (sema: Semaphore)

// memcpy :: (cb: *Command_Buffer, dest: u64, src: u64, size: s64)
// copy_to_texture :: (cb: *Command_Buffer, dest: Texture, src: u64)
// copy_from_texture :: (cb: *Command_Buffer, dest: u64, src: Texture)
// copy_texture :: (cb: *Command_Buffer, dest: Texture, src: Texture)

// set_pipeline :: (cb: *Command_Buffer, pipeline: Pipeline)
// dispatch :: (cb: *Command_Buffer, data_gpu: u64, groups: u32x3, threads: u32x3)
// dispatch :: (cb: *Command_Buffer, data_gpu: u64, count: u32)

// begin_render_pass :: (cb: *Command_Buffer, desc: Render_Pass_Desc)
// end_render_pass :: (cb: *Command_Buffer)

// barrier :: (cb: *Command_Buffer, before: Stage, after: Stage, hazards: Hazard = 0)


//// Functions that are necessary for a GPU api but not in No Graphics API
// acquire_swapchain_texture :: () -> bool, Texture
// submit_and_present :: (queue: Queue, swapchain_texture: Texture, command_buffers: ..*Command_Buffer, wait: []Semaphore_Pair = .[], signal: []Semaphore_Pair = .[])

//// Metal specific function
// load_msl :: (msl: string, entry_points: []string) -> []IR

//// Limitation
// Metal manages the descriptor heap internally, we have no way to
// access the raw descriptor blob. We can only rely on
// gpuResourceID. But it makes the public interface of this module not
// universal.

//// Thus I make this dummy function, for Metal, it returns the
//// resourceID, for Vulkan, it returns the inputed index.
// texture_handle :: (texture: Texture, index: u64) -> u64

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
    e1D_ARRAY;
    e2D_ARRAY;
    CUBE_ARRAY;
}

Queue_Type :: enum {
    MAIN     :: 0;
    COMPUTE  :: 1;
    TRANSFER :: 2;
}

u32x2 :: struct {
    x: u32;
    y: u32;
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

ALL_MIPS: u32 : ~cast(u32)0;
ALL_LAYERS : u32 : ~cast(u32)0;

// Originally the mips and layers are packed in u8 and u16, but it
// because a pain to specify ALL_MIPS and ALL_LAYERS in different API
View_Desc :: struct {
    format:      Format;
    type:        Texture_Type = .e2D;
    base_mip:    u32 = 0;
    mip_count:   u32 = ALL_MIPS;
    base_layer:  u32 = 0;
    layer_count: u32 = ALL_LAYERS;
}

// This is the raw blob of descriptor data, in my AMD gpu, this is 32
// bytes for a texture descriptor. This is completely useless in
// Metal.
Texture_Descriptor :: [4]u64;

// Topology is copied from VkPrimitiveTopology.
Topology :: enum {
    POINT_LIST     :: 0;
    LINE_LIST      :: 1;
    LINE_STRIP     :: 2;
    TRIANGLE_LIST  :: 3;
    TRIANGLE_STRIP :: 4;
    TRIANGLE_FAN   :: 5;
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
    NONE     :: 0;
    VERTEX   :: 1 << 0;
    FRAGMENT :: 1 << 1;
    COMPUTE  :: 1 << 2;
    BLIT     :: 1 << 3;
    COPY     :: 1 << 4;
    TRANSFER :: 1 << 5;
    ALL      :: 1 << 15;
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
    load_op: Load_OP = .CLEAR;
    store_op: Store_OP = .STORE;
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

Viewport :: struct {
    x:         float = 0;
    y:         float = 0;
    width:     float;
    height:    float;
    min_depth: float = 0;
    max_depth: float = 1;
}

Rect :: struct {
    origin: u32x2 = .{0, 0};
    size:   u32x2;
}

// load_compute_ir :: inline (shader: string, entry_point: string = "compute_main") -> IR {
//     Basic.auto_release_temp();
//     Basic.push_allocator(Basic.temp);
//     irs := load_slang(shader, .[entry_point]);
//     return irs[0];
// }

// load_graphics_ir :: #bake_arguments load_slang(entry_points = .["vertex_main", "fragment_main"]);

//// Allocator
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

array_copy :: (array: [] $T) -> [] T {
    dest := NewArray(array.count, T, initialized=false);
    memcpy(dest.data, array.data, array.count * size_of(T));
    return dest;
}

Ptr :: u64;

host_to_device_pointer :: (ptr: *void) -> Ptr {
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

gpu_pointer_to_allocation :: (ptr: Ptr) -> Allocation {
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

// TODO: This name is confusing.
Array :: struct {
    gpu_ptr: Ptr;
    count:   s64;
}

to_device_array :: (arr: []$T) -> Array {
    gpu_array: Array;
    gpu_array.gpu_ptr = host_to_device_pointer(arr.data);
    gpu_array.count = arr.count;

    return gpu_array;
}

// Pass the name without extension, e.g. "simple.slang" should be
// "simple". If there is a metal alternative, the metal one would be
// used. "simple.metal" would be loaded if it exists.
load_compute_ir :: (shader_name: string, entry_point: string = "compute_main") -> IR {
    Basic.push_allocator(Basic.temp);
    Basic.auto_release_temp();

    irs := load_ir(shader_name, .[entry_point]);

    return irs[0];
}

// See load_compute_ir
load_graphics_ir :: (shader_name: string, vertex_entry_point: string = "vertex_main", fragment_entry_point: string = "fragment_main") -> IR, IR {
    Basic.push_allocator(Basic.temp);
    Basic.auto_release_temp();

    irs := load_ir(shader_name, .[vertex_entry_point, fragment_entry_point]);

    return irs[0], irs[1];
}

#if OS == .MACOS {
    #load "metal.jai";
} else {
    #load "vulkan.jai";
}
#load "arena.jai";
#load "shader_conversion.jai";

#scope_file
Basic :: #import "Basic";
get_alignment_padding :: (current_position: u64, alignment: u64) -> u64 {
    return (alignment - (current_position % alignment)) % alignment;
}
