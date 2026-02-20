OUTPUT_EXECUTABLE_NAME :: "test";
#run {
    set_build_options_dc(.{do_output = false});

    root_options := get_build_options();
    w := compiler_create_workspace("Target workspace");
    options := get_build_options(w);
    copy_commonly_propagated_fields(root_options, *options);

    additional_linker_arguments: [..] string;
    array_add(*additional_linker_arguments, "-lm");
    options.additional_linker_arguments = additional_linker_arguments;
    #if CPU == .X64 {
        options.backend = .X64;
    }

    #if OS == .MACOS {
        compiler_add_library_search_directory("/opt/homebrew/lib");
    }

    options.output_executable_name = OUTPUT_EXECUTABLE_NAME;

    set_build_options(options, w);

    loop("test.jai", w);
}

loop :: (file: string, w: Workspace) {
    compiler_begin_intercept(w);
    add_build_file(file, w);

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
