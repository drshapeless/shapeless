// spirv_cross is installed via vulkan sdk

PATH :: "spirv_cross";

FOOTER :: #string DONE
#import "POSIX";
DONE

#run {
    set_build_options_dc(.{do_output = false});

    generate_bindings();
}

generate_bindings :: () -> bool {
    opts: Generate_Bindings_Options;
    using opts;

    // array_add(*library_search_paths, "/usr/local/lib");
    array_add(*system_library_search_paths, "/usr/local/lib");
    array_add(*include_paths, ".");
    array_add(*source_files, tprint("%/spirv_cross_c.h", PATH));
    array_add(*extra_clang_arguments, "-x", "c");
    array_add(*system_libraries, .{filename="libspirv-cross-c-shared", identifier="libspirv_cross"});
    // generated_library_path_prefix = "/usr/local/lib";
    mimic_spacing_flags = Mimic_Spacing_Flags.GLOBAL;
    alias_original_enum_names = false;
    log_stripped_declarations = false;
    generate_compile_time_struct_checks = false;
    visitor_with_data = spirv_cross_visitor;
    // footer = FOOTER;
    generate_library_declarations = false;

    output_filename: string = "binding.jai";
    #if OS == .MACOS {
        output_filename = "macos.jai";
    } else #if OS == .LINUX {
        output_filename = "linux.jai";
    }

    return generate_bindings(opts, output_filename);
}

spirv_cross_visitor :: (decl: *Declaration, parent_decl: *Declaration, user_data: *void) -> Declaration_Visit_Result {
    return .RECURSE;
}

#import "Compiler";
#import "Basic";
#import "Bindings_Generator";
#import "File";
#import "File_Utilities";
#import "String";
