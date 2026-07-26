#module_parameters(GRID_SIZE: u32 = 64, TEXTURE_SIZE: u32 = 1024, DEFAULT_ATLAS_TEXTURE_COUNT: u32 = 256);

// This is a module for Font rendering and management. Using native CoreText on macOS.
Glyph :: struct {
    x, y: u32; // Relative to the texture
    w, h: u32;
    x_off, y_off: s32;
}

Font :: struct {
    index: s64;
    face: FT_Face;
    hb_font: *hb_font_t;
    cache: Table(u32, Glyph);
    texture: GPU.Texture;
    pen_x: u32;
    pen_y: u32;
}

init_font :: () {
    FT_Init_FreeType(*ft);
    hb_buffer = hb_buffer_create();
    GPU.init(*atlas_arena, TEXTURE_SIZE * TEXTURE_SIZE * DEFAULT_ATLAS_TEXTURE_COUNT);
    GPU.init(*temp_arena, TEXTURE_SIZE * TEXTURE_SIZE);
}

deinit_font :: () {
    GPU.fini(*temp_arena);
    GPU.fini(*atlas_arena);
    hb_buffer_destroy(hb_buffer);
    FT_Done_FreeType(ft);
}

create_font :: (path: string) -> Font {
    f: Font;
    FT_New_Face(ft, temp_c_string(path), current_index, *f.face);

    f.hb_font = hb_ft_font_create_referenced(f.face);
    hb_ft_font_set_funcs(f.hb_font);

    texture_desc: GPU.Texture_Desc = .{
        dimensions = .{TEXTURE_SIZE, TEXTURE_SIZE, 1},
        format = .R8_UNORM,
    };
    size_align := GPU.texture_size_align(texture_desc);
    memory_ptr := GPU.get(*atlas_arena, size_align.size, size_align.align);
    gpu_ptr := GPU.host_to_device_pointer(memory_ptr);
    GPU.create_texture(texture_desc, gpu_ptr);

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
    assert(err == .Ok);

    bmp := font.face.glyph.bitmap;


    glyph.x = font.pen_x;
    glyph.y = font.pen_y;
    glyph.w = bmp.width;
    glyph.h = bmp.rows;
    glyph.x_off = font.face.glyph.bitmap_left;
    glyph.y_off = font.face.glyph.bitmap_top;

    GPU.push_allocator(GPU.arena_allocator_proc, *temp_arena);

    staging_memory := GPU.alloc(bmp.width * bmp.rows);
    // Check if there pitch equals width
    if bmp.width == bmp.pitch {
        memcpy(staging_memory, bmp.buffer, bmp.width * bmp.rows);
    } else {
        for i: 0..bmp.rows-1 {
            memcpy(staging_memory + i * bmp.rows, bmp.buffer + i * bmp.pitch, bmp.width);
        }
    }

    GPU.copy_to_texture(cb, font.texture, GPU.host_to_device_pointer(staging_memory), .{xx font.pen_x, xx font.pen_y, 0}, .{bmp.width, bmp.rows, 1});

    table_add(*font.cache, glyph_index, glyph);

    font.pen_x += GRID_SIZE;

    if font.pen_x >= font.texture.dimensions

    return glyph;
}

#scope_file
ft: FT_Library;
current_index: s64 = 0;

hb_buffer: *hb_buffer_t;
atlas_arena: GPU.Arena;
temp_arena: GPU.Arena;
#import "freetype";
#import "Basic";
#import "HarfBuzz";
#import "Hash_Table";
GPU :: #import "GPU";
