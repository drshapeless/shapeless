AT_COMPILE_TIME :: true;

COPY_FILES :: false;

CLANG_PATH :: "clang-c";

DECLARATIONS_TO_OMIT :: string.[
    // Functions that only seem to exist in libclang for macOS
    // "clang_Cursor_getVarDeclInitializer",
    "clang_Cursor_hasVarDeclGlobalStorage",
    "clang_Cursor_hasVarDeclExternalStorage",
    // Objective-C related interfaces on macOS:
    "CXCursorVisitorBlock",
    "clang_visitChildrenWithBlock",
    "CXCursorAndRangeVisitorBlock",
    "clang_findReferencesInFileWithBlock",
    "clang_findIncludesInFileWithBlock",
    // Exist only on Linux and we don't care:
    "_CXChildVisitResult",
    "_CXCursorAndRangeVisitorBlock",
];

FOOTER :: #string DONE
#import "POSIX";
DONE

#run {
    set_build_options_dc(.{do_output = false});

    #if COPY_FILES {
        copy_directory("/opt/homebrew/opt/llvm/include/clang-c", "clang-c");
    }

    generate_bindings();
}

generate_bindings :: () -> bool {
    opts: Generate_Bindings_Options;
    using opts;

    array_add(*library_search_paths, "/opt/homebrew/llvm/lib");
    array_add(*include_paths, ".");
    array_add(*source_files,  tprint("%/Index.h", CLANG_PATH));
    array_add(*extra_clang_arguments, "-x", "c");
    array_add(*libraries, .{filename="libclang"});
    mimic_spacing_flags = Mimic_Spacing_Flags.GLOBAL;
    alias_original_enum_names = false;
    log_stripped_declarations = false;
    generate_compile_time_struct_checks = false;

    visitor_with_data = clang_visitor;
    footer = FOOTER;

    return generate_bindings(opts, "binding.jai");
}

clang_visitor :: (decl: *Declaration, parent_decl: *Declaration, user_data: *void) -> Declaration_Visit_Result {
    if !parent_decl {
        if array_find(DECLARATIONS_TO_OMIT, decl.name) {
            decl.decl_flags |= .OMIT_FROM_OUTPUT;
            return .STOP;
        }
    }

    if decl.kind == .ENUM {
        _enum := cast(*Enum)decl;
        // Clang has lots of enums that should be enum flags. Luckily, they all end in "…_Flags".
        if ends_with(decl.name, "_Flags") || decl.name == "CXCompletionContext" {
            _enum.flags |= .IS_ENUM_FLAGS;
            _enum.flags |= .VALUES_IN_HEX;
        }

        // Move ...First and ...Last declarations to the end
        first_last: [..]*Declaration;
        defer array_reset(*first_last);
        for _enum.enumerates {
            if starts_with(it.output_name, "First") || starts_with(it.output_name, "Last") {
                array_add(*first_last, it);
                remove it;
            }
        }
        array_add(*_enum.enumerates, ..first_last);

        // Normalize names that were changed between different versions of libclang
        // so that we don't have to maintain different code paths of the Bindings_Generator for older and newer libclang versions.
        // This can be removed once certain console vendors update the libclang versions they ship.
        // -rluba, 2025-08-15
        if decl.name == "CXCursorKind" {
            for _enum.enumerates {
                if it.output_name == "OMPArraySectionExpr" {
                    it.output_name = "ArraySectionExpr";
                }
            }
        }
    }


    return .RECURSE;
}

#import "Compiler";
#import "Basic";
#import "Bindings_Generator";
#import "File";
#import "File_Utilities";
#import "String";
