#run {
    set_build_options_dc(.{do_output = false});

    start_time := current_time_monotonic();

    for file_list("shaders") {
        if ends_with(it, ".slang") {
            if !compile_slang(it, "shaders") {
                return;
            }
        }
    }

    end_time := current_time_monotonic();
    log("Shader compilation succeeded in % seconds", to_float64_seconds(end_time - start_time));
}

compile_slang :: (shader_path: string, output_directory: string) -> bool {
    filename := path_filename(shader_path);

    output_path := tprint("%/%.spv", output_directory, filename);
    compiler_command := string.[
"slangc",
shader_path,
"-target", "spirv",
"-profile", "spirv_1_6",
"-emit-spirv-directly",
"-fvk-use-entrypoint-name",
"-fvk-use-scalar-layout",
"-std", "2026",
"-capability", "spvDescriptorHeapEXT",
"-o", output_path];
    log("Compiling % to % (%)", filename, output_path, get_quoted_command_string(compiler_command));
    result := run_command(..compiler_command);
    if result.exit_code != 0 {
        return false;
    }

    return true;
}

#import "Compiler";
#import "Basic";
#import "File";
#import "Process";
#import "File_Utilities";
#import "String";
