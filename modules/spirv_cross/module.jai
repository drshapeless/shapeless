#if OS == .MACOS {
    #load "macos.jai";
    libspirv_cross :: #library,no_dll "libspirv-cross";
} else #if OS == .LINUX {
    #load "linux.jai";
}

SPVC_MAKE_MSL_VERSION :: (major: u32, minor: u32, patch: u32) -> u32 {
    return major * 10000 + minor * 100 + patch;
}
