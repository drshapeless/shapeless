OUTPUT_EXECUTABLE_NAME := "generate_metal";

#run {
    set_build_options_dc(.{do_output = false});

    root_options := get_build_options();
    w := compiler_create_workspace("Target workspace");
    options := get_build_options(w);
    copy_commonly_propagated_fields(root_options, *options);
    options.output_executable_name = OUTPUT_EXECUTABLE_NAME;

    import_paths: [..] string;
    array_add(*import_paths, ..options.import_path);
    array_add(*import_paths, "../");

    options.import_path = import_paths;

    compiler_add_library_search_directory("/opt/homebrew/opt/llvm/lib");

    set_build_options(options, w);

    compiler_begin_intercept(w);
    add_build_file("generate.jai", w);

    while true {
        message := compiler_wait_for_message();
        if message.kind == {
            case .COMPLETE;
                mc := cast(*Message_Complete) message;
                if mc.error_code != .NONE {
                    exit(1);
                }
                break;
        }
    }

    compiler_end_intercept(w);
}

#import "Compiler";
#import "Basic";
