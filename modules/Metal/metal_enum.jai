MTL4PipelineDataSetSerializerConfiguration :: enum_flags NSUInteger {
    CaptureDescriptors :: 0x1;
    CaptureBinaries :: 0x2;
}

MTLArgumentBuffersTier :: enum NSUInteger {
    e1 :: 0;
    e2 :: 1;
}

MTLDynamicLibraryError :: enum NSUInteger {
    None :: 0;
    InvalidFile :: 1;
    CompilationFailure :: 2;
    UnresolvedInstallName :: 3;
    DependencyLoadFailure :: 4;
    Unsupported :: 5;
}

MTL4TimestampGranularity :: enum NSInteger {
    Relaxed :: 0;
    Precise :: 1;
}

MTLSamplerBorderColor :: enum NSUInteger {
    TransparentBlack :: 0;
    OpaqueBlack :: 1;
    OpaqueWhite :: 2;
}

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

MTLTransformType :: enum NSInteger {
    PackedFloat4x3 :: 0;
    Component :: 1;
}

MTLLogStateError :: enum NSUInteger {
    InvalidSize :: 1;
    Invalid :: 2;
}

MTLTextureUsage :: enum_flags NSUInteger {
    Unknown :: 0x0;
    ShaderRead :: 0x1;
    ShaderWrite :: 0x2;
    RenderTarget :: 0x4;
    PixelFormatView :: 0x20;
    ShaderAtomic :: 0x40;
}

MTLSamplerMinMagFilter :: enum NSUInteger {
    Nearest :: 0;
    Linear :: 1;
}

MTLIndirectCommandType :: enum_flags NSUInteger {
    Draw :: 0x1;
    DrawIndexed :: 0x2;
    DrawPatches :: 0x4;
    DrawIndexedPatches :: 0x10;
    ConcurrentDispatch :: 0x40;
    ConcurrentDispatchThreads :: 0x100;
    DrawMeshThreadgroups :: 0x200;
    DrawMeshThreads :: 0x400;
}

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

MTLColorWriteMask :: enum_flags NSUInteger {
    None :: 0x0;
    Red :: 0x10;
    Green :: 0x4;
    Blue :: 0x2;
    Alpha :: 0x1;
    All :: 0x17;
    Unspecialized :: 0x20;
}

MTLStoreAction :: enum NSUInteger {
    DontCare :: 0;
    Store :: 1;
    MultisampleResolve :: 2;
    StoreAndMultisampleResolve :: 3;
    Unknown :: 4;
    CustomSampleDepthStore :: 5;
}

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

MTLVisibilityResultType :: enum NSInteger {
    Reset :: 0;
    Accumulate :: 1;
}

MTLBlitOption :: enum_flags NSUInteger {
    None :: 0x0;
    DepthFromDepthStencil :: 0x1;
    StencilFromDepthStencil :: 0x2;
    RowLinearPVRTC :: 0x4;
}

MTLLogLevel :: enum NSInteger {
    Undefined :: 0;
    Debug :: 1;
    Info :: 2;
    Notice :: 3;
    Error :: 4;
    Fault :: 5;
}

MTLBinaryArchiveError :: enum NSUInteger {
    None :: 0;
    InvalidFile :: 1;
    UnexpectedElement :: 2;
    CompilationFailure :: 3;
    InternalError :: 4;
}

MTL4BlendState :: enum NSInteger {
    Disabled :: 0;
    Enabled :: 1;
    Unspecialized :: 2;
}

MTLRenderStages :: enum_flags NSUInteger {
    MTLRenderStageVertex :: 0x1;
    MTLRenderStageFragment :: 0x2;
    MTLRenderStageTile :: 0x4;
    MTLRenderStageObject :: 0x10;
    MTLRenderStageMesh :: 0x20;
}

MTLSparseTextureMappingMode :: enum NSUInteger {
    Map :: 0;
    Unmap :: 1;
}

MTLDeviceLocation :: enum NSUInteger {
    BuiltIn :: 0;
    Slot :: 1;
    External :: 2;
    Unspecified :: 18446744073709551615;
}

MTLTessellationFactorFormat :: enum NSUInteger {
    Half :: 0;
}

MTLFunctionLogType :: enum NSUInteger {
    Validation :: 0;
}

MTLDeviceError :: enum NSInteger {
    None :: 0;
    NotSupported :: 1;
}

MTLIOCommandQueueType :: enum NSInteger {
    Concurrent :: 0;
    Serial :: 1;
}

MTLBlendOperation :: enum NSUInteger {
    Add :: 0;
    Subtract :: 1;
    ReverseSubtract :: 2;
    Min :: 3;
    Max :: 4;
    Unspecialized :: 5;
}

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

MTLTextureSwizzle :: enum u8 {
    Zero :: 0;
    One :: 1;
    Red :: 2;
    Green :: 3;
    Blue :: 4;
    Alpha :: 5;
}

MTLMotionBorderMode :: enum u32 {
    Clamp :: 0;
    Vanish :: 1;
}

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

MTLPrimitiveTopologyClass :: enum NSUInteger {
    Unspecified :: 0;
    Point :: 1;
    Line :: 2;
    Triangle :: 3;
}

MTLCurveBasis :: enum NSInteger {
    BSpline :: 0;
    CatmullRom :: 1;
    Linear :: 2;
    Bezier :: 3;
}

MTLIOCompressionStatus :: enum NSInteger {
    Complete :: 0;
    Error :: 1;
}

MTLTextureCompressionType :: enum NSInteger {
    Lossless :: 0;
    Lossy :: 1;
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

MTLShaderValidation :: enum NSInteger {
    Default :: 0;
    Enabled :: 1;
    Disabled :: 2;
}

MTLAccelerationStructureRefitOptions :: enum_flags NSUInteger {
    MTLAccelerationStructureRefitOptionVertexData :: 0x1;
    MTLAccelerationStructureRefitOptionPerPrimitiveData :: 0x2;
}

MTLTriangleFillMode :: enum NSUInteger {
    Fill :: 0;
    Lines :: 1;
}

MTL4AlphaToCoverageState :: enum NSInteger {
    Disabled :: 0;
    Enabled :: 1;
}

MTLBindingAccess :: enum NSUInteger {
    ReadOnly :: 0;
    ReadWrite :: 1;
    WriteOnly :: 2;
    MTLArgumentAccessReadOnly :: 0;
    MTLArgumentAccessReadWrite :: 1;
    MTLArgumentAccessWriteOnly :: 2;
}

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

MTLTessellationControlPointIndexType :: enum NSUInteger {
    None :: 0;
    UInt16 :: 1;
    UInt32 :: 2;
}

MTLDispatchType :: enum NSUInteger {
    Serial :: 0;
    Concurrent :: 1;
}

MTLLibraryError :: enum NSUInteger {
    Unsupported :: 1;
    Internal :: 2;
    CompileFailure :: 3;
    CompileWarning :: 4;
    FunctionNotFound :: 5;
    FileNotFound :: 6;
}

MTLVisibilityResultMode :: enum NSUInteger {
    Disabled :: 0;
    Boolean :: 1;
    Counting :: 2;
}

MTLPrimitiveType :: enum NSUInteger {
    Point :: 0;
    Line :: 1;
    LineStrip :: 2;
    Triangle :: 3;
    TriangleStrip :: 4;
}

MTLSparsePageSize :: enum NSInteger {
    e16 :: 101;
    e64 :: 102;
    e256 :: 103;
}

MTLCounterSampleBufferError :: enum NSInteger {
    OutOfMemory :: 0;
    Invalid :: 1;
    Internal :: 2;
}

MTLStitchedLibraryOptions :: enum_flags NSUInteger {
    MTLStitchedLibraryOptionNone :: 0x0;
    MTLStitchedLibraryOptionFailOnBinaryArchiveMiss :: 0x1;
    MTLStitchedLibraryOptionStoreLibraryInMetalPipelinesScript :: 0x2;
}

MTLFunctionType :: enum NSUInteger {
    Vertex :: 1;
    Fragment :: 2;
    Kernel :: 3;
    Visible :: 5;
    Intersection :: 6;
    Mesh :: 7;
    Object :: 8;
}

MTLCaptureError :: enum NSInteger {
    NotSupported :: 1;
    AlreadyCapturing :: 2;
    InvalidDescriptor :: 3;
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

MTLHeapType :: enum NSInteger {
    Automatic :: 0;
    Placement :: 1;
    Sparse :: 2;
}

MTLIOError :: enum NSInteger {
    URLInvalid :: 1;
    Internal :: 2;
}

MTL4BinaryFunctionOptions :: enum_flags NSUInteger {
    MTL4BinaryFunctionOptionNone :: 0x0;
    MTL4BinaryFunctionOptionPipelineIndependent :: 0x2;
}

MTLLoadAction :: enum NSUInteger {
    DontCare :: 0;
    Load :: 1;
    Clear :: 2;
}

MTLSparseTextureRegionAlignmentMode :: enum NSUInteger {
    Outward :: 0;
    Inward :: 1;
}

MTLIntersectionFunctionSignature :: enum_flags NSUInteger {
    None :: 0x0;
    Instancing :: 0x1;
    TriangleData :: 0x2;
    WorldSpaceData :: 0x4;
    InstanceMotion :: 0x10;
    PrimitiveMotion :: 0x20;
    ExtendedLimits :: 0x40;
    MaxLevels :: 0x100;
    CurveData :: 0x200;
    IntersectionFunctionBuffer :: 0x400;
    UserData :: 0x1000;
}

MTLWinding :: enum NSUInteger {
    Clockwise :: 0;
    CounterClockwise :: 1;
}

MTLMatrixLayout :: enum NSInteger {
    ColumnMajor :: 0;
    RowMajor :: 1;
}

MTLAccelerationStructureInstanceDescriptorType :: enum NSUInteger {
    Default :: 0;
    UserID :: 1;
    Motion :: 2;
    Indirect :: 3;
    IndirectMotion :: 4;
}

MTL4AlphaToOneState :: enum NSInteger {
    Disabled :: 0;
    Enabled :: 1;
}

MTLFunctionOptions :: enum_flags NSUInteger {
    MTLFunctionOptionNone :: 0x0;
    MTLFunctionOptionCompileToBinary :: 0x1;
    MTLFunctionOptionStoreFunctionInMetalPipelinesScript :: 0x2;
    MTLFunctionOptionStoreFunctionInMetalScript :: 0x2;
    MTLFunctionOptionFailOnBinaryArchiveMiss :: 0x4;
    MTLFunctionOptionPipelineIndependent :: 0x10;
}

MTLLibraryOptimizationLevel :: enum NSInteger {
    Default :: 0;
    Size :: 1;
}

MTLResourceOptions :: enum_flags NSUInteger {
    MTLResourceCPUCacheModeDefaultCache :: 0x0;
    MTLResourceCPUCacheModeWriteCombined :: 0x1;
    MTLResourceStorageModeShared :: 0x0;
    MTLResourceStorageModeManaged :: 0x20;
    MTLResourceStorageModePrivate :: 0x40;
    MTLResourceStorageModeMemoryless :: 0x60;
    MTLResourceHazardTrackingModeDefault :: 0x0;
    MTLResourceHazardTrackingModeUntracked :: 0x400;
    MTLResourceHazardTrackingModeTracked :: 0x1000;
    MTLResourceOptionCPUCacheModeDefault :: 0x0;
    MTLResourceOptionCPUCacheModeWriteCombined :: 0x1;
}

MTLReadWriteTextureTier :: enum NSUInteger {
    None :: 0;
    e1 :: 1;
    e2 :: 2;
}

MTLTensorError :: enum NSInteger {
    None :: 0;
    InternalError :: 1;
    InvalidDescriptor :: 2;
}

MTLMultisampleDepthResolveFilter :: enum NSUInteger {
    Sample0 :: 0;
    Min :: 1;
    Max :: 2;
}

MTLSamplerReductionMode :: enum NSUInteger {
    WeightedAverage :: 0;
    Minimum :: 1;
    Maximum :: 2;
}

MTL4VisibilityOptions :: enum_flags NSUInteger {
    MTL4VisibilityOptionNone :: 0x0;
    MTL4VisibilityOptionDevice :: 0x1;
    MTL4VisibilityOptionResourceAlias :: 0x2;
}

MTLLibraryType :: enum NSInteger {
    Executable :: 0;
    Dynamic :: 1;
}

MTLStepFunction :: enum NSUInteger {
    Constant :: 0;
    PerVertex :: 1;
    PerInstance :: 2;
    PerPatch :: 3;
    PerPatchControlPoint :: 4;
    ThreadPositionInGridX :: 5;
    ThreadPositionInGridY :: 6;
    ThreadPositionInGridXIndexed :: 7;
    ThreadPositionInGridYIndexed :: 8;
}

MTLCurveEndCaps :: enum NSInteger {
    None :: 0;
    Disk :: 1;
    Sphere :: 2;
}

MTLCommandEncoderErrorState :: enum NSInteger {
    Unknown :: 0;
    Completed :: 1;
    Affected :: 2;
    Pending :: 3;
    Faulted :: 4;
}

MTL4ShaderReflection :: enum_flags NSUInteger {
    None :: 0x0;
    BindingInfo :: 0x1;
    BufferTypeInfo :: 0x2;
}

MTL4CommandQueueError :: enum NSInteger {
    None :: 0;
    Timeout :: 1;
    NotPermitted :: 2;
    OutOfMemory :: 3;
    DeviceRemoved :: 4;
    AccessRevoked :: 5;
    Internal :: 6;
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

MTLCullMode :: enum NSUInteger {
    None :: 0;
    Front :: 1;
    Back :: 2;
}

MTLCurveType :: enum NSInteger {
    Round :: 0;
    Flat :: 1;
}

MTLCounterSamplingPoint :: enum NSUInteger {
    AtStageBoundary :: 0;
    AtDrawBoundary :: 1;
    AtDispatchBoundary :: 2;
    AtTileDispatchBoundary :: 3;
    AtBlitBoundary :: 4;
}

MTLStoreActionOptions :: enum_flags NSUInteger {
    MTLStoreActionOptionNone :: 0x0;
    MTLStoreActionOptionCustomSamplePositions :: 0x1;
}

MTLPixelFormat :: enum NSUInteger {
    Invalid :: 0;
    A8Unorm :: 1;
    R8Unorm :: 10;
    R8Unorm_sRGB :: 11;
    R8Snorm :: 12;
    R8Uint :: 13;
    R8Sint :: 14;
    R16Unorm :: 20;
    R16Snorm :: 22;
    R16Uint :: 23;
    R16Sint :: 24;
    R16Float :: 25;
    RG8Unorm :: 30;
    RG8Unorm_sRGB :: 31;
    RG8Snorm :: 32;
    RG8Uint :: 33;
    RG8Sint :: 34;
    B5G6R5Unorm :: 40;
    A1BGR5Unorm :: 41;
    ABGR4Unorm :: 42;
    BGR5A1Unorm :: 43;
    R32Uint :: 53;
    R32Sint :: 54;
    R32Float :: 55;
    RG16Unorm :: 60;
    RG16Snorm :: 62;
    RG16Uint :: 63;
    RG16Sint :: 64;
    RG16Float :: 65;
    RGBA8Unorm :: 70;
    RGBA8Unorm_sRGB :: 71;
    RGBA8Snorm :: 72;
    RGBA8Uint :: 73;
    RGBA8Sint :: 74;
    BGRA8Unorm :: 80;
    BGRA8Unorm_sRGB :: 81;
    RGB10A2Unorm :: 90;
    RGB10A2Uint :: 91;
    RG11B10Float :: 92;
    RGB9E5Float :: 93;
    BGR10A2Unorm :: 94;
    BGR10_XR :: 554;
    BGR10_XR_sRGB :: 555;
    RG32Uint :: 103;
    RG32Sint :: 104;
    RG32Float :: 105;
    RGBA16Unorm :: 110;
    RGBA16Snorm :: 112;
    RGBA16Uint :: 113;
    RGBA16Sint :: 114;
    RGBA16Float :: 115;
    BGRA10_XR :: 552;
    BGRA10_XR_sRGB :: 553;
    RGBA32Uint :: 123;
    RGBA32Sint :: 124;
    RGBA32Float :: 125;
    BC1_RGBA :: 130;
    BC1_RGBA_sRGB :: 131;
    BC2_RGBA :: 132;
    BC2_RGBA_sRGB :: 133;
    BC3_RGBA :: 134;
    BC3_RGBA_sRGB :: 135;
    BC4_RUnorm :: 140;
    BC4_RSnorm :: 141;
    BC5_RGUnorm :: 142;
    BC5_RGSnorm :: 143;
    BC6H_RGBFloat :: 150;
    BC6H_RGBUfloat :: 151;
    BC7_RGBAUnorm :: 152;
    BC7_RGBAUnorm_sRGB :: 153;
    PVRTC_RGB_2BPP :: 160;
    PVRTC_RGB_2BPP_sRGB :: 161;
    PVRTC_RGB_4BPP :: 162;
    PVRTC_RGB_4BPP_sRGB :: 163;
    PVRTC_RGBA_2BPP :: 164;
    PVRTC_RGBA_2BPP_sRGB :: 165;
    PVRTC_RGBA_4BPP :: 166;
    PVRTC_RGBA_4BPP_sRGB :: 167;
    EAC_R11Unorm :: 170;
    EAC_R11Snorm :: 172;
    EAC_RG11Unorm :: 174;
    EAC_RG11Snorm :: 176;
    EAC_RGBA8 :: 178;
    EAC_RGBA8_sRGB :: 179;
    ETC2_RGB8 :: 180;
    ETC2_RGB8_sRGB :: 181;
    ETC2_RGB8A1 :: 182;
    ETC2_RGB8A1_sRGB :: 183;
    ASTC_4x4_sRGB :: 186;
    ASTC_5x4_sRGB :: 187;
    ASTC_5x5_sRGB :: 188;
    ASTC_6x5_sRGB :: 189;
    ASTC_6x6_sRGB :: 190;
    ASTC_8x5_sRGB :: 192;
    ASTC_8x6_sRGB :: 193;
    ASTC_8x8_sRGB :: 194;
    ASTC_10x5_sRGB :: 195;
    ASTC_10x6_sRGB :: 196;
    ASTC_10x8_sRGB :: 197;
    ASTC_10x10_sRGB :: 198;
    ASTC_12x10_sRGB :: 199;
    ASTC_12x12_sRGB :: 200;
    ASTC_4x4_LDR :: 204;
    ASTC_5x4_LDR :: 205;
    ASTC_5x5_LDR :: 206;
    ASTC_6x5_LDR :: 207;
    ASTC_6x6_LDR :: 208;
    ASTC_8x5_LDR :: 210;
    ASTC_8x6_LDR :: 211;
    ASTC_8x8_LDR :: 212;
    ASTC_10x5_LDR :: 213;
    ASTC_10x6_LDR :: 214;
    ASTC_10x8_LDR :: 215;
    ASTC_10x10_LDR :: 216;
    ASTC_12x10_LDR :: 217;
    ASTC_12x12_LDR :: 218;
    ASTC_4x4_HDR :: 222;
    ASTC_5x4_HDR :: 223;
    ASTC_5x5_HDR :: 224;
    ASTC_6x5_HDR :: 225;
    ASTC_6x6_HDR :: 226;
    ASTC_8x5_HDR :: 228;
    ASTC_8x6_HDR :: 229;
    ASTC_8x8_HDR :: 230;
    ASTC_10x5_HDR :: 231;
    ASTC_10x6_HDR :: 232;
    ASTC_10x8_HDR :: 233;
    ASTC_10x10_HDR :: 234;
    ASTC_12x10_HDR :: 235;
    ASTC_12x12_HDR :: 236;
    GBGR422 :: 240;
    BGRG422 :: 241;
    Depth16Unorm :: 250;
    Depth32Float :: 252;
    Stencil8 :: 253;
    Depth24Unorm_Stencil8 :: 255;
    Depth32Float_Stencil8 :: 260;
    X32_Stencil8 :: 261;
    X24_Stencil8 :: 262;
    Unspecialized :: 263;
    Invalid :: 0;
    A8Unorm :: 1;
    R8Unorm :: 10;
    R8Unorm_sRGB :: 11;
    R8Snorm :: 12;
    R8Uint :: 13;
    R8Sint :: 14;
    R16Unorm :: 20;
    R16Snorm :: 22;
    R16Uint :: 23;
    R16Sint :: 24;
    R16Float :: 25;
    RG8Unorm :: 30;
    RG8Unorm_sRGB :: 31;
    RG8Snorm :: 32;
    RG8Uint :: 33;
    RG8Sint :: 34;
    B5G6R5Unorm :: 40;
    A1BGR5Unorm :: 41;
    ABGR4Unorm :: 42;
    BGR5A1Unorm :: 43;
    R32Uint :: 53;
    R32Sint :: 54;
    R32Float :: 55;
    RG16Unorm :: 60;
    RG16Snorm :: 62;
    RG16Uint :: 63;
    RG16Sint :: 64;
    RG16Float :: 65;
    RGBA8Unorm :: 70;
    RGBA8Unorm_sRGB :: 71;
    RGBA8Snorm :: 72;
    RGBA8Uint :: 73;
    RGBA8Sint :: 74;
    BGRA8Unorm :: 80;
    BGRA8Unorm_sRGB :: 81;
    RGB10A2Unorm :: 90;
    RGB10A2Uint :: 91;
    RG11B10Float :: 92;
    RGB9E5Float :: 93;
    BGR10A2Unorm :: 94;
    BGR10_XR :: 554;
    BGR10_XR_sRGB :: 555;
    RG32Uint :: 103;
    RG32Sint :: 104;
    RG32Float :: 105;
    RGBA16Unorm :: 110;
    RGBA16Snorm :: 112;
    RGBA16Uint :: 113;
    RGBA16Sint :: 114;
    RGBA16Float :: 115;
    BGRA10_XR :: 552;
    BGRA10_XR_sRGB :: 553;
    RGBA32Uint :: 123;
    RGBA32Sint :: 124;
    RGBA32Float :: 125;
    BC1_RGBA :: 130;
    BC1_RGBA_sRGB :: 131;
    BC2_RGBA :: 132;
    BC2_RGBA_sRGB :: 133;
    BC3_RGBA :: 134;
    BC3_RGBA_sRGB :: 135;
    BC4_RUnorm :: 140;
    BC4_RSnorm :: 141;
    BC5_RGUnorm :: 142;
    BC5_RGSnorm :: 143;
    BC6H_RGBFloat :: 150;
    BC6H_RGBUfloat :: 151;
    BC7_RGBAUnorm :: 152;
    BC7_RGBAUnorm_sRGB :: 153;
    PVRTC_RGB_2BPP :: 160;
    PVRTC_RGB_2BPP_sRGB :: 161;
    PVRTC_RGB_4BPP :: 162;
    PVRTC_RGB_4BPP_sRGB :: 163;
    PVRTC_RGBA_2BPP :: 164;
    PVRTC_RGBA_2BPP_sRGB :: 165;
    PVRTC_RGBA_4BPP :: 166;
    PVRTC_RGBA_4BPP_sRGB :: 167;
    EAC_R11Unorm :: 170;
    EAC_R11Snorm :: 172;
    EAC_RG11Unorm :: 174;
    EAC_RG11Snorm :: 176;
    EAC_RGBA8 :: 178;
    EAC_RGBA8_sRGB :: 179;
    ETC2_RGB8 :: 180;
    ETC2_RGB8_sRGB :: 181;
    ETC2_RGB8A1 :: 182;
    ETC2_RGB8A1_sRGB :: 183;
    ASTC_4x4_sRGB :: 186;
    ASTC_5x4_sRGB :: 187;
    ASTC_5x5_sRGB :: 188;
    ASTC_6x5_sRGB :: 189;
    ASTC_6x6_sRGB :: 190;
    ASTC_8x5_sRGB :: 192;
    ASTC_8x6_sRGB :: 193;
    ASTC_8x8_sRGB :: 194;
    ASTC_10x5_sRGB :: 195;
    ASTC_10x6_sRGB :: 196;
    ASTC_10x8_sRGB :: 197;
    ASTC_10x10_sRGB :: 198;
    ASTC_12x10_sRGB :: 199;
    ASTC_12x12_sRGB :: 200;
    ASTC_4x4_LDR :: 204;
    ASTC_5x4_LDR :: 205;
    ASTC_5x5_LDR :: 206;
    ASTC_6x5_LDR :: 207;
    ASTC_6x6_LDR :: 208;
    ASTC_8x5_LDR :: 210;
    ASTC_8x6_LDR :: 211;
    ASTC_8x8_LDR :: 212;
    ASTC_10x5_LDR :: 213;
    ASTC_10x6_LDR :: 214;
    ASTC_10x8_LDR :: 215;
    ASTC_10x10_LDR :: 216;
    ASTC_12x10_LDR :: 217;
    ASTC_12x12_LDR :: 218;
    ASTC_4x4_HDR :: 222;
    ASTC_5x4_HDR :: 223;
    ASTC_5x5_HDR :: 224;
    ASTC_6x5_HDR :: 225;
    ASTC_6x6_HDR :: 226;
    ASTC_8x5_HDR :: 228;
    ASTC_8x6_HDR :: 229;
    ASTC_8x8_HDR :: 230;
    ASTC_10x5_HDR :: 231;
    ASTC_10x6_HDR :: 232;
    ASTC_10x8_HDR :: 233;
    ASTC_10x10_HDR :: 234;
    ASTC_12x10_HDR :: 235;
    ASTC_12x12_HDR :: 236;
    GBGR422 :: 240;
    BGRG422 :: 241;
    Depth16Unorm :: 250;
    Depth32Float :: 252;
    Stencil8 :: 253;
    Depth24Unorm_Stencil8 :: 255;
    Depth32Float_Stencil8 :: 260;
    X32_Stencil8 :: 261;
    X24_Stencil8 :: 262;
    Unspecialized :: 263;
}

MTLPurgeableState :: enum NSUInteger {
    KeepCurrent :: 1;
    NonVolatile :: 2;
    Volatile :: 3;
    Empty :: 4;
}

MTL4IndirectCommandBufferSupportState :: enum NSInteger {
    Disabled :: 0;
    Enabled :: 1;
}

MTLMultisampleStencilResolveFilter :: enum NSUInteger {
    Sample0 :: 0;
    DepthResolvedSample :: 1;
}

MTL4CounterHeapType :: enum NSInteger {
    Invalid :: 0;
    Timestamp :: 1;
}

MTLStages :: enum_flags NSUInteger {
    MTLStageVertex :: 0x1;
    MTLStageFragment :: 0x2;
    MTLStageTile :: 0x4;
    MTLStageObject :: 0x10;
    MTLStageMesh :: 0x20;
    MTLStageResourceState :: 0x400000000;
    MTLStageDispatch :: 0x1000000000;
    MTLStageBlit :: 0x2000000000;
    MTLStageAccelerationStructure :: 0x4000000000;
    MTLStageMachineLearning :: 0x10000000000;
    MTLStageAll :: 0x777777777777777777777;
}

MTLMathFloatingPointFunctions :: enum NSInteger {
    Fast :: 0;
    Precise :: 1;
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
    _OSX_GPUFamily1_v1 :: 10000;
    _macOS_GPUFamily1_v2 :: 10001;
    _OSX_GPUFamily1_v2 :: 10001;
    _macOS_ReadWriteTextureTier2 :: 10002;
    _OSX_ReadWriteTextureTier2 :: 10002;
    _macOS_GPUFamily1_v3 :: 10003;
    _macOS_GPUFamily1_v4 :: 10004;
    _macOS_GPUFamily2_v1 :: 10005;
    _tvOS_GPUFamily1_v1 :: 30000;
    _TVOS_GPUFamily1_v1 :: 30000;
    _tvOS_GPUFamily1_v2 :: 30001;
    _tvOS_GPUFamily1_v3 :: 30002;
    _tvOS_GPUFamily2_v1 :: 30003;
    _tvOS_GPUFamily1_v4 :: 30004;
    _tvOS_GPUFamily2_v2 :: 30005;
}

MTLResourceUsage :: enum_flags NSUInteger {
    Read :: 0x1;
    Write :: 0x2;
    Sample :: 0x4;
}

MTLAccelerationStructureInstanceOptions :: enum_flags u32 {
    MTLAccelerationStructureInstanceOptionNone :: 0x0;
    MTLAccelerationStructureInstanceOptionDisableTriangleCulling :: 0x1;
    MTLAccelerationStructureInstanceOptionTriangleFrontFacingWindingCounterClockwise :: 0x2;
    MTLAccelerationStructureInstanceOptionOpaque :: 0x4;
    MTLAccelerationStructureInstanceOptionNonOpaque :: 0x10;
}

MTLTessellationFactorStepFunction :: enum NSUInteger {
    Constant :: 0;
    PerPatch :: 1;
    PerInstance :: 2;
    PerPatchAndPerInstance :: 3;
}

MTLIndexType :: enum NSUInteger {
    UInt16 :: 0;
    UInt32 :: 1;
}

MTLDepthClipMode :: enum NSUInteger {
    Clip :: 0;
    Clamp :: 1;
}

MTLHazardTrackingMode :: enum NSUInteger {
    Default :: 0;
    Untracked :: 1;
    Tracked :: 2;
}

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

MTLSamplerMipFilter :: enum NSUInteger {
    NotMipmapped :: 0;
    Nearest :: 1;
    Linear :: 2;
}

MTLCompileSymbolVisibility :: enum NSInteger {
    Default :: 0;
    Hidden :: 1;
}

MTLCommandBufferErrorOption :: enum_flags NSUInteger {
    None :: 0x0;
    EncoderExecutionStatus :: 0x1;
}

MTLTessellationPartitionMode :: enum NSUInteger {
    Pow2 :: 0;
    Integer :: 1;
    FractionalOdd :: 2;
    FractionalEven :: 3;
}

MTLBufferSparseTier :: enum NSInteger {
    None :: 0;
    e1 :: 1;
}

MTLAccelerationStructureUsage :: enum_flags NSUInteger {
    None :: 0x0;
    Refit :: 0x1;
    PreferFastBuild :: 0x2;
    ExtendedLimits :: 0x4;
    PreferFastIntersection :: 0x20;
    MinimizeMemory :: 0x40;
}

MTLPatchType :: enum NSUInteger {
    None :: 0;
    Triangle :: 1;
    Quad :: 2;
}

MTLDataType :: enum NSUInteger {
    None :: 0;
    Struct :: 1;
    Array :: 2;
    Float :: 3;
    Float2 :: 4;
    Float3 :: 5;
    Float4 :: 6;
    Float2x2 :: 7;
    Float2x3 :: 8;
    Float2x4 :: 9;
    Float3x2 :: 10;
    Float3x3 :: 11;
    Float3x4 :: 12;
    Float4x2 :: 13;
    Float4x3 :: 14;
    Float4x4 :: 15;
    Half :: 16;
    Half2 :: 17;
    Half3 :: 18;
    Half4 :: 19;
    Half2x2 :: 20;
    Half2x3 :: 21;
    Half2x4 :: 22;
    Half3x2 :: 23;
    Half3x3 :: 24;
    Half3x4 :: 25;
    Half4x2 :: 26;
    Half4x3 :: 27;
    Half4x4 :: 28;
    Int :: 29;
    Int2 :: 30;
    Int3 :: 31;
    Int4 :: 32;
    UInt :: 33;
    UInt2 :: 34;
    UInt3 :: 35;
    UInt4 :: 36;
    Short :: 37;
    Short2 :: 38;
    Short3 :: 39;
    Short4 :: 40;
    UShort :: 41;
    UShort2 :: 42;
    UShort3 :: 43;
    UShort4 :: 44;
    Char :: 45;
    Char2 :: 46;
    Char3 :: 47;
    Char4 :: 48;
    UChar :: 49;
    UChar2 :: 50;
    UChar3 :: 51;
    UChar4 :: 52;
    Bool :: 53;
    Bool2 :: 54;
    Bool3 :: 55;
    Bool4 :: 56;
    Texture :: 58;
    Sampler :: 59;
    Pointer :: 60;
    R8Unorm :: 62;
    R8Snorm :: 63;
    R16Unorm :: 64;
    R16Snorm :: 65;
    RG8Unorm :: 66;
    RG8Snorm :: 67;
    RG16Unorm :: 68;
    RG16Snorm :: 69;
    RGBA8Unorm :: 70;
    RGBA8Unorm_sRGB :: 71;
    RGBA8Snorm :: 72;
    RGBA16Unorm :: 73;
    RGBA16Snorm :: 74;
    RGB10A2Unorm :: 75;
    RG11B10Float :: 76;
    RGB9E5Float :: 77;
    RenderPipeline :: 78;
    ComputePipeline :: 79;
    IndirectCommandBuffer :: 80;
    Long :: 81;
    Long2 :: 82;
    Long3 :: 83;
    Long4 :: 84;
    ULong :: 85;
    ULong2 :: 86;
    ULong3 :: 87;
    ULong4 :: 88;
    VisibleFunctionTable :: 115;
    IntersectionFunctionTable :: 116;
    PrimitiveAccelerationStructure :: 117;
    InstanceAccelerationStructure :: 118;
    BFloat :: 121;
    BFloat2 :: 122;
    BFloat3 :: 123;
    BFloat4 :: 124;
    DepthStencilState :: 139;
    Tensor :: 140;
}

MTL4RenderEncoderOptions :: enum_flags NSUInteger {
    MTL4RenderEncoderOptionNone :: 0x0;
    MTL4RenderEncoderOptionSuspending :: 0x1;
    MTL4RenderEncoderOptionResuming :: 0x2;
}

MTL4LogicalToPhysicalColorAttachmentMappingState :: enum NSInteger {
    Identity :: 0;
    Inherited :: 1;
}

MTLCommandBufferStatus :: enum NSUInteger {
    NotEnqueued :: 0;
    Enqueued :: 1;
    Committed :: 2;
    Scheduled :: 3;
    Completed :: 4;
    Error :: 5;
}

MTLCPUCacheMode :: enum NSUInteger {
    DefaultCache :: 0;
    WriteCombined :: 1;
}

MTL4CompilerTaskStatus :: enum NSInteger {
    None :: 0;
    Scheduled :: 1;
    Compiling :: 2;
    Finished :: 3;
}

MTLSamplerAddressMode :: enum NSUInteger {
    ClampToEdge :: 0;
    MirrorClampToEdge :: 1;
    Repeat :: 2;
    MirrorRepeat :: 3;
    ClampToZero :: 4;
    ClampToBorderColor :: 5;
}

MTLBarrierScope :: enum_flags NSUInteger {
    Buffers :: 0x1;
    Textures :: 0x2;
    RenderTargets :: 0x4;
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

MTLTensorUsage :: enum_flags NSUInteger {
    Compute :: 0x1;
    Render :: 0x2;
    MachineLearning :: 0x4;
}

MTLVertexStepFunction :: enum NSUInteger {
    Constant :: 0;
    PerVertex :: 1;
    PerInstance :: 2;
    PerPatch :: 3;
    PerPatchControlPoint :: 4;
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
    Unspecialized :: 19;
}

MTLCaptureDestination :: enum NSInteger {
    DeveloperTools :: 1;
    GPUTraceDocument :: 2;
}

MTLTextureSparseTier :: enum NSInteger {
    None :: 0;
    e1 :: 1;
    e2 :: 2;
}

MTLIOStatus :: enum NSInteger {
    Pending :: 0;
    Cancelled :: 1;
    Error :: 2;
    Complete :: 3;
}

MTLIOPriority :: enum NSInteger {
    High :: 0;
    Normal :: 1;
    Low :: 2;
}

MTLIOCompressionMethod :: enum NSInteger {
    Zlib :: 0;
    LZFSE :: 1;
    LZ4 :: 2;
    LZMA :: 3;
    LZBitmap :: 4;
}

MTLStorageMode :: enum NSUInteger {
    Shared :: 0;
    Managed :: 1;
    Private :: 2;
    Memoryless :: 3;
}

MTLPipelineOption :: enum_flags NSUInteger {
    None :: 0x0;
    ArgumentInfo :: 0x1;
    BindingInfo :: 0x1;
    BufferTypeInfo :: 0x2;
    FailOnBinaryArchiveMiss :: 0x4;
}

MTLMutability :: enum NSUInteger {
    Default :: 0;
    Mutable :: 1;
    Immutable :: 2;
}

MTLMathMode :: enum NSInteger {
    Safe :: 0;
    Relaxed :: 1;
    Fast :: 2;
}

