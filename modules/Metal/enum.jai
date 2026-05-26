/*!
 * @brief Describes how a resource will be used by a shader through an argument buffer
 */
MTLResourceUsage :: enum_flags NSUInteger {
    Read :: 1;
    Write :: 2;
    Sample :: 4;
}

/*!
 * @brief Describes the types of resources that the a barrier operates on
 */
MTLBarrierScope :: enum_flags NSUInteger {
    Buffers :: 1;
    Textures :: 2;
    RenderTargets :: 4;
}

/// Describes stages of GPU work.
///
/// All commands you encoder into command buffers relate to one or more shader stages,
/// for example, a compute dispatch command from a compute command encoder relates to
/// stage ``MTLStageDispatch``.
///
/// Use these stages to issue barriers between shader stages to ensure Metal correctly
/// synchronizes GPU commands.
MTLStages :: enum_flags NSUInteger {
    /// Represents all vertex shader stage work in a render pass.
    Vertex :: 1;
    /// Represents all fragment shader stage work in a render pass.
    Fragment :: 2;
    /// Represents all tile shading stage work in a render pass.
    Tile :: 4;
    /// Represents all object shader stage work in a render pass.
    Object :: 8;
    /// Represents all mesh shader stage work work in a render pass.
    Mesh :: 16;
    /// Represents all sparse and placement sparse resource mapping updates.
    ResourceState :: 67108864;
    /// Represents all compute dispatches in a compute pass.
    Dispatch :: 134217728;
    /// Represents all blit operations in a pass.
    Blit :: 268435456;
    /// Represents all acceleration structure operations.
    AccelerationStructure :: 536870912;
    /// Represents all machine learning network dispatch operations.
    MachineLearning :: 1073741824;
    /// Convenience mask representing all stages of GPU work.
    All :: 9223372036854775807;
}

/*!
 @enum MTLPurgeableOption
 @abstract Options for setPurgeable call.
 
 @constant MTLPurgeableStateNonVolatile
 The contents of this resource may not be discarded.

 @constant MTLPurgeableStateVolatile
 The contents of this resource may be discarded.

 @constant MTLPurgeableStateEmpty
 The contents of this are discarded.
 
 @constant MTLPurgeableStateKeepCurrent
 The purgeabelity state is not changed.
 */
MTLPurgeableState :: enum NSUInteger {
    KeepCurrent :: 1;
    NonVolatile :: 2;
    Volatile :: 3;
    Empty :: 4;
}

/*!
 @enum MTLCPUCacheMode
 @abstract Describes what CPU cache mode is used for the CPU's mapping of a texture resource.
 @constant MTLCPUCacheModeDefaultCache
 The default cache mode for the system.
 
 @constant MTLCPUCacheModeWriteCombined
 Write combined memory is optimized for resources that the CPU will write into, but never read.  On some implementations, writes may bypass caches avoiding cache pollution, and reads perform very poorly.
 
 @discussion
 Applications should only investigate changing the cache mode if writing to normally cached buffers is known to cause performance issues due to cache pollution, as write combined memory can have surprising performance pitfalls.  Another approach is to use non-temporal stores to normally cached memory (STNP on ARMv8, _mm_stream_* on x86_64).
 */
MTLCPUCacheMode :: enum NSUInteger {
    DefaultCache :: 0;
    WriteCombined :: 1;
}

/*!
 @enum MTLStorageMode
 @abstract Describes location and CPU mapping of MTLTexture.
 @constant MTLStorageModeShared
 In this mode, CPU and device will nominally both use the same underlying memory when accessing the contents of the texture resource.
 However, coherency is only guaranteed at command buffer boundaries to minimize the required flushing of CPU and GPU caches.
 This is the default storage mode for iOS Textures.

 @constant MTLStorageModeManaged
 This mode relaxes the coherency requirements and requires that the developer make explicit requests to maintain
 coherency between a CPU and GPU version of the texture resource.  In order for CPU to access up to date GPU results,
 first, a blit synchronizations must be completed (see synchronize methods of MTLBlitCommandEncoder).
 Blit overhead is only incurred if GPU has modified the resource.
 This is the default storage mode for OS X Textures.

 @constant MTLStorageModePrivate
 This mode allows the texture resource data to be kept entirely to GPU (or driver) private memory that will never be accessed by the CPU directly, so no
 conherency of any kind must be maintained.
 
 @constant MTLStorageModeMemoryless
 This mode allows creation of resources that do not have a GPU or CPU memory backing, but do have on-chip storage for TBDR
 devices. The contents of the on-chip storage is undefined and does not persist, but its configuration is controlled by the
 MTLTexture descriptor. Textures created with MTLStorageModeMemoryless dont have an IOAccelResource at any point in their
 lifetime. The only way to populate such resource is to perform rendering operations on it. Blit operations are disallowed.
*/
MTLStorageMode :: enum NSUInteger {
    Shared :: 0;
    Managed :: 1;
    Private :: 2;
    Memoryless :: 3;
}

/*!
 @enum MTLHazardTrackingMode
 @abstract Describes how hazard tracking is performed.
 @constant MTLHazardTrackingModeDefault The default hazard tracking mode for the context. Refer to the usage of the field for semantics.
 @constant MTLHazardTrackingModeUntracked Do not perform hazard tracking.
 @constant MTLHazardTrackingModeTracked Do perform hazard tracking.
*/
MTLHazardTrackingMode :: enum NSUInteger {
    Default :: 0;
    Untracked :: 1;
    Tracked :: 2;
}

MTLResourceOptions :: enum_flags NSUInteger {
    CPUCacheModeDefaultCache :: 0;
    CPUCacheModeWriteCombined :: 1;
    StorageModeShared :: 0;
    StorageModeManaged :: 16;
    StorageModePrivate :: 32;
    StorageModeMemoryless :: 48;
    HazardTrackingModeDefault :: 0;
    HazardTrackingModeUntracked :: 256;
    HazardTrackingModeTracked :: 512;
    // Deprecated spellings
    CPUCacheModeDefault :: 0;
}

/*!
 @enum MTLSparsePageSize
 @abstract Physical size of sparse resource page in KBs.
 */
MTLSparsePageSize :: enum NSInteger {
    e16 :: 101;
    e64 :: 102;
    e256 :: 103;
}

/// Enumerates the different support levels for sparse buffers.
MTLBufferSparseTier :: enum NSInteger {
    /// Indicates that the buffer is not sparse.
    None :: 0;
    /// Indicates support for sparse buffers tier 1.
    ///
    /// Tier 1 sparse buffers allow the following:
    /// * Partial memory backing at sparse page granularity.
    /// * Defined behavior for accessing an *unbacked* buffer range.
    ///
    /// An unbacked buffer range indicates a range within the buffer that doesn't
    /// have memory backing at a given point in time. Accessing an unbacked buffer
    /// range of a sparse buffer produces the following results:
    /// * Reading return zero.
    /// * Writing produces no result.
    e1 :: 1;
}

/// Enumerates the different support levels for sparse textures.
MTLTextureSparseTier :: enum NSInteger {
    /// Indicates that the texture is not sparse.
    None :: 0;
    /// Indicates support for sparse textures tier 1.
    ///
    /// Tier 1 sparse textures allow the following:
    /// * Partial memory backing at sparse tile granularity.
    /// * Defined behavior for accessing an unbacked texture region.
    /// * Shader feedback on texture access to determine memory backing.
    ///
    /// An unbacked texture region indicates a region within the texture that doesn't
    /// have memory backing at a given point in time. Accessing an unbacked texture
    /// region produces the following results:
    /// * Reading returns zero (transparent black) for pixel formats with an alpha (A) channel.
    /// * Reading return zero in RGB and one in alpha (A) channels (opaque black) otherwise.
    /// * Writing produces no result.
    e1 :: 1;
    /// Indicates support for sparse textures tier 2.
    ///
    /// In addition to the guarantees tier 1 sparse textures provide,
    /// tier 2 sparse textures allow the following:
    /// * Obtain per-tile activity counters.
    e2 :: 2;
}

MTLPixelFormat :: enum NSUInteger {
    Invalid :: 0;
    /* Normal 8 bit formats */
    A8Unorm :: 1;
    /* Normal 8 bit formats */
    R8Unorm :: 10;
    /* Normal 8 bit formats */
    R8Unorm_sRGB :: 11;
    /* Normal 8 bit formats */
    R8Snorm :: 12;
    /* Normal 8 bit formats */
    R8Uint :: 13;
    /* Normal 8 bit formats */
    R8Sint :: 14;
    /* Normal 16 bit formats */
    R16Unorm :: 20;
    /* Normal 16 bit formats */
    R16Snorm :: 22;
    /* Normal 16 bit formats */
    R16Uint :: 23;
    /* Normal 16 bit formats */
    R16Sint :: 24;
    /* Normal 16 bit formats */
    R16Float :: 25;
    /* Normal 16 bit formats */
    RG8Unorm :: 30;
    /* Normal 16 bit formats */
    RG8Unorm_sRGB :: 31;
    /* Normal 16 bit formats */
    RG8Snorm :: 32;
    /* Normal 16 bit formats */
    RG8Uint :: 33;
    /* Normal 16 bit formats */
    RG8Sint :: 34;
    /* Packed 16 bit formats */
    B5G6R5Unorm :: 40;
    /* Packed 16 bit formats */
    A1BGR5Unorm :: 41;
    /* Packed 16 bit formats */
    ABGR4Unorm :: 42;
    /* Packed 16 bit formats */
    BGR5A1Unorm :: 43;
    /* Normal 32 bit formats */
    R32Uint :: 53;
    /* Normal 32 bit formats */
    R32Sint :: 54;
    /* Normal 32 bit formats */
    R32Float :: 55;
    /* Normal 32 bit formats */
    RG16Unorm :: 60;
    /* Normal 32 bit formats */
    RG16Snorm :: 62;
    /* Normal 32 bit formats */
    RG16Uint :: 63;
    /* Normal 32 bit formats */
    RG16Sint :: 64;
    /* Normal 32 bit formats */
    RG16Float :: 65;
    /* Normal 32 bit formats */
    RGBA8Unorm :: 70;
    /* Normal 32 bit formats */
    RGBA8Unorm_sRGB :: 71;
    /* Normal 32 bit formats */
    RGBA8Snorm :: 72;
    /* Normal 32 bit formats */
    RGBA8Uint :: 73;
    /* Normal 32 bit formats */
    RGBA8Sint :: 74;
    /* Normal 32 bit formats */
    BGRA8Unorm :: 80;
    /* Normal 32 bit formats */
    BGRA8Unorm_sRGB :: 81;
    /* Packed 32 bit formats */
    RGB10A2Unorm :: 90;
    /* Packed 32 bit formats */
    RGB10A2Uint :: 91;
    /* Packed 32 bit formats */
    RG11B10Float :: 92;
    /* Packed 32 bit formats */
    RGB9E5Float :: 93;
    /* Packed 32 bit formats */
    BGR10A2Unorm :: 94;
    /* Packed 32 bit formats */
    BGR10_XR :: 554;
    /* Packed 32 bit formats */
    BGR10_XR_sRGB :: 555;
    /* Normal 64 bit formats */
    RG32Uint :: 103;
    /* Normal 64 bit formats */
    RG32Sint :: 104;
    /* Normal 64 bit formats */
    RG32Float :: 105;
    /* Normal 64 bit formats */
    RGBA16Unorm :: 110;
    /* Normal 64 bit formats */
    RGBA16Snorm :: 112;
    /* Normal 64 bit formats */
    RGBA16Uint :: 113;
    /* Normal 64 bit formats */
    RGBA16Sint :: 114;
    /* Normal 64 bit formats */
    RGBA16Float :: 115;
    /* Normal 64 bit formats */
    BGRA10_XR :: 552;
    /* Normal 64 bit formats */
    BGRA10_XR_sRGB :: 553;
    /* Normal 128 bit formats */
    RGBA32Uint :: 123;
    /* Normal 128 bit formats */
    RGBA32Sint :: 124;
    /* Normal 128 bit formats */
    RGBA32Float :: 125;
    /* S3TC/DXT */
    BC1_RGBA :: 130;
    /* S3TC/DXT */
    BC1_RGBA_sRGB :: 131;
    /* S3TC/DXT */
    BC2_RGBA :: 132;
    /* S3TC/DXT */
    BC2_RGBA_sRGB :: 133;
    /* S3TC/DXT */
    BC3_RGBA :: 134;
    /* S3TC/DXT */
    BC3_RGBA_sRGB :: 135;
    /* RGTC */
    BC4_RUnorm :: 140;
    /* RGTC */
    BC4_RSnorm :: 141;
    /* RGTC */
    BC5_RGUnorm :: 142;
    /* RGTC */
    BC5_RGSnorm :: 143;
    /* BPTC */
    BC6H_RGBFloat :: 150;
    /* BPTC */
    BC6H_RGBUfloat :: 151;
    /* BPTC */
    BC7_RGBAUnorm :: 152;
    /* BPTC */
    BC7_RGBAUnorm_sRGB :: 153;
    /* PVRTC */
    PVRTC_RGB_2BPP :: 160;
    /* PVRTC */
    PVRTC_RGB_2BPP_sRGB :: 161;
    /* PVRTC */
    PVRTC_RGB_4BPP :: 162;
    /* PVRTC */
    PVRTC_RGB_4BPP_sRGB :: 163;
    /* PVRTC */
    PVRTC_RGBA_2BPP :: 164;
    /* PVRTC */
    PVRTC_RGBA_2BPP_sRGB :: 165;
    /* PVRTC */
    PVRTC_RGBA_4BPP :: 166;
    /* PVRTC */
    PVRTC_RGBA_4BPP_sRGB :: 167;
    /* ETC2 */
    EAC_R11Unorm :: 170;
    /* ETC2 */
    EAC_R11Snorm :: 172;
    /* ETC2 */
    EAC_RG11Unorm :: 174;
    /* ETC2 */
    EAC_RG11Snorm :: 176;
    /* ETC2 */
    EAC_RGBA8 :: 178;
    /* ETC2 */
    EAC_RGBA8_sRGB :: 179;
    /* ETC2 */
    ETC2_RGB8 :: 180;
    /* ETC2 */
    ETC2_RGB8_sRGB :: 181;
    /* ETC2 */
    ETC2_RGB8A1 :: 182;
    /* ETC2 */
    ETC2_RGB8A1_sRGB :: 183;
    /* ASTC */
    ASTC_4x4_sRGB :: 186;
    /* ASTC */
    ASTC_5x4_sRGB :: 187;
    /* ASTC */
    ASTC_5x5_sRGB :: 188;
    /* ASTC */
    ASTC_6x5_sRGB :: 189;
    /* ASTC */
    ASTC_6x6_sRGB :: 190;
    /* ASTC */
    ASTC_8x5_sRGB :: 192;
    /* ASTC */
    ASTC_8x6_sRGB :: 193;
    /* ASTC */
    ASTC_8x8_sRGB :: 194;
    /* ASTC */
    ASTC_10x5_sRGB :: 195;
    /* ASTC */
    ASTC_10x6_sRGB :: 196;
    /* ASTC */
    ASTC_10x8_sRGB :: 197;
    /* ASTC */
    ASTC_10x10_sRGB :: 198;
    /* ASTC */
    ASTC_12x10_sRGB :: 199;
    /* ASTC */
    ASTC_12x12_sRGB :: 200;
    /* ASTC */
    ASTC_4x4_LDR :: 204;
    /* ASTC */
    ASTC_5x4_LDR :: 205;
    /* ASTC */
    ASTC_5x5_LDR :: 206;
    /* ASTC */
    ASTC_6x5_LDR :: 207;
    /* ASTC */
    ASTC_6x6_LDR :: 208;
    /* ASTC */
    ASTC_8x5_LDR :: 210;
    /* ASTC */
    ASTC_8x6_LDR :: 211;
    /* ASTC */
    ASTC_8x8_LDR :: 212;
    /* ASTC */
    ASTC_10x5_LDR :: 213;
    /* ASTC */
    ASTC_10x6_LDR :: 214;
    /* ASTC */
    ASTC_10x8_LDR :: 215;
    /* ASTC */
    ASTC_10x10_LDR :: 216;
    /* ASTC */
    ASTC_12x10_LDR :: 217;
    /* ASTC */
    ASTC_12x12_LDR :: 218;
    // ASTC HDR (High Dynamic Range) Formats
    ASTC_4x4_HDR :: 222;
    // ASTC HDR (High Dynamic Range) Formats
    ASTC_5x4_HDR :: 223;
    // ASTC HDR (High Dynamic Range) Formats
    ASTC_5x5_HDR :: 224;
    // ASTC HDR (High Dynamic Range) Formats
    ASTC_6x5_HDR :: 225;
    // ASTC HDR (High Dynamic Range) Formats
    ASTC_6x6_HDR :: 226;
    // ASTC HDR (High Dynamic Range) Formats
    ASTC_8x5_HDR :: 228;
    // ASTC HDR (High Dynamic Range) Formats
    ASTC_8x6_HDR :: 229;
    // ASTC HDR (High Dynamic Range) Formats
    ASTC_8x8_HDR :: 230;
    // ASTC HDR (High Dynamic Range) Formats
    ASTC_10x5_HDR :: 231;
    // ASTC HDR (High Dynamic Range) Formats
    ASTC_10x6_HDR :: 232;
    // ASTC HDR (High Dynamic Range) Formats
    ASTC_10x8_HDR :: 233;
    // ASTC HDR (High Dynamic Range) Formats
    ASTC_10x10_HDR :: 234;
    // ASTC HDR (High Dynamic Range) Formats
    ASTC_12x10_HDR :: 235;
    // ASTC HDR (High Dynamic Range) Formats
    ASTC_12x12_HDR :: 236;
    /*!
     @constant MTLPixelFormatGBGR422
     @abstract A pixel format where the red and green channels are subsampled horizontally.  Two pixels are stored in 32 bits, with shared red and blue values, and unique green values.
     @discussion This format is equivalent to YUY2, YUYV, yuvs, or GL_RGB_422_APPLE/GL_UNSIGNED_SHORT_8_8_REV_APPLE.   The component order, from lowest addressed byte to highest, is Y0, Cb, Y1, Cr.  There is no implicit colorspace conversion from YUV to RGB, the shader will receive (Cr, Y, Cb, 1).  422 textures must have a width that is a multiple of 2, and can only be used for 2D non-mipmap textures.  When sampling, ClampToEdge is the only usable wrap mode.
     */
    GBGR422 :: 240;
    /*!
     @constant MTLPixelFormatBGRG422
     @abstract A pixel format where the red and green channels are subsampled horizontally.  Two pixels are stored in 32 bits, with shared red and blue values, and unique green values.
     @discussion This format is equivalent to UYVY, 2vuy, or GL_RGB_422_APPLE/GL_UNSIGNED_SHORT_8_8_APPLE. The component order, from lowest addressed byte to highest, is Cb, Y0, Cr, Y1.  There is no implicit colorspace conversion from YUV to RGB, the shader will receive (Cr, Y, Cb, 1).  422 textures must have a width that is a multiple of 2, and can only be used for 2D non-mipmap textures.  When sampling, ClampToEdge is the only usable wrap mode.
     */
    BGRG422 :: 241;
    /* Depth */
    Depth16Unorm :: 250;
    /* Depth */
    Depth32Float :: 252;
    /* Stencil */
    Stencil8 :: 253;
    /* Depth Stencil */
    Depth24Unorm_Stencil8 :: 255;
    /* Depth Stencil */
    Depth32Float_Stencil8 :: 260;
    /* Depth Stencil */
    X32_Stencil8 :: 261;
    /* Depth Stencil */
    X24_Stencil8 :: 262;
    /* Depth Stencil */
    Unspecialized :: 263;
}

/// An enumeration of the different data types in Metal.
MTLDataType :: enum NSUInteger {
    /// Represents no data type.
    None :: 0;
    /// Represents a struct data type.
    Struct :: 1;
    /// Represents an array data type.
    Array :: 2;
    /// Represents a data type consisting of a single floating-point value.
    Float :: 3;
    /// Represents a data type consisting of a vector of two floating-point values.
    Float2 :: 4;
    /// Represents a data type consisting of a vector of three floating-point values.
    Float3 :: 5;
    /// Represents a data type consisting of a vector of four floating-point values.
    Float4 :: 6;
    /// Represents a data type consisting of a 2x2 floating-point matrix.
    Float2x2 :: 7;
    /// Represents a data type consisting of a 2x3 floating-point matrix.
    Float2x3 :: 8;
    /// Represents a data type consisting of a 2x4 floating-point matrix.
    Float2x4 :: 9;
    /// Represents a data type consisting of a 3x2 floating-point matrix.
    Float3x2 :: 10;
    /// Represents a data type consisting of a 3x3 floating-point matrix.
    Float3x3 :: 11;
    /// Represents a data type consisting of a 3x4 floating-point matrix.
    Float3x4 :: 12;
    /// Represents a data type consisting of a 4x2 floating-point matrix.
    Float4x2 :: 13;
    /// Represents a data type consisting of a 4x3 floating-point matrix.
    Float4x3 :: 14;
    /// Represents a data type consisting of a 4x4 floating-point matrix.
    Float4x4 :: 15;
    /// Represents a data type consisting of a half-precision floating-point value.
    Half :: 16;
    /// Represents a data type consisting of a vector of two half-precision floating-point values.
    Half2 :: 17;
    /// Represents a data type consisting of a vector of three half-precision floating-point values.
    Half3 :: 18;
    /// Represents a data type consisting of a vector of four half-precision floating-point values.
    Half4 :: 19;
    /// Represents a data type consisting of a 2x2 half-precision floating-point matrix.
    Half2x2 :: 20;
    /// Represents a data type consisting of a 2x3 half-precision floating-point matrix.
    Half2x3 :: 21;
    /// Represents a data type consisting of a 2x4 half-precision floating-point matrix.
    Half2x4 :: 22;
    /// Represents a data type consisting of a 3x2 half-precision floating-point matrix.
    Half3x2 :: 23;
    /// Represents a data type consisting of a 3x3 half-precision floating-point matrix.
    Half3x3 :: 24;
    /// Represents a data type consisting of a 3x4 half-precision floating-point matrix.
    Half3x4 :: 25;
    /// Represents a data type consisting of a 4x2 half-precision floating-point matrix.
    Half4x2 :: 26;
    /// Represents a data type consisting of a 4x3 half-precision floating-point matrix.
    Half4x3 :: 27;
    /// Represents a data type consisting of a 4x4 half-precision floating-point matrix.
    Half4x4 :: 28;
    /// Represents a data type consisting of a single signed integer value.
    Int :: 29;
    /// Represents a data type consisting of a vector of two signed integer values.
    Int2 :: 30;
    /// Represents a data type consisting of a vector of three signed integer values.
    Int3 :: 31;
    /// Represents a data type consisting of a vector of four signed integer values.
    Int4 :: 32;
    /// Represents a data type consisting of a single unsigned integer value.
    UInt :: 33;
    /// Represents a data type consisting of a vector of two unsigned integer values.
    UInt2 :: 34;
    /// Represents a data type consisting of a vector of three unsigned integer values.
    UInt3 :: 35;
    /// Represents a data type consisting of a vector of four unsigned integer values.
    UInt4 :: 36;
    /// Represents a data type consisting of a single 16-bit signed integer value.
    Short :: 37;
    /// Represents a data type consisting of a vector of two 16-bit signed integer values.
    Short2 :: 38;
    /// Represents a data type consisting of a vector of three 16-bit signed integer values.
    Short3 :: 39;
    /// Represents a data type consisting of a vector of three 16-bit signed integer values.
    Short4 :: 40;
    /// Represents a data type consisting of a single 16-bit unsigned integer value.
    UShort :: 41;
    /// Represents a data type consisting of a vector of two 16-bit unsigned integer values.
    UShort2 :: 42;
    /// Represents a data type consisting of a vector of three 16-bit unsigned integer values.
    UShort3 :: 43;
    /// Represents a data type consisting of a vector of four 16-bit unsigned integer values.
    UShort4 :: 44;
    /// Represents a data type consisting of a single signed character value.
    Char :: 45;
    /// Represents a data type consisting of a vector of two signed character values.
    Char2 :: 46;
    /// Represents a data type consisting of a vector of three signed character values.
    Char3 :: 47;
    /// Represents a data type consisting of a vector of four signed character values.
    Char4 :: 48;
    /// Represents a data type consisting of a single unsigned character value.
    UChar :: 49;
    /// Represents a data type consisting of a vector of two unsigned character values.
    UChar2 :: 50;
    /// Represents a data type consisting of a vector of three unsigned character values.
    UChar3 :: 51;
    /// Represents a data type consisting of a vector of four unsigned character values.
    UChar4 :: 52;
    /// Represents a data type consisting of a single boolean value.
    Bool :: 53;
    /// Represents a data type consisting of a vector of two boolean values.
    Bool2 :: 54;
    /// Represents a data type consisting of a vector of three boolean values.
    Bool3 :: 55;
    /// Represents a data type consisting of a vector of four boolean values.
    Bool4 :: 56;
    /// Represents a data type corresponding to a texture object.
    Texture :: 58;
    /// Represents a data type corresponding to a sampler state object.
    Sampler :: 59;
    /// Represents a data type corresponding to a pointer.
    Pointer :: 60;
    /// Represents an image block data type consisting of an unsigned 8-bit red channel normalized to the [0-1] range.
    R8Unorm :: 62;
    /// Represents an image block data type consisting of an signed 8-bit red channel normalized to the [0-1] range.
    R8Snorm :: 63;
    /// Represents an image block data type consisting of an unsigned 16-bit red channel normalized to the [0-1] range.
    R16Unorm :: 64;
    /// Represents an image block data type consisting of a signed 16-bit red channel normalized to the [0-1] range.
    R16Snorm :: 65;
    /// Represents an image block data type consisting of an unsigned 8-bit red channel and a unsigned 8-bit green channel, both normalized to the [0-1] range.
    RG8Unorm :: 66;
    /// Represents an image block data type consisting of a signed 8-bit red channel and a signed 8-bit green channel, both normalized to the [0-1] range.
    RG8Snorm :: 67;
    /// Represents an image block data type consisting of an unsigned 16-bit red channel and an unsigned 16-bit green channel, both normalized to the [0-1] range.
    RG16Unorm :: 68;
    /// Represents an image block data type consisting of a signed 16-bit red channel and a signed 16-bit green channel, both normalized to the [0-1] range.
    RG16Snorm :: 69;
    /// Represents an image block data type consisting of four unsigned 8-bit channels normalized to the [0-1] range.
    RGBA8Unorm :: 70;
    /// Represents an image block data type consisting of four unsigned 8-bit channels normalized to the [0-1] range and subject to gamma-correction.
    RGBA8Unorm_sRGB :: 71;
    /// Represents an image block data type consisting of four signed 8-bit channels normalized to the [0-1] range.
    RGBA8Snorm :: 72;
    /// Represents an image block data type consisting of four unsigned 16-bit channels normalized to the [0-1] range.
    RGBA16Unorm :: 73;
    /// Represents an image block data type consisting of four signed 16-bit channels normalized to the [0-1] range.
    RGBA16Snorm :: 74;
    /// Represents an image block data type consisting of three unsigned 10-bit channels and one 2-bit unsigned alpha channel, all normalized to the [0-1] range.
    RGB10A2Unorm :: 75;
    /// Represents an image block data type consisting of two 11-bit floating-point channels, and one 10-bit floating-point blue channel.
    RG11B10Float :: 76;
    /// Represents an image block data type consisting of three 9-bit floating-point channels, and one 5-bit floating-point exponent.
    RGB9E5Float :: 77;
    /// Represents a data type corresponding to a render pipeline state object.
    RenderPipeline :: 78;
    /// Represents a data type corresponding to a compute pipeline state object.
    ComputePipeline :: 79;
    /// Represents a data type corresponding to an indirect command buffer object.
    IndirectCommandBuffer :: 80;
    /// Represents a data type consisting of a signed long integer value.
    Long :: 81;
    /// Represents a data type consisting of a vector of two signed long integer values.
    Long2 :: 82;
    /// Represents a data type consisting of a vector of three signed long integer values.
    Long3 :: 83;
    /// Represents a data type consisting of a vector of four signed long integer values.
    Long4 :: 84;
    /// Represents a data type consisting of an unsigned long integer value.
    ULong :: 85;
    /// Represents a data type consisting of a vector two unsigned long integer values.
    ULong2 :: 86;
    /// Represents a data type consisting of a vector three unsigned long integer values.
    ULong3 :: 87;
    /// Represents a data type consisting of a vector four unsigned long integer values.
    ULong4 :: 88;
    /// Represents a data type corresponding to a visible function table object.
    VisibleFunctionTable :: 115;
    /// Represents a data type corresponding to an intersection function table object.
    IntersectionFunctionTable :: 116;
    /// Represents a data type corresponding to a primitive acceleration structure.
    PrimitiveAccelerationStructure :: 117;
    /// Represents a data type corresponding to an instance acceleration structure.
    InstanceAccelerationStructure :: 118;
    /// Represents a data type consisting of a single BFloat value.
    BFloat :: 121;
    /// Represents a data type consisting of a vector two BFloat values.
    BFloat2 :: 122;
    /// Represents a data type consisting of a vector three BFloat values.
    BFloat3 :: 123;
    /// Represents a data type consisting of a vector four BFloat values.
    BFloat4 :: 124;
    /// Represents a data type corresponding to a depth-stencil state object.
    DepthStencilState :: 139;
    /// Represents a data type corresponding to a machine learning tensor.
    Tensor :: 140;
}

/// The possible data types for the elements of a tensor.
MTLTensorDataType :: enum NSInteger {
    None :: 0;
    Float32 :: 3;
    Float16 :: 16;
    BFloat16 :: 121;
    Int8 :: 45;
    UInt8 :: 49;
    Int16 :: 37;
    UInt16 :: 41;
    Int32 :: 29;
    UInt32 :: 33;
    Int4 :: 143;
    UInt4 :: 144;
}

/// The error codes that Metal can raise when you create a tensor.
MTLTensorError :: enum NSInteger {
    None :: 0;
    InternalError :: 1;
    InvalidDescriptor :: 2;
}

/// The type that represents the different contexts for a tensor.
MTLTensorUsage :: enum_flags NSUInteger {
    /// A tensor context that applies to compute encoders.
    ///
    /// You can use tensors with this context in ``MTL4ComputeCommandEncoder`` or ``MTLComputeCommandEncoder`` instances.
    Compute :: 1;
    /// A tensor context that applies to render encoders.
    ///
    /// You can use tensors with this context in ``MTL4RenderCommandEncoder`` or ``MTLRenderCommandEncoder`` instances.
    Render :: 2;
    /// A tensor context that applies to machine learning encoders.
    ///
    /// You can use tensors with this context in ``MTL4MachineLearningCommandEncoder`` instances.
    MachineLearning :: 4;
}

/*!
 @enum MTLTextureType
 @abstract MTLTextureType describes the dimensionality of each image, and if multiple images are arranged into an array or cube.
 */
MTLTextureType :: enum NSUInteger {
    e1D :: 0;
    e1DArray :: 1;
    e2D :: 2;
    e2DArray :: 3;
    e2DMultisample :: 4;
    Cube :: 5;
    CubeArray :: 6;
    e3D :: 7;
    e2DMultisampleArray :: 8;
    TextureBuffer :: 9;
}

MTLTextureSwizzle :: enum u8 {
    Zero :: 0;
    One :: 1;
    Red :: 2;
    Green :: 3;
    Blue :: 4;
    Alpha :: 5;
}

/*!
 @enum MTLTextureUsage
 @abstract MTLTextureUsage declares how the texture will be used over its lifetime (bitwise OR for multiple uses).
 @discussion This information may be used by the driver to make optimization decisions.
*/
MTLTextureUsage :: enum_flags NSUInteger {
    Unknown :: 0;
    ShaderRead :: 1;
    ShaderWrite :: 2;
    RenderTarget :: 4;
    PixelFormatView :: 16;
    ShaderAtomic :: 32;
}

MTLTextureCompressionType :: enum NSInteger {
    Lossless :: 0;
    Lossy :: 1;
}

MTLIndexType :: enum NSUInteger {
    UInt16 :: 0;
    UInt32 :: 1;
}

/*!
 @enum MTLBindingsType
 @abstract The type of a resource binding.
 
 @constant MTLBindingTypeBuffer
 This binding represents a buffer.
 
 @constant MTLBindingTypeThreadgroupMemory
 This binding represents threadgroup memory.
 
 @constant MTLBindingTypeTexture
 This binding represents a texture.
 
 @constant MTLBindingTypeSampler
 This binding represents a sampler.
 
 @constant MTLBindingTypeImageblockData
 This binding represents an image block data.
 
 @constant MTLBindingTypeImageblock
 This binding represents an image block.
  
 @constant MTLBindingTypeVisibleFunctionTable
 This binding represents a visible function table object.
 
 @constant MTLBindingTypePrimitiveAccelerationStructure
 This binding represents a primitive acceleration structure object.
 
 @constant MTLBindingTypeInstanceAccelerationStructure
 This binding represents an instance acceleration structure object.
 
 @constant MTLBinidngTypeIntersectionFunctionTable
 This binding represents an intersection function table object.
 
 @constant MTLBindingTypeObjectPayload
 This binding represents an object payload.
 
 @constant MTLBindingTypeTensor
 This binding represents a tensor object.
*/
MTLBindingType :: enum NSInteger {
    Buffer :: 0;
    ThreadgroupMemory :: 1;
    Texture :: 2;
    Sampler :: 3;
    ImageblockData :: 16;
    Imageblock :: 17;
    VisibleFunctionTable :: 24;
    PrimitiveAccelerationStructure :: 25;
    InstanceAccelerationStructure :: 26;
    IntersectionFunctionTable :: 27;
    ObjectPayload :: 34;
    Tensor :: 37;
}

/*!
 @enum MTLArgumentType
 @abstract The type for an input to a MTLRenderPipelineState or a MTLComputePipelineState
 
 @constant MTLArgumentTypeBuffer
 This input is a MTLBuffer
 
 @constant MTLArgumentTypeThreadgroupMemory
 This input is a pointer to the threadgroup memory.
 
 @constant MTLArgumentTypeTexture
 This input is a MTLTexture.
 
 @constant MTLArgumentTypeSampler
 This input is a sampler.
*/
MTLArgumentType :: enum NSUInteger {
    Buffer :: 0;
    ThreadgroupMemory :: 1;
    Texture :: 2;
    Sampler :: 3;
    ImageblockData :: 16;
    Imageblock :: 17;
    VisibleFunctionTable :: 24;
    PrimitiveAccelerationStructure :: 25;
    InstanceAccelerationStructure :: 26;
    IntersectionFunctionTable :: 27;
}

MTLBindingAccess :: enum NSUInteger {
    ReadOnly :: 0;
    ReadWrite :: 1;
    WriteOnly :: 2;
    MTLArgumentAccessReadOnly :: 0;
    MTLArgumentAccessReadWrite :: 1;
    MTLArgumentAccessWriteOnly :: 2;
}

MTLFunctionOptions :: enum_flags NSUInteger {
    /**
     * @brief Default usage
     */
    None :: 0;
    /**
     * @brief Compiles the found function. This enables dynamic linking of this `MTLFunction`.
     * Only supported for `visible` functions.
     */
    CompileToBinary :: 1;
    /**
     * @brief stores and tracks this function in a Metal Pipelines Script
     * This flag is optional and only supported in the context of binary archives.
     * @discussion This flag is required for inspecting and consuming binary archives with specialized MTLFunctions via the metal-source tool. It is not required for recompilation, nor for storing functions in binary archives. Set this flag only if you intend to use metal-source on a serialized binary archive.
     */
    StoreFunctionInMetalPipelinesScript :: 2;
    /**
     * @brief stores and tracks this function in a Metal Pipelines Script
     * This flag is optional and only supported in the context of binary archives.
     * @discussion This flag is required for inspecting and consuming binary archives with specialized MTLFunctions via the metal-source tool. It is not required for recompilation, nor for storing functions in binary archives. Set this flag only if you intend to use metal-source on a serialized binary archive.
     */
    StoreFunctionInMetalScript :: 2;
    /**
         * @brief Function creation fails (i.e nil is returned) if:
         * - A lookup binary archive has been specified
         * - The function has not been found in the archive
         */
    FailOnBinaryArchiveMiss :: 4;
    /**
     * @brief Compiles the function to have its function handles return a constant MTLResourceID across
     * all pipeline states. The function needs to be linked to the pipeline that will use this function.
     * This function option can only be used for functions that are compiled with `MTLFunctionOptionCompileToBinary`.
     */
    PipelineIndependent :: 8;
}

MTLPatchType :: enum NSUInteger {
    None :: 0;
    Triangle :: 1;
    Quad :: 2;
}

/*!
 @enum MTLFunctionType
 @abstract An identifier for a top-level Metal function.
 @discussion Each location in the API where a program is used requires a function written for that specific usage.
 
 @constant MTLFunctionTypeVertex
 A vertex shader, usable for a MTLRenderPipelineState.
 
 @constant MTLFunctionTypeFragment
 A fragment shader, usable for a MTLRenderPipelineState.
 
 @constant MTLFunctionTypeKernel
 A compute kernel, usable to create a MTLComputePipelineState.
 */
MTLFunctionType :: enum NSUInteger {
    Vertex :: 1;
    Fragment :: 2;
    Kernel :: 3;
    Visible :: 5;
    Intersection :: 6;
    Mesh :: 7;
    Object :: 8;
}

MTLLanguageVersion :: enum NSUInteger {
    e1_0 :: 65536;
    e1_1 :: 65537;
    e1_2 :: 65538;
    e2_0 :: 131072;
    e2_1 :: 131073;
    e2_2 :: 131074;
    e2_3 :: 131075;
    e2_4 :: 131076;
    e3_0 :: 196608;
    e3_1 :: 196609;
    e3_2 :: 196610;
    e4_0 :: 262144;
}

MTLLibraryType :: enum NSInteger {
    Executable :: 0;
    Dynamic :: 1;
}

/*!
 @enum MTLLibraryOptimizationLevel
 @abstract Optimization level for the Metal compiler.
 
 @constant MTLLibraryOptimizationLevelDefault
 Optimize for program performance.
 
 @constant MTLLibraryOptimizationLevelSize
 Like default, with extra optimizations to reduce code size.
 */
MTLLibraryOptimizationLevel :: enum NSInteger {
    Default :: 0;
    Size :: 1;
}

MTLCompileSymbolVisibility :: enum NSInteger {
    Default :: 0;
    Hidden :: 1;
}

/*!
 @enum MTLMathMode
 @abstract An enum to indicate if the compiler can perform optimizations for floating-point arithmetic that may violate the IEEE 754 standard
 
 @constant MTLMathModeSafe 
 Disables unsafe floating-point optimizations

 @constant MTLMathModeRelaxed
 Allows aggressive, unsafe floating-point optimizations but preserves infs and nans

 @constant MTLMathModeFast
 Allows aggressive, unsafe floating-point optimizations
 */
MTLMathMode :: enum NSInteger {
    Safe :: 0;
    Relaxed :: 1;
    Fast :: 2;
}

/*!
 @enum MTLMathFloatingPointFunctions
 @abstract An enum to indicate the default math functions for single precision floating-point
 
 @constant MTLMathFloatingPointFunctionsFast
 Sets the default math functions for single precision floating-point to the corresponding functions in `metal::fast` namespace

 @constant MTLMathFloatingPointFunctionsPrecise
 Sets the default math functions for single precision floating-point to the corresponding functions in 'metal::precise' namespace
 */
MTLMathFloatingPointFunctions :: enum NSInteger {
    Fast :: 0;
    Precise :: 1;
}

/*!
 @enum MTLLibraryError
 @abstract NSErrors raised when creating a library.
 */
MTLLibraryError :: enum NSUInteger {
    Unsupported :: 1;
    Internal :: 2;
    CompileFailure :: 3;
    CompileWarning :: 4;
    FunctionNotFound :: 5;
    FileNotFound :: 6;
}

/*!
 @enum MTLCounterSampleBufferError
 @constant MTLCounterSampleBufferErrorOutOfMemory
 There wasn't enough memory available to allocate the counter sample buffer.
 
 @constant MTLCounterSampleBufferErrorInvalid
 Invalid parameter passed while creating counter sample buffer.

 @constant MTLCounterSampleBufferErrorInternal
 There was some other error in allocating the counter sample buffer.
 */
MTLCounterSampleBufferError :: enum NSInteger {
    OutOfMemory :: 0;
    Invalid :: 1;
    Internal :: 2;
}

/// Represents the status of a compiler task.
MTL4CompilerTaskStatus :: enum NSInteger {
    /// No status.
    None :: 0;
    /// The compiler task is currently scheduled.
    Scheduled :: 1;
    /// The compiler task is currently compiling.
    Compiling :: 2;
    /// The compiler task is finished.
    Finished :: 3;
}

/// Defines the type of a ``MTL4CounterHeap`` and the contents of its entries.
MTL4CounterHeapType :: enum NSInteger {
    /// Specifies that ``MTL4CounterHeap`` entries contain invalid data.
    Invalid :: 0;
    /// Specifies that ``MTL4CounterHeap`` entries contain GPU timestamp data.
    Timestamp :: 1;
}

/// Provides a hint to the system about the desired accuracy when writing GPU counter timestamps.
///
/// Pass these values to ``MTL4ComputeCommandEncoder/writeTimestampWithGranularity:intoHeap:atIndex:`` and
/// ``MTL4RenderCommandEncoder/writeTimestampWithGranularity:afterStage:intoHeap:atIndex:`` to control the
/// desired accurracy of the counter sampling operation.
MTL4TimestampGranularity :: enum NSInteger {
    /// A minimally-invasive timestamp which may be less precise.
    ///
    /// Using this granularity incurs in the lowest overhead, at the cost of precision. For example, it may sample at
    /// command encoder boundaries.
    Relaxed :: 0;
    /// A timestamp as precise as possible.
    ///
    /// Using this granularity may incur in a performance penalty, for example, it may cause splitting of command encoders.
    Precise :: 1;
}

MTLIOCompressionMethod :: enum NSInteger {
    Zlib :: 0;
    LZFSE :: 1;
    LZ4 :: 2;
    LZMA :: 3;
    LZBitmap :: 4;
}

MTLFeatureSet :: enum NSUInteger {
    _iOS_GPUFamily1_v1 :: 0;
    _iOS_GPUFamily2_v1 :: 1;
    _iOS_GPUFamily1_v2 :: 2;
    _iOS_GPUFamily2_v2 :: 3;
    _iOS_GPUFamily3_v1 :: 4;
    _iOS_GPUFamily1_v3 :: 5;
    _iOS_GPUFamily2_v3 :: 6;
    _iOS_GPUFamily3_v2 :: 7;
    _iOS_GPUFamily1_v4 :: 8;
    _iOS_GPUFamily2_v4 :: 9;
    _iOS_GPUFamily3_v3 :: 10;
    _iOS_GPUFamily4_v1 :: 11;
    _iOS_GPUFamily1_v5 :: 12;
    _iOS_GPUFamily2_v5 :: 13;
    _iOS_GPUFamily3_v4 :: 14;
    _iOS_GPUFamily4_v2 :: 15;
    _iOS_GPUFamily5_v1 :: 16;
    _macOS_GPUFamily1_v1 :: 10000;
    // deprecated
    _OSX_GPUFamily1_v1 :: 10000;
    _macOS_GPUFamily1_v2 :: 10001;
    // deprecated
    _OSX_GPUFamily1_v2 :: 10001;
    _macOS_ReadWriteTextureTier2 :: 10002;
    // deprecated
    _OSX_ReadWriteTextureTier2 :: 10002;
    _macOS_GPUFamily1_v3 :: 10003;
    _macOS_GPUFamily1_v4 :: 10004;
    _macOS_GPUFamily2_v1 :: 10005;
    _tvOS_GPUFamily1_v1 :: 30000;
    // deprecated
    _TVOS_GPUFamily1_v1 :: 30000;
    _tvOS_GPUFamily1_v2 :: 30001;
    _tvOS_GPUFamily1_v3 :: 30002;
    _tvOS_GPUFamily2_v1 :: 30003;
    _tvOS_GPUFamily1_v4 :: 30004;
    _tvOS_GPUFamily2_v2 :: 30005;
}

MTLGPUFamily :: enum NSInteger {
    Apple1 :: 1001;
    Apple2 :: 1002;
    Apple3 :: 1003;
    Apple4 :: 1004;
    Apple5 :: 1005;
    Apple6 :: 1006;
    Apple7 :: 1007;
    Apple8 :: 1008;
    Apple9 :: 1009;
    Apple10 :: 1010;
    Mac1 :: 2001;
    Mac2 :: 2002;
    Common1 :: 3001;
    Common2 :: 3002;
    Common3 :: 3003;
    MacCatalyst1 :: 4001;
    MacCatalyst2 :: 4002;
    Metal3 :: 5001;
    Metal4 :: 5002;
}

/*!
 @enum MTLDeviceLocation
 @abstract Specifies the location of the GPU on macOS
 */
MTLDeviceLocation :: enum NSUInteger {
    BuiltIn :: 0;
    Slot :: 1;
    External :: 2;
    Unspecified :: 18446744073709551615;
}

/*!
 @enum MTLPipelineOption
 @abstract Controls the creation of the pipeline
 */
MTLPipelineOption :: enum_flags NSUInteger {
    None :: 0;
    ArgumentInfo :: 1;
    BindingInfo :: 1;
    BufferTypeInfo :: 2;
    FailOnBinaryArchiveMiss :: 4;
}

/*!
 @enum MTLReadWriteTextureTier
 @abstract MTLReadWriteTextureTier determines support level for read-write texture formats.
 */
MTLReadWriteTextureTier :: enum NSUInteger {
    None :: 0;
    e1 :: 1;
    e2 :: 2;
}

/*!
 @enum MTLArgumentBuffersTier
 @abstract MTLArgumentBuffersTier determines support level for argument buffers.
 */
MTLArgumentBuffersTier :: enum NSUInteger {
    e1 :: 0;
    e2 :: 1;
}

/*!
 @enum MTLSparseTextureRegionAlignmentMode
 @abstract MTLSparseTextureRegionAlignmentMode determines type of alignment used when converting from pixel region to tile region.
 */
MTLSparseTextureRegionAlignmentMode :: enum NSUInteger {
    Outward :: 0;
    Inward :: 1;
}

/*!
 @enum MTLCounterSamplingPoint
 @abstract MTLCounterSamplingPoint determines type of sampling points that are supported on given device.

 @constant MTLCounterSamplingPointAtStageBoundary
 Counter sampling points at render, compute, and blit command encoder stage boundary are supported.

 @constant MTLCounterSamplingPointAtDrawBoundary
 Counter sampling at draw boundary is supported, render encoder method sampleCountersInBuffer can be used for sampling.

 @constant MTLCounterSamplingPointAtDispatchBoundary
 Counter sampling at compute dispatch boundary is supported, compute encoder method sampleCountersInBuffer can be used for sampling.

 @constant MTLCounterSamplingPointAtTileDispatchBoundary
 Counter sampling at tile shader dispatch boundary is supported.

 @constant MTLCounterSamplingPointAtBlitBoundary
 Counter sampling at blit boundary is supported, blit encoder method sampleCountersInBuffer can be used for sampling.
*/
MTLCounterSamplingPoint :: enum NSUInteger {
    AtStageBoundary :: 0;
    AtDrawBoundary :: 1;
    AtDispatchBoundary :: 2;
    AtTileDispatchBoundary :: 3;
    AtBlitBoundary :: 4;
}

/// Enumeration of kinds of errors that methods on MTLDevice can produce.
MTLDeviceError :: enum NSInteger {
    /// Indicates the absence of any problems.
    None :: 0;
    /// Indicates the requested feature is not supported by the current device.
    NotSupported :: 1;
}

/*!
 @enum MTLSparseTextureMappingMode
 @abstract Type of mapping operation for sparse texture
 */
MTLSparseTextureMappingMode :: enum NSUInteger {
    Map :: 0;
    Unmap :: 1;
}

MTLLoadAction :: enum NSUInteger {
    DontCare :: 0;
    Load :: 1;
    Clear :: 2;
}

MTLStoreAction :: enum NSUInteger {
    DontCare :: 0;
    Store :: 1;
    MultisampleResolve :: 2;
    StoreAndMultisampleResolve :: 3;
    Unknown :: 4;
    CustomSampleDepthStore :: 5;
}

MTLStoreActionOptions :: enum_flags NSUInteger {
    None :: 0;
    CustomSamplePositions :: 1;
}

/// This enumeration controls if Metal accumulates visibility results between render encoders or resets them.
///
/// You can specify this property for ``MTLRenderCommandEncoders`` and for ``MTL4RenderCommandEncoders`` through
/// their descriptors' ``MTLRenderCommandEncoder/visibilityResultType`` and ``MTL4RenderCommandEncoder/visibilityResultType``
/// methods.
MTLVisibilityResultType :: enum NSInteger {
    /// Reset visibility result data when you create a render command encoder.
    Reset :: 0;
    /// Accumulate visibility results data across multiple render passes.
    Accumulate :: 1;
}

/*!
 @enum MTLMultisampleDepthResolveFilter
 @abstract Controls the MSAA depth resolve operation. Supported on iOS GPU Family 3 and later.
 */
MTLMultisampleDepthResolveFilter :: enum NSUInteger {
    Sample0 :: 0;
    Min :: 1;
    Max :: 2;
}

/*!
 @enum MTLMultisampleStencilResolveFilter
 @abstract Controls the MSAA stencil resolve operation.
 */
MTLMultisampleStencilResolveFilter :: enum NSUInteger {
    /*!
     @constant MTLMultisampleStencilResolveFilterSample0
     @abstract The stencil sample corresponding to sample 0. This is the default behavior.
     */
    Sample0 :: 0;
    /*!
     @constant MTLMultisampleStencilResolveFilterDepthResolvedSample
     @abstract The stencil sample corresponding to whichever depth sample is selected by the depth resolve filter. If depth resolve is not enabled, the stencil sample is chosen based on what a depth resolve filter would have selected.
     */
    DepthResolvedSample :: 1;
}

/*!
 @enum MTLBlitOption
 @abstract Controls the blit operation
 */
MTLBlitOption :: enum_flags NSUInteger {
    None :: 0;
    DepthFromDepthStencil :: 1;
    StencilFromDepthStencil :: 2;
    RowLinearPVRTC :: 4;
}

/*!
 @enum MTLCommandBufferStatus
 
 @abstract MTLCommandBufferStatus reports the current stage in the lifetime of MTLCommandBuffer, as it proceeds to enqueued, committed, scheduled, and completed.
 
 @constant MTLCommandBufferStatusNotEnqueued
 The command buffer has not been enqueued yet.
 
 @constant MTLCommandBufferStatusEnqueued
 This command buffer is enqueued, but not committed.
 
 @constant MTLCommandBufferStatusCommitted
 Commited to its command queue, but not yet scheduled for execution.
 
 @constant MTLCommandBufferStatusScheduled
 All dependencies have been resolved and the command buffer has been scheduled for execution.
 
 @constant MTLCommandBufferStatusCompleted
 The command buffer has finished executing successfully: any blocks set with -addCompletedHandler: may now be called.
 
 @constant MTLCommandBufferStatusError
 Execution of the command buffer was aborted due to an error during execution.  Check -error for more information.
 */
MTLCommandBufferStatus :: enum NSUInteger {
    NotEnqueued :: 0;
    Enqueued :: 1;
    Committed :: 2;
    Scheduled :: 3;
    Completed :: 4;
    Error :: 5;
}

/*!
 @enum MTLCommandBufferError
 @abstract Error codes that can be found in MTLCommandBuffer.error
 
 @constant MTLCommandBufferErrorInternal
 An internal error that doesn't fit into the other categories. The actual low level error code is encoded in the local description.
 
 @constant MTLCommandBufferErrorTimeout
 Execution of this command buffer took too long, execution of this command was interrupted and aborted.
 
 @constant MTLCommandBufferErrorPageFault
 Execution of this command buffer generated an unserviceable GPU page fault. This can caused by buffer read write attribute mismatch or out of boundary access.
 
 @constant MTLCommandBufferErrorAccessRevoked
 Access to this device has been revoked because this client has been responsible for too many timeouts or hangs.
 
 @constant MTLCommandBufferErrorNotPermitted
 This process does not have access to use this device.
 
 @constant MTLCommandBufferErrorOutOfMemory
 Insufficient memory was available to execute this command buffer.
 
 @constant MTLCommandBufferErrorInvalidResource
 The command buffer referenced an invalid resource.  This is most commonly caused when the caller deletes a resource before executing a command buffer that refers to it.
 
 @constant MTLCommandBufferErrorMemoryless
 One or more internal resources limits reached that prevent using memoryless render pass attachments. See error string for more detail.
 
 @constant MTLCommandBufferErrorDeviceRemoved
 The device was physically removed before the command could finish execution

 @constant MTLCommandBufferErrorStackOverflow
 Execution of the command buffer was stopped due to Stack Overflow Exception. [MTLComputePipelineDescriptor maxCallStackDepth] setting needs to be checked.
 */
MTLCommandBufferError :: enum NSUInteger {
    None :: 0;
    Internal :: 1;
    Timeout :: 2;
    PageFault :: 3;
    Blacklisted :: 4;
    AccessRevoked :: 4;
    NotPermitted :: 7;
    OutOfMemory :: 8;
    InvalidResource :: 9;
    Memoryless :: 10;
    DeviceRemoved :: 11;
    StackOverflow :: 12;
}

/*!
 @abstract Options for controlling the error reporting for Metal command buffer objects.
 
 @constant MTLCommandBufferErrorOptionNone
 No special error reporting.
 
 @constant MTLCommandBufferErrorOptionEncoderExecutionStatus
 Provide the execution status of the individual encoders within the command buffer. In the event of a command buffer error, populate the `userInfo` dictionary of the command buffer's NSError parameter, see MTLCommandBufferEncoderInfoErrorKey and MTLCommandBufferEncoderInfo. Note that enabling this error reporting option may increase CPU, GPU, and/or memory overhead on some platforms; testing for impact is suggested.
 */
MTLCommandBufferErrorOption :: enum_flags NSUInteger {
    None :: 0;
    EncoderExecutionStatus :: 1;
}

/*!
 @abstract The error states for a Metal command encoder after command buffer execution.
 
 @constant MTLCommandEncoderErrorStateUnknown
 The state of the commands associated with the encoder is unknown (the error information was likely not requested).
 
 @constant MTLCommandEncoderErrorStateCompleted
 The commands associated with the encoder were completed.
 
 @constant MTLCommandEncoderErrorStateAffected
 The commands associated with the encoder were affected by an error, which may or may not have been caused by the commands themselves, and failed to execute in full.
 
 @constant MTLCommandEncoderErrorStatePending
 The commands associated with the encoder never started execution.
 
 @constant MTLCommandEncoderErrorStateFaulted
 The commands associated with the encoder caused an error.
 */
MTLCommandEncoderErrorState :: enum NSInteger {
    Unknown :: 0;
    Completed :: 1;
    Affected :: 2;
    Pending :: 3;
    Faulted :: 4;
}

/*!
 @enum MTLDispatchType
 
 @abstract MTLDispatchType Describes how a command encoder will execute dispatched work.
 
 @constant MTLDispatchTypeSerial
 Command encoder dispatches are executed in dispatched order.
 
 @constant MTLDispatchTypeConcurrent
 Command encoder dispatches are executed in parallel with each other. 
*/
MTLDispatchType :: enum NSUInteger {
    Serial :: 0;
    Concurrent :: 1;
}

MTLCompareFunction :: enum NSUInteger {
    Never :: 0;
    Less :: 1;
    Equal :: 2;
    LessEqual :: 3;
    Greater :: 4;
    NotEqual :: 5;
    GreaterEqual :: 6;
    Always :: 7;
}

MTLStencilOperation :: enum NSUInteger {
    Keep :: 0;
    Zero :: 1;
    Replace :: 2;
    IncrementClamp :: 3;
    DecrementClamp :: 4;
    Invert :: 5;
    IncrementWrap :: 6;
    DecrementWrap :: 7;
}

/*!
 @enum MTLVertexFormat
 @abstract specifies how the vertex attribute data is laid out in memory.
*/
MTLVertexFormat :: enum NSUInteger {
    Invalid :: 0;
    UChar2 :: 1;
    UChar3 :: 2;
    UChar4 :: 3;
    Char2 :: 4;
    Char3 :: 5;
    Char4 :: 6;
    UChar2Normalized :: 7;
    UChar3Normalized :: 8;
    UChar4Normalized :: 9;
    Char2Normalized :: 10;
    Char3Normalized :: 11;
    Char4Normalized :: 12;
    UShort2 :: 13;
    UShort3 :: 14;
    UShort4 :: 15;
    Short2 :: 16;
    Short3 :: 17;
    Short4 :: 18;
    UShort2Normalized :: 19;
    UShort3Normalized :: 20;
    UShort4Normalized :: 21;
    Short2Normalized :: 22;
    Short3Normalized :: 23;
    Short4Normalized :: 24;
    Half2 :: 25;
    Half3 :: 26;
    Half4 :: 27;
    Float :: 28;
    Float2 :: 29;
    Float3 :: 30;
    Float4 :: 31;
    Int :: 32;
    Int2 :: 33;
    Int3 :: 34;
    Int4 :: 35;
    UInt :: 36;
    UInt2 :: 37;
    UInt3 :: 38;
    UInt4 :: 39;
    Int1010102Normalized :: 40;
    UInt1010102Normalized :: 41;
    UChar4Normalized_BGRA :: 42;
    UChar :: 45;
    Char :: 46;
    UCharNormalized :: 47;
    CharNormalized :: 48;
    UShort :: 49;
    Short :: 50;
    UShortNormalized :: 51;
    ShortNormalized :: 52;
    Half :: 53;
    FloatRG11B10 :: 54;
    FloatRGB9E5 :: 55;
}

MTLVertexStepFunction :: enum NSUInteger {
    Constant :: 0;
    PerVertex :: 1;
    PerInstance :: 2;
    PerPatch :: 3;
    PerPatchControlPoint :: 4;
}

/*
 MTLAttributeFormat
*/
MTLAttributeFormat :: enum NSUInteger {
    Invalid :: 0;
    UChar2 :: 1;
    UChar3 :: 2;
    UChar4 :: 3;
    Char2 :: 4;
    Char3 :: 5;
    Char4 :: 6;
    UChar2Normalized :: 7;
    UChar3Normalized :: 8;
    UChar4Normalized :: 9;
    Char2Normalized :: 10;
    Char3Normalized :: 11;
    Char4Normalized :: 12;
    UShort2 :: 13;
    UShort3 :: 14;
    UShort4 :: 15;
    Short2 :: 16;
    Short3 :: 17;
    Short4 :: 18;
    UShort2Normalized :: 19;
    UShort3Normalized :: 20;
    UShort4Normalized :: 21;
    Short2Normalized :: 22;
    Short3Normalized :: 23;
    Short4Normalized :: 24;
    Half2 :: 25;
    Half3 :: 26;
    Half4 :: 27;
    Float :: 28;
    Float2 :: 29;
    Float3 :: 30;
    Float4 :: 31;
    Int :: 32;
    Int2 :: 33;
    Int3 :: 34;
    Int4 :: 35;
    UInt :: 36;
    UInt2 :: 37;
    UInt3 :: 38;
    UInt4 :: 39;
    Int1010102Normalized :: 40;
    UInt1010102Normalized :: 41;
    UChar4Normalized_BGRA :: 42;
    UChar :: 45;
    Char :: 46;
    UCharNormalized :: 47;
    CharNormalized :: 48;
    UShort :: 49;
    Short :: 50;
    UShortNormalized :: 51;
    ShortNormalized :: 52;
    Half :: 53;
    FloatRG11B10 :: 54;
    FloatRGB9E5 :: 55;
}

MTLStepFunction :: enum NSUInteger {
    Constant :: 0;
    // vertex functions only
    PerVertex :: 1;
    // vertex functions only
    PerInstance :: 2;
    // vertex functions only
    PerPatch :: 3;
    // vertex functions only
    PerPatchControlPoint :: 4;
    // compute functions only
    ThreadPositionInGridX :: 5;
    // compute functions only
    ThreadPositionInGridY :: 6;
    // compute functions only
    ThreadPositionInGridXIndexed :: 7;
    // compute functions only
    ThreadPositionInGridYIndexed :: 8;
}

/*!
 * @enum MTLMutability
 * @abstract Specifies whether a buffer will be modified between the time it is bound and a compute
 * or render pipeline is executed in a draw or dispatch.
 */
MTLMutability :: enum NSUInteger {
    Default :: 0;
    Mutable :: 1;
    Immutable :: 2;
}

MTLShaderValidation :: enum NSInteger {
    Default :: 0;
    Enabled :: 1;
    Disabled :: 2;
}

MTLPrimitiveType :: enum NSUInteger {
    Point :: 0;
    Line :: 1;
    LineStrip :: 2;
    Triangle :: 3;
    TriangleStrip :: 4;
}

MTLVisibilityResultMode :: enum NSUInteger {
    Disabled :: 0;
    Boolean :: 1;
    Counting :: 2;
}

MTLCullMode :: enum NSUInteger {
    None :: 0;
    Front :: 1;
    Back :: 2;
}

MTLWinding :: enum NSUInteger {
    Clockwise :: 0;
    CounterClockwise :: 1;
}

MTLDepthClipMode :: enum NSUInteger {
    Clip :: 0;
    Clamp :: 1;
}

MTLTriangleFillMode :: enum NSUInteger {
    Fill :: 0;
    Lines :: 1;
}

/*!
 @abstract Generic render stage enum
 @brief Can also be used for points at which a fence may be waited on or signaled.
 @constant MTLRenderStageVertex   All vertex work prior to rasterization has completed.
 @constant MTLRenderStageFragment All rendering work has completed.
 */
MTLRenderStages :: enum_flags NSUInteger {
    Vertex :: 1;
    Fragment :: 2;
    Tile :: 4;
    Object :: 8;
    Mesh :: 16;
}

MTLBlendFactor :: enum NSUInteger {
    Zero :: 0;
    One :: 1;
    SourceColor :: 2;
    OneMinusSourceColor :: 3;
    SourceAlpha :: 4;
    OneMinusSourceAlpha :: 5;
    DestinationColor :: 6;
    OneMinusDestinationColor :: 7;
    DestinationAlpha :: 8;
    OneMinusDestinationAlpha :: 9;
    SourceAlphaSaturated :: 10;
    BlendColor :: 11;
    OneMinusBlendColor :: 12;
    BlendAlpha :: 13;
    OneMinusBlendAlpha :: 14;
    Source1Color :: 15;
    OneMinusSource1Color :: 16;
    Source1Alpha :: 17;
    OneMinusSource1Alpha :: 18;
    /// Defers assigning the blend factor.
    ///
    /// Until you specialize this value in the pipeline state, it:
    /// * behaves as `MTLBlendFactorOne` for `sourceRGBBlendFactor` and `sourceAlphaBlendFactor`
    /// * behaves as `MTLBlendFactorZero` for `destinationRGBBlendFactor` and `destinationAlphaBlendFactor`
    Unspecialized :: 19;
}

MTLBlendOperation :: enum NSUInteger {
    Add :: 0;
    Subtract :: 1;
    ReverseSubtract :: 2;
    Min :: 3;
    Max :: 4;
    /// Defers assigning the blend operation.
    ///
    // Until you specialize this value in the pipeline state, it behaves as `MTLBlendOperationAdd`.
    Unspecialized :: 5;
}

MTLColorWriteMask :: enum_flags NSUInteger {
    None :: 0;
    Red :: 8;
    Green :: 4;
    Blue :: 2;
    Alpha :: 1;
    All :: 15;
    /// Defers assigning the color write mask.
    ///
    /// Until you specialize this value in the pipeline state, it behaves as `MTLColorWriteMaskAll`.
    Unspecialized :: 16;
}

MTLPrimitiveTopologyClass :: enum NSUInteger {
    Unspecified :: 0;
    Point :: 1;
    Line :: 2;
    Triangle :: 3;
}

MTLTessellationPartitionMode :: enum NSUInteger {
    Pow2 :: 0;
    Integer :: 1;
    FractionalOdd :: 2;
    FractionalEven :: 3;
}

MTLTessellationFactorStepFunction :: enum NSUInteger {
    Constant :: 0;
    PerPatch :: 1;
    PerInstance :: 2;
    PerPatchAndPerInstance :: 3;
}

MTLTessellationFactorFormat :: enum NSUInteger {
    Half :: 0;
}

MTLTessellationControlPointIndexType :: enum NSUInteger {
    None :: 0;
    UInt16 :: 1;
    UInt32 :: 2;
}

/*!
 @enum MTLSamplerMinMagFilter
 @abstract Options for filtering texels within a mip level.
 
 @constant MTLSamplerMinMagFilterNearest
 Select the single texel nearest to the sample point.
 
 @constant MTLSamplerMinMagFilterLinear
 Select two texels in each dimension, and interpolate linearly between them.  Not all devices support linear filtering for all formats.  Integer textures can not use linear filtering on any device, and only some devices support linear filtering of Float textures.
 */
MTLSamplerMinMagFilter :: enum NSUInteger {
    Nearest :: 0;
    Linear :: 1;
}

/*!
 @enum MTLSamplerMipFilter
 @abstract Options for selecting and filtering between mipmap levels
 @constant MTLSamplerMipFilterNotMipmapped The texture is sampled as if it only had a single mipmap level.  All samples are read from level 0.
 @constant MTLSamplerMipFilterNearest The nearst mipmap level is selected.
 @constant MTLSamplerMipFilterLinear If the filter falls between levels, both levels are sampled, and their results linearly interpolated between levels.
 */
MTLSamplerMipFilter :: enum NSUInteger {
    NotMipmapped :: 0;
    Nearest :: 1;
    Linear :: 2;
}

/*!
 @enum MTLSamplerAddressMode
 @abstract Options for what value is returned when a fetch falls outside the bounds of a texture.
 
 @constant MTLSamplerAddressModeClampToEdge
 Texture coordinates will be clamped between 0 and 1.

 @constant MTLSamplerAddressModeMirrorClampToEdge
 Mirror the texture while coordinates are within -1..1, and clamp to edge when outside.

 @constant MTLSamplerAddressModeRepeat
 Wrap to the other side of the texture, effectively ignoring fractional parts of the texture coordinate.
 
 @constant MTLSamplerAddressModeMirrorRepeat
 Between -1 and 1 the texture is mirrored across the 0 axis.  The image is repeated outside of that range.
 
 @constant MTLSamplerAddressModeClampToZero
 ClampToZero returns transparent zero (0,0,0,0) for images with an alpha channel, and returns opaque zero (0,0,0,1) for images without an alpha channel.
 
 @constant MTLSamplerAddressModeClampToBorderColor
 Clamp to border color returns the value specified by the borderColor variable of the MTLSamplerDesc.
*/
MTLSamplerAddressMode :: enum NSUInteger {
    ClampToEdge :: 0;
    MirrorClampToEdge :: 1;
    Repeat :: 2;
    MirrorRepeat :: 3;
    ClampToZero :: 4;
    ClampToBorderColor :: 5;
}

/*!
 @enum MTLSamplerBorderColor
 @abstract Specify the color value that will be clamped to when the sampler address mode is MTLSamplerAddressModeClampToBorderColor.
 
 @constant MTLSamplerBorderColorTransparentBlack
 Transparent black returns {0,0,0,0} for clamped texture values.
 
 @constant MTLSamplerBorderColorOpaqueBlack
 OpaqueBlack returns {0,0,0,1} for clamped texture values.
 
 @constant MTLSamplerBorderColorOpaqueWhite
 OpaqueWhite returns {1,1,1,1} for clamped texture values.
 */
MTLSamplerBorderColor :: enum NSUInteger {
    // {0,0,0,0}
    TransparentBlack :: 0;
    // {0,0,0,1}
    OpaqueBlack :: 1;
    // {1,1,1,1}
    OpaqueWhite :: 2;
}

/// Configures how the sampler aggregates contributing samples to a final value.
MTLSamplerReductionMode :: enum NSUInteger {
    /// A reduction mode that adds together the product of each contributing sample value by its weight.
    WeightedAverage :: 0;
    /// A reduction mode that finds the minimum contributing sample value by separately evaluating each channel.
    Minimum :: 1;
    /// A reduction mode that finds the maximum contributing sample value by separately evaluating each channel.
    Maximum :: 2;
}

/*!
 @enum MTLAccelerationStructureRefitOptions
 @abstract Controls the acceleration structure refit operation
 */
MTLAccelerationStructureRefitOptions :: enum_flags NSUInteger {
    /**
     * @brief Refitting shall result in updated vertex data from the provided geometry descriptor.
     * If not set, vertex buffers shall be ignored on the geometry descriptor and vertex data previously
     * encoded shall be copied.
     */
    VertexData :: 1;
    /**
     * @brief Refitting shall result in updated per primitive data from the provided geometry descriptor.
     * If not set, per primitive data buffers shall be ignored on the geometry descriptor and per primitive
     * data previously encoded shall be copied.
     */
    PerPrimitiveData :: 2;
}

MTLAccelerationStructureUsage :: enum_flags NSUInteger {
    /**
     * @brief Default usage
     */
    None :: 0;
    /**
     * @brief Enable refitting for this acceleration structure. Note that this may reduce
     * acceleration structure quality.
     */
    Refit :: 1;
    /**
     * @brief Prefer building this acceleration structure quickly at the cost of reduced ray
     * tracing performance.
     */
    PreferFastBuild :: 2;
    /**
     * @brief Enable extended limits for this acceleration structure, possibly at the cost of
     * reduced ray tracing performance.
     */
    ExtendedLimits :: 4;
    /**
     * @brief Prioritize intersection performance over acceleration structure build time
     */
    PreferFastIntersection :: 16;
    /**
     * @brief Minimize the size of the acceleration structure in memory, potentially at
     * the cost of increased build time or reduced intersection performance.
     */
    MinimizeMemory :: 32;
}

MTLAccelerationStructureInstanceOptions :: enum_flags u32 {
    /**
     * @brief No options
     */
    None :: 0;
    /**
     * @brief Disable triangle back or front face culling
     */
    DisableTriangleCulling :: 1;
    /**
     * @brief Override triangle front-facing winding. By default, the winding is
     * assumed to be clockwise unless overridden by the intersector object. This overrides
     * the intersector's winding order.
     */
    TriangleFrontFacingWindingCounterClockwise :: 2;
    /**
     * @brief Geometry is opaque
     */
    Opaque :: 4;
    /**
     * @brief Geometry is non-opaque
     */
    NonOpaque :: 8;
}

MTLMatrixLayout :: enum NSInteger {
    /**
     * @brief Column-major order
     */
    ColumnMajor :: 0;
    /**
     * @brief Row-major order
     */
    RowMajor :: 1;
}

/**
 * @brief Describes what happens to the object before the first motion key and after the last
 * motion key.
 */
MTLMotionBorderMode :: enum u32 {
    /**
     * @brief Motion is stopped. (default)
     */
    Clamp :: 0;
    /**
     * @brief Object disappears
     */
    Vanish :: 1;
}

/**
 * @brief Curve types
 */
MTLCurveType :: enum NSInteger {
    /**
     * @brief Curve with a circular cross-section. These curves have the
     * advantage of having a real 3D shape consistent across different ray
     * directions, well-defined surface normals, etc. However, they may be
     * slower to intersect. These curves are ideal for viewing close-up.
     */
    Round :: 0;
    /**
     * @brief Curve with a flat cross-section aligned with the ray direction.
     * These curves may be faster to intersect but do not have a consistent
     * 3D structure across different rays. These curves are ideal for viewing
     * at a distance or curves with a small radius such as hair and fur.
     */
    Flat :: 1;
}

/**
 * @brief Basis function to use to interpolate curve control points
 */
MTLCurveBasis :: enum NSInteger {
    /**
     * @brief B-Spline basis. Each curve segment must have 3 or 4 control
     * points. Curve segments join with C^(N - 2) continuity, where N is
     * the number of control points. The curve does not necessarily pass
     * through the control points without additional control points at the
     * beginning and end of the curve. Each curve segment can overlap
     * N-1 control points.
     */
    BSpline :: 0;
    /**
     * @brief Catmull-Rom basis. Curves represented in this basis can also be
     * easily converted to and from the Bézier basis. Each curve segment must
     * have 4 control points. Each index in the control point index buffer
     * points to the first of 4 consecutive control points in the control point
     * buffer.
    * 
     * The tangent at each control point is given by
     * (P_(i+1) - P_(i-1)) / 2. Therefore, the curve does not pass through the
     * first and last control point of each connected sequence of curve
     * segments. Instead, the first and last control point are used to control
     * the tangent vector at the beginning and end of the curve.
     * 
     * Curve segments join with C^1 continuity and the
     * curve passes through the control points. Each curve segment can overlap
     * 3 control points.
     */
    CatmullRom :: 1;
    /**
     * @brief Linear basis. The curve is made of a sequence of connected line
     * segments each with 2 control points.
     */
    Linear :: 2;
    /**
     * @brief Bezier basis
     */
    Bezier :: 3;
}

/**
 * @brief Type of end cap to insert at the beginning and end of each connected
 * sequence of curve segments.
 */
MTLCurveEndCaps :: enum NSInteger {
    /**
    * @brief No end caps
    */
    None :: 0;
    /**
     * @brief Disk end caps
     */
    Disk :: 1;
    /**
     * @brief Spherical end caps
     */
    Sphere :: 2;
}

MTLAccelerationStructureInstanceDescriptorType :: enum NSUInteger {
    /**
     * @brief Default instance descriptor: MTLAccelerationStructureInstanceDescriptor
     */
    Default :: 0;
    /**
     * @brief Instance descriptor with an added user-ID
     */
    UserID :: 1;
    /**
     * @brief Instance descriptor with support for motion
     */
    Motion :: 2;
    /**
     * @brief Instance descriptor with a resource handle for the instanced acceleration structure
     */
    Indirect :: 3;
    /**
     * @brief Motion instance descriptor with a resource handle for the instanced acceleration structure.
     */
    IndirectMotion :: 4;
}

MTLTransformType :: enum NSInteger {
    /**
     * @brief A tightly packed matrix with 4 columns and 3 rows. The full transform is assumed
     * to be a 4x4 matrix with the last row being (0, 0, 0, 1).
     */
    PackedFloat4x3 :: 0;
    /**
     * @brief A transformation represented by individual components such as translation and
     * rotation. The rotation is represented by a quaternion, allowing for correct motion
     * interpolation.
     */
    Component :: 1;
}

/*!
 @enum MTLHeapType
 @abstract Describes the mode of operation for an MTLHeap.
 @constant MTLHeapTypeAutomatic
 In this mode, resources are placed in the heap automatically.
 Automatically placed resources have optimal GPU-specific layout, and may perform better than MTLHeapTypePlacement.
 This heap type is recommended when the heap primarily contains temporary write-often resources.
 @constant MTLHeapTypePlacement
 In this mode, the app places resources in the heap.
 Manually placed resources allow the app to control memory usage and heap fragmentation directly.
 This heap type is recommended when the heap primarily contains persistent write-rarely resources.
 */
MTLHeapType :: enum NSInteger {
    Automatic :: 0;
    Placement :: 1;
    Sparse :: 2;
}

/// Memory consistency options for synchronization commands.
MTL4VisibilityOptions :: enum_flags NSUInteger {
    /// Don't flush caches. When you use this option on a barrier, it turns it into an execution barrier.
    None :: 0;
    /// Flushes caches to the GPU (device) memory coherence point.
    Device :: 1;
    /// Flushes caches to ensure that aliased virtual addresses are memory consistent.
    ///
    /// On some systems this may be the GPU+CPU (system) memory coherence point
    /// and on other systems it may be the GPU (device) memory coherence point.
    ResourceAlias :: 2;
}

/// Custom render pass options you specify at encoder creation time.
///
/// Use these options to implement parallel encoding of render passes across multiple CPU threads by providing these
/// values to the `options` parameter of ``MTL4CommandBuffer/renderCommandEncoderWithDescriptor:options:`` and
/// observing these requirements:
///
/// 1. Commit all command encoders together in an array you provide to ``MTL4CommandQueue/commit:count:`` or ``MTL4CommandQueue/commit:count:options:``
/// 2. The first command buffer in the array contains a render pass that you start with option ``MTL4RenderEncoderOptionSuspending``
/// 3. The last command buffer in the array contains the same render pass that you start with option ``MTL4RenderEncoderOptionResuming``
/// 4. All intermediate command buffers between the first and last in the array contain the same render pass that you
/// start with both ``MTL4RenderEncoderOptionResuming`` and ``MTL4RenderEncoderOptionSuspending`` options.
/// 5. The sequence of render passes, in submission order, doesn't intermix with compute, blit, acceleration structure
/// or machine learning encoding.
/// 6. A command buffer shouldn't contain a render pass that you start with option ``MTL4RenderEncoderOptionSuspending`` if
/// it already contains a render pass that you start with option ``MTL4RenderEncoderOptionResuming``.
MTL4RenderEncoderOptions :: enum_flags NSUInteger {
    /// Declares that this render pass doesn't suspend nor resume.
    None :: 0;
    /// Configures the render pass as *suspending*.
    ///
    /// Pass this option to ``MTL4CommandBuffer/renderCommandEncoderWithDescriptor:options:`` to specify that Metal can
    /// stitch the work a render command encoder encodes with a subsequent "resuming" render command encoder.
    Suspending :: 1;
    /// Configures the render pass to as *resuming*.
    ///
    /// Pass this option to ``MTL4CommandBuffer/renderCommandEncoderWithDescriptor:options:`` to specify that Metal can
    /// stitch the work a render command encoder encodes with a prior "suspending" render command encoder.
    Resuming :: 2;
}

/// Enumeration of kinds of errors that committing an array of command buffers instances can produce.
MTL4CommandQueueError :: enum NSInteger {
    /// Indicates the absence of any problems.
    None :: 0;
    /// Indicates the workload takes longer to execute than the system allows.
    Timeout :: 1;
    /// Indicates a process doesn’t have access to a GPU device.
    NotPermitted :: 2;
    /// Indicates the GPU doesn’t have sufficient memory to execute a command buffer.
    OutOfMemory :: 3;
    /// Indicates the physical removal of the GPU before the command buffer completed.
    DeviceRemoved :: 4;
    /// Indicates that the system revokes GPU access because it’s responsible for too many timeouts or hangs.
    AccessRevoked :: 5;
    /// Indicates an internal problem in the Metal framework.
    Internal :: 6;
}

MTLCaptureError :: enum NSInteger {
    /// Capturing is not supported, maybe the destination is not supported.
    NotSupported :: 1;
    /// A capture is already in progress.
    AlreadyCapturing :: 2;
    /// The MTLCaptureDescriptor contains an invalid parameters.
    InvalidDescriptor :: 3;
}

/// The destination where you want the GPU trace to be captured to.
MTLCaptureDestination :: enum NSInteger {
    /// Capture to Developer Tools (Xcode) and stop the execution after capturing.
    DeveloperTools :: 1;
    /// Capture to a GPU Trace document and continue execution after capturing.
    GPUTraceDocument :: 2;
}

/*!
 @abstract
 A bitfield of commands that may be performed indirectly.
 */
MTLIndirectCommandType :: enum_flags NSUInteger {
    Draw :: 1;
    DrawIndexed :: 2;
    DrawPatches :: 4;
    DrawIndexedPatches :: 8;
    /* Dispatch threadgroups with concurrent execution */
    ConcurrentDispatch :: 32;
    /* Dispatch threads with concurrent execution */
    ConcurrentDispatchThreads :: 64;
    DrawMeshThreadgroups :: 128;
    DrawMeshThreads :: 256;
}

MTLFunctionLogType :: enum NSUInteger {
    Validation :: 0;
}

MTLDynamicLibraryError :: enum NSUInteger {
    None :: 0;
    InvalidFile :: 1;
    CompilationFailure :: 2;
    UnresolvedInstallName :: 3;
    DependencyLoadFailure :: 4;
    Unsupported :: 5;
}

/*!
 * @enum MTLLogLevel
 *
 * @abstract
 * The level of the log entry.
 */
MTLLogLevel :: enum NSInteger {
    Undefined :: 0;
    // A log level that captures diagnostic information.
    Debug :: 1;
    // The log level that captures additional information.
    Info :: 2;
    // The log level that captures notifications.
    Notice :: 3;
    // The log level that captures errors.
    Error :: 4;
    // The log level that captures fault information.
    Fault :: 5;
}

/*!
 @enum 
 @abstract NSErrors raised when creating a logstate.
 */
MTLLogStateError :: enum NSUInteger {
    InvalidSize :: 1;
    Invalid :: 2;
}

MTLBinaryArchiveError :: enum NSUInteger {
    None :: 0;
    InvalidFile :: 1;
    UnexpectedElement :: 2;
    CompilationFailure :: 3;
    InternalError :: 4;
}

/**
 * @brief Signature defining what data is provided to an intersection function. The signature
 * must match across the shading language declaration of the intersection function table,
 * intersection functions in the table, and the intersector using the table.
 */
MTLIntersectionFunctionSignature :: enum_flags NSUInteger {
    /**
	 * @brief No signature
	 */
    None :: 0;
    /**
	 * @brief The intersection functions can read the built-in instance_id as described in
	 * the Metal Shading Language Guide.
	 */
    Instancing :: 1;
    /**
	 * @brief The triangle intersection functions can read the built-in barycentric_coord
	 * and front_facing as described in the Metal Shading Language Guide.
	 */
    TriangleData :: 2;
    /**
	 * @brief The intersection functions can query world_space_origin and
	 * world_space_direction as described in the Metal Shading Language Guide.
	 */
    WorldSpaceData :: 4;
    /**
     * @brief The intersection functions may be called from intersectors using the
     * instance_motion intersection tag as described in the Metal Shading Language Guide.
     */
    InstanceMotion :: 8;
    /**
     * @brief The intersection functions can query time, motion_start_time,
     * motion_end_time and key_frame_count as described in the Metal Shading Language Guide.
     */
    PrimitiveMotion :: 16;
    /**
     * @brief The intersection functions may be called from intersectors using the
     * extended_limits intersection tag as described in the Metal Shading Language Guide.
     */
    ExtendedLimits :: 32;
    /**
     * @brief The intersection functions may be called from intersectors using the
     * max_levels intersection tag as described in the Metal Shading Language Guide.
     */
    MaxLevels :: 64;
    /**
     * @brief The curve intersection functions can read the built-in curve_parameter
     * as described in the Metal Shading Language Guide.
     */
    CurveData :: 128;
    /**
     * @brief The intersection function will be used with intersection function buffers
     */
    IntersectionFunctionBuffer :: 256;
    /**
     * @brief The intersection function uses the intersection function buffer user_data pointer
     */
    UserData :: 512;
}

/*!
 @abstract
 A bitfield of options to create a stitched library
 */
MTLStitchedLibraryOptions :: enum_flags NSUInteger {
    None :: 0;
    /**
     * @brief Library creation fails (i.e nil is returned) if:
     * - A lookup binary archive has been specified
     * - The library has not been found in the archive
     */
    FailOnBinaryArchiveMiss :: 1;
    /**
     * @brief stores and tracks this library in a Metal Pipelines Script
     * This flag is optional and only supported in the context of binary archives.
     * @discussion This flag is required for inspecting and consuming binary archives with stitched libraries via the metal-source tool. It is not required for recompilation, nor for storing stitched libraries in binary archives. Set this flag only if you intend to use metal-source on a serialized binary archive.
     */
    StoreLibraryInMetalPipelinesScript :: 2;
}

/* Used in MTLIOCommandQueueDescriptor to set the MTLIOQueue priority at creation time. */
MTLIOPriority :: enum NSInteger {
    High :: 0;
    Normal :: 1;
    Low :: 2;
}

/* Used in MTLIOCommandQueueDescriptor to set the MTLIOQueue type at creation time. */
MTLIOCommandQueueType :: enum NSInteger {
    Concurrent :: 0;
    Serial :: 1;
}

/* Used by MTLIOFileHandle creation functions to indicate an error. */
MTLIOError :: enum NSInteger {
    URLInvalid :: 1;
    Internal :: 2;
}

/* Used by MTLIOCommandBuffer to indicate completion status. */
MTLIOStatus :: enum NSInteger {
    Pending :: 0;
    Cancelled :: 1;
    Error :: 2;
    Complete :: 3;
}

MTLIOCompressionStatus :: enum NSInteger {
    Complete :: 0;
    Error :: 1;
}

/// Option mask for requesting reflection information at pipeline build time.
MTL4ShaderReflection :: enum_flags NSUInteger {
    /// Requests no information.
    None :: 0;
    /// Requests reflection information for bindings.
    BindingInfo :: 1;
    /// Requests reflection information for buffer types.
    BufferTypeInfo :: 2;
}

/// Enumeration for controlling alpha-to-one state of a pipeline state object.
MTL4AlphaToOneState :: enum NSInteger {
    /// Disables alpha-to-one.
    Disabled :: 0;
    /// Enables alpha-to-one.
    Enabled :: 1;
}

/// Enumeration for controlling alpha-to-coverage state of a pipeline state object.
MTL4AlphaToCoverageState :: enum NSInteger {
    /// Disables alpha-to-coverage.
    Disabled :: 0;
    /// Enables alpha-to-coverage.
    Enabled :: 1;
}

/// Enumeration for controlling the blend state of a pipeline state object.
MTL4BlendState :: enum NSInteger {
    /// Disables blending.
    Disabled :: 0;
    /// Enables blending.
    Enabled :: 1;
    /// Defers determining the blending stage.
    ///
    /// Behaves as ``MTL4BlendStateDisabled`` until you specialize this pipeline value.
    Unspecialized :: 2;
}

/// Enumeration for controlling support for ``MTLIndirectCommandBuffer``.
MTL4IndirectCommandBufferSupportState :: enum NSInteger {
    /// Disables support for indirect command buffers.
    Disabled :: 0;
    /// Enables support for indirect command buffers.
    Enabled :: 1;
}

/// Enumerates possible behaviors of how a pipeline maps its logical outputs to its color attachments.
MTL4LogicalToPhysicalColorAttachmentMappingState :: enum NSInteger {
    /// Treats the logical color attachment descriptor array for render and tile render pipelines to match the physical one.
    ///
    /// This is the default behavior, which produces an identity mapping.
    Identity :: 0;
    /// Deduces the color attachment mapping by inheriting it from the color attachment map of the current encoder.
    ///
    /// Use this setting to indicate Metal should inherit the mapping from the ``colorAttachmentMap`` property of the current
    /// ``MTL4RenderCommandEncoder`` or ``MTLRenderCommandEncoder`` in use at draw time.
    Inherited :: 1;
}

/// Configuration options for pipeline dataset serializer objects.
///
/// Use these options to enable different functionality in instances of ``MTL4PipelineDataSetSerializer``.
///
/// You can combine these values via a logical `OR` and set it to ``MTL4PipelineDataSetSerializerDescriptor/configuration``
/// to specify desired level of serialization support for instances of ``MTL4PipelineDataSetSerializer``.
MTL4PipelineDataSetSerializerConfiguration :: enum_flags NSUInteger {
    /// Enables serializing pipeline scripts.
    ///
    /// Set this mask to use ``MTL4PipelineDataSetSerializer.serializeAsPipelinesScriptWithError``.
    ///
    /// This for the default behavior.
    CaptureDescriptors :: 1;
    /// Enables serializing pipeline binary functions.
    ///
    /// Set this mask to use ``MTL4PipelineDataSetSerializer.serializeAsArchiveAndFlush(toURL:error:)``.
    CaptureBinaries :: 2;
}

/// Options for configuring the creation of binary functions.
MTL4BinaryFunctionOptions :: enum_flags NSUInteger {
    /// Represents the default value: no options.
    None :: 0;
    /// Compiles the function to have its function handles return a constant MTLResourceID across
    /// all pipeline states. The function needs to be linked to the pipeline that will use this function.
    PipelineIndependent :: 2;
}

