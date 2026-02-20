Bound :: struct {
    left:   float32;
    top:    float32;
    right:  float32;
    bottom: float32;
}

Font_System :: struct {
    gpu_memory:            Renderer.Allocation;
    gpu_memory_pool:       Renderer.Memory_Pool;
    MEMORY_SIZE ::         256 * 1024 * 1024; // 256MB

    pipeline_id:           Renderer.Pipeline.ID;
    pipeline:              Renderer.Pipeline;
    sampler:               VkSampler;
    descriptor_pool:       VkDescriptorPool;
    descriptor_set_layout: VkDescriptorSetLayout;
    descriptor_set:        VkDescriptorSet;

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

    available_font_families: Table(string, [..] Variation);

    DEFAULT_FONT :: "Hack"; // This is my personal choice.
    DEFAULT_EM_RANGE :: 0.3;
    DEFAULT_FONT_SIZE :: 64;

    next_font_family_id: Font_Family.ID = 1;
    font_families: Table(Font_Family.ID, Font_Family);

    font_textures: [..] Renderer.Texture;

    default_unicode_function: *hb_unicode_funcs_t;
    script_font_family_map: Table(hb_script_t, Font_Family.ID);

    Glyph :: struct {
        advance:      float32;
        plane_bounds: Bound;
        atlas_bounds: Bound;
    }

    Vertex_Instance :: struct {
        fg_color:      Vector4;
        uvs:           Bound; // u_min, u_max, v_min, v_max
        positions:     Bound; // x_min, x_max, y_min, y_max
        unit_range:    Vector2;
        texture_index: u32;
    }

    Push_Constant :: struct {
        projection:  Matrix4;
        vertex_data: VkDeviceAddress;
    }

    Font_Family :: struct {
        ID :: #type,distinct u64;
        name:    string;
        members: Table(string, Member); // The key is style name
        Member :: struct {
            hb:            *hb_font_t;
            msdf:          MSDF;
            glyphs:        Table(u32, Glyph);
            texture_index: s64;
        }
    }

    Variation :: struct {
        file_path: string;
        style:     string;
    }

    Run :: struct {
        script: hb_script_t;
        is_emoji: bool;
        codepoints: [] u32;
    }

}
// When this function failed, it does not free the memory.
make_font_family :: (system: *Font_System, renderer: *Renderer, name: string) -> bool, Font_System.Font_Family.ID {
    ok, variations := table_find(*system.available_font_families, name);
    if !ok return false, 0;

    family: Font_System.Font_Family;
    family.name = name;

    for variations {
        member: Font_System.Font_Family.Member;
        filedata, ok := read_entire_file(it.file_path);
        if !ok return false, 0;

        blob := hb_blob_create(filedata.data, xx filedata.count, .READONLY, null, null);
        defer hb_blob_destroy(blob);

        face := hb_face_create(blob, 0);
        defer hb_face_destroy(face);
        font := hb_font_create(face);

        style := it.style;
        if style == "" {
            style = sprint("unknown%", it_index);
        }

        member.hb = font;

        ok=, output_image, output_json := generate_msdf_atlas(it.file_path, system.DEFAULT_EM_RANGE, system.DEFAULT_FONT_SIZE, "assets/font");
        if !ok return false, 0;

        member.msdf = load_msdf(output_json);
        generate_glyphs(*member);

        result, texture := make_texture_from_file(renderer, *system.gpu_memory_pool, output_image);
        if result != .SUCCESS return false, 0;

        array_add(*system.font_textures, texture);
        member.texture_index = system.font_textures.count - 1;

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

    result, system.gpu_memory = gpu_allocate_mapped(renderer, Font_System.MEMORY_SIZE, memory_indices.rebar);
    assert(result == .SUCCESS);
    system.gpu_memory_pool = make_memory_pool(system.gpu_memory);

    system.available_font_families = get_system_fonts();

    ok=, default_font_id := make_font_family(*system, renderer, system.DEFAULT_FONT);
    assert(ok, "cannot load default font family");

    sampler_create_info := VkSamplerCreateInfo.{
        magFilter = .LINEAR,
        minFilter = .LINEAR,
        mipmapMode = .LINEAR,
        anisotropyEnable = VK_TRUE,
        maxAnisotropy  = 8
    };
    result = check_vk(vkCreateSampler(device, *sampler_create_info, vka, *system.sampler));
    assert(result == .SUCCESS);

    descriptor_binding_flags := VkDescriptorBindingFlags.[
    0,
    .VARIABLE_DESCRIPTOR_COUNT
    ] ;
    descriptor_set_layout_binding_flags_create_info := VkDescriptorSetLayoutBindingFlagsCreateInfo.{
        bindingCount = xx descriptor_binding_flags.count,
        pBindingFlags = descriptor_binding_flags.data
    };

    descriptor_set_layout_binding := VkDescriptorSetLayoutBinding.[
    .{
        binding = 0,
        descriptorType = .SAMPLER,
        descriptorCount = 1,
        stageFlags = .ALL_GRAPHICS
    },
    .{
        binding = 1,
        descriptorType = .SAMPLED_IMAGE,
        descriptorCount = xx system.font_textures.count,
        stageFlags = .ALL_GRAPHICS
    }
    ];

    descriptor_set_layout_create_info := VkDescriptorSetLayoutCreateInfo.{
        pNext = *descriptor_set_layout_binding_flags_create_info,
        bindingCount = 2,
        pBindings = descriptor_set_layout_binding.data
    };

    result = check_vk(vkCreateDescriptorSetLayout(device, *descriptor_set_layout_create_info, vka, *system.descriptor_set_layout));
    assert(result == .SUCCESS);

    pool_sizes := VkDescriptorPoolSize.[
    .{
        type = .SAMPLED_IMAGE,
        descriptorCount = xx system.font_textures.count
    },
    .{
        type = .SAMPLER,
        descriptorCount = 1
    }
    ];

    descriptor_pool_create_info := VkDescriptorPoolCreateInfo.{
        maxSets = 1,
        poolSizeCount = 2,
        pPoolSizes = pool_sizes.data
    };

    result = check_vk(vkCreateDescriptorPool(device, *descriptor_pool_create_info, vka, *system.descriptor_pool));
    assert(result == .SUCCESS);

    variable_descriptor_count :u32 = xx system.font_textures.count;
    variable_descriptor_count_allocate_info := VkDescriptorSetVariableDescriptorCountAllocateInfo.{
        descriptorSetCount = 1,
        pDescriptorCounts = *variable_descriptor_count
    };

    descriptor_set_allocate_info := VkDescriptorSetAllocateInfo.{
        pNext = *variable_descriptor_count_allocate_info,
        descriptorPool = system.descriptor_pool,
        descriptorSetCount = 1,
        pSetLayouts = *system.descriptor_set_layout
    };

    result = check_vk(vkAllocateDescriptorSets(device, *descriptor_set_allocate_info, *system.descriptor_set));
    assert(result == .SUCCESS);

    push_constant_range := VkPushConstantRange.{
        stageFlags = .ALL_GRAPHICS,
        offset = 0,
        size = size_of(Font_System.Push_Constant)
    };

    descriptor_image_infos := NewArray(system.font_textures.count, VkDescriptorImageInfo,, temp);
    for i: 0..system.font_textures.count - 1 {
        descriptor_image_infos[i].imageView = system.font_textures[i].image_view;
        descriptor_image_infos[i].imageLayout = .SHADER_READ_ONLY_OPTIMAL;
    }

    sampler_info := VkDescriptorImageInfo.{
        sampler = system.sampler
    };

    write_descriptor_sets := VkWriteDescriptorSet.[
    .{
        dstSet = system.descriptor_set,
        dstBinding = 0,
        descriptorCount = 1,
        descriptorType = .SAMPLER,
        pImageInfo = *sampler_info
    },
    .{
        dstSet = system.descriptor_set,
        dstBinding = 1,
        descriptorCount = xx system.font_textures.count,
        descriptorType = .SAMPLED_IMAGE,
        pImageInfo = descriptor_image_infos.data
    }
    ];

    vkUpdateDescriptorSets(device, xx write_descriptor_sets.count, write_descriptor_sets.data, 0, null);

    pipeline_layout_create_info := VkPipelineLayoutCreateInfo.{
        setLayoutCount = 1,
        pSetLayouts = *system.descriptor_set_layout,
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

    result, system.block_buffer = make_buffer(renderer, *system.gpu_memory_pool, xx (renderer.frames.count * system.BUFFER_SIZE), .STORAGE_BUFFER);
    assert(result == .SUCCESS);


    ok, system.pipeline = table_find(*pipelines, system.pipeline_id);
    assert(ok);

    system.harfbuzz_buffer = hb_buffer_create();

    system.default_unicode_function = hb_unicode_funcs_get_default();

    return system;
}

destroy_font_system :: (using renderer: *Renderer, system: *Font_System) {
    for system.font_textures {
        destroy_texture(renderer, it);
    }
    vkDestroyDescriptorPool(device, system.descriptor_pool, vka);
    vkDestroyDescriptorSetLayout(device, system.descriptor_set_layout, vka);
    vkDestroySampler(device, system.sampler, vka);
    hb_buffer_destroy(system.harfbuzz_buffer);
    destroy_buffer(renderer, system.block_buffer);
    gpu_free(renderer, system.gpu_memory);
}

begin_text_draw :: (system: *Font_System, renderer: *Renderer) {

}

end_text_draw :: (system: *Font_System, renderer: *Renderer) {
    command := renderer.current_swapchain_command_buffer;
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
        vertex_data = current_buffer_address(system, renderer),
    };

    vkCmdBindPipeline(command, .GRAPHICS, system.pipeline.vk);
    vkCmdBindDescriptorSets(command, .GRAPHICS, system.pipeline.layout, 0, 1, *system.descriptor_set, 0, null);
    vkCmdPushConstants(command, system.pipeline.layout, .ALL_GRAPHICS, 0, size_of(Font_System.Push_Constant), *ps);
    vkCmdDraw(command, 4, xx system.vertex_instances.count, 0, 0);
}

draw_text :: (system: *Font_System, text: string, font_size: u32, offset: Vector2, variation: string = "Regular") {
    runs := itemize(system.default_unicode_function, text,, temp);
    defer reset_temporary_storage();

    cursor := offset;
    for runs {
        cursor = internal_draw_text_run(system, it, font_size, cursor, variation);

    }
}

internal_draw_text_run :: (system: *Font_System, run: Font_System.Run, font_size: u32, offset: Vector2, variation: string = "Regular") -> cursor:Vector2 {

}

append_text :: (system: *Font_System, text: string, font_size: u32, offset: Vector2, family_index: Font_System.Font_Family.ID = 1, variation: string = "Regular") {
    ok, font := table_find(*system.font_families, family_index);
    assert(ok);

    ok=, regular := table_find(*font.members, variation);
    assert(ok);

    hb_font_set_scale(regular.hb, xx (font_size * 64), xx (font_size * 64));
    hb_buffer_clear_contents(system.harfbuzz_buffer);
    hb_buffer_add_utf8(system.harfbuzz_buffer, text.data, xx text.count, 0, -1);
    hb_buffer_set_direction(system.harfbuzz_buffer, .LTR);

    // TODO: now the font system only handles latin characters
    // hb_buffer_set_script(system.harfbuzz_buffer, .HB_SCRIPT_LATIN);


    hb_shape(regular.hb, system.harfbuzz_buffer, null, 0);

    infos := harfbuzz_get_glyph_infos(system.harfbuzz_buffer);
    positions := harfbuzz_get_glyph_positions(system.harfbuzz_buffer);

    cursor := offset;
    instance := Font_System.Vertex_Instance.{
        fg_color = .{1, 1, 1, 1}, // White
    };
    for i: 0..infos.count - 1 {
        glyph_id := infos[i].codepoint;
        ok, glyph := table_find(*regular.glyphs, glyph_id);
        assert(ok, "Cannot find glyph id %", glyph_id);

        origin_x := cursor.x + (positions[i].x_offset / 64.0);
        origin_y := cursor.y + (positions[i].y_offset / 64.0);

        instance.positions.left   = origin_x + (glyph.plane_bounds.left   * font_size);
        instance.positions.right  = origin_x + (glyph.plane_bounds.right  * font_size);
        instance.positions.top    = origin_y + (glyph.plane_bounds.top    * font_size);
        instance.positions.bottom = origin_y + (glyph.plane_bounds.bottom * font_size);

        instance.uvs.left   = glyph.atlas_bounds.left   / regular.msdf.atlas.width;
        instance.uvs.right  = glyph.atlas_bounds.right  / regular.msdf.atlas.width;
        instance.uvs.top    = glyph.atlas_bounds.top    / regular.msdf.atlas.height;
        instance.uvs.bottom = glyph.atlas_bounds.bottom / regular.msdf.atlas.height;

        instance.texture_index = xx regular.texture_index;
        instance.unit_range.x = regular.msdf.atlas.distanceRange / regular.msdf.atlas.width;
        instance.unit_range.y = regular.msdf.atlas.distanceRange / regular.msdf.atlas.height;

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

itemize :: (unicode_function: *hb_unicode_funcs_t, text: string) -> [] Font_System.Run {
    prev_script :hb_script_t = .INVALID;
    prev_is_emoji := false;

    codepoints: [..] u32;
    runs:       [..] Font_System.Run;

    add_run :: () #expand {
        run := Font_System.Run.{
            script = prev_script,
            is_emoji = prev_is_emoji,
            codepoints = array_copy(codepoints)
        };

        array_add(*runs, run);
        array_reset_keeping_memory(*codepoints);
    }

    for :utf8_iter text {
        script := hb_unicode_script(unicode_function, it);
        if prev_script == .INVALID {
            prev_script = script;
        } if script == .COMMON {
            is_emoji := is_codepoint_emoji(it);
            if is_emoji {
                if !prev_is_emoji {
                    add_run();
                    prev_is_emoji = true;
                }
            } else {
                if prev_is_emoji {
                    add_run();
                    prev_script = script;
                    prev_is_emoji = false;
                }
            }
        } else if script != .COMMON && script != .INHERITED && script != prev_script {
            add_run();
            prev_script = script;
            prev_is_emoji = false;
        }

        array_add(*codepoints, it);
    }

    // The last one
    run := Font_System.Run.{
        script = prev_script,
        codepoints = array_copy(codepoints)
    };
    array_add(*runs, run);

    return runs;
}

get_system_fonts :: () -> Table(string, [..] Font_System.Variation) {
    ok := FcInit();
    assert(ok != 0, "cannot init fontconfig");

    available_font_families: Table(string, [..] Font_System.Variation);

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

            variations := table_find_pointer(*available_font_families, family_name);
            if variations != null {
                array_add(variations, variation);
            } else {
                new_variations: [..] Font_System.Variation;
                array_add(*new_variations, variation);
                table_add(*available_font_families, copy_string(family_name), new_variations);
            }
        }

        log("The are % distinct font families", available_font_families.count);

        FcFontSetDestroy(font_set);
    }

    FcFini();

    return available_font_families;
}

#scope_file
current_buffer_ptr :: (system: *Font_System, renderer: *Renderer) -> *void {
    return system.block_buffer.allocation.mapped_pointer + renderer.frame_index * system.BUFFER_SIZE;
}

current_buffer_address :: (system: *Font_System, renderer: *Renderer) -> VkDeviceAddress {
    return system.block_buffer.address + renderer.frame_index * system.BUFFER_SIZE;
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
        glyph.advance = g.advance;
        glyph.plane_bounds = g.planeBounds;
        glyph.atlas_bounds = g.atlasBounds;
        table_set(*font_family_member.glyphs, g.index, glyph);
    }
}

MSDF :: struct {
    atlas:   Atlas;
    metrics: Metrics;
    glyphs:  [] Glyph;
    kerning: [] Kerning;

    Atlas :: struct {
        type:          string;
        distanceRange: float;
        size:          float32;
        width:         float;
        height:        float;
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

    Kerning :: struct {
        unicode1: u64;
        unicode2: u64;
        advance:  float32;
    }
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


is_codepoint_emoji :: (codepoint: u32) -> bool {
    // This function is not a good checker for emoji, since some of the emoji
    return u_hasBinaryProperty(xx codepoint, .EMOJI_PRESENTATION) ||
    u_hasBinaryProperty(xx codepoint, .EXTENDED_PICTOGRAPHIC);
}
