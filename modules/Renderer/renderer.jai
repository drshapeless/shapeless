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

init :: (renderer: *Renderer, vk_get_proc_address: *void, instance_extensions: [] *u8, enable_validation_layers: bool, vka: *VkAllocationCallbacks = null) -> success:ok {
    vk_load_global_functions(vk_get_proc_address);

    renderer.vka = vka;
    using renderer;
    // Create instance
    success:, instance = make_instance(instance_extensions, enable_validation_layers, vka);
    if !success return false;

    vk_load_instance_functions(instance);


}

#scope_file
// Initialization helpers
application_info :: VkApplicationInfo.{
    pApplicationName   = "Shapeless",
    applicationVersion = #run VK_MAKE_API_VERSION(0, 1, 0, 0),
    pEngineName        = "Shapeless Engine",
    engineVersion      = #run VK_MAKE_API_VERSION(0, 1, 0, 0),
    apiVersion         = VK_API_VERSION_1_4
};

validation_layers :: (*u8).["VK_LAYER_KHRONOS_validation"];

make_instance_create_info :: (instance_extensions: [] *u8, enable_validation_layers: bool) -> VkInstanceCreateInfo {
    return .{
        pApplicationName = "Shapeless",
        applicationVersion = #run VK_MAKE_API_VERSION(0, 1, 0, 0),
        pEngineName        = "Shapeless Engine",
        engineVersion      = #run VK_MAKE_API_VERSION(0, 1, 0, 0),
        apiVersion         = VK_API_VERSION_1_4
    };
}

make_instance :: (instance_extensions: [] *u8, enable_validation_layers: bool, vka: *VkAllocationCallbacks) -> success:bool, VkInstance {
    info := make_instance_create_info(instance_extensions, enable_validation_layers);
    instance: VkInstance;
    result := check_vk(vkCreateInstance(*info, vka, *instance));
    return result == .SUCCESS, instance;
}

#import "Vulkan";
#import "Vulkan_Memory_Allocator";
