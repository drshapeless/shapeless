Renderer :: struct {
    vka:             *VkAllocationCallbacks;
    instance:        VkInstance;
    surface:         VkSurfaceKHR;
    debug_messenger: VkDebugUtilsMessengerEXT;
    physical_device: VkPhysicalDevice;
    device:          VkDevice;
    queue_indices:   Queue_Family_Indices;
    graphics_queue:  VkQueue;
    present_queue:   VkQueue;
    vma:             VmaAllocator;

    command_pool:    VkCommandPool;
    descriptor_set_layout: VkDescriptorSetLayout;

    Queue_Family_Indices :: struct {
        graphics: u32;
        present:  u32;
    }

}


#import "Vulkan";
#import "Vulkan_Memory_Allocator";
