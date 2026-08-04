#module_parameters(GRID_SIZE: u32 = 64, TEXTURE_SIZE: u32 = 1024, DEFAULT_ATLAS_TEXTURE_COUNT: u32 = 256, DEFAULT_FONT_TEXTURE_HEAP_SIZE := 64);

// This is a module for Font rendering and management. Using native CoreText on macOS.
Glyph :: struct {
    uv: Rect;
    bitmap_left, bitmap_top: s32;
}

Font :: struct {
    index: u64;
    face: FT_Face;
    hb_font: *hb_font_t;
    cache: Table(u32, Glyph);
    texture: GPU.Texture;
    pen: u32x2;
}

font_texture_heap: [] GPU.Texture_Descriptor;

init_font :: () {
    FT_Init_FreeType(*ft);
    hb_buffer = hb_buffer_create();
    GPU.init(*atlas_arena, TEXTURE_SIZE * TEXTURE_SIZE * DEFAULT_ATLAS_TEXTURE_COUNT);
    GPU.init(*temp_arena, TEXTURE_SIZE * TEXTURE_SIZE);

    font_texture_heap = GPU.create_texture_heap(DEFAULT_FONT_TEXTURE_HEAP_SIZE);
}

deinit_font :: () {
    GPU.fini(*temp_arena);
    GPU.fini(*atlas_arena);
    hb_buffer_destroy(hb_buffer);
    FT_Done_FreeType(ft);
}

create_font :: (path: string) -> Font {
    f: Font;
    FT_New_Face(ft, temp_c_string(path), xx current_index, *f.face);
    f.index = current_index;
    FT_Set_Pixel_Sizes(f.face, 0, 32);

    f.hb_font = hb_ft_font_create_referenced(f.face);
    // hb_ft_font_set_load_flags(f.hb_font, FT_LOAD_FORCE_AUTOHINT);
    hb_ft_font_set_funcs(f.hb_font);

    texture_desc: GPU.Texture_Desc = .{
        dimensions = .{TEXTURE_SIZE, TEXTURE_SIZE, 1},
        format = .R8_UNORM,
        usage = .SAMPLED | .TRANSFER_DST
    };
    size_align := GPU.texture_size_align(texture_desc);
    memory_ptr := GPU.get(*atlas_arena, xx size_align.size, xx size_align.align);
    gpu_ptr := GPU.host_to_device_pointer(memory_ptr);
    f.texture = GPU.create_texture(texture_desc, gpu_ptr);

    font_texture_heap[f.index] = GPU.texture_descriptor(f.texture);

    current_index += 1;
    return f;
}

destroy_font :: (font: Font) {
    GPU.destroy_texture(font.texture);
    FT_Done_Face(font.face);
}

set_font_size :: (font: *Font, size: s64) {
    // Both hb_ft_hb_font_changed and hb_ft_font_changed have
    // absolutely no effect at all
    hb_font_set_scale(font.hb_font, xx (size * 64), xx (size * 64));

    FT_Set_Pixel_Sizes(font.face, 0, xx size);
}

load_ascii :: (cb: *GPU.Command_Buffer, font: *Font) {
    for i: 32..126 {
        glyph_index := FT_Get_Char_Index(font.face, xx i);

        load_glyph(cb, font, glyph_index);
    }
}

load_glyph :: (cb: *GPU.Command_Buffer, font: *Font, glyph_index: u32) -> Glyph, dimensions:Vector2 {
    glyph: Glyph;

    err: FT_Error;
    err = FT_Load_Glyph(font.face, glyph_index, FT_LOAD_DEFAULT);
    assert(err == xx FT_Err.Ok);
    dimensions: Vector2;
    dimensions.x = cast(float) font.face.glyph.metrics.width / 64.0;
    dimensions.y = cast(float) font.face.glyph.metrics.height / 64.0;

    found:, glyph = table_find(*font.cache, glyph_index);
    if found {
        return glyph, dimensions;
    }

    err = FT_Load_Glyph(font.face, glyph_index, FT_LOAD_RENDER | FT_LOAD_FORCE_AUTOHINT);
    assert(err == xx FT_Err.Ok);

    bmp := font.face.glyph.bitmap;

    assert(bmp.width < GRID_SIZE, "The bitmap is larger than GRID_SIZE. If you want to support larger font, use a bigger GRID_SIZE or rethink the logic here");

    glyph.uv.x = cast(float) font.pen.x;
    glyph.uv.y = cast(float) font.pen.y;
    glyph.uv.w = cast(float) bmp.width;
    glyph.uv.h = cast(float) bmp.rows;
    glyph.bitmap_left = font.face.glyph.bitmap_left;
    glyph.bitmap_top  = font.face.glyph.bitmap_top;

    if bmp.width == 0 {
        return glyph, dimensions;
    }

    GPU.push_allocator(GPU.arena_allocator_proc, *temp_arena);

    staging_memory := GPU.alloc(bmp.width * bmp.rows);
    // Check if there pitch equals width
    if bmp.width == xx bmp.pitch {
        memcpy(staging_memory, bmp.buffer, bmp.width * bmp.rows);
    } else {
        for i: 0..bmp.rows-1 {
            memcpy(staging_memory + i * bmp.rows, bmp.buffer + cast(u64) (i * xx bmp.pitch), bmp.width);
        }
    }

    GPU.copy_to_texture(cb, font.texture, GPU.host_to_device_pointer(staging_memory), .{xx font.pen.x, xx font.pen.y, 0}, .{bmp.width, bmp.rows, 1});

    table_add(*font.cache, glyph_index, glyph);

    font.pen.x += GRID_SIZE;

    if font.pen.x >= font.texture.dimensions.x {
        font.pen.x = 0;
        font.pen.y += GRID_SIZE;

        assert(font.pen.y < font.texture.dimensions.y, "The font texture is fulled, do something");
    }

    return glyph, dimensions;
}

get_text_draw_info :: (cb: *GPU.Command_Buffer, font: *Font, text: string, origin: Vector2) -> positions: []Rect, uvs: []Rect {
    // Reset the buffer
    hb_buffer_reset(hb_buffer);

    hb_buffer_add_utf8(hb_buffer, text.data, xx text.count, 0, -1);
    hb_buffer_guess_segment_properties(hb_buffer);

    hb_shape(font.hb_font, hb_buffer, null, 0);

    glyph_count: u32;
    info := hb_buffer_get_glyph_infos(hb_buffer, *glyph_count);
    pos  := hb_buffer_get_glyph_positions(hb_buffer, *glyph_count);


    cursor := origin;

    positions: [..] Rect;
    uvs:       [..] Rect;

    for i: 0..glyph_count - 1 {
        gid := info[i].codepoint;

        x_off := cast(float) pos[i].x_offset / 64.0;
        y_off := cast(float) pos[i].y_offset / 64.0;
        x_advance := cast(float) pos[i].x_advance / 64.0;
        y_advance := cast(float) pos[i].y_advance / 64.0;

        // log("xa = %", x_advance);

        position: Rect;

        position.x = cursor.x + x_off;
        position.y = cursor.y - y_off;

        glyph, dimensions := load_glyph(cb, font, gid);

        uv:      Rect = glyph.uv;

        position.x += glyph.bitmap_left;
        position.y -= glyph.bitmap_top;
        position.w = dimensions.x;
        position.h = dimensions.y;

        // log("position = %, uv = %", position, uv);

        cursor.x += x_advance;
        cursor.y -= y_advance;

        array_add(*positions, position);
        array_add(*uvs, uv);
    }

    return positions, uvs;
}

#scope_file
ft: FT_Library;
current_index: u64 = 0;

hb_buffer: *hb_buffer_t;
atlas_arena: GPU.Arena;
temp_arena: GPU.Arena;

#import "freetype";
#import "Basic";
#import "HarfBuzz";
#import "Hash_Table";
GPU :: #import "GPU";
#import "Math";
#import "Utils/types";
