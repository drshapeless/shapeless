#module_parameters(
    MOLTENVK := false,
    VALIDATION  := false
);

APPLICATION_VERSION :: #run VK_MAKE_VERSION(0, 1, 0);
ENGINE_VERSION :: #run VK_MAKE_VERSION(0, 1, 0);

DEVICE_EXTENSIONS :: (*u8).[
VK_EXT_SHADER_OBJECT_EXTENSION_NAME
];

GPU_Context :: struct {
    vka:                          *VkAllocationCallbacks;
    instance:                     VkInstance;
    physical_device:              VkPhysicalDevice;
    physical_device_properties:   VkPhysicalDeviceProperties2;
    device:                       VkDevice;
    debug_report_callback_handle: VkDebugReportCallbackEXT;
    graphics_queue:               VkQueue;
    compute_queue:                VkQueue;
}
#add_context gpu_context: GPU_Context;

// I am lazy
Result :: VkResult;

init :: () -> bool {
    ctx := *context.gpu_context;
    return init(ctx);
}

init :: (ctx: *GPU_Context) -> bool {
    get_instance_proc_addr := SDL_Vulkan_GetVkGetInstanceProcAddr();
    assert(get_instance_proc_addr != null);
    vk_load_global_functions(xx get_instance_proc_addr);

    using context.gpu_context;

    result: Result;
    result = make_instance(ctx);
    if result return false;

    result = make_device(ctx);
    if result return false;

    return true;
}

deinit :: () {
    ctx := *context.gpu_context;
    deinit(ctx);
}

deinit :: (using ctx: *GPU_Context) {
    if device {
        vkDestroyDevice(device, vka);
    }
    if instance {
        vkDestroyInstance(instance, vka);
    }
}

#scope_module
return_if_error :: (result: VkResult) #expand {
    if result != .SUCCESS {
        `return result;
    }
}

make_instance :: (using ctx: *GPU_Context) -> Result {
    auto_release_temp();
    push_allocator(temp);

    result: VkResult;

    extensions: [..] *u8;
    #if OS == .MACOS && MOLTENVK {
        array_add(*extensions, VK_KHR_PORTABILITY_ENUMERATION_EXTENSION_NAME);
    }

    #if VALIDATION {
        array_add(*extensions, VK_EXT_DEBUG_UTILS_EXTENSION_NAME);
        array_add(*extensions, VK_EXT_DEBUG_REPORT_EXTENSION_NAME);
    }

    {
        result, available_extensions := vkEnumerateInstanceExtensionProperties(null);

        for extension: extensions {
            found := false;
            for available: available_extensions {
                if to_string(extension) == to_string(available.extensionName) {
                    found = true;
                    break available;
                }
            }

            if !found {
                return .ERROR_EXTENSION_NOT_PRESENT;
            }
        }
    }

    application_info := VkApplicationInfo.{
        pApplicationName   = "shapeless",
        applicationVersion = APPLICATION_VERSION,
        pEngineName        = "shapeless",
        engineVersion      = ENGINE_VERSION,
        apiVersion         = VK_API_VERSION_1_3
    };

    instance_create_info := VkInstanceCreateInfo.{
        pApplicationInfo        = *application_info,
        enabledExtensionCount   = extensions.count.(u32),
        ppEnabledExtensionNames = extensions.data
    };

    enabled_layers: [..] *u8;
    #if OS == .MACOS {
        // Both MoltenVK and KosmicKrisp use a layer to emulate shader object
        array_add(*enabled_layers, "VK_LAYER_KHRONOS_shader_object");
    }

    #if VALIDATION {
        array_add(*enabled_layers, "VK_LAYER_KHRONOS_validation");
        enabled_validation_features := VkValidationFeatureEnableEXT.[
        .SYNCHRONIZATION_VALIDATION
        ];

        validation_features := VkValidationFeaturesEXT.{
            enabledValidationFeatureCount = xx enabled_validation_features.count,
            pEnabledValidationFeatures = enabled_validation_features.data
        };

        debug_utils_messenger_create_info := VkDebugUtilsMessengerCreateInfoEXT.{
            messageSeverity = .WARNING | .ERROR,
            messageType = .GENERAL | .VALIDATION | .PERFORMANCE,
            pfnUserCallback = debug_utils_messenger_callback,
            pNext = *validation_features
        };

        instance_create_info.pNext = *debug_utils_messenger_create_info;
    }

    #if OS == .MACOS && MOLTENVK {
        instance_create_info.flags |= .ENUMERATE_PORTABILITY_KHR;
    }

    instance_create_info.enabledLayerCount = xx enabled_layers.count;
    instance_create_info.ppEnabledLayerNames = enabled_layers.data;

    result = vkCreateInstance(*instance_create_info, vka, *instance);
    return_if_error(result);

    #if VALIDATION {
        debug_report_callback_create_info := VkDebugReportCallbackCreateInfoEXT.{
            flags = .ERROR | .WARNING,
            pfnCallback = debug_report_callback
        };

        result = vkCreateDebugReportCallbackEXT(instance, *debug_report_callback_create_info, vka, debug_report_callback_handle);
        return_if_error(result);
    }

    vk_load_instance_functions(instance);

    return .SUCCESS;
}

make_device :: (using ctx: *GPU_Context) -> Result {
    auto_release_temp();
    push_allocator(temp);

    extensions: [..]*u8;
    array_add(*extensions, ..DEVICE_EXTENSIONS);

    #if OS == .MACOS && MOLTENVK {
        array_add(*extensions, VK_KHR_PORTABILITY_SUBSET_EXTENSION_NAME);
    }

    choose_physical_device(ctx, extensions);

    graphics_index, compute_index := get_queue_family_indices(ctx);
    queue_count := ifx graphics_index == compute_index then 1 else 2;
    queue_create_infos := NewArray(queue_count, VkDeviceQueueCreateInfo);
    queue_priority: float = 1.0;
    if graphics_index == compute_index {
        queue_create_infos[0] = .{
            queueFamilyIndex = graphics_index,
            queueCount = 1,
            pQueuePriorities = *queue_priority
        };
    } else {
        queue_create_infos[0] = .{
            queueFamilyIndex = graphics_index,
            queueCount = 1,
            pQueuePriorities = *queue_priority
        };
        queue_create_infos[1] = .{
            queueFamilyIndex = compute_index,
            queueCount = 1,
            pQueuePriorities = *queue_priority
        };
    }

    chain: *void;
    features_shader_object := VkPhysicalDeviceShaderObjectFeaturesEXT.{
        shaderObject = VK_TRUE
    };
    chain = *features_shader_object;
    features_graphics_pipeline_library := VkPhysicalDeviceGraphicsPipelineLibraryFeaturesEXT.{
        pNext = chain,
        graphicsPipelineLibrary = VK_TRUE
    };
    chain = *features_graphics_pipeline_library;
    features_13 := VkPhysicalDeviceVulkan13Features.{
        pNext = chain,
        dynamicRendering = VK_TRUE,
        synchronization2 = VK_TRUE
    };
    chain = *features_13;
    features_12 := VkPhysicalDeviceVulkan12Features.{
        pNext = chain,
        bufferDeviceAddress                           = VK_TRUE,
        descriptorIndexing                            = VK_TRUE,
        scalarBlockLayout                             = VK_TRUE,
        runtimeDescriptorArray                        = VK_TRUE,
        descriptorBindingVariableDescriptorCount      = VK_TRUE,
        descriptorBindingStorageBufferUpdateAfterBind = VK_TRUE,
        shaderInt8                                    = VK_TRUE,
        timelineSemaphore                             = VK_TRUE
    };
    chain = *features_12;
    features_11 := VkPhysicalDeviceVulkan11Features.{
        pNext = chain,
        // This extension is necessary because how slang shader
        // compute SV_VertexID and SV_InstanceID
        shaderDrawParameters = VK_TRUE
    };
    chain = *features_11;
    features := VkPhysicalDeviceFeatures2.{
        pNext = chain,
        features = .{
            samplerAnisotropy = VK_TRUE,
            fillModeNonSolid = VK_TRUE,
            shaderInt64      = VK_TRUE // For pointer math inside shader
        }
    };

    device_create_info := VkDeviceCreateInfo.{
        pNext = *features,
        queueCreateInfoCount = xx queue_count,
        pQueueCreateInfos = queue_create_infos.data,
        enabledExtensionCount = xx extensions.count,
        ppEnabledExtensionNames = extensions.data,
    };

    result := vkCreateDevice(physical_device, *device_create_info, vka, *device);
    return_if_error(result);

    vk_load_device_functions(device);

    // TODO: not very clean to put it here, but I don't want to query
    // the family indices again.
    vkGetDeviceQueue(device, graphics_index, 0, *graphics_queue);
    vkGetDeviceQueue(device, compute_index,  0, *compute_queue);
    return .SUCCESS;
}

choose_physical_device :: (using ctx: *GPU_Context, extensions: []*u8) -> Result {
    result: VkResult;
    // pick physical device
    result=, physical_devices := vkEnumeratePhysicalDevices(instance);
    return_if_error(result);

    device_scores := NewArray(physical_devices.count, s64);

    if physical_devices.count == 0 {
        log("There is no GPU");
        return .ERROR_UNKNOWN;
    }

    for pd: physical_devices {
        physical_device_properties_12: VkPhysicalDeviceVulkan12Properties;
        physical_device_properties: VkPhysicalDeviceProperties2;
        physical_device_properties.pNext = *physical_device_properties_12;
        vkGetPhysicalDeviceProperties2(pd, *physical_device_properties);

        #if OS == .MACOS {
            #if MOLTENVK {
                if physical_device_properties_12.driverID == .MOLTENVK {
                    device_scores[it_index] += 1000;
                }
            } else {
                if physical_device_properties_12.driverID == .MESA_KOSMICKRISP {
                    device_scores[it_index] += 1000;
                }
            }
            continue;
        }
        physical_device_features: VkPhysicalDeviceFeatures2;
        vkGetPhysicalDeviceFeatures2(pd, *physical_device_features);

        is_required_extensions_supported := true;
        result=, available_extensions := vkEnumerateDeviceExtensionProperties(pd, null);
        return_if_error(result);

        for e: extensions {
            extension_name := to_string(e);
            found := false;
            for ae: available_extensions {
                if to_string(ae.extensionName) == extension_name {
                    found = true;
                    break;
                }
            }
            if !found {
                is_required_extensions_supported = false;
                break;
            }
        }

        if !is_required_extensions_supported {
            continue;
        }

        if physical_device_properties.properties.deviceType == {
        case  .DISCRETE_GPU;
            device_scores[it_index] += 1000;
        case .VIRTUAL_GPU;
            device_scores[it_index] += 100;
        case .INTEGRATED_GPU;
            device_scores[it_index] += 10;
        }
    }

    best_device_index := 0;
    best_score := 0;
    for device_scores {
        if it > best_score {
            best_score = it;
            best_device_index = it_index;
        }
    }

    if best_score == 0 {
        assert(false, "There is no suitable gpu");
    }

    physical_device = physical_devices[best_device_index];
    vkGetPhysicalDeviceProperties2(physical_device, *physical_device_properties);

    return result;
}

get_queue_family_indices :: (using ctx: *GPU_Context) -> graphics:u32, compute:u32 {
    // I am not sure whether separating queues matters. On M-series
    // mac, the vulkan implementation lists 4 queues, but in reality,
    // there is only one queue. It is the same case in Intel. The only
    // useful hardware is my AMD GPU which has a non-graphics compute
    // queue. And there is no pure transfer queue anymore. So for any
    // transfer, use the graphics queue.
    graphics_queue_family_index := U32_MAX;
    compute_queue_family_index  := U32_MAX;

    #if OS == .MACOS {
        // On macOS, just use the first.
        graphics_queue_family_index = 0;
        compute_queue_family_index  = 0;
    } else {
        // This assumes the graphics queue supports present, which is most
        // of the case in modern hardware.
        queue_families := vkGetPhysicalDeviceQueueFamilyProperties(physical_device);
        for queue_families {
            if it.queueFlags & .GRAPHICS {
                graphics_queue_family_index = xx it_index;
                continue;
            }

            if !(it.queueFlags & .GRAPHICS) && it.queueFlags & .COMPUTE {
                compute_queue_family_index = xx it_index;
                continue;
            }
        }

        if graphics_queue_family_index == U32_MAX {
            assert(false, "There is no graphics queue in this hardware");
        }

        if compute_queue_family_index == U32_MAX {
            compute_queue_family_index = graphics_queue_family_index;
        }
    }
    return graphics_queue_family_index, compute_queue_family_index;
}

get_vk_instance_extensions :: () -> []*u8 {
    count: u32;
    data := SDL_Vulkan_GetInstanceExtensions(*count);

    extensions: []*u8;
    extensions.count = xx count;
    extensions.data = data;

    return extensions;
}

#if VALIDATION {
    debug_utils_messenger_callback :: (messageSeverity: VkDebugUtilsMessageSeverityFlagBitsEXT, messageTypes: VkDebugUtilsMessageTypeFlagsEXT, pCallbackData: *VkDebugUtilsMessengerCallbackDataEXT, pUserData: *void) -> VkBool32 #c_call {
        push_context {
            if messageSeverity == {
            case .WARNING;
                log("[WARN ]: %", to_string(pCallbackData.pMessage));
            case .ERROR;
                log("[ERROR]: %", to_string(pCallbackData.pMessage));
            }
        }

        return VK_FALSE;
    }

    debug_report_callback :: (flags: VkDebugReportFlagsEXT, objectType: VkDebugReportObjectTypeEXT, object: u64, location: u64, messageCode: s32, pLayerPrefix: *u8, pMessage: *u8, pUserData: *void) -> VkBool32 #c_call {
        push_context {
            log("[Validation]: %", to_string(pMessage));
        }

        return VK_FALSE;
    }
}

#import "Vulkan";
#import "SDL3";
#import "Basic";
#import "Math";
