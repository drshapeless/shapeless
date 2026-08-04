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

    f.hb_font = hb_ft_font_create_referenced(f.face);
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

set_font_size :: (font: Font, size: s64, resolution: u32 = 0) {
    FT_Set_Char_Size(font.face, size * 64, 0, resolution, 0);
}

load_glyph :: (cb: *GPU.Command_Buffer, font: *Font, glyph_index: u32) -> Glyph {
    glyph: Glyph;
    found:, glyph = table_find(*font.cache, glyph_index);
    if found {
        return glyph;
    }

    err := FT_Load_Glyph(font.face, glyph_index, FT_LOAD_RENDER | FT_LOAD_FORCE_AUTOHINT);
    assert(err == xx FT_Err.Ok);

    bmp := font.face.glyph.bitmap;

    assert(bmp.width < GRID_SIZE);

    glyph.uv.x = cast(float) font.pen.x;
    glyph.uv.y = cast(float) font.pen.y;
    glyph.uv.w = cast(float) bmp.width;
    glyph.uv.h = cast(float) bmp.rows;
    glyph.bitmap_left = font.face.glyph.bitmap_left;
    glyph.bitmap_top  = font.face.glyph.bitmap_top;

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

    return glyph;
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


    cursor: s32x2;
    cursor.x = cast(s32) origin.x * 64;
    cursor.y = cast(s32) origin.y * 64;

    positions: [..] Rect;
    uvs:       [..] Rect;

    for i: 0..glyph_count - 1 {
        gid := info[i].codepoint;

        x_off := pos[i].x_offset;
        y_off := pos[i].y_offset;
        x_advance := pos[i].x_advance;
        y_advance := pos[i].y_advance;

        position: Rect;

        position.x = cast(float) (cursor.x + x_off) / 64.0;
        position.y = cast(float) (cursor.y + y_off) / 64.0;

        // TODO: unfinished
        glyph := load_glyph(cb, font, gid);

        uv:      Rect = glyph.uv;

        position.x += glyph.bitmap_left;
        position.y += glyph.bitmap_top;
        position.w = glyph.uv.w;
        position.h = glyph.uv.h;

        cursor.x += x_advance;
        cursor.y += y_advance;

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
