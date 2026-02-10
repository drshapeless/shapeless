MSDF :: struct {
    atlas:   Atlas;
    metrics: Metrics;
    glyphs:  [] Glyph;
    kerning: [] Kerning;

    Atlas :: struct {
        type:          string;
        distanceRange: float;
        size:          float32;
        width:         u32;
        height:        u32;
        yOrigin:       string;
    }

    Metrics :: struct {
        emSize:             float32;
        lineHeight:         float32;
        ascender:           float32;
        descender:          float32;
        underlineY:         float32;
        underlineThickness: float32;
    }

    Glyph :: struct {
        // Either unicode or index is present, depends on how you
        // generate the atlas, by glyphs or by charset
        unicode:     u32;
        index:       u32;
        advance:     float32;
        planeBounds: Bound;
        atlasBounds: Bound;
    }

    Bound :: struct {
        left:   float32;
        bottom: float32;
        right:  float32;
        top:    float32;
    }

    Kerning :: struct {
        unicode1: u64;
        unicode2: u64;
        advance:  float32;
    }
}

bound_to_vector4 :: (bound: MSDF.Bound) -> Vector4 {
    // In theory, a memcpy is enough, but it creates a variable.
    // v: Vector4;
    // memcpy(*v, *bound, size_of(Vector4));
    // return v;

    // This is a stupid and clean way.
    // return .{left, bottom, right, top};

    // This is the evil way.
    return cast,force(Vector4) bound;
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

Font_System :: struct {
    pipeline_id:    Renderer.Pipeline.ID;
    pipeline:       Renderer.Pipeline;
    descriptor_set: VkDescriptorSet;
    msdf_texture:   Renderer.Texture;
    msdf:           MSDF;
    glyphs:         Table(u32, Glyph);

    // Even though a single buffer will give almost the same result,
    // it is always better to avoid race condition by making more
    // buffers matching the in-flight frames. But we don't have to
    // allocate multiple buffer, instead, I just create a single
    // buffer with different region for different frames. But keeping
    // track of them is a pain in the ass.
    block_buffer: Renderer.Buffer;
    BUFFER_SIZE :: 1024 * 1024; // 1MB per frame, should be enough

    vertex_instances: [..] Vertex_Instance;

    harfbuzz_buffer: *hb_buffer_t;
    harfbuzz_font:   *hb_font_t;

    available_font_families: Table(string, [..] Variation);

    DEFAULT_FONT :: "Hack"; // This is my personal choice.
    DEFAULT_EM_RANGE :: 0.3;
    DEFAULT_FONT_SIZE :: 64;

    next_font_family_id: Font_Family.ID = 1;
    font_families :: Table(ID, Font_Family);

    Glyph :: struct {
        advance:      float32;
        plane_bounds: Vector4;
        atlas_bounds: Vector4;
    }

    Vertex_Instance :: struct {
        fg_color:     Vector4;
        atlas_bounds: Vector4;
        extent:       Vector2;
        origin:       Vector2;
        size:         float32;
    }

    Header :: struct {
        texture_extent: Vector2;
        distance_range: float32;
    }

    Push_Constant :: struct {
        projection:  Matrix4;
        header:      VkDeviceAddress;
        vertex_data: VkDeviceAddress;
    }

    Font_Family :: struct {
        ID :: #type,distinct u64;
        name:    string;
        members: Table(string, Member); // The key is style name
        Member :: struct {
            hb:      *hb_font_t;
            msdf:    MSDF;
            glyphs:  Table(u32, Glyph);
            texture: Renderer.Texture;
        }
    }

    Variation :: struct {
        file_path: string;
        style:     string;
    }
}

load_system_fonts :: (system: *Font_System) {
    ok := FcInit();
    assert(ok != 0, "cannot init fontconfig");

    pattern := FcPatternCreate();
    object_set := FcObjectSetCreate();
    defer {
        FcObjectSetDestroy(object_set);
        FcPatternDestroy(pattern);
    }

    FcObjectSetAdd(object_set, FC_FILE);
    FcObjectSetAdd(object_set, FC_FAMILY);
    FcObjectSetAdd(object_set, FC_STYLE);
    font_set := FcFontList(null, pattern, object_set);

    if font_set {
        log("Found % fonts", font_set.nfont);
        for 0..font_set.nfont - 1 {
            family:    *FcChar8;
            style:     *FcChar8;
            file_path: *FcChar8;

            result: FcResult;
            result = FcPatternGetString(font_set.fonts[it], FC_FILE, 0, *file_path);
            assert(result == .Match);

            result = FcPatternGetString(font_set.fonts[it], FC_FAMILY, 0, *family);
            assert(result == .Match);

            result = FcPatternGetString(font_set.fonts[it], FC_STYLE, 0, *style);

            family_name := to_string(family);

            variation := Font_System.Variation.{
                file_path = copy_string(to_string(file_path))
            };

            if result == .Match {
                variation.style = copy_string(to_string(style));
            }

            variations := table_find_pointer(*system.available_font_families, family_name);
            if variations != null {
                array_add(variations, variation);
            } else {
                new_variations: [..] Font_System.Variation;
                array_add(*new_variations, variation);
                table_add(*system.available_font_families, copy_string(family_name), new_variations);
            }
        }

        log("The are % distinct font families", system.available_font_families.count);

        FcFontSetDestroy(font_set);
    }

    FcFini();
}

// When this function failed, it does not free the memory.
make_font_family :: (system: *Font_System, renderer: *Renderer, name: string) -> bool, Font_System.Font_Family.ID {
    ok, variations := table_find(*system.available_font_families, name);
    if !ok return false;

    family: Font_System.Font_Family;
    family.name = name;

    for variations {
        member: Font_System.Font_Family.Member;
        filedata, ok := read_entire_file(it.file_path);
        if !ok return false;

        blob := hb_blob_create(filedata.data, xx filedata.count, .READONLY, null, null);
        defer hb_blob_destroy(blob);

        face := hb_face_create(blob, 0);
        defer hb_face_destroy(face);
        font = hb_font_create(face);

        style := it.style;
        if style == "" {
            style = sprint("unknown%", it_index);
        }

        member.hb = font;

        ok=, output_image, output_json := generate_msdf_atlas(it.file_path, system.DEFAULT_EM_RANGE, system.DEFAULT_FONT_SIZE, "assets/font");
        if !ok return false;

        member.msdf = load_msdf(output_json);
        generate_glyphs(*member);

        result:, member.texture = make_texture_from_file(renderer, output_image);
        if result != .SUCCESS return false;

        table_add(*family.members, style, member);
    }

    id := system.next_font_family_id;
    table_add(*system.font_families, id, family);

    system.next_font_family_id += 1;

    return true, id;
}

make_font_system :: (using renderer: *Renderer) -> Font_System {
    system: Font_System;
    result: VkResult;
    ok:     bool;

    load_system_fonts(*system);

    ok, default_font_id = make_font_family(*system, renderer, system.DEFAULT_FONT);
    assert(ok, "cannot load default font family");

    descriptor_set_allocate_info := VkDescriptorSetAllocateInfo.{
        descriptorPool = persistent_descriptor_pool,
        descriptorSetCount = 1,
        pSetLayouts = *texture_descriptor_set_layout
    };

    result = check_vk(vkAllocateDescriptorSets(device, *descriptor_set_allocate_info, *system.descriptor_set));
    assert(result == .SUCCESS);

    push_constant_range := VkPushConstantRange.{
        stageFlags = .ALL_GRAPHICS,
        offset = 0,
        size = size_of(Font_System.Push_Constant)
    };

    writer: Descriptor_Writer;
    init(*writer);
    write_image(*writer, 0, system.msdf_texture.image_view, texture_sampler, .SHADER_READ_ONLY_OPTIMAL, .COMBINED_IMAGE_SAMPLER);
    update_set(*writer, device, system.descriptor_set);

    pipeline_layout_create_info := VkPipelineLayoutCreateInfo.{
        setLayoutCount = 1,
        pSetLayouts = *texture_descriptor_set_layout,
        pushConstantRangeCount = 1,
        pPushConstantRanges = *push_constant_range
    };
    pipeline_layout: VkPipelineLayout;
    result = check_vk(vkCreatePipelineLayout(device, *pipeline_layout_create_info, vka, *pipeline_layout));
    assert(result == .SUCCESS);

    pb: Pipeline_Builder;
    init(*pb);
    defer deinit(*pb);

    ok=, shader_module := make_shader_module(renderer, "shaders/font.slang.spv");
    assert(ok);
    defer vkDestroyShaderModule(device, shader_module, vka);

    add_shader(*pb, shader_module, .VERTEX, "vertex_main");
    add_shader(*pb, shader_module, .FRAGMENT, "fragment_main");

    set_color_attachment_format(*pb, draw_texture.format);
    set_depth_format(*pb, depth_texture.format);
    set_input_topology(*pb, .TRIANGLE_STRIP);
    set_polygon_mode(*pb, .FILL);
    set_cull_mode(*pb, .NONE, .COUNTER_CLOCKWISE);
    set_multisampling_none(*pb);
    disable_depthtest(*pb);
    enable_blending_alphablend(*pb);
    add_dynamic_state(*pb, .VIEWPORT);
    add_dynamic_state(*pb, .SCISSOR);

    result, system.pipeline_id = make_pipeline(renderer, *pb, pipeline_layout);
    assert(result == .SUCCESS);

    result, system.block_buffer = make_buffer(renderer, xx (renderer.frames.count * system.BUFFER_SIZE + size_of(Font_System.Header)), .STORAGE_BUFFER);
    assert(result == .SUCCESS);

    header_ptr := cast(*Font_System.Header) system.block_buffer.mapped_ptr;
    header_ptr.texture_extent = .{cast(float32) system.msdf.atlas.width, cast(float32) system.msdf.atlas.height};
    header_ptr.distance_range = system.msdf.atlas.distanceRange;

    ok, system.pipeline = table_find(*pipelines, system.pipeline_id);
    assert(ok);

    system.harfbuzz_buffer = hb_buffer_create();

    return system;
}

destroy_font_system :: (renderer: *Renderer, system: *Font_System) {
    hb_buffer_destroy(system.harfbuzz_buffer);
    destroy_buffer(renderer.vma, system.block_buffer);
    destroy_texture(renderer, system.msdf_texture);
}

begin_text_draw :: (system: *Font_System, renderer: *Renderer) {

}

end_text_draw :: (system: *Font_System, renderer: *Renderer) {
    command := renderer.cmd;
    current_ptr := current_buffer_ptr(system, renderer);

    memcpy(current_ptr, system.vertex_instances.data, size_of(Font_System.Vertex_Instance) * system.vertex_instances.count);
    defer array_reset_keeping_memory(*system.vertex_instances);

    // This projection matrix is handcrafted, because the
    // orthographic_projection_matrix() returns something suboptimal
    // in vulkan.
    proj: Matrix4;
    proj._11 = 2.0 / cast(float32) renderer.draw_extent.width;
    proj._14 = -1.0;
    proj._22 = 2.0 / cast(float32) renderer.draw_extent.height;
    proj._24 = -1.0;
    proj._33 = 1; // This is redundant. Well, z value in 2D space.
    proj._44 = 1;

    ps := Font_System.Push_Constant.{
        projection = proj,
        header     = system.block_buffer.address,
        vertex_data = current_buffer_address(system, renderer),
    };

    vkCmdBindPipeline(command, .GRAPHICS, system.pipeline.vk);
    vkCmdBindDescriptorSets(command, .GRAPHICS, system.pipeline.layout, 0, 1, *system.descriptor_set, 0, null);
    vkCmdPushConstants(command, system.pipeline.layout, .ALL_GRAPHICS, 0, size_of(Font_System.Push_Constant), *ps);
    vkCmdDraw(command, 4, xx system.vertex_instances.count, 0, 0);
}

append_text :: (system: *Font_System, text: string, font_size: u32, offset: Vector2) {
    // Should I allow constant changing in size?
    hb_font_set_scale(system.harfbuzz_font, xx (font_size * 64), xx (font_size * 64));
    hb_buffer_clear_contents(system.harfbuzz_buffer);
    hb_buffer_add_utf8(system.harfbuzz_buffer, text.data, xx text.count, 0, -1);
    hb_buffer_set_direction(system.harfbuzz_buffer, .LTR);

    // TODO: now the font system only handles latin characters
    // hb_buffer_set_script(system.harfbuzz_buffer, .HB_SCRIPT_LATIN);

    hb_shape(system.harfbuzz_font, system.harfbuzz_buffer, null, 0);

    infos := harfbuzz_get_glyph_infos(system.harfbuzz_buffer);
    positions := harfbuzz_get_glyph_positions(system.harfbuzz_buffer);

    cursor := offset;
    instance := Font_System.Vertex_Instance.{
        fg_color = .{1, 1, 1, 1}, // White
        size = xx font_size
    };
    for i: 0..infos.count - 1 {
        glyph_id := infos[i].codepoint;
        ok, glyph := table_find(*system.glyphs, glyph_id);
        assert(ok, "Cannot find glyph id %", glyph_id);

        instance.atlas_bounds = glyph.atlas_bounds;
        instance.extent.x = (glyph.plane_bounds.z - glyph.plane_bounds.x) * font_size;

        // The height is negative here, it makes the shader easier to work with.
        instance.extent.y = (glyph.plane_bounds.w - glyph.plane_bounds.y) * font_size;

        instance.origin.x = cursor.x + (positions[i].x_offset / 64.0);
        instance.origin.y = cursor.y + (positions[i].y_offset / 64.0);

        array_add(*system.vertex_instances, instance);

        cursor.x += positions[i].x_advance / 64.0;
        cursor.y += positions[i].y_advance / 64.0;
    }
}

// This is not an ideal way to generate atlas, but the most clean way to do so.
// This function requires your path to have msdf-atlas-gen command
generate_msdf_atlas :: (file_path: string, em_range: float, size: int, output_directory: string, replace_if_exists := false) -> bool, output_image_path:string, output_json_path:string {
    filename := path_filename(file_path);

    output_image := sprint("%/%.png", output_directory, path_strip_extension(filename));
    output_json  := sprint("%/%.json", output_directory, path_strip_extension(filename));

    if !replace_if_exists {
        ok: bool;
        _, ok = file_open(output_image);
        if ok return true, output_image, output_json;

        _, ok = file_open(output_json);
        if ok return true, output_image, output_json;
    }

    msdf_command := string.[
    "msdf-atlas-gen",
    "-type", "mtsdf",  // Actually, msdf is enough
    "-allglyphs",      // Because I am using harfbuzz
    "-yorigin", "top", // Vulkan NDC, origin in top left corner
    "-font", file_path,
    "-format", "png",
    "-emrange", tprint("%", em_range),
    "-size", tprint("%", size),
    "-imageout", output_image,
    "-json", output_json
    ];

    log("Generating % msdf (%)", filename, msdf_command);

    result := run_command(..msdf_command);
    if result.exit_code != 0 {
        return false, "", "";
    }

    return true, output_image, output_json;
}


#scope_file
current_buffer_ptr :: (system: *Font_System, renderer: *Renderer) -> *void {
    return system.block_buffer.mapped_ptr + size_of(Font_System.Header) + renderer.frame_index * system.BUFFER_SIZE;
}

current_buffer_address :: (system: *Font_System, renderer: *Renderer) -> VkDeviceAddress {
    return system.block_buffer.address + size_of(Font_System.Header) + renderer.frame_index * system.BUFFER_SIZE;
}

harfbuzz_get_glyph_infos :: (buffer: *hb_buffer_t) -> [] hb_glyph_info_t {
    infos: [] hb_glyph_info_t;
    count: u32;
    infos.data = hb_buffer_get_glyph_infos(buffer, *count);
    infos.count = xx count;

    return infos;
}

harfbuzz_get_glyph_positions :: (buffer: *hb_buffer_t) -> [] hb_glyph_position_t {
    positions: [] hb_glyph_position_t;
    count: u32;
    positions.data = hb_buffer_get_glyph_positions(buffer, *count);
    positions.count = xx count;
    return positions;
}

// This is just for aesthetic.
generate_glyphs :: inline (font_family_member: *Font_System.Font_Family.Member) {
    for g: font_family_member.msdf.glyphs {
        glyph: Font_System.Glyph;
        glyph.advance = it.advance;
        glyph.plane_bounds = bound_to_vector4(g.planeBounds);
        glyph.atlas_bounds = bound_to_vector4(g.atlasBounds);
        table_set(*font_family_member.glyphs, g.index, glyph);
    }
}

#if OS == .LINUX {
    SYSTEM_FONT_DIRECTORY :: "/usr/share/fonts/";
} else #if OS == .MACOS {
    SYSTEM_FONT_DIRECTORY :: "/System/Library/Fonts/";
} else {
    SYSTEM_FONT_DIRECTORY :: "";
}
