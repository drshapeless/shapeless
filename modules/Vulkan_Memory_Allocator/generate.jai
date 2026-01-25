VMA_HEADER :: "source/vk_mem_alloc.h";
VMA_PATH :: "source/vk_mem_alloc.cpp";
COMPILE_LIBRARY :: true;

#run {
    set_build_options_dc(.{do_output = false});

    options := get_build_options();
    os := OS;
    cpu := CPU;

    success: bool;
    #if COMPILE_LIBRARY {
        success = compile_vma(os);
        if !success {
            compiler_set_workspace_status(.FAILED);
            return;
        }
    }

    success = generate(os);
    if !success {
        compiler_set_workspace_status(.FAILED);
    }
}

compile_vma :: (os: Operating_System_Tag) -> bool {
    log("Compiling VMA...");
    if os == {
    case .LINUX;
        make_directory_if_it_does_not_exist("linux");
        return build_cpp_dynamic_lib("linux/libvma", VMA_PATH, extra = .["-std=c++20", "-fno-exceptions", "-fno-rtti", "-Wno-nullability-completeness", "-lvulkan"]);
    case .MACOS;
        make_directory_if_it_does_not_exist("macos");
        success := build_cpp_dynamic_lib("macos/libvma", VMA_PATH, extra = .["-I/opt/homebrew/include", "-L/opt/homebrew/lib", "-std=c++20", "-fno-exceptions", "-fno-rtti", "-Wno-nullability-completeness", "-lvulkan"]);
        if !success return false;

        rpath_result := run_command("install_name_tool", "-change", "@rpath/libvulkan.1.dylib", "/opt/homebrew/lib/libvulkan.1.dylib", "macos/libvma.dylib");
        if rpath_result.exit_code != 0 {
            log_error("Failed to change Vulkan rpath");
            return false;
        }
        return true;
    case;
    assert(false);
    return false;
    }
}

generate :: (target_os: Operating_System_Tag) -> bool {
    output_filename := "bindings.jai";

    options: Generate_Bindings_Options;
    options.os = target_os;

    {
        using options;
        if target_os == {
        case .LINUX;
        array_add(*library_search_paths, "linux");
        case .MACOS;
        array_add(*library_search_paths, "macos");
        case;
        assert(false, "Vulkan Memory Allocator is not supported in this platform");
        }

        array_add(*libraries, .{filename="libvma"});

        array_add(*extra_clang_arguments, "-xc");
        array_add(*source_files, VMA_HEADER);
        array_add(*system_include_paths, ..get_default_system_include_paths());
        array_add(*system_include_paths, "/opt/homebrew/include");

        visitor = vma_visitor;
        alias_original_enum_names = false;
        log_stripped_declarations = false;
        generate_compile_time_struct_checks = false;

        generate_library_declarations = false;
        will_print_bindings = () {
            // Change the library name to be the same on all platforms
            // so that we don't have to generate identical bindings for every platform just because the library name is different.
            context.generator.libraries[0].identifier = "libvma";
        };

        footer = VMA_FOOTER;
    }

    return generate_bindings(options, output_filename);
}

available_flag_bits: Table(string, *Enum);

vma_visitor :: (decl: *Declaration, parent_decl: *Declaration) -> Declaration_Visit_Result {
    if decl.kind == .ENUM {
        en := cast(*Enum)decl;
        if contains(decl.name, "FlagBits") {
            en.flags |= .IS_ENUM_FLAGS;
            en.flags |= .VALUES_IN_HEX;

            table_add(*available_flag_bits, decl.name, en);
        }
    }

    if decl.kind == .TYPEDEF && decl.type.type_of_typedef && decl.type.type_of_typedef.name == "VkFlags" {
        flags_name := replace(decl.name, "Flags", "FlagBits");
        found, enum_decl := table_find(*available_flag_bits, flags_name);
        if found {
            type := New(CType);
            type.type_of_enum = enum_decl;
            type.size = enum_decl.type.size;
            decl.type = type;
        }
    }

    return .RECURSE;
}

VMA_FOOTER :: #string END
#if OS == .WINDOWS {
    libvma :: #library "windows/libvma";
} else #if OS == .LINUX {
    libvma :: #library "linux/libvma";
} else #if OS == .MACOS {
    libvma :: #library "macos/libvma";
} else #if OS == .ANDROID {
    libvma :: #library "android/libvma";
} else {
    #assert false "Unsupported OS";
}
END

#import "Compiler";
#import "Bindings_Generator";
#import "Basic";
#import "BuildCpp";
#import "File";
#import "Process";
#import "Hash_Table";
#import "String";
