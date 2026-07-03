init_renderer :: () {
    clear_pipeline = create_compute_pipeline_from_file("shaders/clear_texture.slang");
    rect_pipeline = create_compute_pipeline_from_file("shaders/solid_rectangle.slang");
}

deinit_renderer :: () {
    GPU.free_pipeline(clear_pipeline);
    GPU.free_pipeline(solid_rectangle_pipeline);
}

Clear_Data :: struct {
    clear_color: GPU.Color;
    texture: GPU.Texture_Descriptor;
}

#scope_file
clear_pipeline: GPU.Pipeline;
solid_rectangle_pipeline: GPU.Pipeline;

create_compute_pipeline_from_file :: (shader_path: string) -> GPU.Pipeline {
    shader := read_entire_file(shader_path);
    ir := GPU.load_compute_ir(shader);
    defer GPU.destroy_ir(ir);
    return GPU.create_compute_pipeline(ir);
}

GPU :: #import "GPU";
#import "Basic";
#import "File";
