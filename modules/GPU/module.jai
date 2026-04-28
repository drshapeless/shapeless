#module_parameters(
    MOLTENVK := false,
    VALIDATION  := false
);

Memory_Type :: enum {
    DEFAULT; // This is rebar
    GPU;
    READBACK;
}

#if OS == .LINUX {
    #load "vulkan_implementation.jai";
} else if OS == .MACOS {
    #load "metal_implementation.jai";
}
