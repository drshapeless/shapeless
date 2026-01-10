Renderer :: struct {
    instance: VkInstance;

    surface: VkSurfaceKHR;
    physical_device: VkPhysicalDevice;
    device: VkDevice;

    Queue_Family_Indices :: struct {
        graphics: u32;
        present:  u32;
    }

}

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

application_info :: VkApplicationInfo.{
    pApplicationName   = "Shapeless",
    applicationVersion = #run VK_MAKE_API_VERSION(0, 1, 0, 0),
    pEngineName        = "Shapeless Engine",
    engineVersion      = #run VK_MAKE_API_VERSION(0, 1, 0, 0),
    apiVersion         = VK_API_VERSION_1_4
};

validation_layers :: (*u8).[VK_EXT_DEBUG_UTILS_EXTENSION_NAME];

make_vk_instance_create_info :: (instance_extensions: [] *u8, enable_validation_layers: bool) -> VkInstanceCreateInfo {
    return .{
        pApplicationInfo = *application_info,
        enabledLayerCount = xx ifx enable_validation_layers then 1 else 0,
        ppEnabledLayerNames = ifx enable_validation_layers then validation_layers.data else null,
        enabledExtensionCount = xx instance_extensions.count,
        ppEnabledExtensionNames = instance_extensions.data
    };
}

make_vk_instance :: (instance_extensions: [] *u8, enable_validation_layers: bool) -> VkInstance, bool {
    instance_create_info := make_vk_instance_create_info(instance_extensions, enable_validation_layers);
    instance: VkInstance;
    result := check_vk(vkCreateInstance(*instance_create_info, null, *instance));
    return instance, result == .SUCCESS;
}

max_supported_sample_count :: (physical_device: VkPhysicalDevice) -> VkSampleCountFlags {
    properties: VkPhysicalDeviceProperties;
    vkGetPhysicalDeviceProperties(physical_device, *properties);

    counts := properties.limits.framebufferColorSampleCounts
            & properties.limits.framebufferDepthSampleCounts;

    if counts & .e64 return .e64;
    if counts & .e32 return .e32;
    if counts & .e16 return .e16;
    if counts & .e8  return .e8;
    if counts & .e4  return .e4;
    if counts & .e2  return .e2;

    return .e1;
}

find_queue_families :: (physical_device: VkPhysicalDevice, surface: VkSurfaceKHR) -> Renderer.Queue_Family_Indices, bool {
    graphics := U32_MAX;
    present  := U32_MAX;

    queue_families_count: u32;
    vkGetPhysicalDeviceQueueFamilyProperties(physical_device, *queue_families_count, null);
    queue_families := NewArray(queue_families_count, VkQueueFamilyProperties, initialized = false,, temp);
    vkGetPhysicalDeviceQueueFamilyProperties(physical_device, *queue_families_count, queue_families.data);

    for queue_families {
        if it.queueFlags & .GRAPHICS_BIT {
            graphics = xx it_index;
        }

        if surface {
            supports_present: VkBool32;
            if check_vk(vkGetPhysicalDeviceSurfaceSupportKHR(physical_device, xx it_index, surface, *supports_present)) return .{}, false;
            if supports_present {
                present = xx it_index;
            }
        } else {
            present = xx it_index;
        }

        if graphics != U32_MAX && present != U32_MAX {
            return .{graphics = graphics, present = present}, true;
        }
    }

    return .{}, false;
}

make_vk_device_create_info :: (
    physical_device: VkPhysicalDevice,
    surface: VkSurfaceKHR,
    device_extensions: [] *u8,
    queue_indices: Renderer.Queue_Family_Indices,
    enable_validation_layers: bool,
    enable_multiview: bool,
) -> VkDeviceCreateInfo {
    indices_array := u32.[queue_indices.graphics, queue_indices.present];

    queue_count := ifx queue_indices.graphics == queue_indices.present then 1 else 2;
    queue_create_infos := NewArray(queue_count, VkDeviceQueueCreateInfo, initialized = false,, temp);
    queue_priority := New(float, initialized = false,, temp);
    queue_priority.* = 1;

    for * queue_create_infos {
        it.* = .{
            queueFamilyIndex = indices_array[it_index],
            queueCount = 1,
            pQueuePriorities = queue_priority
        };
    }

    supported_features: VkPhysicalDeviceFeatures;
    vkGetPhysicalDeviceFeatures(physical_device, *supported_features);
    enabled_features := New(VkPhysicalDeviceFeatures,, temp);

    // TODO: WIP
}

#scope_file
#import "Vulkan";
#import "Basic";
