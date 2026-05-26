/*!
 @struct MTLOrigin
 @abstract Identify a pixel in an image. MTLOrigin is ususally used as the upper-left corner of a region of a texture.
 */
MTLOrigin :: struct {
    x: NSUInteger;
    y: NSUInteger;
    z: NSUInteger;
}

/*!
 @typedef MTLSize
 @abstract A set of dimensions to declare the size of an object, such as an image, texture, threadgroup, or grid.
 */
MTLSize :: struct {
    width: NSUInteger;
    height: NSUInteger;
    depth: NSUInteger;
}

/*!
 @struct MTLRegion
 @abstract Identify a region in an image or texture.
 */
MTLRegion :: struct {
    origin: MTLOrigin;
    size: MTLSize;
}

/*!
 @struct MTLSamplePosition
 @abstract Identify a sample within a pixel. Origin is top-left with a range [0,1) for both x and y.
 */
MTLSamplePosition :: struct {
    x: float32;
    y: float32;
}

/*!
 @typedef MTLResourceID
 @abstract Handle of the GPU resource used for binding resources to argument tables, navigating resource view pools and storing resources in an argument buffer
 @discussion
 MTLResourceID represents a specific GPU resource. This handle can be mutated by modifying textureID or samplerID values to get to individual resource views in a resource view pool.
 */
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

/// Represents a timestamp data entry in a counter heap of type `MTL4CounterHeapTypeTimestamp`.
MTL4TimestampHeapEntry :: struct {
    timestamp: u64;
}

/**
 * @brief Describes the memory requirements for an acceleration structure
 */
MTLAccelerationStructureSizes :: struct {
    /**
     * @brief The required size, in bytes, of the built acceleration structure
     */
    accelerationStructureSize: NSUInteger;
    /**
     * @brief The required size, in bytes, of the scratch buffer used to build the acceleration structure
     */
    buildScratchBufferSize: NSUInteger;
    /**
     * @brief The required size, in bytes, of the scratch buffer used to refit the acceleration structure
     */
    refitScratchBufferSize: NSUInteger;
}

/*!
 @abstract Represent a memory size and alignment in bytes.
 */
MTLSizeAndAlign :: struct {
    size: NSUInteger;
    align: NSUInteger;
}

/*!
 @enum MTLMapIndirectArguments
 @abstract Structure describing indirect mapping region. This structure is used to populate a buffer for the method  'MTLResourceStateCommandEncoder updateTextureMapping:indirectBuffer:indirectBufferOffset:'
 @discussion The correct data format for the buffer used in 'MTLResourceStateCommandEncoder updateTextureMapping:indirectBuffer:indirectBufferOffset: is the following:
 
 struct MTLMapIndirectBufferFormat{
     uint32_t numMappings;
     MTLMapIndirectArguments mappings[numMappings];
 }
 */
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
    /* NOTE: edgeTessellationFactor and insideTessellationFactor are interpreted as half (16-bit floats) */
    edgeTessellationFactor: [4]u16;
    insideTessellationFactor: [2]u16;
}

MTLTriangleTessellationFactorsHalf :: struct {
    /* NOTE: edgeTessellationFactor and insideTessellationFactor are interpreted as half (16-bit floats) */
    edgeTessellationFactor: [3]u16;
    insideTessellationFactor: u16;
}

/**
 * @brief A struct representing a range of a Metal buffer. The offset into the buffer is included in the address.
 * The length is generally optional, which a value of (uint64_t)-1 representing the range from the given address to
 * the end of the buffer. However, providing the length can enable more accurate API validation, especially when
 * sub-allocating ranges of a buffer.
 */
MTL4BufferRange :: struct {
    /**
     * @brief Buffer address returned by the gpuAddress property of an MTLBuffer plus any offset into the buffer
     */
    bufferAddress: MTLGPUAddress;
    /**
     * @brief Length of the region which begins at the given address. If the length is not known, a value of
     * (uint64_t)-1 represents the range from the given address to the end of the buffer.
     */
    length: u64;
}

MTLPackedFloatQuaternion :: struct {
    x: float32;
    y: float32;
    z: float32;
    w: float32;
}

/**
 * @brief A transformation represented by individual components such as translation and
 * rotation. The rotation is represented by a quaternion, allowing for correct motion
 * interpolation.
 */
MTLComponentTransform :: struct {
    /**
     * @brief The scale of the instance applied before rotation alongside shear and pivot
     */
    scale: MTLPackedFloat3;
    /**
     * @brief The shear of the instance applied before rotation alongside scale and pivot
     */
    shear: MTLPackedFloat3;
    /**
     * @brief Translation applied before rotation alongside scale and shear. Allows
     * rotation to pivot around a point.
     */
    pivot: MTLPackedFloat3;
    /**
     * @brief The rotation of the instance as a normalized quaternion. Applied after scale,
     * shear, and pivot and before translation
     */
    rotation: MTLPackedFloatQuaternion;
    /**
     * @brief The translation of the instance. Applied after rotation. Typically contains
     * the composition of object translation and the inverse of the pivot translation.
     */
    translation: MTLPackedFloat3;
}

MTLAccelerationStructureInstanceDescriptor :: struct {
    /**
     * @brief Transformation matrix describing how to transform the bottom-level acceleration structure.
     */
    transformationMatrix: MTLPackedFloat4x3;
    /**
     * @brief Instance options
     */
    options: MTLAccelerationStructureInstanceOptions;
    /**
     * @brief Instance mask used to ignore geometry during ray tracing
     */
    mask: u32;
    /**
     * @brief Used to index into intersection function tables
     */
    intersectionFunctionTableOffset: u32;
    /**
     * @brief Acceleration structure index to use for this instance
     */
    accelerationStructureIndex: u32;
}

MTLAccelerationStructureUserIDInstanceDescriptor :: struct {
    /**
     * @brief Transformation matrix describing how to transform the bottom-level acceleration structure.
     */
    transformationMatrix: MTLPackedFloat4x3;
    /**
     * @brief Instance options
     */
    options: MTLAccelerationStructureInstanceOptions;
    /**
     * @brief Instance mask used to ignore geometry during ray tracing
     */
    mask: u32;
    /**
     * @brief Used to index into intersection function tables
     */
    intersectionFunctionTableOffset: u32;
    /**
     * @brief Acceleration structure index to use for this instance
     */
    accelerationStructureIndex: u32;
    /**
     * @brief User-assigned instance ID to help identify this instance in an
     * application-defined way
     */
    userID: u32;
}

MTLAccelerationStructureMotionInstanceDescriptor :: struct {
    /**
     * @brief Instance options
     */
    options: MTLAccelerationStructureInstanceOptions;
    /**
     * @brief Instance mask used to ignore geometry during ray tracing
     */
    mask: u32;
    /**
     * @brief Used to index into intersection function tables
     */
    intersectionFunctionTableOffset: u32;
    /**
     * @brief Acceleration structure index to use for this instance
     */
    accelerationStructureIndex: u32;
    /**
     * @brief User-assigned instance ID to help identify this instance in an
     * application-defined way
     */
    userID: u32;
    /**
     * @brief The index of the first set of transforms describing one keyframe of the animation.
     * These transforms are stored in a separate buffer and they are uniformly distributed over
     * time time span of the motion.
     */
    motionTransformsStartIndex: u32;
    /**
     * @brief The count of motion transforms belonging to this motion which are stored in consecutive
     * memory addresses at the separate motionTransforms buffer.
     */
    motionTransformsCount: u32;
    /**
     * @brief Motion border mode describing what happens if acceleration structure is sampled
     * before motionStartTime
     */
    motionStartBorderMode: MTLMotionBorderMode;
    /**
     * @brief Motion border mode describing what happens if acceleration structure is sampled
     * after motionEndTime
     */
    motionEndBorderMode: MTLMotionBorderMode;
    /**
     * @brief Motion start time of this instance
     */
    motionStartTime: float32;
    /**
     * @brief Motion end time of this instance
     */
    motionEndTime: float32;
}

MTLIndirectAccelerationStructureInstanceDescriptor :: struct {
    /**
     * @brief Transformation matrix describing how to transform the bottom-level acceleration structure.
     */
    transformationMatrix: MTLPackedFloat4x3;
    /**
     * @brief Instance options
     */
    options: MTLAccelerationStructureInstanceOptions;
    /**
     * @brief Instance mask used to ignore geometry during ray tracing
     */
    mask: u32;
    /**
     * @brief Used to index into intersection function tables
     */
    intersectionFunctionTableOffset: u32;
    /**
     * @brief User-assigned instance ID to help identify this instance in an
     * application-defined way
     */
    userID: u32;
    /**
     * @brief Acceleration structure resource handle to use for this instance
     */
    accelerationStructureID: MTLResourceID;
}

MTLIndirectAccelerationStructureMotionInstanceDescriptor :: struct {
    /**
     * @brief Instance options
     */
    options: MTLAccelerationStructureInstanceOptions;
    /**
     * @brief Instance mask used to ignore geometry during ray tracing
     */
    mask: u32;
    /**
     * @brief Used to index into intersection function tables
     */
    intersectionFunctionTableOffset: u32;
    /**
     * @brief User-assigned instance ID to help identify this instance in an
     * application-defined way
     */
    userID: u32;
    /**
     * @brief Acceleration structure resource handle to use for this instance
     */
    accelerationStructureID: MTLResourceID;
    /**
     * @brief The index of the first set of transforms describing one keyframe of the animation.
     * These transforms are stored in a separate buffer and they are uniformly distributed over
     * time time span of the motion.
     */
    motionTransformsStartIndex: u32;
    /**
     * @brief The count of motion transforms belonging to this motion which are stored in consecutive
     * memory addresses at the separate motionTransforms buffer.
     */
    motionTransformsCount: u32;
    /**
     * @brief Motion border mode describing what happens if acceleration structure is sampled
     * before motionStartTime
     */
    motionStartBorderMode: MTLMotionBorderMode;
    /**
     * @brief Motion border mode describing what happens if acceleration structure is sampled
     * after motionEndTime
     */
    motionEndBorderMode: MTLMotionBorderMode;
    /**
     * @brief Motion start time of this instance
     */
    motionStartTime: float32;
    /**
     * @brief Motion end time of this instance
     */
    motionEndTime: float32;
}

/// Groups together arguments for an operation to update a sparse texture mapping.
///
/// When performing a sparse mapping update, you are responsible for issuing a barrier against stage `MTLStageResourceState`.
///
/// You can determine the sparse texture tier by calling ``MTLTexture/sparseTextureTier``.
MTL4UpdateSparseTextureMappingOperation :: struct {
    /// The mode of the mapping operation to perform.
    ///
    /// When mode is ``MTLSparseTextureMappingMode/MTLSparseTextureMappingModeMap``,
    /// Metal walks the tiles in the region in X, Y, then Z order, assigning the next
    /// tile from the heap in increasing order, starting at ``heapOffset``.
    ///
    /// When mode is ``MTLSparseTextureMappingMode/MTLSparseTextureMappingModeUnmap``,
    /// Metal unmaps the tiles in the region, ignoring the contents of member ``heapOffset``.
    mode: MTLSparseTextureMappingMode;
    /// The region in the texture to update, in tiles.
    ///
    /// When ``textureLevel`` is equal to the texture's ``MTLTexture/firstMipmapInTail``,
    /// set `origin.y` to `0` and `size.height` to `1`.
    textureRegion: MTLRegion;
    /// The index of the mipmap level in the texture to update.
    ///
    /// Provide a value between `0` and the texture's ``MTLTexture/firstMipmapInTail``.
    textureLevel: NSUInteger;
    /// The index of the array slice in the texture to update.
    ///
    /// Provide `0` in this member if the texture type is not an array.
    textureSlice: NSUInteger;
    /// The starting offset in the heap, in tiles.
    heapOffset: NSUInteger;
}

/// Groups together arguments for an operation to copy a sparse texture mapping.
MTL4CopySparseTextureMappingOperation :: struct {
    /// The region in the source texture, in tiles.
    ///
    /// The tiles remain mapped in the source texture.
    ///
    /// When ``sourceLevel`` is equal to the source texture's ``MTLTexture/firstMipmapInTail``,
    /// set `origin.y` to `0` and `size.height` to `1`.
    sourceRegion: MTLRegion;
    /// The index of the mipmap level in the source texture.
    ///
    /// Provide a value between `0` and the source texture's ``MTLTexture/firstMipmapInTail``.
    ///
    /// When ``sourceLevel`` is equal to the source texture's ``MTLTexture/firstMipmapInTail``,
    /// set ``destinationLevel`` to the destination texture's ``MTLTexture/firstMipmapInTail``.
    sourceLevel: NSUInteger;
    /// The index of the array slice in the texture source of the copy operation.
    ///
    /// Provide `0` in this member if the texture type is not an array.
    sourceSlice: NSUInteger;
    /// The origin in the destination texture to copy into, in tiles.
    ///
    /// The X, Y and Z coordinates of the tiles relative to the origin match the same
    /// coordinates in the source region.
    ///
    /// When ``destinationLevel`` is equal to the destination texture's ``MTLTexture/firstMipmapInTail``,
    /// set `destinationOrigin.y` to `0`.
    destinationOrigin: MTLOrigin;
    /// The index of the mipmap level in the destination texture.
    ///
    /// Provide a value between `0` and the destination texture's ``MTLTexture/firstMipmapInTail``.
    ///
    /// When ``sourceLevel`` is equal to the source texture's ``MTLTexture/firstMipmapInTail``,
    /// set ``destinationLevel`` to the destination texture's ``MTLTexture/firstMipmapInTail``.
    destinationLevel: NSUInteger;
    /// The index of the array slice in the destination texture to copy into.
    ///
    /// Provide `0` in this member if the texture type is not an array.
    destinationSlice: NSUInteger;
}

/// Groups together arguments for an operation to update a sparse buffer mapping.
MTL4UpdateSparseBufferMappingOperation :: struct {
    /// The mode of the mapping operation to perform.
    ///
    /// When mode is ``MTLSparseTextureMappingMode/MTLSparseTextureMappingModeMap``,
    /// Metal walks the tiles in the range in buffer offset order, assigning the
    /// next tile from the heap in increasing order, starting at ``heapOffset``.
    ///
    /// When mode is ``MTLSparseTextureMappingMode/MTLSparseTextureMappingModeUnmap``,
    /// Metal unmaps the tiles in the range, and ignores the value of member ``heapOffset``.
    mode: MTLSparseTextureMappingMode;
    /// The range in the buffer, in tiles.
    bufferRange: NSRange;
    /// The starting offset in the heap, in tiles.
    heapOffset: NSUInteger;
}

/// Groups together arguments for an operation to copy a sparse buffer mapping.
MTL4CopySparseBufferMappingOperation :: struct {
    /// The range in the source buffer, in tiles.
    ///
    /// The tiles remain mapped in the source buffer.
    sourceRange: NSRange;
    /// The origin in the destination buffer, in tiles.
    destinationOffset: NSUInteger;
}

/*!
 @abstract The data layout required for specifying an indirect command buffer execution range.
 */
MTLIndirectCommandBufferExecutionRange :: struct {
    location: u32;
    length: u32;
}

/**
 * @brief struct containing arguments for intersection function buffers.
 */
MTLIntersectionFunctionBufferArguments :: struct {
    /**
     * @brief The GPU resource ID of the buffer containing intersection-function handles.
     * Required to be aligned to 8 bytes.
     */
    intersectionFunctionBuffer: u64;
    /**
     * @brief The maximum range in bytes of intersectionFunctionBuffer that can be used
     * for ray tracing.
     */
    intersectionFunctionBufferSize: u64;
    /**
     * @brief The stride between intersection function entries in intersectionFunctionBuffer.
     * The stride needs to be either 0 or aligned to 8 bytes. Note that only the first 12
     * bits of this value are used by Metal.
     */
    intersectionFunctionStride: u64;
}

