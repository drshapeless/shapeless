OUTPUT_EXECUTABLE_NAME := "shapeless";

#run {
    set_build_options_dc(.{do_output = false});

    root_options := get_build_options();
    w := compiler_create_workspace("Target workspace");
    options := get_build_options(w);
    copy_commonly_propagated_fields(root_options, *options);
    options.output_executable_name = OUTPUT_EXECUTABLE_NAME;
    set_build_options(options, w);

    loop("src/main.jai", w);

    compile_dll("jacky", root_options);
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

compile_dll :: (name: string, root_options: Build_Options) {
    w := compiler_create_workspace(sprint("% dll workspace", name));
    options := get_build_options(w);
    copy_commonly_propagated_fields(root_options, *options);
    options.output_executable_name = name;
    options.output_type = .DYNAMIC_LIBRARY;
    set_build_options(options, w);
    loop(sprint("%.jai", name), w);
}

#import "Compiler";
#import "Basic";
