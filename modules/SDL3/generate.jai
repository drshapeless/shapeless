vulkan := false;

#run {
    set_build_options_dc(.{do_output=false});

    options := get_build_options();
    args := options.compile_time_command_line;
    vulkan = array_find(args, "vulkan");
    update := array_find(args, "update");

    if update {
        update_headers();
        return;
    }

    if !generate_bindings() {
        compiler_set_workspace_status(.FAILED);
        return;
    }
}

update_headers :: () {
    make_directory_if_it_does_not_exist("include");
    system_include_prefix: string;
    #if OS == .MACOS {
        system_include_prefix = "/opt/homebrew/include";
    } else #if OS == .LINUX {
        system_include_prefix = "/usr/include";
    }

    delete_directory("include/SDL3");
    make_directory_if_it_does_not_exist("include/SDL3");
    copy_directory(tprint("%/SDL3", system_include_prefix), "include/SDL3");
}

generate_bindings :: () -> bool {
    output_filename: string;
    opts: Generate_Bindings_Options;
    opts.strip_flags = .FUNCTIONS_WITH_VALIST;

    #if OS == .LINUX {
        make_directory_if_it_does_not_exist("linux");
        output_filename = "linux/linux.jai";

        FOOTER :: #string EOF
libsdl3 :: #library "libSDL3";
EOF;

        opts.footer = FOOTER;

        opts.generate_library_declarations = false;
        array_add(*opts.library_search_paths, "linux");
        array_add(*opts.libraries, .{filename="libSDL3.so.0"});
    } else #if OS == .MACOS {
        make_directory_if_it_does_not_exist("macos");
        output_filename = "macos/macos.jai";

        array_add(*opts.library_search_paths, "macos");

        opts.generate_library_declarations = false;
        array_add(*opts.libraries, .{filename = "libSDL3"});
    } else {
        assert(false, "the OS % is currently unsupported. You might be able to add support for it though!", OS);
    }

    array_add(*opts.include_paths, "include");
    array_add(*opts.source_files, "include/SDL3/SDL.h");
    array_add(*opts.source_files, "include/SDL3/SDL_main.h");

    if vulkan {
        array_add(*opts.source_files, "include/SDL3/SDL_vulkan.h");
        opts.footer = sprint("#import \"Vulkan\";\n%", opts.footer);
    }

    opts.visitor = sdl3_visitor;
    opts.generate_compile_time_struct_checks = false;

    return generate_bindings(opts, output_filename);
}

event_type_decl: *Enum;

sdl3_visitor :: (decl: *Declaration, parent_decl: *Declaration) -> Declaration_Visit_Result {

    // if parent_decl return .RECURSE;

    if vulkan {
        if begins_with(decl.name, "Vk") {
            decl.decl_flags |= .OMIT_FROM_OUTPUT;
            return .STOP;
        }
    }

    if array_find(DECLARATIONS_TO_OMIT, decl.name) {
        decl.decl_flags |= .OMIT_FROM_OUTPUT;
        return .STOP;
    }

    if decl.kind == .ENUM {
        en := cast(*Enum)decl;
        if en.name == "SDL_EventType" {
            event_type_decl = en; // Save for later
        }
    }

    // Here we replace the Uint8 type to SDL_EventType enum
    if parent_decl && parent_decl.kind == .STRUCT && ends_with(parent_decl.name, "Event") && decl.kind == .DECLARATION && decl.name == "type" {
        type := New(CType);
        type.type_of_enum = event_type_decl;
        type.size = event_type_decl.type.size;
        decl.type = type;
    }

    if parent_decl == null && decl.kind == .TYPEDEF {
        // We handcraft our window flag.
        if decl.name == "SDL_WindowFlags" {
            decl.decl_flags |= .OMIT_FROM_OUTPUT;
            return .STOP;
        }

        // Also handcraft init flag.
        if decl.name == "SDL_InitFlags" {
            decl.decl_flags |= .OMIT_FROM_OUTPUT;
            return .STOP;
        }
    }

    // Remove the init flag define.
    if parent_decl == null && begins_with(decl.name, "SDL_INIT_") {
        decl.decl_flags |= .OMIT_FROM_OUTPUT;
        return .STOP;
    }

    return .RECURSE;
}

#scope_file

#import "Basic";
#import "Compiler";
#import "BuildCpp";
#import "Check";
#import "Bindings_Generator";
#import "File";
#import "File_Utilities";
#import "String";

DECLARATIONS_TO_OMIT :: string.[
    "_m_prefetch",
    "__debugbreak",

    /*
    Those are force inlined functions defined in the headers, so they don't appear in the library and so bindings generator complains.

    One way is to automatically remove inline, compile them into a DLL, and turn them into #c_call jai procs. However, this loses inline.

    The performant way is to rewrite them in pure jai code, however that introduces overhead of ensuring they are updated.
    */
    "SDL_size_mul_check_overflow",
    "SDL_size_mul_check_overflow_builtin",
    "SDL_size_add_check_overflow",
    "SDL_size_add_check_overflow_builtin",
    "SDL_SwapFloat",
    "SDL_MostSignificantBitIndex32",
    "SDL_HasExactlyOneBitSet32",
    "SDL_RectToFRect",
    "SDL_PointInRect",
    "SDL_RectEmpty",
    "SDL_RectsEqual",
    "SDL_PointInRectFloat",
    "SDL_RectEmptyFloat",
    "SDL_RectsEqualEpsilon",
    "SDL_RectsEqualFloat",
    "SDL_main",
    "main",
    "wmain",
    "main1",
    "WinMain",
    "wWinMain",
];
