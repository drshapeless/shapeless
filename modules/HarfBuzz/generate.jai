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
    output_filename: string;
    opts: Generate_Bindings_Options;
    opts.strip_flags = .FUNCTIONS_WITH_VALIST;

    #if OS == .LINUX {
        output_filename = "linux/linux.jai";

        FOOTER :: #string EOF
libharfbuzz :: #library,system "libharfbuzz.so.0";
EOF;

        opts.footer = FOOTER;

        opts.generate_library_declarations = false;

        array_add(*opts.libraries, .{filename = "libharfbuzz.so.0"});
    } else #if OS == .MACOS {
        output_filename = "macos/macos.jai";

        FOOTER :: #string EOF
libharfbuzz :: #library,system "libharfbuzz";
EOF;

        array_add(*opts.library_search_paths, "/opt/homebrew/lib");

        opts.footer = FOOTER;
        opts.generate_library_declarations = false;
        array_add(*opts.libraries, .{filename = "libharfbuzz"});
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
