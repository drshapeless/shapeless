OUTPUT_EXECUTABLE_NAME := "shapeless";

#run {
    set_build_options_dc(.{do_output = false});

    if !compile_shaders() {
        log("Failed to compile shaders");
        exit(-1);
    }

    root_options := get_build_options();
    w := compiler_create_workspace("Target workspace");
    options := get_build_options(w);

    additional_linker_arguments: [..] string;
    array_add(*additional_linker_arguments, "-lm");
    options.additional_linker_arguments = additional_linker_arguments;

    copy_commonly_propagated_fields(root_options, *options);
    options.output_executable_name = OUTPUT_EXECUTABLE_NAME;

    #if OS == .MACOS {
        log("This is mac" );
        compiler_add_library_search_directory("/opt/homebrew/lib");
        make_directory_if_it_does_not_exist("macos");
        copy_file("modules/Vulkan_Memory_Allocator/macos/libvma.dylib", "macos/libvma.dylib");
    }

    set_build_options(options, w);

    loop("src/main.jai", w);

    #if OS == .MACOS {
        run_command("install_name_tool", "-add_rpath", "/opt/homebrew/lib", OUTPUT_EXECUTABLE_NAME);
    }
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
    options.dead_code_elimination = .ALL;
    set_build_options(options, w);
    loop(sprint("%.jai", name), w);
}

#import "Compiler";
#import "Basic";
#import "File_Utilities";
#import "File";
#import "Process";
#load "shader_compilation.jai";
