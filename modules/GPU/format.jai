vulkan_format_to_metal_format :: (vk_fmt: Vulkan.VkFormat) -> Metal.MTLPixelFormat {
    mtl_format := Metal.MTLPixelFormat.Invalid;

    if vk_fmt == .UNDEFINED {
        return MTLPixelFormat.Invalid;
    }

    if vk_fmt == {
    // 4/5-bit packed
    case .R4G4_UNORM_PACK8;           mtl_format = .Invalid;
    case .R4G4B4A4_UNORM_PACK16;     mtl_format = .ABGR4Unorm;
    case .B4G4R4A4_UNORM_PACK16;     mtl_format = .ABGR4Unorm;  // usually needs swizzle
    case .R5G6B5_UNORM_PACK16;       mtl_format = .B5G6R5Unorm;
    case .B5G6R5_UNORM_PACK16;       mtl_format = .B5G6R5Unorm;
    case .R5G5B5A1_UNORM_PACK16;     mtl_format = .A1BGR5Unorm;
    case .A1R5G5B5_UNORM_PACK16;     mtl_format = .BGR5A1Unorm;

    // 8-bit
    case .R8_UNORM;                   mtl_format = .R8Unorm;
    case .R8_SNORM;                   mtl_format = .R8Snorm;
    case .R8_UINT;                    mtl_format = .R8Uint;
    case .R8_SINT;                    mtl_format = .R8Sint;
    case .R8_SRGB;                    mtl_format = .R8Unorm_sRGB;

    case .R8G8_UNORM;                 mtl_format = .RG8Unorm;
    case .R8G8_SNORM;                 mtl_format = .RG8Snorm;
    case .R8G8_UINT;                  mtl_format = .RG8Uint;
    case .R8G8_SINT;                  mtl_format = .RG8Sint;
    case .R8G8_SRGB;                  mtl_format = .RG8Unorm_sRGB;

    // 32-bit RGBA / BGRA
    case .R8G8B8A8_UNORM;            mtl_format = .RGBA8Unorm;
    case .R8G8B8A8_SNORM;            mtl_format = .RGBA8Snorm;
    case .R8G8B8A8_UINT;             mtl_format = .RGBA8Uint;
    case .R8G8B8A8_SINT;             mtl_format = .RGBA8Sint;
    case .R8G8B8A8_SRGB;             mtl_format = .RGBA8Unorm_sRGB;

    case .B8G8R8A8_UNORM;            mtl_format = .BGRA8Unorm;
    case .B8G8R8A8_SRGB;             mtl_format = .BGRA8Unorm_sRGB;

    case .A8B8G8R8_UNORM_PACK32;     mtl_format = .RGBA8Unorm;
    case .A8B8G8R8_SNORM_PACK32;     mtl_format = .RGBA8Snorm;
    case .A8B8G8R8_UINT_PACK32;      mtl_format = .RGBA8Uint;
    case .A8B8G8R8_SINT_PACK32;      mtl_format = .RGBA8Sint;
    case .A8B8G8R8_SRGB_PACK32;      mtl_format = .RGBA8Unorm_sRGB;

    // 10-bit
    case .A2B10G10R10_UNORM_PACK32;  mtl_format = .RGB10A2Unorm;
    case .A2R10G10B10_UNORM_PACK32;  mtl_format = .BGR10A2Unorm;

    // 16-bit
    case .R16_UNORM;                  mtl_format = .R16Unorm;
    case .R16_SNORM;                  mtl_format = .R16Snorm;
    case .R16_UINT;                   mtl_format = .R16Uint;
    case .R16_SINT;                   mtl_format = .R16Sint;
    case .R16_SFLOAT;                 mtl_format = .R16Float;

    case .R16G16_UNORM;               mtl_format = .RG16Unorm;
    case .R16G16_SNORM;               mtl_format = .RG16Snorm;
    case .R16G16_UINT;                mtl_format = .RG16Uint;
    case .R16G16_SINT;                mtl_format = .RG16Sint;
    case .R16G16_SFLOAT;              mtl_format = .RG16Float;

    case .R16G16B16A16_UNORM;         mtl_format = .RGBA16Unorm;
    case .R16G16B16A16_SNORM;         mtl_format = .RGBA16Snorm;
    case .R16G16B16A16_UINT;          mtl_format = .RGBA16Uint;
    case .R16G16B16A16_SINT;          mtl_format = .RGBA16Sint;
    case .R16G16B16A16_SFLOAT;        mtl_format = .RGBA16Float;

    // 32-bit
    case .R32_UINT;                   mtl_format = .R32Uint;
    case .R32_SINT;                   mtl_format = .R32Sint;
    case .R32_SFLOAT;                 mtl_format = .R32Float;

    case .R32G32_UINT;                mtl_format = .RG32Uint;
    case .R32G32_SINT;                mtl_format = .RG32Sint;
    case .R32G32_SFLOAT;              mtl_format = .RG32Float;

    case .R32G32B32A32_UINT;          mtl_format = .RGBA32Uint;
    case .R32G32B32A32_SINT;          mtl_format = .RGBA32Sint;
    case .R32G32B32A32_SFLOAT;        mtl_format = .RGBA32Float;

    // Depth / Stencil
    case .D16_UNORM;                  mtl_format = .Depth16Unorm;
    case .D32_SFLOAT;                 mtl_format = .Depth32Float;
    case .S8_UINT;                    mtl_format = .Stencil8;
    case .D24_UNORM_S8_UINT;          mtl_format = .Depth24Unorm_Stencil8;
    case .D32_SFLOAT_S8_UINT;         mtl_format = .Depth32Float_Stencil8;

    // Compressed formats
    case .BC1_RGB_UNORM_BLOCK; #through;

    case .BC1_RGBA_UNORM_BLOCK;       mtl_format = .BC1_RGBA;

    case .BC1_RGB_SRGB_BLOCK; #through;
    case .BC1_RGBA_SRGB_BLOCK;        mtl_format = .BC1_RGBA_sRGB;

    case .BC2_UNORM_BLOCK;            mtl_format = .BC2_RGBA;
    case .BC2_SRGB_BLOCK;             mtl_format = .BC2_RGBA_sRGB;

    case .BC3_UNORM_BLOCK;            mtl_format = .BC3_RGBA;
    case .BC3_SRGB_BLOCK;             mtl_format = .BC3_RGBA_sRGB;

    case .BC4_UNORM_BLOCK;            mtl_format = .BC4_RUnorm;
    case .BC4_SNORM_BLOCK;            mtl_format = .BC4_RSnorm;

    case .BC5_UNORM_BLOCK;            mtl_format = .BC5_RGUnorm;
    case .BC5_SNORM_BLOCK;            mtl_format = .BC5_RGSnorm;

    case .BC6H_UFLOAT_BLOCK;          mtl_format = .BC6H_RGBUfloat;
    case .BC6H_SFLOAT_BLOCK;          mtl_format = .BC6H_RGBFloat;

    case .BC7_UNORM_BLOCK;            mtl_format = .BC7_RGBAUnorm;
    case .BC7_SRGB_BLOCK;             mtl_format = .BC7_RGBAUnorm_sRGB;

    // ETC2 / EAC
    case .ETC2_R8G8B8_UNORM_BLOCK;    mtl_format = .ETC2_RGB8;
    case .ETC2_R8G8B8_SRGB_BLOCK;     mtl_format = .ETC2_RGB8_sRGB;
    case .ETC2_R8G8B8A1_UNORM_BLOCK;  mtl_format = .ETC2_RGB8A1;
    case .ETC2_R8G8B8A1_SRGB_BLOCK;   mtl_format = .ETC2_RGB8A1_sRGB;
    case .ETC2_R8G8B8A8_UNORM_BLOCK;  mtl_format = .EAC_RGBA8;
    case .ETC2_R8G8B8A8_SRGB_BLOCK;   mtl_format = .EAC_RGBA8_sRGB;

    case .EAC_R11_UNORM_BLOCK;        mtl_format = .EAC_R11Unorm;
    case .EAC_R11_SNORM_BLOCK;        mtl_format = .EAC_R11Snorm;
    case .EAC_R11G11_UNORM_BLOCK;     mtl_format = .EAC_RG11Unorm;
    case .EAC_R11G11_SNORM_BLOCK;     mtl_format = .EAC_RG11Snorm;

    // ASTC
    case .ASTC_4x4_UNORM_BLOCK;       mtl_format = .ASTC_4x4_LDR;
    case .ASTC_4x4_SRGB_BLOCK;        mtl_format = .ASTC_4x4_sRGB;
    case .ASTC_4x4_SFLOAT_BLOCK;      mtl_format = .ASTC_4x4_HDR;

    case;
        mtl_format = .Invalid;
    }

    return mtl_format;
}

#scope_file
Vulkan :: #import "Vulkan";
Metal :: #import "Metal";
