init_renderer :: (sdl_window: *SDL_Window) {
    window = sdl_window;

    GPU.init(*draw_arena, 32 * 1024 * 1024); // 32MB should be enough for draw texture
    ok, window_width, window_height := SDL_GetWindowSizeInPixels(window);
    assert(ok, "failed to get sdl window size");
    draw_texture_desc: GPU.Texture_Desc = .{
        dimensions = .{xx window_width, xx window_height, 1},
        format = .B8G8R8A8_UNORM,
        usage = .STORAGE | .COLOR_ATTACHMENT | .TRANSFER_SRC,
    };

    draw_size_align := GPU.texture_size_align(draw_texture_desc);

    draw_ptr := GPU.get(*draw_arena, xx draw_size_align.size, xx draw_size_align.align);
    draw_ptr_gpu := GPU.host_to_device_pointer(draw_ptr);
    draw_texture = GPU.create_texture(draw_texture_desc, draw_ptr_gpu);
    draw_texture_view_desc: GPU.View_Desc = .{
        format = .B8G8R8A8_UNORM,
    };
    draw_texture_descriptor = GPU.texture_view_descriptor(draw_texture, draw_texture_view_desc);

    window_dimensions = .{
        x = xx window_width,
        y = xx window_height,
        z = 1
    };

    GPU.init(*all_params_arena);
    frame_count := GPU.frame_count();

    {
        ir := GPU.load_compute_ir("clear_texture");
        defer GPU.destroy_ir(ir);
        clear_pipeline = GPU.create_compute_pipeline(ir);
    }
    {
        ir := GPU.load_compute_ir("solid_rectangle");
        defer GPU.destroy_ir(ir);
        solid_rectangle_pipeline = GPU.create_compute_pipeline(ir);
    }

    color_targets: [1]GPU.Color_Target;
    color_targets[0].format = .B8G8R8A8_UNORM;

    desc: GPU.Raster_Desc = .{
        color_targets = color_targets,
    };
    {
        vir, fir := GPU.load_graphics_ir("simple");
        defer GPU.destroy_ir(vir);
        defer GPU.destroy_ir(fir);
        simple_pipeline = GPU.create_graphics_pipeline(vir, fir, desc);
    }
    {
        vir, fir := GPU.load_graphics_ir("rectangle");
        defer GPU.destroy_ir(vir);
        defer GPU.destroy_ir(fir);
        rectangle_pipeline = GPU.create_graphics_pipeline(vir, fir, desc);
    }

    {
        GPU.push_allocator(GPU.arena_allocator_proc, *all_params_arena);

        clear_params = GPU.NewArray(frame_count, Clear_Data);
        clear_params_base_gpu = GPU.host_to_device_pointer(clear_params.data);

        solid_rectangle_params = GPU.NewArray(frame_count, Solid_Rectangle_Data);
        solid_rectangle_params_base_gpu = GPU.host_to_device_pointer(solid_rectangle_params.data);
    }

    frame_arenas = NewArray(frame_count, GPU.Arena);

    for * frame_arenas {
        GPU.init(it, 32 * 1024 * 1024); // 32 MB per frames
    }

    draw_heap = GPU.create_texture_heap(1);
    if draw_heap.count > 0 {
        draw_heap[0] = draw_texture_descriptor;
    }
}

deinit_renderer :: () {
    GPU.destroy_pipeline(rectangle_pipeline);
    GPU.destroy_pipeline(simple_pipeline);
    GPU.destroy_pipeline(clear_pipeline);
    GPU.destroy_pipeline(solid_rectangle_pipeline);
    for * frame_arenas {
        GPU.fini(it);
    }
    array_free(frame_arenas);
    GPU.fini(*all_params_arena);
    GPU.destroy_texture(draw_texture);
    GPU.free(draw_heap.data);
    GPU.fini(*draw_arena);
}

// Note: I used to signal and wait for a semaphore when resizing, but
// it does not matter at all.
resize_callback :: () {
    ok, window_width, window_height := SDL_GetWindowSizeInPixels(window);
    assert(ok, "failed to get sdl window size");
    GPU.resize_callback(xx window_width, xx window_height);
    GPU.destroy_texture(draw_texture);
    GPU.reset(*draw_arena);

    window_dimensions = .{
        x = xx window_width,
        y = xx window_height,
        z = 1
    };

    draw_texture_desc := GPU.Texture_Desc.{
        dimensions = .{xx window_width, xx window_height, 1},
        format = .B8G8R8A8_UNORM,
        usage = .STORAGE | .COLOR_ATTACHMENT | .TRANSFER_SRC,
    };
    draw_size_align := GPU.texture_size_align(draw_texture_desc);
    draw_ptr := GPU.get(*draw_arena, xx draw_size_align.size, xx draw_size_align.align);
    draw_ptr_gpu := GPU.host_to_device_pointer(draw_ptr);
    draw_texture = GPU.create_texture(draw_texture_desc, draw_ptr_gpu);
    draw_texture_view_desc: GPU.View_Desc = .{
        format = .B8G8R8A8_UNORM,
    };

    if draw_heap.count {
        draw_texture_descriptor = GPU.texture_view_descriptor(draw_texture, draw_texture_view_desc);
        draw_heap[0] = draw_texture_descriptor;
    }
}

window_dimensions: GPU.u32x3;

draw_heap: [] GPU.Texture_Descriptor;

draw_texture:             GPU.Texture;
frame_arenas: [] GPU.Arena;

clear_pipeline:           GPU.Pipeline;
solid_rectangle_pipeline: GPU.Pipeline;
simple_pipeline:          GPU.Pipeline;
rectangle_pipeline:       GPU.Pipeline;

Clear_Data :: struct {
    clear_color: Color;
    texture_index: u64;
}

Solid_Rectangle_Data :: struct {
    rects: GPU.Array;
    texture_index: u64;
}

Simple_Data :: struct {
    position:  Vector4;
    color:     Color;
}

s32x2 :: struct {
    x: s32;
    y: s32;

    #overlay (x) w: s32;
    #overlay (y) h: s32;
}

Rectangle :: struct {
    origin: s32x2;
    size:   s32x2;
}

Color_Rectangle :: struct {
    using rect: Rectangle;
    color: Color;
}

clear_screen :: (cb: *GPU.Command_Buffer, clear_color: Color) {
    i := GPU.frame_index();

    clear_params[i].texture_index = GPU.texture_handle(draw_texture, 0);
    clear_params[i].clear_color = clear_color;

    threads_size: GPU.u32x3 = .{8, 8, 1};
    group_size := calculate_group_size(window_dimensions, threads_size);

    GPU.dispatch(cb, clear_params_base_gpu + cast(u64) (size_of(Clear_Data) * i), group_size, threads_size);
}

// This way of drawing is very much like ray tracing
// draw_rectangles :: (cb: *GPU.Command_Buffer, rects: .. Color_Rectangle) {
//     i := GPU.frame_index();

//     GPU.push_allocator(GPU.arena_allocator_proc, *frame_arenas[i]);

//     gpu_rects := GPU.array_copy(rects);

//     solid_rectangle_params[i].texture_index = GPU.texture_handle(draw_texture, 0);
//     solid_rectangle_params[i].rects = GPU.to_device_array(gpu_rects);

//     threads_size: GPU.u32x3 = .{8, 8, 1};
//     group_size := calculate_group_size(window_dimensions, threads_size);

//     GPU.dispatch(cb, solid_rectangle_params_base_gpu + cast(u64) (size_of(Solid_Rectangle_Data) * i), group_size, threads_size);
// }

draw_simple :: (cb: *GPU.Command_Buffer, vertices: [] Simple_Data, indices: [] u32) {
    i := GPU.frame_index();
    GPU.push_allocator(GPU.arena_allocator_proc, *frame_arenas[i]);

    gpu_vertices := GPU.array_copy(vertices);
    v_ptr := GPU.host_to_device_pointer(gpu_vertices.data);

    gpu_indices := GPU.array_copy(indices);
    indices_array := GPU.to_device_array(gpu_indices);

    GPU.draw_indexed_instanced(cb, v_ptr, 0, indices_array, 1);
}

draw_rectangles :: (cb: *GPU.Command_Buffer, rects: .. Color_Rectangle) {
    i := GPU.frame_index();
    GPU.push_allocator(GPU.arena_allocator_proc, *frame_arenas[i]);

    gpu_rects := GPU.array_copy(rects);

    Vertex_Input :: struct {
        projection: Matrix4;
        rectangles: GPU.Ptr;
    }

    input := GPU.New(Vertex_Input);
    input.rectangles = GPU.host_to_device_pointer(gpu_rects.data);

    input.projection._11 = 2.0 / cast(float) window_dimensions.x;
    input.projection._22 = 2.0 / cast(float) window_dimensions.y;
    input.projection._33 = 1.0;
    input.projection._44 = 1.0;
    input.projection._41 = -1.0;
    input.projection._42 = -1.0;

    GPU.draw(cb, GPU.host_to_device_pointer(input), 0, 4, xx rects.count);
}

#load "font.jai";

#scope_file
GPU :: #import "GPU";
#import "Basic";
#import "File";
#import "SDL3";
#import "Math";

window: *SDL_Window;

draw_arena:   GPU.Arena;
draw_texture_descriptor: GPU.Texture_Descriptor;

clear_params: [] Clear_Data;
clear_params_base_gpu: u64;

solid_rectangle_params: [] Solid_Rectangle_Data;
solid_rectangle_params_base_gpu: u64;

simple_params: [] Simple_Data;
simple_params_base_gpu: u64;

all_params_arena: GPU.Arena;

create_graphics_pipeline_from_file :: (shader_path: string, desc: GPU.Raster_Desc) -> GPU.Pipeline {
    shader := read_entire_file(shader_path);
    irs := GPU.load_graphics_ir(shader);
    for irs {
        GPU.destroy_ir(it);
    }
    log("Successfully compile %", shader_path);
    return GPU.create_graphics_pipeline(irs[0], irs[1], desc);
}

Color :: GPU.Color;

calculate_group_size :: (dimensions: GPU.u32x3, threads_per_group: GPU.u32x3) -> GPU.u32x3 {
    group_size: GPU.u32x3 = .{
        x = ((dimensions.x + threads_per_group.x - 1) / threads_per_group.x),
        y = ((dimensions.y + threads_per_group.y - 1) / threads_per_group.y),
        z = ((dimensions.z + threads_per_group.z - 1) / threads_per_group.z),
    };

    return group_size;
}

to_ndc :: (dimensions: s32x2) -> Vector2 {
    return .{
        x = cast(float)(2 * dimensions.x) / cast(float) window_dimensions.x - 1.0,
        y = cast(float)(2 * dimensions.y) / cast(float) window_dimensions.y - 1.0,
    };
}
