MTLOrigin :: struct {
    x: NSUInteger;
    y: NSUInteger;
    z: NSUInteger;
}

MTLSize :: struct {
    width: NSUInteger;
    height: NSUInteger;
    depth: NSUInteger;
}

MTLRegion :: struct {
    origin: MTLOrigin;
    size: MTLSize;
}

MTLSamplePosition :: struct {
    x: float32;
    y: float32;
}

MTLResourceID :: struct {
    _impl: u64;
}

MTLTextureSwizzleChannels :: struct {
    red: MTLTextureSwizzle;
    green: MTLTextureSwizzle;
    blue: MTLTextureSwizzle;
    alpha: MTLTextureSwizzle;
}

MTLCounterResultTimestamp :: struct {
    timestamp: u64;
}

MTLCounterResultStageUtilization :: struct {
    totalCycles: u64;
    vertexCycles: u64;
    tessellationCycles: u64;
    postTessellationVertexCycles: u64;
    fragmentCycles: u64;
    renderTargetCycles: u64;
}

MTLCounterResultStatistic :: struct {
    tessellationInputPatches: u64;
    vertexInvocations: u64;
    postTessellationVertexInvocations: u64;
    clipperInvocations: u64;
    clipperPrimitivesOut: u64;
    fragmentInvocations: u64;
    fragmentsPassed: u64;
    computeKernelInvocations: u64;
}

MTL4TimestampHeapEntry :: struct {
    timestamp: u64;
}

MTLAccelerationStructureSizes :: struct {
    accelerationStructureSize: NSUInteger;
    buildScratchBufferSize: NSUInteger;
    refitScratchBufferSize: NSUInteger;
}

MTLSizeAndAlign :: struct {
    size: NSUInteger;
    align: NSUInteger;
}

MTLMapIndirectArguments :: struct {
    regionOriginX: u32;
    regionOriginY: u32;
    regionOriginZ: u32;
    regionSizeWidth: u32;
    regionSizeHeight: u32;
    regionSizeDepth: u32;
    mipMapLevel: u32;
    sliceId: u32;
}

MTLClearColor :: struct {
    red: float64;
    green: float64;
    blue: float64;
    alpha: float64;
}

MTLDispatchThreadgroupsIndirectArguments :: struct {
    threadgroupsPerGrid: [3]u32;
}

MTLDispatchThreadsIndirectArguments :: struct {
    threadsPerGrid: [3]u32;
    threadsPerThreadgroup: [3]u32;
}

MTLStageInRegionIndirectArguments :: struct {
    stageInOrigin: [3]u32;
    stageInSize: [3]u32;
}

MTLScissorRect :: struct {
    x: NSUInteger;
    y: NSUInteger;
    width: NSUInteger;
    height: NSUInteger;
}

MTLViewport :: struct {
    originX: float64;
    originY: float64;
    width: float64;
    height: float64;
    znear: float64;
    zfar: float64;
}

MTLDrawPrimitivesIndirectArguments :: struct {
    vertexCount: u32;
    instanceCount: u32;
    vertexStart: u32;
    baseInstance: u32;
}

MTLDrawIndexedPrimitivesIndirectArguments :: struct {
    indexCount: u32;
    instanceCount: u32;
    indexStart: u32;
    baseVertex: s32;
    baseInstance: u32;
}

MTLVertexAmplificationViewMapping :: struct {
    viewportArrayIndexOffset: u32;
    renderTargetArrayIndexOffset: u32;
}

MTLDrawPatchIndirectArguments :: struct {
    patchCount: u32;
    instanceCount: u32;
    patchStart: u32;
    baseInstance: u32;
}

MTLQuadTessellationFactorsHalf :: struct {
    edgeTessellationFactor: [4]u16;
    insideTessellationFactor: [2]u16;
}

MTLTriangleTessellationFactorsHalf :: struct {
    edgeTessellationFactor: [3]u16;
    insideTessellationFactor: u16;
}

MTL4BufferRange :: struct {
    bufferAddress: MTLGPUAddress;
    length: u64;
}

MTLPackedFloatQuaternion :: struct {
    x: float32;
    y: float32;
    z: float32;
    w: float32;
}

MTLComponentTransform :: struct {
    scale: MTLPackedFloat3;
    shear: MTLPackedFloat3;
    pivot: MTLPackedFloat3;
    rotation: MTLPackedFloatQuaternion;
    translation: MTLPackedFloat3;
}

MTLAccelerationStructureInstanceDescriptor :: struct {
    transformationMatrix: MTLPackedFloat4x3;
    options: MTLAccelerationStructureInstanceOptions;
    mask: u32;
    intersectionFunctionTableOffset: u32;
    accelerationStructureIndex: u32;
}

MTLAccelerationStructureUserIDInstanceDescriptor :: struct {
    transformationMatrix: MTLPackedFloat4x3;
    options: MTLAccelerationStructureInstanceOptions;
    mask: u32;
    intersectionFunctionTableOffset: u32;
    accelerationStructureIndex: u32;
    userID: u32;
}

MTLAccelerationStructureMotionInstanceDescriptor :: struct {
    options: MTLAccelerationStructureInstanceOptions;
    mask: u32;
    intersectionFunctionTableOffset: u32;
    accelerationStructureIndex: u32;
    userID: u32;
    motionTransformsStartIndex: u32;
    motionTransformsCount: u32;
    motionStartBorderMode: MTLMotionBorderMode;
    motionEndBorderMode: MTLMotionBorderMode;
    motionStartTime: float32;
    motionEndTime: float32;
}

MTLIndirectAccelerationStructureInstanceDescriptor :: struct {
    transformationMatrix: MTLPackedFloat4x3;
    options: MTLAccelerationStructureInstanceOptions;
    mask: u32;
    intersectionFunctionTableOffset: u32;
    userID: u32;
    accelerationStructureID: MTLResourceID;
}

MTLIndirectAccelerationStructureMotionInstanceDescriptor :: struct {
    options: MTLAccelerationStructureInstanceOptions;
    mask: u32;
    intersectionFunctionTableOffset: u32;
    userID: u32;
    accelerationStructureID: MTLResourceID;
    motionTransformsStartIndex: u32;
    motionTransformsCount: u32;
    motionStartBorderMode: MTLMotionBorderMode;
    motionEndBorderMode: MTLMotionBorderMode;
    motionStartTime: float32;
    motionEndTime: float32;
}

MTL4UpdateSparseTextureMappingOperation :: struct {
    mode: MTLSparseTextureMappingMode;
    textureRegion: MTLRegion;
    textureLevel: NSUInteger;
    textureSlice: NSUInteger;
    heapOffset: NSUInteger;
}

MTL4CopySparseTextureMappingOperation :: struct {
    sourceRegion: MTLRegion;
    sourceLevel: NSUInteger;
    sourceSlice: NSUInteger;
    destinationOrigin: MTLOrigin;
    destinationLevel: NSUInteger;
    destinationSlice: NSUInteger;
}

MTL4UpdateSparseBufferMappingOperation :: struct {
    mode: MTLSparseTextureMappingMode;
    bufferRange: NSRange;
    heapOffset: NSUInteger;
}

MTL4CopySparseBufferMappingOperation :: struct {
    sourceRange: NSRange;
    destinationOffset: NSUInteger;
}

MTLIndirectCommandBufferExecutionRange :: struct {
    location: u32;
    length: u32;
}

MTLIntersectionFunctionBufferArguments :: struct {
    intersectionFunctionBuffer: u64;
    intersectionFunctionBufferSize: u64;
    intersectionFunctionStride: u64;
}

