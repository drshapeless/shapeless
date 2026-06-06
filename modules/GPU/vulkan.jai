GPU_Context :: struct {
    sdl_window: *SDL_Window;
    instance: VkInstance;
    device: VkDevice;
    vka: *VkAllocationCallbacks;
    surface: VkSurfaceKHR;
    queue_indices: Queue_Family_Indices;
    physical_device: VkPhysicalDevice;
    memory_indices: Memory_Indices;
}

Allocation :: struct {
    cpu: *void;
    gpu: u64;
    offset: u64;
    memory: VkDeviceMemory;
    // Should I also put a mapped VkBuffer here? Currently I
    // deallocate the buffer after getting its address. Also, should I
    // keep the size of the allocation here or leave the user to do.
}

Texture :: struct {
    image: VkImage;
    view: VkImageView;
}

init :: (window: *SDL_Window = null) {
    context.gpu_context = Basic.alloc(size_of(GPU_Context));
    using context.gpu_context;
    get_instance_proc_addr := SDL_Vulkan_GetVkGetInstanceProcAddr();
    Basic.assert(get_instance_proc_addr != null);

    vk_load_global_functions(xx get_instance_proc_addr);

    result: VkResult;
    result, instance = make_instance();

    vk_load_instance_functions(instance);

    device_extensions: [..] *u8;
    device_extensions.allocator = Basic.temp;
    Basic.array_add(*device_extensions, ..DEVICE_EXTENSIONS);
    if window {
        sdl_window = window;
        ok := SDL_Vulkan_CreateSurface(window, instance, vka, *surface);
        Basic.assert(ok);
        Basic.array_add(*device_extensions, VK_KHR_SWAPCHAIN_EXTENSION_NAME);
    }

    physical_device, queue_indices = choose_physical_device(instance, surface, device_extensions);
    if !physical_device {
        Basic.log_error("Vulkan failed to find physical device");
        deinit();
        return;
    }

    result, device = make_device(device_extensions);
    if result {
        Basic.log_error("Vulkan failed to create device");
        deinit();
        return;
    }
    vk_load_device_functions(device);

    memory_indices = get_memory_indices();
}

deinit :: () {
    using context.gpu_context;
    if device {
        vkDestroyDevice(device, vka);
    }

    if surface {
        SDL_Vulkan_DestroySurface(instance, surface, vka);
    }

    if instance {
        vkDestroyInstance(instance, vka);
    }
    Basic.free(context.gpu_context);
}

// This only allocates shared memory (rebar).
alloc :: (bytes: u64) -> Allocation {
    using context.gpu_context;
    buffer: VkBuffer;
    buffer_create_info := VkBufferCreateInfo.{
        flags = 0,
        size = bytes,
        usage = .SHADER_DEVICE_ADDRESS | .STORAGE_BUFFER | .TRANSFER_DST | .TRANSFER_SRC,
        sharingMode = .EXCLUSIVE,
    };
    result: VkResult;
    result = check_vk(vkCreateBuffer(device, *buffer_create_info, vka, *buffer));
    Basic.assert(result == .SUCCESS);
    defer vkDestroyBuffer(device, buffer, vka);

    memory_requirements: VkMemoryRequirements;
    vkGetBufferMemoryRequirements(device, buffer, *memory_requirements);

    memory_allocate_flags := VkMemoryAllocateFlagsInfo.{
        flags = .DEVICE_ADDRESS,
    };
    allocation_info := VkMemoryAllocateInfo.{
        pNext = *memory_allocate_flags,
        allocationSize = memory_requirements.size,
        memoryTypeIndex = memory_indices.shared,
    };

    memory: VkDeviceMemory;
    result = check_vk(vkAllocateMemory(device, *allocation_info, vka, *memory));
    Basic.assert(result == .SUCCESS);

    result = check_vk(vkBindBufferMemory(device, buffer, memory, 0));
    Basic.assert(result == .SUCCESS);

    address_info := VkBufferDeviceAddressInfo.{
        buffer = buffer
    };

    allocation: Allocation;
    allocation.gpu = vkGetBufferDeviceAddress(device, *address_info);

    check_vk(vkMapMemory(device, memory, 0, memory_requirements.size, 0, *allocation.cpu));
    Basic.assert(result == .SUCCESS);
    allocation.memory = memory;

    return allocation;
}

free :: (allocation: Allocation) {
    using context.gpu_context;
    if allocation.memory {
        vkFreeMemory(device, allocation.memory, vka);
    }
}

texture_size_align :: (desc: Texture_Desc) -> Texture_Size_Align {
    using context.gpu_context;
    image_create_info := to_vulkan_image_create_info(desc);

    image_memory_requirements := VkDeviceImageMemoryRequirements.{
        pCreateInfo = *image_create_info,
    };

    memory_requirements: VkMemoryRequirements2;

    vkGetDeviceImageMemoryRequirements(device, *image_memory_requirements, *memory_requirements);

    size_align := Texture_Size_Align.{
        size = memory_requirements.memoryRequirements.size,
        align = memory_requirements.memoryRequirements.alignment,
    };

    return size_align;
}

create_texture :: (desc: Texture_Desc, allocation: Allocation) -> Texture {
    using context.gpu_context;
    image_create_info := to_vulkan_image_create_info(desc);
    texture: Texture;
    result: VkResult;
    result = check_vk(vkCreateImage(device, *image_create_info, vka, *texture.image));
    return_if_error(result, Texture.{});

    result = check_vk(vkBindImageMemory(device, texture.image, allocation.memory, allocation.offset));
    return_if_error(result, Texture.{});

    return texture;
}

#scope_file
application_info :: VkApplicationInfo.{
    pApplicationName = "shapeless",
    applicationVersion = #run VK_MAKE_API_VERSION(0, 0, 1, 0),
    pEngineName = "shapeless",
    engineVersion = #run VK_MAKE_API_VERSION(0, 0, 1, 0),
    apiVersion = VK_API_VERSION_1_4,
};

VALIDATION_LAYERS :: (*u8).["VK_LAYER_KHRONOS_validation"];
DEVICE_EXTENSIONS :: (*u8).[
VK_EXT_SHADER_OBJECT_EXTENSION_NAME,
];

return_if_error :: (result: VkResult) #expand {
    if result != .SUCCESS {
        #if DEBUG_ASSERT {
            debug_break();
        }
        `return;
    }
}

return_if_error :: (result: VkResult, v: $T) #expand {
    if result != .SUCCESS {
        #if DEBUG_ASSERT {
            debug_break();
        }
        `return v;
    }
}

// Stolen from JBlow's Vulkan_Renderer
// Generic api result logging helper, useful for Khronos apis
check_api_result :: (result: $Result, api: string, $call := #caller_code, loc := #caller_location) -> Result {
    call_string :: #run -> string {
        root := Compiler.compiler_get_nodes(call);

        if root.kind == {
        case .PROCEDURE_CALL;
            proc_call := cast(*Compiler.Code_Procedure_Call) root;
            expression := proc_call.arguments_sorted[0];

            if expression.kind != .PROCEDURE_CALL {
                return "";
            }

            call := cast(*Compiler.Code_Procedure_Call) expression;
            if call.procedure_expression.kind != .IDENT {
                return "";
            }

            return (cast(*Compiler.Code_Ident) call.procedure_expression).name;

        case .IDENT;
            return (cast(*Compiler.Code_Ident) root).name;

        case;
            return "";
        }
    };

    if result != .SUCCESS {
        action := ifx call_string else api;

        result_string: string;
        {
            info := type_info(VkResult);
            for info.values {
                if xx result == it {
                    result_string = info.names[it_index];
                    break;
                }
            }
        }
        printed_result := ifx result_string
            then cast(Any) result_string
            else cast(Any) result;
        Basic.log_error("% '%' failed: %", api, action, printed_result, loc = loc);
        return result;
    }
    return .SUCCESS;
}

check_vk :: (result: VkResult, $call := #caller_code, loc := #caller_location) -> VkResult {
    return check_api_result(result, "Vulkan call", call, loc);
}

get_vk_instance_extensions :: () -> [] *u8 {
    instance_extensions: [..]*u8;
    instance_extension_count: u32;
    instance_extension_data := SDL_Vulkan_GetInstanceExtensions(*instance_extension_count);

    for 0..instance_extension_count - 1 {
        Basic.array_add(*instance_extensions, instance_extension_data[it]);
    }
    Basic.array_add(*instance_extensions, VK_EXT_DEBUG_UTILS_EXTENSION_NAME);

    return instance_extensions;
}

debug_utils_callback :: (messageSeverity: VkDebugUtilsMessageSeverityFlagBitsEXT, messageTypes: VkDebugUtilsMessageTypeFlagsEXT, pCallbackData: *VkDebugUtilsMessengerCallbackDataEXT, pUserData: *void) -> VkBool32 #c_call {
    push_context {
        if messageSeverity == {
        case .VERBOSE;
            ;
        case .INFO;
            ;
        case .WARNING;
            Basic.log("[WARN ] %", to_string(pCallbackData.pMessage));
        case .ERROR;
            Basic.log("[ERROR] %", to_string(pCallbackData.pMessage));
        }

    }
    return VK_FALSE;
}

debug_utils_messenger_create_info :: VkDebugUtilsMessengerCreateInfoEXT.{
    messageSeverity = .VERBOSE | .INFO | .WARNING | .ERROR,
    messageType     = .GENERAL | .VALIDATION | .PERFORMANCE,
    pfnUserCallback = debug_utils_callback
};

make_instance :: () -> VkResult, VkInstance {
    using context.gpu_context;
    instance_extensions := get_vk_instance_extensions();
    instance_create_info := VkInstanceCreateInfo.{
        pNext = *debug_utils_messenger_create_info,
        flags = 0,
        pApplicationInfo = *application_info,
        enabledExtensionCount = xx instance_extensions.count,
        ppEnabledExtensionNames = xx instance_extensions.data,
    };

    #if VALIDATION {
        instance_create_info.enabledLayerCount = xx VALIDATION_LAYERS.count;
        instance_create_info.ppEnabledLayerNames = VALIDATION_LAYERS.data;
    }

    my_instance: VkInstance;
    result := check_vk(vkCreateInstance(*instance_create_info, vka, *my_instance));
    return result, my_instance;
}

Queue_Family_Indices :: struct {
    graphics: u32;
    present: u32;
}

find_queue_families :: (physical_device: VkPhysicalDevice, surface: VkSurfaceKHR) -> ok:bool, Queue_Family_Indices {
    graphics := Math.U32_MAX;
    present  := Math.U32_MAX;

    queue_families := vkGetPhysicalDeviceQueueFamilyProperties(physical_device,, Basic.temp);

    for queue_families {
        if it.queueFlags & .GRAPHICS {
            graphics = xx it_index;
        }

        if surface {
            supports_present: VkBool32;
            if check_vk(vkGetPhysicalDeviceSurfaceSupportKHR(physical_device, xx it_index, surface, *supports_present)) return false, .{};
            if supports_present {
                present = xx it_index;
            }
        } else {
            present = xx it_index;
        }

        if graphics != Math.U32_MAX && present != Math.U32_MAX {
            return true, .{graphics = graphics, present = present};
        }
    }

    return false, .{};
}

device_supports_extensions :: (physical_device: VkPhysicalDevice, extensions: [] *u8) -> bool {
    result, available_extensions := vkEnumerateDeviceExtensionProperties(physical_device, null,, Basic.temp);
    if check_vk(result, vkEnumerateDeviceExtensionProperties) return false;

    for extension: extensions {
        supported := false;

        extension_string := to_string(extension);

        for available: available_extensions {
            if extension_string == to_string(available.extensionName.data) {
                supported = true;
                break;
            }
        }

        if !supported {
            Basic.log("device does not support %", to_string(extension));
            return false;
        };
    }

    return true;
}

Swapchain_Support :: struct {
    capabilities: VkSurfaceCapabilitiesKHR;
    formats: [] VkSurfaceFormatKHR;
    present_modes: [] VkPresentModeKHR;
}

get_swapchain_support :: (physical_device: VkPhysicalDevice, surface: VkSurfaceKHR) -> Swapchain_Support {
    capabilities: VkSurfaceCapabilitiesKHR;
    if check_vk(vkGetPhysicalDeviceSurfaceCapabilitiesKHR(physical_device, surface, *capabilities)) return .{};

    result, formats := vkGetPhysicalDeviceSurfaceFormatsKHR(physical_device, surface,, Basic.temp);
    if check_vk(result, vkGetPhysicalDeviceSurfaceFormatsKHR) return .{};

    result=, present_modes := vkGetPhysicalDeviceSurfacePresentModesKHR(physical_device, surface,, Basic.temp);
    if check_vk(result, vkGetPhysicalDeviceSurfacePresentModesKHR) return .{};

    return .{
        capabilities = capabilities,
        formats = formats,
        present_modes = present_modes
    };
}

choose_physical_device :: (instance: VkInstance, surface: VkSurfaceKHR, device_extensions: [] *u8) -> VkPhysicalDevice, Queue_Family_Indices {
    result, devices := vkEnumeratePhysicalDevices(instance);
    if check_vk(result, vkEnumeratePhysicalDevices) return null, .{};

    best_score := 0;
    best_device: VkPhysicalDevice;
    best_device_queue_families: Queue_Family_Indices;
    for device: devices {
        // Make sure the device has necessary queue families and supports required extensions
        found, queue_families := find_queue_families(device, surface);
        if !found || !device_supports_extensions(device, device_extensions)
            then continue;

        // If surface is present, make sure it has swapchain support
        if surface {
            swapchain_support := get_swapchain_support(device, surface);
            if swapchain_support.formats.count == 0
                || swapchain_support.present_modes.count == 0
                then continue;
        }

        score := 0;

        features: VkPhysicalDeviceFeatures;
        vkGetPhysicalDeviceFeatures(device, *features);
        if features.samplerAnisotropy {
            score += 5;
        }

        properties: VkPhysicalDeviceProperties;
        vkGetPhysicalDeviceProperties(device, *properties);

        if properties.deviceType == {
        case .DISCRETE_GPU;
            score += 100;
        case .INTEGRATED_GPU;
            score += 10;
        }

        if score > best_score {
            best_score = score;
            best_device = device;
            best_device_queue_families = queue_families;
        }
    }

    return best_device, best_device_queue_families;
}

make_device :: (device_extensions: [] *u8) -> VkResult, VkDevice {
    using context.gpu_context;

    indices_array := u32.[queue_indices.graphics, queue_indices.present];

    queue_count := ifx queue_indices.graphics == queue_indices.present then 1 else 2;
    queue_create_infos := Basic.NewArray(queue_count, VkDeviceQueueCreateInfo, initialized = false,, Basic.temp);
    queue_priority : float32 = 1.0;

    for * queue_create_infos {
        it.* = .{
            queueFamilyIndex = indices_array[it_index],
            queueCount = 1,
            pQueuePriorities = *queue_priority
        };
    }

    chain: *void;
    features_shader_object := VkPhysicalDeviceShaderObjectFeaturesEXT.{
        shaderObject = VK_TRUE
    };
    chain = *features_shader_object;
    features14 := VkPhysicalDeviceVulkan14Features.{
        pNext = chain,
        maintenance5 = VK_TRUE,
    };
    chain = *features14;
    features13 := VkPhysicalDeviceVulkan13Features.{
        pNext = chain,
        dynamicRendering = VK_TRUE,
        synchronization2 = VK_TRUE,
        maintenance4 = VK_TRUE,
    };
    chain = *features13;
    features12 := VkPhysicalDeviceVulkan12Features.{
        pNext = chain,
        bufferDeviceAddress                           = VK_TRUE,
        descriptorIndexing                            = VK_TRUE,
        scalarBlockLayout                             = VK_TRUE,
        runtimeDescriptorArray                        = VK_TRUE,
        descriptorBindingVariableDescriptorCount      = VK_TRUE,
        descriptorBindingStorageBufferUpdateAfterBind = VK_TRUE,
        shaderInt8                                    = VK_TRUE,
    };
    chain = *features12;
    features11 := VkPhysicalDeviceVulkan11Features.{
        pNext = chain,
        // This extension is necessary because how slang shader
        // compute SV_VertexID and SV_InstanceID
        shaderDrawParameters = VK_TRUE
    };
    chain = *features11;
    device_features := VkPhysicalDeviceFeatures2.{
        pNext = chain,
        features = .{
            samplerAnisotropy = VK_TRUE,
            fillModeNonSolid = VK_TRUE,
            shaderInt64      = VK_TRUE // For pointer math inside shader
        }
    };

    // Device layers are deprecated
    device_create_info := VkDeviceCreateInfo.{
        pNext = *device_features,
        queueCreateInfoCount = xx queue_create_infos.count,
        pQueueCreateInfos = queue_create_infos.data,
        enabledExtensionCount = xx device_extensions.count,
        ppEnabledExtensionNames = device_extensions.data,
        pEnabledFeatures = null
    };

    my_device: VkDevice;
    result: VkResult;
    result = check_vk(vkCreateDevice(physical_device, *device_create_info, vka, *my_device));
    return result, my_device;
}

Memory_Indices :: struct {
    shared: u32 = Math.U32_MAX;
    private: u32 = Math.U32_MAX;
}

get_memory_indices :: () -> Memory_Indices {
    using context.gpu_context;

    indices: Memory_Indices;
    properties: VkPhysicalDeviceMemoryProperties;
    vkGetPhysicalDeviceMemoryProperties(physical_device, *properties);

    SHARED_FLAGS: VkMemoryPropertyFlags = .DEVICE_LOCAL | .HOST_VISIBLE | .HOST_COHERENT;

    for i: 0..properties.memoryTypeCount - 1 {
        f := properties.memoryTypes[i].propertyFlags;
        if (f & SHARED_FLAGS) == SHARED_FLAGS {
            indices.shared = i;
        }

        // This ensure the private index return is not cpu visible
        if (f & .DEVICE_LOCAL == .DEVICE_LOCAL) && (f & .HOST_VISIBLE == 0) {
            indices.private = i;
        }

        if indices.shared != Math.U32_MAX && indices.private != Math.U32_MAX {
            break;
        }
    }

    return indices;
}

to_vulkan_format :: (format: Format) -> VkFormat {
    vk_format: VkFormat = UNDEFINED;
    if format == {
    case .NONE;
        vk_format = .UNDEFINED;
    case .RGBA8_UNORM;
        vk_format = .R8G8B8A8_UNORM;
    case .D32_FLOAT;
        vk_format = .D32_SFLOAT;
    case .D24_UNORM_S8;
        vk_format = .D24_UNORM_S8_UINT;
    }

    return vk_format;
}

to_vulkan_image_type :: (type: Texture_Type) -> VkImageType {
    image_type: VkImageType;
    if type == {
    case .e1D;
        image_type = .e1D;
    case .e2D;
        image_type = .e2D;
    case .e3D;
        image_type = .e3D;
    case .CUBE;
        image_type = .e2D;
    case .e2D_ARRAY;
        image_type = .e2D;
    case .CUBE_ARRAY;
        image_type = .e2D;
    }

    return image_type;
}

to_vulkan_image_view_type :: (type: Texture_Type) -> VkImageViewType {
    image_view_type: VkImageViewType;
    if type == {
    case .e1D;
        image_view_type = .e1D;
    case .e2D;
        image_view_type = .e2D;
    case .e3D;
        image_view_type = .e3D;
    case .CUBE;
        image_view_type = .CUBE;
    case .e2D_ARRAY;
        image_view_type = .e2D_ARRAY;
    case .CUBE_ARRAY;
        image_view_type = .CUBE_ARRAY;
    }

    return image_view_type;
}

to_vulkan_sample_count :: (count: u32) -> VkSampleCountFlagBits {
    return cast(VkSampleCountFlags) count;
}

to_vulkan_image_usage :: (usage: Texture_Usage) -> VkImageUsageFlags {

}

to_vulkan_image_create_info :: (desc: Texture_Desc) -> VkImageCreateInfo {
    info := VkImageCreateInfo.{
        imageType = to_vulkan_image_type(desc.type),
        format = to_vulkan_format(desc.format),
        extent = cast(VkExtent3D) desc.dimensions,
        mipLevels = desc.mip_count,
        arrayLayers = desc.layer_count,
        samples = to_vulkan_sample_count(desc.sample_count),
        tiling = .OPTIMAL,
        usage = .TRANSFER_SRC | .TRANSFER_DST | .SAMPLED | .STORAGE,
        sharingMode = .EXCLUSIVE,
        initialLayout = UNDEFINED,
    };

    return info;
}

#import "Vulkan";
#import "SDL3";
Basic :: #import "Basic";
Math :: #import "Math";
Compiler :: #import "Compiler";
