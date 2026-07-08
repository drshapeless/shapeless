Font :: struct {
    blob: *hb_blob_t;
    face: *hb_face_t;
    hb:   *hb_font_t;
}

init_font_system :: () {
    get_system_font();

}

load_font :: (font_path: string, index: u32 = 0) -> Font {
    auto_release_temp();

    font: Font;
    font.blob = hb_blob_create_from_file(temp_c_string(font_path));

    if ends_with(font_path, ".ttf") {
        // This should only have one face index
        font.face = hb_face_create(font.blob, 0);
    } else if ends_with(font_path, ".ttc") {
        total_faces := hb_face_count(font.blob);
        assert(index < total_faces, "Invalid font index of .ttc file, total = %; index = %;", total_faces, index);

        font.face = hb_face_create(font.blob, index);
    }

    font.hb = hb_font_create(font.face);

    return font;
}

destroy_font :: (font: Font) {
    hb_font_destroy(font.hb);
    hb_face_destroy(font.face);
    hb_blob_destroy(font.blob);
}

#scope_file
Font_Variation :: struct {
    file_path: string;
    style:     string;
}

available_fonts: Table(string, [..] Font_Variation);

get_system_font :: () {
    ok: s32;
    ok = FcInit();
    assert(ok > 0, "cannot init fontconfig");

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

    if !font_set {
        log("Cannot find system fonts");
        return;
    }

    log("Found % system fonts", font_set.nfont);

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

        variation := Font_Variation.{
            file_path = copy_string(to_string(file_path)),
        };

        if result == .Match {
            variation.style = copy_string(to_string(style));
        }

        variations := table_find_pointer(*available_fonts, family_name);
        if variations {
            array_add(variations, variation);
        } else {
            new_variations: [..] Font_Variation;
            array_add(*new_variations, variation);
            table_add(*available_fonts, copy_string(family_name), new_variations);
        }
    }

    log("There are % distinct font families", available_fonts.count);
    FcFontSetDestroy(font_set);
    FcFini();
}

#import "msdf";
#import "HarfBuzz";
#import "fontconfig";
#import "Basic";
#import "Hash_Table";
#import "String";
