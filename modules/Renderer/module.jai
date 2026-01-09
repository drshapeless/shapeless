Renderer :: struct {
    instance: VkInstance;

    surface: VkSurfaceKHR;
    physical_device: VkPhysicalDevice;
    device: VkDevice;

}

init :: (using renderer: *Renderer) {

}

#scope_file
#import "Vulkan";
