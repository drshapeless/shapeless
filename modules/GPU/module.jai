// The GPU module is a very minimalistic GPU API targeting very new
// hardware. It uses Metal 4 on macOS, and Vulkan 1.4 on Linux. Windows platform is not tested, should works under Vulkan.

#if OS == .MACOS {
    #load "macos/macos.jai";
} else {
    #load "vulkan.jai";
}
