#run {
    set_build_options_dc(.{do_output = false});
    // generate_msdf("/System/Library/Fonts/Menlo.ttc", 0.1, 64, "./assets/font");
    generate_msdf("/usr/share/fonts/hack/Hack-Bold.ttf", 0.25, 64, "./assets/font");
}

generate_msdf :: (file_path: string, em_range: float, size: int, output_directory: string) -> bool {
    filename := path_filename(file_path);

    output_image := tprint("%/%.png", output_directory, path_strip_extension(filename));
    output_json  := tprint("%/%.json", output_directory, path_strip_extension(filename));

    msdf_command := string.[
    "msdf-atlas-gen",
    "-type", "mtsdf",  // Actually, msdf is enough
    "-allglyphs",      // Because I am using harfbuzz
    "-yorigin", "top", // Vulkan NDC, origin in top left corner
    "-font", file_path,
    "-format", "png",
    "-emrange", tprint("%", em_range),
    "-size", tprint("%", size),
    "-imageout", output_image,
    "-json", output_json
    ];

    log("Generating % msdf (%)", filename, msdf_command);

    result := run_command(..msdf_command);
    if result.exit_code != 0 {
        return false;
    }

    return true;
}

#scope_file
#import "Process";
#import "File_Utilities";
#import "File";
#import "Basic";
#import "String";
#import "Compiler";
