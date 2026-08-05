//
// This file was auto-generated using the following command:
//
// jai generate.jai
//



SPV_VERSION :: 0x10600;
SPV_REVISION :: 1;

SPVC_C_API_VERSION_MAJOR :: 0;

SPVC_C_API_VERSION_MINOR :: 68;

SPVC_C_API_VERSION_PATCH :: 0;

SPVC_TRUE :: cast(spvc_bool) 1;
SPVC_FALSE :: cast(spvc_bool) 0;

SPVC_COMPILER_OPTION_COMMON_BIT :: 0x1000000;
SPVC_COMPILER_OPTION_GLSL_BIT :: 0x2000000;
SPVC_COMPILER_OPTION_HLSL_BIT :: 0x4000000;
SPVC_COMPILER_OPTION_MSL_BIT :: 0x8000000;
SPVC_COMPILER_OPTION_LANG_BITS :: 0x0f000000;
SPVC_COMPILER_OPTION_ENUM_BITS :: 0xffffff;

SPVC_MSL_PUSH_CONSTANT_DESC_SET :: ~(0);
SPVC_MSL_PUSH_CONSTANT_BINDING :: 0;
SPVC_MSL_SWIZZLE_BUFFER_BINDING :: ~(1);
SPVC_MSL_BUFFER_SIZE_BUFFER_BINDING :: ~(2);
SPVC_MSL_ARGUMENT_BUFFER_BINDING :: ~(3);

SPVC_MSL_AUX_BUFFER_STRUCT_VERSION :: 1;

SPVC_HLSL_PUSH_CONSTANT_DESC_SET :: ~(0);
SPVC_HLSL_PUSH_CONSTANT_BINDING :: 0;

SpvId :: u32;

SpvMagicNumber: u32 : 119734787;
SpvVersion: u32 : 67072;
SpvRevision: u32 : 1;
SpvOpCodeMask: u32 : 65535;
SpvWordCountShift: u32 : 16;

SpvSourceLanguage_ :: enum u32 {
    Unknown        :: 0;
    ESSL           :: 1;
    GLSL           :: 2;
    OpenCL_C       :: 3;
    OpenCL_CPP     :: 4;
    HLSL           :: 5;
    CPP_for_OpenCL :: 6;
    SYCL           :: 7;
    HERO_C         :: 8;
    NZSL           :: 9;
    WGSL           :: 10;
    Slang          :: 11;
    Zig            :: 12;
    Rust           :: 13;
    Max            :: 2147483647;
}

SpvSourceLanguage :: SpvSourceLanguage_;

SpvExecutionModel_ :: enum u32 {
    Vertex                 :: 0;
    TessellationControl    :: 1;
    TessellationEvaluation :: 2;
    Geometry               :: 3;
    Fragment               :: 4;
    GLCompute              :: 5;
    Kernel                 :: 6;
    TaskNV                 :: 5267;
    MeshNV                 :: 5268;
    RayGenerationKHR       :: 5313;
    RayGenerationNV        :: 5313;
    IntersectionKHR        :: 5314;
    IntersectionNV         :: 5314;
    AnyHitKHR              :: 5315;
    AnyHitNV               :: 5315;
    ClosestHitKHR          :: 5316;
    ClosestHitNV           :: 5316;
    MissKHR                :: 5317;
    MissNV                 :: 5317;
    CallableKHR            :: 5318;
    CallableNV             :: 5318;
    TaskEXT                :: 5364;
    MeshEXT                :: 5365;
    Max                    :: 2147483647;
}

SpvExecutionModel :: SpvExecutionModel_;

SpvAddressingModel_ :: enum u32 {
    Logical                    :: 0;
    Physical32                 :: 1;
    Physical64                 :: 2;
    PhysicalStorageBuffer64    :: 5348;
    PhysicalStorageBuffer64EXT :: 5348;
    Max                        :: 2147483647;
}

SpvAddressingModel :: SpvAddressingModel_;

SpvMemoryModel_ :: enum u32 {
    Simple    :: 0;
    GLSL450   :: 1;
    OpenCL    :: 2;
    Vulkan    :: 3;
    VulkanKHR :: 3;
    Max       :: 2147483647;
}

SpvMemoryModel :: SpvMemoryModel_;

SpvExecutionMode_ :: enum u32 {
    Invocations                         :: 0;
    SpacingEqual                        :: 1;
    SpacingFractionalEven               :: 2;
    SpacingFractionalOdd                :: 3;
    VertexOrderCw                       :: 4;
    VertexOrderCcw                      :: 5;
    PixelCenterInteger                  :: 6;
    OriginUpperLeft                     :: 7;
    OriginLowerLeft                     :: 8;
    EarlyFragmentTests                  :: 9;
    PointMode                           :: 10;
    Xfb                                 :: 11;
    DepthReplacing                      :: 12;
    DepthGreater                        :: 14;
    DepthLess                           :: 15;
    DepthUnchanged                      :: 16;
    LocalSize                           :: 17;
    LocalSizeHint                       :: 18;
    InputPoints                         :: 19;
    InputLines                          :: 20;
    InputLinesAdjacency                 :: 21;
    Triangles                           :: 22;
    InputTrianglesAdjacency             :: 23;
    Quads                               :: 24;
    Isolines                            :: 25;
    OutputVertices                      :: 26;
    OutputPoints                        :: 27;
    OutputLineStrip                     :: 28;
    OutputTriangleStrip                 :: 29;
    VecTypeHint                         :: 30;
    ContractionOff                      :: 31;
    Initializer                         :: 33;
    Finalizer                           :: 34;
    SubgroupSize                        :: 35;
    SubgroupsPerWorkgroup               :: 36;
    SubgroupsPerWorkgroupId             :: 37;
    LocalSizeId                         :: 38;
    LocalSizeHintId                     :: 39;
    NonCoherentColorAttachmentReadEXT   :: 4169;
    NonCoherentDepthAttachmentReadEXT   :: 4170;
    NonCoherentStencilAttachmentReadEXT :: 4171;
    SubgroupUniformControlFlowKHR       :: 4421;
    PostDepthCoverage                   :: 4446;
    DenormPreserve                      :: 4459;
    DenormFlushToZero                   :: 4460;
    SignedZeroInfNanPreserve            :: 4461;
    RoundingModeRTE                     :: 4462;
    RoundingModeRTZ                     :: 4463;
    NonCoherentTileAttachmentReadQCOM   :: 4489;
    TileShadingRateQCOM                 :: 4490;
    EarlyAndLateFragmentTestsAMD        :: 5017;
    StencilRefReplacingEXT              :: 5027;
    CoalescingAMDX                      :: 5069;
    IsApiEntryAMDX                      :: 5070;
    MaxNodeRecursionAMDX                :: 5071;
    StaticNumWorkgroupsAMDX             :: 5072;
    ShaderIndexAMDX                     :: 5073;
    MaxNumWorkgroupsAMDX                :: 5077;
    StencilRefUnchangedFrontAMD         :: 5079;
    StencilRefGreaterFrontAMD           :: 5080;
    StencilRefLessFrontAMD              :: 5081;
    StencilRefUnchangedBackAMD          :: 5082;
    StencilRefGreaterBackAMD            :: 5083;
    StencilRefLessBackAMD               :: 5084;
    QuadDerivativesKHR                  :: 5088;
    RequireFullQuadsKHR                 :: 5089;
    SharesInputWithAMDX                 :: 5102;
    ArithmeticPoisonKHR                 :: 5157;
    OutputLinesEXT                      :: 5269;
    OutputLinesNV                       :: 5269;
    OutputPrimitivesEXT                 :: 5270;
    OutputPrimitivesNV                  :: 5270;
    DerivativeGroupQuadsKHR             :: 5289;
    DerivativeGroupQuadsNV              :: 5289;
    DerivativeGroupLinearKHR            :: 5290;
    DerivativeGroupLinearNV             :: 5290;
    OutputTrianglesEXT                  :: 5298;
    OutputTrianglesNV                   :: 5298;
    PixelInterlockOrderedEXT            :: 5366;
    PixelInterlockUnorderedEXT          :: 5367;
    SampleInterlockOrderedEXT           :: 5368;
    SampleInterlockUnorderedEXT         :: 5369;
    ShadingRateInterlockOrderedEXT      :: 5370;
    ShadingRateInterlockUnorderedEXT    :: 5371;
    Shader64BitIndexingEXT              :: 5427;
    SharedLocalMemorySizeINTEL          :: 5618;
    RoundingModeRTPINTEL                :: 5620;
    RoundingModeRTNINTEL                :: 5621;
    FloatingPointModeALTINTEL           :: 5622;
    FloatingPointModeIEEEINTEL          :: 5623;
    MaxWorkgroupSizeINTEL               :: 5893;
    MaxWorkDimINTEL                     :: 5894;
    NoGlobalOffsetINTEL                 :: 5895;
    NumSIMDWorkitemsINTEL               :: 5896;
    SchedulerTargetFmaxMhzINTEL         :: 5903;
    MaximallyReconvergesKHR             :: 6023;
    FPFastMathDefault                   :: 6028;
    StreamingInterfaceINTEL             :: 6154;
    RegisterMapInterfaceINTEL           :: 6160;
    NamedBarrierCountINTEL              :: 6417;
    MaximumRegistersINTEL               :: 6461;
    MaximumRegistersIdINTEL             :: 6462;
    NamedMaximumRegistersINTEL          :: 6463;
    Max                                 :: 2147483647;
}

SpvExecutionMode :: SpvExecutionMode_;

SpvStorageClass_ :: enum u32 {
    UniformConstant          :: 0;
    Input                    :: 1;
    Uniform                  :: 2;
    Output                   :: 3;
    Workgroup                :: 4;
    CrossWorkgroup           :: 5;
    Private                  :: 6;
    Function                 :: 7;
    Generic                  :: 8;
    PushConstant             :: 9;
    AtomicCounter            :: 10;
    Image                    :: 11;
    StorageBuffer            :: 12;
    TileImageEXT             :: 4172;
    TileAttachmentQCOM       :: 4491;
    NodePayloadAMDX          :: 5068;
    CallableDataKHR          :: 5328;
    CallableDataNV           :: 5328;
    IncomingCallableDataKHR  :: 5329;
    IncomingCallableDataNV   :: 5329;
    RayPayloadKHR            :: 5338;
    RayPayloadNV             :: 5338;
    HitAttributeKHR          :: 5339;
    HitAttributeNV           :: 5339;
    IncomingRayPayloadKHR    :: 5342;
    IncomingRayPayloadNV     :: 5342;
    ShaderRecordBufferKHR    :: 5343;
    ShaderRecordBufferNV     :: 5343;
    PhysicalStorageBuffer    :: 5349;
    PhysicalStorageBufferEXT :: 5349;
    HitObjectAttributeNV     :: 5385;
    TaskPayloadWorkgroupEXT  :: 5402;
    HitObjectAttributeEXT    :: 5411;
    CodeSectionINTEL         :: 5605;
    DeviceOnlyALTERA         :: 5936;
    DeviceOnlyINTEL          :: 5936;
    HostOnlyALTERA           :: 5937;
    HostOnlyINTEL            :: 5937;
    Max                      :: 2147483647;
}

SpvStorageClass :: SpvStorageClass_;

SpvDim_ :: enum u32 {
    _1D              :: 0;
    _2D              :: 1;
    _3D              :: 2;
    Cube             :: 3;
    Rect             :: 4;
    Buffer           :: 5;
    SubpassData      :: 6;
    TileImageDataEXT :: 4173;
    Max              :: 2147483647;
}

SpvDim :: SpvDim_;

SpvSamplerAddressingMode_ :: enum u32 {
    None           :: 0;
    ClampToEdge    :: 1;
    Clamp          :: 2;
    Repeat         :: 3;
    RepeatMirrored :: 4;
    Max            :: 2147483647;
}

SpvSamplerAddressingMode :: SpvSamplerAddressingMode_;

SpvSamplerFilterMode_ :: enum u32 {
    Nearest :: 0;
    Linear  :: 1;
    Max     :: 2147483647;
}

SpvSamplerFilterMode :: SpvSamplerFilterMode_;

SpvImageFormat_ :: enum u32 {
    Unknown      :: 0;
    Rgba32f      :: 1;
    Rgba16f      :: 2;
    R32f         :: 3;
    Rgba8        :: 4;
    Rgba8Snorm   :: 5;
    Rg32f        :: 6;
    Rg16f        :: 7;
    R11fG11fB10f :: 8;
    R16f         :: 9;
    Rgba16       :: 10;
    Rgb10A2      :: 11;
    Rg16         :: 12;
    Rg8          :: 13;
    R16          :: 14;
    R8           :: 15;
    Rgba16Snorm  :: 16;
    Rg16Snorm    :: 17;
    Rg8Snorm     :: 18;
    R16Snorm     :: 19;
    R8Snorm      :: 20;
    Rgba32i      :: 21;
    Rgba16i      :: 22;
    Rgba8i       :: 23;
    R32i         :: 24;
    Rg32i        :: 25;
    Rg16i        :: 26;
    Rg8i         :: 27;
    R16i         :: 28;
    R8i          :: 29;
    Rgba32ui     :: 30;
    Rgba16ui     :: 31;
    Rgba8ui      :: 32;
    R32ui        :: 33;
    Rgb10a2ui    :: 34;
    Rg32ui       :: 35;
    Rg16ui       :: 36;
    Rg8ui        :: 37;
    R16ui        :: 38;
    R8ui         :: 39;
    R64ui        :: 40;
    R64i         :: 41;
    Max          :: 2147483647;
}

SpvImageFormat :: SpvImageFormat_;

SpvImageChannelOrder_ :: enum u32 {
    R            :: 0;
    A            :: 1;
    RG           :: 2;
    RA           :: 3;
    RGB          :: 4;
    RGBA         :: 5;
    BGRA         :: 6;
    ARGB         :: 7;
    Intensity    :: 8;
    Luminance    :: 9;
    Rx           :: 10;
    RGx          :: 11;
    RGBx         :: 12;
    Depth        :: 13;
    DepthStencil :: 14;
    sRGB         :: 15;
    sRGBx        :: 16;
    sRGBA        :: 17;
    sBGRA        :: 18;
    ABGR         :: 19;
    Max          :: 2147483647;
}

SpvImageChannelOrder :: SpvImageChannelOrder_;

SpvImageChannelDataType_ :: enum u32 {
    SnormInt8           :: 0;
    SnormInt16          :: 1;
    UnormInt8           :: 2;
    UnormInt16          :: 3;
    UnormShort565       :: 4;
    UnormShort555       :: 5;
    UnormInt101010      :: 6;
    SignedInt8          :: 7;
    SignedInt16         :: 8;
    SignedInt32         :: 9;
    UnsignedInt8        :: 10;
    UnsignedInt16       :: 11;
    UnsignedInt32       :: 12;
    HalfFloat           :: 13;
    Float               :: 14;
    UnormInt24          :: 15;
    UnormInt101010_2    :: 16;
    UnormInt10X6EXT     :: 17;
    UnsignedIntRaw10EXT :: 19;
    UnsignedIntRaw12EXT :: 20;
    UnormInt2_101010EXT :: 21;
    UnsignedInt10X6EXT  :: 22;
    UnsignedInt12X4EXT  :: 23;
    UnsignedInt14X2EXT  :: 24;
    UnormInt12X4EXT     :: 25;
    UnormInt14X2EXT     :: 26;
    Max                 :: 2147483647;
}

SpvImageChannelDataType :: SpvImageChannelDataType_;

SpvImageOperandsShift_ :: enum u32 {
    BiasShift                  :: 0;
    LodShift                   :: 1;
    GradShift                  :: 2;
    ConstOffsetShift           :: 3;
    OffsetShift                :: 4;
    ConstOffsetsShift          :: 5;
    SampleShift                :: 6;
    MinLodShift                :: 7;
    MakeTexelAvailableShift    :: 8;
    MakeTexelAvailableKHRShift :: 8;
    MakeTexelVisibleShift      :: 9;
    MakeTexelVisibleKHRShift   :: 9;
    NonPrivateTexelShift       :: 10;
    NonPrivateTexelKHRShift    :: 10;
    VolatileTexelShift         :: 11;
    VolatileTexelKHRShift      :: 11;
    SignExtendShift            :: 12;
    ZeroExtendShift            :: 13;
    NontemporalShift           :: 14;
    OffsetsShift               :: 16;
    Max                        :: 2147483647;
}

SpvImageOperandsShift :: SpvImageOperandsShift_;

SpvImageOperandsMask_ :: enum u32 {
    MaskNone                  :: 0;
    BiasMask                  :: 1;
    LodMask                   :: 2;
    GradMask                  :: 4;
    ConstOffsetMask           :: 8;
    OffsetMask                :: 16;
    ConstOffsetsMask          :: 32;
    SampleMask                :: 64;
    MinLodMask                :: 128;
    MakeTexelAvailableMask    :: 256;
    MakeTexelAvailableKHRMask :: 256;
    MakeTexelVisibleMask      :: 512;
    MakeTexelVisibleKHRMask   :: 512;
    NonPrivateTexelMask       :: 1024;
    NonPrivateTexelKHRMask    :: 1024;
    VolatileTexelMask         :: 2048;
    VolatileTexelKHRMask      :: 2048;
    SignExtendMask            :: 4096;
    ZeroExtendMask            :: 8192;
    NontemporalMask           :: 16384;
    OffsetsMask               :: 65536;
}

SpvImageOperandsMask :: SpvImageOperandsMask_;

SpvFPFastMathModeShift_ :: enum u32 {
    NotNaNShift                 :: 0;
    NotInfShift                 :: 1;
    NSZShift                    :: 2;
    AllowRecipShift             :: 3;
    FastShift                   :: 4;
    AllowContractShift          :: 16;
    AllowContractFastINTELShift :: 16;
    AllowReassocShift           :: 17;
    AllowReassocINTELShift      :: 17;
    AllowTransformShift         :: 18;
    Max                         :: 2147483647;
}

SpvFPFastMathModeShift :: SpvFPFastMathModeShift_;

SpvFPFastMathModeMask_ :: enum u32 {
    MaskNone                   :: 0;
    NotNaNMask                 :: 1;
    NotInfMask                 :: 2;
    NSZMask                    :: 4;
    AllowRecipMask             :: 8;
    FastMask                   :: 16;
    AllowContractMask          :: 65536;
    AllowContractFastINTELMask :: 65536;
    AllowReassocMask           :: 131072;
    AllowReassocINTELMask      :: 131072;
    AllowTransformMask         :: 262144;
}

SpvFPFastMathModeMask :: SpvFPFastMathModeMask_;

SpvFPRoundingMode_ :: enum u32 {
    RTE :: 0;
    RTZ :: 1;
    RTP :: 2;
    RTN :: 3;
    Max :: 2147483647;
}

SpvFPRoundingMode :: SpvFPRoundingMode_;

SpvLinkageType_ :: enum u32 {
    Export      :: 0;
    Import      :: 1;
    LinkOnceODR :: 2;
    Max         :: 2147483647;
}

SpvLinkageType :: SpvLinkageType_;

SpvAccessQualifier_ :: enum u32 {
    ReadOnly  :: 0;
    WriteOnly :: 1;
    ReadWrite :: 2;
    Max       :: 2147483647;
}

SpvAccessQualifier :: SpvAccessQualifier_;

SpvFunctionParameterAttribute_ :: enum u32 {
    Zext                 :: 0;
    Sext                 :: 1;
    ByVal                :: 2;
    Sret                 :: 3;
    NoAlias              :: 4;
    NoCapture            :: 5;
    NoWrite              :: 6;
    NoReadWrite          :: 7;
    RuntimeAlignedALTERA :: 5940;
    RuntimeAlignedINTEL  :: 5940;
    Max                  :: 2147483647;
}

SpvFunctionParameterAttribute :: SpvFunctionParameterAttribute_;

SpvDecoration_ :: enum u32 {
    RelaxedPrecision                            :: 0;
    SpecId                                      :: 1;
    Block                                       :: 2;
    BufferBlock                                 :: 3;
    RowMajor                                    :: 4;
    ColMajor                                    :: 5;
    ArrayStride                                 :: 6;
    MatrixStride                                :: 7;
    GLSLShared                                  :: 8;
    GLSLPacked                                  :: 9;
    CPacked                                     :: 10;
    BuiltIn                                     :: 11;
    NoPerspective                               :: 13;
    Flat                                        :: 14;
    Patch                                       :: 15;
    Centroid                                    :: 16;
    Sample                                      :: 17;
    Invariant                                   :: 18;
    Restrict                                    :: 19;
    Aliased                                     :: 20;
    Volatile                                    :: 21;
    Constant                                    :: 22;
    Coherent                                    :: 23;
    NonWritable                                 :: 24;
    NonReadable                                 :: 25;
    Uniform                                     :: 26;
    UniformId                                   :: 27;
    SaturatedConversion                         :: 28;
    Stream                                      :: 29;
    Location                                    :: 30;
    Component                                   :: 31;
    Index                                       :: 32;
    Binding                                     :: 33;
    DescriptorSet                               :: 34;
    Offset                                      :: 35;
    XfbBuffer                                   :: 36;
    XfbStride                                   :: 37;
    FuncParamAttr                               :: 38;
    FPRoundingMode                              :: 39;
    FPFastMathMode                              :: 40;
    LinkageAttributes                           :: 41;
    NoContraction                               :: 42;
    InputAttachmentIndex                        :: 43;
    Alignment                                   :: 44;
    MaxByteOffset                               :: 45;
    AlignmentId                                 :: 46;
    MaxByteOffsetId                             :: 47;
    SaturatedToLargestFloat8NormalConversionEXT :: 4216;
    NoSignedWrap                                :: 4469;
    NoUnsignedWrap                              :: 4470;
    WeightTextureQCOM                           :: 4487;
    BlockMatchTextureQCOM                       :: 4488;
    BlockMatchSamplerQCOM                       :: 4499;
    ExplicitInterpAMD                           :: 4999;
    NodeSharesPayloadLimitsWithAMDX             :: 5019;
    NodeMaxPayloadsAMDX                         :: 5020;
    TrackFinishWritingAMDX                      :: 5078;
    PayloadNodeNameAMDX                         :: 5091;
    PayloadNodeBaseIndexAMDX                    :: 5098;
    PayloadNodeSparseArrayAMDX                  :: 5099;
    PayloadNodeArraySizeAMDX                    :: 5100;
    PayloadDispatchIndirectAMDX                 :: 5105;
    ArrayStrideIdEXT                            :: 5124;
    OffsetIdEXT                                 :: 5125;
    UTFEncodedKHR                               :: 5145;
    OverrideCoverageNV                          :: 5248;
    PassthroughNV                               :: 5250;
    ViewportRelativeNV                          :: 5252;
    SecondaryViewportRelativeNV                 :: 5256;
    PerPrimitiveEXT                             :: 5271;
    PerPrimitiveNV                              :: 5271;
    PerViewNV                                   :: 5272;
    PerTaskNV                                   :: 5273;
    PerVertexKHR                                :: 5285;
    PerVertexNV                                 :: 5285;
    NonUniform                                  :: 5300;
    NonUniformEXT                               :: 5300;
    RestrictPointer                             :: 5355;
    RestrictPointerEXT                          :: 5355;
    AliasedPointer                              :: 5356;
    AliasedPointerEXT                           :: 5356;
    MemberOffsetNV                              :: 5358;
    HitObjectShaderRecordBufferNV               :: 5386;
    HitObjectShaderRecordBufferEXT              :: 5389;
    BankNV                                      :: 5397;
    BindlessSamplerNV                           :: 5398;
    BindlessImageNV                             :: 5399;
    BoundSamplerNV                              :: 5400;
    BoundImageNV                                :: 5401;
    SIMTCallINTEL                               :: 5599;
    ReferencedIndirectlyINTEL                   :: 5602;
    ClobberINTEL                                :: 5607;
    SideEffectsINTEL                            :: 5608;
    VectorComputeVariableINTEL                  :: 5624;
    FuncParamIOKindINTEL                        :: 5625;
    VectorComputeFunctionINTEL                  :: 5626;
    StackCallINTEL                              :: 5627;
    GlobalVariableOffsetINTEL                   :: 5628;
    CounterBuffer                               :: 5634;
    HlslCounterBufferGOOGLE                     :: 5634;
    HlslSemanticGOOGLE                          :: 5635;
    UserSemantic                                :: 5635;
    UserTypeGOOGLE                              :: 5636;
    FunctionRoundingModeINTEL                   :: 5822;
    FunctionDenormModeINTEL                     :: 5823;
    RegisterALTERA                              :: 5825;
    RegisterINTEL                               :: 5825;
    MemoryALTERA                                :: 5826;
    MemoryINTEL                                 :: 5826;
    NumbanksALTERA                              :: 5827;
    NumbanksINTEL                               :: 5827;
    BankwidthALTERA                             :: 5828;
    BankwidthINTEL                              :: 5828;
    MaxPrivateCopiesALTERA                      :: 5829;
    MaxPrivateCopiesINTEL                       :: 5829;
    SinglepumpALTERA                            :: 5830;
    SinglepumpINTEL                             :: 5830;
    DoublepumpALTERA                            :: 5831;
    DoublepumpINTEL                             :: 5831;
    MaxReplicatesALTERA                         :: 5832;
    MaxReplicatesINTEL                          :: 5832;
    SimpleDualPortALTERA                        :: 5833;
    SimpleDualPortINTEL                         :: 5833;
    MergeALTERA                                 :: 5834;
    MergeINTEL                                  :: 5834;
    BankBitsALTERA                              :: 5835;
    BankBitsINTEL                               :: 5835;
    ForcePow2DepthALTERA                        :: 5836;
    ForcePow2DepthINTEL                         :: 5836;
    StridesizeALTERA                            :: 5883;
    StridesizeINTEL                             :: 5883;
    WordsizeALTERA                              :: 5884;
    WordsizeINTEL                               :: 5884;
    TrueDualPortALTERA                          :: 5885;
    TrueDualPortINTEL                           :: 5885;
    BurstCoalesceALTERA                         :: 5899;
    BurstCoalesceINTEL                          :: 5899;
    CacheSizeALTERA                             :: 5900;
    CacheSizeINTEL                              :: 5900;
    DontStaticallyCoalesceALTERA                :: 5901;
    DontStaticallyCoalesceINTEL                 :: 5901;
    PrefetchALTERA                              :: 5902;
    PrefetchINTEL                               :: 5902;
    StallEnableALTERA                           :: 5905;
    StallEnableINTEL                            :: 5905;
    FuseLoopsInFunctionALTERA                   :: 5907;
    FuseLoopsInFunctionINTEL                    :: 5907;
    MathOpDSPModeALTERA                         :: 5909;
    MathOpDSPModeINTEL                          :: 5909;
    AliasScopeINTEL                             :: 5914;
    NoAliasINTEL                                :: 5915;
    InitiationIntervalALTERA                    :: 5917;
    InitiationIntervalINTEL                     :: 5917;
    MaxConcurrencyALTERA                        :: 5918;
    MaxConcurrencyINTEL                         :: 5918;
    PipelineEnableALTERA                        :: 5919;
    PipelineEnableINTEL                         :: 5919;
    BufferLocationALTERA                        :: 5921;
    BufferLocationINTEL                         :: 5921;
    IOPipeStorageALTERA                         :: 5944;
    IOPipeStorageINTEL                          :: 5944;
    FunctionFloatingPointModeINTEL              :: 6080;
    SingleElementVectorINTEL                    :: 6085;
    VectorComputeCallableFunctionINTEL          :: 6087;
    MediaBlockIOINTEL                           :: 6140;
    StallFreeALTERA                             :: 6151;
    StallFreeINTEL                              :: 6151;
    FPMaxErrorDecorationINTEL                   :: 6170;
    LatencyControlLabelALTERA                   :: 6172;
    LatencyControlLabelINTEL                    :: 6172;
    LatencyControlConstraintALTERA              :: 6173;
    LatencyControlConstraintINTEL               :: 6173;
    ConduitKernelArgumentALTERA                 :: 6175;
    ConduitKernelArgumentINTEL                  :: 6175;
    RegisterMapKernelArgumentALTERA             :: 6176;
    RegisterMapKernelArgumentINTEL              :: 6176;
    MMHostInterfaceAddressWidthALTERA           :: 6177;
    MMHostInterfaceAddressWidthINTEL            :: 6177;
    MMHostInterfaceDataWidthALTERA              :: 6178;
    MMHostInterfaceDataWidthINTEL               :: 6178;
    MMHostInterfaceLatencyALTERA                :: 6179;
    MMHostInterfaceLatencyINTEL                 :: 6179;
    MMHostInterfaceReadWriteModeALTERA          :: 6180;
    MMHostInterfaceReadWriteModeINTEL           :: 6180;
    MMHostInterfaceMaxBurstALTERA               :: 6181;
    MMHostInterfaceMaxBurstINTEL                :: 6181;
    MMHostInterfaceWaitRequestALTERA            :: 6182;
    MMHostInterfaceWaitRequestINTEL             :: 6182;
    StableKernelArgumentALTERA                  :: 6183;
    StableKernelArgumentINTEL                   :: 6183;
    HostAccessINTEL                             :: 6188;
    InitModeALTERA                              :: 6190;
    InitModeINTEL                               :: 6190;
    ImplementInRegisterMapALTERA                :: 6191;
    ImplementInRegisterMapINTEL                 :: 6191;
    ConditionalINTEL                            :: 6247;
    CacheControlLoadINTEL                       :: 6442;
    CacheControlStoreINTEL                      :: 6443;
    Max                                         :: 2147483647;
}

SpvDecoration :: SpvDecoration_;

SpvBuiltIn_ :: enum u32 {
    Position                             :: 0;
    PointSize                            :: 1;
    ClipDistance                         :: 3;
    CullDistance                         :: 4;
    VertexId                             :: 5;
    InstanceId                           :: 6;
    PrimitiveId                          :: 7;
    InvocationId                         :: 8;
    Layer                                :: 9;
    ViewportIndex                        :: 10;
    TessLevelOuter                       :: 11;
    TessLevelInner                       :: 12;
    TessCoord                            :: 13;
    PatchVertices                        :: 14;
    FragCoord                            :: 15;
    PointCoord                           :: 16;
    FrontFacing                          :: 17;
    SampleId                             :: 18;
    SamplePosition                       :: 19;
    SampleMask                           :: 20;
    FragDepth                            :: 22;
    HelperInvocation                     :: 23;
    NumWorkgroups                        :: 24;
    WorkgroupSize                        :: 25;
    WorkgroupId                          :: 26;
    LocalInvocationId                    :: 27;
    GlobalInvocationId                   :: 28;
    LocalInvocationIndex                 :: 29;
    WorkDim                              :: 30;
    GlobalSize                           :: 31;
    EnqueuedWorkgroupSize                :: 32;
    GlobalOffset                         :: 33;
    GlobalLinearId                       :: 34;
    SubgroupSize                         :: 36;
    SubgroupMaxSize                      :: 37;
    NumSubgroups                         :: 38;
    NumEnqueuedSubgroups                 :: 39;
    SubgroupId                           :: 40;
    SubgroupLocalInvocationId            :: 41;
    VertexIndex                          :: 42;
    InstanceIndex                        :: 43;
    CoreIDARM                            :: 4160;
    CoreCountARM                         :: 4161;
    CoreMaxIDARM                         :: 4162;
    WarpIDARM                            :: 4163;
    WarpMaxIDARM                         :: 4164;
    SubgroupEqMask                       :: 4416;
    SubgroupEqMaskKHR                    :: 4416;
    SubgroupGeMask                       :: 4417;
    SubgroupGeMaskKHR                    :: 4417;
    SubgroupGtMask                       :: 4418;
    SubgroupGtMaskKHR                    :: 4418;
    SubgroupLeMask                       :: 4419;
    SubgroupLeMaskKHR                    :: 4419;
    SubgroupLtMask                       :: 4420;
    SubgroupLtMaskKHR                    :: 4420;
    BaseVertex                           :: 4424;
    BaseInstance                         :: 4425;
    DrawIndex                            :: 4426;
    PrimitiveShadingRateKHR              :: 4432;
    DeviceIndex                          :: 4438;
    ViewIndex                            :: 4440;
    ShadingRateKHR                       :: 4444;
    TileOffsetQCOM                       :: 4492;
    TileDimensionQCOM                    :: 4493;
    TileApronSizeQCOM                    :: 4494;
    BaryCoordNoPerspAMD                  :: 4992;
    BaryCoordNoPerspCentroidAMD          :: 4993;
    BaryCoordNoPerspSampleAMD            :: 4994;
    BaryCoordSmoothAMD                   :: 4995;
    BaryCoordSmoothCentroidAMD           :: 4996;
    BaryCoordSmoothSampleAMD             :: 4997;
    BaryCoordPullModelAMD                :: 4998;
    FragStencilRefEXT                    :: 5014;
    RemainingRecursionLevelsAMDX         :: 5021;
    ShaderIndexAMDX                      :: 5073;
    SamplerHeapEXT                       :: 5122;
    ResourceHeapEXT                      :: 5123;
    ViewportMaskNV                       :: 5253;
    SecondaryPositionNV                  :: 5257;
    SecondaryViewportMaskNV              :: 5258;
    PositionPerViewNV                    :: 5261;
    ViewportMaskPerViewNV                :: 5262;
    FullyCoveredEXT                      :: 5264;
    TaskCountNV                          :: 5274;
    PrimitiveCountNV                     :: 5275;
    PrimitiveIndicesNV                   :: 5276;
    ClipDistancePerViewNV                :: 5277;
    CullDistancePerViewNV                :: 5278;
    LayerPerViewNV                       :: 5279;
    MeshViewCountNV                      :: 5280;
    MeshViewIndicesNV                    :: 5281;
    BaryCoordKHR                         :: 5286;
    BaryCoordNV                          :: 5286;
    BaryCoordNoPerspKHR                  :: 5287;
    BaryCoordNoPerspNV                   :: 5287;
    FragSizeEXT                          :: 5292;
    FragmentSizeNV                       :: 5292;
    FragInvocationCountEXT               :: 5293;
    InvocationsPerPixelNV                :: 5293;
    PrimitivePointIndicesEXT             :: 5294;
    PrimitiveLineIndicesEXT              :: 5295;
    PrimitiveTriangleIndicesEXT          :: 5296;
    CullPrimitiveEXT                     :: 5299;
    LaunchIdKHR                          :: 5319;
    LaunchIdNV                           :: 5319;
    LaunchSizeKHR                        :: 5320;
    LaunchSizeNV                         :: 5320;
    WorldRayOriginKHR                    :: 5321;
    WorldRayOriginNV                     :: 5321;
    WorldRayDirectionKHR                 :: 5322;
    WorldRayDirectionNV                  :: 5322;
    ObjectRayOriginKHR                   :: 5323;
    ObjectRayOriginNV                    :: 5323;
    ObjectRayDirectionKHR                :: 5324;
    ObjectRayDirectionNV                 :: 5324;
    RayTminKHR                           :: 5325;
    RayTminNV                            :: 5325;
    RayTmaxKHR                           :: 5326;
    RayTmaxNV                            :: 5326;
    InstanceCustomIndexKHR               :: 5327;
    InstanceCustomIndexNV                :: 5327;
    ObjectToWorldKHR                     :: 5330;
    ObjectToWorldNV                      :: 5330;
    WorldToObjectKHR                     :: 5331;
    WorldToObjectNV                      :: 5331;
    HitTNV                               :: 5332;
    HitKindKHR                           :: 5333;
    HitKindNV                            :: 5333;
    CurrentRayTimeNV                     :: 5334;
    HitTriangleVertexPositionsKHR        :: 5335;
    HitMicroTriangleVertexPositionsNV    :: 5337;
    HitMicroTriangleVertexBarycentricsNV :: 5344;
    IncomingRayFlagsKHR                  :: 5351;
    IncomingRayFlagsNV                   :: 5351;
    RayGeometryIndexKHR                  :: 5352;
    HitIsSphereNV                        :: 5359;
    HitIsLSSNV                           :: 5360;
    HitSpherePositionNV                  :: 5361;
    WarpsPerSMNV                         :: 5374;
    SMCountNV                            :: 5375;
    WarpIDNV                             :: 5376;
    SMIDNV                               :: 5377;
    HitLSSPositionsNV                    :: 5396;
    HitKindFrontFacingMicroTriangleNV    :: 5405;
    HitKindBackFacingMicroTriangleNV     :: 5406;
    HitSphereRadiusNV                    :: 5420;
    HitLSSRadiiNV                        :: 5421;
    ClusterIDNV                          :: 5436;
    CullMaskKHR                          :: 6021;
    Max                                  :: 2147483647;
}

SpvBuiltIn :: SpvBuiltIn_;

SpvSelectionControlShift_ :: enum u32 {
    FlattenShift     :: 0;
    DontFlattenShift :: 1;
    Max              :: 2147483647;
}

SpvSelectionControlShift :: SpvSelectionControlShift_;

SpvSelectionControlMask_ :: enum u32 {
    MaskNone        :: 0;
    FlattenMask     :: 1;
    DontFlattenMask :: 2;
}

SpvSelectionControlMask :: SpvSelectionControlMask_;

SpvLoopControlShift_ :: enum u32 {
    UnrollShift                     :: 0;
    DontUnrollShift                 :: 1;
    DependencyInfiniteShift         :: 2;
    DependencyLengthShift           :: 3;
    MinIterationsShift              :: 4;
    MaxIterationsShift              :: 5;
    IterationMultipleShift          :: 6;
    PeelCountShift                  :: 7;
    PartialCountShift               :: 8;
    InitiationIntervalALTERAShift   :: 16;
    InitiationIntervalINTELShift    :: 16;
    MaxConcurrencyALTERAShift       :: 17;
    MaxConcurrencyINTELShift        :: 17;
    DependencyArrayALTERAShift      :: 18;
    DependencyArrayINTELShift       :: 18;
    PipelineEnableALTERAShift       :: 19;
    PipelineEnableINTELShift        :: 19;
    LoopCoalesceALTERAShift         :: 20;
    LoopCoalesceINTELShift          :: 20;
    MaxInterleavingALTERAShift      :: 21;
    MaxInterleavingINTELShift       :: 21;
    SpeculatedIterationsALTERAShift :: 22;
    SpeculatedIterationsINTELShift  :: 22;
    NoFusionALTERAShift             :: 23;
    NoFusionINTELShift              :: 23;
    LoopCountALTERAShift            :: 24;
    LoopCountINTELShift             :: 24;
    MaxReinvocationDelayALTERAShift :: 25;
    MaxReinvocationDelayINTELShift  :: 25;
    Max                             :: 2147483647;
}

SpvLoopControlShift :: SpvLoopControlShift_;

SpvLoopControlMask_ :: enum u32 {
    MaskNone                       :: 0;
    UnrollMask                     :: 1;
    DontUnrollMask                 :: 2;
    DependencyInfiniteMask         :: 4;
    DependencyLengthMask           :: 8;
    MinIterationsMask              :: 16;
    MaxIterationsMask              :: 32;
    IterationMultipleMask          :: 64;
    PeelCountMask                  :: 128;
    PartialCountMask               :: 256;
    InitiationIntervalALTERAMask   :: 65536;
    InitiationIntervalINTELMask    :: 65536;
    MaxConcurrencyALTERAMask       :: 131072;
    MaxConcurrencyINTELMask        :: 131072;
    DependencyArrayALTERAMask      :: 262144;
    DependencyArrayINTELMask       :: 262144;
    PipelineEnableALTERAMask       :: 524288;
    PipelineEnableINTELMask        :: 524288;
    LoopCoalesceALTERAMask         :: 1048576;
    LoopCoalesceINTELMask          :: 1048576;
    MaxInterleavingALTERAMask      :: 2097152;
    MaxInterleavingINTELMask       :: 2097152;
    SpeculatedIterationsALTERAMask :: 4194304;
    SpeculatedIterationsINTELMask  :: 4194304;
    NoFusionALTERAMask             :: 8388608;
    NoFusionINTELMask              :: 8388608;
    LoopCountALTERAMask            :: 16777216;
    LoopCountINTELMask             :: 16777216;
    MaxReinvocationDelayALTERAMask :: 33554432;
    MaxReinvocationDelayINTELMask  :: 33554432;
}

SpvLoopControlMask :: SpvLoopControlMask_;

SpvFunctionControlShift_ :: enum u32 {
    InlineShift       :: 0;
    DontInlineShift   :: 1;
    PureShift         :: 2;
    ConstShift        :: 3;
    OptNoneEXTShift   :: 16;
    OptNoneINTELShift :: 16;
    Max               :: 2147483647;
}

SpvFunctionControlShift :: SpvFunctionControlShift_;

SpvFunctionControlMask_ :: enum u32 {
    MaskNone         :: 0;
    InlineMask       :: 1;
    DontInlineMask   :: 2;
    PureMask         :: 4;
    ConstMask        :: 8;
    OptNoneEXTMask   :: 65536;
    OptNoneINTELMask :: 65536;
}

SpvFunctionControlMask :: SpvFunctionControlMask_;

SpvMemorySemanticsShift_ :: enum u32 {
    AcquireShift                :: 1;
    ReleaseShift                :: 2;
    AcquireReleaseShift         :: 3;
    SequentiallyConsistentShift :: 4;
    UniformMemoryShift          :: 6;
    SubgroupMemoryShift         :: 7;
    WorkgroupMemoryShift        :: 8;
    CrossWorkgroupMemoryShift   :: 9;
    AtomicCounterMemoryShift    :: 10;
    ImageMemoryShift            :: 11;
    OutputMemoryShift           :: 12;
    OutputMemoryKHRShift        :: 12;
    MakeAvailableShift          :: 13;
    MakeAvailableKHRShift       :: 13;
    MakeVisibleShift            :: 14;
    MakeVisibleKHRShift         :: 14;
    VolatileShift               :: 15;
    Max                         :: 2147483647;
}

SpvMemorySemanticsShift :: SpvMemorySemanticsShift_;

SpvMemorySemanticsMask_ :: enum u32 {
    MaskNone                   :: 0;
    AcquireMask                :: 2;
    ReleaseMask                :: 4;
    AcquireReleaseMask         :: 8;
    SequentiallyConsistentMask :: 16;
    UniformMemoryMask          :: 64;
    SubgroupMemoryMask         :: 128;
    WorkgroupMemoryMask        :: 256;
    CrossWorkgroupMemoryMask   :: 512;
    AtomicCounterMemoryMask    :: 1024;
    ImageMemoryMask            :: 2048;
    OutputMemoryMask           :: 4096;
    OutputMemoryKHRMask        :: 4096;
    MakeAvailableMask          :: 8192;
    MakeAvailableKHRMask       :: 8192;
    MakeVisibleMask            :: 16384;
    MakeVisibleKHRMask         :: 16384;
    VolatileMask               :: 32768;
}

SpvMemorySemanticsMask :: SpvMemorySemanticsMask_;

SpvMemoryAccessShift_ :: enum u32 {
    VolatileShift                :: 0;
    AlignedShift                 :: 1;
    NontemporalShift             :: 2;
    MakePointerAvailableShift    :: 3;
    MakePointerAvailableKHRShift :: 3;
    MakePointerVisibleShift      :: 4;
    MakePointerVisibleKHRShift   :: 4;
    NonPrivatePointerShift       :: 5;
    NonPrivatePointerKHRShift    :: 5;
    AliasScopeINTELMaskShift     :: 16;
    NoAliasINTELMaskShift        :: 17;
    Max                          :: 2147483647;
}

SpvMemoryAccessShift :: SpvMemoryAccessShift_;

SpvMemoryAccessMask_ :: enum u32 {
    MaskNone                    :: 0;
    VolatileMask                :: 1;
    AlignedMask                 :: 2;
    NontemporalMask             :: 4;
    MakePointerAvailableMask    :: 8;
    MakePointerAvailableKHRMask :: 8;
    MakePointerVisibleMask      :: 16;
    MakePointerVisibleKHRMask   :: 16;
    NonPrivatePointerMask       :: 32;
    NonPrivatePointerKHRMask    :: 32;
    AliasScopeINTELMaskMask     :: 65536;
    NoAliasINTELMaskMask        :: 131072;
}

SpvMemoryAccessMask :: SpvMemoryAccessMask_;

SpvScope_ :: enum u32 {
    CrossDevice    :: 0;
    Device         :: 1;
    Workgroup      :: 2;
    Subgroup       :: 3;
    Invocation     :: 4;
    QueueFamily    :: 5;
    QueueFamilyKHR :: 5;
    ShaderCallKHR  :: 6;
    Max            :: 2147483647;
}

SpvScope :: SpvScope_;

SpvGroupOperation_ :: enum u32 {
    Reduce                      :: 0;
    InclusiveScan               :: 1;
    ExclusiveScan               :: 2;
    ClusteredReduce             :: 3;
    PartitionedReduceEXT        :: 6;
    PartitionedReduceNV         :: 6;
    PartitionedInclusiveScanEXT :: 7;
    PartitionedInclusiveScanNV  :: 7;
    PartitionedExclusiveScanEXT :: 8;
    PartitionedExclusiveScanNV  :: 8;
    Max                         :: 2147483647;
}

SpvGroupOperation :: SpvGroupOperation_;

SpvKernelEnqueueFlags_ :: enum u32 {
    NoWait        :: 0;
    WaitKernel    :: 1;
    WaitWorkGroup :: 2;
    Max           :: 2147483647;
}

SpvKernelEnqueueFlags :: SpvKernelEnqueueFlags_;

SpvKernelProfilingInfoShift_ :: enum u32 {
    CmdExecTimeShift :: 0;
    Max              :: 2147483647;
}

SpvKernelProfilingInfoShift :: SpvKernelProfilingInfoShift_;

SpvKernelProfilingInfoMask_ :: enum u32 {
    MaskNone        :: 0;
    CmdExecTimeMask :: 1;
}

SpvKernelProfilingInfoMask :: SpvKernelProfilingInfoMask_;

SpvCapability_ :: enum u32 {
    Matrix                                       :: 0;
    Shader                                       :: 1;
    Geometry                                     :: 2;
    Tessellation                                 :: 3;
    Addresses                                    :: 4;
    Linkage                                      :: 5;
    Kernel                                       :: 6;
    Vector16                                     :: 7;
    Float16Buffer                                :: 8;
    Float16                                      :: 9;
    Float64                                      :: 10;
    Int64                                        :: 11;
    Int64Atomics                                 :: 12;
    ImageBasic                                   :: 13;
    ImageReadWrite                               :: 14;
    ImageMipmap                                  :: 15;
    Pipes                                        :: 17;
    Groups                                       :: 18;
    DeviceEnqueue                                :: 19;
    LiteralSampler                               :: 20;
    AtomicStorage                                :: 21;
    Int16                                        :: 22;
    TessellationPointSize                        :: 23;
    GeometryPointSize                            :: 24;
    ImageGatherExtended                          :: 25;
    StorageImageMultisample                      :: 27;
    UniformBufferArrayDynamicIndexing            :: 28;
    SampledImageArrayDynamicIndexing             :: 29;
    StorageBufferArrayDynamicIndexing            :: 30;
    StorageImageArrayDynamicIndexing             :: 31;
    ClipDistance                                 :: 32;
    CullDistance                                 :: 33;
    ImageCubeArray                               :: 34;
    SampleRateShading                            :: 35;
    ImageRect                                    :: 36;
    SampledRect                                  :: 37;
    GenericPointer                               :: 38;
    Int8                                         :: 39;
    InputAttachment                              :: 40;
    SparseResidency                              :: 41;
    MinLod                                       :: 42;
    Sampled1D                                    :: 43;
    Image1D                                      :: 44;
    SampledCubeArray                             :: 45;
    SampledBuffer                                :: 46;
    ImageBuffer                                  :: 47;
    ImageMSArray                                 :: 48;
    StorageImageExtendedFormats                  :: 49;
    ImageQuery                                   :: 50;
    DerivativeControl                            :: 51;
    InterpolationFunction                        :: 52;
    TransformFeedback                            :: 53;
    GeometryStreams                              :: 54;
    StorageImageReadWithoutFormat                :: 55;
    StorageImageWriteWithoutFormat               :: 56;
    MultiViewport                                :: 57;
    SubgroupDispatch                             :: 58;
    NamedBarrier                                 :: 59;
    PipeStorage                                  :: 60;
    GroupNonUniform                              :: 61;
    GroupNonUniformVote                          :: 62;
    GroupNonUniformArithmetic                    :: 63;
    GroupNonUniformBallot                        :: 64;
    GroupNonUniformShuffle                       :: 65;
    GroupNonUniformShuffleRelative               :: 66;
    GroupNonUniformClustered                     :: 67;
    GroupNonUniformQuad                          :: 68;
    ShaderLayer                                  :: 69;
    ShaderViewportIndex                          :: 70;
    UniformDecoration                            :: 71;
    CoreBuiltinsARM                              :: 4165;
    TileImageColorReadAccessEXT                  :: 4166;
    TileImageDepthReadAccessEXT                  :: 4167;
    TileImageStencilReadAccessEXT                :: 4168;
    TensorsARM                                   :: 4174;
    StorageTensorArrayDynamicIndexingARM         :: 4175;
    StorageTensorArrayNonUniformIndexingARM      :: 4176;
    GraphARM                                     :: 4191;
    CooperativeMatrixLayoutsARM                  :: 4201;
    Float8EXT                                    :: 4212;
    Float8CooperativeMatrixEXT                   :: 4213;
    FragmentShadingRateKHR                       :: 4422;
    SubgroupBallotKHR                            :: 4423;
    DrawParameters                               :: 4427;
    WorkgroupMemoryExplicitLayoutKHR             :: 4428;
    WorkgroupMemoryExplicitLayout8BitAccessKHR   :: 4429;
    WorkgroupMemoryExplicitLayout16BitAccessKHR  :: 4430;
    SubgroupVoteKHR                              :: 4431;
    StorageBuffer16BitAccess                     :: 4433;
    StorageUniformBufferBlock16                  :: 4433;
    StorageUniform16                             :: 4434;
    UniformAndStorageBuffer16BitAccess           :: 4434;
    StoragePushConstant16                        :: 4435;
    StorageInputOutput16                         :: 4436;
    DeviceGroup                                  :: 4437;
    MultiView                                    :: 4439;
    VariablePointersStorageBuffer                :: 4441;
    VariablePointers                             :: 4442;
    AtomicStorageOps                             :: 4445;
    SampleMaskPostDepthCoverage                  :: 4447;
    StorageBuffer8BitAccess                      :: 4448;
    UniformAndStorageBuffer8BitAccess            :: 4449;
    StoragePushConstant8                         :: 4450;
    DenormPreserve                               :: 4464;
    DenormFlushToZero                            :: 4465;
    SignedZeroInfNanPreserve                     :: 4466;
    RoundingModeRTE                              :: 4467;
    RoundingModeRTZ                              :: 4468;
    RayQueryProvisionalKHR                       :: 4471;
    RayQueryKHR                                  :: 4472;
    UntypedPointersKHR                           :: 4473;
    RayTraversalPrimitiveCullingKHR              :: 4478;
    RayTracingKHR                                :: 4479;
    TextureSampleWeightedQCOM                    :: 4484;
    TextureBoxFilterQCOM                         :: 4485;
    TextureBlockMatchQCOM                        :: 4486;
    TileShadingQCOM                              :: 4495;
    CooperativeMatrixConversionQCOM              :: 4496;
    TextureBlockMatch2QCOM                       :: 4498;
    Float16ImageAMD                              :: 5008;
    ImageGatherBiasLodAMD                        :: 5009;
    FragmentMaskAMD                              :: 5010;
    StencilExportEXT                             :: 5013;
    ImageReadWriteLodAMD                         :: 5015;
    Int64ImageEXT                                :: 5016;
    ShaderClockKHR                               :: 5055;
    ShaderEnqueueAMDX                            :: 5067;
    QuadControlKHR                               :: 5087;
    Int4TypeINTEL                                :: 5112;
    Int4CooperativeMatrixINTEL                   :: 5114;
    BFloat16TypeKHR                              :: 5116;
    BFloat16DotProductKHR                        :: 5117;
    BFloat16CooperativeMatrixKHR                 :: 5118;
    AbortKHR                                     :: 5120;
    DescriptorHeapEXT                            :: 5128;
    ConstantDataKHR                              :: 5146;
    PoisonFreezeKHR                              :: 5156;
    SampleMaskOverrideCoverageNV                 :: 5249;
    GeometryShaderPassthroughNV                  :: 5251;
    ShaderViewportIndexLayerEXT                  :: 5254;
    ShaderViewportIndexLayerNV                   :: 5254;
    ShaderViewportMaskNV                         :: 5255;
    ShaderStereoViewNV                           :: 5259;
    PerViewAttributesNV                          :: 5260;
    FragmentFullyCoveredEXT                      :: 5265;
    MeshShadingNV                                :: 5266;
    ImageFootprintNV                             :: 5282;
    MeshShadingEXT                               :: 5283;
    FragmentBarycentricKHR                       :: 5284;
    FragmentBarycentricNV                        :: 5284;
    ComputeDerivativeGroupQuadsKHR               :: 5288;
    ComputeDerivativeGroupQuadsNV                :: 5288;
    FragmentDensityEXT                           :: 5291;
    ShadingRateNV                                :: 5291;
    GroupNonUniformPartitionedEXT                :: 5297;
    GroupNonUniformPartitionedNV                 :: 5297;
    ShaderNonUniform                             :: 5301;
    ShaderNonUniformEXT                          :: 5301;
    RuntimeDescriptorArray                       :: 5302;
    RuntimeDescriptorArrayEXT                    :: 5302;
    InputAttachmentArrayDynamicIndexing          :: 5303;
    InputAttachmentArrayDynamicIndexingEXT       :: 5303;
    UniformTexelBufferArrayDynamicIndexing       :: 5304;
    UniformTexelBufferArrayDynamicIndexingEXT    :: 5304;
    StorageTexelBufferArrayDynamicIndexing       :: 5305;
    StorageTexelBufferArrayDynamicIndexingEXT    :: 5305;
    UniformBufferArrayNonUniformIndexing         :: 5306;
    UniformBufferArrayNonUniformIndexingEXT      :: 5306;
    SampledImageArrayNonUniformIndexing          :: 5307;
    SampledImageArrayNonUniformIndexingEXT       :: 5307;
    StorageBufferArrayNonUniformIndexing         :: 5308;
    StorageBufferArrayNonUniformIndexingEXT      :: 5308;
    StorageImageArrayNonUniformIndexing          :: 5309;
    StorageImageArrayNonUniformIndexingEXT       :: 5309;
    InputAttachmentArrayNonUniformIndexing       :: 5310;
    InputAttachmentArrayNonUniformIndexingEXT    :: 5310;
    UniformTexelBufferArrayNonUniformIndexing    :: 5311;
    UniformTexelBufferArrayNonUniformIndexingEXT :: 5311;
    StorageTexelBufferArrayNonUniformIndexing    :: 5312;
    StorageTexelBufferArrayNonUniformIndexingEXT :: 5312;
    RayTracingPositionFetchKHR                   :: 5336;
    RayTracingNV                                 :: 5340;
    RayTracingMotionBlurNV                       :: 5341;
    VulkanMemoryModel                            :: 5345;
    VulkanMemoryModelKHR                         :: 5345;
    VulkanMemoryModelDeviceScope                 :: 5346;
    VulkanMemoryModelDeviceScopeKHR              :: 5346;
    PhysicalStorageBufferAddresses               :: 5347;
    PhysicalStorageBufferAddressesEXT            :: 5347;
    ComputeDerivativeGroupLinearKHR              :: 5350;
    ComputeDerivativeGroupLinearNV               :: 5350;
    RayTracingProvisionalKHR                     :: 5353;
    CooperativeMatrixNV                          :: 5357;
    FragmentShaderSampleInterlockEXT             :: 5363;
    FragmentShaderShadingRateInterlockEXT        :: 5372;
    ShaderSMBuiltinsNV                           :: 5373;
    FragmentShaderPixelInterlockEXT              :: 5378;
    DemoteToHelperInvocation                     :: 5379;
    DemoteToHelperInvocationEXT                  :: 5379;
    DisplacementMicromapNV                       :: 5380;
    RayTracingOpacityMicromapEXT                 :: 5381;
    ShaderInvocationReorderNV                    :: 5383;
    ShaderInvocationReorderEXT                   :: 5388;
    BindlessTextureNV                            :: 5390;
    RayQueryPositionFetchKHR                     :: 5391;
    CooperativeVectorNV                          :: 5394;
    AtomicFloat16VectorNV                        :: 5404;
    RayTracingDisplacementMicromapNV             :: 5409;
    RawAccessChainsNV                            :: 5414;
    RayTracingSpheresGeometryNV                  :: 5418;
    RayTracingLinearSweptSpheresGeometryNV       :: 5419;
    PushConstantBanksNV                          :: 5423;
    LongVectorEXT                                :: 5425;
    Shader64BitIndexingEXT                       :: 5426;
    CooperativeMatrixReductionsNV                :: 5430;
    CooperativeMatrixConversionsNV               :: 5431;
    CooperativeMatrixPerElementOperationsNV      :: 5432;
    CooperativeMatrixTensorAddressingNV          :: 5433;
    CooperativeMatrixBlockLoadsNV                :: 5434;
    CooperativeVectorTrainingNV                  :: 5435;
    RayTracingClusterAccelerationStructureNV     :: 5437;
    TensorAddressingNV                           :: 5439;
    SubgroupShuffleINTEL                         :: 5568;
    SubgroupBufferBlockIOINTEL                   :: 5569;
    SubgroupImageBlockIOINTEL                    :: 5570;
    SubgroupImageMediaBlockIOINTEL               :: 5579;
    RoundToInfinityINTEL                         :: 5582;
    FloatingPointModeINTEL                       :: 5583;
    IntegerFunctions2INTEL                       :: 5584;
    FunctionPointersINTEL                        :: 5603;
    IndirectReferencesINTEL                      :: 5604;
    AsmINTEL                                     :: 5606;
    AtomicFloat32MinMaxEXT                       :: 5612;
    AtomicFloat64MinMaxEXT                       :: 5613;
    AtomicFloat16MinMaxEXT                       :: 5616;
    VectorComputeINTEL                           :: 5617;
    VectorAnyINTEL                               :: 5619;
    ExpectAssumeKHR                              :: 5629;
    SubgroupAvcMotionEstimationINTEL             :: 5696;
    SubgroupAvcMotionEstimationIntraINTEL        :: 5697;
    SubgroupAvcMotionEstimationChromaINTEL       :: 5698;
    VariableLengthArrayINTEL                     :: 5817;
    FunctionFloatControlINTEL                    :: 5821;
    FPGAMemoryAttributesALTERA                   :: 5824;
    FPGAMemoryAttributesINTEL                    :: 5824;
    FPFastMathModeINTEL                          :: 5837;
    ArbitraryPrecisionIntegersALTERA             :: 5844;
    ArbitraryPrecisionIntegersINTEL              :: 5844;
    ArbitraryPrecisionFloatingPointALTERA        :: 5845;
    ArbitraryPrecisionFloatingPointINTEL         :: 5845;
    UnstructuredLoopControlsINTEL                :: 5886;
    FPGALoopControlsALTERA                       :: 5888;
    FPGALoopControlsINTEL                        :: 5888;
    KernelAttributesINTEL                        :: 5892;
    FPGAKernelAttributesINTEL                    :: 5897;
    FPGAMemoryAccessesALTERA                     :: 5898;
    FPGAMemoryAccessesINTEL                      :: 5898;
    FPGAClusterAttributesALTERA                  :: 5904;
    FPGAClusterAttributesINTEL                   :: 5904;
    LoopFuseALTERA                               :: 5906;
    LoopFuseINTEL                                :: 5906;
    FPGADSPControlALTERA                         :: 5908;
    FPGADSPControlINTEL                          :: 5908;
    MemoryAccessAliasingINTEL                    :: 5910;
    FPGAInvocationPipeliningAttributesALTERA     :: 5916;
    FPGAInvocationPipeliningAttributesINTEL      :: 5916;
    FPGABufferLocationALTERA                     :: 5920;
    FPGABufferLocationINTEL                      :: 5920;
    ArbitraryPrecisionFixedPointALTERA           :: 5922;
    ArbitraryPrecisionFixedPointINTEL            :: 5922;
    USMStorageClassesALTERA                      :: 5935;
    USMStorageClassesINTEL                       :: 5935;
    RuntimeAlignedAttributeALTERA                :: 5939;
    RuntimeAlignedAttributeINTEL                 :: 5939;
    IOPipesALTERA                                :: 5943;
    IOPipesINTEL                                 :: 5943;
    BlockingPipesALTERA                          :: 5945;
    BlockingPipesINTEL                           :: 5945;
    FPGARegALTERA                                :: 5948;
    FPGARegINTEL                                 :: 5948;
    DotProductInputAll                           :: 6016;
    DotProductInputAllKHR                        :: 6016;
    DotProductInput4x8Bit                        :: 6017;
    DotProductInput4x8BitKHR                     :: 6017;
    DotProductInput4x8BitPacked                  :: 6018;
    DotProductInput4x8BitPackedKHR               :: 6018;
    DotProduct                                   :: 6019;
    DotProductKHR                                :: 6019;
    RayCullMaskKHR                               :: 6020;
    CooperativeMatrixKHR                         :: 6022;
    ReplicatedCompositesEXT                      :: 6024;
    BitInstructions                              :: 6025;
    GroupNonUniformRotateKHR                     :: 6026;
    FloatControls2                               :: 6029;
    FMAKHR                                       :: 6030;
    AtomicFloat32AddEXT                          :: 6033;
    AtomicFloat64AddEXT                          :: 6034;
    LongCompositesINTEL                          :: 6089;
    OptNoneEXT                                   :: 6094;
    OptNoneINTEL                                 :: 6094;
    AtomicFloat16AddEXT                          :: 6095;
    DebugInfoModuleINTEL                         :: 6114;
    BFloat16ConversionINTEL                      :: 6115;
    SplitBarrierINTEL                            :: 6141;
    ArithmeticFenceEXT                           :: 6144;
    FPGAClusterAttributesV2ALTERA                :: 6150;
    FPGAClusterAttributesV2INTEL                 :: 6150;
    FPGAKernelAttributesv2INTEL                  :: 6161;
    TaskSequenceALTERA                           :: 6162;
    TaskSequenceINTEL                            :: 6162;
    FPMaxErrorINTEL                              :: 6169;
    FPGALatencyControlALTERA                     :: 6171;
    FPGALatencyControlINTEL                      :: 6171;
    FPGAArgumentInterfacesALTERA                 :: 6174;
    FPGAArgumentInterfacesINTEL                  :: 6174;
    GlobalVariableHostAccessINTEL                :: 6187;
    GlobalVariableFPGADecorationsALTERA          :: 6189;
    GlobalVariableFPGADecorationsINTEL           :: 6189;
    SubgroupBufferPrefetchINTEL                  :: 6220;
    Subgroup2DBlockIOINTEL                       :: 6228;
    Subgroup2DBlockTransformINTEL                :: 6229;
    Subgroup2DBlockTransposeINTEL                :: 6230;
    SubgroupMatrixMultiplyAccumulateINTEL        :: 6236;
    TernaryBitwiseFunctionINTEL                  :: 6241;
    UntypedVariableLengthArrayINTEL              :: 6243;
    SpecConditionalINTEL                         :: 6245;
    FunctionVariantsINTEL                        :: 6246;
    GroupUniformArithmeticKHR                    :: 6400;
    TensorFloat32RoundingINTEL                   :: 6425;
    MaskedGatherScatterINTEL                     :: 6427;
    CacheControlsINTEL                           :: 6441;
    RegisterLimitsINTEL                          :: 6460;
    BindlessImagesINTEL                          :: 6528;
    DotProductFloat16AccFloat32VALVE             :: 6912;
    DotProductFloat16AccFloat16VALVE             :: 6913;
    DotProductBFloat16AccVALVE                   :: 6914;
    DotProductFloat8AccFloat32VALVE              :: 6915;
    Max                                          :: 2147483647;
}

SpvCapability :: SpvCapability_;

SpvRayFlagsShift_ :: enum u32 {
    OpaqueKHRShift                     :: 0;
    NoOpaqueKHRShift                   :: 1;
    TerminateOnFirstHitKHRShift        :: 2;
    SkipClosestHitShaderKHRShift       :: 3;
    CullBackFacingTrianglesKHRShift    :: 4;
    CullFrontFacingTrianglesKHRShift   :: 5;
    CullOpaqueKHRShift                 :: 6;
    CullNoOpaqueKHRShift               :: 7;
    SkipBuiltinPrimitivesNVShift       :: 8;
    SkipTrianglesKHRShift              :: 8;
    SkipAABBsKHRShift                  :: 9;
    ForceOpacityMicromap2StateEXTShift :: 10;
    Max                                :: 2147483647;
}

SpvRayFlagsShift :: SpvRayFlagsShift_;

SpvRayFlagsMask_ :: enum u32 {
    MaskNone                          :: 0;
    OpaqueKHRMask                     :: 1;
    NoOpaqueKHRMask                   :: 2;
    TerminateOnFirstHitKHRMask        :: 4;
    SkipClosestHitShaderKHRMask       :: 8;
    CullBackFacingTrianglesKHRMask    :: 16;
    CullFrontFacingTrianglesKHRMask   :: 32;
    CullOpaqueKHRMask                 :: 64;
    CullNoOpaqueKHRMask               :: 128;
    SkipBuiltinPrimitivesNVMask       :: 256;
    SkipTrianglesKHRMask              :: 256;
    SkipAABBsKHRMask                  :: 512;
    ForceOpacityMicromap2StateEXTMask :: 1024;
}

SpvRayFlagsMask :: SpvRayFlagsMask_;

SpvRayQueryIntersection_ :: enum u32 {
    RayQueryCandidateIntersectionKHR :: 0;
    RayQueryCommittedIntersectionKHR :: 1;
    Max                              :: 2147483647;
}

SpvRayQueryIntersection :: SpvRayQueryIntersection_;

SpvRayQueryCommittedIntersectionType_ :: enum u32 {
    RayQueryCommittedIntersectionNoneKHR      :: 0;
    RayQueryCommittedIntersectionTriangleKHR  :: 1;
    RayQueryCommittedIntersectionGeneratedKHR :: 2;
    Max                                       :: 2147483647;
}

SpvRayQueryCommittedIntersectionType :: SpvRayQueryCommittedIntersectionType_;

SpvRayQueryCandidateIntersectionType_ :: enum u32 {
    RayQueryCandidateIntersectionTriangleKHR :: 0;
    RayQueryCandidateIntersectionAABBKHR     :: 1;
    Max                                      :: 2147483647;
}

SpvRayQueryCandidateIntersectionType :: SpvRayQueryCandidateIntersectionType_;

SpvFragmentShadingRateShift_ :: enum u32 {
    Vertical2PixelsShift   :: 0;
    Vertical4PixelsShift   :: 1;
    Horizontal2PixelsShift :: 2;
    Horizontal4PixelsShift :: 3;
    Max                    :: 2147483647;
}

SpvFragmentShadingRateShift :: SpvFragmentShadingRateShift_;

SpvFragmentShadingRateMask_ :: enum u32 {
    MaskNone              :: 0;
    Vertical2PixelsMask   :: 1;
    Vertical4PixelsMask   :: 2;
    Horizontal2PixelsMask :: 4;
    Horizontal4PixelsMask :: 8;
}

SpvFragmentShadingRateMask :: SpvFragmentShadingRateMask_;

SpvFPDenormMode_ :: enum u32 {
    Preserve    :: 0;
    FlushToZero :: 1;
    Max         :: 2147483647;
}

SpvFPDenormMode :: SpvFPDenormMode_;

SpvFPOperationMode_ :: enum u32 {
    IEEE :: 0;
    ALT  :: 1;
    Max  :: 2147483647;
}

SpvFPOperationMode :: SpvFPOperationMode_;

SpvQuantizationModes_ :: enum u32 {
    TRN          :: 0;
    TRN_ZERO     :: 1;
    RND          :: 2;
    RND_ZERO     :: 3;
    RND_INF      :: 4;
    RND_MIN_INF  :: 5;
    RND_CONV     :: 6;
    RND_CONV_ODD :: 7;
    Max          :: 2147483647;
}

SpvQuantizationModes :: SpvQuantizationModes_;

SpvOverflowModes_ :: enum u32 {
    WRAP     :: 0;
    SAT      :: 1;
    SAT_ZERO :: 2;
    SAT_SYM  :: 3;
    Max      :: 2147483647;
}

SpvOverflowModes :: SpvOverflowModes_;

SpvPackedVectorFormat_ :: enum u32 {
    PackedVectorFormat4x8Bit    :: 0;
    PackedVectorFormat4x8BitKHR :: 0;
    Max                         :: 2147483647;
}

SpvPackedVectorFormat :: SpvPackedVectorFormat_;

SpvCooperativeMatrixOperandsShift_ :: enum u32 {
    MatrixASignedComponentsKHRShift      :: 0;
    MatrixBSignedComponentsKHRShift      :: 1;
    MatrixCSignedComponentsKHRShift      :: 2;
    MatrixResultSignedComponentsKHRShift :: 3;
    SaturatingAccumulationKHRShift       :: 4;
    Max                                  :: 2147483647;
}

SpvCooperativeMatrixOperandsShift :: SpvCooperativeMatrixOperandsShift_;

SpvCooperativeMatrixOperandsMask_ :: enum u32 {
    MaskNone                            :: 0;
    MatrixASignedComponentsKHRMask      :: 1;
    MatrixBSignedComponentsKHRMask      :: 2;
    MatrixCSignedComponentsKHRMask      :: 4;
    MatrixResultSignedComponentsKHRMask :: 8;
    SaturatingAccumulationKHRMask       :: 16;
}

SpvCooperativeMatrixOperandsMask :: SpvCooperativeMatrixOperandsMask_;

SpvCooperativeMatrixLayout_ :: enum u32 {
    RowMajorKHR                 :: 0;
    ColumnMajorKHR              :: 1;
    RowBlockedInterleavedARM    :: 4202;
    ColumnBlockedInterleavedARM :: 4203;
    Max                         :: 2147483647;
}

SpvCooperativeMatrixLayout :: SpvCooperativeMatrixLayout_;

SpvCooperativeMatrixUse_ :: enum u32 {
    trixAKHR           :: 0;
    trixBKHR           :: 1;
    trixAccumulatorKHR :: 2;
    x                  :: 2147483647;
}

SpvCooperativeMatrixUse :: SpvCooperativeMatrixUse_;

SpvCooperativeMatrixReduceShift_ :: enum u32 {
    RowShift    :: 0;
    ColumnShift :: 1;
    _2x2Shift   :: 2;
    Max         :: 2147483647;
}

SpvCooperativeMatrixReduceShift :: SpvCooperativeMatrixReduceShift_;

SpvCooperativeMatrixReduceMask_ :: enum u32 {
    MaskNone   :: 0;
    RowMask    :: 1;
    ColumnMask :: 2;
    _2x2Mask   :: 4;
}

SpvCooperativeMatrixReduceMask :: SpvCooperativeMatrixReduceMask_;

SpvTensorClampMode_ :: enum u32 {
    Undefined      :: 0;
    Constant       :: 1;
    ClampToEdge    :: 2;
    Repeat         :: 3;
    RepeatMirrored :: 4;
    Max            :: 2147483647;
}

SpvTensorClampMode :: SpvTensorClampMode_;

SpvTensorAddressingOperandsShift_ :: enum u32 {
    TensorViewShift :: 0;
    DecodeFuncShift :: 1;
    Max             :: 2147483647;
}

SpvTensorAddressingOperandsShift :: SpvTensorAddressingOperandsShift_;

SpvTensorAddressingOperandsMask_ :: enum u32 {
    MaskNone       :: 0;
    TensorViewMask :: 1;
    DecodeFuncMask :: 2;
}

SpvTensorAddressingOperandsMask :: SpvTensorAddressingOperandsMask_;

SpvTensorOperandsShift_ :: enum u32 {
    NontemporalARMShift          :: 0;
    OutOfBoundsValueARMShift     :: 1;
    MakeElementAvailableARMShift :: 2;
    MakeElementVisibleARMShift   :: 3;
    NonPrivateElementARMShift    :: 4;
    Max                          :: 2147483647;
}

SpvTensorOperandsShift :: SpvTensorOperandsShift_;

SpvTensorOperandsMask_ :: enum u32 {
    MaskNone                    :: 0;
    NontemporalARMMask          :: 1;
    OutOfBoundsValueARMMask     :: 2;
    MakeElementAvailableARMMask :: 4;
    MakeElementVisibleARMMask   :: 8;
    NonPrivateElementARMMask    :: 16;
}

SpvTensorOperandsMask :: SpvTensorOperandsMask_;

SpvInitializationModeQualifier_ :: enum u32 {
    InitOnDeviceReprogramALTERA :: 0;
    InitOnDeviceReprogramINTEL  :: 0;
    InitOnDeviceResetALTERA     :: 1;
    InitOnDeviceResetINTEL      :: 1;
    Max                         :: 2147483647;
}

SpvInitializationModeQualifier :: SpvInitializationModeQualifier_;

SpvHostAccessQualifier_ :: enum u32 {
    NoneINTEL      :: 0;
    ReadINTEL      :: 1;
    WriteINTEL     :: 2;
    ReadWriteINTEL :: 3;
    Max            :: 2147483647;
}

SpvHostAccessQualifier :: SpvHostAccessQualifier_;

SpvLoadCacheControl_ :: enum u32 {
    UncachedINTEL            :: 0;
    CachedINTEL              :: 1;
    StreamingINTEL           :: 2;
    InvalidateAfterReadINTEL :: 3;
    ConstCachedINTEL         :: 4;
    Max                      :: 2147483647;
}

SpvLoadCacheControl :: SpvLoadCacheControl_;

SpvStoreCacheControl_ :: enum u32 {
    UncachedINTEL     :: 0;
    WriteThroughINTEL :: 1;
    WriteBackINTEL    :: 2;
    StreamingINTEL    :: 3;
    Max               :: 2147483647;
}

SpvStoreCacheControl :: SpvStoreCacheControl_;

SpvNamedMaximumNumberOfRegisters_ :: enum u32 {
    AutoINTEL :: 0;
    Max       :: 2147483647;
}

SpvNamedMaximumNumberOfRegisters :: SpvNamedMaximumNumberOfRegisters_;

SpvMatrixMultiplyAccumulateOperandsShift_ :: enum u32 {
    trixASignedComponentsINTELShift :: 0;
    trixBSignedComponentsINTELShift :: 1;
    trixCBFloat16INTELShift         :: 2;
    trixResultBFloat16INTELShift    :: 3;
    trixAPackedInt8INTELShift       :: 4;
    trixBPackedInt8INTELShift       :: 5;
    trixAPackedInt4INTELShift       :: 6;
    trixBPackedInt4INTELShift       :: 7;
    trixATF32INTELShift             :: 8;
    trixBTF32INTELShift             :: 9;
    trixAPackedFloat16INTELShift    :: 10;
    trixBPackedFloat16INTELShift    :: 11;
    trixAPackedBFloat16INTELShift   :: 12;
    trixBPackedBFloat16INTELShift   :: 13;
    x                               :: 2147483647;
}

SpvMatrixMultiplyAccumulateOperandsShift :: SpvMatrixMultiplyAccumulateOperandsShift_;

SpvMatrixMultiplyAccumulateOperandsMask_ :: enum u32 {
    skNone                         :: 0;
    trixASignedComponentsINTELMask :: 1;
    trixBSignedComponentsINTELMask :: 2;
    trixCBFloat16INTELMask         :: 4;
    trixResultBFloat16INTELMask    :: 8;
    trixAPackedInt8INTELMask       :: 16;
    trixBPackedInt8INTELMask       :: 32;
    trixAPackedInt4INTELMask       :: 64;
    trixBPackedInt4INTELMask       :: 128;
    trixATF32INTELMask             :: 256;
    trixBTF32INTELMask             :: 512;
    trixAPackedFloat16INTELMask    :: 1024;
    trixBPackedFloat16INTELMask    :: 2048;
    trixAPackedBFloat16INTELMask   :: 4096;
    trixBPackedBFloat16INTELMask   :: 8192;
}

SpvMatrixMultiplyAccumulateOperandsMask :: SpvMatrixMultiplyAccumulateOperandsMask_;

SpvRawAccessChainOperandsShift_ :: enum u32 {
    RobustnessPerComponentNVShift :: 0;
    RobustnessPerElementNVShift   :: 1;
    Max                           :: 2147483647;
}

SpvRawAccessChainOperandsShift :: SpvRawAccessChainOperandsShift_;

SpvRawAccessChainOperandsMask_ :: enum u32 {
    MaskNone                     :: 0;
    RobustnessPerComponentNVMask :: 1;
    RobustnessPerElementNVMask   :: 2;
}

SpvRawAccessChainOperandsMask :: SpvRawAccessChainOperandsMask_;

SpvFPEncoding_ :: enum u32 {
    BFloat16KHR   :: 0;
    Float8E4M3EXT :: 4214;
    Float8E5M2EXT :: 4215;
    Max           :: 2147483647;
}

SpvFPEncoding :: SpvFPEncoding_;

SpvCooperativeVectorMatrixLayout_ :: enum u32 {
    RowMajorNV           :: 0;
    ColumnMajorNV        :: 1;
    InferencingOptimalNV :: 2;
    TrainingOptimalNV    :: 3;
    Max                  :: 2147483647;
}

SpvCooperativeVectorMatrixLayout :: SpvCooperativeVectorMatrixLayout_;

SpvComponentType_ :: enum u32 {
    Float16NV            :: 0;
    Float32NV            :: 1;
    Float64NV            :: 2;
    SignedInt8NV         :: 3;
    SignedInt16NV        :: 4;
    SignedInt32NV        :: 5;
    SignedInt64NV        :: 6;
    UnsignedInt8NV       :: 7;
    UnsignedInt16NV      :: 8;
    UnsignedInt32NV      :: 9;
    UnsignedInt64NV      :: 10;
    SignedInt8PackedNV   :: 1000491000;
    UnsignedInt8PackedNV :: 1000491001;
    FloatE4M3NV          :: 1000491002;
    FloatE5M2NV          :: 1000491003;
    Max                  :: 2147483647;
}

SpvComponentType :: SpvComponentType_;

SpvOp_ :: enum u32 {
    Nop                                                                   :: 0;
    Undef                                                                 :: 1;
    SourceContinued                                                       :: 2;
    Source                                                                :: 3;
    SourceExtension                                                       :: 4;
    Name                                                                  :: 5;
    MemberName                                                            :: 6;
    String                                                                :: 7;
    Line                                                                  :: 8;
    Extension                                                             :: 10;
    ExtInstImport                                                         :: 11;
    ExtInst                                                               :: 12;
    MemoryModel                                                           :: 14;
    EntryPoint                                                            :: 15;
    ExecutionMode                                                         :: 16;
    Capability                                                            :: 17;
    TypeVoid                                                              :: 19;
    TypeBool                                                              :: 20;
    TypeInt                                                               :: 21;
    TypeFloat                                                             :: 22;
    TypeVector                                                            :: 23;
    TypeMatrix                                                            :: 24;
    TypeImage                                                             :: 25;
    TypeSampler                                                           :: 26;
    TypeSampledImage                                                      :: 27;
    TypeArray                                                             :: 28;
    TypeRuntimeArray                                                      :: 29;
    TypeStruct                                                            :: 30;
    TypeOpaque                                                            :: 31;
    TypePointer                                                           :: 32;
    TypeFunction                                                          :: 33;
    TypeEvent                                                             :: 34;
    TypeDeviceEvent                                                       :: 35;
    TypeReserveId                                                         :: 36;
    TypeQueue                                                             :: 37;
    TypePipe                                                              :: 38;
    TypeForwardPointer                                                    :: 39;
    ConstantTrue                                                          :: 41;
    ConstantFalse                                                         :: 42;
    Constant                                                              :: 43;
    ConstantComposite                                                     :: 44;
    ConstantSampler                                                       :: 45;
    ConstantNull                                                          :: 46;
    SpecConstantTrue                                                      :: 48;
    SpecConstantFalse                                                     :: 49;
    SpecConstant                                                          :: 50;
    SpecConstantComposite                                                 :: 51;
    SpecConstantOp                                                        :: 52;
    Function                                                              :: 54;
    FunctionParameter                                                     :: 55;
    FunctionEnd                                                           :: 56;
    FunctionCall                                                          :: 57;
    Variable                                                              :: 59;
    ImageTexelPointer                                                     :: 60;
    Load                                                                  :: 61;
    Store                                                                 :: 62;
    CopyMemory                                                            :: 63;
    CopyMemorySized                                                       :: 64;
    AccessChain                                                           :: 65;
    InBoundsAccessChain                                                   :: 66;
    PtrAccessChain                                                        :: 67;
    ArrayLength                                                           :: 68;
    GenericPtrMemSemantics                                                :: 69;
    InBoundsPtrAccessChain                                                :: 70;
    Decorate                                                              :: 71;
    MemberDecorate                                                        :: 72;
    DecorationGroup                                                       :: 73;
    GroupDecorate                                                         :: 74;
    GroupMemberDecorate                                                   :: 75;
    VectorExtractDynamic                                                  :: 77;
    VectorInsertDynamic                                                   :: 78;
    VectorShuffle                                                         :: 79;
    CompositeConstruct                                                    :: 80;
    CompositeExtract                                                      :: 81;
    CompositeInsert                                                       :: 82;
    CopyObject                                                            :: 83;
    Transpose                                                             :: 84;
    SampledImage                                                          :: 86;
    ImageSampleImplicitLod                                                :: 87;
    ImageSampleExplicitLod                                                :: 88;
    ImageSampleDrefImplicitLod                                            :: 89;
    ImageSampleDrefExplicitLod                                            :: 90;
    ImageSampleProjImplicitLod                                            :: 91;
    ImageSampleProjExplicitLod                                            :: 92;
    ImageSampleProjDrefImplicitLod                                        :: 93;
    ImageSampleProjDrefExplicitLod                                        :: 94;
    ImageFetch                                                            :: 95;
    ImageGather                                                           :: 96;
    ImageDrefGather                                                       :: 97;
    ImageRead                                                             :: 98;
    ImageWrite                                                            :: 99;
    Image                                                                 :: 100;
    ImageQueryFormat                                                      :: 101;
    ImageQueryOrder                                                       :: 102;
    ImageQuerySizeLod                                                     :: 103;
    ImageQuerySize                                                        :: 104;
    ImageQueryLod                                                         :: 105;
    ImageQueryLevels                                                      :: 106;
    ImageQuerySamples                                                     :: 107;
    ConvertFToU                                                           :: 109;
    ConvertFToS                                                           :: 110;
    ConvertSToF                                                           :: 111;
    ConvertUToF                                                           :: 112;
    UConvert                                                              :: 113;
    SConvert                                                              :: 114;
    FConvert                                                              :: 115;
    QuantizeToF16                                                         :: 116;
    ConvertPtrToU                                                         :: 117;
    SatConvertSToU                                                        :: 118;
    SatConvertUToS                                                        :: 119;
    ConvertUToPtr                                                         :: 120;
    PtrCastToGeneric                                                      :: 121;
    GenericCastToPtr                                                      :: 122;
    GenericCastToPtrExplicit                                              :: 123;
    Bitcast                                                               :: 124;
    SNegate                                                               :: 126;
    FNegate                                                               :: 127;
    IAdd                                                                  :: 128;
    FAdd                                                                  :: 129;
    ISub                                                                  :: 130;
    FSub                                                                  :: 131;
    IMul                                                                  :: 132;
    FMul                                                                  :: 133;
    UDiv                                                                  :: 134;
    SDiv                                                                  :: 135;
    FDiv                                                                  :: 136;
    UMod                                                                  :: 137;
    SRem                                                                  :: 138;
    SMod                                                                  :: 139;
    FRem                                                                  :: 140;
    FMod                                                                  :: 141;
    VectorTimesScalar                                                     :: 142;
    MatrixTimesScalar                                                     :: 143;
    VectorTimesMatrix                                                     :: 144;
    MatrixTimesVector                                                     :: 145;
    MatrixTimesMatrix                                                     :: 146;
    OuterProduct                                                          :: 147;
    Dot                                                                   :: 148;
    IAddCarry                                                             :: 149;
    ISubBorrow                                                            :: 150;
    UMulExtended                                                          :: 151;
    SMulExtended                                                          :: 152;
    _Any                                                                  :: 154;
    All                                                                   :: 155;
    IsNan                                                                 :: 156;
    IsInf                                                                 :: 157;
    IsFinite                                                              :: 158;
    IsNormal                                                              :: 159;
    SignBitSet                                                            :: 160;
    LessOrGreater                                                         :: 161;
    Ordered                                                               :: 162;
    Unordered                                                             :: 163;
    LogicalEqual                                                          :: 164;
    LogicalNotEqual                                                       :: 165;
    LogicalOr                                                             :: 166;
    LogicalAnd                                                            :: 167;
    LogicalNot                                                            :: 168;
    Select                                                                :: 169;
    IEqual                                                                :: 170;
    INotEqual                                                             :: 171;
    UGreaterThan                                                          :: 172;
    SGreaterThan                                                          :: 173;
    UGreaterThanEqual                                                     :: 174;
    SGreaterThanEqual                                                     :: 175;
    ULessThan                                                             :: 176;
    SLessThan                                                             :: 177;
    ULessThanEqual                                                        :: 178;
    SLessThanEqual                                                        :: 179;
    FOrdEqual                                                             :: 180;
    FUnordEqual                                                           :: 181;
    FOrdNotEqual                                                          :: 182;
    FUnordNotEqual                                                        :: 183;
    FOrdLessThan                                                          :: 184;
    FUnordLessThan                                                        :: 185;
    FOrdGreaterThan                                                       :: 186;
    FUnordGreaterThan                                                     :: 187;
    FOrdLessThanEqual                                                     :: 188;
    FUnordLessThanEqual                                                   :: 189;
    FOrdGreaterThanEqual                                                  :: 190;
    FUnordGreaterThanEqual                                                :: 191;
    ShiftRightLogical                                                     :: 194;
    ShiftRightArithmetic                                                  :: 195;
    ShiftLeftLogical                                                      :: 196;
    BitwiseOr                                                             :: 197;
    BitwiseXor                                                            :: 198;
    BitwiseAnd                                                            :: 199;
    Not                                                                   :: 200;
    BitFieldInsert                                                        :: 201;
    BitFieldSExtract                                                      :: 202;
    BitFieldUExtract                                                      :: 203;
    BitReverse                                                            :: 204;
    BitCount                                                              :: 205;
    DPdx                                                                  :: 207;
    DPdy                                                                  :: 208;
    Fwidth                                                                :: 209;
    DPdxFine                                                              :: 210;
    DPdyFine                                                              :: 211;
    FwidthFine                                                            :: 212;
    DPdxCoarse                                                            :: 213;
    DPdyCoarse                                                            :: 214;
    FwidthCoarse                                                          :: 215;
    EmitVertex                                                            :: 218;
    EndPrimitive                                                          :: 219;
    EmitStreamVertex                                                      :: 220;
    EndStreamPrimitive                                                    :: 221;
    ControlBarrier                                                        :: 224;
    MemoryBarrier                                                         :: 225;
    AtomicLoad                                                            :: 227;
    AtomicStore                                                           :: 228;
    AtomicExchange                                                        :: 229;
    AtomicCompareExchange                                                 :: 230;
    AtomicCompareExchangeWeak                                             :: 231;
    AtomicIIncrement                                                      :: 232;
    AtomicIDecrement                                                      :: 233;
    AtomicIAdd                                                            :: 234;
    AtomicISub                                                            :: 235;
    AtomicSMin                                                            :: 236;
    AtomicUMin                                                            :: 237;
    AtomicSMax                                                            :: 238;
    AtomicUMax                                                            :: 239;
    AtomicAnd                                                             :: 240;
    AtomicOr                                                              :: 241;
    AtomicXor                                                             :: 242;
    Phi                                                                   :: 245;
    LoopMerge                                                             :: 246;
    SelectionMerge                                                        :: 247;
    Label                                                                 :: 248;
    Branch                                                                :: 249;
    BranchConditional                                                     :: 250;
    Switch                                                                :: 251;
    Kill                                                                  :: 252;
    Return                                                                :: 253;
    ReturnValue                                                           :: 254;
    Unreachable                                                           :: 255;
    LifetimeStart                                                         :: 256;
    LifetimeStop                                                          :: 257;
    GroupAsyncCopy                                                        :: 259;
    GroupWaitEvents                                                       :: 260;
    GroupAll                                                              :: 261;
    GroupAny                                                              :: 262;
    GroupBroadcast                                                        :: 263;
    GroupIAdd                                                             :: 264;
    GroupFAdd                                                             :: 265;
    GroupFMin                                                             :: 266;
    GroupUMin                                                             :: 267;
    GroupSMin                                                             :: 268;
    GroupFMax                                                             :: 269;
    GroupUMax                                                             :: 270;
    GroupSMax                                                             :: 271;
    ReadPipe                                                              :: 274;
    WritePipe                                                             :: 275;
    ReservedReadPipe                                                      :: 276;
    ReservedWritePipe                                                     :: 277;
    ReserveReadPipePackets                                                :: 278;
    ReserveWritePipePackets                                               :: 279;
    CommitReadPipe                                                        :: 280;
    CommitWritePipe                                                       :: 281;
    IsValidReserveId                                                      :: 282;
    GetNumPipePackets                                                     :: 283;
    GetMaxPipePackets                                                     :: 284;
    GroupReserveReadPipePackets                                           :: 285;
    GroupReserveWritePipePackets                                          :: 286;
    GroupCommitReadPipe                                                   :: 287;
    GroupCommitWritePipe                                                  :: 288;
    EnqueueMarker                                                         :: 291;
    EnqueueKernel                                                         :: 292;
    GetKernelNDrangeSubGroupCount                                         :: 293;
    GetKernelNDrangeMaxSubGroupSize                                       :: 294;
    GetKernelWorkGroupSize                                                :: 295;
    GetKernelPreferredWorkGroupSizeMultiple                               :: 296;
    RetainEvent                                                           :: 297;
    ReleaseEvent                                                          :: 298;
    CreateUserEvent                                                       :: 299;
    IsValidEvent                                                          :: 300;
    SetUserEventStatus                                                    :: 301;
    CaptureEventProfilingInfo                                             :: 302;
    GetDefaultQueue                                                       :: 303;
    BuildNDRange                                                          :: 304;
    ImageSparseSampleImplicitLod                                          :: 305;
    ImageSparseSampleExplicitLod                                          :: 306;
    ImageSparseSampleDrefImplicitLod                                      :: 307;
    ImageSparseSampleDrefExplicitLod                                      :: 308;
    ImageSparseSampleProjImplicitLod                                      :: 309;
    ImageSparseSampleProjExplicitLod                                      :: 310;
    ImageSparseSampleProjDrefImplicitLod                                  :: 311;
    ImageSparseSampleProjDrefExplicitLod                                  :: 312;
    ImageSparseFetch                                                      :: 313;
    ImageSparseGather                                                     :: 314;
    ImageSparseDrefGather                                                 :: 315;
    ImageSparseTexelsResident                                             :: 316;
    NoLine                                                                :: 317;
    AtomicFlagTestAndSet                                                  :: 318;
    AtomicFlagClear                                                       :: 319;
    ImageSparseRead                                                       :: 320;
    SizeOf                                                                :: 321;
    TypePipeStorage                                                       :: 322;
    ConstantPipeStorage                                                   :: 323;
    CreatePipeFromPipeStorage                                             :: 324;
    GetKernelLocalSizeForSubgroupCount                                    :: 325;
    GetKernelMaxNumSubgroups                                              :: 326;
    TypeNamedBarrier                                                      :: 327;
    NamedBarrierInitialize                                                :: 328;
    MemoryNamedBarrier                                                    :: 329;
    ModuleProcessed                                                       :: 330;
    ExecutionModeId                                                       :: 331;
    DecorateId                                                            :: 332;
    GroupNonUniformElect                                                  :: 333;
    GroupNonUniformAll                                                    :: 334;
    GroupNonUniformAny                                                    :: 335;
    GroupNonUniformAllEqual                                               :: 336;
    GroupNonUniformBroadcast                                              :: 337;
    GroupNonUniformBroadcastFirst                                         :: 338;
    GroupNonUniformBallot                                                 :: 339;
    GroupNonUniformInverseBallot                                          :: 340;
    GroupNonUniformBallotBitExtract                                       :: 341;
    GroupNonUniformBallotBitCount                                         :: 342;
    GroupNonUniformBallotFindLSB                                          :: 343;
    GroupNonUniformBallotFindMSB                                          :: 344;
    GroupNonUniformShuffle                                                :: 345;
    GroupNonUniformShuffleXor                                             :: 346;
    GroupNonUniformShuffleUp                                              :: 347;
    GroupNonUniformShuffleDown                                            :: 348;
    GroupNonUniformIAdd                                                   :: 349;
    GroupNonUniformFAdd                                                   :: 350;
    GroupNonUniformIMul                                                   :: 351;
    GroupNonUniformFMul                                                   :: 352;
    GroupNonUniformSMin                                                   :: 353;
    GroupNonUniformUMin                                                   :: 354;
    GroupNonUniformFMin                                                   :: 355;
    GroupNonUniformSMax                                                   :: 356;
    GroupNonUniformUMax                                                   :: 357;
    GroupNonUniformFMax                                                   :: 358;
    GroupNonUniformBitwiseAnd                                             :: 359;
    GroupNonUniformBitwiseOr                                              :: 360;
    GroupNonUniformBitwiseXor                                             :: 361;
    GroupNonUniformLogicalAnd                                             :: 362;
    GroupNonUniformLogicalOr                                              :: 363;
    GroupNonUniformLogicalXor                                             :: 364;
    GroupNonUniformQuadBroadcast                                          :: 365;
    GroupNonUniformQuadSwap                                               :: 366;
    CopyLogical                                                           :: 400;
    PtrEqual                                                              :: 401;
    PtrNotEqual                                                           :: 402;
    PtrDiff                                                               :: 403;
    ColorAttachmentReadEXT                                                :: 4160;
    DepthAttachmentReadEXT                                                :: 4161;
    StencilAttachmentReadEXT                                              :: 4162;
    TypeTensorARM                                                         :: 4163;
    TensorReadARM                                                         :: 4164;
    TensorWriteARM                                                        :: 4165;
    TensorQuerySizeARM                                                    :: 4166;
    GraphConstantARM                                                      :: 4181;
    GraphEntryPointARM                                                    :: 4182;
    GraphARM                                                              :: 4183;
    GraphInputARM                                                         :: 4184;
    GraphSetOutputARM                                                     :: 4185;
    GraphEndARM                                                           :: 4186;
    TypeGraphARM                                                          :: 4190;
    TerminateInvocation                                                   :: 4416;
    TypeUntypedPointerKHR                                                 :: 4417;
    UntypedVariableKHR                                                    :: 4418;
    UntypedAccessChainKHR                                                 :: 4419;
    UntypedInBoundsAccessChainKHR                                         :: 4420;
    SubgroupBallotKHR                                                     :: 4421;
    SubgroupFirstInvocationKHR                                            :: 4422;
    UntypedPtrAccessChainKHR                                              :: 4423;
    UntypedInBoundsPtrAccessChainKHR                                      :: 4424;
    UntypedArrayLengthKHR                                                 :: 4425;
    UntypedPrefetchKHR                                                    :: 4426;
    FmaKHR                                                                :: 4427;
    SubgroupAllKHR                                                        :: 4428;
    SubgroupAnyKHR                                                        :: 4429;
    SubgroupAllEqualKHR                                                   :: 4430;
    GroupNonUniformRotateKHR                                              :: 4431;
    SubgroupReadInvocationKHR                                             :: 4432;
    ExtInstWithForwardRefsKHR                                             :: 4433;
    UntypedGroupAsyncCopyKHR                                              :: 4434;
    TraceRayKHR                                                           :: 4445;
    ExecuteCallableKHR                                                    :: 4446;
    ConvertUToAccelerationStructureKHR                                    :: 4447;
    IgnoreIntersectionKHR                                                 :: 4448;
    TerminateRayKHR                                                       :: 4449;
    SDot                                                                  :: 4450;
    SDotKHR                                                               :: 4450;
    UDot                                                                  :: 4451;
    UDotKHR                                                               :: 4451;
    SUDot                                                                 :: 4452;
    SUDotKHR                                                              :: 4452;
    SDotAccSat                                                            :: 4453;
    SDotAccSatKHR                                                         :: 4453;
    UDotAccSat                                                            :: 4454;
    UDotAccSatKHR                                                         :: 4454;
    SUDotAccSat                                                           :: 4455;
    SUDotAccSatKHR                                                        :: 4455;
    TypeCooperativeMatrixKHR                                              :: 4456;
    CooperativeMatrixLoadKHR                                              :: 4457;
    CooperativeMatrixStoreKHR                                             :: 4458;
    CooperativeMatrixMulAddKHR                                            :: 4459;
    CooperativeMatrixLengthKHR                                            :: 4460;
    ConstantCompositeReplicateEXT                                         :: 4461;
    SpecConstantCompositeReplicateEXT                                     :: 4462;
    CompositeConstructReplicateEXT                                        :: 4463;
    TypeRayQueryKHR                                                       :: 4472;
    RayQueryInitializeKHR                                                 :: 4473;
    RayQueryTerminateKHR                                                  :: 4474;
    RayQueryGenerateIntersectionKHR                                       :: 4475;
    RayQueryConfirmIntersectionKHR                                        :: 4476;
    RayQueryProceedKHR                                                    :: 4477;
    RayQueryGetIntersectionTypeKHR                                        :: 4479;
    ImageSampleWeightedQCOM                                               :: 4480;
    ImageBoxFilterQCOM                                                    :: 4481;
    ImageBlockMatchSSDQCOM                                                :: 4482;
    ImageBlockMatchSADQCOM                                                :: 4483;
    BitCastArrayQCOM                                                      :: 4497;
    ImageBlockMatchWindowSSDQCOM                                          :: 4500;
    ImageBlockMatchWindowSADQCOM                                          :: 4501;
    ImageBlockMatchGatherSSDQCOM                                          :: 4502;
    ImageBlockMatchGatherSADQCOM                                          :: 4503;
    CompositeConstructCoopMatQCOM                                         :: 4540;
    CompositeExtractCoopMatQCOM                                           :: 4541;
    ExtractSubArrayQCOM                                                   :: 4542;
    GroupIAddNonUniformAMD                                                :: 5000;
    GroupFAddNonUniformAMD                                                :: 5001;
    GroupFMinNonUniformAMD                                                :: 5002;
    GroupUMinNonUniformAMD                                                :: 5003;
    GroupSMinNonUniformAMD                                                :: 5004;
    GroupFMaxNonUniformAMD                                                :: 5005;
    GroupUMaxNonUniformAMD                                                :: 5006;
    GroupSMaxNonUniformAMD                                                :: 5007;
    FragmentMaskFetchAMD                                                  :: 5011;
    FragmentFetchAMD                                                      :: 5012;
    ReadClockKHR                                                          :: 5056;
    AllocateNodePayloadsAMDX                                              :: 5074;
    EnqueueNodePayloadsAMDX                                               :: 5075;
    TypeNodePayloadArrayAMDX                                              :: 5076;
    FinishWritingNodePayloadAMDX                                          :: 5078;
    NodePayloadArrayLengthAMDX                                            :: 5090;
    IsNodePayloadValidAMDX                                                :: 5101;
    ConstantStringAMDX                                                    :: 5103;
    SpecConstantStringAMDX                                                :: 5104;
    GroupNonUniformQuadAllKHR                                             :: 5110;
    GroupNonUniformQuadAnyKHR                                             :: 5111;
    TypeBufferEXT                                                         :: 5115;
    BufferPointerEXT                                                      :: 5119;
    AbortKHR                                                              :: 5121;
    UntypedImageTexelPointerEXT                                           :: 5126;
    MemberDecorateIdEXT                                                   :: 5127;
    ConstantSizeOfEXT                                                     :: 5129;
    ConstantDataKHR                                                       :: 5147;
    SpecConstantDataKHR                                                   :: 5148;
    PoisonKHR                                                             :: 5158;
    FreezeKHR                                                             :: 5159;
    HitObjectRecordHitMotionNV                                            :: 5249;
    HitObjectRecordHitWithIndexMotionNV                                   :: 5250;
    HitObjectRecordMissMotionNV                                           :: 5251;
    HitObjectGetWorldToObjectNV                                           :: 5252;
    HitObjectGetObjectToWorldNV                                           :: 5253;
    HitObjectGetObjectRayDirectionNV                                      :: 5254;
    HitObjectGetObjectRayOriginNV                                         :: 5255;
    HitObjectTraceRayMotionNV                                             :: 5256;
    HitObjectGetShaderRecordBufferHandleNV                                :: 5257;
    HitObjectGetShaderBindingTableRecordIndexNV                           :: 5258;
    HitObjectRecordEmptyNV                                                :: 5259;
    HitObjectTraceRayNV                                                   :: 5260;
    HitObjectRecordHitNV                                                  :: 5261;
    HitObjectRecordHitWithIndexNV                                         :: 5262;
    HitObjectRecordMissNV                                                 :: 5263;
    HitObjectExecuteShaderNV                                              :: 5264;
    HitObjectGetCurrentTimeNV                                             :: 5265;
    HitObjectGetAttributesNV                                              :: 5266;
    HitObjectGetHitKindNV                                                 :: 5267;
    HitObjectGetPrimitiveIndexNV                                          :: 5268;
    HitObjectGetGeometryIndexNV                                           :: 5269;
    HitObjectGetInstanceIdNV                                              :: 5270;
    HitObjectGetInstanceCustomIndexNV                                     :: 5271;
    HitObjectGetWorldRayDirectionNV                                       :: 5272;
    HitObjectGetWorldRayOriginNV                                          :: 5273;
    HitObjectGetRayTMaxNV                                                 :: 5274;
    HitObjectGetRayTMinNV                                                 :: 5275;
    HitObjectIsEmptyNV                                                    :: 5276;
    HitObjectIsHitNV                                                      :: 5277;
    HitObjectIsMissNV                                                     :: 5278;
    ReorderThreadWithHitObjectNV                                          :: 5279;
    ReorderThreadWithHintNV                                               :: 5280;
    TypeHitObjectNV                                                       :: 5281;
    ImageSampleFootprintNV                                                :: 5283;
    TypeCooperativeVectorNV                                               :: 5288;
    TypeVectorIdEXT                                                       :: 5288;
    CooperativeVectorMatrixMulNV                                          :: 5289;
    CooperativeVectorOuterProductAccumulateNV                             :: 5290;
    CooperativeVectorReduceSumAccumulateNV                                :: 5291;
    CooperativeVectorMatrixMulAddNV                                       :: 5292;
    CooperativeMatrixConvertNV                                            :: 5293;
    EmitMeshTasksEXT                                                      :: 5294;
    SetMeshOutputsEXT                                                     :: 5295;
    GroupNonUniformPartitionEXT                                           :: 5296;
    GroupNonUniformPartitionNV                                            :: 5296;
    WritePackedPrimitiveIndices4x8NV                                      :: 5299;
    FetchMicroTriangleVertexPositionNV                                    :: 5300;
    FetchMicroTriangleVertexBarycentricNV                                 :: 5301;
    CooperativeVectorLoadNV                                               :: 5302;
    CooperativeVectorStoreNV                                              :: 5303;
    HitObjectRecordFromQueryEXT                                           :: 5304;
    HitObjectRecordMissEXT                                                :: 5305;
    HitObjectRecordMissMotionEXT                                          :: 5306;
    HitObjectGetIntersectionTriangleVertexPositionsEXT                    :: 5307;
    HitObjectGetRayFlagsEXT                                               :: 5308;
    HitObjectSetShaderBindingTableRecordIndexEXT                          :: 5309;
    HitObjectReorderExecuteShaderEXT                                      :: 5310;
    HitObjectTraceReorderExecuteEXT                                       :: 5311;
    HitObjectTraceMotionReorderExecuteEXT                                 :: 5312;
    TypeHitObjectEXT                                                      :: 5313;
    ReorderThreadWithHintEXT                                              :: 5314;
    ReorderThreadWithHitObjectEXT                                         :: 5315;
    HitObjectTraceRayEXT                                                  :: 5316;
    HitObjectTraceRayMotionEXT                                            :: 5317;
    HitObjectRecordEmptyEXT                                               :: 5318;
    HitObjectExecuteShaderEXT                                             :: 5319;
    HitObjectGetCurrentTimeEXT                                            :: 5320;
    HitObjectGetAttributesEXT                                             :: 5321;
    HitObjectGetHitKindEXT                                                :: 5322;
    HitObjectGetPrimitiveIndexEXT                                         :: 5323;
    HitObjectGetGeometryIndexEXT                                          :: 5324;
    HitObjectGetInstanceIdEXT                                             :: 5325;
    HitObjectGetInstanceCustomIndexEXT                                    :: 5326;
    HitObjectGetObjectRayOriginEXT                                        :: 5327;
    HitObjectGetObjectRayDirectionEXT                                     :: 5328;
    HitObjectGetWorldRayDirectionEXT                                      :: 5329;
    HitObjectGetWorldRayOriginEXT                                         :: 5330;
    HitObjectGetObjectToWorldEXT                                          :: 5331;
    HitObjectGetWorldToObjectEXT                                          :: 5332;
    HitObjectGetRayTMaxEXT                                                :: 5333;
    ReportIntersectionKHR                                                 :: 5334;
    ReportIntersectionNV                                                  :: 5334;
    IgnoreIntersectionNV                                                  :: 5335;
    TerminateRayNV                                                        :: 5336;
    TraceNV                                                               :: 5337;
    TraceMotionNV                                                         :: 5338;
    TraceRayMotionNV                                                      :: 5339;
    RayQueryGetIntersectionTriangleVertexPositionsKHR                     :: 5340;
    TypeAccelerationStructureKHR                                          :: 5341;
    TypeAccelerationStructureNV                                           :: 5341;
    ExecuteCallableNV                                                     :: 5344;
    RayQueryGetClusterIdNV                                                :: 5345;
    RayQueryGetIntersectionClusterIdNV                                    :: 5345;
    HitObjectGetClusterIdNV                                               :: 5346;
    HitObjectGetRayTMinEXT                                                :: 5347;
    HitObjectGetShaderBindingTableRecordIndexEXT                          :: 5348;
    HitObjectGetShaderRecordBufferHandleEXT                               :: 5349;
    HitObjectIsEmptyEXT                                                   :: 5350;
    HitObjectIsHitEXT                                                     :: 5351;
    HitObjectIsMissEXT                                                    :: 5352;
    TypeCooperativeMatrixNV                                               :: 5358;
    CooperativeMatrixLoadNV                                               :: 5359;
    CooperativeMatrixStoreNV                                              :: 5360;
    CooperativeMatrixMulAddNV                                             :: 5361;
    CooperativeMatrixLengthNV                                             :: 5362;
    BeginInvocationInterlockEXT                                           :: 5364;
    EndInvocationInterlockEXT                                             :: 5365;
    CooperativeMatrixReduceNV                                             :: 5366;
    CooperativeMatrixLoadTensorNV                                         :: 5367;
    CooperativeMatrixStoreTensorNV                                        :: 5368;
    CooperativeMatrixPerElementOpNV                                       :: 5369;
    TypeTensorLayoutNV                                                    :: 5370;
    TypeTensorViewNV                                                      :: 5371;
    CreateTensorLayoutNV                                                  :: 5372;
    TensorLayoutSetDimensionNV                                            :: 5373;
    TensorLayoutSetStrideNV                                               :: 5374;
    TensorLayoutSliceNV                                                   :: 5375;
    TensorLayoutSetClampValueNV                                           :: 5376;
    CreateTensorViewNV                                                    :: 5377;
    TensorViewSetDimensionNV                                              :: 5378;
    TensorViewSetStrideNV                                                 :: 5379;
    DemoteToHelperInvocation                                              :: 5380;
    DemoteToHelperInvocationEXT                                           :: 5380;
    IsHelperInvocationEXT                                                 :: 5381;
    TensorViewSetClipNV                                                   :: 5382;
    TensorLayoutSetBlockSizeNV                                            :: 5384;
    CooperativeMatrixTransposeNV                                          :: 5390;
    ConvertUToImageNV                                                     :: 5391;
    ConvertUToSamplerNV                                                   :: 5392;
    ConvertImageToUNV                                                     :: 5393;
    ConvertSamplerToUNV                                                   :: 5394;
    ConvertUToSampledImageNV                                              :: 5395;
    ConvertSampledImageToUNV                                              :: 5396;
    SamplerImageAddressingModeNV                                          :: 5397;
    RawAccessChainNV                                                      :: 5398;
    RayQueryGetIntersectionSpherePositionNV                               :: 5427;
    RayQueryGetIntersectionSphereRadiusNV                                 :: 5428;
    RayQueryGetIntersectionLSSPositionsNV                                 :: 5429;
    RayQueryGetIntersectionLSSRadiiNV                                     :: 5430;
    RayQueryGetIntersectionLSSHitValueNV                                  :: 5431;
    HitObjectGetSpherePositionNV                                          :: 5432;
    HitObjectGetSphereRadiusNV                                            :: 5433;
    HitObjectGetLSSPositionsNV                                            :: 5434;
    HitObjectGetLSSRadiiNV                                                :: 5435;
    HitObjectIsSphereHitNV                                                :: 5436;
    HitObjectIsLSSHitNV                                                   :: 5437;
    RayQueryIsSphereHitNV                                                 :: 5438;
    RayQueryIsLSSHitNV                                                    :: 5439;
    SubgroupShuffleINTEL                                                  :: 5571;
    SubgroupShuffleDownINTEL                                              :: 5572;
    SubgroupShuffleUpINTEL                                                :: 5573;
    SubgroupShuffleXorINTEL                                               :: 5574;
    SubgroupBlockReadINTEL                                                :: 5575;
    SubgroupBlockWriteINTEL                                               :: 5576;
    SubgroupImageBlockReadINTEL                                           :: 5577;
    SubgroupImageBlockWriteINTEL                                          :: 5578;
    SubgroupImageMediaBlockReadINTEL                                      :: 5580;
    SubgroupImageMediaBlockWriteINTEL                                     :: 5581;
    UCountLeadingZerosINTEL                                               :: 5585;
    UCountTrailingZerosINTEL                                              :: 5586;
    AbsISubINTEL                                                          :: 5587;
    AbsUSubINTEL                                                          :: 5588;
    IAddSatINTEL                                                          :: 5589;
    UAddSatINTEL                                                          :: 5590;
    IAverageINTEL                                                         :: 5591;
    UAverageINTEL                                                         :: 5592;
    IAverageRoundedINTEL                                                  :: 5593;
    UAverageRoundedINTEL                                                  :: 5594;
    ISubSatINTEL                                                          :: 5595;
    USubSatINTEL                                                          :: 5596;
    IMul32x16INTEL                                                        :: 5597;
    UMul32x16INTEL                                                        :: 5598;
    ConstantFunctionPointerINTEL                                          :: 5600;
    FunctionPointerCallINTEL                                              :: 5601;
    AsmTargetINTEL                                                        :: 5609;
    AsmINTEL                                                              :: 5610;
    AsmCallINTEL                                                          :: 5611;
    AtomicFMinEXT                                                         :: 5614;
    AtomicFMaxEXT                                                         :: 5615;
    AssumeTrueKHR                                                         :: 5630;
    ExpectKHR                                                             :: 5631;
    DecorateString                                                        :: 5632;
    DecorateStringGOOGLE                                                  :: 5632;
    MemberDecorateString                                                  :: 5633;
    MemberDecorateStringGOOGLE                                            :: 5633;
    VmeImageINTEL                                                         :: 5699;
    TypeVmeImageINTEL                                                     :: 5700;
    TypeAvcImePayloadINTEL                                                :: 5701;
    TypeAvcRefPayloadINTEL                                                :: 5702;
    TypeAvcSicPayloadINTEL                                                :: 5703;
    TypeAvcMcePayloadINTEL                                                :: 5704;
    TypeAvcMceResultINTEL                                                 :: 5705;
    TypeAvcImeResultINTEL                                                 :: 5706;
    TypeAvcImeResultSingleReferenceStreamoutINTEL                         :: 5707;
    TypeAvcImeResultDualReferenceStreamoutINTEL                           :: 5708;
    TypeAvcImeSingleReferenceStreaminINTEL                                :: 5709;
    TypeAvcImeDualReferenceStreaminINTEL                                  :: 5710;
    TypeAvcRefResultINTEL                                                 :: 5711;
    TypeAvcSicResultINTEL                                                 :: 5712;
    SubgroupAvcMceGetDefaultInterBaseMultiReferencePenaltyINTEL           :: 5713;
    SubgroupAvcMceSetInterBaseMultiReferencePenaltyINTEL                  :: 5714;
    SubgroupAvcMceGetDefaultInterShapePenaltyINTEL                        :: 5715;
    SubgroupAvcMceSetInterShapePenaltyINTEL                               :: 5716;
    SubgroupAvcMceGetDefaultInterDirectionPenaltyINTEL                    :: 5717;
    SubgroupAvcMceSetInterDirectionPenaltyINTEL                           :: 5718;
    SubgroupAvcMceGetDefaultIntraLumaShapePenaltyINTEL                    :: 5719;
    SubgroupAvcMceGetDefaultInterMotionVectorCostTableINTEL               :: 5720;
    SubgroupAvcMceGetDefaultHighPenaltyCostTableINTEL                     :: 5721;
    SubgroupAvcMceGetDefaultMediumPenaltyCostTableINTEL                   :: 5722;
    SubgroupAvcMceGetDefaultLowPenaltyCostTableINTEL                      :: 5723;
    SubgroupAvcMceSetMotionVectorCostFunctionINTEL                        :: 5724;
    SubgroupAvcMceGetDefaultIntraLumaModePenaltyINTEL                     :: 5725;
    SubgroupAvcMceGetDefaultNonDcLumaIntraPenaltyINTEL                    :: 5726;
    SubgroupAvcMceGetDefaultIntraChromaModeBasePenaltyINTEL               :: 5727;
    SubgroupAvcMceSetAcOnlyHaarINTEL                                      :: 5728;
    SubgroupAvcMceSetSourceInterlacedFieldPolarityINTEL                   :: 5729;
    SubgroupAvcMceSetSingleReferenceInterlacedFieldPolarityINTEL          :: 5730;
    SubgroupAvcMceSetDualReferenceInterlacedFieldPolaritiesINTEL          :: 5731;
    SubgroupAvcMceConvertToImePayloadINTEL                                :: 5732;
    SubgroupAvcMceConvertToImeResultINTEL                                 :: 5733;
    SubgroupAvcMceConvertToRefPayloadINTEL                                :: 5734;
    SubgroupAvcMceConvertToRefResultINTEL                                 :: 5735;
    SubgroupAvcMceConvertToSicPayloadINTEL                                :: 5736;
    SubgroupAvcMceConvertToSicResultINTEL                                 :: 5737;
    SubgroupAvcMceGetMotionVectorsINTEL                                   :: 5738;
    SubgroupAvcMceGetInterDistortionsINTEL                                :: 5739;
    SubgroupAvcMceGetBestInterDistortionsINTEL                            :: 5740;
    SubgroupAvcMceGetInterMajorShapeINTEL                                 :: 5741;
    SubgroupAvcMceGetInterMinorShapeINTEL                                 :: 5742;
    SubgroupAvcMceGetInterDirectionsINTEL                                 :: 5743;
    SubgroupAvcMceGetInterMotionVectorCountINTEL                          :: 5744;
    SubgroupAvcMceGetInterReferenceIdsINTEL                               :: 5745;
    SubgroupAvcMceGetInterReferenceInterlacedFieldPolaritiesINTEL         :: 5746;
    SubgroupAvcImeInitializeINTEL                                         :: 5747;
    SubgroupAvcImeSetSingleReferenceINTEL                                 :: 5748;
    SubgroupAvcImeSetDualReferenceINTEL                                   :: 5749;
    SubgroupAvcImeRefWindowSizeINTEL                                      :: 5750;
    SubgroupAvcImeAdjustRefOffsetINTEL                                    :: 5751;
    SubgroupAvcImeConvertToMcePayloadINTEL                                :: 5752;
    SubgroupAvcImeSetMaxMotionVectorCountINTEL                            :: 5753;
    SubgroupAvcImeSetUnidirectionalMixDisableINTEL                        :: 5754;
    SubgroupAvcImeSetEarlySearchTerminationThresholdINTEL                 :: 5755;
    SubgroupAvcImeSetWeightedSadINTEL                                     :: 5756;
    SubgroupAvcImeEvaluateWithSingleReferenceINTEL                        :: 5757;
    SubgroupAvcImeEvaluateWithDualReferenceINTEL                          :: 5758;
    SubgroupAvcImeEvaluateWithSingleReferenceStreaminINTEL                :: 5759;
    SubgroupAvcImeEvaluateWithDualReferenceStreaminINTEL                  :: 5760;
    SubgroupAvcImeEvaluateWithSingleReferenceStreamoutINTEL               :: 5761;
    SubgroupAvcImeEvaluateWithDualReferenceStreamoutINTEL                 :: 5762;
    SubgroupAvcImeEvaluateWithSingleReferenceStreaminoutINTEL             :: 5763;
    SubgroupAvcImeEvaluateWithDualReferenceStreaminoutINTEL               :: 5764;
    SubgroupAvcImeConvertToMceResultINTEL                                 :: 5765;
    SubgroupAvcImeGetSingleReferenceStreaminINTEL                         :: 5766;
    SubgroupAvcImeGetDualReferenceStreaminINTEL                           :: 5767;
    SubgroupAvcImeStripSingleReferenceStreamoutINTEL                      :: 5768;
    SubgroupAvcImeStripDualReferenceStreamoutINTEL                        :: 5769;
    SubgroupAvcImeGetStreamoutSingleReferenceMajorShapeMotionVectorsINTEL :: 5770;
    SubgroupAvcImeGetStreamoutSingleReferenceMajorShapeDistortionsINTEL   :: 5771;
    SubgroupAvcImeGetStreamoutSingleReferenceMajorShapeReferenceIdsINTEL  :: 5772;
    SubgroupAvcImeGetStreamoutDualReferenceMajorShapeMotionVectorsINTEL   :: 5773;
    SubgroupAvcImeGetStreamoutDualReferenceMajorShapeDistortionsINTEL     :: 5774;
    SubgroupAvcImeGetStreamoutDualReferenceMajorShapeReferenceIdsINTEL    :: 5775;
    SubgroupAvcImeGetBorderReachedINTEL                                   :: 5776;
    SubgroupAvcImeGetTruncatedSearchIndicationINTEL                       :: 5777;
    SubgroupAvcImeGetUnidirectionalEarlySearchTerminationINTEL            :: 5778;
    SubgroupAvcImeGetWeightingPatternMinimumMotionVectorINTEL             :: 5779;
    SubgroupAvcImeGetWeightingPatternMinimumDistortionINTEL               :: 5780;
    SubgroupAvcFmeInitializeINTEL                                         :: 5781;
    SubgroupAvcBmeInitializeINTEL                                         :: 5782;
    SubgroupAvcRefConvertToMcePayloadINTEL                                :: 5783;
    SubgroupAvcRefSetBidirectionalMixDisableINTEL                         :: 5784;
    SubgroupAvcRefSetBilinearFilterEnableINTEL                            :: 5785;
    SubgroupAvcRefEvaluateWithSingleReferenceINTEL                        :: 5786;
    SubgroupAvcRefEvaluateWithDualReferenceINTEL                          :: 5787;
    SubgroupAvcRefEvaluateWithMultiReferenceINTEL                         :: 5788;
    SubgroupAvcRefEvaluateWithMultiReferenceInterlacedINTEL               :: 5789;
    SubgroupAvcRefConvertToMceResultINTEL                                 :: 5790;
    SubgroupAvcSicInitializeINTEL                                         :: 5791;
    SubgroupAvcSicConfigureSkcINTEL                                       :: 5792;
    SubgroupAvcSicConfigureIpeLumaINTEL                                   :: 5793;
    SubgroupAvcSicConfigureIpeLumaChromaINTEL                             :: 5794;
    SubgroupAvcSicGetMotionVectorMaskINTEL                                :: 5795;
    SubgroupAvcSicConvertToMcePayloadINTEL                                :: 5796;
    SubgroupAvcSicSetIntraLumaShapePenaltyINTEL                           :: 5797;
    SubgroupAvcSicSetIntraLumaModeCostFunctionINTEL                       :: 5798;
    SubgroupAvcSicSetIntraChromaModeCostFunctionINTEL                     :: 5799;
    SubgroupAvcSicSetBilinearFilterEnableINTEL                            :: 5800;
    SubgroupAvcSicSetSkcForwardTransformEnableINTEL                       :: 5801;
    SubgroupAvcSicSetBlockBasedRawSkipSadINTEL                            :: 5802;
    SubgroupAvcSicEvaluateIpeINTEL                                        :: 5803;
    SubgroupAvcSicEvaluateWithSingleReferenceINTEL                        :: 5804;
    SubgroupAvcSicEvaluateWithDualReferenceINTEL                          :: 5805;
    SubgroupAvcSicEvaluateWithMultiReferenceINTEL                         :: 5806;
    SubgroupAvcSicEvaluateWithMultiReferenceInterlacedINTEL               :: 5807;
    SubgroupAvcSicConvertToMceResultINTEL                                 :: 5808;
    SubgroupAvcSicGetIpeLumaShapeINTEL                                    :: 5809;
    SubgroupAvcSicGetBestIpeLumaDistortionINTEL                           :: 5810;
    SubgroupAvcSicGetBestIpeChromaDistortionINTEL                         :: 5811;
    SubgroupAvcSicGetPackedIpeLumaModesINTEL                              :: 5812;
    SubgroupAvcSicGetIpeChromaModeINTEL                                   :: 5813;
    SubgroupAvcSicGetPackedSkcLumaCountThresholdINTEL                     :: 5814;
    SubgroupAvcSicGetPackedSkcLumaSumThresholdINTEL                       :: 5815;
    SubgroupAvcSicGetInterRawSadsINTEL                                    :: 5816;
    VariableLengthArrayINTEL                                              :: 5818;
    SaveMemoryINTEL                                                       :: 5819;
    RestoreMemoryINTEL                                                    :: 5820;
    ArbitraryFloatSinCosPiALTERA                                          :: 5840;
    ArbitraryFloatSinCosPiINTEL                                           :: 5840;
    ArbitraryFloatCastALTERA                                              :: 5841;
    ArbitraryFloatCastINTEL                                               :: 5841;
    ArbitraryFloatCastFromIntALTERA                                       :: 5842;
    ArbitraryFloatCastFromIntINTEL                                        :: 5842;
    ArbitraryFloatCastToIntALTERA                                         :: 5843;
    ArbitraryFloatCastToIntINTEL                                          :: 5843;
    ArbitraryFloatAddALTERA                                               :: 5846;
    ArbitraryFloatAddINTEL                                                :: 5846;
    ArbitraryFloatSubALTERA                                               :: 5847;
    ArbitraryFloatSubINTEL                                                :: 5847;
    ArbitraryFloatMulALTERA                                               :: 5848;
    ArbitraryFloatMulINTEL                                                :: 5848;
    ArbitraryFloatDivALTERA                                               :: 5849;
    ArbitraryFloatDivINTEL                                                :: 5849;
    ArbitraryFloatGTALTERA                                                :: 5850;
    ArbitraryFloatGTINTEL                                                 :: 5850;
    ArbitraryFloatGEALTERA                                                :: 5851;
    ArbitraryFloatGEINTEL                                                 :: 5851;
    ArbitraryFloatLTALTERA                                                :: 5852;
    ArbitraryFloatLTINTEL                                                 :: 5852;
    ArbitraryFloatLEALTERA                                                :: 5853;
    ArbitraryFloatLEINTEL                                                 :: 5853;
    ArbitraryFloatEQALTERA                                                :: 5854;
    ArbitraryFloatEQINTEL                                                 :: 5854;
    ArbitraryFloatRecipALTERA                                             :: 5855;
    ArbitraryFloatRecipINTEL                                              :: 5855;
    ArbitraryFloatRSqrtALTERA                                             :: 5856;
    ArbitraryFloatRSqrtINTEL                                              :: 5856;
    ArbitraryFloatCbrtALTERA                                              :: 5857;
    ArbitraryFloatCbrtINTEL                                               :: 5857;
    ArbitraryFloatHypotALTERA                                             :: 5858;
    ArbitraryFloatHypotINTEL                                              :: 5858;
    ArbitraryFloatSqrtALTERA                                              :: 5859;
    ArbitraryFloatSqrtINTEL                                               :: 5859;
    ArbitraryFloatLogINTEL                                                :: 5860;
    ArbitraryFloatLog2INTEL                                               :: 5861;
    ArbitraryFloatLog10INTEL                                              :: 5862;
    ArbitraryFloatLog1pINTEL                                              :: 5863;
    ArbitraryFloatExpINTEL                                                :: 5864;
    ArbitraryFloatExp2INTEL                                               :: 5865;
    ArbitraryFloatExp10INTEL                                              :: 5866;
    ArbitraryFloatExpm1INTEL                                              :: 5867;
    ArbitraryFloatSinINTEL                                                :: 5868;
    ArbitraryFloatCosINTEL                                                :: 5869;
    ArbitraryFloatSinCosINTEL                                             :: 5870;
    ArbitraryFloatSinPiINTEL                                              :: 5871;
    ArbitraryFloatCosPiINTEL                                              :: 5872;
    ArbitraryFloatASinINTEL                                               :: 5873;
    ArbitraryFloatASinPiINTEL                                             :: 5874;
    ArbitraryFloatACosINTEL                                               :: 5875;
    ArbitraryFloatACosPiINTEL                                             :: 5876;
    ArbitraryFloatATanINTEL                                               :: 5877;
    ArbitraryFloatATanPiINTEL                                             :: 5878;
    ArbitraryFloatATan2INTEL                                              :: 5879;
    ArbitraryFloatPowINTEL                                                :: 5880;
    ArbitraryFloatPowRINTEL                                               :: 5881;
    ArbitraryFloatPowNINTEL                                               :: 5882;
    LoopControlINTEL                                                      :: 5887;
    AliasDomainDeclINTEL                                                  :: 5911;
    AliasScopeDeclINTEL                                                   :: 5912;
    AliasScopeListDeclINTEL                                               :: 5913;
    FixedSqrtALTERA                                                       :: 5923;
    FixedSqrtINTEL                                                        :: 5923;
    FixedRecipALTERA                                                      :: 5924;
    FixedRecipINTEL                                                       :: 5924;
    FixedRsqrtALTERA                                                      :: 5925;
    FixedRsqrtINTEL                                                       :: 5925;
    FixedSinALTERA                                                        :: 5926;
    FixedSinINTEL                                                         :: 5926;
    FixedCosALTERA                                                        :: 5927;
    FixedCosINTEL                                                         :: 5927;
    FixedSinCosALTERA                                                     :: 5928;
    FixedSinCosINTEL                                                      :: 5928;
    FixedSinPiALTERA                                                      :: 5929;
    FixedSinPiINTEL                                                       :: 5929;
    FixedCosPiALTERA                                                      :: 5930;
    FixedCosPiINTEL                                                       :: 5930;
    FixedSinCosPiALTERA                                                   :: 5931;
    FixedSinCosPiINTEL                                                    :: 5931;
    FixedLogALTERA                                                        :: 5932;
    FixedLogINTEL                                                         :: 5932;
    FixedExpALTERA                                                        :: 5933;
    FixedExpINTEL                                                         :: 5933;
    PtrCastToCrossWorkgroupALTERA                                         :: 5934;
    PtrCastToCrossWorkgroupINTEL                                          :: 5934;
    CrossWorkgroupCastToPtrALTERA                                         :: 5938;
    CrossWorkgroupCastToPtrINTEL                                          :: 5938;
    ReadPipeBlockingALTERA                                                :: 5946;
    ReadPipeBlockingINTEL                                                 :: 5946;
    WritePipeBlockingALTERA                                               :: 5947;
    WritePipeBlockingINTEL                                                :: 5947;
    FPGARegALTERA                                                         :: 5949;
    FPGARegINTEL                                                          :: 5949;
    RayQueryGetRayTMinKHR                                                 :: 6016;
    RayQueryGetRayFlagsKHR                                                :: 6017;
    RayQueryGetIntersectionTKHR                                           :: 6018;
    RayQueryGetIntersectionInstanceCustomIndexKHR                         :: 6019;
    RayQueryGetIntersectionInstanceIdKHR                                  :: 6020;
    RayQueryGetIntersectionInstanceShaderBindingTableRecordOffsetKHR      :: 6021;
    RayQueryGetIntersectionGeometryIndexKHR                               :: 6022;
    RayQueryGetIntersectionPrimitiveIndexKHR                              :: 6023;
    RayQueryGetIntersectionBarycentricsKHR                                :: 6024;
    RayQueryGetIntersectionFrontFaceKHR                                   :: 6025;
    RayQueryGetIntersectionCandidateAABBOpaqueKHR                         :: 6026;
    RayQueryGetIntersectionObjectRayDirectionKHR                          :: 6027;
    RayQueryGetIntersectionObjectRayOriginKHR                             :: 6028;
    RayQueryGetWorldRayDirectionKHR                                       :: 6029;
    RayQueryGetWorldRayOriginKHR                                          :: 6030;
    RayQueryGetIntersectionObjectToWorldKHR                               :: 6031;
    RayQueryGetIntersectionWorldToObjectKHR                               :: 6032;
    AtomicFAddEXT                                                         :: 6035;
    TypeBufferSurfaceINTEL                                                :: 6086;
    TypeStructContinuedINTEL                                              :: 6090;
    ConstantCompositeContinuedINTEL                                       :: 6091;
    SpecConstantCompositeContinuedINTEL                                   :: 6092;
    CompositeConstructContinuedINTEL                                      :: 6096;
    ConvertFToBF16INTEL                                                   :: 6116;
    ConvertBF16ToFINTEL                                                   :: 6117;
    ControlBarrierArriveINTEL                                             :: 6142;
    ControlBarrierWaitINTEL                                               :: 6143;
    ArithmeticFenceEXT                                                    :: 6145;
    TaskSequenceCreateALTERA                                              :: 6163;
    TaskSequenceCreateINTEL                                               :: 6163;
    TaskSequenceAsyncALTERA                                               :: 6164;
    TaskSequenceAsyncINTEL                                                :: 6164;
    TaskSequenceGetALTERA                                                 :: 6165;
    TaskSequenceGetINTEL                                                  :: 6165;
    TaskSequenceReleaseALTERA                                             :: 6166;
    TaskSequenceReleaseINTEL                                              :: 6166;
    TypeTaskSequenceALTERA                                                :: 6199;
    TypeTaskSequenceINTEL                                                 :: 6199;
    SubgroupBlockPrefetchINTEL                                            :: 6221;
    Subgroup2DBlockLoadINTEL                                              :: 6231;
    Subgroup2DBlockLoadTransformINTEL                                     :: 6232;
    Subgroup2DBlockLoadTransposeINTEL                                     :: 6233;
    Subgroup2DBlockPrefetchINTEL                                          :: 6234;
    Subgroup2DBlockStoreINTEL                                             :: 6235;
    SubgroupMatrixMultiplyAccumulateINTEL                                 :: 6237;
    BitwiseFunctionINTEL                                                  :: 6242;
    UntypedVariableLengthArrayINTEL                                       :: 6244;
    ConditionalExtensionINTEL                                             :: 6248;
    ConditionalEntryPointINTEL                                            :: 6249;
    ConditionalCapabilityINTEL                                            :: 6250;
    SpecConstantTargetINTEL                                               :: 6251;
    SpecConstantArchitectureINTEL                                         :: 6252;
    SpecConstantCapabilitiesINTEL                                         :: 6253;
    ConditionalCopyObjectINTEL                                            :: 6254;
    GroupIMulKHR                                                          :: 6401;
    GroupFMulKHR                                                          :: 6402;
    GroupBitwiseAndKHR                                                    :: 6403;
    GroupBitwiseOrKHR                                                     :: 6404;
    GroupBitwiseXorKHR                                                    :: 6405;
    GroupLogicalAndKHR                                                    :: 6406;
    GroupLogicalOrKHR                                                     :: 6407;
    GroupLogicalXorKHR                                                    :: 6408;
    RoundFToTF32INTEL                                                     :: 6426;
    MaskedGatherINTEL                                                     :: 6428;
    MaskedScatterINTEL                                                    :: 6429;
    ConvertHandleToImageINTEL                                             :: 6529;
    ConvertHandleToSamplerINTEL                                           :: 6530;
    ConvertHandleToSampledImageINTEL                                      :: 6531;
    FDot2MixAcc32VALVE                                                    :: 6916;
    FDot2MixAcc16VALVE                                                    :: 6917;
    FDot4MixAcc32VALVE                                                    :: 6918;
    Max                                                                   :: 2147483647;
}

SpvOp :: SpvOp_;

/*
* Gets the SPVC_C_API_VERSION_* used to build this library.
* Can be used to check for ABI mismatch if so-versioning did not catch it.
*/
spvc_get_version :: (major: *u32, minor: *u32, patch: *u32) -> void #foreign libspirv_cross;

/* Gets a human readable version string to identify which commit a particular binary was created from. */
spvc_get_commit_revision_and_timestamp :: () -> *u8 #foreign libspirv_cross;

spvc_context_s :: struct {}
/* These types are opaque to the user. */
spvc_context :: *spvc_context_s;
spvc_parsed_ir_s :: struct {}
spvc_parsed_ir :: *spvc_parsed_ir_s;
spvc_compiler_s :: struct {}
spvc_compiler :: *spvc_compiler_s;
spvc_compiler_options_s :: struct {}
spvc_compiler_options :: *spvc_compiler_options_s;
spvc_resources_s :: struct {}
spvc_resources :: *spvc_resources_s;
spvc_type_s :: struct {}
spvc_type :: *spvc_type_s;
spvc_constant_s :: struct {}
spvc_constant :: *spvc_constant_s;
spvc_set_s :: struct {}
spvc_set :: *spvc_set_s;

/*
* Shallow typedefs. All SPIR-V IDs are plain 32-bit numbers, but this helps communicate which data is used.
* Maps to a SPIRType.
*/
spvc_type_id :: SpvId;

/* Maps to a SPIRVariable. */
spvc_variable_id :: SpvId;

/* Maps to a SPIRConstant. */
spvc_constant_id :: SpvId;

/* See C++ API. */
spvc_reflected_resource :: struct {
    id:           spvc_variable_id;
    base_type_id: spvc_type_id;
    type_id:      spvc_type_id;
    name:         *u8;
}

spvc_reflected_builtin_resource :: struct {
    builtin:       SpvBuiltIn;
    value_type_id: spvc_type_id;
    resource:      spvc_reflected_resource;
}

/* See C++ API. */
spvc_entry_point :: struct {
    execution_model: SpvExecutionModel;
    name:            *u8;
}

/* See C++ API. */
spvc_combined_image_sampler :: struct {
    combined_id: spvc_variable_id;
    image_id:    spvc_variable_id;
    sampler_id:  spvc_variable_id;
}

/* See C++ API. */
spvc_specialization_constant :: struct {
    id:          spvc_constant_id;
    constant_id: u32;
}

/* See C++ API. */
spvc_buffer_range :: struct {
    index:  u32;
    offset: u64;
    range:  u64;
}

/* See C++ API. */
spvc_hlsl_root_constants :: struct {
    start:   u32;
    end:     u32;
    binding: u32;
    space:   u32;
}

/* See C++ API. */
spvc_hlsl_vertex_attribute_remap :: struct {
    location: u32;
    semantic: *u8;
}

/*
* Be compatible with non-C99 compilers, which do not have stdbool.
* Only recent MSVC compilers supports this for example, and ideally SPIRV-Cross should be linkable
* from a wide range of compilers in its C wrapper.
*/
spvc_bool :: u8;

spvc_result :: enum s32 {
    SUCCESS                 :: 0;
    ERROR_INVALID_SPIRV     :: -1;
    ERROR_UNSUPPORTED_SPIRV :: -2;
    ERROR_OUT_OF_MEMORY     :: -3;
    ERROR_INVALID_ARGUMENT  :: -4;
    ERROR_INT_MAX           :: 2147483647;
}

spvc_capture_mode :: enum u32 {
    COPY           :: 0;
    TAKE_OWNERSHIP :: 1;
    INT_MAX        :: 2147483647;
}

spvc_backend :: enum u32 {
    NONE    :: 0;
    GLSL    :: 1;
    HLSL    :: 2;
    MSL     :: 3;
    CPP     :: 4;
    JSON    :: 5;
    INT_MAX :: 2147483647;
}

/* Maps to C++ API. */
spvc_resource_type :: enum u32 {
    UNKNOWN                :: 0;
    UNIFORM_BUFFER         :: 1;
    STORAGE_BUFFER         :: 2;
    STAGE_INPUT            :: 3;
    STAGE_OUTPUT           :: 4;
    SUBPASS_INPUT          :: 5;
    STORAGE_IMAGE          :: 6;
    SAMPLED_IMAGE          :: 7;
    ATOMIC_COUNTER         :: 8;
    PUSH_CONSTANT          :: 9;
    SEPARATE_IMAGE         :: 10;
    SEPARATE_SAMPLERS      :: 11;
    ACCELERATION_STRUCTURE :: 12;
    RAY_QUERY              :: 13;
    SHADER_RECORD_BUFFER   :: 14;
    GL_PLAIN_UNIFORM       :: 15;
    TENSOR                 :: 16;
    INT_MAX                :: 2147483647;
}

spvc_builtin_resource_type :: enum u32 {
    UNKNOWN      :: 0;
    STAGE_INPUT  :: 1;
    STAGE_OUTPUT :: 2;
    INT_MAX      :: 2147483647;
}

/* Maps to spirv_cross::SPIRType::BaseType. */
spvc_basetype :: enum u32 {
    UNKNOWN                :: 0;
    VOID                   :: 1;
    BOOLEAN                :: 2;
    INT8                   :: 3;
    UINT8                  :: 4;
    INT16                  :: 5;
    UINT16                 :: 6;
    INT32                  :: 7;
    UINT32                 :: 8;
    INT64                  :: 9;
    UINT64                 :: 10;
    ATOMIC_COUNTER         :: 11;
    FP16                   :: 12;
    FP32                   :: 13;
    FP64                   :: 14;
    STRUCT                 :: 15;
    IMAGE                  :: 16;
    SAMPLED_IMAGE          :: 17;
    SAMPLER                :: 18;
    ACCELERATION_STRUCTURE :: 19;
    INT_MAX                :: 2147483647;
}

/* Maps to C++ API. */
spvc_msl_platform :: enum u32 {
    IOS     :: 0;
    MACOS   :: 1;
    MAX_INT :: 2147483647;
}

/* Maps to C++ API. */
spvc_msl_index_type :: enum u32 {
    NONE    :: 0;
    UINT16  :: 1;
    UINT32  :: 2;
    MAX_INT :: 2147483647;
}

/* Maps to C++ API. */
spvc_msl_shader_variable_format :: enum u32 {
    SHADER_VARIABLE_FORMAT_OTHER  :: 0;
    SHADER_VARIABLE_FORMAT_UINT8  :: 1;
    SHADER_VARIABLE_FORMAT_UINT16 :: 2;
    SHADER_VARIABLE_FORMAT_ANY16  :: 3;
    SHADER_VARIABLE_FORMAT_ANY32  :: 4;
    VERTEX_FORMAT_OTHER           :: 0;
    VERTEX_FORMAT_UINT8           :: 1;
    VERTEX_FORMAT_UINT16          :: 2;
    SHADER_INPUT_FORMAT_OTHER     :: 0;
    SHADER_INPUT_FORMAT_UINT8     :: 1;
    SHADER_INPUT_FORMAT_UINT16    :: 2;
    SHADER_INPUT_FORMAT_ANY16     :: 3;
    SHADER_INPUT_FORMAT_ANY32     :: 4;
    SHADER_INPUT_FORMAT_INT_MAX   :: 2147483647;
}

/* Maps to C++ API. */
spvc_msl_shader_input_format :: spvc_msl_shader_variable_format;
/* Maps to C++ API. */
spvc_msl_vertex_format :: spvc_msl_shader_variable_format;

/* Maps to C++ API. Deprecated; use spvc_msl_shader_interface_var. */
spvc_msl_vertex_attribute :: struct {
    location:     u32;
    /* Obsolete, do not use. Only lingers on for ABI compatibility. */
    msl_buffer:   u32;
    /* Obsolete, do not use. Only lingers on for ABI compatibility. */
    msl_offset:   u32;
    /* Obsolete, do not use. Only lingers on for ABI compatibility. */
    msl_stride:   u32;
    /* Obsolete, do not use. Only lingers on for ABI compatibility. */
    per_instance: spvc_bool;
    format:       spvc_msl_vertex_format;
    builtin:      SpvBuiltIn;
}

/*
* Initializes the vertex attribute struct.
*/
spvc_msl_vertex_attribute_init :: (attr: *spvc_msl_vertex_attribute) -> void #foreign libspirv_cross;

/* Maps to C++ API. Deprecated; use spvc_msl_shader_interface_var_2. */
spvc_msl_shader_interface_var :: struct {
    location: u32;
    format:   spvc_msl_vertex_format;
    builtin:  SpvBuiltIn;
    vecsize:  u32;
}

/* Maps to C++ API. Deprecated; use spvc_msl_shader_interface_var_2. */
spvc_msl_shader_input :: spvc_msl_shader_interface_var;

/*
* Initializes the shader input struct.
* Deprecated. Use spvc_msl_shader_interface_var_init_2().
*/
spvc_msl_shader_interface_var_init :: (var: *spvc_msl_shader_interface_var) -> void #foreign libspirv_cross;

/*
* Deprecated. Use spvc_msl_shader_interface_var_init_2().
*/
spvc_msl_shader_input_init :: (input: *spvc_msl_shader_input) -> void #foreign libspirv_cross;

/* Maps to C++ API. */
spvc_msl_shader_variable_rate :: enum u32 {
    PER_VERTEX    :: 0;
    PER_PRIMITIVE :: 1;
    PER_PATCH     :: 2;
    INT_MAX       :: 2147483647;
}

/* Maps to C++ API. */
spvc_msl_shader_interface_var_2 :: struct {
    location: u32;
    format:   spvc_msl_shader_variable_format;
    builtin:  SpvBuiltIn;
    vecsize:  u32;
    rate:     spvc_msl_shader_variable_rate;
}

/*
* Initializes the shader interface variable struct.
*/
spvc_msl_shader_interface_var_init_2 :: (var: *spvc_msl_shader_interface_var_2) -> void #foreign libspirv_cross;

/* Maps to C++ API.
* Deprecated. Use spvc_msl_resource_binding_2. */
spvc_msl_resource_binding :: struct {
    stage:       SpvExecutionModel;
    desc_set:    u32;
    binding:     u32;
    msl_buffer:  u32;
    msl_texture: u32;
    msl_sampler: u32;
}

spvc_msl_resource_binding_2 :: struct {
    stage:       SpvExecutionModel;
    desc_set:    u32;
    binding:     u32;
    count:       u32;
    msl_buffer:  u32;
    msl_texture: u32;
    msl_sampler: u32;
}

/*
* Initializes the resource binding struct.
* The defaults are non-zero.
* Deprecated: Use spvc_msl_resource_binding_init_2.
*/
spvc_msl_resource_binding_init :: (binding: *spvc_msl_resource_binding) -> void #foreign libspirv_cross;
spvc_msl_resource_binding_init_2 :: (binding: *spvc_msl_resource_binding_2) -> void #foreign libspirv_cross;

/* Runtime check for incompatibility. Obsolete. */
spvc_msl_get_aux_buffer_struct_version :: () -> u32 #foreign libspirv_cross;

/* Maps to C++ API. */
spvc_msl_sampler_coord :: enum u32 {
    COORD_NORMALIZED :: 0;
    COORD_PIXEL      :: 1;
    INT_MAX          :: 2147483647;
}

/* Maps to C++ API. */
spvc_msl_sampler_filter :: enum u32 {
    NEAREST :: 0;
    LINEAR  :: 1;
    INT_MAX :: 2147483647;
}

/* Maps to C++ API. */
spvc_msl_sampler_mip_filter :: enum u32 {
    NONE    :: 0;
    NEAREST :: 1;
    LINEAR  :: 2;
    INT_MAX :: 2147483647;
}

/* Maps to C++ API. */
spvc_msl_sampler_address :: enum u32 {
    CLAMP_TO_ZERO   :: 0;
    CLAMP_TO_EDGE   :: 1;
    CLAMP_TO_BORDER :: 2;
    REPEAT          :: 3;
    MIRRORED_REPEAT :: 4;
    INT_MAX         :: 2147483647;
}

/* Maps to C++ API. */
spvc_msl_sampler_compare_func :: enum u32 {
    NEVER         :: 0;
    LESS          :: 1;
    LESS_EQUAL    :: 2;
    GREATER       :: 3;
    GREATER_EQUAL :: 4;
    EQUAL         :: 5;
    NOT_EQUAL     :: 6;
    ALWAYS        :: 7;
    INT_MAX       :: 2147483647;
}

/* Maps to C++ API. */
spvc_msl_sampler_border_color :: enum u32 {
    TRANSPARENT_BLACK :: 0;
    OPAQUE_BLACK      :: 1;
    OPAQUE_WHITE      :: 2;
    INT_MAX           :: 2147483647;
}

/* Maps to C++ API. */
spvc_msl_format_resolution :: enum u32 {
    _444    :: 0;
    _422    :: 1;
    _420    :: 2;
    INT_MAX :: 2147483647;
}

/* Maps to C++ API. */
spvc_msl_chroma_location :: enum u32 {
    COSITED_EVEN :: 0;
    MIDPOINT     :: 1;
    INT_MAX      :: 2147483647;
}

/* Maps to C++ API. */
spvc_msl_component_swizzle :: enum u32 {
    IDENTITY :: 0;
    ZERO     :: 1;
    ONE      :: 2;
    R        :: 3;
    G        :: 4;
    B        :: 5;
    A        :: 6;
    INT_MAX  :: 2147483647;
}

/* Maps to C++ API. */
spvc_msl_sampler_ycbcr_model_conversion :: enum u32 {
    RGB_IDENTITY   :: 0;
    YCBCR_IDENTITY :: 1;
    YCBCR_BT_709   :: 2;
    YCBCR_BT_601   :: 3;
    YCBCR_BT_2020  :: 4;
    INT_MAX        :: 2147483647;
}

/* Maps to C+ API. */
spvc_msl_sampler_ycbcr_range :: enum u32 {
    ITU_FULL   :: 0;
    ITU_NARROW :: 1;
    INT_MAX    :: 2147483647;
}

/* Maps to C++ API. */
spvc_msl_constexpr_sampler :: struct {
    coord:             spvc_msl_sampler_coord;
    min_filter:        spvc_msl_sampler_filter;
    mag_filter:        spvc_msl_sampler_filter;
    mip_filter:        spvc_msl_sampler_mip_filter;
    s_address:         spvc_msl_sampler_address;
    t_address:         spvc_msl_sampler_address;
    r_address:         spvc_msl_sampler_address;
    compare_func:      spvc_msl_sampler_compare_func;
    border_color:      spvc_msl_sampler_border_color;
    lod_clamp_min:     float;
    lod_clamp_max:     float;
    max_anisotropy:    s32;
    compare_enable:    spvc_bool;
    lod_clamp_enable:  spvc_bool;
    anisotropy_enable: spvc_bool;
}

/*
* Initializes the constexpr sampler struct.
* The defaults are non-zero.
*/
spvc_msl_constexpr_sampler_init :: (sampler: *spvc_msl_constexpr_sampler) -> void #foreign libspirv_cross;

/* Maps to the sampler Y'CbCr conversion-related portions of MSLConstexprSampler. See C++ API for defaults and details. */
spvc_msl_sampler_ycbcr_conversion :: struct {
    planes:          u32;
    resolution:      spvc_msl_format_resolution;
    chroma_filter:   spvc_msl_sampler_filter;
    x_chroma_offset: spvc_msl_chroma_location;
    y_chroma_offset: spvc_msl_chroma_location;
    swizzle:         [4] spvc_msl_component_swizzle;
    ycbcr_model:     spvc_msl_sampler_ycbcr_model_conversion;
    ycbcr_range:     spvc_msl_sampler_ycbcr_range;
    bpc:             u32;
}

/*
* Initializes the constexpr sampler struct.
* The defaults are non-zero.
*/
spvc_msl_sampler_ycbcr_conversion_init :: (conv: *spvc_msl_sampler_ycbcr_conversion) -> void #foreign libspirv_cross;

/* Maps to C++ API. */
spvc_hlsl_binding_flag_bits :: enum u32 {
    NONE_BIT          :: 0;
    PUSH_CONSTANT_BIT :: 1;
    CBV_BIT           :: 2;
    SRV_BIT           :: 4;
    UAV_BIT           :: 8;
    SAMPLER_BIT       :: 16;
    ALL               :: 2147483647;
}

spvc_hlsl_binding_flags :: u32;

/* Maps to C++ API. */
spvc_hlsl_resource_binding_mapping :: struct {
    register_space:   u32;
    register_binding: u32;
}

spvc_hlsl_resource_binding :: struct {
    stage:    SpvExecutionModel;
    desc_set: u32;
    binding:  u32;
    cbv:      spvc_hlsl_resource_binding_mapping;
    uav:      spvc_hlsl_resource_binding_mapping;
    srv:      spvc_hlsl_resource_binding_mapping;
    sampler:  spvc_hlsl_resource_binding_mapping;
}

/*
* Initializes the resource binding struct.
* The defaults are non-zero.
*/
spvc_hlsl_resource_binding_init :: (binding: *spvc_hlsl_resource_binding) -> void #foreign libspirv_cross;

/* Maps to the various spirv_cross::Compiler*::Option structures. See C++ API for defaults and details. */
spvc_compiler_option :: enum u32 {
    UNKNOWN                                        :: 0;
    FORCE_TEMPORARY                                :: 16777217;
    FLATTEN_MULTIDIMENSIONAL_ARRAYS                :: 16777218;
    FIXUP_DEPTH_CONVENTION                         :: 16777219;
    FLIP_VERTEX_Y                                  :: 16777220;
    GLSL_SUPPORT_NONZERO_BASE_INSTANCE             :: 33554437;
    GLSL_SEPARATE_SHADER_OBJECTS                   :: 33554438;
    GLSL_ENABLE_420PACK_EXTENSION                  :: 33554439;
    GLSL_VERSION                                   :: 33554440;
    GLSL_ES                                        :: 33554441;
    GLSL_VULKAN_SEMANTICS                          :: 33554442;
    GLSL_ES_DEFAULT_FLOAT_PRECISION_HIGHP          :: 33554443;
    GLSL_ES_DEFAULT_INT_PRECISION_HIGHP            :: 33554444;
    HLSL_SHADER_MODEL                              :: 67108877;
    HLSL_POINT_SIZE_COMPAT                         :: 67108878;
    HLSL_POINT_COORD_COMPAT                        :: 67108879;
    HLSL_SUPPORT_NONZERO_BASE_VERTEX_BASE_INSTANCE :: 67108880;
    MSL_VERSION                                    :: 134217745;
    MSL_TEXEL_BUFFER_TEXTURE_WIDTH                 :: 134217746;
    MSL_AUX_BUFFER_INDEX                           :: 134217747;
    MSL_SWIZZLE_BUFFER_INDEX                       :: 134217747;
    MSL_INDIRECT_PARAMS_BUFFER_INDEX               :: 134217748;
    MSL_SHADER_OUTPUT_BUFFER_INDEX                 :: 134217749;
    MSL_SHADER_PATCH_OUTPUT_BUFFER_INDEX           :: 134217750;
    MSL_SHADER_TESS_FACTOR_OUTPUT_BUFFER_INDEX     :: 134217751;
    MSL_SHADER_INPUT_WORKGROUP_INDEX               :: 134217752;
    MSL_ENABLE_POINT_SIZE_BUILTIN                  :: 134217753;
    MSL_DISABLE_RASTERIZATION                      :: 134217754;
    MSL_CAPTURE_OUTPUT_TO_BUFFER                   :: 134217755;
    MSL_SWIZZLE_TEXTURE_SAMPLES                    :: 134217756;
    MSL_PAD_FRAGMENT_OUTPUT_COMPONENTS             :: 134217757;
    MSL_TESS_DOMAIN_ORIGIN_LOWER_LEFT              :: 134217758;
    MSL_PLATFORM                                   :: 134217759;
    MSL_ARGUMENT_BUFFERS                           :: 134217760;
    GLSL_EMIT_PUSH_CONSTANT_AS_UNIFORM_BUFFER      :: 33554465;
    MSL_TEXTURE_BUFFER_NATIVE                      :: 134217762;
    GLSL_EMIT_UNIFORM_BUFFER_AS_PLAIN_UNIFORMS     :: 33554467;
    MSL_BUFFER_SIZE_BUFFER_INDEX                   :: 134217764;
    EMIT_LINE_DIRECTIVES                           :: 16777253;
    MSL_MULTIVIEW                                  :: 134217766;
    MSL_VIEW_MASK_BUFFER_INDEX                     :: 134217767;
    MSL_DEVICE_INDEX                               :: 134217768;
    MSL_VIEW_INDEX_FROM_DEVICE_INDEX               :: 134217769;
    MSL_DISPATCH_BASE                              :: 134217770;
    MSL_DYNAMIC_OFFSETS_BUFFER_INDEX               :: 134217771;
    MSL_TEXTURE_1D_AS_2D                           :: 134217772;
    MSL_ENABLE_BASE_INDEX_ZERO                     :: 134217773;
    MSL_IOS_FRAMEBUFFER_FETCH_SUBPASS              :: 134217774;
    MSL_FRAMEBUFFER_FETCH_SUBPASS                  :: 134217774;
    MSL_INVARIANT_FP_MATH                          :: 134217775;
    MSL_EMULATE_CUBEMAP_ARRAY                      :: 134217776;
    MSL_ENABLE_DECORATION_BINDING                  :: 134217777;
    MSL_FORCE_ACTIVE_ARGUMENT_BUFFER_RESOURCES     :: 134217778;
    MSL_FORCE_NATIVE_ARRAYS                        :: 134217779;
    ENABLE_STORAGE_IMAGE_QUALIFIER_DEDUCTION       :: 16777268;
    HLSL_FORCE_STORAGE_BUFFER_AS_UAV               :: 67108917;
    FORCE_ZERO_INITIALIZED_VARIABLES               :: 16777270;
    HLSL_NONWRITABLE_UAV_TEXTURE_AS_SRV            :: 67108919;
    MSL_ENABLE_FRAG_OUTPUT_MASK                    :: 134217784;
    MSL_ENABLE_FRAG_DEPTH_BUILTIN                  :: 134217785;
    MSL_ENABLE_FRAG_STENCIL_REF_BUILTIN            :: 134217786;
    MSL_ENABLE_CLIP_DISTANCE_USER_VARYING          :: 134217787;
    HLSL_ENABLE_16BIT_TYPES                        :: 67108924;
    MSL_MULTI_PATCH_WORKGROUP                      :: 134217789;
    MSL_SHADER_INPUT_BUFFER_INDEX                  :: 134217790;
    MSL_SHADER_INDEX_BUFFER_INDEX                  :: 134217791;
    MSL_VERTEX_FOR_TESSELLATION                    :: 134217792;
    MSL_VERTEX_INDEX_TYPE                          :: 134217793;
    GLSL_FORCE_FLATTENED_IO_BLOCKS                 :: 33554498;
    MSL_MULTIVIEW_LAYERED_RENDERING                :: 134217795;
    MSL_ARRAYED_SUBPASS_INPUT                      :: 134217796;
    MSL_R32UI_LINEAR_TEXTURE_ALIGNMENT             :: 134217797;
    MSL_R32UI_ALIGNMENT_CONSTANT_ID                :: 134217798;
    HLSL_FLATTEN_MATRIX_VERTEX_INPUT_SEMANTICS     :: 67108935;
    MSL_IOS_USE_SIMDGROUP_FUNCTIONS                :: 134217800;
    MSL_EMULATE_SUBGROUPS                          :: 134217801;
    MSL_FIXED_SUBGROUP_SIZE                        :: 134217802;
    MSL_FORCE_SAMPLE_RATE_SHADING                  :: 134217803;
    MSL_IOS_SUPPORT_BASE_VERTEX_INSTANCE           :: 134217804;
    GLSL_OVR_MULTIVIEW_VIEW_COUNT                  :: 33554509;
    RELAX_NAN_CHECKS                               :: 16777294;
    MSL_RAW_BUFFER_TESE_INPUT                      :: 134217807;
    MSL_SHADER_PATCH_INPUT_BUFFER_INDEX            :: 134217808;
    MSL_MANUAL_HELPER_INVOCATION_UPDATES           :: 134217809;
    MSL_CHECK_DISCARDED_FRAG_STORES                :: 134217810;
    GLSL_ENABLE_ROW_MAJOR_LOAD_WORKAROUND          :: 33554515;
    MSL_ARGUMENT_BUFFERS_TIER                      :: 134217812;
    MSL_SAMPLE_DREF_LOD_ARRAY_AS_GRAD              :: 134217813;
    MSL_READWRITE_TEXTURE_FENCES                   :: 134217814;
    MSL_REPLACE_RECURSIVE_INPUTS                   :: 134217815;
    MSL_AGX_MANUAL_CUBE_GRAD_FIXUP                 :: 134217816;
    MSL_FORCE_FRAGMENT_WITH_SIDE_EFFECTS_EXECUTION :: 134217817;
    HLSL_USE_ENTRY_POINT_NAME                      :: 67108954;
    HLSL_PRESERVE_STRUCTURED_BUFFERS               :: 67108955;
    MSL_AUTO_DISABLE_RASTERIZATION                 :: 134217820;
    MSL_ENABLE_POINT_SIZE_DEFAULT                  :: 134217821;
    HLSL_USER_SEMANTIC                             :: 67108958;
    INT_MAX                                        :: 2147483647;
}

/*
* Context is the highest-level API construct.
* The context owns all memory allocations made by its child object hierarchy, including various non-opaque structs and strings.
* This means that the API user only has to care about one "destroy" call ever when using the C API.
* All pointers handed out by the APIs are only valid as long as the context
* is alive and spvc_context_release_allocations has not been called.
*/
spvc_context_create :: (_context: *spvc_context) -> spvc_result #foreign libspirv_cross;

/* Frees all memory allocations and objects associated with the context and its child objects. */
spvc_context_destroy :: (_context: spvc_context) -> void #foreign libspirv_cross;

/* Frees all memory allocations and objects associated with the context and its child objects, but keeps the context alive. */
spvc_context_release_allocations :: (_context: spvc_context) -> void #foreign libspirv_cross;

/* Get the string for the last error which was logged. */
spvc_context_get_last_error_string :: (_context: spvc_context) -> *u8 #foreign libspirv_cross;

/* Get notified in a callback when an error triggers. Useful for debugging. */
spvc_error_callback :: #type (userdata: *void, error: *u8) -> void #c_call;
spvc_context_set_error_callback :: (_context: spvc_context, cb: spvc_error_callback, userdata: *void) -> void #foreign libspirv_cross;

/* SPIR-V parsing interface. Maps to Parser which then creates a ParsedIR, and that IR is extracted into the handle. */
spvc_context_parse_spirv :: (_context: spvc_context, spirv: *SpvId, word_count: u64, parsed_ir: *spvc_parsed_ir) -> spvc_result #foreign libspirv_cross;

/*
* Create a compiler backend. Capture mode controls if we construct by copy or move semantics.
* It is always recommended to use SPVC_CAPTURE_MODE_TAKE_OWNERSHIP if you only intend to cross-compile the IR once.
*/
spvc_context_create_compiler :: (_context: spvc_context, backend: spvc_backend, parsed_ir: spvc_parsed_ir, mode: spvc_capture_mode, compiler: *spvc_compiler) -> spvc_result #foreign libspirv_cross;

/* Maps directly to C++ API. */
spvc_compiler_get_current_id_bound :: (compiler: spvc_compiler) -> u32 #foreign libspirv_cross;

/* Create compiler options, which will initialize defaults. */
spvc_compiler_create_compiler_options :: (compiler: spvc_compiler, options: *spvc_compiler_options) -> spvc_result #foreign libspirv_cross;

/* Override options. Will return error if e.g. MSL options are used for the HLSL backend, etc. */
spvc_compiler_options_set_bool :: (options: spvc_compiler_options, option: spvc_compiler_option, value: spvc_bool) -> spvc_result #foreign libspirv_cross;

spvc_compiler_options_set_uint :: (options: spvc_compiler_options, option: spvc_compiler_option, value: u32) -> spvc_result #foreign libspirv_cross;

/* Set compiler options. */
spvc_compiler_install_compiler_options :: (compiler: spvc_compiler, options: spvc_compiler_options) -> spvc_result #foreign libspirv_cross;

/* Compile IR into a string. *source is owned by the context, and caller must not free it themselves. */
spvc_compiler_compile :: (compiler: spvc_compiler, source: **u8) -> spvc_result #foreign libspirv_cross;

/* Maps to C++ API. */
spvc_compiler_add_header_line :: (compiler: spvc_compiler, line: *u8) -> spvc_result #foreign libspirv_cross;
spvc_compiler_require_extension :: (compiler: spvc_compiler, ext: *u8) -> spvc_result #foreign libspirv_cross;
spvc_compiler_get_num_required_extensions :: (compiler: spvc_compiler) -> u64 #foreign libspirv_cross;
spvc_compiler_get_required_extension :: (compiler: spvc_compiler, index: u64) -> *u8 #foreign libspirv_cross;
spvc_compiler_flatten_buffer_block :: (compiler: spvc_compiler, id: spvc_variable_id) -> spvc_result #foreign libspirv_cross;

spvc_compiler_variable_is_depth_or_compare :: (compiler: spvc_compiler, id: spvc_variable_id) -> spvc_bool #foreign libspirv_cross;

spvc_compiler_mask_stage_output_by_location :: (compiler: spvc_compiler, location: u32, component: u32) -> spvc_result #foreign libspirv_cross;

spvc_compiler_mask_stage_output_by_builtin :: (compiler: spvc_compiler, builtin: SpvBuiltIn) -> spvc_result #foreign libspirv_cross;

/*
* HLSL specifics.
* Maps to C++ API.
*/
spvc_compiler_hlsl_set_root_constants_layout :: (compiler: spvc_compiler, constant_info: *spvc_hlsl_root_constants, count: u64) -> spvc_result #foreign libspirv_cross;

spvc_compiler_hlsl_add_vertex_attribute_remap :: (compiler: spvc_compiler, remap: *spvc_hlsl_vertex_attribute_remap, remaps: u64) -> spvc_result #foreign libspirv_cross;

spvc_compiler_hlsl_remap_num_workgroups_builtin :: (compiler: spvc_compiler) -> spvc_variable_id #foreign libspirv_cross;

spvc_compiler_hlsl_set_resource_binding_flags :: (compiler: spvc_compiler, flags: spvc_hlsl_binding_flags) -> spvc_result #foreign libspirv_cross;

spvc_compiler_hlsl_add_resource_binding :: (compiler: spvc_compiler, binding: *spvc_hlsl_resource_binding) -> spvc_result #foreign libspirv_cross;

spvc_compiler_hlsl_is_resource_used :: (compiler: spvc_compiler, model: SpvExecutionModel, set: u32, binding: u32) -> spvc_bool #foreign libspirv_cross;

/*
* MSL specifics.
* Maps to C++ API.
*/
spvc_compiler_msl_is_rasterization_disabled :: (compiler: spvc_compiler) -> spvc_bool #foreign libspirv_cross;

/* Obsolete. Renamed to needs_swizzle_buffer. */
spvc_compiler_msl_needs_aux_buffer :: (compiler: spvc_compiler) -> spvc_bool #foreign libspirv_cross;
spvc_compiler_msl_needs_swizzle_buffer :: (compiler: spvc_compiler) -> spvc_bool #foreign libspirv_cross;
spvc_compiler_msl_needs_buffer_size_buffer :: (compiler: spvc_compiler) -> spvc_bool #foreign libspirv_cross;

spvc_compiler_msl_needs_output_buffer :: (compiler: spvc_compiler) -> spvc_bool #foreign libspirv_cross;
spvc_compiler_msl_needs_patch_output_buffer :: (compiler: spvc_compiler) -> spvc_bool #foreign libspirv_cross;
spvc_compiler_msl_needs_input_threadgroup_mem :: (compiler: spvc_compiler) -> spvc_bool #foreign libspirv_cross;
spvc_compiler_msl_add_vertex_attribute :: (compiler: spvc_compiler, attrs: *spvc_msl_vertex_attribute) -> spvc_result #foreign libspirv_cross;

/* Deprecated; use spvc_compiler_msl_add_resource_binding_2(). */
spvc_compiler_msl_add_resource_binding :: (compiler: spvc_compiler, binding: *spvc_msl_resource_binding) -> spvc_result #foreign libspirv_cross;

spvc_compiler_msl_add_resource_binding_2 :: (compiler: spvc_compiler, binding: *spvc_msl_resource_binding_2) -> spvc_result #foreign libspirv_cross;

/* Deprecated; use spvc_compiler_msl_add_shader_input_2(). */
spvc_compiler_msl_add_shader_input :: (compiler: spvc_compiler, input: *spvc_msl_shader_interface_var) -> spvc_result #foreign libspirv_cross;

spvc_compiler_msl_add_shader_input_2 :: (compiler: spvc_compiler, input: *spvc_msl_shader_interface_var_2) -> spvc_result #foreign libspirv_cross;

/* Deprecated; use spvc_compiler_msl_add_shader_output_2(). */
spvc_compiler_msl_add_shader_output :: (compiler: spvc_compiler, output: *spvc_msl_shader_interface_var) -> spvc_result #foreign libspirv_cross;

spvc_compiler_msl_add_shader_output_2 :: (compiler: spvc_compiler, output: *spvc_msl_shader_interface_var_2) -> spvc_result #foreign libspirv_cross;

spvc_compiler_msl_add_discrete_descriptor_set :: (compiler: spvc_compiler, desc_set: u32) -> spvc_result #foreign libspirv_cross;
spvc_compiler_msl_set_argument_buffer_device_address_space :: (compiler: spvc_compiler, desc_set: u32, device_address: spvc_bool) -> spvc_result #foreign libspirv_cross;

/* Obsolete, use is_shader_input_used. */
spvc_compiler_msl_is_vertex_attribute_used :: (compiler: spvc_compiler, location: u32) -> spvc_bool #foreign libspirv_cross;
spvc_compiler_msl_is_shader_input_used :: (compiler: spvc_compiler, location: u32) -> spvc_bool #foreign libspirv_cross;
spvc_compiler_msl_is_shader_output_used :: (compiler: spvc_compiler, location: u32) -> spvc_bool #foreign libspirv_cross;

spvc_compiler_msl_is_resource_used :: (compiler: spvc_compiler, model: SpvExecutionModel, set: u32, binding: u32) -> spvc_bool #foreign libspirv_cross;

spvc_compiler_msl_remap_constexpr_sampler :: (compiler: spvc_compiler, id: spvc_variable_id, sampler: *spvc_msl_constexpr_sampler) -> spvc_result #foreign libspirv_cross;
spvc_compiler_msl_remap_constexpr_sampler_by_binding :: (compiler: spvc_compiler, desc_set: u32, binding: u32, sampler: *spvc_msl_constexpr_sampler) -> spvc_result #foreign libspirv_cross;
spvc_compiler_msl_remap_constexpr_sampler_ycbcr :: (compiler: spvc_compiler, id: spvc_variable_id, sampler: *spvc_msl_constexpr_sampler, conv: *spvc_msl_sampler_ycbcr_conversion) -> spvc_result #foreign libspirv_cross;
spvc_compiler_msl_remap_constexpr_sampler_by_binding_ycbcr :: (compiler: spvc_compiler, desc_set: u32, binding: u32, sampler: *spvc_msl_constexpr_sampler, conv: *spvc_msl_sampler_ycbcr_conversion) -> spvc_result #foreign libspirv_cross;
spvc_compiler_msl_set_fragment_output_components :: (compiler: spvc_compiler, location: u32, components: u32) -> spvc_result #foreign libspirv_cross;

spvc_compiler_msl_get_automatic_resource_binding :: (compiler: spvc_compiler, id: spvc_variable_id) -> u32 #foreign libspirv_cross;
spvc_compiler_msl_get_automatic_resource_binding_secondary :: (compiler: spvc_compiler, id: spvc_variable_id) -> u32 #foreign libspirv_cross;

spvc_compiler_msl_add_dynamic_buffer :: (compiler: spvc_compiler, desc_set: u32, binding: u32, index: u32) -> spvc_result #foreign libspirv_cross;

spvc_compiler_msl_add_inline_uniform_block :: (compiler: spvc_compiler, desc_set: u32, binding: u32) -> spvc_result #foreign libspirv_cross;

spvc_compiler_msl_set_combined_sampler_suffix :: (compiler: spvc_compiler, suffix: *u8) -> spvc_result #foreign libspirv_cross;
spvc_compiler_msl_get_combined_sampler_suffix :: (compiler: spvc_compiler) -> *u8 #foreign libspirv_cross;

/*
* Reflect resources.
* Maps almost 1:1 to C++ API.
*/
spvc_compiler_get_active_interface_variables :: (compiler: spvc_compiler, set: *spvc_set) -> spvc_result #foreign libspirv_cross;
spvc_compiler_set_enabled_interface_variables :: (compiler: spvc_compiler, set: spvc_set) -> spvc_result #foreign libspirv_cross;
spvc_compiler_create_shader_resources :: (compiler: spvc_compiler, resources: *spvc_resources) -> spvc_result #foreign libspirv_cross;
spvc_compiler_create_shader_resources_for_active_variables :: (compiler: spvc_compiler, resources: *spvc_resources, active: spvc_set) -> spvc_result #foreign libspirv_cross;

spvc_resources_get_resource_list_for_type :: (resources: spvc_resources, type: spvc_resource_type, resource_list: **spvc_reflected_resource, resource_size: *u64) -> spvc_result #foreign libspirv_cross;

spvc_resources_get_builtin_resource_list_for_type :: (resources: spvc_resources, type: spvc_builtin_resource_type, resource_list: **spvc_reflected_builtin_resource, resource_size: *u64) -> spvc_result #foreign libspirv_cross;

/*
* Decorations.
* Maps to C++ API.
*/
spvc_compiler_set_decoration :: (compiler: spvc_compiler, id: SpvId, decoration: SpvDecoration, argument: u32) -> void #foreign libspirv_cross;

spvc_compiler_set_decoration_string :: (compiler: spvc_compiler, id: SpvId, decoration: SpvDecoration, argument: *u8) -> void #foreign libspirv_cross;

spvc_compiler_set_name :: (compiler: spvc_compiler, id: SpvId, argument: *u8) -> void #foreign libspirv_cross;
spvc_compiler_set_member_decoration :: (compiler: spvc_compiler, id: spvc_type_id, member_index: u32, decoration: SpvDecoration, argument: u32) -> void #foreign libspirv_cross;

spvc_compiler_set_member_decoration_string :: (compiler: spvc_compiler, id: spvc_type_id, member_index: u32, decoration: SpvDecoration, argument: *u8) -> void #foreign libspirv_cross;

spvc_compiler_set_member_name :: (compiler: spvc_compiler, id: spvc_type_id, member_index: u32, argument: *u8) -> void #foreign libspirv_cross;

spvc_compiler_unset_decoration :: (compiler: spvc_compiler, id: SpvId, decoration: SpvDecoration) -> void #foreign libspirv_cross;
spvc_compiler_unset_member_decoration :: (compiler: spvc_compiler, id: spvc_type_id, member_index: u32, decoration: SpvDecoration) -> void #foreign libspirv_cross;

spvc_compiler_has_decoration :: (compiler: spvc_compiler, id: SpvId, decoration: SpvDecoration) -> spvc_bool #foreign libspirv_cross;
spvc_compiler_has_member_decoration :: (compiler: spvc_compiler, id: spvc_type_id, member_index: u32, decoration: SpvDecoration) -> spvc_bool #foreign libspirv_cross;

spvc_compiler_get_name :: (compiler: spvc_compiler, id: SpvId) -> *u8 #foreign libspirv_cross;
spvc_compiler_get_decoration :: (compiler: spvc_compiler, id: SpvId, decoration: SpvDecoration) -> u32 #foreign libspirv_cross;
spvc_compiler_get_decoration_string :: (compiler: spvc_compiler, id: SpvId, decoration: SpvDecoration) -> *u8 #foreign libspirv_cross;

spvc_compiler_get_member_decoration :: (compiler: spvc_compiler, id: spvc_type_id, member_index: u32, decoration: SpvDecoration) -> u32 #foreign libspirv_cross;

spvc_compiler_get_member_decoration_string :: (compiler: spvc_compiler, id: spvc_type_id, member_index: u32, decoration: SpvDecoration) -> *u8 #foreign libspirv_cross;

spvc_compiler_get_member_name :: (compiler: spvc_compiler, id: spvc_type_id, member_index: u32) -> *u8 #foreign libspirv_cross;

/*
* Entry points.
* Maps to C++ API.
*/
spvc_compiler_get_entry_points :: (compiler: spvc_compiler, entry_points: **spvc_entry_point, num_entry_points: *u64) -> spvc_result #foreign libspirv_cross;

spvc_compiler_set_entry_point :: (compiler: spvc_compiler, name: *u8, model: SpvExecutionModel) -> spvc_result #foreign libspirv_cross;

spvc_compiler_rename_entry_point :: (compiler: spvc_compiler, old_name: *u8, new_name: *u8, model: SpvExecutionModel) -> spvc_result #foreign libspirv_cross;

spvc_compiler_get_cleansed_entry_point_name :: (compiler: spvc_compiler, name: *u8, model: SpvExecutionModel) -> *u8 #foreign libspirv_cross;

spvc_compiler_set_execution_mode :: (compiler: spvc_compiler, mode: SpvExecutionMode) -> void #foreign libspirv_cross;
spvc_compiler_unset_execution_mode :: (compiler: spvc_compiler, mode: SpvExecutionMode) -> void #foreign libspirv_cross;
spvc_compiler_set_execution_mode_with_arguments :: (compiler: spvc_compiler, mode: SpvExecutionMode, arg0: u32, arg1: u32, arg2: u32) -> void #foreign libspirv_cross;

spvc_compiler_get_execution_modes :: (compiler: spvc_compiler, modes: **SpvExecutionMode, num_modes: *u64) -> spvc_result #foreign libspirv_cross;

spvc_compiler_get_execution_mode_argument :: (compiler: spvc_compiler, mode: SpvExecutionMode) -> u32 #foreign libspirv_cross;
spvc_compiler_get_execution_mode_argument_by_index :: (compiler: spvc_compiler, mode: SpvExecutionMode, index: u32) -> u32 #foreign libspirv_cross;

spvc_compiler_get_execution_model :: (compiler: spvc_compiler) -> SpvExecutionModel #foreign libspirv_cross;
spvc_compiler_update_active_builtins :: (compiler: spvc_compiler) -> void #foreign libspirv_cross;
spvc_compiler_has_active_builtin :: (compiler: spvc_compiler, builtin: SpvBuiltIn, storage: SpvStorageClass) -> spvc_bool #foreign libspirv_cross;

/*
* Type query interface.
* Maps to C++ API, except it's read-only.
*/
spvc_compiler_get_type_handle :: (compiler: spvc_compiler, id: spvc_type_id) -> spvc_type #foreign libspirv_cross;

/* Pulls out SPIRType::self. This effectively gives the type ID without array or pointer qualifiers.
* This is necessary when reflecting decoration/name information on members of a struct,
* which are placed in the base type, not the qualified type.
* This is similar to spvc_reflected_resource::base_type_id. */
spvc_type_get_base_type_id :: (type: spvc_type) -> spvc_type_id #foreign libspirv_cross;

spvc_type_get_basetype :: (type: spvc_type) -> spvc_basetype #foreign libspirv_cross;
spvc_type_get_bit_width :: (type: spvc_type) -> u32 #foreign libspirv_cross;
spvc_type_get_vector_size :: (type: spvc_type) -> u32 #foreign libspirv_cross;
spvc_type_get_columns :: (type: spvc_type) -> u32 #foreign libspirv_cross;
spvc_type_get_num_array_dimensions :: (type: spvc_type) -> u32 #foreign libspirv_cross;
spvc_type_array_dimension_is_literal :: (type: spvc_type, dimension: u32) -> spvc_bool #foreign libspirv_cross;
spvc_type_get_array_dimension :: (type: spvc_type, dimension: u32) -> SpvId #foreign libspirv_cross;
spvc_type_get_num_member_types :: (type: spvc_type) -> u32 #foreign libspirv_cross;
spvc_type_get_member_type :: (type: spvc_type, index: u32) -> spvc_type_id #foreign libspirv_cross;
spvc_type_get_storage_class :: (type: spvc_type) -> SpvStorageClass #foreign libspirv_cross;

/* Image type query. */
spvc_type_get_image_sampled_type :: (type: spvc_type) -> spvc_type_id #foreign libspirv_cross;
spvc_type_get_image_dimension :: (type: spvc_type) -> SpvDim #foreign libspirv_cross;
spvc_type_get_image_is_depth :: (type: spvc_type) -> spvc_bool #foreign libspirv_cross;
spvc_type_get_image_arrayed :: (type: spvc_type) -> spvc_bool #foreign libspirv_cross;
spvc_type_get_image_multisampled :: (type: spvc_type) -> spvc_bool #foreign libspirv_cross;
spvc_type_get_image_is_storage :: (type: spvc_type) -> spvc_bool #foreign libspirv_cross;
spvc_type_get_image_storage_format :: (type: spvc_type) -> SpvImageFormat #foreign libspirv_cross;
spvc_type_get_image_access_qualifier :: (type: spvc_type) -> SpvAccessQualifier #foreign libspirv_cross;

/*
* Buffer layout query.
* Maps to C++ API.
*/
spvc_compiler_get_declared_struct_size :: (compiler: spvc_compiler, struct_type: spvc_type, size: *u64) -> spvc_result #foreign libspirv_cross;
spvc_compiler_get_declared_struct_size_runtime_array :: (compiler: spvc_compiler, struct_type: spvc_type, array_size: u64, size: *u64) -> spvc_result #foreign libspirv_cross;

spvc_compiler_get_declared_struct_member_size :: (compiler: spvc_compiler, type: spvc_type, index: u32, size: *u64) -> spvc_result #foreign libspirv_cross;

spvc_compiler_type_struct_member_offset :: (compiler: spvc_compiler, type: spvc_type, index: u32, offset: *u32) -> spvc_result #foreign libspirv_cross;

spvc_compiler_type_struct_member_array_stride :: (compiler: spvc_compiler, type: spvc_type, index: u32, stride: *u32) -> spvc_result #foreign libspirv_cross;

spvc_compiler_type_struct_member_matrix_stride :: (compiler: spvc_compiler, type: spvc_type, index: u32, stride: *u32) -> spvc_result #foreign libspirv_cross;

/*
* Workaround helper functions.
* Maps to C++ API.
*/
spvc_compiler_build_dummy_sampler_for_combined_images :: (compiler: spvc_compiler, id: *spvc_variable_id) -> spvc_result #foreign libspirv_cross;
spvc_compiler_build_combined_image_samplers :: (compiler: spvc_compiler) -> spvc_result #foreign libspirv_cross;
spvc_compiler_get_combined_image_samplers :: (compiler: spvc_compiler, samplers: **spvc_combined_image_sampler, num_samplers: *u64) -> spvc_result #foreign libspirv_cross;

/*
* Constants
* Maps to C++ API.
*/
spvc_compiler_get_specialization_constants :: (compiler: spvc_compiler, constants: **spvc_specialization_constant, num_constants: *u64) -> spvc_result #foreign libspirv_cross;

spvc_compiler_get_constant_handle :: (compiler: spvc_compiler, id: spvc_constant_id) -> spvc_constant #foreign libspirv_cross;

spvc_compiler_get_work_group_size_specialization_constants :: (compiler: spvc_compiler, x: *spvc_specialization_constant, y: *spvc_specialization_constant, z: *spvc_specialization_constant) -> spvc_constant_id #foreign libspirv_cross;

/*
* Buffer ranges
* Maps to C++ API.
*/
spvc_compiler_get_active_buffer_ranges :: (compiler: spvc_compiler, id: spvc_variable_id, ranges: **spvc_buffer_range, num_ranges: *u64) -> spvc_result #foreign libspirv_cross;

/*
* No stdint.h until C99, sigh :(
* For smaller types, the result is sign or zero-extended as appropriate.
* Maps to C++ API.
* TODO: The SPIRConstant query interface and modification interface is not quite complete.
*/
spvc_constant_get_scalar_fp16 :: (constant: spvc_constant, column: u32, row: u32) -> float #foreign libspirv_cross;
spvc_constant_get_scalar_fp32 :: (constant: spvc_constant, column: u32, row: u32) -> float #foreign libspirv_cross;
spvc_constant_get_scalar_fp64 :: (constant: spvc_constant, column: u32, row: u32) -> float64 #foreign libspirv_cross;
spvc_constant_get_scalar_u32 :: (constant: spvc_constant, column: u32, row: u32) -> u32 #foreign libspirv_cross;
spvc_constant_get_scalar_i32 :: (constant: spvc_constant, column: u32, row: u32) -> s32 #foreign libspirv_cross;
spvc_constant_get_scalar_u16 :: (constant: spvc_constant, column: u32, row: u32) -> u32 #foreign libspirv_cross;
spvc_constant_get_scalar_i16 :: (constant: spvc_constant, column: u32, row: u32) -> s32 #foreign libspirv_cross;
spvc_constant_get_scalar_u8 :: (constant: spvc_constant, column: u32, row: u32) -> u32 #foreign libspirv_cross;
spvc_constant_get_scalar_i8 :: (constant: spvc_constant, column: u32, row: u32) -> s32 #foreign libspirv_cross;
spvc_constant_get_subconstants :: (constant: spvc_constant, constituents: **spvc_constant_id, count: *u64) -> void #foreign libspirv_cross;
spvc_constant_get_scalar_u64 :: (constant: spvc_constant, column: u32, row: u32) -> u64 #foreign libspirv_cross;
spvc_constant_get_scalar_i64 :: (constant: spvc_constant, column: u32, row: u32) -> s64 #foreign libspirv_cross;
spvc_constant_get_type :: (constant: spvc_constant) -> spvc_type_id #foreign libspirv_cross;

/*
* C implementation of the C++ api.
*/
spvc_constant_set_scalar_fp16 :: (constant: spvc_constant, column: u32, row: u32, value: u16) -> void #foreign libspirv_cross;
spvc_constant_set_scalar_fp32 :: (constant: spvc_constant, column: u32, row: u32, value: float) -> void #foreign libspirv_cross;
spvc_constant_set_scalar_fp64 :: (constant: spvc_constant, column: u32, row: u32, value: float64) -> void #foreign libspirv_cross;
spvc_constant_set_scalar_u32 :: (constant: spvc_constant, column: u32, row: u32, value: u32) -> void #foreign libspirv_cross;
spvc_constant_set_scalar_i32 :: (constant: spvc_constant, column: u32, row: u32, value: s32) -> void #foreign libspirv_cross;
spvc_constant_set_scalar_u64 :: (constant: spvc_constant, column: u32, row: u32, value: u64) -> void #foreign libspirv_cross;
spvc_constant_set_scalar_i64 :: (constant: spvc_constant, column: u32, row: u32, value: s64) -> void #foreign libspirv_cross;
spvc_constant_set_scalar_u16 :: (constant: spvc_constant, column: u32, row: u32, value: u16) -> void #foreign libspirv_cross;
spvc_constant_set_scalar_i16 :: (constant: spvc_constant, column: u32, row: u32, value: s16) -> void #foreign libspirv_cross;
spvc_constant_set_scalar_u8 :: (constant: spvc_constant, column: u32, row: u32, value: u8) -> void #foreign libspirv_cross;
spvc_constant_set_scalar_i8 :: (constant: spvc_constant, column: u32, row: u32, value: s8) -> void #foreign libspirv_cross;

/*
* Misc reflection
* Maps to C++ API.
*/
spvc_compiler_get_binary_offset_for_decoration :: (compiler: spvc_compiler, id: spvc_variable_id, decoration: SpvDecoration, word_offset: *u32) -> spvc_bool #foreign libspirv_cross;

spvc_compiler_buffer_is_hlsl_counter_buffer :: (compiler: spvc_compiler, id: spvc_variable_id) -> spvc_bool #foreign libspirv_cross;
spvc_compiler_buffer_get_hlsl_counter_buffer :: (compiler: spvc_compiler, id: spvc_variable_id, counter_id: *spvc_variable_id) -> spvc_bool #foreign libspirv_cross;

spvc_compiler_get_declared_capabilities :: (compiler: spvc_compiler, capabilities: **SpvCapability, num_capabilities: *u64) -> spvc_result #foreign libspirv_cross;

spvc_compiler_get_declared_extensions :: (compiler: spvc_compiler, extensions: ***u8, num_extensions: *u64) -> spvc_result #foreign libspirv_cross;

spvc_compiler_get_remapped_declared_block_name :: (compiler: spvc_compiler, id: spvc_variable_id) -> *u8 #foreign libspirv_cross;
spvc_compiler_get_buffer_block_decorations :: (compiler: spvc_compiler, id: spvc_variable_id, decorations: **SpvDecoration, num_decorations: *u64) -> spvc_result #foreign libspirv_cross;

#scope_file

