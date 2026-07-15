main :: () {
    sdk_path := get_macos_sdk_path();
    framework_path := sprint("%/System/Library/Frameworks", sdk_path);
    metal_headers := sprint("%/Metal.framework/Headers", framework_path);
    quartzcore_headers := sprint("%/QuartzCore.framework/Headers", framework_path);

    metal_path := sprint("%/Metal.h", metal_headers);
    ca_metal_layer_path := sprint("%/CAMetalLayer.h", quartzcore_headers);

    options: Objc_Generate_Bindings_Options;
    options.export_library_name = "Metal";
    array_add(*options.headers, metal_path, ca_metal_layer_path);
    options.visitor = my_visitor;

    generate_bindings(options);
}

my_visitor :: (cursor: Objc_Cursor, parent: Objc_Cursor, client_data: *void) -> Objc_Generate_Result {
    if !begins_with(cursor.name, "MTL") && !begins_with(cursor.name, "CAMetal") return .STOP;
    return .RECURSE;
}

#import "Objc_Bindings_Generator";
#import "macOS/Toolchain";
#import "Basic";
#import "String";
