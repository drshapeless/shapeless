#run {
    set_build_options_dc(.{do_output=false});

    options := get_build_options();
    args := options.compile_time_command_line;

    if !generate_bindings() {
        compiler_set_workspace_status(.FAILED);
        return;
    }
}

generate_bindings :: () -> bool {
    output_filename: string = "bindings.jai";
    opts: Generate_Bindings_Options;
    opts.strip_flags = .FUNCTIONS_WITH_VALIST;

    FOOTER :: #string EOF
libharfbuzz :: #library,system "libharfbuzz";
EOF;

    opts.footer = FOOTER;
    opts.generate_library_declarations = false;

    array_add(*opts.libraries, .{filename = "libharfbuzz"});

    #if OS == .LINUX {
    } else #if OS == .MACOS {
        array_add(*opts.library_search_paths, "/opt/homebrew/lib");
    } else {
        assert(false, "the OS % is currently unsupported. You might be able to add support for it though!", OS);
    }

    array_add(*opts.include_paths, "include");
    array_add(*opts.source_files, "include/harfbuzz/hb.h");
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
#import "String";
