#if OS == .MACOS {
    #load "macos/bindings.jai";
} else #if OS == .LINUX {
    #load "linux/bindings.jai";
}
