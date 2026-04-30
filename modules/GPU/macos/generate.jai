#run {
    set_build_options_dc(.{do_output = false});

    ok: bool;
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
