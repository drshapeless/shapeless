#module_parameters(VALIDATION := true);

ENABLED_DEVICE_EXTENSION_NAMES :: (*u8).[VK_EXT_EXTENDED_DYNAMIC_STATE_3_EXTENSION_NAME];

SWAPCHAIN_SURFACE_FORMAT : VkFormat : .B8G8R8A8_UNORM;
SWAPCHAIN_COLOR_SPACE    : VkColorSpaceKHR : .SRGB_NONLINEAR;
SWAPCHAIN_IMAGE_USAGE    : VkImageUsageFlags : .TRANSFER_DST | .COLOR_ATTACHMENT;

#load "renderer.jai";

#scope_file
#import "Vulkan";
#import "Vulkan_Memory_Allocator";
#import "SDL3";
#import "Math";
#import "Compiler";
#import "System";
#import "Basic";
