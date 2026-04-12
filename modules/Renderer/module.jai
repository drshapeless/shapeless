#module_parameters(VALIDATION := true);

ENABLED_DEVICE_EXTENSION_NAMES :: (*u8).[
VK_KHR_MAP_MEMORY_2_EXTENSION_NAME,
VK_EXT_SHADER_OBJECT_EXTENSION_NAME
];

SWAPCHAIN_SURFACE_FORMAT : VkFormat : .B8G8R8A8_UNORM;
SWAPCHAIN_COLOR_SPACE    : VkColorSpaceKHR : .SRGB_NONLINEAR;
SWAPCHAIN_IMAGE_USAGE    : VkImageUsageFlags : .TRANSFER_DST | .COLOR_ATTACHMENT;

offset_of :: ($T: Type, $member: string) -> int {
    for type_info(T).members {
        if it.name == member return it.offset_in_bytes;
    }

    assert(false, "Type '%' does not have member '%'", T, member);
    return -1;
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

#load "renderer.jai";
#load "pipeline.jai";
#load "descriptor.jai";

#scope_file
#import "Vulkan";
#import "SDL3";
#import "Math";
#import "Compiler";
#import "System";
#import "Basic";
#import "Flat_Pool";
#import "Hash_Table";
#import "File";
