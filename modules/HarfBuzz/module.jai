#if OS == .MACOS {
    #load "macos/bindings.jai";
    #import "Objective_C";

    #import "freetype";
} else #if OS == .LINUX {
    #load "linux/bindings.jai";
}
