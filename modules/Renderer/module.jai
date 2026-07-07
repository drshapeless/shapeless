init_renderer :: (sdl_window: *SDL_Window) {
    window = sdl_window;

    GPU.init(*draw_arena, 32 * 1024 * 1024); // 32MB should be enough for draw texture
    ok, window_width, window_height := SDL_GetWindowSizeInPixels(window);
    assert(ok, "failed to get sdl window size");
    draw_texture_desc := GPU.Texture_Desc.{
        dimensions = .{xx window_width, xx window_height, 1},
        format = .B8G8R8A8_UNORM,
        usage = .STORAGE | .COLOR_ATTACHMENT,
    };
    draw_size_align := GPU.texture_size_align(draw_texture_desc);

    draw_ptr := GPU.get(*draw_arena, xx draw_size_align.size, xx draw_size_align.align);
    draw_ptr_gpu := GPU.host_to_device_pointer(draw_ptr);
    draw_texture = GPU.create_texture(draw_texture_desc, draw_ptr_gpu);
    draw_texture_descriptor_handle = GPU.texture_view_descriptor(draw_texture);

    window_dimensions = .{
        x = xx window_width,
        y = xx window_height,
        z = 1
    };

    GPU.init(*all_params_arena);
    params_count := GPU.command_buffer_count();

    clear_pipeline = create_compute_pipeline_from_file("shaders/clear_texture.slang");
    solid_rectangle_pipeline = create_compute_pipeline_from_file("shaders/solid_rectangle.slang");

    {
        GPU.push_allocator(GPU.arena_allocator_proc, *all_params_arena);

        clear_params = GPU.NewArray(params_count, Clear_Data);
        clear_params_base_gpu = GPU.host_to_device_pointer(clear_params.data);

        solid_rectangle_params = GPU.NewArray(params_count, Solid_Rectangle_Data);
        solid_rectangle_params_base_gpu = GPU.host_to_device_pointer(solid_rectangle_params.data);
    }

}

deinit_renderer :: () {
    GPU.destroy_pipeline(clear_pipeline);
    GPU.destroy_pipeline(solid_rectangle_pipeline);
    GPU.fini(*all_params_arena);
    GPU.destroy_texture(draw_texture);
    GPU.fini(*draw_arena);
}

// Note: I used to signal and wait for a semaphore when resizing, but
// it does not matter at all.
resize_callback :: () {
    GPU.destroy_texture(draw_texture);
    GPU.reset(*draw_arena);
    ok, window_width, window_height := SDL_GetWindowSizeInPixels(window);
    assert(ok, "failed to get sdl window size");
    GPU.resize_callback(xx window_width, xx window_height);

    window_dimensions = .{
        x = xx window_width,
        y = xx window_height,
        z = 1
    };

    draw_texture_desc := GPU.Texture_Desc.{
        dimensions = .{xx window_width, xx window_height, 1},
        format = .B8G8R8A8_UNORM,
        usage = .STORAGE | .COLOR_ATTACHMENT,
    };
    draw_size_align := GPU.texture_size_align(draw_texture_desc);
    draw_ptr := GPU.get(*draw_arena, xx draw_size_align.size, xx draw_size_align.align);
    draw_ptr_gpu := GPU.host_to_device_pointer(draw_ptr);
    draw_texture = GPU.create_texture(draw_texture_desc, draw_ptr_gpu);
    draw_texture_descriptor_handle = GPU.texture_view_descriptor(draw_texture);
}

draw_texture: GPU.Texture;

Clear_Data :: struct {
    clear_color: Color;
    texture:     GPU.Texture_Descriptor;
}

Solid_Rectangle_Data :: struct {
    color: Color;
    rect:  Rectangle;
    texture_handle: GPU.Texture_Descriptor;
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

clear_screen :: (cb: *GPU.Command_Buffer, clear_color: Color) {
    GPU.set_pipeline(cb, clear_pipeline);
    i := GPU.current_command_buffer_index();

    clear_params[i].texture = draw_texture_descriptor_handle;
    clear_params[i].clear_color = clear_color;

    threads_size: GPU.u32x3 = .{8, 8, 1};
    group_size := calculate_group_size(window_dimensions, threads_size);

    GPU.dispatch(cb, clear_params_base_gpu + cast(u64) (size_of(Clear_Data) * i), group_size, threads_size);
}

draw_rectangle :: (cb: *GPU.Command_Buffer, color: Color, rect: Rectangle) {
    i := GPU.current_command_buffer_index();
    GPU.set_pipeline(cb, solid_rectangle_pipeline);

    solid_rectangle_params[i].texture_handle = draw_texture_descriptor_handle;
    solid_rectangle_params[i].color = color;
    solid_rectangle_params[i].rect = rect;

    dimensions: GPU.u32x3 = .{
        x = cast(u32) rect.size.x,
        y = cast(u32) rect.size.y,
        z = 1,
    };
    threads_size: GPU.u32x3 = .{8, 8, 1};
    group_size := calculate_group_size(dimensions, threads_size);

    GPU.dispatch(cb, solid_rectangle_params_base_gpu + cast(u64) (size_of(Solid_Rectangle_Data) * i), group_size, threads_size);
}

#scope_file
GPU :: #import "GPU";
#import "Basic";
#import "File";
#import "SDL3";

window: *SDL_Window;

draw_arena:   GPU.Arena;
draw_texture_descriptor_handle: GPU.Texture_Descriptor;

window_dimensions: GPU.u32x3;

clear_pipeline: GPU.Pipeline;
clear_params: [] Clear_Data;
clear_params_base_gpu: u64;

solid_rectangle_pipeline: GPU.Pipeline;
solid_rectangle_params: [] Solid_Rectangle_Data;
solid_rectangle_params_base_gpu: u64;

all_params_arena: GPU.Arena;

create_compute_pipeline_from_file :: (shader_path: string) -> GPU.Pipeline {
    shader := read_entire_file(shader_path);
    ir := GPU.load_compute_ir(shader);
    defer GPU.destroy_ir(ir);
    return GPU.create_compute_pipeline(ir);
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
