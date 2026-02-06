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

    FOOTER :: #string EOF
libicuuc :: #library,system "libicuuc";
libicui18n :: #library,system "libicui18n";
EOF;

    opts.footer = FOOTER;
    opts.generate_library_declarations = false;

    array_add(*opts.libraries, .{filename = "libicuuc"});
    array_add(*opts.libraries, .{filename = "libicui18n"});

    // For whatever reason, char16_t is not automatically unwrap in
    // the generator.
    array_add(*opts.typedef_prefixes_to_unwrap, "char16_t");

    #if OS == .LINUX {
        output_filename = "linux/linux.jai";

    } else #if OS == .MACOS {
        output_filename = "macos/macos.jai";
        array_add(*opts.library_search_paths, "/opt/homebrew/lib");
    } else {
        assert(false, "the OS % is currently unsupported. You might be able to add support for it though!", OS);
    }

    array_add(*opts.include_paths, "include");
    array_add(*opts.source_files, "include/unicode/ubidi.h");
    array_add(*opts.source_files, "include/unicode/uscript.h");
    array_add(*opts.source_files, "include/unicode/utypes.h");
    array_add(*opts.source_files, "include/unicode/utf8.h");
    array_add(*opts.source_files, "include/unicode/ustring.h");
    array_add(*opts.source_files, "include/unicode/ubrk.h");
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
