// This is a module for Font rendering and management. Using native CoreText on macOS.

Font :: struct {
    face: FT_Face;
}

init_font :: () {
    FT_Init_FreeType(*ft);
}

deinit_font :: () {
    FT_Done_FreeType(ft);
}

set_font_size :: (font: Font, size: u64) {

}

#scope_file
ft :: FT_Library;
#import "freetype";
