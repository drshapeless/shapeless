OUTPUT_EXECUTABLE_NAME := "shapeless";

#run {
    set_build_options_dc(.{do_output = false});

    root_options := get_build_options();
    w := compiler_create_workspace("Target workspace");
    options := get_build_options(w);
    copy_commonly_propagated_fields(root_options, *options);
    options.output_executable_name = OUTPUT_EXECUTABLE_NAME;
    make_directory_if_it_does_not_exist("bin");
    options.output_path = "bin";
    linker_arguments: [..]string;

    // This line fixes
    // error: undefined symbol: ___isPlatformVersionAtLeast
    // array_add(*linker_arguments, "/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/clang/21/lib/darwin/libclang_rt.osx.a");
    //
    // However, if the compiled SDL static library is targeting newer
    // than OSX 13, the error will go away.
    options.additional_linker_arguments = linker_arguments;

    // This is to subpress the error of linking mismatch library version.
    options.minimum_os_version = .{26, 0};

    import_paths: [..]string;
    array_add(*import_paths, ..options.import_path);
    array_add(*import_paths, "modules");

    compiler_add_library_search_directory("/usr/local/lib");
    compiler_add_library_search_directory("/opt/homebrew/lib");

    set_build_options(options, w);

    loop(w);
}

loop :: (w: Workspace) {
    compiler_begin_intercept(w);
    add_build_file("src/main.jai", w);

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
#import "File";
