do_update_headers :: true;
do_copy_libraries :: true;

#run {
    set_build_options_dc(.{do_output=false});

    options := get_build_options();
    args := options.compile_time_command_line;

    #if do_update_headers {
        update_headers();
    }
    #if do_copy_libraries {
        copy_dynamic_libraries();
    }

    if !generate_bindings() {
        compiler_set_workspace_status(.FAILED);
        return;
    }
}

update_headers :: () {
    delete_directory("include/harfbuzz");
    make_directory_if_it_does_not_exist("include/harfbuzz");

    prefix: string;
    #if OS == .MACOS {
        prefix = "/opt/homebrew/include";
    } else #if OS == .LINUX {
        prefix = "/usr/include";
    }

    copy_directory(tprint("%/harfbuzz", prefix), "include/harfbuzz");
}

copy_dynamic_libraries :: () {
    #if OS == .MACOS {
        copy_file("/opt/homebrew/lib/libharfbuzz.dylib", "macos/libharfbuzz.dylib");
    } else #if OS == .LINUX {
        copy_file("/usr/lib64/libharfbuzz.so.0", "linux/libharfbuzz.so");
    }
}

generate_bindings :: () -> bool {
    output_filename: string;
    opts: Generate_Bindings_Options;
    opts.strip_flags = .FUNCTIONS_WITH_VALIST;

    FOOTER :: #string EOF
libharfbuzz :: #library "libharfbuzz";
EOF;
    #if OS == .MACOS {
        make_directory_if_it_does_not_exist("macos");
        output_filename = "macos/bindings.jai";
        array_add(*opts.library_search_paths, "macos");

    } else #if OS == .LINUX {
        make_directory_if_it_does_not_exist("linux");
        output_filename = "linux/bindings.jai";
        array_add(*opts.library_search_paths, "linux");

    }

    opts.footer = FOOTER;
    opts.generate_library_declarations = false;

    array_add(*opts.libraries, .{filename = "libharfbuzz"});
    array_add(*opts.system_include_paths, "/usr/include/freetype2");
    array_add(*opts.system_include_paths, "/usr/lib/clang/22/include");

    array_add(*opts.include_paths, "include");
    array_add(*opts.source_files, "include/harfbuzz/hb.h");
    array_add(*opts.source_files, "include/harfbuzz/hb-ft.h");
    opts.visitor = visitor;
    opts.generate_compile_time_struct_checks = false;

    return generate_bindings(opts, output_filename);
}

visitor :: (decl: *Declaration, parent_decl: *Declaration) -> Declaration_Visit_Result {
    if parent_decl && parent_decl.name == "hb_script_t" {
        decl.output_name = replace(decl.name, "HB_SCRIPT_", "");
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
