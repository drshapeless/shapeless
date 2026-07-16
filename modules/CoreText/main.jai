main :: () {
    // sdk_path := get_macos_sdk_path();
    // framework_path := sprint("%/System/Library/Frameworks", sdk_path);
    // coretext_headers := sprint("%/CoreText.Framework/Headers", framework_path);

    // path := sprint("%/CoreText.h", coretext_headers);

    options: Objc_Generate_Bindings_Options;
    options.export_library_name = "CoreText";
    // array_add(*options.headers, path);
    array_add(*options.frameworks, "CoreText");
    options.visitor = my_visitor;

    generate_bindings(options, "bindings.jai");
}

my_visitor :: (cursor: Objc_Cursor, parent: Objc_Cursor, client_data: *void) -> Objc_Generate_Result {
    if !begins_with(cursor.name, "CT") return .STOP;
    return .RECURSE;
}

#import "Objc_Bindings_Generator";
#import "macOS/Toolchain";
#import "Basic";
#import "String";
