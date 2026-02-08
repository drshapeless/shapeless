SOURCE_PATH :: "source";
LIB_BASE_NAME :: "stb_truetype";

#run {
    set_build_options_dc(.{do_output=false});
    options := get_build_options();
    args := options.compile_time_command_line;
    if !generate_bindings(args) {
        compiler_set_workspace_status(.FAILED);
    }
}

generate_bindings :: (args: [] string) -> bool {
    using BG;
    compile := array_find(args, "-compile");
    compile_debug  := array_find(args, "-debug");

    os_target  := OS;
    cpu_target := CPU;

    build_dynamic_lib := true;
    lib_directory: string;

    if os_target == {
    case .LINUX;
        lib_directory = "linux";
    case .MACOS;
        lib_directory = "macos";
    case;
        assert(false);
    }

    if compile {
        source_file := tprint("%/stb_truetype.c", SOURCE_PATH);
        make_directory_if_it_does_not_exist(lib_directory, recursive = true);

        lib_path := tprint("%/%", lib_directory, LIB_BASE_NAME);
        success := true;
        if os_target == .MACOS {
            success &&= Build_Cpp.build_universal_macos_binary(lib_path, source_file, type = .DYNAMIC_LIBRARY, debug = compile_debug);
            success &&= Build_Cpp.build_universal_macos_binary(lib_path, source_file, type = .STATIC_LIBRARY, debug = compile_debug);
        } else {
            extra: [..] string;
            if os_target != .WINDOWS {
                array_add(*extra, "-fPIC");
            }

            if build_dynamic_lib {
                success &&= Build_Cpp.build_cpp_dynamic_lib(lib_path, source_file, target = os_target, debug = compile_debug, extra = extra);
            }
            success &&= Build_Cpp.build_cpp_static_lib(lib_path, source_file, target = os_target, debug = compile_debug, extra = extra);
        }

        if !success     return false;
    }
    options: Generate_Bindings_Options;
    options.os = os_target;
    options.cpu = cpu_target;
    {
        using options;

        array_add(*library_search_paths, lib_directory);
        array_add(*libraries, .{filename=LIB_BASE_NAME});
        array_add(*source_files, tprint("%/stb_truetype.h", SOURCE_PATH));

        array_add(*typedef_prefixes_to_unwrap, "stbir_");
        array_add(*generate_enums_from_macros_with_prefixes, "STBIR_FLAG");

        generate_library_declarations = false;
        footer = tprint(FOOTER_TEMPLATE, LIB_BASE_NAME);

        auto_detect_enum_prefixes = true;
        log_stripped_declarations = false;
        generate_compile_time_struct_checks = false;

        visitor = stb_visitor;
    }

    output_filename := "bindings.jai";
    return generate_bindings(options, output_filename);
}

FOOTER_TEMPLATE :: #string END

#if OS == .WINDOWS {
    %1 :: #library "windows/%1";
} else #if OS == .LINUX {
    %1 :: #library "linux/%1";
} else #if OS == .MACOS {
    %1 :: #library "macos/%1";
} else #if OS == .ANDROID {
    #if CPU == .X64 {
        %1 :: #library "android/x64/%1";
    } else #if CPU == .ARM64 {
        %1 :: #library "android/arm64/%1";
    }
} else #if OS == .PS5 {
    %1 :: #library "ps5/%1";
} else #if OS == .NN_SWITCH2 {
    #if CPU == .X64 {
        %1 :: #library "windows/%1";
    } else #if CPU == .ARM64 {
        %1 :: #library "switch2/%1";
    }
} else {
    #assert false;
}

END

stb_visitor :: (decl: *BG.Declaration, parent_decl: *BG.Declaration) -> BG.Declaration_Visit_Result {
    using BG;

    if decl.kind == .ENUM && decl.output_name == "STBIR_FLAG" {
        decl.output_name = "Resize_Flags"; // To keep compatibility with the old manual bindings.
        en := cast(*Enum)decl;
        en.flags |= .IS_ENUM_FLAGS;
        en.type = context.generator.type_def_s32;
        // en.flags |= .VALUES_IN_HEX;
    }

    if parent_decl && parent_decl.kind == .FUNCTION && decl.kind == .DECLARATION && decl.name == "flags" {
        change_type_to_enum(decl, "STBIR_FLAG");
    }

    return .RECURSE;
}

#import "Basic";
BG :: #import "Bindings_Generator";
Build_Cpp :: #import "BuildCpp";
#import "Compiler";
#import "File";
