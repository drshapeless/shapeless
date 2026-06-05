GPU_Context :: struct {
    sdl_window: *SDL_Window;
    instance: VkInstance;
    device: VkDevice;
    vka: *VkAllocationCallbacks;
    surface: VkSurfaceKHR;
    queue_indices: Queue_Family_Indices;
    physical_device: VkPhysicalDevice;
}

Allocation :: struct {
    cpu: *void;
    gpu: u64;
    offset: u64;
}

init :: () {
    context.gpu_context = Basic.alloc(size_of(GPU_Context));
    using context.gpu_context;
    get_instance_proc_addr := SDL_Vulkan_GetVkGetInstanceProcAddr();
    vk_load_global_functions(get_instance_proc_addr);

    result: VkResult;
    result, instance = make_instance();

    vk_load_instance_functions(instance);

    // Here comes a problem, suppose we do not want swapchain support
    // when swapchain is not initialized, but when we init_swapchain,
    // the device may not be useful
    physical_device, queue_indices = choose_physical_device(instance, null, DEVICE_EXTENSIONS);
    if !physical_device {
        log_error("Vulkan failed to find physical device");
        deinit();
        return;
    }

    result, device = make_device(DEVICE_EXTENSIONS);
    if result {
        log_error("Vulkan failed to create device");
        deinit();
        return;
    }
    vk_load_device_functions(device);
}

deinit :: () {
    using context.gpu_context;
    if device {
        vkDestroyDevice(device, vka);
    }
    if instance {
        vkDestroyInstance(instance, vka);
    }
    Basic.free(context.gpu_context);
}

init_swapchain :: (window: *SDL_Window) {
    using context.gpu_context;
    sdl_window = window;
    ok := SDL_Vulkan_CreateSurface(window, instance, vka, *surface);
    assert(ok);

    device_extensions: [..] *u8;
    device_extensions.allocator = temp;
    array_add(device_extensions, ..DEVICE_EXTENSIONS);
    array_add(device_extensions, VK_KHR_SWAPCHAIN_EXTENSION_NAME);
    physical_device, queue_indices = choose_physical_device(instance, null, DEVICE_EXTENSIONS);

    // Destory to original device
    vkDestroyDevice(device, vka);

    result, device = make_device(device_extensions);
    if result {
        log_error("Vulkan failed to create device");
        deinit();
        return;
    }
    vk_load_device_functions(device);
}

deinit_swapchain :: () {
    using context.gpu_context;
    SDL_Vulkan_DestroySurface(instance, surface, vka);
}

#scope_file
application_info :: VkApplicationInfo.{
    pApplicationName = "shapeless",
    applicationVersion = #run VK_MAKE_API_VERSION(0, 0, 1, 0),
    pEngineName = "shapeless",
    engineVersion = #run VK_MAKE_API_VERSION(0, 0, 1, 0),
    apiVersion = VK_API_VERSION_1_4,
};

INSTANCE_EXTENSIONS :: (*u8).[];
VALIDATION_LAYERS :: (*u8).["VK_LAYER_KHRONOS_validation"];
DEVICE_EXTENSIONS :: (*u8).[
VK_EXT_SHADER_OBJECT_EXTENSION_NAME,
];

// Stolen from JBlow's Vulkan_Renderer
// Generic api result logging helper, useful for Khronos apis
check_api_result :: (result: $Result, api: string, $call := #caller_code, loc := #caller_location) -> Result {
    call_string :: #run -> string {
        root := compiler_get_nodes(call);

        if root.kind == {
        case .PROCEDURE_CALL;
            proc_call := cast(*Code_Procedure_Call) root;
            expression := proc_call.arguments_sorted[0];

            if expression.kind != .PROCEDURE_CALL {
                return "";
            }

            call := cast(*Code_Procedure_Call) expression;
            if call.procedure_expression.kind != .IDENT {
                return "";
            }

            return (cast(*Code_Ident) call.procedure_expression).name;

        case .IDENT;
            return (cast(*Code_Ident) root).name;

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
        log_error("% '%' failed: %", api, action, printed_result, loc = loc);
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
        array_add(*instance_extensions, instance_extension_data[it]);
    }
     array_add(*instance_extensions, VK_EXT_DEBUG_UTILS_EXTENSION_NAME);

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
            log("[WARN ] %", to_string(pCallbackData.pMessage));
        case .ERROR;
            log("[ERROR] %", to_string(pCallbackData.pMessage));
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
    instance_create_info := VkInstanceCreateInfo.{
        pNext = *debug_utils_messenger_create_info,
        flags = 0,
        pApplicationInfo = *application_info,
        enabledExtensionCount = xx INSTANCE_EXTENSIONS.count,
        ppEnabledExtensionNames = xx INSTANCE_EXTENSIONS.data,
    };

    #if VALIDATION {
        instance_create_info.enabledLayerCount = xx VALIDATION_LAYERS.count;
        instance_create_info.ppEnabledLayerNames = VALIDATION_LAYERS.data;
    }

    instance: VkInstance;
    result := check_vk(vkCreateInstance(*instance_create_info, vka, *instance));
    return result, instance;
}

Queue_Family_Indices :: struct {
    graphics: u32;
    present: u32;
}

find_queue_families :: (physical_device: VkPhysicalDevice, surface: VkSurfaceKHR) -> ok:bool, Queue_Family_Indices {
    graphics := U32_MAX;
    present  := U32_MAX;

    queue_families := vkGetPhysicalDeviceQueueFamilyProperties(physical_device,, temp);

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

        if graphics != U32_MAX && present != U32_MAX {
            return true, .{graphics = graphics, present = present};
        }
    }

    return false, .{};
}

device_supports_extensions :: (physical_device: VkPhysicalDevice, extensions: [] *u8) -> bool {
    result, available_extensions := vkEnumerateDeviceExtensionProperties(physical_device, null,, temp);
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
            log("device does not support %", to_string(extension));
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

    result, formats := vkGetPhysicalDeviceSurfaceFormatsKHR(physical_device, surface,, temp);
    if check_vk(result, vkGetPhysicalDeviceSurfaceFormatsKHR) return .{};

    result=, present_modes := vkGetPhysicalDeviceSurfacePresentModesKHR(physical_device, surface,, temp);
    if check_vk(result, vkGetPhysicalDeviceSurfacePresentModesKHR) return .{};

    return .{
        capabilities = capabilities,
        formats = formats,
        present_modes = present_modes
    };
}

choose_physical_device :: (instance: VkInstance, surface: VkSurfaceKHR, device_extensions: [] *u8) -> VkPhysicalDevice, Queue_Family_Indices {
    using context.gpu_context;
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
    queue_create_infos := NewArray(queue_count, VkDeviceQueueCreateInfo, initialized = false,, temp);
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

#import "Vulkan";
#import "SDL3";
Basic :: #import "Basic";
