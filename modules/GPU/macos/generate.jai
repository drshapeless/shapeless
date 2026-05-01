#run {
    set_build_options_dc(.{do_output = false});

    ok: bool;
    // Generating a static library is a must, otherwise the linking
    // would result in rpath error.
    ok = build_cpp_static_lib("libmetal", "metal.m", extra = .["-fmodules"], compiler_executable_path = "clang");
    // Generating a dynamic library, on the other hand is purely for
    // binding generation.
    ok = build_cpp_dynamic_lib("libmetal", "metal.m", extra = .["-fmodules"], compiler_executable_path = "clang");
    assert(ok);

    binding_options: Generate_Bindings_Options;
    array_add(*binding_options.libraries, .{filename = "libmetal"});
    array_add(*binding_options.source_files, "metal.h");
    generate_bindings(binding_options, "binding.jai");

}

#import "Compiler";
#import "Basic";
#import "BuildCpp";
#import "Bindings_Generator";
