Font_System :: struct {
    Run :: struct {
        script:     hb_script_t;
        codepoints: []u32;
        is_emoji:   bool;
    }
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

// get_system_fonts :: () -> Table(string, [..] Font_System.Variation) {
//     ok := FcInit();
//     assert(ok != 0, "cannot init fontconfig");

//     available_font_families: Table(string, [..] Font_System.Variation);

//     pattern := FcPatternCreate();
//     object_set := FcObjectSetCreate();
//     defer {
//         FcObjectSetDestroy(object_set);
//         FcPatternDestroy(pattern);
//     }

//     FcObjectSetAdd(object_set, FC_FILE);
//     FcObjectSetAdd(object_set, FC_FAMILY);
//     FcObjectSetAdd(object_set, FC_STYLE);
//     font_set := FcFontList(null, pattern, object_set);

//     if font_set {
//         log("Found % fonts", font_set.nfont);
//         for 0..font_set.nfont - 1 {
//             family:    *FcChar8;
//             style:     *FcChar8;
//             file_path: *FcChar8;

//             result: FcResult;
//             result = FcPatternGetString(font_set.fonts[it], FC_FILE, 0, *file_path);
//             assert(result == .Match);

//             result = FcPatternGetString(font_set.fonts[it], FC_FAMILY, 0, *family);
//             assert(result == .Match);

//             result = FcPatternGetString(font_set.fonts[it], FC_STYLE, 0, *style);

//             family_name := to_string(family);

//             variation := Font_System.Variation.{
//                 file_path = copy_string(to_string(file_path))
//             };

//             if result == .Match {
//                 variation.style = copy_string(to_string(style));
//             }

//             variations := table_find_pointer(*available_font_families, family_name);
//             if variations != null {
//                 array_add(variations, variation);
//             } else {
//                 new_variations: [..] Font_System.Variation;
//                 array_add(*new_variations, variation);
//                 table_add(*available_font_families, copy_string(family_name), new_variations);
//             }
//         }

//         log("The are % distinct font families", available_font_families.count);

//         FcFontSetDestroy(font_set);
//     }

//     FcFini();

//     return available_font_families;
// }

#scope_file

is_codepoint_emoji :: (codepoint: u32) -> bool {
    // This function is not a good checker for emoji, since some of the emoji
    return u_hasBinaryProperty(xx codepoint, .EMOJI_PRESENTATION) ||
    u_hasBinaryProperty(xx codepoint, .EXTENDED_PICTOGRAPHIC);
}
