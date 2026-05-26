/// An array of length matching the rank, holding the dimensions of a tensor.
///
/// Supports rank up to ``MTL_TENSOR_MAX_RANK``.
MTLTensorExtents :: struct #type_info_none {
    nsobject: *NSObject;
/// Creates a new tensor extents with the rank and extent values you provide.
///
/// Zero rank extents represent scalars. `values` can only be `nil`if `rank` is 0.
/// - Parameters:
///   - rank: the number of dimensions.
///   - values: an array of length `rank` that specifies the size of each dimension. The first dimension is the innermost dimension.
/// - Returns: Tensor extents with the rank and extent values you provide. Returns `nil` if `rank` exceeds 0 and `values` is nil or if `rank` exceeds ``MTL_TENSOR_MAX_RANK``.
    initWithRank_values_ :: (self: *MTLTensorExtents, rank: NSUInteger, values: *NSInteger) -> *MTLTensorExtents {
        func: #type (obj: *void, selector: *void, rank: NSUInteger, values: *NSInteger) -> *MTLTensorExtents #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.initWithRank_values_, rank, values);
    }

/// Returns the extent at an index.
///
/// - Parameters:
///   - dimensionIndex: the index of the dimension. The first dimension is the innermost dimension.
/// - Returns: the extent at `dimensionIndex`. This method returns -1 if `dimensionIndex` is greater than or equal to `rank`.
    extentAtDimensionIndex_ :: (self: *MTLTensorExtents, dimensionIndex: NSUInteger) -> NSInteger {
        func: #type (obj: *void, selector: *void, dimensionIndex: NSUInteger) -> NSInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.extentAtDimensionIndex_, dimensionIndex);
    }

/// Obtains the rank of the tensor.
///
/// The rank represents the number of dimensions.
    rank :: (self: *MTLTensorExtents) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.rank);
    }

}

/// A configuration type for creating new tensor instances.
MTLTensorDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// An array of sizes, in elements, one for each dimension of the tensors you create with this descriptor.
///
/// The default value of this property is a rank one extents with size one.
    dimensions :: (self: *MTLTensorDescriptor) -> *MTLTensorExtents {
        func: #type (obj: *void, selector: *void) -> *MTLTensorExtents #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dimensions);
    }

    setDimensions_ :: (self: *MTLTensorDescriptor, dimensions: *MTLTensorExtents) -> void {
        func: #type (obj: *void, selector: *void, dimensions: *MTLTensorExtents) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDimensions_, dimensions);
    }

/// An array of strides, in elements, one for each dimension in the tensors you create with this descriptor, if applicable.
///
/// You are responsible for ensuring `strides` meets the following requirements:
/// - The first element of `strides` is one.
/// - If ``usage`` contains ``MTLTensorUsage/MTLTensorUsageMachineLearning``, the second element of `strides` is aligned to 64 bytes, and for any `i` larger than one, `strides[i]` is equal to `strides[i-1] * dimensions[i-1]`.
/// - If ``dataType`` is a sub-byte ``MTLTensorDataType``, for any `i` greater than or equal to 1, `strides[i]` is aligned to 128 bytes. This is not a requirement for non-sub-byte data types, but following this convention improves performance.
///
/// Only set this property when creating tensors from a buffer.
    strides :: (self: *MTLTensorDescriptor) -> *MTLTensorExtents {
        func: #type (obj: *void, selector: *void) -> *MTLTensorExtents #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.strides);
    }

    setStrides_ :: (self: *MTLTensorDescriptor, strides: *MTLTensorExtents) -> void {
        func: #type (obj: *void, selector: *void, strides: *MTLTensorExtents) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStrides_, strides);
    }

/// A data format for the tensors you create with this descriptor.
///
/// The default value of this property is ``MTLTensorDataType/MTLTensorDataTypeFloat32``.
    dataType :: (self: *MTLTensorDescriptor) -> MTLTensorDataType {
        func: #type (obj: *void, selector: *void) -> MTLTensorDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dataType);
    }

    setDataType_ :: (self: *MTLTensorDescriptor, dataType: MTLTensorDataType) -> void {
        func: #type (obj: *void, selector: *void, dataType: MTLTensorDataType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDataType_, dataType);
    }

/// A set of contexts in which you can use tensors you create with this descriptor.
///
/// The default value for this property is a bitwise `OR` of:
/// - ``MTLTensorUsage/MTLTensorUsageRender``
/// - ``MTLTensorUsage/MTLTensorUsageCompute``
    usage :: (self: *MTLTensorDescriptor) -> MTLTensorUsage {
        func: #type (obj: *void, selector: *void) -> MTLTensorUsage #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.usage);
    }

    setUsage_ :: (self: *MTLTensorDescriptor, usage: MTLTensorUsage) -> void {
        func: #type (obj: *void, selector: *void, usage: MTLTensorUsage) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setUsage_, usage);
    }

/// A packed set of the `storageMode`, `cpuCacheMode` and `hazardTrackingMode` properties.
    resourceOptions :: (self: *MTLTensorDescriptor) -> MTLResourceOptions {
        func: #type (obj: *void, selector: *void) -> MTLResourceOptions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resourceOptions);
    }

    setResourceOptions_ :: (self: *MTLTensorDescriptor, resourceOptions: MTLResourceOptions) -> void {
        func: #type (obj: *void, selector: *void, resourceOptions: MTLResourceOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setResourceOptions_, resourceOptions);
    }

/// A value that configures the cache mode of CPU mapping of tensors you create with this descriptor.
///
/// The default value of this property is ``MTLCPUCacheMode/MTLCPUCacheModeDefaultCache``.
    cpuCacheMode :: (self: *MTLTensorDescriptor) -> MTLCPUCacheMode {
        func: #type (obj: *void, selector: *void) -> MTLCPUCacheMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.cpuCacheMode);
    }

    setCpuCacheMode_ :: (self: *MTLTensorDescriptor, cpuCacheMode: MTLCPUCacheMode) -> void {
        func: #type (obj: *void, selector: *void, cpuCacheMode: MTLCPUCacheMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCpuCacheMode_, cpuCacheMode);
    }

/// A value that configures the memory location and access permissions of tensors you create with this descriptor.
///
/// The default value of this property defaults to ``MTLStorageMode/MTLStorageModeShared``.
    storageMode :: (self: *MTLTensorDescriptor) -> MTLStorageMode {
        func: #type (obj: *void, selector: *void) -> MTLStorageMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.storageMode);
    }

    setStorageMode_ :: (self: *MTLTensorDescriptor, storageMode: MTLStorageMode) -> void {
        func: #type (obj: *void, selector: *void, storageMode: MTLStorageMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStorageMode_, storageMode);
    }

/// A value that configures the hazard tracking of tensors you create with this descriptor.
///
/// The default value of this property is ``MTLHazardTrackingMode/MTLHazardTrackingModeDefault``.
    hazardTrackingMode :: (self: *MTLTensorDescriptor) -> MTLHazardTrackingMode {
        func: #type (obj: *void, selector: *void) -> MTLHazardTrackingMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.hazardTrackingMode);
    }

    setHazardTrackingMode_ :: (self: *MTLTensorDescriptor, hazardTrackingMode: MTLHazardTrackingMode) -> void {
        func: #type (obj: *void, selector: *void, hazardTrackingMode: MTLHazardTrackingMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setHazardTrackingMode_, hazardTrackingMode);
    }

}

MTLSharedTextureHandle :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @property device
 @abstract The device this texture was created against.
 @discussion This shared texture handle can only be used with this device.
 */
    device :: (self: *MTLSharedTextureHandle) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

/*!
 @property label
 @abstract A copy of the original texture's label property, if any
*/
    label :: (self: *MTLSharedTextureHandle) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

}

MTLTextureDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @method texture2DDescriptorWithPixelFormat:width:height:mipmapped:
 @abstract Create a TextureDescriptor for a common 2D texture.
 */
    texture2DDescriptorWithPixelFormat_width_height_mipmapped_ :: (pixelFormat: MTLPixelFormat, width: NSUInteger, height: NSUInteger, mipmapped: BOOL) -> *MTLTextureDescriptor {
        func: #type (obj: *void, selector: *void, pixelFormat: MTLPixelFormat, width: NSUInteger, height: NSUInteger, mipmapped: BOOL) -> *MTLTextureDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLTextureDescriptor"), __sel.texture2DDescriptorWithPixelFormat_width_height_mipmapped_, pixelFormat, width, height, mipmapped);
    }

/*!
 @method textureCubeDescriptorWithPixelFormat:size:mipmapped:
 @abstract Create a TextureDescriptor for a common Cube texture.
 */
    textureCubeDescriptorWithPixelFormat_size_mipmapped_ :: (pixelFormat: MTLPixelFormat, size: NSUInteger, mipmapped: BOOL) -> *MTLTextureDescriptor {
        func: #type (obj: *void, selector: *void, pixelFormat: MTLPixelFormat, size: NSUInteger, mipmapped: BOOL) -> *MTLTextureDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLTextureDescriptor"), __sel.textureCubeDescriptorWithPixelFormat_size_mipmapped_, pixelFormat, size, mipmapped);
    }

/*!
 @method textureBufferDescriptorWithPixelFormat:width:resourceOptions:usage:
 @abstract Create a TextureDescriptor for a common texture buffer.
 */
    textureBufferDescriptorWithPixelFormat_width_resourceOptions_usage_ :: (pixelFormat: MTLPixelFormat, width: NSUInteger, resourceOptions: MTLResourceOptions, usage: MTLTextureUsage) -> *MTLTextureDescriptor {
        func: #type (obj: *void, selector: *void, pixelFormat: MTLPixelFormat, width: NSUInteger, resourceOptions: MTLResourceOptions, usage: MTLTextureUsage) -> *MTLTextureDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLTextureDescriptor"), __sel.textureBufferDescriptorWithPixelFormat_width_resourceOptions_usage_, pixelFormat, width, resourceOptions, usage);
    }

/*!
 @property type
 @abstract The overall type of the texture to be created. The default value is MTLTextureType2D.
 */
    textureType :: (self: *MTLTextureDescriptor) -> MTLTextureType {
        func: #type (obj: *void, selector: *void) -> MTLTextureType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.textureType);
    }

    setTextureType_ :: (self: *MTLTextureDescriptor, textureType: MTLTextureType) -> void {
        func: #type (obj: *void, selector: *void, textureType: MTLTextureType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTextureType_, textureType);
    }

/*!
 @property pixelFormat
 @abstract The pixel format to use when allocating this texture. This is also the pixel format that will be used to when the caller writes or reads pixels from this texture. The default value is MTLPixelFormatRGBA8Unorm.
 */
    pixelFormat :: (self: *MTLTextureDescriptor) -> MTLPixelFormat {
        func: #type (obj: *void, selector: *void) -> MTLPixelFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pixelFormat);
    }

    setPixelFormat_ :: (self: *MTLTextureDescriptor, pixelFormat: MTLPixelFormat) -> void {
        func: #type (obj: *void, selector: *void, pixelFormat: MTLPixelFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPixelFormat_, pixelFormat);
    }

/*!
 @property width
 @abstract The width of the texture to create. The default value is 1.
 */
    width :: (self: *MTLTextureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.width);
    }

    setWidth_ :: (self: *MTLTextureDescriptor, width: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, width: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setWidth_, width);
    }

/*!
 @property height
 @abstract The height of the texture to create. The default value is 1.
 @discussion height If allocating a 1D texture, height must be 1.
 */
    height :: (self: *MTLTextureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.height);
    }

    setHeight_ :: (self: *MTLTextureDescriptor, height: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, height: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setHeight_, height);
    }

/*!
 @property depth
 @abstract The depth of the texture to create. The default value is 1.
 @discussion depth When allocating any texture types other than 3D, depth must be 1.
 */
    depth :: (self: *MTLTextureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.depth);
    }

    setDepth_ :: (self: *MTLTextureDescriptor, depth: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, depth: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepth_, depth);
    }

/*!
 @property mipmapLevelCount
 @abstract The number of mipmap levels to allocate. The default value is 1.
 @discussion When creating Buffer and Multisample textures, mipmapLevelCount must be 1.
 */
    mipmapLevelCount :: (self: *MTLTextureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.mipmapLevelCount);
    }

    setMipmapLevelCount_ :: (self: *MTLTextureDescriptor, mipmapLevelCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, mipmapLevelCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMipmapLevelCount_, mipmapLevelCount);
    }

/*!
 @property sampleCount
 @abstract The number of samples in the texture to create. The default value is 1.
 @discussion When creating Buffer textures sampleCount must be 1. Implementations may round sample counts up to the next supported value.
 */
    sampleCount :: (self: *MTLTextureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleCount);
    }

    setSampleCount_ :: (self: *MTLTextureDescriptor, sampleCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSampleCount_, sampleCount);
    }

/*!
 @property arrayLength
 @abstract The number of array elements to allocate. The default value is 1.
 @discussion When allocating any non-Array texture type, arrayLength has to be 1. Otherwise it must be set to something greater than 1 and less than 2048.
 */
    arrayLength :: (self: *MTLTextureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.arrayLength);
    }

    setArrayLength_ :: (self: *MTLTextureDescriptor, arrayLength: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, arrayLength: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setArrayLength_, arrayLength);
    }

/*!
 @property resourceOptions
 @abstract Options to control memory allocation parameters, etc.
 @discussion Contains a packed set of the storageMode, cpuCacheMode and hazardTrackingMode properties.
 */
    resourceOptions :: (self: *MTLTextureDescriptor) -> MTLResourceOptions {
        func: #type (obj: *void, selector: *void) -> MTLResourceOptions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resourceOptions);
    }

    setResourceOptions_ :: (self: *MTLTextureDescriptor, resourceOptions: MTLResourceOptions) -> void {
        func: #type (obj: *void, selector: *void, resourceOptions: MTLResourceOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setResourceOptions_, resourceOptions);
    }

/*!
 @property cpuCacheMode
 @abstract Options to specify CPU cache mode of texture resource.
 */
    cpuCacheMode :: (self: *MTLTextureDescriptor) -> MTLCPUCacheMode {
        func: #type (obj: *void, selector: *void) -> MTLCPUCacheMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.cpuCacheMode);
    }

    setCpuCacheMode_ :: (self: *MTLTextureDescriptor, cpuCacheMode: MTLCPUCacheMode) -> void {
        func: #type (obj: *void, selector: *void, cpuCacheMode: MTLCPUCacheMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCpuCacheMode_, cpuCacheMode);
    }

/*!
 @property storageMode
 @abstract To specify storage mode of texture resource.
 */
    storageMode :: (self: *MTLTextureDescriptor) -> MTLStorageMode {
        func: #type (obj: *void, selector: *void) -> MTLStorageMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.storageMode);
    }

    setStorageMode_ :: (self: *MTLTextureDescriptor, storageMode: MTLStorageMode) -> void {
        func: #type (obj: *void, selector: *void, storageMode: MTLStorageMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStorageMode_, storageMode);
    }

/*!
 @property hazardTrackingMode
 @abstract Set hazard tracking mode for the texture. The default value is MTLHazardTrackingModeDefault.
 @discussion
 For resources created from the device, MTLHazardTrackingModeDefault is treated as MTLHazardTrackingModeTracked.
 For resources created on a heap, MTLHazardTrackingModeDefault is treated as the hazardTrackingMode of the heap itself.
 In either case, it is possible to opt-out of hazard tracking by setting MTLHazardTrackingModeUntracked.
 It is not possible to opt-in to hazard tracking on a heap that itself is not hazard tracked.
 For optimal performance, perform hazard tracking manually through MTLFence or MTLEvent instead.
 */
    hazardTrackingMode :: (self: *MTLTextureDescriptor) -> MTLHazardTrackingMode {
        func: #type (obj: *void, selector: *void) -> MTLHazardTrackingMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.hazardTrackingMode);
    }

    setHazardTrackingMode_ :: (self: *MTLTextureDescriptor, hazardTrackingMode: MTLHazardTrackingMode) -> void {
        func: #type (obj: *void, selector: *void, hazardTrackingMode: MTLHazardTrackingMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setHazardTrackingMode_, hazardTrackingMode);
    }

/*!
 @property usage
 @abstract Description of texture usage
 */
    usage :: (self: *MTLTextureDescriptor) -> MTLTextureUsage {
        func: #type (obj: *void, selector: *void) -> MTLTextureUsage #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.usage);
    }

    setUsage_ :: (self: *MTLTextureDescriptor, usage: MTLTextureUsage) -> void {
        func: #type (obj: *void, selector: *void, usage: MTLTextureUsage) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setUsage_, usage);
    }

/*!
 @property allowGPUOptimizedContents
 @abstract Allow GPU-optimization for the contents of this texture. The default value is true.
 @discussion Useful for opting-out of GPU-optimization when implicit optimization (e.g. RT writes) is regressing CPU-read-back performance. See the documentation for optimizeContentsForGPUAccess: and optimizeContentsForCPUAccess: APIs.
 */
    allowGPUOptimizedContents :: (self: *MTLTextureDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.allowGPUOptimizedContents);
    }

    setAllowGPUOptimizedContents_ :: (self: *MTLTextureDescriptor, allowGPUOptimizedContents: BOOL) -> void {
        func: #type (obj: *void, selector: *void, allowGPUOptimizedContents: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAllowGPUOptimizedContents_, allowGPUOptimizedContents);
    }

/*!
 @property compressionType
 @abstract Controls how the texture contents will be compressed when written to by the GPU. Compression can be used to reduce the bandwidth usage and storage requirements of a texture.
 @discussion The default compression type is lossless, meaning that no loss of precision will occur when the texture content is modified.
 Losslessly compressed textures may benefit from reduced bandwidth usage when regions of correlated color values are written, but do not benefit from reduced storage requirements.
 Enabling lossy compression for textures that can tolerate some precision loss will guarantee both reduced bandwidth usage and reduced storage requirements.
 The amount of precision loss depends on the color values stored; regions with correlated color values can be represented with limited to no precision loss, whereas regions with unrelated color values suffer more precision loss.
 Enabling lossy compression requires both storageMode == MTLStorageModePrivate, allowGPUOptimizedContents == YES, and cannot be combined with either MTLTextureUsagePixelFormatView, MTLTextureUsageShaderWrite, MTLTextureUsageShaderAtomic, MTLTextureType1D(Array) or MTLTextureTypeTextureBuffer.
 Moreover, not all MTLPixelFormat are supported with lossy compression, verify that the MTLDevice's GPU family supports the lossy compression feature for the pixelFormat requested.
 Set allowGPUOptimizedContents to NO to opt out of both lossless and lossy compression; such textures do not benefit from either reduced bandwidth usage or reduced storage requirements, but have predictable CPU readback performance.
 */
    compressionType :: (self: *MTLTextureDescriptor) -> MTLTextureCompressionType {
        func: #type (obj: *void, selector: *void) -> MTLTextureCompressionType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.compressionType);
    }

    setCompressionType_ :: (self: *MTLTextureDescriptor, compressionType: MTLTextureCompressionType) -> void {
        func: #type (obj: *void, selector: *void, compressionType: MTLTextureCompressionType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCompressionType_, compressionType);
    }

/*!
 @property swizzle
 @abstract Channel swizzle to use when reading or sampling from the texture, the default value is MTLTextureSwizzleChannelsDefault.
 */
    swizzle :: (self: *MTLTextureDescriptor) -> MTLTextureSwizzleChannels {
        func: #type (obj: *void, selector: *void) -> MTLTextureSwizzleChannels #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.swizzle);
    }

    setSwizzle_ :: (self: *MTLTextureDescriptor, swizzle: MTLTextureSwizzleChannels) -> void {
        func: #type (obj: *void, selector: *void, swizzle: MTLTextureSwizzleChannels) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSwizzle_, swizzle);
    }

/// Determines the page size for a placement sparse texture.
///
/// Set this property to a non-zero value to create a *placement sparse texture*.
///
/// Placement sparse textures are instances of ``MTLTexture`` that you assign memory to using a ``MTLHeap`` instance
/// of type ``MTLHeapType/MTLHeapTypePlacement`` and a ``MTLHeapDescriptor/maxCompatiblePlacementSparsePageSize``
/// at least as large as the ``MTLSparsePageSize`` value you assign to this property.
///
/// This value is 0 by default.
    placementSparsePageSize :: (self: *MTLTextureDescriptor) -> MTLSparsePageSize {
        func: #type (obj: *void, selector: *void) -> MTLSparsePageSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.placementSparsePageSize);
    }

    setPlacementSparsePageSize_ :: (self: *MTLTextureDescriptor, placementSparsePageSize: MTLSparsePageSize) -> void {
        func: #type (obj: *void, selector: *void, placementSparsePageSize: MTLSparsePageSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPlacementSparsePageSize_, placementSparsePageSize);
    }

}

MTLTextureViewDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @property pixelFormat
 @abstract A desired pixel format of a texture view.
 */
    pixelFormat :: (self: *MTLTextureViewDescriptor) -> MTLPixelFormat {
        func: #type (obj: *void, selector: *void) -> MTLPixelFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pixelFormat);
    }

    setPixelFormat_ :: (self: *MTLTextureViewDescriptor, pixelFormat: MTLPixelFormat) -> void {
        func: #type (obj: *void, selector: *void, pixelFormat: MTLPixelFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPixelFormat_, pixelFormat);
    }

/*!
 @property textureType
 @abstract A desired texture view of a texture view.
 */
    textureType :: (self: *MTLTextureViewDescriptor) -> MTLTextureType {
        func: #type (obj: *void, selector: *void) -> MTLTextureType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.textureType);
    }

    setTextureType_ :: (self: *MTLTextureViewDescriptor, textureType: MTLTextureType) -> void {
        func: #type (obj: *void, selector: *void, textureType: MTLTextureType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTextureType_, textureType);
    }

/*!
 @property levelRange
 @abstract A desired range of mip levels of a texture view.
 */
    levelRange :: (self: *MTLTextureViewDescriptor) -> NSRange {
        func: #type (obj: *void, selector: *void) -> NSRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.levelRange);
    }

    setLevelRange_ :: (self: *MTLTextureViewDescriptor, levelRange: NSRange) -> void {
        func: #type (obj: *void, selector: *void, levelRange: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLevelRange_, levelRange);
    }

/*!
 @property sliceRange
 @abstract A desired range of slices of a texture view.
 */
    sliceRange :: (self: *MTLTextureViewDescriptor) -> NSRange {
        func: #type (obj: *void, selector: *void) -> NSRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sliceRange);
    }

    setSliceRange_ :: (self: *MTLTextureViewDescriptor, sliceRange: NSRange) -> void {
        func: #type (obj: *void, selector: *void, sliceRange: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSliceRange_, sliceRange);
    }

/*!
 @property swizzle
 @abstract A desired swizzle format of a texture view.
 */
    swizzle :: (self: *MTLTextureViewDescriptor) -> MTLTextureSwizzleChannels {
        func: #type (obj: *void, selector: *void) -> MTLTextureSwizzleChannels #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.swizzle);
    }

    setSwizzle_ :: (self: *MTLTextureViewDescriptor, swizzle: MTLTextureSwizzleChannels) -> void {
        func: #type (obj: *void, selector: *void, swizzle: MTLTextureSwizzleChannels) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSwizzle_, swizzle);
    }

}

MTLType :: struct #type_info_none {
    nsobject: *NSObject;
    dataType :: (self: *MTLType) -> MTLDataType {
        func: #type (obj: *void, selector: *void) -> MTLDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dataType);
    }

}

MTLStructMember :: struct #type_info_none {
    nsobject: *NSObject;
    structType :: (self: *MTLStructMember) -> *MTLStructType {
        func: #type (obj: *void, selector: *void) -> *MTLStructType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.structType);
    }

    arrayType :: (self: *MTLStructMember) -> *MTLArrayType {
        func: #type (obj: *void, selector: *void) -> *MTLArrayType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.arrayType);
    }

    textureReferenceType :: (self: *MTLStructMember) -> *MTLTextureReferenceType {
        func: #type (obj: *void, selector: *void) -> *MTLTextureReferenceType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.textureReferenceType);
    }

    pointerType :: (self: *MTLStructMember) -> *MTLPointerType {
        func: #type (obj: *void, selector: *void) -> *MTLPointerType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pointerType);
    }

/// Provides a description of the underlying tensor type when this struct member holds a tensor.
///
/// - Returns: A description of the tensor type that this struct member holds, or `nil` if this struct member doesn't hold a tensor.
    tensorReferenceType :: (self: *MTLStructMember) -> *MTLTensorReferenceType {
        func: #type (obj: *void, selector: *void) -> *MTLTensorReferenceType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tensorReferenceType);
    }

    name :: (self: *MTLStructMember) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

    offset :: (self: *MTLStructMember) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.offset);
    }

    dataType :: (self: *MTLStructMember) -> MTLDataType {
        func: #type (obj: *void, selector: *void) -> MTLDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dataType);
    }

    argumentIndex :: (self: *MTLStructMember) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.argumentIndex);
    }

}

MTLStructType :: struct #type_info_none {
    nsobject: *NSObject;
    memberByName_ :: (self: *MTLStructType, name: *NSString) -> *MTLStructMember {
        func: #type (obj: *void, selector: *void, name: *NSString) -> *MTLStructMember #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.memberByName_, name);
    }

    members :: (self: *MTLStructType) -> *NSArray(*MTLStructMember) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLStructMember) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.members);
    }

}

MTLArrayType :: struct #type_info_none {
    nsobject: *NSObject;
    elementStructType :: (self: *MTLArrayType) -> *MTLStructType {
        func: #type (obj: *void, selector: *void) -> *MTLStructType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.elementStructType);
    }

    elementArrayType :: (self: *MTLArrayType) -> *MTLArrayType {
        func: #type (obj: *void, selector: *void) -> *MTLArrayType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.elementArrayType);
    }

    elementTextureReferenceType :: (self: *MTLArrayType) -> *MTLTextureReferenceType {
        func: #type (obj: *void, selector: *void) -> *MTLTextureReferenceType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.elementTextureReferenceType);
    }

    elementPointerType :: (self: *MTLArrayType) -> *MTLPointerType {
        func: #type (obj: *void, selector: *void) -> *MTLPointerType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.elementPointerType);
    }

/// Provides a description of the underlying tensor type when this array holds tensors as its elements.
///
/// - Returns: A description of the tensor type that this array holds, or `nil` if this struct member doesn't hold a tensor.
    elementTensorReferenceType :: (self: *MTLArrayType) -> *MTLTensorReferenceType {
        func: #type (obj: *void, selector: *void) -> *MTLTensorReferenceType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.elementTensorReferenceType);
    }

    elementType :: (self: *MTLArrayType) -> MTLDataType {
        func: #type (obj: *void, selector: *void) -> MTLDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.elementType);
    }

    arrayLength :: (self: *MTLArrayType) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.arrayLength);
    }

    stride :: (self: *MTLArrayType) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stride);
    }

    argumentIndexStride :: (self: *MTLArrayType) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.argumentIndexStride);
    }

}

MTLPointerType :: struct #type_info_none {
    nsobject: *NSObject;
    elementStructType :: (self: *MTLPointerType) -> *MTLStructType {
        func: #type (obj: *void, selector: *void) -> *MTLStructType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.elementStructType);
    }

    elementArrayType :: (self: *MTLPointerType) -> *MTLArrayType {
        func: #type (obj: *void, selector: *void) -> *MTLArrayType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.elementArrayType);
    }

// MTLDataTypeFloat, MTLDataTypeFloat4, MTLDataTypeStruct, ...
    elementType :: (self: *MTLPointerType) -> MTLDataType {
        func: #type (obj: *void, selector: *void) -> MTLDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.elementType);
    }

    access :: (self: *MTLPointerType) -> MTLBindingAccess {
        func: #type (obj: *void, selector: *void) -> MTLBindingAccess #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.access);
    }

// min alignment for the element data
    alignment :: (self: *MTLPointerType) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.alignment);
    }

// sizeof(T) for T *argName
    dataSize :: (self: *MTLPointerType) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dataSize);
    }

    elementIsArgumentBuffer :: (self: *MTLPointerType) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.elementIsArgumentBuffer);
    }

}

MTLTextureReferenceType :: struct #type_info_none {
    nsobject: *NSObject;
// half, float, int, or uint.
    textureDataType :: (self: *MTLTextureReferenceType) -> MTLDataType {
        func: #type (obj: *void, selector: *void) -> MTLDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.textureDataType);
    }

// texture1D, texture2D...
    textureType :: (self: *MTLTextureReferenceType) -> MTLTextureType {
        func: #type (obj: *void, selector: *void) -> MTLTextureType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.textureType);
    }

// read, write, read-write
    access :: (self: *MTLTextureReferenceType) -> MTLBindingAccess {
        func: #type (obj: *void, selector: *void) -> MTLBindingAccess #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.access);
    }

// true for depth textures
    isDepthTexture :: (self: *MTLTextureReferenceType) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isDepthTexture);
    }

}

/// An object that represents a tensor in the shading language in a struct or array.
MTLTensorReferenceType :: struct #type_info_none {
    nsobject: *NSObject;
/// The underlying data format of the tensor.
    tensorDataType :: (self: *MTLTensorReferenceType) -> MTLTensorDataType {
        func: #type (obj: *void, selector: *void) -> MTLTensorDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tensorDataType);
    }

/// The data format you use for indexing into the tensor.
    indexType :: (self: *MTLTensorReferenceType) -> MTLDataType {
        func: #type (obj: *void, selector: *void) -> MTLDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexType);
    }

/// The array of sizes, in elements, one for each dimension of this tensor.
///
/// Because shader-bound tensors have dynamic extents, the ``MTLTensorExtents/rank`` of `dimensions` corresponds to the rank the shader function specifies, and ``MTLTensorExtents/extentsAtDimensionIndex:`` always returns a value of -1.
    dimensions :: (self: *MTLTensorReferenceType) -> *MTLTensorExtents {
        func: #type (obj: *void, selector: *void) -> *MTLTensorExtents #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dimensions);
    }

/// A value that represents the read/write permissions of the tensor.
    access :: (self: *MTLTensorReferenceType) -> MTLBindingAccess {
        func: #type (obj: *void, selector: *void) -> MTLBindingAccess #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.access);
    }

}

/*!
 MTLArgument
*/
MTLArgument :: struct #type_info_none {
    nsobject: *NSObject;
    name :: (self: *MTLArgument) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

    type :: (self: *MTLArgument) -> MTLArgumentType {
        func: #type (obj: *void, selector: *void) -> MTLArgumentType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.type);
    }

    access :: (self: *MTLArgument) -> MTLBindingAccess {
        func: #type (obj: *void, selector: *void) -> MTLBindingAccess #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.access);
    }

    index :: (self: *MTLArgument) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.index);
    }

    isActive :: (self: *MTLArgument) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isActive);
    }

// min alignment of starting offset in the buffer
    bufferAlignment :: (self: *MTLArgument) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bufferAlignment);
    }

// sizeof(T) for T *argName
    bufferDataSize :: (self: *MTLArgument) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bufferDataSize);
    }

// MTLDataTypeFloat, MTLDataTypeFloat4, MTLDataTypeStruct, ...
    bufferDataType :: (self: *MTLArgument) -> MTLDataType {
        func: #type (obj: *void, selector: *void) -> MTLDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bufferDataType);
    }

    bufferStructType :: (self: *MTLArgument) -> *MTLStructType {
        func: #type (obj: *void, selector: *void) -> *MTLStructType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bufferStructType);
    }

    bufferPointerType :: (self: *MTLArgument) -> *MTLPointerType {
        func: #type (obj: *void, selector: *void) -> *MTLPointerType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bufferPointerType);
    }

// for threadgroup memory arguments
    threadgroupMemoryAlignment :: (self: *MTLArgument) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.threadgroupMemoryAlignment);
    }

// sizeof(T) for T *argName
    threadgroupMemoryDataSize :: (self: *MTLArgument) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.threadgroupMemoryDataSize);
    }

// texture1D, texture2D...
    textureType :: (self: *MTLArgument) -> MTLTextureType {
        func: #type (obj: *void, selector: *void) -> MTLTextureType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.textureType);
    }

// half, float, int, or uint.
    textureDataType :: (self: *MTLArgument) -> MTLDataType {
        func: #type (obj: *void, selector: *void) -> MTLDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.textureDataType);
    }

// true for depth textures
    isDepthTexture :: (self: *MTLArgument) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isDepthTexture);
    }

    arrayLength :: (self: *MTLArgument) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.arrayLength);
    }

}

MTLFunctionConstantValues :: struct #type_info_none {
    nsobject: *NSObject;
// using indices
    setConstantValue_type_atIndex_ :: (self: *MTLFunctionConstantValues, value: *void, type: MTLDataType, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, value: *void, type: MTLDataType, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setConstantValue_type_atIndex_, value, type, index);
    }

    setConstantValues_type_withRange_ :: (self: *MTLFunctionConstantValues, values: *void, type: MTLDataType, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, values: *void, type: MTLDataType, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setConstantValues_type_withRange_, values, type, range);
    }

// using names
    setConstantValue_type_withName_ :: (self: *MTLFunctionConstantValues, value: *void, type: MTLDataType, name: *NSString) -> void {
        func: #type (obj: *void, selector: *void, value: *void, type: MTLDataType, name: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setConstantValue_type_withName_, value, type, name);
    }

// delete all the constants
    reset :: (self: *MTLFunctionConstantValues) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

}

MTLFunctionDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @method functionDescriptor
 @abstract Create an autoreleased function descriptor
 */
    functionDescriptor :: () -> *MTLFunctionDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLFunctionDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLFunctionDescriptor"), __sel.functionDescriptor);
    }

/*!
* @property name
* @abstract The name of the `visible` function to find.
*/
    name :: (self: *MTLFunctionDescriptor) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

    setName_ :: (self: *MTLFunctionDescriptor, name: *NSString) -> void {
        func: #type (obj: *void, selector: *void, name: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setName_, name);
    }

/*!
* @property specializedName
* @abstract An optional new name for a `visible` function to allow reuse with different specializations.
*/
    specializedName :: (self: *MTLFunctionDescriptor) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.specializedName);
    }

    setSpecializedName_ :: (self: *MTLFunctionDescriptor, specializedName: *NSString) -> void {
        func: #type (obj: *void, selector: *void, specializedName: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSpecializedName_, specializedName);
    }

/*!
* @property constantValues
* @abstract The set of constant values assigned to the function constants. Compilation fails if you do not provide valid constant values for all required function constants.
*/
    constantValues :: (self: *MTLFunctionDescriptor) -> *MTLFunctionConstantValues {
        func: #type (obj: *void, selector: *void) -> *MTLFunctionConstantValues #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.constantValues);
    }

    setConstantValues_ :: (self: *MTLFunctionDescriptor, constantValues: *MTLFunctionConstantValues) -> void {
        func: #type (obj: *void, selector: *void, constantValues: *MTLFunctionConstantValues) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setConstantValues_, constantValues);
    }

/*!
* @property options
* @abstract The options to use for this new `MTLFunction`.
*/
    options :: (self: *MTLFunctionDescriptor) -> MTLFunctionOptions {
        func: #type (obj: *void, selector: *void) -> MTLFunctionOptions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.options);
    }

    setOptions_ :: (self: *MTLFunctionDescriptor, options: MTLFunctionOptions) -> void {
        func: #type (obj: *void, selector: *void, options: MTLFunctionOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOptions_, options);
    }

/*!
@property binaryArchives
@abstract The array of archives to be searched.
@discussion Binary archives to be searched for precompiled functions during the compilation of this function.
*/
    binaryArchives :: (self: *MTLFunctionDescriptor) -> *NSArray(*MTLBinaryArchive) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLBinaryArchive) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.binaryArchives);
    }

    setBinaryArchives_ :: (self: *MTLFunctionDescriptor, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void {
        func: #type (obj: *void, selector: *void, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBinaryArchives_, binaryArchives);
    }

}

MTLIntersectionFunctionDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
}

MTLVertexAttribute :: struct #type_info_none {
    nsobject: *NSObject;
    name :: (self: *MTLVertexAttribute) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

    attributeIndex :: (self: *MTLVertexAttribute) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.attributeIndex);
    }

    attributeType :: (self: *MTLVertexAttribute) -> MTLDataType {
        func: #type (obj: *void, selector: *void) -> MTLDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.attributeType);
    }

    isActive :: (self: *MTLVertexAttribute) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isActive);
    }

    isPatchData :: (self: *MTLVertexAttribute) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isPatchData);
    }

    isPatchControlPointData :: (self: *MTLVertexAttribute) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isPatchControlPointData);
    }

}

MTLAttribute :: struct #type_info_none {
    nsobject: *NSObject;
    name :: (self: *MTLAttribute) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

    attributeIndex :: (self: *MTLAttribute) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.attributeIndex);
    }

    attributeType :: (self: *MTLAttribute) -> MTLDataType {
        func: #type (obj: *void, selector: *void) -> MTLDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.attributeType);
    }

    isActive :: (self: *MTLAttribute) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isActive);
    }

    isPatchData :: (self: *MTLAttribute) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isPatchData);
    }

    isPatchControlPointData :: (self: *MTLAttribute) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isPatchControlPointData);
    }

}

/*!
 @interface MTLFunctionConstant
 @abstract describe an uberShader constant used by the function
 */
MTLFunctionConstant :: struct #type_info_none {
    nsobject: *NSObject;
    name :: (self: *MTLFunctionConstant) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

    type :: (self: *MTLFunctionConstant) -> MTLDataType {
        func: #type (obj: *void, selector: *void) -> MTLDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.type);
    }

    index :: (self: *MTLFunctionConstant) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.index);
    }

    required :: (self: *MTLFunctionConstant) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.required);
    }

}

MTLCompileOptions :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @property preprocessorNames
 @abstract List of preprocessor macros to consider to when compiling this program. Specified as key value pairs, using a NSDictionary. The keys must be NSString objects and values can be either NSString or NSNumber objects.
 @discussion The default value is nil.
 */
    preprocessorMacros :: (self: *MTLCompileOptions) -> *NSDictionary(*NSString, *NSObject) {
        func: #type (obj: *void, selector: *void) -> *NSDictionary(*NSString, *NSObject) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.preprocessorMacros);
    }

    setPreprocessorMacros_ :: (self: *MTLCompileOptions, preprocessorMacros: *NSDictionary(*NSString, *NSObject)) -> void {
        func: #type (obj: *void, selector: *void, preprocessorMacros: *NSDictionary(*NSString, *NSObject)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPreprocessorMacros_, preprocessorMacros);
    }

/*!
 @property fastMathEnabled
 @abstract If YES, enables the compiler to perform optimizations for floating-point arithmetic that may violate the IEEE 754 standard. It also enables the high precision variant of math functions for single precision floating-point scalar and vector types. fastMathEnabled defaults to YES.
 */
    fastMathEnabled :: (self: *MTLCompileOptions) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fastMathEnabled);
    }

    setFastMathEnabled_ :: (self: *MTLCompileOptions, fastMathEnabled: BOOL) -> void {
        func: #type (obj: *void, selector: *void, fastMathEnabled: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFastMathEnabled_, fastMathEnabled);
    }

/*!
 @property mathMode
 @abstract Sets the floating-point arithmetic optimizations. Default depends on the language standard version.
 */
    mathMode :: (self: *MTLCompileOptions) -> MTLMathMode {
        func: #type (obj: *void, selector: *void) -> MTLMathMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.mathMode);
    }

    setMathMode_ :: (self: *MTLCompileOptions, mathMode: MTLMathMode) -> void {
        func: #type (obj: *void, selector: *void, mathMode: MTLMathMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMathMode_, mathMode);
    }

/*!
 @property mathFloatingPointFunctions
 @abstract Sets the default math functions for single precision floating-point. Default is `MTLMathFloatingPointFunctionsFast`.
 */
    mathFloatingPointFunctions :: (self: *MTLCompileOptions) -> MTLMathFloatingPointFunctions {
        func: #type (obj: *void, selector: *void) -> MTLMathFloatingPointFunctions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.mathFloatingPointFunctions);
    }

    setMathFloatingPointFunctions_ :: (self: *MTLCompileOptions, mathFloatingPointFunctions: MTLMathFloatingPointFunctions) -> void {
        func: #type (obj: *void, selector: *void, mathFloatingPointFunctions: MTLMathFloatingPointFunctions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMathFloatingPointFunctions_, mathFloatingPointFunctions);
    }

/*!
 @property languageVersion
 @abstract set the metal language version used to interpret the source.
 */
    languageVersion :: (self: *MTLCompileOptions) -> MTLLanguageVersion {
        func: #type (obj: *void, selector: *void) -> MTLLanguageVersion #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.languageVersion);
    }

    setLanguageVersion_ :: (self: *MTLCompileOptions, languageVersion: MTLLanguageVersion) -> void {
        func: #type (obj: *void, selector: *void, languageVersion: MTLLanguageVersion) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLanguageVersion_, languageVersion);
    }

/*!
 @property type
 @abstract Which type the library should be compiled as. The default value is MTLLibraryTypeExecutable.
 @discussion MTLLibraryTypeExecutable is suitable to build a library of "kernel", "vertex" and "fragment" qualified functions.
 MTLLibraryType is suitable when the compilation result will instead be used to instantiate a MTLDynamicLibrary.
 MTLDynamicLibrary contains no qualified functions, but it's unqualified functions and variables can be used as an external dependency for compiling other libraries.
*/
    libraryType :: (self: *MTLCompileOptions) -> MTLLibraryType {
        func: #type (obj: *void, selector: *void) -> MTLLibraryType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.libraryType);
    }

    setLibraryType_ :: (self: *MTLCompileOptions, libraryType: MTLLibraryType) -> void {
        func: #type (obj: *void, selector: *void, libraryType: MTLLibraryType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLibraryType_, libraryType);
    }

/*!
 @property installName
 @abstract The install name of this dynamic library.
 @discussion The install name is used when a pipeline state is created that depends, directly or indirectly, on a dynamic library.
 The installName is embedded into any other MTLLibrary that links against the compilation result.
 This property should be set such that the dynamic library can be found in the file system at the time a pipeline state is created.
 Specify one of:
 - an absolute path to a file from which the dynamic library can be loaded, or
 - a path relative to \@executable_path, where \@executable_path is substituted with the directory name from which the MTLLibrary containing the MTLFunction entrypoint used to create the pipeline state is loaded, or
 - a path relative to \@loader_path, where \@loader_path is substituted with the directory name from which the MTLLibrary with the reference to this installName embedded is loaded.
 The first is appropriate for MTLDynamicLibrary written to the file-system using its serializeToURL:error: method on the current device.
 The others are appropriate when the MTLDynamicLibrary is installed as part of a bundle or app, where the absolute path is not known.
 This property is ignored when the type property is not set to MTLLibraryTypeDynamic.
 This propery should not be null if the property type is set to MTLLibraryTypeDynamic: the compilation will fail in that scenario.
 */
    installName :: (self: *MTLCompileOptions) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.installName);
    }

    setInstallName_ :: (self: *MTLCompileOptions, installName: *NSString) -> void {
        func: #type (obj: *void, selector: *void, installName: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstallName_, installName);
    }

/*!
 @property libraries
 @abstract A set of MTLDynamicLibrary instances to link against.
 The installName of the provided MTLDynamicLibrary is embedded into the compilation result.
 When a function from the resulting MTLLibrary is used (either as an MTLFunction, or as an to create a pipeline state, the embedded install names are used to automatically load the MTLDynamicLibrary instances.
 This property can be null if no libraries should be automatically loaded, either because the MTLLibrary has no external dependencies, or because you will use preloadedLibraries to specify the libraries to use at pipeline creation time.
*/
    libraries :: (self: *MTLCompileOptions) -> *NSArray(*MTLDynamicLibrary) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLDynamicLibrary) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.libraries);
    }

    setLibraries_ :: (self: *MTLCompileOptions, libraries: *NSArray(*MTLDynamicLibrary)) -> void {
        func: #type (obj: *void, selector: *void, libraries: *NSArray(*MTLDynamicLibrary)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLibraries_, libraries);
    }

/*!
 @property preserveInvariance
 @abstract If YES,  set the compiler to compile shaders to preserve invariance.  The default is false.
 */
    preserveInvariance :: (self: *MTLCompileOptions) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.preserveInvariance);
    }

    setPreserveInvariance_ :: (self: *MTLCompileOptions, preserveInvariance: BOOL) -> void {
        func: #type (obj: *void, selector: *void, preserveInvariance: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPreserveInvariance_, preserveInvariance);
    }

/*!
 @property optimizationLevel
 @abstract Sets the compiler optimization level.
 */
    optimizationLevel :: (self: *MTLCompileOptions) -> MTLLibraryOptimizationLevel {
        func: #type (obj: *void, selector: *void) -> MTLLibraryOptimizationLevel #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.optimizationLevel);
    }

    setOptimizationLevel_ :: (self: *MTLCompileOptions, optimizationLevel: MTLLibraryOptimizationLevel) -> void {
        func: #type (obj: *void, selector: *void, optimizationLevel: MTLLibraryOptimizationLevel) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOptimizationLevel_, optimizationLevel);
    }

/*!
@property
@abstract Adds a compiler command to force the default visibility of symbols to be hidden
*/
    compileSymbolVisibility :: (self: *MTLCompileOptions) -> MTLCompileSymbolVisibility {
        func: #type (obj: *void, selector: *void) -> MTLCompileSymbolVisibility #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.compileSymbolVisibility);
    }

    setCompileSymbolVisibility_ :: (self: *MTLCompileOptions, compileSymbolVisibility: MTLCompileSymbolVisibility) -> void {
        func: #type (obj: *void, selector: *void, compileSymbolVisibility: MTLCompileSymbolVisibility) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCompileSymbolVisibility_, compileSymbolVisibility);
    }

/*!
@property allowReferencingUndefinedSymbols
@abstract Adds a compiler command to allow the reference of undefined symbols
*/
    allowReferencingUndefinedSymbols :: (self: *MTLCompileOptions) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.allowReferencingUndefinedSymbols);
    }

    setAllowReferencingUndefinedSymbols_ :: (self: *MTLCompileOptions, allowReferencingUndefinedSymbols: BOOL) -> void {
        func: #type (obj: *void, selector: *void, allowReferencingUndefinedSymbols: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAllowReferencingUndefinedSymbols_, allowReferencingUndefinedSymbols);
    }

/*!
@property maxTotalThreadsPerThreadgroup
@abstract Adds a compiler command to specify the total threads per threadgroup
*/
    maxTotalThreadsPerThreadgroup :: (self: *MTLCompileOptions) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadsPerThreadgroup);
    }

    setMaxTotalThreadsPerThreadgroup_ :: (self: *MTLCompileOptions, maxTotalThreadsPerThreadgroup: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxTotalThreadsPerThreadgroup: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxTotalThreadsPerThreadgroup_, maxTotalThreadsPerThreadgroup);
    }

/*!
 @property requiredThreadsPerThreadgroup
 @abstract Sets the required threads-per-threadgroup during dispatches. The `threadsPerThreadgroup` argument of any dispatch must match this value if it is set.
           Setting this to a size of 0 in every dimension disables this property
*/
    requiredThreadsPerThreadgroup :: (self: *MTLCompileOptions) -> MTLSize {
        func: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.requiredThreadsPerThreadgroup);
    }

    setRequiredThreadsPerThreadgroup_ :: (self: *MTLCompileOptions, requiredThreadsPerThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, requiredThreadsPerThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRequiredThreadsPerThreadgroup_, requiredThreadsPerThreadgroup);
    }

/*!
 @property enableLogging
 @abstract If YES,  set the compiler to enable any logging in the shader. The default is false.
 */
    enableLogging :: (self: *MTLCompileOptions) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.enableLogging);
    }

    setEnableLogging_ :: (self: *MTLCompileOptions, enableLogging: BOOL) -> void {
        func: #type (obj: *void, selector: *void, enableLogging: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setEnableLogging_, enableLogging);
    }

}

/// Represents a reflection object containing information about a function in a Metal library.
MTLFunctionReflection :: struct #type_info_none {
    nsobject: *NSObject;
/// Provides a list of inputs and outputs of the function.
    bindings :: (self: *MTLFunctionReflection) -> *NSArray(*MTLBinding) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLBinding) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bindings);
    }

/// The string passed to the user annotation attribute for this function. Null if no user annotation is present for this function.
    userAnnotation :: (self: *MTLFunctionReflection) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.userAnnotation);
    }

}

/*!
 @interface MTLCounterSampleBufferDescriptor
 @abstract Object to represent the counter state.
 */
MTLCounterSampleBufferDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @property counterSet The counterset to be sampled for this counter sample buffer
 */
    counterSet :: (self: *MTLCounterSampleBufferDescriptor) -> *MTLCounterSet {
        func: #type (obj: *void, selector: *void) -> *MTLCounterSet #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.counterSet);
    }

    setCounterSet_ :: (self: *MTLCounterSampleBufferDescriptor, counterSet: *MTLCounterSet) -> void {
        func: #type (obj: *void, selector: *void, counterSet: *MTLCounterSet) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCounterSet_, counterSet);
    }

/*!
 @property label A label to identify the sample buffer in debugging tools.
 */
    label :: (self: *MTLCounterSampleBufferDescriptor) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLCounterSampleBufferDescriptor, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

/*!
 @property storageMode The storage mode for the sample buffer.  Only
 MTLStorageModeShared and MTLStorageModePrivate may be used.
 */
    storageMode :: (self: *MTLCounterSampleBufferDescriptor) -> MTLStorageMode {
        func: #type (obj: *void, selector: *void) -> MTLStorageMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.storageMode);
    }

    setStorageMode_ :: (self: *MTLCounterSampleBufferDescriptor, storageMode: MTLStorageMode) -> void {
        func: #type (obj: *void, selector: *void, storageMode: MTLStorageMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStorageMode_, storageMode);
    }

/*!
 @property sampleCount The number of samples that may be stored in the
 counter sample buffer.
 */
    sampleCount :: (self: *MTLCounterSampleBufferDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleCount);
    }

    setSampleCount_ :: (self: *MTLCounterSampleBufferDescriptor, sampleCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSampleCount_, sampleCount);
    }

}

/// Groups together properties for creating a compiler context.
MTL4CompilerDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Assigns an optional descriptor label to the compiler for debugging purposes.
    label :: (self: *MTL4CompilerDescriptor) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTL4CompilerDescriptor, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

/// Assigns a pipeline data set serializer into which this compiler stores data for all pipelines it creates.
    pipelineDataSetSerializer :: (self: *MTL4CompilerDescriptor) -> *MTL4PipelineDataSetSerializer {
        func: #type (obj: *void, selector: *void) -> *MTL4PipelineDataSetSerializer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pipelineDataSetSerializer);
    }

    setPipelineDataSetSerializer_ :: (self: *MTL4CompilerDescriptor, pipelineDataSetSerializer: *MTL4PipelineDataSetSerializer) -> void {
        func: #type (obj: *void, selector: *void, pipelineDataSetSerializer: *MTL4PipelineDataSetSerializer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPipelineDataSetSerializer_, pipelineDataSetSerializer);
    }

}

/// The configuration options that control the behavior of a compilation task for a Metal 4 compiler instance.
///
/// You can configure task-specific settings that affect a compilation task by
/// creating an instance of this class, setting its properties,
/// and passing it to one of the applicable methods of an ``MTL4Compiler`` instance.
MTL4CompilerTaskOptions :: struct #type_info_none {
    nsobject: *NSObject;
/// An array of archive instances that can potentially accelerate a compilation task.
///
/// The compiler can reduce the runtime of a compilation task if it finds an entry
/// that matches a function description within any of the archives in this array.
/// The compiler searches the archives in the order of the array's element.
///
/// Consider adding archives to the array in scenarios that can benefit from the runtime savings,
/// such as repeat builds or when your app can share compilation results across multiple contexts.
///
/// - Important: Only add ``MTL4Archive`` instances to the array that are compatible with the Metal device.
    lookupArchives :: (self: *MTL4CompilerTaskOptions) -> *NSArray(*MTL4Archive) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTL4Archive) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.lookupArchives);
    }

    setLookupArchives_ :: (self: *MTL4CompilerTaskOptions, lookupArchives: *NSArray(*MTL4Archive)) -> void {
        func: #type (obj: *void, selector: *void, lookupArchives: *NSArray(*MTL4Archive)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLookupArchives_, lookupArchives);
    }

}

/// Groups together parameters for configuring a counter heap object at creation time.
MTL4CounterHeapDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Assigns the type of data that the heap contains.
    type :: (self: *MTL4CounterHeapDescriptor) -> MTL4CounterHeapType {
        func: #type (obj: *void, selector: *void) -> MTL4CounterHeapType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.type);
    }

    setType_ :: (self: *MTL4CounterHeapDescriptor, type: MTL4CounterHeapType) -> void {
        func: #type (obj: *void, selector: *void, type: MTL4CounterHeapType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setType_, type);
    }

/// Assigns the number of entries in the heap.
///
/// Each entry represents one item in the heap. The size of the individual entries depends on the heap type.
    count :: (self: *MTL4CounterHeapDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.count);
    }

    setCount_ :: (self: *MTL4CounterHeapDescriptor, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCount_, count);
    }

}

/*!
 * @class MTLArgumentDescriptor
 * @abstract Represents a member of an argument buffer
 */
MTLArgumentDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 * @method argumentDescriptor
 * @abstract Create an autoreleased default argument descriptor
 */
    argumentDescriptor :: () -> *MTLArgumentDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLArgumentDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLArgumentDescriptor"), __sel.argumentDescriptor);
    }

/*!
 * @property dataType
 * @abstract For constants, the data type. Otherwise, MTLDataTypeTexture, MTLDataTypeSampler, or
 * MTLDataTypePointer.
 */
    dataType :: (self: *MTLArgumentDescriptor) -> MTLDataType {
        func: #type (obj: *void, selector: *void) -> MTLDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dataType);
    }

    setDataType_ :: (self: *MTLArgumentDescriptor, dataType: MTLDataType) -> void {
        func: #type (obj: *void, selector: *void, dataType: MTLDataType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDataType_, dataType);
    }

/*!
 * @property index
 * @abstract The binding point index of the argument
 */
    index :: (self: *MTLArgumentDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.index);
    }

    setIndex_ :: (self: *MTLArgumentDescriptor, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndex_, index);
    }

/*!
 * @property arrayLength
 * @abstract The length of an array of constants, textures, or samplers, or 0 for non-array arguments
 */
    arrayLength :: (self: *MTLArgumentDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.arrayLength);
    }

    setArrayLength_ :: (self: *MTLArgumentDescriptor, arrayLength: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, arrayLength: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setArrayLength_, arrayLength);
    }

/*!
 * @property access
 * @abstract Access flags for the argument
 */
    access :: (self: *MTLArgumentDescriptor) -> MTLBindingAccess {
        func: #type (obj: *void, selector: *void) -> MTLBindingAccess #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.access);
    }

    setAccess_ :: (self: *MTLArgumentDescriptor, access: MTLBindingAccess) -> void {
        func: #type (obj: *void, selector: *void, access: MTLBindingAccess) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAccess_, access);
    }

/*!
 * @property textureType
 * @abstract For texture arguments, the texture type
 */
    textureType :: (self: *MTLArgumentDescriptor) -> MTLTextureType {
        func: #type (obj: *void, selector: *void) -> MTLTextureType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.textureType);
    }

    setTextureType_ :: (self: *MTLArgumentDescriptor, textureType: MTLTextureType) -> void {
        func: #type (obj: *void, selector: *void, textureType: MTLTextureType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTextureType_, textureType);
    }

/*!
 @property constantBlockAlignment
 @abstract if set forces the constant block to be aligned to the given alignment
 @discussion Should only be set on the first constant of the block and is only valid if a corresponding
     explicit "alignas" is applied to the constant in the metal shader language.
 */
    constantBlockAlignment :: (self: *MTLArgumentDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.constantBlockAlignment);
    }

    setConstantBlockAlignment_ :: (self: *MTLArgumentDescriptor, constantBlockAlignment: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, constantBlockAlignment: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setConstantBlockAlignment_, constantBlockAlignment);
    }

}

/*!
 @class MTLArchitecture
 @abstract Contains information about the device's architecture
 */
MTLArchitecture :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @property name
 @abstract The device's architecture name.
 */
    name :: (self: *MTLArchitecture) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

}

MTLResourceStatePassSampleBufferAttachmentDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
@property sampleBuffer
@abstract The sample buffer to store samples for the resourceState-pass defined samples.
If sampleBuffer is non-nil, the sample indices will be used to store samples into
the sample buffer.  If no sample buffer is provided, no samples will be taken.
If any of the sample indices are specified as MTLCounterDontSample, no sample
will be taken for that action.
*/
    sampleBuffer :: (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor) -> *MTLCounterSampleBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLCounterSampleBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleBuffer);
    }

    setSampleBuffer_ :: (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor, sampleBuffer: *MTLCounterSampleBuffer) -> void {
        func: #type (obj: *void, selector: *void, sampleBuffer: *MTLCounterSampleBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSampleBuffer_, sampleBuffer);
    }

/*!
 @property startOfEncoderSampleIndex
 @abstract The sample index to use to store the sample taken at the start of
 command encoder processing.  Setting the value to MTLCounterDontSample will cause
 this sample to be omitted.
 @discussion On devices where MTLCounterSamplingPointAtStageBoundary is unsupported,
 this sample index is invalid and must be set to MTLCounterDontSample or creation of a resourceState pass will fail.
 */
    startOfEncoderSampleIndex :: (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.startOfEncoderSampleIndex);
    }

    setStartOfEncoderSampleIndex_ :: (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor, startOfEncoderSampleIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, startOfEncoderSampleIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStartOfEncoderSampleIndex_, startOfEncoderSampleIndex);
    }

/*!
 @property endOfEncoderSampleIndex
 @abstract The sample index to use to store the sample taken at the end of
 Command encoder processing.  Setting the value to MTLCounterDontSample will cause
 this sample to be omitted.
 @discussion On devices where MTLCounterSamplingPointAtStageBoundary is unsupported,
 this sample index is invalid and must be set to MTLCounterDontSample or creation of a resourceState pass will fail.
 */
    endOfEncoderSampleIndex :: (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.endOfEncoderSampleIndex);
    }

    setEndOfEncoderSampleIndex_ :: (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor, endOfEncoderSampleIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, endOfEncoderSampleIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setEndOfEncoderSampleIndex_, endOfEncoderSampleIndex);
    }

}

MTLResourceStatePassSampleBufferAttachmentDescriptorArray :: struct #type_info_none {
    nsobject: *NSObject;
/* Individual attachment state access */
    objectAtIndexedSubscript_ :: (self: *MTLResourceStatePassSampleBufferAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLResourceStatePassSampleBufferAttachmentDescriptor {
        func: #type (obj: *void, selector: *void, attachmentIndex: NSUInteger) -> *MTLResourceStatePassSampleBufferAttachmentDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, attachmentIndex);
    }

/* This always uses 'copy' semantics.  It is safe to set the attachment state at any legal index to nil, which resets that attachment descriptor state to default values. */
    setObject_atIndexedSubscript_ :: (self: *MTLResourceStatePassSampleBufferAttachmentDescriptorArray, attachment: *MTLResourceStatePassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, attachment: *MTLResourceStatePassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, attachment, attachmentIndex);
    }

}

/*!
 @class MTLResourceStatePassDescriptor
 @abstract MTLResourceStatePassDescriptor represents a collection of attachments to be used to create a concrete resourceState command encoder
 */
MTLResourceStatePassDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @method resourceStatePassDescriptor
 @abstract Create an autoreleased default frame buffer descriptor
 */
    resourceStatePassDescriptor :: () -> *MTLResourceStatePassDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLResourceStatePassDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLResourceStatePassDescriptor"), __sel.resourceStatePassDescriptor);
    }

/*!
 @property sampleBufferAttachments
 @abstract An array of sample buffers and associated sample indices.
 */
    sampleBufferAttachments :: (self: *MTLResourceStatePassDescriptor) -> *MTLResourceStatePassSampleBufferAttachmentDescriptorArray {
        func: #type (obj: *void, selector: *void) -> *MTLResourceStatePassSampleBufferAttachmentDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleBufferAttachments);
    }

}

MTLRenderPassAttachmentDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @property texture
 @abstract The MTLTexture object for this attachment.
 */
    texture :: (self: *MTLRenderPassAttachmentDescriptor) -> *MTLTexture {
        func: #type (obj: *void, selector: *void) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.texture);
    }

    setTexture_ :: (self: *MTLRenderPassAttachmentDescriptor, texture: *MTLTexture) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTexture_, texture);
    }

/*!
 @property level
 @abstract The mipmap level of the texture to be used for rendering.  Default is zero.
 */
    level :: (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.level);
    }

    setLevel_ :: (self: *MTLRenderPassAttachmentDescriptor, level: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, level: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLevel_, level);
    }

/*!
 @property slice
 @abstract The slice of the texture to be used for rendering.  Default is zero.
 */
    slice :: (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.slice);
    }

    setSlice_ :: (self: *MTLRenderPassAttachmentDescriptor, slice: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, slice: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSlice_, slice);
    }

/*!
 @property depthPlane
 @abstract The depth plane of the texture to be used for rendering.  Default is zero.
 */
    depthPlane :: (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.depthPlane);
    }

    setDepthPlane_ :: (self: *MTLRenderPassAttachmentDescriptor, depthPlane: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, depthPlane: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthPlane_, depthPlane);
    }

/*!
 @property resolveTexture
 @abstract The texture used for multisample resolve operations.  Only used (and required)
 if the store action is set to MTLStoreActionMultisampleResolve.
 */
    resolveTexture :: (self: *MTLRenderPassAttachmentDescriptor) -> *MTLTexture {
        func: #type (obj: *void, selector: *void) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resolveTexture);
    }

    setResolveTexture_ :: (self: *MTLRenderPassAttachmentDescriptor, resolveTexture: *MTLTexture) -> void {
        func: #type (obj: *void, selector: *void, resolveTexture: *MTLTexture) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setResolveTexture_, resolveTexture);
    }

/*!
 @property resolveLevel
 @abstract The mipmap level of the resolve texture to be used for multisample resolve.  Defaults to zero.
 */
    resolveLevel :: (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resolveLevel);
    }

    setResolveLevel_ :: (self: *MTLRenderPassAttachmentDescriptor, resolveLevel: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, resolveLevel: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setResolveLevel_, resolveLevel);
    }

/*!
 @property resolveLevel
 @abstract The texture slice of the resolve texture to be used for multisample resolve.  Defaults to zero.
 */
    resolveSlice :: (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resolveSlice);
    }

    setResolveSlice_ :: (self: *MTLRenderPassAttachmentDescriptor, resolveSlice: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, resolveSlice: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setResolveSlice_, resolveSlice);
    }

/*!
 @property resolveDepthPlane
 @abstract The texture depth plane of the resolve texture to be used for multisample resolve.  Defaults to zero.
 */
    resolveDepthPlane :: (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resolveDepthPlane);
    }

    setResolveDepthPlane_ :: (self: *MTLRenderPassAttachmentDescriptor, resolveDepthPlane: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, resolveDepthPlane: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setResolveDepthPlane_, resolveDepthPlane);
    }

/*!
 @property loadAction
 @abstract The action to be performed with this attachment at the beginning of a render pass.  Default is
 MTLLoadActionDontCare unless specified by a creation or init method.
 */
    loadAction :: (self: *MTLRenderPassAttachmentDescriptor) -> MTLLoadAction {
        func: #type (obj: *void, selector: *void) -> MTLLoadAction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.loadAction);
    }

    setLoadAction_ :: (self: *MTLRenderPassAttachmentDescriptor, loadAction: MTLLoadAction) -> void {
        func: #type (obj: *void, selector: *void, loadAction: MTLLoadAction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLoadAction_, loadAction);
    }

/*!
 @property storeAction
 @abstract The action to be performed with this attachment at the end of a render pass.  Default is
 MTLStoreActionDontCare unless specified by a creation or init method.
 */
    storeAction :: (self: *MTLRenderPassAttachmentDescriptor) -> MTLStoreAction {
        func: #type (obj: *void, selector: *void) -> MTLStoreAction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.storeAction);
    }

    setStoreAction_ :: (self: *MTLRenderPassAttachmentDescriptor, storeAction: MTLStoreAction) -> void {
        func: #type (obj: *void, selector: *void, storeAction: MTLStoreAction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStoreAction_, storeAction);
    }

/*!
 @property storeActionOptions
 @abstract Optional configuration for the store action performed with this attachment at the end of a render pass.  Default is
 MTLStoreActionOptionNone.
 */
    storeActionOptions :: (self: *MTLRenderPassAttachmentDescriptor) -> MTLStoreActionOptions {
        func: #type (obj: *void, selector: *void) -> MTLStoreActionOptions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.storeActionOptions);
    }

    setStoreActionOptions_ :: (self: *MTLRenderPassAttachmentDescriptor, storeActionOptions: MTLStoreActionOptions) -> void {
        func: #type (obj: *void, selector: *void, storeActionOptions: MTLStoreActionOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStoreActionOptions_, storeActionOptions);
    }

}

MTLRenderPassColorAttachmentDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @property clearColor
 @abstract The clear color to be used if the loadAction property is MTLLoadActionClear
 */
    clearColor :: (self: *MTLRenderPassColorAttachmentDescriptor) -> MTLClearColor {
        func: #type (obj: *void, selector: *void) -> MTLClearColor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.clearColor);
    }

    setClearColor_ :: (self: *MTLRenderPassColorAttachmentDescriptor, clearColor: MTLClearColor) -> void {
        func: #type (obj: *void, selector: *void, clearColor: MTLClearColor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setClearColor_, clearColor);
    }

}

MTLRenderPassDepthAttachmentDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @property clearDepth
 @abstract The clear depth value to be used if the loadAction property is MTLLoadActionClear
 */
    clearDepth :: (self: *MTLRenderPassDepthAttachmentDescriptor) -> float64 {
        func: #type (obj: *void, selector: *void) -> float64 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.clearDepth);
    }

    setClearDepth_ :: (self: *MTLRenderPassDepthAttachmentDescriptor, clearDepth: float64) -> void {
        func: #type (obj: *void, selector: *void, clearDepth: float64) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setClearDepth_, clearDepth);
    }

/*!
 @property resolveFilter
 @abstract The filter to be used for depth multisample resolve.  Defaults to MTLMultisampleDepthResolveFilterSample0.
 */
    depthResolveFilter :: (self: *MTLRenderPassDepthAttachmentDescriptor) -> MTLMultisampleDepthResolveFilter {
        func: #type (obj: *void, selector: *void) -> MTLMultisampleDepthResolveFilter #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.depthResolveFilter);
    }

    setDepthResolveFilter_ :: (self: *MTLRenderPassDepthAttachmentDescriptor, depthResolveFilter: MTLMultisampleDepthResolveFilter) -> void {
        func: #type (obj: *void, selector: *void, depthResolveFilter: MTLMultisampleDepthResolveFilter) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthResolveFilter_, depthResolveFilter);
    }

}

MTLRenderPassStencilAttachmentDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @property clearStencil
 @abstract The clear stencil value to be used if the loadAction property is MTLLoadActionClear
 */
    clearStencil :: (self: *MTLRenderPassStencilAttachmentDescriptor) -> u32 {
        func: #type (obj: *void, selector: *void) -> u32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.clearStencil);
    }

    setClearStencil_ :: (self: *MTLRenderPassStencilAttachmentDescriptor, clearStencil: u32) -> void {
        func: #type (obj: *void, selector: *void, clearStencil: u32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setClearStencil_, clearStencil);
    }

/*!
 @property stencilResolveFilter
 @abstract The filter to be used for stencil multisample resolve. Defaults to MTLMultisampleStencilResolveFilterSample0.
 */
    stencilResolveFilter :: (self: *MTLRenderPassStencilAttachmentDescriptor) -> MTLMultisampleStencilResolveFilter {
        func: #type (obj: *void, selector: *void) -> MTLMultisampleStencilResolveFilter #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stencilResolveFilter);
    }

    setStencilResolveFilter_ :: (self: *MTLRenderPassStencilAttachmentDescriptor, stencilResolveFilter: MTLMultisampleStencilResolveFilter) -> void {
        func: #type (obj: *void, selector: *void, stencilResolveFilter: MTLMultisampleStencilResolveFilter) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilResolveFilter_, stencilResolveFilter);
    }

}

MTLRenderPassColorAttachmentDescriptorArray :: struct #type_info_none {
    nsobject: *NSObject;
/* Individual attachment state access */
    objectAtIndexedSubscript_ :: (self: *MTLRenderPassColorAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLRenderPassColorAttachmentDescriptor {
        func: #type (obj: *void, selector: *void, attachmentIndex: NSUInteger) -> *MTLRenderPassColorAttachmentDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, attachmentIndex);
    }

/* This always uses 'copy' semantics.  It is safe to set the attachment state at any legal index to nil, which resets that attachment descriptor state to default values. */
    setObject_atIndexedSubscript_ :: (self: *MTLRenderPassColorAttachmentDescriptorArray, attachment: *MTLRenderPassColorAttachmentDescriptor, attachmentIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, attachment: *MTLRenderPassColorAttachmentDescriptor, attachmentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, attachment, attachmentIndex);
    }

}

MTLRenderPassSampleBufferAttachmentDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
@property sampleBuffer
@abstract The sample buffer to store samples for the render-pass defined samples.
If sampleBuffer is non-nil, the sample indices will be used to store samples into
the sample buffer.  If no sample buffer is provided, no samples will be taken.
If any of the sample indices are specified as MTLCounterDontSample, no sample
will be taken for that action.
*/
    sampleBuffer :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor) -> *MTLCounterSampleBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLCounterSampleBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleBuffer);
    }

    setSampleBuffer_ :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor, sampleBuffer: *MTLCounterSampleBuffer) -> void {
        func: #type (obj: *void, selector: *void, sampleBuffer: *MTLCounterSampleBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSampleBuffer_, sampleBuffer);
    }

/*!
 @property startOfVertexSampleIndex
 @abstract The sample index to use to store the sample taken at the start of
 vertex processing.  Setting the value to MTLCounterDontSample will cause
 this sample to be omitted.
 @discussion On devices where MTLCounterSamplingPointAtStageBoundary is unsupported,
 this sample index is invalid and must be set to MTLCounterDontSample or creation of a render pass will fail.
 */
    startOfVertexSampleIndex :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.startOfVertexSampleIndex);
    }

    setStartOfVertexSampleIndex_ :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor, startOfVertexSampleIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, startOfVertexSampleIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStartOfVertexSampleIndex_, startOfVertexSampleIndex);
    }

/*!
 @property endOfVertexSampleIndex
 @abstract The sample index to use to store the sample taken at the end of
 vertex processing.  Setting the value to MTLCounterDontSample will cause
 this sample to be omitted.
 @discussion On devices where MTLCounterSamplingPointAtStageBoundary is unsupported,
 this sample index is invalid and must be set to MTLCounterDontSample or creation of a render pass will fail.
 */
    endOfVertexSampleIndex :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.endOfVertexSampleIndex);
    }

    setEndOfVertexSampleIndex_ :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor, endOfVertexSampleIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, endOfVertexSampleIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setEndOfVertexSampleIndex_, endOfVertexSampleIndex);
    }

/*!
 @property startOfFragmentSampleIndex
 @abstract The sample index to use to store the sample taken at the start of
 fragment processing.  Setting the value to MTLCounterDontSample will cause
 this sample to be omitted.
 @discussion On devices where MTLCounterSamplingPointAtStageBoundary is unsupported,
 this sample index is invalid and must be set to MTLCounterDontSample or creation of a render pass will fail.
 */
    startOfFragmentSampleIndex :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.startOfFragmentSampleIndex);
    }

    setStartOfFragmentSampleIndex_ :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor, startOfFragmentSampleIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, startOfFragmentSampleIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStartOfFragmentSampleIndex_, startOfFragmentSampleIndex);
    }

/*!
 @property endOfFragmentSampleIndex
 @abstract The sample index to use to store the sample taken at the end of
 fragment processing.  Setting the value to MTLCounterDontSample will cause
 this sample to be omitted.
 @discussion On devices where MTLCounterSamplingPointAtStageBoundary is unsupported,
 this sample index is invalid and must be set to MTLCounterDontSample or creation of a render pass will fail.
 */
    endOfFragmentSampleIndex :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.endOfFragmentSampleIndex);
    }

    setEndOfFragmentSampleIndex_ :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor, endOfFragmentSampleIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, endOfFragmentSampleIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setEndOfFragmentSampleIndex_, endOfFragmentSampleIndex);
    }

}

MTLRenderPassSampleBufferAttachmentDescriptorArray :: struct #type_info_none {
    nsobject: *NSObject;
/* Individual attachment state access */
    objectAtIndexedSubscript_ :: (self: *MTLRenderPassSampleBufferAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLRenderPassSampleBufferAttachmentDescriptor {
        func: #type (obj: *void, selector: *void, attachmentIndex: NSUInteger) -> *MTLRenderPassSampleBufferAttachmentDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, attachmentIndex);
    }

/* This always uses 'copy' semantics.  It is safe to set the attachment state at any legal index to nil, which resets that attachment descriptor state to default values. */
    setObject_atIndexedSubscript_ :: (self: *MTLRenderPassSampleBufferAttachmentDescriptorArray, attachment: *MTLRenderPassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, attachment: *MTLRenderPassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, attachment, attachmentIndex);
    }

}

/*!
 @class MTLRenderPassDescriptor
 @abstract MTLRenderPassDescriptor represents a collection of attachments to be used to create a concrete render command encoder
 */
MTLRenderPassDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @method renderPassDescriptor
 @abstract Create an autoreleased default frame buffer descriptor
 */
    renderPassDescriptor :: () -> *MTLRenderPassDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLRenderPassDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLRenderPassDescriptor"), __sel.renderPassDescriptor);
    }

/*!
 @method setSamplePositions:count:
 @abstract Configure the custom sample positions, to be used in MSAA rendering (i.e. when sample count > 1).
 @param positions The source array for custom sample position data.
 @param count Specifies the length of the positions array, and must be a valid sample count or 0 (to disable custom sample positions).
 */
    setSamplePositions_count_ :: (self: *MTLRenderPassDescriptor, positions: *MTLSamplePosition, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, positions: *MTLSamplePosition, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSamplePositions_count_, positions, count);
    }

/*!
 @method getSamplePositions:count:
 @abstract Retrieve the previously configured custom sample positions. The positions input array will only be modified when count specifies a length sufficient for the number of previously configured positions.
 @param positions The destination array for custom sample position data.
 @param count Specifies the length of the positions array, which must be large enough to hold all configured sample positions.
 @return The number of previously configured custom sample positions.
 */
    getSamplePositions_count_ :: (self: *MTLRenderPassDescriptor, positions: *MTLSamplePosition, count: NSUInteger) -> NSUInteger {
        func: #type (obj: *void, selector: *void, positions: *MTLSamplePosition, count: NSUInteger) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.getSamplePositions_count_, positions, count);
    }

    colorAttachments :: (self: *MTLRenderPassDescriptor) -> *MTLRenderPassColorAttachmentDescriptorArray {
        func: #type (obj: *void, selector: *void) -> *MTLRenderPassColorAttachmentDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.colorAttachments);
    }

    depthAttachment :: (self: *MTLRenderPassDescriptor) -> *MTLRenderPassDepthAttachmentDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLRenderPassDepthAttachmentDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.depthAttachment);
    }

    setDepthAttachment_ :: (self: *MTLRenderPassDescriptor, depthAttachment: *MTLRenderPassDepthAttachmentDescriptor) -> void {
        func: #type (obj: *void, selector: *void, depthAttachment: *MTLRenderPassDepthAttachmentDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthAttachment_, depthAttachment);
    }

    stencilAttachment :: (self: *MTLRenderPassDescriptor) -> *MTLRenderPassStencilAttachmentDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLRenderPassStencilAttachmentDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stencilAttachment);
    }

    setStencilAttachment_ :: (self: *MTLRenderPassDescriptor, stencilAttachment: *MTLRenderPassStencilAttachmentDescriptor) -> void {
        func: #type (obj: *void, selector: *void, stencilAttachment: *MTLRenderPassStencilAttachmentDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilAttachment_, stencilAttachment);
    }

/*!
 @property visibilityResultBuffer:
 @abstract Buffer into which samples passing the depth and stencil tests are counted.
 */
    visibilityResultBuffer :: (self: *MTLRenderPassDescriptor) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.visibilityResultBuffer);
    }

    setVisibilityResultBuffer_ :: (self: *MTLRenderPassDescriptor, visibilityResultBuffer: *MTLBuffer) -> void {
        func: #type (obj: *void, selector: *void, visibilityResultBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVisibilityResultBuffer_, visibilityResultBuffer);
    }

/*!
 @property renderTargetArrayLength:
 @abstract The number of active layers
 */
    renderTargetArrayLength :: (self: *MTLRenderPassDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.renderTargetArrayLength);
    }

    setRenderTargetArrayLength_ :: (self: *MTLRenderPassDescriptor, renderTargetArrayLength: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, renderTargetArrayLength: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRenderTargetArrayLength_, renderTargetArrayLength);
    }

/*!
 @property imageblockSampleLength:
 @abstract The per sample size in bytes of the largest explicit imageblock layout in the renderPass.
 */
    imageblockSampleLength :: (self: *MTLRenderPassDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.imageblockSampleLength);
    }

    setImageblockSampleLength_ :: (self: *MTLRenderPassDescriptor, imageblockSampleLength: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, imageblockSampleLength: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setImageblockSampleLength_, imageblockSampleLength);
    }

/*!
 @property threadgroupMemoryLength:
 @abstract The per tile size in bytes of the persistent threadgroup memory allocation.
 */
    threadgroupMemoryLength :: (self: *MTLRenderPassDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.threadgroupMemoryLength);
    }

    setThreadgroupMemoryLength_ :: (self: *MTLRenderPassDescriptor, threadgroupMemoryLength: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, threadgroupMemoryLength: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setThreadgroupMemoryLength_, threadgroupMemoryLength);
    }

/*!
 @property tileWidth:
 @abstract The width in pixels of the tile.
 @discussion Defaults to 0. Zero means Metal chooses a width that fits within the local memory.
 */
    tileWidth :: (self: *MTLRenderPassDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileWidth);
    }

    setTileWidth_ :: (self: *MTLRenderPassDescriptor, tileWidth: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, tileWidth: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileWidth_, tileWidth);
    }

/*!
 @property tileHeight:
 @abstract The height in pixels of the tile.
 @discussion Defaults to 0. Zero means Metal chooses a height that fits within the local memory.
 */
    tileHeight :: (self: *MTLRenderPassDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileHeight);
    }

    setTileHeight_ :: (self: *MTLRenderPassDescriptor, tileHeight: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, tileHeight: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileHeight_, tileHeight);
    }

/*!
 @property defaultRasterSampleCount:
 @abstract The raster sample count for the render pass when no attachments are given.
 */
    defaultRasterSampleCount :: (self: *MTLRenderPassDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.defaultRasterSampleCount);
    }

    setDefaultRasterSampleCount_ :: (self: *MTLRenderPassDescriptor, defaultRasterSampleCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, defaultRasterSampleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDefaultRasterSampleCount_, defaultRasterSampleCount);
    }

/*!
 @property renderTargetWidth:
 @abstract The width in pixels to constrain the render target to.
 @discussion Defaults to 0. If non-zero the value must be smaller than or equal to the minimum width of all attachments.
 */
    renderTargetWidth :: (self: *MTLRenderPassDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.renderTargetWidth);
    }

    setRenderTargetWidth_ :: (self: *MTLRenderPassDescriptor, renderTargetWidth: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, renderTargetWidth: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRenderTargetWidth_, renderTargetWidth);
    }

/*!
 @property renderTargetHeight:
 @abstract The height in pixels to constrain the render target to.
 @discussion Defaults to 0. If non-zero the value must be smaller than or equal to the minimum height of all attachments.
 */
    renderTargetHeight :: (self: *MTLRenderPassDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.renderTargetHeight);
    }

    setRenderTargetHeight_ :: (self: *MTLRenderPassDescriptor, renderTargetHeight: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, renderTargetHeight: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRenderTargetHeight_, renderTargetHeight);
    }

/*!
 @property rasterizationRateMap
 @abstract The variable rasterization rate map to use when rendering this pass, or nil to not use variable rasterization rate.
 @discussion The default value is nil. Enabling variable rasterization rate allows for decreasing the rasterization rate in unimportant regions of screen space.
 */
    rasterizationRateMap :: (self: *MTLRenderPassDescriptor) -> *MTLRasterizationRateMap {
        func: #type (obj: *void, selector: *void) -> *MTLRasterizationRateMap #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.rasterizationRateMap);
    }

    setRasterizationRateMap_ :: (self: *MTLRenderPassDescriptor, rasterizationRateMap: *MTLRasterizationRateMap) -> void {
        func: #type (obj: *void, selector: *void, rasterizationRateMap: *MTLRasterizationRateMap) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRasterizationRateMap_, rasterizationRateMap);
    }

/*!
 @property sampleBufferAttachments
 @abstract An array of sample buffers and associated sample indices.
 */
    sampleBufferAttachments :: (self: *MTLRenderPassDescriptor) -> *MTLRenderPassSampleBufferAttachmentDescriptorArray {
        func: #type (obj: *void, selector: *void) -> *MTLRenderPassSampleBufferAttachmentDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleBufferAttachments);
    }

/// Specifies if Metal accumulates visibility results between render encoders or resets them.
    visibilityResultType :: (self: *MTLRenderPassDescriptor) -> MTLVisibilityResultType {
        func: #type (obj: *void, selector: *void) -> MTLVisibilityResultType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.visibilityResultType);
    }

    setVisibilityResultType_ :: (self: *MTLRenderPassDescriptor, visibilityResultType: MTLVisibilityResultType) -> void {
        func: #type (obj: *void, selector: *void, visibilityResultType: MTLVisibilityResultType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVisibilityResultType_, visibilityResultType);
    }

/// Specifies if the render pass should support color attachment mapping.
    supportColorAttachmentMapping :: (self: *MTLRenderPassDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportColorAttachmentMapping);
    }

    setSupportColorAttachmentMapping_ :: (self: *MTLRenderPassDescriptor, supportColorAttachmentMapping: BOOL) -> void {
        func: #type (obj: *void, selector: *void, supportColorAttachmentMapping: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportColorAttachmentMapping_, supportColorAttachmentMapping);
    }

}

MTLBlitPassSampleBufferAttachmentDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
@property sampleBuffer
@abstract The sample buffer to store samples for the blit-pass defined samples.
If sampleBuffer is non-nil, the sample indices will be used to store samples into
the sample buffer.  If no sample buffer is provided, no samples will be taken.
If any of the sample indices are specified as MTLCounterDontSample, no sample
will be taken for that action.
*/
    sampleBuffer :: (self: *MTLBlitPassSampleBufferAttachmentDescriptor) -> *MTLCounterSampleBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLCounterSampleBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleBuffer);
    }

    setSampleBuffer_ :: (self: *MTLBlitPassSampleBufferAttachmentDescriptor, sampleBuffer: *MTLCounterSampleBuffer) -> void {
        func: #type (obj: *void, selector: *void, sampleBuffer: *MTLCounterSampleBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSampleBuffer_, sampleBuffer);
    }

/*!
 @property startOfEncoderSampleIndex
 @abstract The sample index to use to store the sample taken at the start of
 command encoder processing.  Setting the value to MTLCounterDontSample will cause
 this sample to be omitted.
 @discussion On devices where MTLCounterSamplingPointAtStageBoundary is unsupported,
 this sample index is invalid and must be set to MTLCounterDontSample or creation of a blit pass will fail.
 */
    startOfEncoderSampleIndex :: (self: *MTLBlitPassSampleBufferAttachmentDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.startOfEncoderSampleIndex);
    }

    setStartOfEncoderSampleIndex_ :: (self: *MTLBlitPassSampleBufferAttachmentDescriptor, startOfEncoderSampleIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, startOfEncoderSampleIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStartOfEncoderSampleIndex_, startOfEncoderSampleIndex);
    }

/*!
 @property endOfEncoderSampleIndex
 @abstract The sample index to use to store the sample taken at the end of
 Command encoder processing.  Setting the value to MTLCounterDontSample will cause
 this sample to be omitted.
 @discussion On devices where MTLCounterSamplingPointAtStageBoundary is unsupported,
 this sample index is invalid and must be set to MTLCounterDontSample or creation of a blit pass will fail.
 */
    endOfEncoderSampleIndex :: (self: *MTLBlitPassSampleBufferAttachmentDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.endOfEncoderSampleIndex);
    }

    setEndOfEncoderSampleIndex_ :: (self: *MTLBlitPassSampleBufferAttachmentDescriptor, endOfEncoderSampleIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, endOfEncoderSampleIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setEndOfEncoderSampleIndex_, endOfEncoderSampleIndex);
    }

}

MTLBlitPassSampleBufferAttachmentDescriptorArray :: struct #type_info_none {
    nsobject: *NSObject;
/* Individual attachment state access */
    objectAtIndexedSubscript_ :: (self: *MTLBlitPassSampleBufferAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLBlitPassSampleBufferAttachmentDescriptor {
        func: #type (obj: *void, selector: *void, attachmentIndex: NSUInteger) -> *MTLBlitPassSampleBufferAttachmentDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, attachmentIndex);
    }

/* This always uses 'copy' semantics.  It is safe to set the attachment state at any legal index to nil, which resets that attachment descriptor state to default values. */
    setObject_atIndexedSubscript_ :: (self: *MTLBlitPassSampleBufferAttachmentDescriptorArray, attachment: *MTLBlitPassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, attachment: *MTLBlitPassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, attachment, attachmentIndex);
    }

}

/*!
 @class MTLBlitPassDescriptor
 @abstract MTLBlitPassDescriptor represents a collection of attachments to be used to create a concrete blit command encoder
 */
MTLBlitPassDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @method blitPassDescriptor
 @abstract Create an autoreleased default frame buffer descriptor
 */
    blitPassDescriptor :: () -> *MTLBlitPassDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLBlitPassDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLBlitPassDescriptor"), __sel.blitPassDescriptor);
    }

/*!
 @property sampleBufferAttachments
 @abstract An array of sample buffers and associated sample indices.
 */
    sampleBufferAttachments :: (self: *MTLBlitPassDescriptor) -> *MTLBlitPassSampleBufferAttachmentDescriptorArray {
        func: #type (obj: *void, selector: *void) -> *MTLBlitPassSampleBufferAttachmentDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleBufferAttachments);
    }

}

/*!
 @class MTLCommandBufferDescriptor
 @abstract An object that you use to configure new Metal command buffer objects.
*/
MTLCommandBufferDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @property retainedReferences
 @abstract If YES, the created command buffer holds strong references to objects needed for it to execute. If NO, the created command buffer does not hold strong references to objects needed for it to execute.
*/
    retainedReferences :: (self: *MTLCommandBufferDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.retainedReferences);
    }

    setRetainedReferences_ :: (self: *MTLCommandBufferDescriptor, retainedReferences: BOOL) -> void {
        func: #type (obj: *void, selector: *void, retainedReferences: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRetainedReferences_, retainedReferences);
    }

/*!
 @property errorOptions
 @abstract A set of options to influence the error reporting of the created command buffer. See MTLCommandBufferErrorOption.
*/
    errorOptions :: (self: *MTLCommandBufferDescriptor) -> MTLCommandBufferErrorOption {
        func: #type (obj: *void, selector: *void) -> MTLCommandBufferErrorOption #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.errorOptions);
    }

    setErrorOptions_ :: (self: *MTLCommandBufferDescriptor, errorOptions: MTLCommandBufferErrorOption) -> void {
        func: #type (obj: *void, selector: *void, errorOptions: MTLCommandBufferErrorOption) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setErrorOptions_, errorOptions);
    }

/*!
 @property logState
 @abstract Contains information related to shader logging.
*/
    logState :: (self: *MTLCommandBufferDescriptor) -> *MTLLogState {
        func: #type (obj: *void, selector: *void) -> *MTLLogState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.logState);
    }

    setLogState_ :: (self: *MTLCommandBufferDescriptor, logState: *MTLLogState) -> void {
        func: #type (obj: *void, selector: *void, logState: *MTLLogState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLogState_, logState);
    }

}

MTLComputePassSampleBufferAttachmentDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
@property sampleBuffer
@abstract The sample buffer to store samples for the compute-pass defined samples.
If sampleBuffer is non-nil, the sample indices will be used to store samples into
the sample buffer.  If no sample buffer is provided, no samples will be taken.
If any of the sample indices are specified as MTLCounterDontSample, no sample
will be taken for that action.
*/
    sampleBuffer :: (self: *MTLComputePassSampleBufferAttachmentDescriptor) -> *MTLCounterSampleBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLCounterSampleBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleBuffer);
    }

    setSampleBuffer_ :: (self: *MTLComputePassSampleBufferAttachmentDescriptor, sampleBuffer: *MTLCounterSampleBuffer) -> void {
        func: #type (obj: *void, selector: *void, sampleBuffer: *MTLCounterSampleBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSampleBuffer_, sampleBuffer);
    }

/*!
 @property startOfEncoderSampleIndex
 @abstract The sample index to use to store the sample taken at the start of
 command encoder processing.  Setting the value to MTLCounterDontSample will cause
 this sample to be omitted.
 @discussion On devices where MTLCounterSamplingPointAtStageBoundary is unsupported,
 this sample index is invalid and must be set to MTLCounterDontSample or creation of a compute pass will fail.
 */
    startOfEncoderSampleIndex :: (self: *MTLComputePassSampleBufferAttachmentDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.startOfEncoderSampleIndex);
    }

    setStartOfEncoderSampleIndex_ :: (self: *MTLComputePassSampleBufferAttachmentDescriptor, startOfEncoderSampleIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, startOfEncoderSampleIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStartOfEncoderSampleIndex_, startOfEncoderSampleIndex);
    }

/*!
 @property endOfEncoderSampleIndex
 @abstract The sample index to use to store the sample taken at the end of
 command encoder processing.  Setting the value to MTLCounterDontSample will cause
 this sample to be omitted.
 @discussion On devices where MTLCounterSamplingPointAtStageBoundary is unsupported,
 this sample index is invalid and must be set to MTLCounterDontSample or creation of a compute pass will fail.
 */
    endOfEncoderSampleIndex :: (self: *MTLComputePassSampleBufferAttachmentDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.endOfEncoderSampleIndex);
    }

    setEndOfEncoderSampleIndex_ :: (self: *MTLComputePassSampleBufferAttachmentDescriptor, endOfEncoderSampleIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, endOfEncoderSampleIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setEndOfEncoderSampleIndex_, endOfEncoderSampleIndex);
    }

}

MTLComputePassSampleBufferAttachmentDescriptorArray :: struct #type_info_none {
    nsobject: *NSObject;
/* Individual attachment state access */
    objectAtIndexedSubscript_ :: (self: *MTLComputePassSampleBufferAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLComputePassSampleBufferAttachmentDescriptor {
        func: #type (obj: *void, selector: *void, attachmentIndex: NSUInteger) -> *MTLComputePassSampleBufferAttachmentDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, attachmentIndex);
    }

/* This always uses 'copy' semantics.  It is safe to set the attachment state at any legal index to nil, which resets that attachment descriptor state to default values. */
    setObject_atIndexedSubscript_ :: (self: *MTLComputePassSampleBufferAttachmentDescriptorArray, attachment: *MTLComputePassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, attachment: *MTLComputePassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, attachment, attachmentIndex);
    }

}

/*!
 @class MTLComputePassDescriptor
 @abstract MTLComputePassDescriptor represents a collection of attachments to be used to create a concrete compute command encoder
 */
MTLComputePassDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @method computePassDescriptor
 @abstract Create an autoreleased default frame buffer descriptor
 */
    computePassDescriptor :: () -> *MTLComputePassDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLComputePassDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLComputePassDescriptor"), __sel.computePassDescriptor);
    }

/*!
 @property dispatchType
 @abstract The dispatch type of the compute command encoder.
 */
    dispatchType :: (self: *MTLComputePassDescriptor) -> MTLDispatchType {
        func: #type (obj: *void, selector: *void) -> MTLDispatchType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dispatchType);
    }

    setDispatchType_ :: (self: *MTLComputePassDescriptor, dispatchType: MTLDispatchType) -> void {
        func: #type (obj: *void, selector: *void, dispatchType: MTLDispatchType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDispatchType_, dispatchType);
    }

/*!
 @property sampleBufferAttachments
 @abstract An array of sample buffers and associated sample indices.
 */
    sampleBufferAttachments :: (self: *MTLComputePassDescriptor) -> *MTLComputePassSampleBufferAttachmentDescriptorArray {
        func: #type (obj: *void, selector: *void) -> *MTLComputePassSampleBufferAttachmentDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleBufferAttachments);
    }

}

MTLCommandQueueDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @property maxCommandBufferCount
 @ Specify upper bound on uncompleted command buffers that may be enqueued on this queue
 */
    maxCommandBufferCount :: (self: *MTLCommandQueueDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxCommandBufferCount);
    }

    setMaxCommandBufferCount_ :: (self: *MTLCommandQueueDescriptor, maxCommandBufferCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxCommandBufferCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxCommandBufferCount_, maxCommandBufferCount);
    }

/*!
 @property logState
 @ Specify the MTLLogState to enable shader logging
 */
    logState :: (self: *MTLCommandQueueDescriptor) -> *MTLLogState {
        func: #type (obj: *void, selector: *void) -> *MTLLogState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.logState);
    }

    setLogState_ :: (self: *MTLCommandQueueDescriptor, logState: *MTLLogState) -> void {
        func: #type (obj: *void, selector: *void, logState: *MTLLogState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLogState_, logState);
    }

}

MTLStencilDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
    stencilCompareFunction :: (self: *MTLStencilDescriptor) -> MTLCompareFunction {
        func: #type (obj: *void, selector: *void) -> MTLCompareFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stencilCompareFunction);
    }

    setStencilCompareFunction_ :: (self: *MTLStencilDescriptor, stencilCompareFunction: MTLCompareFunction) -> void {
        func: #type (obj: *void, selector: *void, stencilCompareFunction: MTLCompareFunction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilCompareFunction_, stencilCompareFunction);
    }

/*! Stencil is tested first.  stencilFailureOperation declares how the stencil buffer is updated when the stencil test fails. */
    stencilFailureOperation :: (self: *MTLStencilDescriptor) -> MTLStencilOperation {
        func: #type (obj: *void, selector: *void) -> MTLStencilOperation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stencilFailureOperation);
    }

    setStencilFailureOperation_ :: (self: *MTLStencilDescriptor, stencilFailureOperation: MTLStencilOperation) -> void {
        func: #type (obj: *void, selector: *void, stencilFailureOperation: MTLStencilOperation) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilFailureOperation_, stencilFailureOperation);
    }

/*! If stencil passes, depth is tested next.  Declare what happens when the depth test fails. */
    depthFailureOperation :: (self: *MTLStencilDescriptor) -> MTLStencilOperation {
        func: #type (obj: *void, selector: *void) -> MTLStencilOperation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.depthFailureOperation);
    }

    setDepthFailureOperation_ :: (self: *MTLStencilDescriptor, depthFailureOperation: MTLStencilOperation) -> void {
        func: #type (obj: *void, selector: *void, depthFailureOperation: MTLStencilOperation) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthFailureOperation_, depthFailureOperation);
    }

/*! If both the stencil and depth tests pass, declare how the stencil buffer is updated. */
    depthStencilPassOperation :: (self: *MTLStencilDescriptor) -> MTLStencilOperation {
        func: #type (obj: *void, selector: *void) -> MTLStencilOperation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.depthStencilPassOperation);
    }

    setDepthStencilPassOperation_ :: (self: *MTLStencilDescriptor, depthStencilPassOperation: MTLStencilOperation) -> void {
        func: #type (obj: *void, selector: *void, depthStencilPassOperation: MTLStencilOperation) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthStencilPassOperation_, depthStencilPassOperation);
    }

    readMask :: (self: *MTLStencilDescriptor) -> u32 {
        func: #type (obj: *void, selector: *void) -> u32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.readMask);
    }

    setReadMask_ :: (self: *MTLStencilDescriptor, readMask: u32) -> void {
        func: #type (obj: *void, selector: *void, readMask: u32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setReadMask_, readMask);
    }

    writeMask :: (self: *MTLStencilDescriptor) -> u32 {
        func: #type (obj: *void, selector: *void) -> u32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.writeMask);
    }

    setWriteMask_ :: (self: *MTLStencilDescriptor, writeMask: u32) -> void {
        func: #type (obj: *void, selector: *void, writeMask: u32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setWriteMask_, writeMask);
    }

}

MTLDepthStencilDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/* Defaults to MTLCompareFuncAlways, which effectively skips the depth test */
    depthCompareFunction :: (self: *MTLDepthStencilDescriptor) -> MTLCompareFunction {
        func: #type (obj: *void, selector: *void) -> MTLCompareFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.depthCompareFunction);
    }

    setDepthCompareFunction_ :: (self: *MTLDepthStencilDescriptor, depthCompareFunction: MTLCompareFunction) -> void {
        func: #type (obj: *void, selector: *void, depthCompareFunction: MTLCompareFunction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthCompareFunction_, depthCompareFunction);
    }

    isDepthWriteEnabled :: (self: *MTLDepthStencilDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isDepthWriteEnabled);
    }

    setDepthWriteEnabled_ :: (self: *MTLDepthStencilDescriptor, depthWriteEnabled: BOOL) -> void {
        func: #type (obj: *void, selector: *void, depthWriteEnabled: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthWriteEnabled_, depthWriteEnabled);
    }

/* Separate stencil state for front and back state.  Both front and back can be made to track the same state by assigning the same MTLStencilDescriptor to both. */
    frontFaceStencil :: (self: *MTLDepthStencilDescriptor) -> *MTLStencilDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLStencilDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.frontFaceStencil);
    }

    setFrontFaceStencil_ :: (self: *MTLDepthStencilDescriptor, frontFaceStencil: *MTLStencilDescriptor) -> void {
        func: #type (obj: *void, selector: *void, frontFaceStencil: *MTLStencilDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFrontFaceStencil_, frontFaceStencil);
    }

    backFaceStencil :: (self: *MTLDepthStencilDescriptor) -> *MTLStencilDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLStencilDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.backFaceStencil);
    }

    setBackFaceStencil_ :: (self: *MTLDepthStencilDescriptor, backFaceStencil: *MTLStencilDescriptor) -> void {
        func: #type (obj: *void, selector: *void, backFaceStencil: *MTLStencilDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBackFaceStencil_, backFaceStencil);
    }

/*!
 @property label
 @abstract A string to help identify the created object.
 */
    label :: (self: *MTLDepthStencilDescriptor) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLDepthStencilDescriptor, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

}

MTLVertexBufferLayoutDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
    stride :: (self: *MTLVertexBufferLayoutDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stride);
    }

    setStride_ :: (self: *MTLVertexBufferLayoutDescriptor, stride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, stride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStride_, stride);
    }

    stepFunction :: (self: *MTLVertexBufferLayoutDescriptor) -> MTLVertexStepFunction {
        func: #type (obj: *void, selector: *void) -> MTLVertexStepFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stepFunction);
    }

    setStepFunction_ :: (self: *MTLVertexBufferLayoutDescriptor, stepFunction: MTLVertexStepFunction) -> void {
        func: #type (obj: *void, selector: *void, stepFunction: MTLVertexStepFunction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStepFunction_, stepFunction);
    }

    stepRate :: (self: *MTLVertexBufferLayoutDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stepRate);
    }

    setStepRate_ :: (self: *MTLVertexBufferLayoutDescriptor, stepRate: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, stepRate: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStepRate_, stepRate);
    }

}

MTLVertexBufferLayoutDescriptorArray :: struct #type_info_none {
    nsobject: *NSObject;
    objectAtIndexedSubscript_ :: (self: *MTLVertexBufferLayoutDescriptorArray, index: NSUInteger) -> *MTLVertexBufferLayoutDescriptor {
        func: #type (obj: *void, selector: *void, index: NSUInteger) -> *MTLVertexBufferLayoutDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, index);
    }

    setObject_atIndexedSubscript_ :: (self: *MTLVertexBufferLayoutDescriptorArray, bufferDesc: *MTLVertexBufferLayoutDescriptor, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, bufferDesc: *MTLVertexBufferLayoutDescriptor, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, bufferDesc, index);
    }

}

MTLVertexAttributeDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
    format :: (self: *MTLVertexAttributeDescriptor) -> MTLVertexFormat {
        func: #type (obj: *void, selector: *void) -> MTLVertexFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.format);
    }

    setFormat_ :: (self: *MTLVertexAttributeDescriptor, format: MTLVertexFormat) -> void {
        func: #type (obj: *void, selector: *void, format: MTLVertexFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFormat_, format);
    }

    offset :: (self: *MTLVertexAttributeDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.offset);
    }

    setOffset_ :: (self: *MTLVertexAttributeDescriptor, offset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, offset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOffset_, offset);
    }

    bufferIndex :: (self: *MTLVertexAttributeDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bufferIndex);
    }

    setBufferIndex_ :: (self: *MTLVertexAttributeDescriptor, bufferIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBufferIndex_, bufferIndex);
    }

}

MTLVertexAttributeDescriptorArray :: struct #type_info_none {
    nsobject: *NSObject;
    objectAtIndexedSubscript_ :: (self: *MTLVertexAttributeDescriptorArray, index: NSUInteger) -> *MTLVertexAttributeDescriptor {
        func: #type (obj: *void, selector: *void, index: NSUInteger) -> *MTLVertexAttributeDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, index);
    }

    setObject_atIndexedSubscript_ :: (self: *MTLVertexAttributeDescriptorArray, attributeDesc: *MTLVertexAttributeDescriptor, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, attributeDesc: *MTLVertexAttributeDescriptor, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, attributeDesc, index);
    }

}

/*
 MTLVertexDescriptor
 */
MTLVertexDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
    vertexDescriptor :: () -> *MTLVertexDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLVertexDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLVertexDescriptor"), __sel.vertexDescriptor);
    }

    reset :: (self: *MTLVertexDescriptor) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

    layouts :: (self: *MTLVertexDescriptor) -> *MTLVertexBufferLayoutDescriptorArray {
        func: #type (obj: *void, selector: *void) -> *MTLVertexBufferLayoutDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.layouts);
    }

    attributes :: (self: *MTLVertexDescriptor) -> *MTLVertexAttributeDescriptorArray {
        func: #type (obj: *void, selector: *void) -> *MTLVertexAttributeDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.attributes);
    }

}

MTLBufferLayoutDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
    stride :: (self: *MTLBufferLayoutDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stride);
    }

    setStride_ :: (self: *MTLBufferLayoutDescriptor, stride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, stride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStride_, stride);
    }

    stepFunction :: (self: *MTLBufferLayoutDescriptor) -> MTLStepFunction {
        func: #type (obj: *void, selector: *void) -> MTLStepFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stepFunction);
    }

    setStepFunction_ :: (self: *MTLBufferLayoutDescriptor, stepFunction: MTLStepFunction) -> void {
        func: #type (obj: *void, selector: *void, stepFunction: MTLStepFunction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStepFunction_, stepFunction);
    }

    stepRate :: (self: *MTLBufferLayoutDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stepRate);
    }

    setStepRate_ :: (self: *MTLBufferLayoutDescriptor, stepRate: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, stepRate: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStepRate_, stepRate);
    }

}

MTLBufferLayoutDescriptorArray :: struct #type_info_none {
    nsobject: *NSObject;
    objectAtIndexedSubscript_ :: (self: *MTLBufferLayoutDescriptorArray, index: NSUInteger) -> *MTLBufferLayoutDescriptor {
        func: #type (obj: *void, selector: *void, index: NSUInteger) -> *MTLBufferLayoutDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, index);
    }

    setObject_atIndexedSubscript_ :: (self: *MTLBufferLayoutDescriptorArray, bufferDesc: *MTLBufferLayoutDescriptor, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, bufferDesc: *MTLBufferLayoutDescriptor, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, bufferDesc, index);
    }

}

MTLAttributeDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
    format :: (self: *MTLAttributeDescriptor) -> MTLAttributeFormat {
        func: #type (obj: *void, selector: *void) -> MTLAttributeFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.format);
    }

    setFormat_ :: (self: *MTLAttributeDescriptor, format: MTLAttributeFormat) -> void {
        func: #type (obj: *void, selector: *void, format: MTLAttributeFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFormat_, format);
    }

    offset :: (self: *MTLAttributeDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.offset);
    }

    setOffset_ :: (self: *MTLAttributeDescriptor, offset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, offset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOffset_, offset);
    }

    bufferIndex :: (self: *MTLAttributeDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bufferIndex);
    }

    setBufferIndex_ :: (self: *MTLAttributeDescriptor, bufferIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBufferIndex_, bufferIndex);
    }

}

MTLAttributeDescriptorArray :: struct #type_info_none {
    nsobject: *NSObject;
    objectAtIndexedSubscript_ :: (self: *MTLAttributeDescriptorArray, index: NSUInteger) -> *MTLAttributeDescriptor {
        func: #type (obj: *void, selector: *void, index: NSUInteger) -> *MTLAttributeDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, index);
    }

    setObject_atIndexedSubscript_ :: (self: *MTLAttributeDescriptorArray, attributeDesc: *MTLAttributeDescriptor, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, attributeDesc: *MTLAttributeDescriptor, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, attributeDesc, index);
    }

}

/*
 MTLStageInputOutputDescriptor
 */
MTLStageInputOutputDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
    stageInputOutputDescriptor :: () -> *MTLStageInputOutputDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLStageInputOutputDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLStageInputOutputDescriptor"), __sel.stageInputOutputDescriptor);
    }

    reset :: (self: *MTLStageInputOutputDescriptor) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

    layouts :: (self: *MTLStageInputOutputDescriptor) -> *MTLBufferLayoutDescriptorArray {
        func: #type (obj: *void, selector: *void) -> *MTLBufferLayoutDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.layouts);
    }

    attributes :: (self: *MTLStageInputOutputDescriptor) -> *MTLAttributeDescriptorArray {
        func: #type (obj: *void, selector: *void) -> *MTLAttributeDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.attributes);
    }

/* only used for compute with MTLStepFunction...Indexed */
    indexType :: (self: *MTLStageInputOutputDescriptor) -> MTLIndexType {
        func: #type (obj: *void, selector: *void) -> MTLIndexType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexType);
    }

    setIndexType_ :: (self: *MTLStageInputOutputDescriptor, indexType: MTLIndexType) -> void {
        func: #type (obj: *void, selector: *void, indexType: MTLIndexType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexType_, indexType);
    }

    indexBufferIndex :: (self: *MTLStageInputOutputDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexBufferIndex);
    }

    setIndexBufferIndex_ :: (self: *MTLStageInputOutputDescriptor, indexBufferIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, indexBufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexBufferIndex_, indexBufferIndex);
    }

}

MTLPipelineBufferDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*! Buffer mutability. Defaults to MTLMutabilityDefault: mutable for standard buffers, immutable for argument buffers */
    mutability :: (self: *MTLPipelineBufferDescriptor) -> MTLMutability {
        func: #type (obj: *void, selector: *void) -> MTLMutability #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.mutability);
    }

    setMutability_ :: (self: *MTLPipelineBufferDescriptor, mutability: MTLMutability) -> void {
        func: #type (obj: *void, selector: *void, mutability: MTLMutability) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMutability_, mutability);
    }

}

MTLPipelineBufferDescriptorArray :: struct #type_info_none {
    nsobject: *NSObject;
/* Individual buffer descriptor access */
    objectAtIndexedSubscript_ :: (self: *MTLPipelineBufferDescriptorArray, bufferIndex: NSUInteger) -> *MTLPipelineBufferDescriptor {
        func: #type (obj: *void, selector: *void, bufferIndex: NSUInteger) -> *MTLPipelineBufferDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, bufferIndex);
    }

/* This always uses 'copy' semantics. It is safe to set the buffer descriptor at any legal index to nil, which resets that buffer descriptor to default values. */
    setObject_atIndexedSubscript_ :: (self: *MTLPipelineBufferDescriptorArray, buffer: *MTLPipelineBufferDescriptor, bufferIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLPipelineBufferDescriptor, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, buffer, bufferIndex);
    }

}

/*!
 @class MTLLinkedFunctions
 @abstract A class to set functions to be linked.
 @discussion All functions set on this object must have unique names.
 */
MTLLinkedFunctions :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @method linkedFunctions
 @abstract Create an autoreleased MTLLinkedFunctions object.
 */
    linkedFunctions :: () -> *MTLLinkedFunctions {
        func: #type (obj: *void, selector: *void) -> *MTLLinkedFunctions #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLLinkedFunctions"), __sel.linkedFunctions);
    }

/*!
* @property functions
* @abstract The array of functions to be AIR linked.
*/
    functions :: (self: *MTLLinkedFunctions) -> *NSArray(*MTLFunction) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLFunction) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functions);
    }

    setFunctions_ :: (self: *MTLLinkedFunctions, functions: *NSArray(*MTLFunction)) -> void {
        func: #type (obj: *void, selector: *void, functions: *NSArray(*MTLFunction)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFunctions_, functions);
    }

/*!
* @property binaryFunctions
* @abstract The array of functions compiled to binary to be linked.
*/
    binaryFunctions :: (self: *MTLLinkedFunctions) -> *NSArray(*MTLFunction) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLFunction) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.binaryFunctions);
    }

    setBinaryFunctions_ :: (self: *MTLLinkedFunctions, binaryFunctions: *NSArray(*MTLFunction)) -> void {
        func: #type (obj: *void, selector: *void, binaryFunctions: *NSArray(*MTLFunction)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBinaryFunctions_, binaryFunctions);
    }

/*!
* @property groups
* @abstract Groups of functions, grouped to match callsites in the shader code.
*/
    groups :: (self: *MTLLinkedFunctions) -> *NSDictionary(*NSString, *NSArray(*MTLFunction)) {
        func: #type (obj: *void, selector: *void) -> *NSDictionary(*NSString, *NSArray(*MTLFunction)) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.groups);
    }

    setGroups_ :: (self: *MTLLinkedFunctions, groups: *NSDictionary(*NSString, *NSArray(*MTLFunction))) -> void {
        func: #type (obj: *void, selector: *void, groups: *NSDictionary(*NSString, *NSArray(*MTLFunction))) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setGroups_, groups);
    }

/*!
@property privateFunctions
@abstract The array of functions to be AIR linked.
@discussion These functions are not exported by the pipeline state as MTLFunctionHandle objects.
 Function pointer support is not required to link private functions.
*/
    privateFunctions :: (self: *MTLLinkedFunctions) -> *NSArray(*MTLFunction) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLFunction) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.privateFunctions);
    }

    setPrivateFunctions_ :: (self: *MTLLinkedFunctions, privateFunctions: *NSArray(*MTLFunction)) -> void {
        func: #type (obj: *void, selector: *void, privateFunctions: *NSArray(*MTLFunction)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPrivateFunctions_, privateFunctions);
    }

}

MTLComputePipelineReflection :: struct #type_info_none {
    nsobject: *NSObject;
    bindings :: (self: *MTLComputePipelineReflection) -> *NSArray(*MTLBinding) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLBinding) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bindings);
    }

    arguments :: (self: *MTLComputePipelineReflection) -> *NSArray(*MTLArgument) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLArgument) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.arguments);
    }

}

MTLComputePipelineDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @method reset
 @abstract Restore all compute pipeline descriptor properties to their default values.
 */
    reset :: (self: *MTLComputePipelineDescriptor) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

/*!
 @property label
 @abstract A string to help identify this object.
 */
    label :: (self: *MTLComputePipelineDescriptor) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLComputePipelineDescriptor, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

/*!
 @property computeFunction
 @abstract The function to use with the MTLComputePipelineState
 */
    computeFunction :: (self: *MTLComputePipelineDescriptor) -> *MTLFunction {
        func: #type (obj: *void, selector: *void) -> *MTLFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.computeFunction);
    }

    setComputeFunction_ :: (self: *MTLComputePipelineDescriptor, computeFunction: *MTLFunction) -> void {
        func: #type (obj: *void, selector: *void, computeFunction: *MTLFunction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setComputeFunction_, computeFunction);
    }

/*!
 @property threadGroupSizeIsMultipleOfThreadExecutionWidth
 @abstract An optimization flag, set if the thread group size will always be a multiple of thread execution width
 */
    threadGroupSizeIsMultipleOfThreadExecutionWidth :: (self: *MTLComputePipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.threadGroupSizeIsMultipleOfThreadExecutionWidth);
    }

    setThreadGroupSizeIsMultipleOfThreadExecutionWidth_ :: (self: *MTLComputePipelineDescriptor, threadGroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void {
        func: #type (obj: *void, selector: *void, threadGroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setThreadGroupSizeIsMultipleOfThreadExecutionWidth_, threadGroupSizeIsMultipleOfThreadExecutionWidth);
    }

/*!
 @property maxTotalThreadsPerThreadgroup
 @abstract Optional property. Set the maxTotalThreadsPerThreadgroup. If it is not set, returns zero.
 */
    maxTotalThreadsPerThreadgroup :: (self: *MTLComputePipelineDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadsPerThreadgroup);
    }

    setMaxTotalThreadsPerThreadgroup_ :: (self: *MTLComputePipelineDescriptor, maxTotalThreadsPerThreadgroup: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxTotalThreadsPerThreadgroup: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxTotalThreadsPerThreadgroup_, maxTotalThreadsPerThreadgroup);
    }

/*!
 @property computeDataDescriptor
 @abstract An MTLStageInputOutputDescriptor to fetch data from buffers
 */
    stageInputDescriptor :: (self: *MTLComputePipelineDescriptor) -> *MTLStageInputOutputDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLStageInputOutputDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stageInputDescriptor);
    }

    setStageInputDescriptor_ :: (self: *MTLComputePipelineDescriptor, stageInputDescriptor: *MTLStageInputOutputDescriptor) -> void {
        func: #type (obj: *void, selector: *void, stageInputDescriptor: *MTLStageInputOutputDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStageInputDescriptor_, stageInputDescriptor);
    }

/*!
 @property buffers
 @abstract Optional properties for each buffer binding used by the compute function.
 */
    buffers :: (self: *MTLComputePipelineDescriptor) -> *MTLPipelineBufferDescriptorArray {
        func: #type (obj: *void, selector: *void) -> *MTLPipelineBufferDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.buffers);
    }

/*!
 @property supportIndirectCommandBuffers
 @abstract This flag makes this pipeline usable with indirect command buffers.
 */
    supportIndirectCommandBuffers :: (self: *MTLComputePipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportIndirectCommandBuffers);
    }

    setSupportIndirectCommandBuffers_ :: (self: *MTLComputePipelineDescriptor, supportIndirectCommandBuffers: BOOL) -> void {
        func: #type (obj: *void, selector: *void, supportIndirectCommandBuffers: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportIndirectCommandBuffers_, supportIndirectCommandBuffers);
    }

/*!
 @property insertLibraries
 @abstract The set of MTLDynamicLibrary to use to resolve external symbols before considering symbols from dependent MTLDynamicLibrary.
 @discussion Typical workflows use the libraries property of MTLCompileOptions to record dependent libraries at compile time without having to use insertLibraries.
 This property can be used to override symbols from dependent libraries for experimentation or evaluating alternative implementations.
 It can also be used to provide dynamic libraries that are dynamically created (for example, from source) that have no stable installName that can be used to automatically load from the file system.
 @see MTLDynamicLibrary
 */
    insertLibraries :: (self: *MTLComputePipelineDescriptor) -> *NSArray(*MTLDynamicLibrary) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLDynamicLibrary) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.insertLibraries);
    }

    setInsertLibraries_ :: (self: *MTLComputePipelineDescriptor, insertLibraries: *NSArray(*MTLDynamicLibrary)) -> void {
        func: #type (obj: *void, selector: *void, insertLibraries: *NSArray(*MTLDynamicLibrary)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInsertLibraries_, insertLibraries);
    }

/*!
 @property preloadedLibraries
 @abstract The set of MTLDynamicLibrary to use to resolve external symbols before considering symbols from dependent MTLDynamicLibrary.
 @discussion Typical workflows use the libraries property of MTLCompileOptions to record dependent libraries at compile time without having to use preloadedLibraries.
 This property can be used to override symbols from dependent libraries for experimentation or evaluating alternative implementations.
 It can also be used to provide dynamic libraries that are dynamically created (for example, from source) that have no stable installName that can be used to automatically load from the file system.
 @see MTLDynamicLibrary
 */
    preloadedLibraries :: (self: *MTLComputePipelineDescriptor) -> *NSArray(*MTLDynamicLibrary) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLDynamicLibrary) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.preloadedLibraries);
    }

    setPreloadedLibraries_ :: (self: *MTLComputePipelineDescriptor, preloadedLibraries: *NSArray(*MTLDynamicLibrary)) -> void {
        func: #type (obj: *void, selector: *void, preloadedLibraries: *NSArray(*MTLDynamicLibrary)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPreloadedLibraries_, preloadedLibraries);
    }

/*!
 @property binaryArchives
 @abstract The set of MTLBinaryArchive to search for compiled code when creating the pipeline state.
 @discussion Accelerate pipeline state creation by providing archives of compiled code such that no compilation needs to happen on the fast path.
 @see MTLBinaryArchive
 */
    binaryArchives :: (self: *MTLComputePipelineDescriptor) -> *NSArray(*MTLBinaryArchive) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLBinaryArchive) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.binaryArchives);
    }

    setBinaryArchives_ :: (self: *MTLComputePipelineDescriptor, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void {
        func: #type (obj: *void, selector: *void, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBinaryArchives_, binaryArchives);
    }

/*!
 @property linkedFunctions
 @abstract The set of functions to be linked with the pipeline state and accessed from the compute function. 
 @see MTLLinkedFunctions
 */
    linkedFunctions :: (self: *MTLComputePipelineDescriptor) -> *MTLLinkedFunctions {
        func: #type (obj: *void, selector: *void) -> *MTLLinkedFunctions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.linkedFunctions);
    }

    setLinkedFunctions_ :: (self: *MTLComputePipelineDescriptor, linkedFunctions: *MTLLinkedFunctions) -> void {
        func: #type (obj: *void, selector: *void, linkedFunctions: *MTLLinkedFunctions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLinkedFunctions_, linkedFunctions);
    }

/*!
 @property supportAddingBinaryFunctions
 @abstract This flag makes this pipeline support creating a new pipeline by adding binary functions.
 */
    supportAddingBinaryFunctions :: (self: *MTLComputePipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportAddingBinaryFunctions);
    }

    setSupportAddingBinaryFunctions_ :: (self: *MTLComputePipelineDescriptor, supportAddingBinaryFunctions: BOOL) -> void {
        func: #type (obj: *void, selector: *void, supportAddingBinaryFunctions: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportAddingBinaryFunctions_, supportAddingBinaryFunctions);
    }

/*!
 @property maxCallStackDepth
 @abstract The maximum depth of the call stack in stack frames from the kernel. Defaults to 1 additional stack frame.
 */
    maxCallStackDepth :: (self: *MTLComputePipelineDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxCallStackDepth);
    }

    setMaxCallStackDepth_ :: (self: *MTLComputePipelineDescriptor, maxCallStackDepth: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxCallStackDepth: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxCallStackDepth_, maxCallStackDepth);
    }

/*!
 @property shaderValidation
 @abstract Toggle that determines whether Metal Shader Validation should be enabled or disabled for the pipeline.
 @discussion The value can be overridden using `MTL_SHADER_VALIDATION_ENABLE_PIPELINES` or `MTL_SHADER_VALIDATION_DISABLE_PIPELINES` Environment Variables.
 */
    shaderValidation :: (self: *MTLComputePipelineDescriptor) -> MTLShaderValidation {
        func: #type (obj: *void, selector: *void) -> MTLShaderValidation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.shaderValidation);
    }

    setShaderValidation_ :: (self: *MTLComputePipelineDescriptor, shaderValidation: MTLShaderValidation) -> void {
        func: #type (obj: *void, selector: *void, shaderValidation: MTLShaderValidation) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setShaderValidation_, shaderValidation);
    }

/*!
 @property requiredThreadsPerThreadgroup
 @abstract Sets the required threads-per-threadgroup during dispatches. The `threadsPerThreadgroup` argument of any dispatch must match this value if it is set.
           Setting this to a size of 0 in every dimension disables this property
*/
    requiredThreadsPerThreadgroup :: (self: *MTLComputePipelineDescriptor) -> MTLSize {
        func: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.requiredThreadsPerThreadgroup);
    }

    setRequiredThreadsPerThreadgroup_ :: (self: *MTLComputePipelineDescriptor, requiredThreadsPerThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, requiredThreadsPerThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRequiredThreadsPerThreadgroup_, requiredThreadsPerThreadgroup);
    }

}

MTLVisibleFunctionTableDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @method visibleFunctionTableDescriptor
 @abstract Create an autoreleased visible function table descriptor
 */
    visibleFunctionTableDescriptor :: () -> *MTLVisibleFunctionTableDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLVisibleFunctionTableDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLVisibleFunctionTableDescriptor"), __sel.visibleFunctionTableDescriptor);
    }

/*!
* @property functionCount
* @abstract The number of functions in the table.
*/
    functionCount :: (self: *MTLVisibleFunctionTableDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionCount);
    }

    setFunctionCount_ :: (self: *MTLVisibleFunctionTableDescriptor, functionCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, functionCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFunctionCount_, functionCount);
    }

}

MTLRenderPipelineColorAttachmentDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*! Pixel format.  Defaults to MTLPixelFormatInvalid */
    pixelFormat :: (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLPixelFormat {
        func: #type (obj: *void, selector: *void) -> MTLPixelFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pixelFormat);
    }

    setPixelFormat_ :: (self: *MTLRenderPipelineColorAttachmentDescriptor, pixelFormat: MTLPixelFormat) -> void {
        func: #type (obj: *void, selector: *void, pixelFormat: MTLPixelFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPixelFormat_, pixelFormat);
    }

    isBlendingEnabled :: (self: *MTLRenderPipelineColorAttachmentDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isBlendingEnabled);
    }

    setBlendingEnabled_ :: (self: *MTLRenderPipelineColorAttachmentDescriptor, blendingEnabled: BOOL) -> void {
        func: #type (obj: *void, selector: *void, blendingEnabled: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBlendingEnabled_, blendingEnabled);
    }

/*! Defaults to MTLBlendFactorOne */
    sourceRGBBlendFactor :: (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
        func: #type (obj: *void, selector: *void) -> MTLBlendFactor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sourceRGBBlendFactor);
    }

    setSourceRGBBlendFactor_ :: (self: *MTLRenderPipelineColorAttachmentDescriptor, sourceRGBBlendFactor: MTLBlendFactor) -> void {
        func: #type (obj: *void, selector: *void, sourceRGBBlendFactor: MTLBlendFactor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSourceRGBBlendFactor_, sourceRGBBlendFactor);
    }

/*! Defaults to MTLBlendFactorZero */
    destinationRGBBlendFactor :: (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
        func: #type (obj: *void, selector: *void) -> MTLBlendFactor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.destinationRGBBlendFactor);
    }

    setDestinationRGBBlendFactor_ :: (self: *MTLRenderPipelineColorAttachmentDescriptor, destinationRGBBlendFactor: MTLBlendFactor) -> void {
        func: #type (obj: *void, selector: *void, destinationRGBBlendFactor: MTLBlendFactor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDestinationRGBBlendFactor_, destinationRGBBlendFactor);
    }

/*! Defaults to MTLBlendOperationAdd */
    rgbBlendOperation :: (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendOperation {
        func: #type (obj: *void, selector: *void) -> MTLBlendOperation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.rgbBlendOperation);
    }

    setRgbBlendOperation_ :: (self: *MTLRenderPipelineColorAttachmentDescriptor, rgbBlendOperation: MTLBlendOperation) -> void {
        func: #type (obj: *void, selector: *void, rgbBlendOperation: MTLBlendOperation) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRgbBlendOperation_, rgbBlendOperation);
    }

/*! Defaults to MTLBlendFactorOne */
    sourceAlphaBlendFactor :: (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
        func: #type (obj: *void, selector: *void) -> MTLBlendFactor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sourceAlphaBlendFactor);
    }

    setSourceAlphaBlendFactor_ :: (self: *MTLRenderPipelineColorAttachmentDescriptor, sourceAlphaBlendFactor: MTLBlendFactor) -> void {
        func: #type (obj: *void, selector: *void, sourceAlphaBlendFactor: MTLBlendFactor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSourceAlphaBlendFactor_, sourceAlphaBlendFactor);
    }

/*! Defaults to MTLBlendFactorZero */
    destinationAlphaBlendFactor :: (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
        func: #type (obj: *void, selector: *void) -> MTLBlendFactor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.destinationAlphaBlendFactor);
    }

    setDestinationAlphaBlendFactor_ :: (self: *MTLRenderPipelineColorAttachmentDescriptor, destinationAlphaBlendFactor: MTLBlendFactor) -> void {
        func: #type (obj: *void, selector: *void, destinationAlphaBlendFactor: MTLBlendFactor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDestinationAlphaBlendFactor_, destinationAlphaBlendFactor);
    }

/*! Defaults to MTLBlendOperationAdd */
    alphaBlendOperation :: (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendOperation {
        func: #type (obj: *void, selector: *void) -> MTLBlendOperation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.alphaBlendOperation);
    }

    setAlphaBlendOperation_ :: (self: *MTLRenderPipelineColorAttachmentDescriptor, alphaBlendOperation: MTLBlendOperation) -> void {
        func: #type (obj: *void, selector: *void, alphaBlendOperation: MTLBlendOperation) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAlphaBlendOperation_, alphaBlendOperation);
    }

/*! Defaults to MTLColorWriteMaskAll */
    writeMask :: (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLColorWriteMask {
        func: #type (obj: *void, selector: *void) -> MTLColorWriteMask #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.writeMask);
    }

    setWriteMask_ :: (self: *MTLRenderPipelineColorAttachmentDescriptor, writeMask: MTLColorWriteMask) -> void {
        func: #type (obj: *void, selector: *void, writeMask: MTLColorWriteMask) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setWriteMask_, writeMask);
    }

}

/// Allows you to easily specify color attachment remapping from logical to physical indices.
MTLLogicalToPhysicalColorAttachmentMap :: struct #type_info_none {
    nsobject: *NSObject;
/// Maps a physical color attachment index to a logical index.
///
/// - Parameters:
///   - physicalIndex: index of the color attachment's physical mapping.
///   - logicalIndex: index of the color attachment's logical mapping.
    setPhysicalIndex_forLogicalIndex_ :: (self: *MTLLogicalToPhysicalColorAttachmentMap, physicalIndex: NSUInteger, logicalIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, physicalIndex: NSUInteger, logicalIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPhysicalIndex_forLogicalIndex_, physicalIndex, logicalIndex);
    }

/// Queries the physical color attachment index corresponding to a logical index.
    getPhysicalIndexForLogicalIndex_ :: (self: *MTLLogicalToPhysicalColorAttachmentMap, logicalIndex: NSUInteger) -> NSUInteger {
        func: #type (obj: *void, selector: *void, logicalIndex: NSUInteger) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.getPhysicalIndexForLogicalIndex_, logicalIndex);
    }

    reset :: (self: *MTLLogicalToPhysicalColorAttachmentMap) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

}

MTLRenderPipelineReflection :: struct #type_info_none {
    nsobject: *NSObject;
    vertexBindings :: (self: *MTLRenderPipelineReflection) -> *NSArray(*MTLBinding) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLBinding) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexBindings);
    }

    fragmentBindings :: (self: *MTLRenderPipelineReflection) -> *NSArray(*MTLBinding) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLBinding) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentBindings);
    }

    tileBindings :: (self: *MTLRenderPipelineReflection) -> *NSArray(*MTLBinding) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLBinding) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileBindings);
    }

    objectBindings :: (self: *MTLRenderPipelineReflection) -> *NSArray(*MTLBinding) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLBinding) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectBindings);
    }

    meshBindings :: (self: *MTLRenderPipelineReflection) -> *NSArray(*MTLBinding) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLBinding) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.meshBindings);
    }

    vertexArguments :: (self: *MTLRenderPipelineReflection) -> *NSArray(*MTLArgument) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLArgument) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexArguments);
    }

    fragmentArguments :: (self: *MTLRenderPipelineReflection) -> *NSArray(*MTLArgument) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLArgument) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentArguments);
    }

    tileArguments :: (self: *MTLRenderPipelineReflection) -> *NSArray(*MTLArgument) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLArgument) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileArguments);
    }

}

MTLRenderPipelineDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @method reset
 @abstract Restore all pipeline descriptor properties to their default values.
 */
    reset :: (self: *MTLRenderPipelineDescriptor) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

    label :: (self: *MTLRenderPipelineDescriptor) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLRenderPipelineDescriptor, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

    vertexFunction :: (self: *MTLRenderPipelineDescriptor) -> *MTLFunction {
        func: #type (obj: *void, selector: *void) -> *MTLFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexFunction);
    }

    setVertexFunction_ :: (self: *MTLRenderPipelineDescriptor, vertexFunction: *MTLFunction) -> void {
        func: #type (obj: *void, selector: *void, vertexFunction: *MTLFunction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexFunction_, vertexFunction);
    }

    fragmentFunction :: (self: *MTLRenderPipelineDescriptor) -> *MTLFunction {
        func: #type (obj: *void, selector: *void) -> *MTLFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentFunction);
    }

    setFragmentFunction_ :: (self: *MTLRenderPipelineDescriptor, fragmentFunction: *MTLFunction) -> void {
        func: #type (obj: *void, selector: *void, fragmentFunction: *MTLFunction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentFunction_, fragmentFunction);
    }

    vertexDescriptor :: (self: *MTLRenderPipelineDescriptor) -> *MTLVertexDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLVertexDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexDescriptor);
    }

    setVertexDescriptor_ :: (self: *MTLRenderPipelineDescriptor, vertexDescriptor: *MTLVertexDescriptor) -> void {
        func: #type (obj: *void, selector: *void, vertexDescriptor: *MTLVertexDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexDescriptor_, vertexDescriptor);
    }

/* Rasterization and visibility state */
    sampleCount :: (self: *MTLRenderPipelineDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleCount);
    }

    setSampleCount_ :: (self: *MTLRenderPipelineDescriptor, sampleCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSampleCount_, sampleCount);
    }

    rasterSampleCount :: (self: *MTLRenderPipelineDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.rasterSampleCount);
    }

    setRasterSampleCount_ :: (self: *MTLRenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, rasterSampleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRasterSampleCount_, rasterSampleCount);
    }

    isAlphaToCoverageEnabled :: (self: *MTLRenderPipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isAlphaToCoverageEnabled);
    }

    setAlphaToCoverageEnabled_ :: (self: *MTLRenderPipelineDescriptor, alphaToCoverageEnabled: BOOL) -> void {
        func: #type (obj: *void, selector: *void, alphaToCoverageEnabled: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAlphaToCoverageEnabled_, alphaToCoverageEnabled);
    }

    isAlphaToOneEnabled :: (self: *MTLRenderPipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isAlphaToOneEnabled);
    }

    setAlphaToOneEnabled_ :: (self: *MTLRenderPipelineDescriptor, alphaToOneEnabled: BOOL) -> void {
        func: #type (obj: *void, selector: *void, alphaToOneEnabled: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAlphaToOneEnabled_, alphaToOneEnabled);
    }

    isRasterizationEnabled :: (self: *MTLRenderPipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isRasterizationEnabled);
    }

    setRasterizationEnabled_ :: (self: *MTLRenderPipelineDescriptor, rasterizationEnabled: BOOL) -> void {
        func: #type (obj: *void, selector: *void, rasterizationEnabled: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRasterizationEnabled_, rasterizationEnabled);
    }

    maxVertexAmplificationCount :: (self: *MTLRenderPipelineDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxVertexAmplificationCount);
    }

    setMaxVertexAmplificationCount_ :: (self: *MTLRenderPipelineDescriptor, maxVertexAmplificationCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxVertexAmplificationCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxVertexAmplificationCount_, maxVertexAmplificationCount);
    }

    colorAttachments :: (self: *MTLRenderPipelineDescriptor) -> *MTLRenderPipelineColorAttachmentDescriptorArray {
        func: #type (obj: *void, selector: *void) -> *MTLRenderPipelineColorAttachmentDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.colorAttachments);
    }

    depthAttachmentPixelFormat :: (self: *MTLRenderPipelineDescriptor) -> MTLPixelFormat {
        func: #type (obj: *void, selector: *void) -> MTLPixelFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.depthAttachmentPixelFormat);
    }

    setDepthAttachmentPixelFormat_ :: (self: *MTLRenderPipelineDescriptor, depthAttachmentPixelFormat: MTLPixelFormat) -> void {
        func: #type (obj: *void, selector: *void, depthAttachmentPixelFormat: MTLPixelFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthAttachmentPixelFormat_, depthAttachmentPixelFormat);
    }

    stencilAttachmentPixelFormat :: (self: *MTLRenderPipelineDescriptor) -> MTLPixelFormat {
        func: #type (obj: *void, selector: *void) -> MTLPixelFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stencilAttachmentPixelFormat);
    }

    setStencilAttachmentPixelFormat_ :: (self: *MTLRenderPipelineDescriptor, stencilAttachmentPixelFormat: MTLPixelFormat) -> void {
        func: #type (obj: *void, selector: *void, stencilAttachmentPixelFormat: MTLPixelFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilAttachmentPixelFormat_, stencilAttachmentPixelFormat);
    }

    inputPrimitiveTopology :: (self: *MTLRenderPipelineDescriptor) -> MTLPrimitiveTopologyClass {
        func: #type (obj: *void, selector: *void) -> MTLPrimitiveTopologyClass #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.inputPrimitiveTopology);
    }

    setInputPrimitiveTopology_ :: (self: *MTLRenderPipelineDescriptor, inputPrimitiveTopology: MTLPrimitiveTopologyClass) -> void {
        func: #type (obj: *void, selector: *void, inputPrimitiveTopology: MTLPrimitiveTopologyClass) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInputPrimitiveTopology_, inputPrimitiveTopology);
    }

    tessellationPartitionMode :: (self: *MTLRenderPipelineDescriptor) -> MTLTessellationPartitionMode {
        func: #type (obj: *void, selector: *void) -> MTLTessellationPartitionMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tessellationPartitionMode);
    }

    setTessellationPartitionMode_ :: (self: *MTLRenderPipelineDescriptor, tessellationPartitionMode: MTLTessellationPartitionMode) -> void {
        func: #type (obj: *void, selector: *void, tessellationPartitionMode: MTLTessellationPartitionMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTessellationPartitionMode_, tessellationPartitionMode);
    }

    maxTessellationFactor :: (self: *MTLRenderPipelineDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTessellationFactor);
    }

    setMaxTessellationFactor_ :: (self: *MTLRenderPipelineDescriptor, maxTessellationFactor: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxTessellationFactor: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxTessellationFactor_, maxTessellationFactor);
    }

    isTessellationFactorScaleEnabled :: (self: *MTLRenderPipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isTessellationFactorScaleEnabled);
    }

    setTessellationFactorScaleEnabled_ :: (self: *MTLRenderPipelineDescriptor, tessellationFactorScaleEnabled: BOOL) -> void {
        func: #type (obj: *void, selector: *void, tessellationFactorScaleEnabled: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTessellationFactorScaleEnabled_, tessellationFactorScaleEnabled);
    }

    tessellationFactorFormat :: (self: *MTLRenderPipelineDescriptor) -> MTLTessellationFactorFormat {
        func: #type (obj: *void, selector: *void) -> MTLTessellationFactorFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tessellationFactorFormat);
    }

    setTessellationFactorFormat_ :: (self: *MTLRenderPipelineDescriptor, tessellationFactorFormat: MTLTessellationFactorFormat) -> void {
        func: #type (obj: *void, selector: *void, tessellationFactorFormat: MTLTessellationFactorFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTessellationFactorFormat_, tessellationFactorFormat);
    }

    tessellationControlPointIndexType :: (self: *MTLRenderPipelineDescriptor) -> MTLTessellationControlPointIndexType {
        func: #type (obj: *void, selector: *void) -> MTLTessellationControlPointIndexType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tessellationControlPointIndexType);
    }

    setTessellationControlPointIndexType_ :: (self: *MTLRenderPipelineDescriptor, tessellationControlPointIndexType: MTLTessellationControlPointIndexType) -> void {
        func: #type (obj: *void, selector: *void, tessellationControlPointIndexType: MTLTessellationControlPointIndexType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTessellationControlPointIndexType_, tessellationControlPointIndexType);
    }

    tessellationFactorStepFunction :: (self: *MTLRenderPipelineDescriptor) -> MTLTessellationFactorStepFunction {
        func: #type (obj: *void, selector: *void) -> MTLTessellationFactorStepFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tessellationFactorStepFunction);
    }

    setTessellationFactorStepFunction_ :: (self: *MTLRenderPipelineDescriptor, tessellationFactorStepFunction: MTLTessellationFactorStepFunction) -> void {
        func: #type (obj: *void, selector: *void, tessellationFactorStepFunction: MTLTessellationFactorStepFunction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTessellationFactorStepFunction_, tessellationFactorStepFunction);
    }

    tessellationOutputWindingOrder :: (self: *MTLRenderPipelineDescriptor) -> MTLWinding {
        func: #type (obj: *void, selector: *void) -> MTLWinding #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tessellationOutputWindingOrder);
    }

    setTessellationOutputWindingOrder_ :: (self: *MTLRenderPipelineDescriptor, tessellationOutputWindingOrder: MTLWinding) -> void {
        func: #type (obj: *void, selector: *void, tessellationOutputWindingOrder: MTLWinding) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTessellationOutputWindingOrder_, tessellationOutputWindingOrder);
    }

    vertexBuffers :: (self: *MTLRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray {
        func: #type (obj: *void, selector: *void) -> *MTLPipelineBufferDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexBuffers);
    }

    fragmentBuffers :: (self: *MTLRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray {
        func: #type (obj: *void, selector: *void) -> *MTLPipelineBufferDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentBuffers);
    }

    supportIndirectCommandBuffers :: (self: *MTLRenderPipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportIndirectCommandBuffers);
    }

    setSupportIndirectCommandBuffers_ :: (self: *MTLRenderPipelineDescriptor, supportIndirectCommandBuffers: BOOL) -> void {
        func: #type (obj: *void, selector: *void, supportIndirectCommandBuffers: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportIndirectCommandBuffers_, supportIndirectCommandBuffers);
    }

/*!
 @property binaryArchives
 @abstract The set of MTLBinaryArchive to search for compiled code when creating the pipeline state.
 @discussion Accelerate pipeline state creation by providing archives of compiled code such that no compilation needs to happen on the fast path.
 @see MTLBinaryArchive
 */
    binaryArchives :: (self: *MTLRenderPipelineDescriptor) -> *NSArray(*MTLBinaryArchive) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLBinaryArchive) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.binaryArchives);
    }

    setBinaryArchives_ :: (self: *MTLRenderPipelineDescriptor, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void {
        func: #type (obj: *void, selector: *void, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBinaryArchives_, binaryArchives);
    }

/*!
 @property vertexPreloadedLibraries
 @abstract The set of MTLDynamicLibrary to use to resolve external symbols for the vertexFunction before considering symbols from dependent MTLDynamicLibrary.
 @discussion Typical workflows use the libraries property of MTLCompileOptions to record dependent libraries at compile time without having to use vertexPreloadedLibraries.
 This property can be used to override symbols from dependent libraries for experimentation or evaluating alternative implementations.
 It can also be used to provide dynamic libraries that are dynamically created (for example, from source) that have no stable installName that can be used to automatically load from the file system.
 @see MTLDynamicLibrary
 */
    vertexPreloadedLibraries :: (self: *MTLRenderPipelineDescriptor) -> *NSArray(*MTLDynamicLibrary) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLDynamicLibrary) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexPreloadedLibraries);
    }

    setVertexPreloadedLibraries_ :: (self: *MTLRenderPipelineDescriptor, vertexPreloadedLibraries: *NSArray(*MTLDynamicLibrary)) -> void {
        func: #type (obj: *void, selector: *void, vertexPreloadedLibraries: *NSArray(*MTLDynamicLibrary)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexPreloadedLibraries_, vertexPreloadedLibraries);
    }

/*!
 @property fragmentPreloadedLibraries
 @abstract The set of MTLDynamicLibrary to use to resolve external symbols for the fragmentFunction before considering symbols from dependent MTLDynamicLibrary.
 @discussion Typical workflows use the libraries property of MTLCompileOptions to record dependent libraries at compile time without having to use fragmentPreloadedLibraries.
 This property can be used to override symbols from dependent libraries for experimentation or evaluating alternative implementations.
 It can also be used to provide dynamic libraries that are dynamically created (for example, from source) that have no stable installName that can be used to automatically load from the file system.
 @see MTLDynamicLibrary
 */
    fragmentPreloadedLibraries :: (self: *MTLRenderPipelineDescriptor) -> *NSArray(*MTLDynamicLibrary) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLDynamicLibrary) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentPreloadedLibraries);
    }

    setFragmentPreloadedLibraries_ :: (self: *MTLRenderPipelineDescriptor, fragmentPreloadedLibraries: *NSArray(*MTLDynamicLibrary)) -> void {
        func: #type (obj: *void, selector: *void, fragmentPreloadedLibraries: *NSArray(*MTLDynamicLibrary)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentPreloadedLibraries_, fragmentPreloadedLibraries);
    }

/*!
 @property vertexLinkedFunctions
 @abstract The set of functions to be linked with the pipeline state and accessed from the vertex function.
 @see MTLLinkedFunctions
 */
    vertexLinkedFunctions :: (self: *MTLRenderPipelineDescriptor) -> *MTLLinkedFunctions {
        func: #type (obj: *void, selector: *void) -> *MTLLinkedFunctions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexLinkedFunctions);
    }

    setVertexLinkedFunctions_ :: (self: *MTLRenderPipelineDescriptor, vertexLinkedFunctions: *MTLLinkedFunctions) -> void {
        func: #type (obj: *void, selector: *void, vertexLinkedFunctions: *MTLLinkedFunctions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexLinkedFunctions_, vertexLinkedFunctions);
    }

/*!
 @property fragmentLinkedFunctions
 @abstract The set of functions to be linked with the pipeline state and accessed from the fragment function.
 @see MTLLinkedFunctions
 */
    fragmentLinkedFunctions :: (self: *MTLRenderPipelineDescriptor) -> *MTLLinkedFunctions {
        func: #type (obj: *void, selector: *void) -> *MTLLinkedFunctions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentLinkedFunctions);
    }

    setFragmentLinkedFunctions_ :: (self: *MTLRenderPipelineDescriptor, fragmentLinkedFunctions: *MTLLinkedFunctions) -> void {
        func: #type (obj: *void, selector: *void, fragmentLinkedFunctions: *MTLLinkedFunctions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentLinkedFunctions_, fragmentLinkedFunctions);
    }

/*!
 @property supportAddingVertexBinaryFunctions
 @abstract This flag makes this pipeline support creating a new pipeline by adding binary functions.
 */
    supportAddingVertexBinaryFunctions :: (self: *MTLRenderPipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportAddingVertexBinaryFunctions);
    }

    setSupportAddingVertexBinaryFunctions_ :: (self: *MTLRenderPipelineDescriptor, supportAddingVertexBinaryFunctions: BOOL) -> void {
        func: #type (obj: *void, selector: *void, supportAddingVertexBinaryFunctions: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportAddingVertexBinaryFunctions_, supportAddingVertexBinaryFunctions);
    }

/*!
 @property supportFragmentAddingBinaryFunctions
 @abstract This flag makes this pipeline support creating a new pipeline by adding binary functions.
 */
    supportAddingFragmentBinaryFunctions :: (self: *MTLRenderPipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportAddingFragmentBinaryFunctions);
    }

    setSupportAddingFragmentBinaryFunctions_ :: (self: *MTLRenderPipelineDescriptor, supportAddingFragmentBinaryFunctions: BOOL) -> void {
        func: #type (obj: *void, selector: *void, supportAddingFragmentBinaryFunctions: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportAddingFragmentBinaryFunctions_, supportAddingFragmentBinaryFunctions);
    }

/*!
 @property maxVertexCallStackDepth
 @abstract The maximum depth of the call stack in stack frames from the shader. Defaults to 1 additional stack frame.
 */
    maxVertexCallStackDepth :: (self: *MTLRenderPipelineDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxVertexCallStackDepth);
    }

    setMaxVertexCallStackDepth_ :: (self: *MTLRenderPipelineDescriptor, maxVertexCallStackDepth: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxVertexCallStackDepth: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxVertexCallStackDepth_, maxVertexCallStackDepth);
    }

/*!
 @property maxFragmentCallStackDepth
 @abstract The maximum depth of the call stack in stack frames from the shader. Defaults to 1 additional stack frame.
 */
    maxFragmentCallStackDepth :: (self: *MTLRenderPipelineDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxFragmentCallStackDepth);
    }

    setMaxFragmentCallStackDepth_ :: (self: *MTLRenderPipelineDescriptor, maxFragmentCallStackDepth: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxFragmentCallStackDepth: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxFragmentCallStackDepth_, maxFragmentCallStackDepth);
    }

/*!
 @property shaderValidation
 @abstract Toggle that determines whether Metal Shader Validation should be enabled or disabled for the pipeline.
 @discussion The value can be overridden using `MTL_SHADER_VALIDATION_ENABLE_PIPELINES` or `MTL_SHADER_VALIDATION_DISABLE_PIPELINES` Environment Variables.
 */
    shaderValidation :: (self: *MTLRenderPipelineDescriptor) -> MTLShaderValidation {
        func: #type (obj: *void, selector: *void) -> MTLShaderValidation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.shaderValidation);
    }

    setShaderValidation_ :: (self: *MTLRenderPipelineDescriptor, shaderValidation: MTLShaderValidation) -> void {
        func: #type (obj: *void, selector: *void, shaderValidation: MTLShaderValidation) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setShaderValidation_, shaderValidation);
    }

}

MTLRenderPipelineFunctionsDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @property vertexAdditionalBinaryFunctions
 @abstract The set of additional binary functions to be accessed from the vertex function in an incrementally created pipeline state.
 */
    vertexAdditionalBinaryFunctions :: (self: *MTLRenderPipelineFunctionsDescriptor) -> *NSArray(*MTLFunction) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLFunction) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexAdditionalBinaryFunctions);
    }

    setVertexAdditionalBinaryFunctions_ :: (self: *MTLRenderPipelineFunctionsDescriptor, vertexAdditionalBinaryFunctions: *NSArray(*MTLFunction)) -> void {
        func: #type (obj: *void, selector: *void, vertexAdditionalBinaryFunctions: *NSArray(*MTLFunction)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexAdditionalBinaryFunctions_, vertexAdditionalBinaryFunctions);
    }

/*!
 @property fragmentAdditionalBinaryFunctions
 @abstract The set of additional binary functions to be accessed from the fragment function in an incrementally created pipeline state.
 */
    fragmentAdditionalBinaryFunctions :: (self: *MTLRenderPipelineFunctionsDescriptor) -> *NSArray(*MTLFunction) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLFunction) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentAdditionalBinaryFunctions);
    }

    setFragmentAdditionalBinaryFunctions_ :: (self: *MTLRenderPipelineFunctionsDescriptor, fragmentAdditionalBinaryFunctions: *NSArray(*MTLFunction)) -> void {
        func: #type (obj: *void, selector: *void, fragmentAdditionalBinaryFunctions: *NSArray(*MTLFunction)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentAdditionalBinaryFunctions_, fragmentAdditionalBinaryFunctions);
    }

/*!
 @property tileAdditionalBinaryFunctions
 @abstract The set of additional binary functions to be accessed from the tile function in an incrementally created pipeline state.
 */
    tileAdditionalBinaryFunctions :: (self: *MTLRenderPipelineFunctionsDescriptor) -> *NSArray(*MTLFunction) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLFunction) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileAdditionalBinaryFunctions);
    }

    setTileAdditionalBinaryFunctions_ :: (self: *MTLRenderPipelineFunctionsDescriptor, tileAdditionalBinaryFunctions: *NSArray(*MTLFunction)) -> void {
        func: #type (obj: *void, selector: *void, tileAdditionalBinaryFunctions: *NSArray(*MTLFunction)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileAdditionalBinaryFunctions_, tileAdditionalBinaryFunctions);
    }

}

MTLRenderPipelineColorAttachmentDescriptorArray :: struct #type_info_none {
    nsobject: *NSObject;
/* Individual attachment state access */
    objectAtIndexedSubscript_ :: (self: *MTLRenderPipelineColorAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLRenderPipelineColorAttachmentDescriptor {
        func: #type (obj: *void, selector: *void, attachmentIndex: NSUInteger) -> *MTLRenderPipelineColorAttachmentDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, attachmentIndex);
    }

/* This always uses 'copy' semantics.  It is safe to set the attachment state at any legal index to nil, which resets that attachment descriptor state to default values. */
    setObject_atIndexedSubscript_ :: (self: *MTLRenderPipelineColorAttachmentDescriptorArray, attachment: *MTLRenderPipelineColorAttachmentDescriptor, attachmentIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, attachment: *MTLRenderPipelineColorAttachmentDescriptor, attachmentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, attachment, attachmentIndex);
    }

}

MTLTileRenderPipelineColorAttachmentDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*! Pixel format.  Defaults to MTLPixelFormatInvalid */
    pixelFormat :: (self: *MTLTileRenderPipelineColorAttachmentDescriptor) -> MTLPixelFormat {
        func: #type (obj: *void, selector: *void) -> MTLPixelFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pixelFormat);
    }

    setPixelFormat_ :: (self: *MTLTileRenderPipelineColorAttachmentDescriptor, pixelFormat: MTLPixelFormat) -> void {
        func: #type (obj: *void, selector: *void, pixelFormat: MTLPixelFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPixelFormat_, pixelFormat);
    }

}

MTLTileRenderPipelineColorAttachmentDescriptorArray :: struct #type_info_none {
    nsobject: *NSObject;
/* Individual tile attachment state access */
    objectAtIndexedSubscript_ :: (self: *MTLTileRenderPipelineColorAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLTileRenderPipelineColorAttachmentDescriptor {
        func: #type (obj: *void, selector: *void, attachmentIndex: NSUInteger) -> *MTLTileRenderPipelineColorAttachmentDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, attachmentIndex);
    }

/* This always uses 'copy' semantics.  It is safe to set the attachment state at any legal index to nil, which resets that attachment descriptor state to default values. */
    setObject_atIndexedSubscript_ :: (self: *MTLTileRenderPipelineColorAttachmentDescriptorArray, attachment: *MTLTileRenderPipelineColorAttachmentDescriptor, attachmentIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, attachment: *MTLTileRenderPipelineColorAttachmentDescriptor, attachmentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, attachment, attachmentIndex);
    }

}

MTLTileRenderPipelineDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
    reset :: (self: *MTLTileRenderPipelineDescriptor) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

/*!
 @property label:
 @abstract The descriptor label.
 */
    label :: (self: *MTLTileRenderPipelineDescriptor) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLTileRenderPipelineDescriptor, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

/*!
 @property tileFunction:
 @abstract  The kernel or fragment function that serves as the tile shader for this pipeline.
 @discussion Both kernel-based and fragment-based tile pipelines dispatches will barrier against previous
 draws and other dispatches. Kernel-based pipelines will wait until all prior access to the tile completes.
 Fragment-based pipelines will only wait until all prior access to the fragment's location completes.
 */
    tileFunction :: (self: *MTLTileRenderPipelineDescriptor) -> *MTLFunction {
        func: #type (obj: *void, selector: *void) -> *MTLFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileFunction);
    }

    setTileFunction_ :: (self: *MTLTileRenderPipelineDescriptor, tileFunction: *MTLFunction) -> void {
        func: #type (obj: *void, selector: *void, tileFunction: *MTLFunction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileFunction_, tileFunction);
    }

/* Rasterization and visibility state */
    rasterSampleCount :: (self: *MTLTileRenderPipelineDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.rasterSampleCount);
    }

    setRasterSampleCount_ :: (self: *MTLTileRenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, rasterSampleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRasterSampleCount_, rasterSampleCount);
    }

    colorAttachments :: (self: *MTLTileRenderPipelineDescriptor) -> *MTLTileRenderPipelineColorAttachmentDescriptorArray {
        func: #type (obj: *void, selector: *void) -> *MTLTileRenderPipelineColorAttachmentDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.colorAttachments);
    }

/*!
 @property threadgroupSizeMatchesTileSize:
 @abstract Whether all threadgroups associated with this pipeline will cover tiles entirely.
 @discussion Metal can optimize code generation for this case.
 */
    threadgroupSizeMatchesTileSize :: (self: *MTLTileRenderPipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.threadgroupSizeMatchesTileSize);
    }

    setThreadgroupSizeMatchesTileSize_ :: (self: *MTLTileRenderPipelineDescriptor, threadgroupSizeMatchesTileSize: BOOL) -> void {
        func: #type (obj: *void, selector: *void, threadgroupSizeMatchesTileSize: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setThreadgroupSizeMatchesTileSize_, threadgroupSizeMatchesTileSize);
    }

    tileBuffers :: (self: *MTLTileRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray {
        func: #type (obj: *void, selector: *void) -> *MTLPipelineBufferDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileBuffers);
    }

/*!
 @property maxTotalThreadsPerThreadgroup
 @abstract Optional property. Set the maxTotalThreadsPerThreadgroup. If it is not set, returns zero.
 */
    maxTotalThreadsPerThreadgroup :: (self: *MTLTileRenderPipelineDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadsPerThreadgroup);
    }

    setMaxTotalThreadsPerThreadgroup_ :: (self: *MTLTileRenderPipelineDescriptor, maxTotalThreadsPerThreadgroup: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxTotalThreadsPerThreadgroup: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxTotalThreadsPerThreadgroup_, maxTotalThreadsPerThreadgroup);
    }

/*!
 @property binaryArchives
 @abstract The set of MTLBinaryArchive to search for compiled code when creating the pipeline state.
 @discussion Accelerate pipeline state creation by providing archives of compiled code such that no compilation needs to happen on the fast path.
 @see MTLBinaryArchive
 */
    binaryArchives :: (self: *MTLTileRenderPipelineDescriptor) -> *NSArray(*MTLBinaryArchive) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLBinaryArchive) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.binaryArchives);
    }

    setBinaryArchives_ :: (self: *MTLTileRenderPipelineDescriptor, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void {
        func: #type (obj: *void, selector: *void, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBinaryArchives_, binaryArchives);
    }

/*!
 @property preloadedLibraries
 @abstract The set of MTLDynamicLibrary to use to resolve external symbols before considering symbols from dependent MTLDynamicLibrary.
 @discussion Typical workflows use the libraries property of MTLCompileOptions to record dependent libraries at compile time without having to use preloadedLibraries.
 This property can be used to override symbols from dependent libraries for experimentation or evaluating alternative implementations.
 It can also be used to provide dynamic libraries that are dynamically created (for example, from source) that have no stable installName that can be used to automatically load from the file system.
 @see MTLDynamicLibrary
 */
    preloadedLibraries :: (self: *MTLTileRenderPipelineDescriptor) -> *NSArray(*MTLDynamicLibrary) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLDynamicLibrary) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.preloadedLibraries);
    }

    setPreloadedLibraries_ :: (self: *MTLTileRenderPipelineDescriptor, preloadedLibraries: *NSArray(*MTLDynamicLibrary)) -> void {
        func: #type (obj: *void, selector: *void, preloadedLibraries: *NSArray(*MTLDynamicLibrary)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPreloadedLibraries_, preloadedLibraries);
    }

/*!
 @property linkedFunctions
 @abstract The set of functions to be linked with the pipeline state and accessed from the tile function.
 @see MTLLinkedFunctions
 */
    linkedFunctions :: (self: *MTLTileRenderPipelineDescriptor) -> *MTLLinkedFunctions {
        func: #type (obj: *void, selector: *void) -> *MTLLinkedFunctions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.linkedFunctions);
    }

    setLinkedFunctions_ :: (self: *MTLTileRenderPipelineDescriptor, linkedFunctions: *MTLLinkedFunctions) -> void {
        func: #type (obj: *void, selector: *void, linkedFunctions: *MTLLinkedFunctions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLinkedFunctions_, linkedFunctions);
    }

/*!
 @property supportAddingBinaryFunctions
 @abstract This flag makes this pipeline support creating a new pipeline by adding binary functions.
 */
    supportAddingBinaryFunctions :: (self: *MTLTileRenderPipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportAddingBinaryFunctions);
    }

    setSupportAddingBinaryFunctions_ :: (self: *MTLTileRenderPipelineDescriptor, supportAddingBinaryFunctions: BOOL) -> void {
        func: #type (obj: *void, selector: *void, supportAddingBinaryFunctions: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportAddingBinaryFunctions_, supportAddingBinaryFunctions);
    }

/*!
 @property maxCallStackDepth
 @abstract The maximum depth of the call stack in stack frames from the tile function. Defaults to 1 additional stack frame.
 */
    maxCallStackDepth :: (self: *MTLTileRenderPipelineDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxCallStackDepth);
    }

    setMaxCallStackDepth_ :: (self: *MTLTileRenderPipelineDescriptor, maxCallStackDepth: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxCallStackDepth: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxCallStackDepth_, maxCallStackDepth);
    }

/*!
 @property shaderValidation
 @abstract Toggle that determines whether Metal Shader Validation should be enabled or disabled for the pipeline.
 @discussion The value can be overridden using `MTL_SHADER_VALIDATION_ENABLE_PIPELINES` or `MTL_SHADER_VALIDATION_DISABLE_PIPELINES` Environment Variables.
 */
    shaderValidation :: (self: *MTLTileRenderPipelineDescriptor) -> MTLShaderValidation {
        func: #type (obj: *void, selector: *void) -> MTLShaderValidation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.shaderValidation);
    }

    setShaderValidation_ :: (self: *MTLTileRenderPipelineDescriptor, shaderValidation: MTLShaderValidation) -> void {
        func: #type (obj: *void, selector: *void, shaderValidation: MTLShaderValidation) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setShaderValidation_, shaderValidation);
    }

/*!
 @property requiredThreadsPerThreadgroup
 @abstract Sets the required threads-per-threadgroup during tile dispatches. The `threadsPerTile` argument of any tile dispatch must match to this value if it is set.
           Setting this to a size of 0 in every dimension disables this property
*/
    requiredThreadsPerThreadgroup :: (self: *MTLTileRenderPipelineDescriptor) -> MTLSize {
        func: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.requiredThreadsPerThreadgroup);
    }

    setRequiredThreadsPerThreadgroup_ :: (self: *MTLTileRenderPipelineDescriptor, requiredThreadsPerThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, requiredThreadsPerThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRequiredThreadsPerThreadgroup_, requiredThreadsPerThreadgroup);
    }

}

/*!
 @class MTLMeshRenderPipelineDescriptor
 @discussion As an alternative to a vertex + fragment shader render pipeline, this render pipeline uses a (object +) mesh + fragment shader for rendering geometry.
 */
MTLMeshRenderPipelineDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @method reset
 @abstract Restore all mesh pipeline descriptor properties to their default values.
 */
    reset :: (self: *MTLMeshRenderPipelineDescriptor) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

/*!
 @property label
 @discussion A name or description provided by the application that will be displayed in debugging tools.
 The default value is nil.
 */
    label :: (self: *MTLMeshRenderPipelineDescriptor) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLMeshRenderPipelineDescriptor, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

/*!
 @property objectFunction
 @discussion Optional shader function responsible for determining how many threadgroups of the mesh shader to run, can optionally provide payload data for the mesh stage.
 If this is nil, no payload data is available to the mesh function, and the draw command determines how many threadgroups of the mesh stage to run.
 The default value is nil.
 */
    objectFunction :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLFunction {
        func: #type (obj: *void, selector: *void) -> *MTLFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectFunction);
    }

    setObjectFunction_ :: (self: *MTLMeshRenderPipelineDescriptor, objectFunction: *MTLFunction) -> void {
        func: #type (obj: *void, selector: *void, objectFunction: *MTLFunction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectFunction_, objectFunction);
    }

/*!
 @property meshFunction
 @discussion Shader function responsible for exporting a chunk of geometry per threadgroup for the rasterizer.
 The default value is nil.
 */
    meshFunction :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLFunction {
        func: #type (obj: *void, selector: *void) -> *MTLFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.meshFunction);
    }

    setMeshFunction_ :: (self: *MTLMeshRenderPipelineDescriptor, meshFunction: *MTLFunction) -> void {
        func: #type (obj: *void, selector: *void, meshFunction: *MTLFunction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshFunction_, meshFunction);
    }

/*!
 @property fragmentFunction
 @discussion Like a classical render pipeline, this fragments covered by the rasterized geometry are shaded with this function.
 The default value is nil. To create a pipeline, you must either set fragmentFunction to non-nil, or set rasterizationEnabled to NO.
 */
    fragmentFunction :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLFunction {
        func: #type (obj: *void, selector: *void) -> *MTLFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentFunction);
    }

    setFragmentFunction_ :: (self: *MTLMeshRenderPipelineDescriptor, fragmentFunction: *MTLFunction) -> void {
        func: #type (obj: *void, selector: *void, fragmentFunction: *MTLFunction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentFunction_, fragmentFunction);
    }

/*!
 @property maxTotalThreadsPerObjectThreadgroup
 @discussion The maximum size of the product of threadsPerObjectThreadgroup that can be used for draws with this pipeline.
 This information can be used by the optimizer to generate more efficient code, specifically when the specified value does not exceed the thread execution width of the underlying GPU.
 The default value is 0, which means that the value specified with the [[max_total_threads_per_threadgroup(N)]] specified on objectFunction will be used.
 When both the [[max_total_threads_per_threadgroup(N)]] attribute and a non-zero value are specified, both values must match.
 Any value specified cannot exceed the device limit as documented in the "Metal Feature Set Tables" for "Maximum threads per threadgroup".
 */
    maxTotalThreadsPerObjectThreadgroup :: (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadsPerObjectThreadgroup);
    }

    setMaxTotalThreadsPerObjectThreadgroup_ :: (self: *MTLMeshRenderPipelineDescriptor, maxTotalThreadsPerObjectThreadgroup: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxTotalThreadsPerObjectThreadgroup: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxTotalThreadsPerObjectThreadgroup_, maxTotalThreadsPerObjectThreadgroup);
    }

/*!
 @property maxTotalThreadsPerMeshThreadgroup
 @discussion The maximum size of the product of threadsPerMeshThreadgroup that can be used for draws with this pipeline.
 This information can be used by the optimizer to generate more efficient code, specifically when the specified value does not exceed the thread execution width of the underlying GPU.
 The default value is 0, which means that the value specified with the [[max_total_threads_per_threadgroup(N)]] specified on meshFunction will be used.
 When both the [[max_total_threads_per_threadgroup(N)]] attribute and a non-zero value are specified, both values must match.
 Any value specified cannot exceed the device limit as documented in the "Metal Feature Set Tables" for "Maximum threads per threadgroup".
 */
    maxTotalThreadsPerMeshThreadgroup :: (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadsPerMeshThreadgroup);
    }

    setMaxTotalThreadsPerMeshThreadgroup_ :: (self: *MTLMeshRenderPipelineDescriptor, maxTotalThreadsPerMeshThreadgroup: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxTotalThreadsPerMeshThreadgroup: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxTotalThreadsPerMeshThreadgroup_, maxTotalThreadsPerMeshThreadgroup);
    }

/*!
 @property objectThreadgroupSizeIsMultipleOfThreadExecutionWidth
 @discussion Set this value to YES when you will only use draws with the product of threadsPerObjectThreadgroup set to a multiple of the objectThreadExecutionWidth of the returned pipeline state.
 This information can be used by the optimizer to generate more efficient code.
 The default value is NO.
 */
    objectThreadgroupSizeIsMultipleOfThreadExecutionWidth :: (self: *MTLMeshRenderPipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectThreadgroupSizeIsMultipleOfThreadExecutionWidth);
    }

    setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth_ :: (self: *MTLMeshRenderPipelineDescriptor, objectThreadgroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void {
        func: #type (obj: *void, selector: *void, objectThreadgroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth_, objectThreadgroupSizeIsMultipleOfThreadExecutionWidth);
    }

/*!
 @property meshThreadgroupSizeIsMultipleOfThreadExecutionWidth
 @discussion Set this value to YES when you will only use draws with the product of threadsPerMeshThreadgroup set to a multiple of the meshThreadExecutionWidth of the returned pipeline state.
 This information can be used by the optimizer to generate more efficient code.
 The default value is NO.
 */
    meshThreadgroupSizeIsMultipleOfThreadExecutionWidth :: (self: *MTLMeshRenderPipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.meshThreadgroupSizeIsMultipleOfThreadExecutionWidth);
    }

    setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth_ :: (self: *MTLMeshRenderPipelineDescriptor, meshThreadgroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void {
        func: #type (obj: *void, selector: *void, meshThreadgroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth_, meshThreadgroupSizeIsMultipleOfThreadExecutionWidth);
    }

/*!
 @property payloadMemoryLength
 @discussion The size, in bytes, of the buffer indicated by [[payload]] in the object and mesh shader.
 If this value is 0, the size of the dereferenced type declared in the object shader for the buffer is used (space for a single element is assumed for pointers).
 The default value is 0.
 */
    payloadMemoryLength :: (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.payloadMemoryLength);
    }

    setPayloadMemoryLength_ :: (self: *MTLMeshRenderPipelineDescriptor, payloadMemoryLength: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, payloadMemoryLength: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPayloadMemoryLength_, payloadMemoryLength);
    }

/*!
 @property maxTotalThreadgroupsPerMeshGrid
 @discussion The maximum value of the product of vector elements that the object shader may pass to the mesh_grid_properties::set_threadgroups_per_grid built-in function.
 The default value is 0, which means that the value specified with the [[max_total_threadgroups_per_mesh_grid(N)]] specified on objectFunction will be used.
 When both the [[max_total_threadgroups_per_mesh_grid(N)]] attribute and a non-zero value are specified, both values must match.
 Any value specified cannot exceed the device limit as documented in the "Metal Feature Set Tables" for "Maximum threadgroups per mesh grid".
 Specifying this value is optional; it may be used to improve scheduling of the workload. If neither this value nor the shader attribute are used, the device's maximum supported value is used instead.
 */
    maxTotalThreadgroupsPerMeshGrid :: (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadgroupsPerMeshGrid);
    }

    setMaxTotalThreadgroupsPerMeshGrid_ :: (self: *MTLMeshRenderPipelineDescriptor, maxTotalThreadgroupsPerMeshGrid: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxTotalThreadgroupsPerMeshGrid: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxTotalThreadgroupsPerMeshGrid_, maxTotalThreadgroupsPerMeshGrid);
    }

/*!
 @property objectBuffers
 @abstract Provide mutability information on the buffers used by objectFunction.
 @discussion Specifying these values is optional; it may be used to optimize the shader code.
 */
    objectBuffers :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray {
        func: #type (obj: *void, selector: *void) -> *MTLPipelineBufferDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectBuffers);
    }

/*!
 @property meshBuffers
 @abstract Provide mutability information on the buffers used by meshFunction.
 @discussion Specifying these values is optional; it may be used to optimize the shader code.
 */
    meshBuffers :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray {
        func: #type (obj: *void, selector: *void) -> *MTLPipelineBufferDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.meshBuffers);
    }

/*!
 @property fragmentBuffers
 @abstract Provide mutability information on the buffers used by fragmentFunction.
 @discussion Specifying these values is optional; it may be used to optimize the shader code.
 */
    fragmentBuffers :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray {
        func: #type (obj: *void, selector: *void) -> *MTLPipelineBufferDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentBuffers);
    }

/*!
 @property rasterSampleCount
 @discussion The number of samples per fragment of the render pass in which this pipeline will be used.
 */
    rasterSampleCount :: (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.rasterSampleCount);
    }

    setRasterSampleCount_ :: (self: *MTLMeshRenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, rasterSampleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRasterSampleCount_, rasterSampleCount);
    }

    isAlphaToCoverageEnabled :: (self: *MTLMeshRenderPipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isAlphaToCoverageEnabled);
    }

    setAlphaToCoverageEnabled_ :: (self: *MTLMeshRenderPipelineDescriptor, alphaToCoverageEnabled: BOOL) -> void {
        func: #type (obj: *void, selector: *void, alphaToCoverageEnabled: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAlphaToCoverageEnabled_, alphaToCoverageEnabled);
    }

    isAlphaToOneEnabled :: (self: *MTLMeshRenderPipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isAlphaToOneEnabled);
    }

    setAlphaToOneEnabled_ :: (self: *MTLMeshRenderPipelineDescriptor, alphaToOneEnabled: BOOL) -> void {
        func: #type (obj: *void, selector: *void, alphaToOneEnabled: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAlphaToOneEnabled_, alphaToOneEnabled);
    }

    isRasterizationEnabled :: (self: *MTLMeshRenderPipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isRasterizationEnabled);
    }

    setRasterizationEnabled_ :: (self: *MTLMeshRenderPipelineDescriptor, rasterizationEnabled: BOOL) -> void {
        func: #type (obj: *void, selector: *void, rasterizationEnabled: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRasterizationEnabled_, rasterizationEnabled);
    }

/*!
 @property maxVertexAmplificationCount
 @abstract The maximum value that can be passed to setVertexAmplificationCount when using this pipeline.
 @discussion The default value is 1. The value must be supported by the device, which can be checked with supportsVertexAmplificationCount.
 */
    maxVertexAmplificationCount :: (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxVertexAmplificationCount);
    }

    setMaxVertexAmplificationCount_ :: (self: *MTLMeshRenderPipelineDescriptor, maxVertexAmplificationCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxVertexAmplificationCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxVertexAmplificationCount_, maxVertexAmplificationCount);
    }

/*!
 @property colorAttachments
 @abstract Describes the color attachments of the render pass in which this pipeline will be used.
 */
    colorAttachments :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLRenderPipelineColorAttachmentDescriptorArray {
        func: #type (obj: *void, selector: *void) -> *MTLRenderPipelineColorAttachmentDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.colorAttachments);
    }

/*!
 @property depthAttachmentPixelFormat
 @abstract The pixel format of the depth attachment of the render pass in which this pipeline will be used.
 @discussion The default value is MTLPixelFormatInvalid; indicating no depth attachment will be used.
 */
    depthAttachmentPixelFormat :: (self: *MTLMeshRenderPipelineDescriptor) -> MTLPixelFormat {
        func: #type (obj: *void, selector: *void) -> MTLPixelFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.depthAttachmentPixelFormat);
    }

    setDepthAttachmentPixelFormat_ :: (self: *MTLMeshRenderPipelineDescriptor, depthAttachmentPixelFormat: MTLPixelFormat) -> void {
        func: #type (obj: *void, selector: *void, depthAttachmentPixelFormat: MTLPixelFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthAttachmentPixelFormat_, depthAttachmentPixelFormat);
    }

/*!
 @property stencilAttachmentPixelFormat
 @abstract The pixel format of the stencil attachment of the render pass in which this pipeline will be used.
 @discussion The default value is MTLPixelFormatInvalid; indicating no stencil attachment will be used.
 */
    stencilAttachmentPixelFormat :: (self: *MTLMeshRenderPipelineDescriptor) -> MTLPixelFormat {
        func: #type (obj: *void, selector: *void) -> MTLPixelFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stencilAttachmentPixelFormat);
    }

    setStencilAttachmentPixelFormat_ :: (self: *MTLMeshRenderPipelineDescriptor, stencilAttachmentPixelFormat: MTLPixelFormat) -> void {
        func: #type (obj: *void, selector: *void, stencilAttachmentPixelFormat: MTLPixelFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilAttachmentPixelFormat_, stencilAttachmentPixelFormat);
    }

/*!
 @property supportIndirectCommandBuffers
 @abstract Whether this pipeline will support being used by commands in an indirect command buffer.
 @discussion The default value is NO.
 */
    supportIndirectCommandBuffers :: (self: *MTLMeshRenderPipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportIndirectCommandBuffers);
    }

    setSupportIndirectCommandBuffers_ :: (self: *MTLMeshRenderPipelineDescriptor, supportIndirectCommandBuffers: BOOL) -> void {
        func: #type (obj: *void, selector: *void, supportIndirectCommandBuffers: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportIndirectCommandBuffers_, supportIndirectCommandBuffers);
    }

/*!
 @property binaryArchives
 @abstract The set of MTLBinaryArchive to search for compiled code when creating the pipeline state.
 @discussion Accelerate pipeline state creation by providing archives of compiled code such that no compilation needs to happen on the fast path.
 @see MTLBinaryArchive
 */
    binaryArchives :: (self: *MTLMeshRenderPipelineDescriptor) -> *NSArray(*MTLBinaryArchive) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLBinaryArchive) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.binaryArchives);
    }

    setBinaryArchives_ :: (self: *MTLMeshRenderPipelineDescriptor, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void {
        func: #type (obj: *void, selector: *void, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBinaryArchives_, binaryArchives);
    }

/*!
 @property objectLinkedFunctions
 @abstract The set of functions to be linked with the pipeline state and accessed from the object function.
 @see MTLLinkedFunctions
 */
    objectLinkedFunctions :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLLinkedFunctions {
        func: #type (obj: *void, selector: *void) -> *MTLLinkedFunctions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectLinkedFunctions);
    }

    setObjectLinkedFunctions_ :: (self: *MTLMeshRenderPipelineDescriptor, objectLinkedFunctions: *MTLLinkedFunctions) -> void {
        func: #type (obj: *void, selector: *void, objectLinkedFunctions: *MTLLinkedFunctions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectLinkedFunctions_, objectLinkedFunctions);
    }

/*!
 @property meshLinkedFunctions
 @abstract The set of functions to be linked with the pipeline state and accessed from the mesh function.
 @see MTLLinkedFunctions
 */
    meshLinkedFunctions :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLLinkedFunctions {
        func: #type (obj: *void, selector: *void) -> *MTLLinkedFunctions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.meshLinkedFunctions);
    }

    setMeshLinkedFunctions_ :: (self: *MTLMeshRenderPipelineDescriptor, meshLinkedFunctions: *MTLLinkedFunctions) -> void {
        func: #type (obj: *void, selector: *void, meshLinkedFunctions: *MTLLinkedFunctions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshLinkedFunctions_, meshLinkedFunctions);
    }

/*!
 @property fragmentLinkedFunctions
 @abstract The set of functions to be linked with the pipeline state and accessed from the fragment function.
 @see MTLLinkedFunctions
 */
    fragmentLinkedFunctions :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLLinkedFunctions {
        func: #type (obj: *void, selector: *void) -> *MTLLinkedFunctions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentLinkedFunctions);
    }

    setFragmentLinkedFunctions_ :: (self: *MTLMeshRenderPipelineDescriptor, fragmentLinkedFunctions: *MTLLinkedFunctions) -> void {
        func: #type (obj: *void, selector: *void, fragmentLinkedFunctions: *MTLLinkedFunctions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentLinkedFunctions_, fragmentLinkedFunctions);
    }

/*!
 @property shaderValidation
 @abstract Toggle that determines whether Metal Shader Validation should be enabled or disabled for the pipeline.
 @discussion The value can be overridden using `MTL_SHADER_VALIDATION_ENABLE_PIPELINES` or `MTL_SHADER_VALIDATION_DISABLE_PIPELINES` Environment Variables.
 */
    shaderValidation :: (self: *MTLMeshRenderPipelineDescriptor) -> MTLShaderValidation {
        func: #type (obj: *void, selector: *void) -> MTLShaderValidation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.shaderValidation);
    }

    setShaderValidation_ :: (self: *MTLMeshRenderPipelineDescriptor, shaderValidation: MTLShaderValidation) -> void {
        func: #type (obj: *void, selector: *void, shaderValidation: MTLShaderValidation) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setShaderValidation_, shaderValidation);
    }

/*!
 @property requiredThreadsPerObjectThreadgroup
 @abstract Sets the required object threads-per-threadgroup during mesh draws. The `threadsPerObjectThreadgroup` argument of any draw must match to this value if it is set.
           Setting this to a size of 0 in every dimension disables this property
*/
    requiredThreadsPerObjectThreadgroup :: (self: *MTLMeshRenderPipelineDescriptor) -> MTLSize {
        func: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.requiredThreadsPerObjectThreadgroup);
    }

    setRequiredThreadsPerObjectThreadgroup_ :: (self: *MTLMeshRenderPipelineDescriptor, requiredThreadsPerObjectThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, requiredThreadsPerObjectThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRequiredThreadsPerObjectThreadgroup_, requiredThreadsPerObjectThreadgroup);
    }

/*!
 @property requiredThreadsPerMeshThreadgroup
 @abstract Sets the required mesh threads-per-threadgroup during mesh draws. The `threadsPerMeshThreadgroup` argument of any draw must match to this value if it is set.
           Setting this to a size of 0 in every dimension disables this property
*/
    requiredThreadsPerMeshThreadgroup :: (self: *MTLMeshRenderPipelineDescriptor) -> MTLSize {
        func: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.requiredThreadsPerMeshThreadgroup);
    }

    setRequiredThreadsPerMeshThreadgroup_ :: (self: *MTLMeshRenderPipelineDescriptor, requiredThreadsPerMeshThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, requiredThreadsPerMeshThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRequiredThreadsPerMeshThreadgroup_, requiredThreadsPerMeshThreadgroup);
    }

}

/*!
 @class MTLSamplerDescriptor
 @abstract A mutable descriptor used to configure a sampler.  When complete, this can be used to create an immutable MTLSamplerState.
 */
MTLSamplerDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @property minFilter
 @abstract Filter option for combining texels within a mipmap level the sample footprint is larger than a pixel (minification).
 @discussion The default value is MTLSamplerMinMagFilterNearest.
 */
    minFilter :: (self: *MTLSamplerDescriptor) -> MTLSamplerMinMagFilter {
        func: #type (obj: *void, selector: *void) -> MTLSamplerMinMagFilter #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.minFilter);
    }

    setMinFilter_ :: (self: *MTLSamplerDescriptor, minFilter: MTLSamplerMinMagFilter) -> void {
        func: #type (obj: *void, selector: *void, minFilter: MTLSamplerMinMagFilter) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMinFilter_, minFilter);
    }

/*!
 @property magFilter
 @abstract Filter option for combining texels within a mipmap level the sample footprint is smaller than a pixel (magnification).
 @discussion The default value is MTLSamplerMinMagFilterNearest.
 */
    magFilter :: (self: *MTLSamplerDescriptor) -> MTLSamplerMinMagFilter {
        func: #type (obj: *void, selector: *void) -> MTLSamplerMinMagFilter #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.magFilter);
    }

    setMagFilter_ :: (self: *MTLSamplerDescriptor, magFilter: MTLSamplerMinMagFilter) -> void {
        func: #type (obj: *void, selector: *void, magFilter: MTLSamplerMinMagFilter) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMagFilter_, magFilter);
    }

/*!
 @property mipFilter
 @abstract Filter options for filtering between two mipmap levels.
 @discussion The default value is MTLSamplerMipFilterNotMipmapped
 */
    mipFilter :: (self: *MTLSamplerDescriptor) -> MTLSamplerMipFilter {
        func: #type (obj: *void, selector: *void) -> MTLSamplerMipFilter #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.mipFilter);
    }

    setMipFilter_ :: (self: *MTLSamplerDescriptor, mipFilter: MTLSamplerMipFilter) -> void {
        func: #type (obj: *void, selector: *void, mipFilter: MTLSamplerMipFilter) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMipFilter_, mipFilter);
    }

/*!
 @property maxAnisotropy
 @abstract The number of samples that can be taken to improve quality of sample footprints that are anisotropic.
 @discussion The default value is 1.
 */
    maxAnisotropy :: (self: *MTLSamplerDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxAnisotropy);
    }

    setMaxAnisotropy_ :: (self: *MTLSamplerDescriptor, maxAnisotropy: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxAnisotropy: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxAnisotropy_, maxAnisotropy);
    }

/*!
 @property sAddressMode
 @abstract Set the wrap mode for the S texture coordinate.  The default value is MTLSamplerAddressModeClampToEdge.
 */
    sAddressMode :: (self: *MTLSamplerDescriptor) -> MTLSamplerAddressMode {
        func: #type (obj: *void, selector: *void) -> MTLSamplerAddressMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sAddressMode);
    }

    setSAddressMode_ :: (self: *MTLSamplerDescriptor, sAddressMode: MTLSamplerAddressMode) -> void {
        func: #type (obj: *void, selector: *void, sAddressMode: MTLSamplerAddressMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSAddressMode_, sAddressMode);
    }

/*!
 @property tAddressMode
 @abstract Set the wrap mode for the T texture coordinate.  The default value is MTLSamplerAddressModeClampToEdge.
 */
    tAddressMode :: (self: *MTLSamplerDescriptor) -> MTLSamplerAddressMode {
        func: #type (obj: *void, selector: *void) -> MTLSamplerAddressMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tAddressMode);
    }

    setTAddressMode_ :: (self: *MTLSamplerDescriptor, tAddressMode: MTLSamplerAddressMode) -> void {
        func: #type (obj: *void, selector: *void, tAddressMode: MTLSamplerAddressMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTAddressMode_, tAddressMode);
    }

/*!
 @property rAddressMode
 @abstract Set the wrap mode for the R texture coordinate.  The default value is MTLSamplerAddressModeClampToEdge.
 */
    rAddressMode :: (self: *MTLSamplerDescriptor) -> MTLSamplerAddressMode {
        func: #type (obj: *void, selector: *void) -> MTLSamplerAddressMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.rAddressMode);
    }

    setRAddressMode_ :: (self: *MTLSamplerDescriptor, rAddressMode: MTLSamplerAddressMode) -> void {
        func: #type (obj: *void, selector: *void, rAddressMode: MTLSamplerAddressMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRAddressMode_, rAddressMode);
    }

/*!
 @property borderColor
 @abstract Set the color for the MTLSamplerAddressMode to one of the predefined in the MTLSamplerBorderColor enum.
 */
    borderColor :: (self: *MTLSamplerDescriptor) -> MTLSamplerBorderColor {
        func: #type (obj: *void, selector: *void) -> MTLSamplerBorderColor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.borderColor);
    }

    setBorderColor_ :: (self: *MTLSamplerDescriptor, borderColor: MTLSamplerBorderColor) -> void {
        func: #type (obj: *void, selector: *void, borderColor: MTLSamplerBorderColor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBorderColor_, borderColor);
    }

/// Sets the reduction mode for filtering contributing samples.
///
/// The property's default value is ``MTLSamplerReductionModeWeightedAverage``.
/// The sampler ignores this property if any of the following property values are equal to a specific value:
///  - The sampler's ``mipFilter`` property is equal to ``MTLSamplerMipFilterNotMipmapped``.
///  - The sampler's ``mipFilter`` property is equal to ``MTLSamplerMipFilterNearest``.
///  - The sampler's ``minFilter`` property is equal to ``MTLSamplerMinMagFilterNearest``.
///  - The sampler's ``magFilter`` property is equal to ``MTLSamplerMinMagFilterNearest``.
    reductionMode :: (self: *MTLSamplerDescriptor) -> MTLSamplerReductionMode {
        func: #type (obj: *void, selector: *void) -> MTLSamplerReductionMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reductionMode);
    }

    setReductionMode_ :: (self: *MTLSamplerDescriptor, reductionMode: MTLSamplerReductionMode) -> void {
        func: #type (obj: *void, selector: *void, reductionMode: MTLSamplerReductionMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setReductionMode_, reductionMode);
    }

/*!
 @property normalizedCoordinates.
 @abstract If YES, texture coordates are from 0 to 1.  If NO, texture coordinates are 0..width, 0..height.
 @discussion normalizedCoordinates defaults to YES.  Non-normalized coordinates should only be used with 1D and 2D textures with the ClampToEdge wrap mode, otherwise the results of sampling are undefined.
 */
    normalizedCoordinates :: (self: *MTLSamplerDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.normalizedCoordinates);
    }

    setNormalizedCoordinates_ :: (self: *MTLSamplerDescriptor, normalizedCoordinates: BOOL) -> void {
        func: #type (obj: *void, selector: *void, normalizedCoordinates: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setNormalizedCoordinates_, normalizedCoordinates);
    }

/*!
 @property lodMinClamp
 @abstract The minimum level of detail that will be used when sampling from a texture.
 @discussion The default value of lodMinClamp is 0.0.  Clamp values are ignored for texture sample variants that specify an explicit level of detail.
 */
    lodMinClamp :: (self: *MTLSamplerDescriptor) -> float32 {
        func: #type (obj: *void, selector: *void) -> float32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.lodMinClamp);
    }

    setLodMinClamp_ :: (self: *MTLSamplerDescriptor, lodMinClamp: float32) -> void {
        func: #type (obj: *void, selector: *void, lodMinClamp: float32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLodMinClamp_, lodMinClamp);
    }

/*!
 @property lodMaxClamp
 @abstract The maximum level of detail that will be used when sampling from a texture.
 @discussion The default value of lodMaxClamp is FLT_MAX.  Clamp values are ignored for texture sample variants that specify an explicit level of detail.
 */
    lodMaxClamp :: (self: *MTLSamplerDescriptor) -> float32 {
        func: #type (obj: *void, selector: *void) -> float32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.lodMaxClamp);
    }

    setLodMaxClamp_ :: (self: *MTLSamplerDescriptor, lodMaxClamp: float32) -> void {
        func: #type (obj: *void, selector: *void, lodMaxClamp: float32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLodMaxClamp_, lodMaxClamp);
    }

/*!
 @property lodAverage
 @abstract If YES, an average level of detail will be used when sampling from a texture. If NO, no averaging is performed.
 @discussion lodAverage defaults to NO. This option is a performance hint. An implementation is free to ignore this property.
 */
    lodAverage :: (self: *MTLSamplerDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.lodAverage);
    }

    setLodAverage_ :: (self: *MTLSamplerDescriptor, lodAverage: BOOL) -> void {
        func: #type (obj: *void, selector: *void, lodAverage: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLodAverage_, lodAverage);
    }

/// Sets the level-of-detail (lod) bias when sampling from a texture.
///
/// The property's default value is `0.0f`.
/// The precision format is `S4.6`, and the range is `[-16.0, 15.999]`.
    lodBias :: (self: *MTLSamplerDescriptor) -> float32 {
        func: #type (obj: *void, selector: *void) -> float32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.lodBias);
    }

    setLodBias_ :: (self: *MTLSamplerDescriptor, lodBias: float32) -> void {
        func: #type (obj: *void, selector: *void, lodBias: float32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLodBias_, lodBias);
    }

/*!
 @property compareFunction
 @abstract Set the comparison function used when sampling shadow maps. The default value is MTLCompareFunctionNever.
 */
    compareFunction :: (self: *MTLSamplerDescriptor) -> MTLCompareFunction {
        func: #type (obj: *void, selector: *void) -> MTLCompareFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.compareFunction);
    }

    setCompareFunction_ :: (self: *MTLSamplerDescriptor, compareFunction: MTLCompareFunction) -> void {
        func: #type (obj: *void, selector: *void, compareFunction: MTLCompareFunction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCompareFunction_, compareFunction);
    }

/*!
 @property supportArgumentBuffers
 @abstract true if the sampler can be used inside an argument buffer
*/
    supportArgumentBuffers :: (self: *MTLSamplerDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportArgumentBuffers);
    }

    setSupportArgumentBuffers_ :: (self: *MTLSamplerDescriptor, supportArgumentBuffers: BOOL) -> void {
        func: #type (obj: *void, selector: *void, supportArgumentBuffers: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportArgumentBuffers_, supportArgumentBuffers);
    }

/*!
 @property label
 @abstract A string to help identify the created object.
 */
    label :: (self: *MTLSamplerDescriptor) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLSamplerDescriptor, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

}

/**
 * @brief Base class for acceleration structure descriptors. Do not use this class directly. Use
 * one of the derived classes instead.
 */
MTLAccelerationStructureDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
    usage :: (self: *MTLAccelerationStructureDescriptor) -> MTLAccelerationStructureUsage {
        func: #type (obj: *void, selector: *void) -> MTLAccelerationStructureUsage #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.usage);
    }

    setUsage_ :: (self: *MTLAccelerationStructureDescriptor, usage: MTLAccelerationStructureUsage) -> void {
        func: #type (obj: *void, selector: *void, usage: MTLAccelerationStructureUsage) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setUsage_, usage);
    }

}

/**
 * @brief Base class for all geometry descriptors. Do not use this class directly. Use one of the derived
 * classes instead.
 */
MTLAccelerationStructureGeometryDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
    intersectionFunctionTableOffset :: (self: *MTLAccelerationStructureGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.intersectionFunctionTableOffset);
    }

    setIntersectionFunctionTableOffset_ :: (self: *MTLAccelerationStructureGeometryDescriptor, intersectionFunctionTableOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, intersectionFunctionTableOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIntersectionFunctionTableOffset_, intersectionFunctionTableOffset);
    }

/**
 * @brief Whether the geometry is opaque
 */
    opaque :: (self: *MTLAccelerationStructureGeometryDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.opaque);
    }

    setOpaque_ :: (self: *MTLAccelerationStructureGeometryDescriptor, opaque: BOOL) -> void {
        func: #type (obj: *void, selector: *void, opaque: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOpaque_, opaque);
    }

/**
 * @brief Whether intersection functions may be invoked more than once per ray/primitive
 * intersection. Defaults to YES.
 */
    allowDuplicateIntersectionFunctionInvocation :: (self: *MTLAccelerationStructureGeometryDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.allowDuplicateIntersectionFunctionInvocation);
    }

    setAllowDuplicateIntersectionFunctionInvocation_ :: (self: *MTLAccelerationStructureGeometryDescriptor, allowDuplicateIntersectionFunctionInvocation: BOOL) -> void {
        func: #type (obj: *void, selector: *void, allowDuplicateIntersectionFunctionInvocation: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAllowDuplicateIntersectionFunctionInvocation_, allowDuplicateIntersectionFunctionInvocation);
    }

/**
 * @brief Label
 */
    label :: (self: *MTLAccelerationStructureGeometryDescriptor) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLAccelerationStructureGeometryDescriptor, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

/**
 * @brief Data buffer containing per-primitive data. May be nil.
 */
    primitiveDataBuffer :: (self: *MTLAccelerationStructureGeometryDescriptor) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.primitiveDataBuffer);
    }

    setPrimitiveDataBuffer_ :: (self: *MTLAccelerationStructureGeometryDescriptor, primitiveDataBuffer: *MTLBuffer) -> void {
        func: #type (obj: *void, selector: *void, primitiveDataBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPrimitiveDataBuffer_, primitiveDataBuffer);
    }

/**
 * @brief Primitive data buffer offset in bytes. Must be aligned to the platform's buffer offset alignment. Defaults to 0 bytes.
 */
    primitiveDataBufferOffset :: (self: *MTLAccelerationStructureGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.primitiveDataBufferOffset);
    }

    setPrimitiveDataBufferOffset_ :: (self: *MTLAccelerationStructureGeometryDescriptor, primitiveDataBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveDataBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPrimitiveDataBufferOffset_, primitiveDataBufferOffset);
    }

/**
 * @brief Stride, in bytes, between per-primitive data in the primitive data buffer. Must be at least primitiveDataElementSize and must be a
 * multiple of 4 bytes. Defaults to 0 bytes. Assumed to be equal to primitiveDataElementSize if zero.
 */
    primitiveDataStride :: (self: *MTLAccelerationStructureGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.primitiveDataStride);
    }

    setPrimitiveDataStride_ :: (self: *MTLAccelerationStructureGeometryDescriptor, primitiveDataStride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveDataStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPrimitiveDataStride_, primitiveDataStride);
    }

/**
 * @brief Size, in bytes, of the data for each primitive in the primitive data buffer. Must be at most primitiveDataStride and must be a
 * multiple of 4 bytes. Defaults to 0 bytes.
 */
    primitiveDataElementSize :: (self: *MTLAccelerationStructureGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.primitiveDataElementSize);
    }

    setPrimitiveDataElementSize_ :: (self: *MTLAccelerationStructureGeometryDescriptor, primitiveDataElementSize: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveDataElementSize: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPrimitiveDataElementSize_, primitiveDataElementSize);
    }

}

/**
 * @brief Descriptor for a primitive acceleration structure
 */
MTLPrimitiveAccelerationStructureDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
    descriptor :: () -> *MTLPrimitiveAccelerationStructureDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLPrimitiveAccelerationStructureDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLPrimitiveAccelerationStructureDescriptor"), __sel.descriptor);
    }

/**
 * @brief Array of geometry descriptors. If motionKeyframeCount is greater than one all geometryDescriptors
 * must be motion versions and have motionKeyframeCount of primitive buffers.
 */
    geometryDescriptors :: (self: *MTLPrimitiveAccelerationStructureDescriptor) -> *NSArray(*MTLAccelerationStructureGeometryDescriptor) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLAccelerationStructureGeometryDescriptor) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.geometryDescriptors);
    }

    setGeometryDescriptors_ :: (self: *MTLPrimitiveAccelerationStructureDescriptor, geometryDescriptors: *NSArray(*MTLAccelerationStructureGeometryDescriptor)) -> void {
        func: #type (obj: *void, selector: *void, geometryDescriptors: *NSArray(*MTLAccelerationStructureGeometryDescriptor)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setGeometryDescriptors_, geometryDescriptors);
    }

/**
 * @brief Motion border mode describing what happens if acceleration structure is sampled before
 * motionStartTime. If not set defaults to MTLMotionBorderModeClamp.
 */
    motionStartBorderMode :: (self: *MTLPrimitiveAccelerationStructureDescriptor) -> MTLMotionBorderMode {
        func: #type (obj: *void, selector: *void) -> MTLMotionBorderMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionStartBorderMode);
    }

    setMotionStartBorderMode_ :: (self: *MTLPrimitiveAccelerationStructureDescriptor, motionStartBorderMode: MTLMotionBorderMode) -> void {
        func: #type (obj: *void, selector: *void, motionStartBorderMode: MTLMotionBorderMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionStartBorderMode_, motionStartBorderMode);
    }

/**
 * @brief Motion border mode describing what happens if acceleration structure is sampled after
 * motionEndTime. If not set defaults to MTLMotionBorderModeClamp.
 */
    motionEndBorderMode :: (self: *MTLPrimitiveAccelerationStructureDescriptor) -> MTLMotionBorderMode {
        func: #type (obj: *void, selector: *void) -> MTLMotionBorderMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionEndBorderMode);
    }

    setMotionEndBorderMode_ :: (self: *MTLPrimitiveAccelerationStructureDescriptor, motionEndBorderMode: MTLMotionBorderMode) -> void {
        func: #type (obj: *void, selector: *void, motionEndBorderMode: MTLMotionBorderMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionEndBorderMode_, motionEndBorderMode);
    }

/**
 * @brief Motion start time of this geometry. If not set defaults to 0.0f.
 */
    motionStartTime :: (self: *MTLPrimitiveAccelerationStructureDescriptor) -> float32 {
        func: #type (obj: *void, selector: *void) -> float32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionStartTime);
    }

    setMotionStartTime_ :: (self: *MTLPrimitiveAccelerationStructureDescriptor, motionStartTime: float32) -> void {
        func: #type (obj: *void, selector: *void, motionStartTime: float32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionStartTime_, motionStartTime);
    }

/**
 * @brief Motion end time of this geometry. If not set defaults to 1.0f.
 */
    motionEndTime :: (self: *MTLPrimitiveAccelerationStructureDescriptor) -> float32 {
        func: #type (obj: *void, selector: *void) -> float32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionEndTime);
    }

    setMotionEndTime_ :: (self: *MTLPrimitiveAccelerationStructureDescriptor, motionEndTime: float32) -> void {
        func: #type (obj: *void, selector: *void, motionEndTime: float32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionEndTime_, motionEndTime);
    }

/**
 * @brief Motion keyframe count. Is 1 by default which means no motion.
 */
    motionKeyframeCount :: (self: *MTLPrimitiveAccelerationStructureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionKeyframeCount);
    }

    setMotionKeyframeCount_ :: (self: *MTLPrimitiveAccelerationStructureDescriptor, motionKeyframeCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, motionKeyframeCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionKeyframeCount_, motionKeyframeCount);
    }

}

/**
 * @brief Descriptor for triangle geometry
 */
MTLAccelerationStructureTriangleGeometryDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
    descriptor :: () -> *MTLAccelerationStructureTriangleGeometryDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLAccelerationStructureTriangleGeometryDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLAccelerationStructureTriangleGeometryDescriptor"), __sel.descriptor);
    }

/**
 * @brief Vertex buffer containing triangle vertices. Each vertex position must be formatted
 * according to the vertex format. Must not be nil.
 */
    vertexBuffer :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexBuffer);
    }

    setVertexBuffer_ :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, vertexBuffer: *MTLBuffer) -> void {
        func: #type (obj: *void, selector: *void, vertexBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexBuffer_, vertexBuffer);
    }

/**
 * @brief Vertex buffer offset. Must be a multiple of the vertex stride and must be aligned to the
 * platform's buffer offset alignment.
 */
    vertexBufferOffset :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexBufferOffset);
    }

    setVertexBufferOffset_ :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, vertexBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, vertexBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexBufferOffset_, vertexBufferOffset);
    }

/**
 * @brief Format type of the vertex buffer.
 * Defaults to MTLAttributeFormatFloat3 (packed).
 */
    vertexFormat :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> MTLAttributeFormat {
        func: #type (obj: *void, selector: *void) -> MTLAttributeFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexFormat);
    }

    setVertexFormat_ :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, vertexFormat: MTLAttributeFormat) -> void {
        func: #type (obj: *void, selector: *void, vertexFormat: MTLAttributeFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexFormat_, vertexFormat);
    }

/**
 * @brief Stride, in bytes, between vertices in the vertex buffer. Must be a multiple of the vertex format data type size and must be aligned to
 * the vertex format data type's alignment. Defaults to 0, which will result in a stride of the vertex format data size.
 */
    vertexStride :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexStride);
    }

    setVertexStride_ :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, vertexStride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, vertexStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexStride_, vertexStride);
    }

/**
 * Optional index buffer containing references to vertices in the vertex buffer. May be nil.
 */
    indexBuffer :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexBuffer);
    }

    setIndexBuffer_ :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, indexBuffer: *MTLBuffer) -> void {
        func: #type (obj: *void, selector: *void, indexBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexBuffer_, indexBuffer);
    }

/**
 * @brief Index buffer offset. Must be a multiple of the index data type size and must be aligned to both
 * the index data type's alignment and the platform's buffer offset alignment.
 */
    indexBufferOffset :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexBufferOffset);
    }

    setIndexBufferOffset_ :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, indexBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, indexBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexBufferOffset_, indexBufferOffset);
    }

/**
 * @brief Index type
 */
    indexType :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> MTLIndexType {
        func: #type (obj: *void, selector: *void) -> MTLIndexType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexType);
    }

    setIndexType_ :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, indexType: MTLIndexType) -> void {
        func: #type (obj: *void, selector: *void, indexType: MTLIndexType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexType_, indexType);
    }

/**
 * @brief Number of triangles
 */
    triangleCount :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.triangleCount);
    }

    setTriangleCount_ :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, triangleCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, triangleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTriangleCount_, triangleCount);
    }

/**
 * @brief Buffer containing packed float4x3 transformation matrix. Transform is applied to the vertex data when building the acceleration structure. Input vertex buffers are not modified.
 * When set to nil, transformation matrix is not applied to vertex data.
 */
    transformationMatrixBuffer :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.transformationMatrixBuffer);
    }

    setTransformationMatrixBuffer_ :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, transformationMatrixBuffer: *MTLBuffer) -> void {
        func: #type (obj: *void, selector: *void, transformationMatrixBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTransformationMatrixBuffer_, transformationMatrixBuffer);
    }

/**
 * @brief Transformation matrix buffer offset. Must be a multiple of 4 bytes. Defaults to 0.
 */
    transformationMatrixBufferOffset :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.transformationMatrixBufferOffset);
    }

    setTransformationMatrixBufferOffset_ :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, transformationMatrixBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, transformationMatrixBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTransformationMatrixBufferOffset_, transformationMatrixBufferOffset);
    }

/**
 * @brief Matrix layout for the transformation matrix in the transformation
 * matrix buffer. Defaults to MTLMatrixLayoutColumnMajor.
 */
    transformationMatrixLayout :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> MTLMatrixLayout {
        func: #type (obj: *void, selector: *void) -> MTLMatrixLayout #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.transformationMatrixLayout);
    }

    setTransformationMatrixLayout_ :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, transformationMatrixLayout: MTLMatrixLayout) -> void {
        func: #type (obj: *void, selector: *void, transformationMatrixLayout: MTLMatrixLayout) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTransformationMatrixLayout_, transformationMatrixLayout);
    }

}

/**
 * @brief Descriptor for bounding box geometry
 */
MTLAccelerationStructureBoundingBoxGeometryDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
    descriptor :: () -> *MTLAccelerationStructureBoundingBoxGeometryDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLAccelerationStructureBoundingBoxGeometryDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLAccelerationStructureBoundingBoxGeometryDescriptor"), __sel.descriptor);
    }

/**
 * @brief Bounding box buffer containing MTLAxisAlignedBoundingBoxes. Must not be nil.
 */
    boundingBoxBuffer :: (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.boundingBoxBuffer);
    }

    setBoundingBoxBuffer_ :: (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxBuffer: *MTLBuffer) -> void {
        func: #type (obj: *void, selector: *void, boundingBoxBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBoundingBoxBuffer_, boundingBoxBuffer);
    }

/**
 * @brief Bounding box buffer offset. Must be a multiple of the bounding box stride and must be
 * aligned to the platform's buffer offset alignment.
 */
    boundingBoxBufferOffset :: (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.boundingBoxBufferOffset);
    }

    setBoundingBoxBufferOffset_ :: (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, boundingBoxBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBoundingBoxBufferOffset_, boundingBoxBufferOffset);
    }

/**
 * @brief Stride, in bytes, between bounding boxes in the bounding box buffer. Must be at least 24
 * bytes and must be a multiple of 4 bytes. Defaults to 24 bytes.
 */
    boundingBoxStride :: (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.boundingBoxStride);
    }

    setBoundingBoxStride_ :: (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxStride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, boundingBoxStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBoundingBoxStride_, boundingBoxStride);
    }

/**
 * @brief Number of bounding boxes
 */
    boundingBoxCount :: (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.boundingBoxCount);
    }

    setBoundingBoxCount_ :: (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, boundingBoxCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBoundingBoxCount_, boundingBoxCount);
    }

}

/**
 * @brief MTLbuffer and description how the data is stored in it.
 */
MTLMotionKeyframeData :: struct #type_info_none {
    nsobject: *NSObject;
    data :: () -> *MTLMotionKeyframeData {
        func: #type (obj: *void, selector: *void) -> *MTLMotionKeyframeData #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLMotionKeyframeData"), __sel.data);
    }

/**
 * @brief Buffer containing the data of a single keyframe. Multiple keyframes can be interleaved in one MTLBuffer.
 */
    buffer :: (self: *MTLMotionKeyframeData) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.buffer);
    }

    setBuffer_ :: (self: *MTLMotionKeyframeData, buffer: *MTLBuffer) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBuffer_, buffer);
    }

/**
 * @brief Buffer offset. Must be a multiple of 4 bytes.
 */
    offset :: (self: *MTLMotionKeyframeData) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.offset);
    }

    setOffset_ :: (self: *MTLMotionKeyframeData, offset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, offset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOffset_, offset);
    }

}

/**
 * @brief Descriptor for motion triangle geometry
 */
MTLAccelerationStructureMotionTriangleGeometryDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
    descriptor :: () -> *MTLAccelerationStructureMotionTriangleGeometryDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLAccelerationStructureMotionTriangleGeometryDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLAccelerationStructureMotionTriangleGeometryDescriptor"), __sel.descriptor);
    }

/**
 * @brief Vertex buffer containing triangle vertices similar to what MTLAccelerationStructureTriangleGeometryDescriptor has but array of the values.
 */
    vertexBuffers :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> *NSArray(*MTLMotionKeyframeData) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLMotionKeyframeData) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexBuffers);
    }

    setVertexBuffers_ :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, vertexBuffers: *NSArray(*MTLMotionKeyframeData)) -> void {
        func: #type (obj: *void, selector: *void, vertexBuffers: *NSArray(*MTLMotionKeyframeData)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexBuffers_, vertexBuffers);
    }

/**
 * @brief Format type of the vertex buffers across all keyframes.
 * Defaults to MTLAttributeFormatFloat3 (packed).
 */
    vertexFormat :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> MTLAttributeFormat {
        func: #type (obj: *void, selector: *void) -> MTLAttributeFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexFormat);
    }

    setVertexFormat_ :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, vertexFormat: MTLAttributeFormat) -> void {
        func: #type (obj: *void, selector: *void, vertexFormat: MTLAttributeFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexFormat_, vertexFormat);
    }

/**
 * @brief Stride, in bytes, between vertices in each keyframe's vertex buffer. Must be a multiple of the vertex format data type size and must be aligned to
 * the vertex format data type's alignment. Defaults to 0, which will result in a stride of the vertex format data size.
 */
    vertexStride :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexStride);
    }

    setVertexStride_ :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, vertexStride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, vertexStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexStride_, vertexStride);
    }

/**
 * Optional index buffer containing references to vertices in the vertex buffer. May be nil.
 */
    indexBuffer :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexBuffer);
    }

    setIndexBuffer_ :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, indexBuffer: *MTLBuffer) -> void {
        func: #type (obj: *void, selector: *void, indexBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexBuffer_, indexBuffer);
    }

/**
 * @brief Index buffer offset. Must be a multiple of the index data type size and must be aligned to both
 * the index data type's alignment and the platform's buffer offset alignment.
 */
    indexBufferOffset :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexBufferOffset);
    }

    setIndexBufferOffset_ :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, indexBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, indexBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexBufferOffset_, indexBufferOffset);
    }

/**
 * @brief Index type
 */
    indexType :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> MTLIndexType {
        func: #type (obj: *void, selector: *void) -> MTLIndexType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexType);
    }

    setIndexType_ :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, indexType: MTLIndexType) -> void {
        func: #type (obj: *void, selector: *void, indexType: MTLIndexType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexType_, indexType);
    }

/**
 * @brief Number of triangles
 */
    triangleCount :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.triangleCount);
    }

    setTriangleCount_ :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, triangleCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, triangleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTriangleCount_, triangleCount);
    }

/**
 * @brief Buffer containing packed float4x3 transformation matrix. Transform is applied to the vertex data when building the acceleration structure. Input vertex buffers are not modified.
 * The transformation matrix is applied to all keyframes' vertex data.
 * When set to nil, transformation matrix is not applied to vertex data.
 */
    transformationMatrixBuffer :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.transformationMatrixBuffer);
    }

    setTransformationMatrixBuffer_ :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, transformationMatrixBuffer: *MTLBuffer) -> void {
        func: #type (obj: *void, selector: *void, transformationMatrixBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTransformationMatrixBuffer_, transformationMatrixBuffer);
    }

/**
 * @brief Transformation matrix buffer offset. Must be a multiple of 4 bytes. Defaults to 0.
 */
    transformationMatrixBufferOffset :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.transformationMatrixBufferOffset);
    }

    setTransformationMatrixBufferOffset_ :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, transformationMatrixBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, transformationMatrixBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTransformationMatrixBufferOffset_, transformationMatrixBufferOffset);
    }

/**
 * @brief Matrix layout for the transformation matrix in the transformation
 * matrix buffer. Defaults to MTLMatrixLayoutColumnMajor.
 */
    transformationMatrixLayout :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> MTLMatrixLayout {
        func: #type (obj: *void, selector: *void) -> MTLMatrixLayout #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.transformationMatrixLayout);
    }

    setTransformationMatrixLayout_ :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, transformationMatrixLayout: MTLMatrixLayout) -> void {
        func: #type (obj: *void, selector: *void, transformationMatrixLayout: MTLMatrixLayout) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTransformationMatrixLayout_, transformationMatrixLayout);
    }

}

/**
 * @brief Descriptor for motion bounding box geometry
 */
MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
    descriptor :: () -> *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor"), __sel.descriptor);
    }

/**
 * @brief Bounding box buffer containing MTLAxisAlignedBoundingBoxes similar to what MTLAccelerationStructureBoundingBoxGeometryDescriptor has but array of the values.
 */
    boundingBoxBuffers :: (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor) -> *NSArray(*MTLMotionKeyframeData) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLMotionKeyframeData) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.boundingBoxBuffers);
    }

    setBoundingBoxBuffers_ :: (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxBuffers: *NSArray(*MTLMotionKeyframeData)) -> void {
        func: #type (obj: *void, selector: *void, boundingBoxBuffers: *NSArray(*MTLMotionKeyframeData)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBoundingBoxBuffers_, boundingBoxBuffers);
    }

/**
 * @brief Stride, in bytes, between bounding boxes in the bounding box buffer. Must be at least 24
 * bytes and must be a multiple of 4 bytes. Defaults to 24 bytes.
 */
    boundingBoxStride :: (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.boundingBoxStride);
    }

    setBoundingBoxStride_ :: (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxStride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, boundingBoxStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBoundingBoxStride_, boundingBoxStride);
    }

/**
 * @brief Number of bounding boxes
 */
    boundingBoxCount :: (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.boundingBoxCount);
    }

    setBoundingBoxCount_ :: (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, boundingBoxCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBoundingBoxCount_, boundingBoxCount);
    }

}

/**
 * @brief Acceleration structure geometry descriptor describing geometry
 * made of curve primitives
 */
MTLAccelerationStructureCurveGeometryDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
    descriptor :: () -> *MTLAccelerationStructureCurveGeometryDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLAccelerationStructureCurveGeometryDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLAccelerationStructureCurveGeometryDescriptor"), __sel.descriptor);
    }

/**
 * @brief Buffer containing curve control points. Each control point must
 * be of the format specified by the control point format. Must not be
 * nil when the acceleration structure is built.
 */
    controlPointBuffer :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointBuffer);
    }

    setControlPointBuffer_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, controlPointBuffer: *MTLBuffer) -> void {
        func: #type (obj: *void, selector: *void, controlPointBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointBuffer_, controlPointBuffer);
    }

/**
 * @brief Control point buffer offset. Must be a multiple of the control
 * point format's element size and must be aligned to the platform's
 * buffer offset alignment.
 */
    controlPointBufferOffset :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointBufferOffset);
    }

    setControlPointBufferOffset_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, controlPointBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, controlPointBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointBufferOffset_, controlPointBufferOffset);
    }

/**
 * @brief Number of control points in the control point buffer
 */
    controlPointCount :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointCount);
    }

    setControlPointCount_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, controlPointCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, controlPointCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointCount_, controlPointCount);
    }

/**
 * @brief Stride, in bytes, between control points in the control point
 * buffer. Must be a multiple of the control point format's element size
 * and must be at least the control point format's size. Defaults to 0
 * bytes, indicating that the control points are tightly packed.
 */
    controlPointStride :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointStride);
    }

    setControlPointStride_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, controlPointStride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, controlPointStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointStride_, controlPointStride);
    }

/**
 * @brief Format of the control points in the control point buffer.
 * Defaults to MTLAttributeFormatFloat3 (packed).
 */
    controlPointFormat :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLAttributeFormat {
        func: #type (obj: *void, selector: *void) -> MTLAttributeFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointFormat);
    }

    setControlPointFormat_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, controlPointFormat: MTLAttributeFormat) -> void {
        func: #type (obj: *void, selector: *void, controlPointFormat: MTLAttributeFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointFormat_, controlPointFormat);
    }

/**
 * @brief Buffer containing the curve radius for each control point. Each
 * radius must be of the type specified by the radius format. Each radius
 * must be at least zero. Must not be nil when the acceleration structure
 * is built.
 */
    radiusBuffer :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.radiusBuffer);
    }

    setRadiusBuffer_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, radiusBuffer: *MTLBuffer) -> void {
        func: #type (obj: *void, selector: *void, radiusBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRadiusBuffer_, radiusBuffer);
    }

/**
 * @brief Radius buffer offset. Must be a multiple of the radius format
 * size and must be aligned to the platform's buffer offset alignment.
 */
    radiusBufferOffset :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.radiusBufferOffset);
    }

    setRadiusBufferOffset_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, radiusBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, radiusBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRadiusBufferOffset_, radiusBufferOffset);
    }

/**
 * @brief Format of the radii in the radius buffer. Defaults to 
 * MTLAttributeFormatFloat.
 */
    radiusFormat :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLAttributeFormat {
        func: #type (obj: *void, selector: *void) -> MTLAttributeFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.radiusFormat);
    }

    setRadiusFormat_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, radiusFormat: MTLAttributeFormat) -> void {
        func: #type (obj: *void, selector: *void, radiusFormat: MTLAttributeFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRadiusFormat_, radiusFormat);
    }

/**
 * @brief Stride, in bytes, between radii in the radius buffer. Must be
 * a multiple of the radius format size. Defaults to 0 bytes, indicating
 * that the radii are tightly packed.
 */
    radiusStride :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.radiusStride);
    }

    setRadiusStride_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, radiusStride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, radiusStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRadiusStride_, radiusStride);
    }

/**
 * Index buffer containing references to control points in the control
 * point buffer. Must not be nil when the acceleration structure is built.
 */
    indexBuffer :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexBuffer);
    }

    setIndexBuffer_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, indexBuffer: *MTLBuffer) -> void {
        func: #type (obj: *void, selector: *void, indexBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexBuffer_, indexBuffer);
    }

/**
 * @brief Index buffer offset. Must be a multiple of the index data type
 * size and must be aligned to both the index data type's alignment and
 * the platform's buffer offset alignment.
 */
    indexBufferOffset :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexBufferOffset);
    }

    setIndexBufferOffset_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, indexBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, indexBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexBufferOffset_, indexBufferOffset);
    }

/**
 * @brief Index type
 */
    indexType :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLIndexType {
        func: #type (obj: *void, selector: *void) -> MTLIndexType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexType);
    }

    setIndexType_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, indexType: MTLIndexType) -> void {
        func: #type (obj: *void, selector: *void, indexType: MTLIndexType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexType_, indexType);
    }

/**
 * @brief Number of curve segments
 */
    segmentCount :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.segmentCount);
    }

    setSegmentCount_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, segmentCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, segmentCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSegmentCount_, segmentCount);
    }

/**
 * @brief Number of control points per curve segment. Must be 2, 3, or 4.
 */
    segmentControlPointCount :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.segmentControlPointCount);
    }

    setSegmentControlPointCount_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, segmentControlPointCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, segmentControlPointCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSegmentControlPointCount_, segmentControlPointCount);
    }

/**
 * @brief Curve type. Defaults to MTLCurveTypeRound.
 */
    curveType :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLCurveType {
        func: #type (obj: *void, selector: *void) -> MTLCurveType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.curveType);
    }

    setCurveType_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, curveType: MTLCurveType) -> void {
        func: #type (obj: *void, selector: *void, curveType: MTLCurveType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCurveType_, curveType);
    }

/**
 * @brief Curve basis. Defaults to MTLCurveBasisBSpline.
 */
    curveBasis :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLCurveBasis {
        func: #type (obj: *void, selector: *void) -> MTLCurveBasis #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.curveBasis);
    }

    setCurveBasis_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, curveBasis: MTLCurveBasis) -> void {
        func: #type (obj: *void, selector: *void, curveBasis: MTLCurveBasis) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCurveBasis_, curveBasis);
    }

/**
 * @brief Type of curve end caps. Defaults to MTLCurveEndCapsNone.
 */
    curveEndCaps :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLCurveEndCaps {
        func: #type (obj: *void, selector: *void) -> MTLCurveEndCaps #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.curveEndCaps);
    }

    setCurveEndCaps_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, curveEndCaps: MTLCurveEndCaps) -> void {
        func: #type (obj: *void, selector: *void, curveEndCaps: MTLCurveEndCaps) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCurveEndCaps_, curveEndCaps);
    }

}

/**
 * @brief Acceleration structure motion geometry descriptor describing
 * geometry made of curve primitives
 */
MTLAccelerationStructureMotionCurveGeometryDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
    descriptor :: () -> *MTLAccelerationStructureMotionCurveGeometryDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLAccelerationStructureMotionCurveGeometryDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLAccelerationStructureMotionCurveGeometryDescriptor"), __sel.descriptor);
    }

/**
 * @brief Buffers containing curve control points for each keyframe.
 * Each control point must be of the format specified by the control
 * point format. Buffer offsets musts be multiples of the control
 * point format's element size and must be aligned to the platform's
 * buffer offset alignment. Must not be nil when the acceleration
 * structure is built.
 */
    controlPointBuffers :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> *NSArray(*MTLMotionKeyframeData) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLMotionKeyframeData) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointBuffers);
    }

    setControlPointBuffers_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, controlPointBuffers: *NSArray(*MTLMotionKeyframeData)) -> void {
        func: #type (obj: *void, selector: *void, controlPointBuffers: *NSArray(*MTLMotionKeyframeData)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointBuffers_, controlPointBuffers);
    }

/**
 * @brief Number of control points in the control point buffers
 */
    controlPointCount :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointCount);
    }

    setControlPointCount_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, controlPointCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, controlPointCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointCount_, controlPointCount);
    }

/**
 * @brief Stride, in bytes, between control points in the control point
 * buffer. Must be a multiple of the control point format's element size
 * and must be at least the control point format's size. Defaults to 0
 * bytes, indicating that the control points are tightly packed.
 */
    controlPointStride :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointStride);
    }

    setControlPointStride_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, controlPointStride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, controlPointStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointStride_, controlPointStride);
    }

/**
 * @brief Format of the control points in the control point buffer.
 * Defaults to MTLAttributeFormatFloat3 (packed).
 */
    controlPointFormat :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLAttributeFormat {
        func: #type (obj: *void, selector: *void) -> MTLAttributeFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointFormat);
    }

    setControlPointFormat_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, controlPointFormat: MTLAttributeFormat) -> void {
        func: #type (obj: *void, selector: *void, controlPointFormat: MTLAttributeFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointFormat_, controlPointFormat);
    }

/**
 * @brief Buffers containing the curve radius for each control point for
 * each keyframe. Each radius must be of the type specified by the radius
 * format. Buffer offsets must be multiples of the radius format size
 * and must be aligned to the platform's buffer offset alignment. Each radius
 * must be at least zero. Must not be nil when the acceleration structure
 * is built.
 */
    radiusBuffers :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> *NSArray(*MTLMotionKeyframeData) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLMotionKeyframeData) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.radiusBuffers);
    }

    setRadiusBuffers_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, radiusBuffers: *NSArray(*MTLMotionKeyframeData)) -> void {
        func: #type (obj: *void, selector: *void, radiusBuffers: *NSArray(*MTLMotionKeyframeData)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRadiusBuffers_, radiusBuffers);
    }

/**
 * @brief Format of the radii in the radius buffer. Defaults to 
 * MTLAttributeFormatFloat.
 */
    radiusFormat :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLAttributeFormat {
        func: #type (obj: *void, selector: *void) -> MTLAttributeFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.radiusFormat);
    }

    setRadiusFormat_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, radiusFormat: MTLAttributeFormat) -> void {
        func: #type (obj: *void, selector: *void, radiusFormat: MTLAttributeFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRadiusFormat_, radiusFormat);
    }

/**
 * @brief Stride, in bytes, between radii in the radius buffer. Must be
 * a multiple of 4 bytes. Defaults to 4 bytes.
 */
    radiusStride :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.radiusStride);
    }

    setRadiusStride_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, radiusStride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, radiusStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRadiusStride_, radiusStride);
    }

/**
 * Index buffer containing references to control points in the control
 * point buffer. Must not be nil.
 */
    indexBuffer :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexBuffer);
    }

    setIndexBuffer_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, indexBuffer: *MTLBuffer) -> void {
        func: #type (obj: *void, selector: *void, indexBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexBuffer_, indexBuffer);
    }

/**
 * @brief Index buffer offset. Must be a multiple of the index data type
 * size and must be aligned to both the index data type's alignment and
 * the platform's buffer offset alignment.
 */
    indexBufferOffset :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexBufferOffset);
    }

    setIndexBufferOffset_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, indexBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, indexBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexBufferOffset_, indexBufferOffset);
    }

/**
 * @brief Index type
 */
    indexType :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLIndexType {
        func: #type (obj: *void, selector: *void) -> MTLIndexType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexType);
    }

    setIndexType_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, indexType: MTLIndexType) -> void {
        func: #type (obj: *void, selector: *void, indexType: MTLIndexType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexType_, indexType);
    }

/**
 * @brief Number of curve segments
 */
    segmentCount :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.segmentCount);
    }

    setSegmentCount_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, segmentCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, segmentCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSegmentCount_, segmentCount);
    }

/**
 * @brief Number of control points per curve segment. Must be 2, 3, or 4.
 */
    segmentControlPointCount :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.segmentControlPointCount);
    }

    setSegmentControlPointCount_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, segmentControlPointCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, segmentControlPointCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSegmentControlPointCount_, segmentControlPointCount);
    }

/**
 * @brief Curve type. Defaults to MTLCurveTypeRound.
 */
    curveType :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveType {
        func: #type (obj: *void, selector: *void) -> MTLCurveType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.curveType);
    }

    setCurveType_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, curveType: MTLCurveType) -> void {
        func: #type (obj: *void, selector: *void, curveType: MTLCurveType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCurveType_, curveType);
    }

/**
 * @brief Curve basis. Defaults to MTLCurveBasisBSpline.
 */
    curveBasis :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveBasis {
        func: #type (obj: *void, selector: *void) -> MTLCurveBasis #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.curveBasis);
    }

    setCurveBasis_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, curveBasis: MTLCurveBasis) -> void {
        func: #type (obj: *void, selector: *void, curveBasis: MTLCurveBasis) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCurveBasis_, curveBasis);
    }

/**
 * @brief Type of curve end caps. Defaults to MTLCurveEndCapsNone.
 */
    curveEndCaps :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveEndCaps {
        func: #type (obj: *void, selector: *void) -> MTLCurveEndCaps #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.curveEndCaps);
    }

    setCurveEndCaps_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, curveEndCaps: MTLCurveEndCaps) -> void {
        func: #type (obj: *void, selector: *void, curveEndCaps: MTLCurveEndCaps) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCurveEndCaps_, curveEndCaps);
    }

}

/**
 * @brief Descriptor for an instance acceleration structure
 */
MTLInstanceAccelerationStructureDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
    descriptor :: () -> *MTLInstanceAccelerationStructureDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLInstanceAccelerationStructureDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLInstanceAccelerationStructureDescriptor"), __sel.descriptor);
    }

/**
 * @brief Buffer containing instance descriptors of the type specified by the instanceDescriptorType property
 */
    instanceDescriptorBuffer :: (self: *MTLInstanceAccelerationStructureDescriptor) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceDescriptorBuffer);
    }

    setInstanceDescriptorBuffer_ :: (self: *MTLInstanceAccelerationStructureDescriptor, instanceDescriptorBuffer: *MTLBuffer) -> void {
        func: #type (obj: *void, selector: *void, instanceDescriptorBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceDescriptorBuffer_, instanceDescriptorBuffer);
    }

/**
 * @brief Offset into the instance descriptor buffer. Must be a multiple of 64 bytes and must be
 * aligned to the platform's buffer offset alignment.
 */
    instanceDescriptorBufferOffset :: (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceDescriptorBufferOffset);
    }

    setInstanceDescriptorBufferOffset_ :: (self: *MTLInstanceAccelerationStructureDescriptor, instanceDescriptorBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, instanceDescriptorBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceDescriptorBufferOffset_, instanceDescriptorBufferOffset);
    }

/**
 * @brief Stride, in bytes, between instance descriptors in the instance descriptor buffer. Must
 * be at least the size of the instance descriptor type and must be a multiple of 4 bytes.
 * Defaults to the size of the instance descriptor type.
 */
    instanceDescriptorStride :: (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceDescriptorStride);
    }

    setInstanceDescriptorStride_ :: (self: *MTLInstanceAccelerationStructureDescriptor, instanceDescriptorStride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, instanceDescriptorStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceDescriptorStride_, instanceDescriptorStride);
    }

/**
 * @brief Number of instance descriptors
 */
    instanceCount :: (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceCount);
    }

    setInstanceCount_ :: (self: *MTLInstanceAccelerationStructureDescriptor, instanceCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, instanceCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceCount_, instanceCount);
    }

/**
 * @brief Acceleration structures to be instanced
 */
    instancedAccelerationStructures :: (self: *MTLInstanceAccelerationStructureDescriptor) -> *NSArray(*MTLAccelerationStructure) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLAccelerationStructure) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instancedAccelerationStructures);
    }

    setInstancedAccelerationStructures_ :: (self: *MTLInstanceAccelerationStructureDescriptor, instancedAccelerationStructures: *NSArray(*MTLAccelerationStructure)) -> void {
        func: #type (obj: *void, selector: *void, instancedAccelerationStructures: *NSArray(*MTLAccelerationStructure)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstancedAccelerationStructures_, instancedAccelerationStructures);
    }

/**
 * @brief Type of instance descriptor in the instance descriptor buffer. Defaults to
 * MTLAccelerationStructureInstanceDescriptorTypeDefault.
 */
    instanceDescriptorType :: (self: *MTLInstanceAccelerationStructureDescriptor) -> MTLAccelerationStructureInstanceDescriptorType {
        func: #type (obj: *void, selector: *void) -> MTLAccelerationStructureInstanceDescriptorType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceDescriptorType);
    }

    setInstanceDescriptorType_ :: (self: *MTLInstanceAccelerationStructureDescriptor, instanceDescriptorType: MTLAccelerationStructureInstanceDescriptorType) -> void {
        func: #type (obj: *void, selector: *void, instanceDescriptorType: MTLAccelerationStructureInstanceDescriptorType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceDescriptorType_, instanceDescriptorType);
    }

/**
 * @brief Buffer containing transformation information for motion
 */
    motionTransformBuffer :: (self: *MTLInstanceAccelerationStructureDescriptor) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformBuffer);
    }

    setMotionTransformBuffer_ :: (self: *MTLInstanceAccelerationStructureDescriptor, motionTransformBuffer: *MTLBuffer) -> void {
        func: #type (obj: *void, selector: *void, motionTransformBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformBuffer_, motionTransformBuffer);
    }

/**
 * @brief Offset into the instance motion descriptor buffer. Must be a multiple of 64 bytes and
 * must be aligned to the platform's buffer offset alignment.
 */
    motionTransformBufferOffset :: (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformBufferOffset);
    }

    setMotionTransformBufferOffset_ :: (self: *MTLInstanceAccelerationStructureDescriptor, motionTransformBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, motionTransformBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformBufferOffset_, motionTransformBufferOffset);
    }

/**
 * @brief Number of motion transforms
 */
    motionTransformCount :: (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformCount);
    }

    setMotionTransformCount_ :: (self: *MTLInstanceAccelerationStructureDescriptor, motionTransformCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, motionTransformCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformCount_, motionTransformCount);
    }

/**
 * Matrix layout of the transformation matrices in the instance descriptors
 * in the instance descriptor buffer and the transformation matrices in the
 * transformation matrix buffer. Defaults to MTLMatrixLayoutColumnMajor.
 */
    instanceTransformationMatrixLayout :: (self: *MTLInstanceAccelerationStructureDescriptor) -> MTLMatrixLayout {
        func: #type (obj: *void, selector: *void) -> MTLMatrixLayout #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceTransformationMatrixLayout);
    }

    setInstanceTransformationMatrixLayout_ :: (self: *MTLInstanceAccelerationStructureDescriptor, instanceTransformationMatrixLayout: MTLMatrixLayout) -> void {
        func: #type (obj: *void, selector: *void, instanceTransformationMatrixLayout: MTLMatrixLayout) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceTransformationMatrixLayout_, instanceTransformationMatrixLayout);
    }

/**
 * @brief Type of motion transforms. Defaults to MTLTransformTypePackedFloat4x3.
 */
    motionTransformType :: (self: *MTLInstanceAccelerationStructureDescriptor) -> MTLTransformType {
        func: #type (obj: *void, selector: *void) -> MTLTransformType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformType);
    }

    setMotionTransformType_ :: (self: *MTLInstanceAccelerationStructureDescriptor, motionTransformType: MTLTransformType) -> void {
        func: #type (obj: *void, selector: *void, motionTransformType: MTLTransformType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformType_, motionTransformType);
    }

/**
 * @brief Motion transform stride. Defaults to 0, indicating that transforms are tightly packed according to the
 * motion transform type.
 */
    motionTransformStride :: (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformStride);
    }

    setMotionTransformStride_ :: (self: *MTLInstanceAccelerationStructureDescriptor, motionTransformStride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, motionTransformStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformStride_, motionTransformStride);
    }

}

/**
 * @brief Descriptor for an instance acceleration structure built with an indirected buffer of instances.
 */
MTLIndirectInstanceAccelerationStructureDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
    descriptor :: () -> *MTLIndirectInstanceAccelerationStructureDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLIndirectInstanceAccelerationStructureDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLIndirectInstanceAccelerationStructureDescriptor"), __sel.descriptor);
    }

/**
 * @brief Buffer containing instance descriptors of the type specified by the instanceDescriptorType property
 */
    instanceDescriptorBuffer :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceDescriptorBuffer);
    }

    setInstanceDescriptorBuffer_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceDescriptorBuffer: *MTLBuffer) -> void {
        func: #type (obj: *void, selector: *void, instanceDescriptorBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceDescriptorBuffer_, instanceDescriptorBuffer);
    }

/**
 * @brief Offset into the instance descriptor buffer. Must be a multiple of 64 bytes and must be
 * aligned to the platform's buffer offset alignment.
 */
    instanceDescriptorBufferOffset :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceDescriptorBufferOffset);
    }

    setInstanceDescriptorBufferOffset_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceDescriptorBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, instanceDescriptorBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceDescriptorBufferOffset_, instanceDescriptorBufferOffset);
    }

/**
 * @brief Stride, in bytes, between instance descriptors in the instance descriptor buffer. Must
 * be at least the size of the instance descriptor type and must be a multiple of 4 bytes.
 * Defaults to the size of the instance descriptor type.
 */
    instanceDescriptorStride :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceDescriptorStride);
    }

    setInstanceDescriptorStride_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceDescriptorStride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, instanceDescriptorStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceDescriptorStride_, instanceDescriptorStride);
    }

/**
 * @brief Maximum number of instance descriptors
 */
    maxInstanceCount :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxInstanceCount);
    }

    setMaxInstanceCount_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, maxInstanceCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxInstanceCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxInstanceCount_, maxInstanceCount);
    }

/**
 * @brief Buffer containing the instance count as a uint32_t value. Value at build time
 * must be less than or equal to maxInstanceCount.
 */
    instanceCountBuffer :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceCountBuffer);
    }

    setInstanceCountBuffer_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceCountBuffer: *MTLBuffer) -> void {
        func: #type (obj: *void, selector: *void, instanceCountBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceCountBuffer_, instanceCountBuffer);
    }

/**
 * @brief Offset into the instance count buffer. Must be a multiple of 4 bytes and must be
 * aligned to the platform's buffer offset alignment.
 */
    instanceCountBufferOffset :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceCountBufferOffset);
    }

    setInstanceCountBufferOffset_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceCountBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, instanceCountBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceCountBufferOffset_, instanceCountBufferOffset);
    }

/**
 * @brief Type of instance descriptor in the instance descriptor buffer. Defaults to
 * MTLAccelerationStructureInstanceDescriptorTypeIndirect. Must be
 * MTLAccelerationStructureInstanceDescriptorTypeIndirect or
 * MTLAccelerationStructureInstanceDescriptorTypeIndirectMotion.
 */
    instanceDescriptorType :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> MTLAccelerationStructureInstanceDescriptorType {
        func: #type (obj: *void, selector: *void) -> MTLAccelerationStructureInstanceDescriptorType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceDescriptorType);
    }

    setInstanceDescriptorType_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceDescriptorType: MTLAccelerationStructureInstanceDescriptorType) -> void {
        func: #type (obj: *void, selector: *void, instanceDescriptorType: MTLAccelerationStructureInstanceDescriptorType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceDescriptorType_, instanceDescriptorType);
    }

/**
 * @brief Buffer containing transformation information for motion
 */
    motionTransformBuffer :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformBuffer);
    }

    setMotionTransformBuffer_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformBuffer: *MTLBuffer) -> void {
        func: #type (obj: *void, selector: *void, motionTransformBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformBuffer_, motionTransformBuffer);
    }

/**
 * @brief Offset into the instance motion descriptor buffer. Must be a multiple of 64 bytes and
 * must be aligned to the platform's buffer offset alignment.
 */
    motionTransformBufferOffset :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformBufferOffset);
    }

    setMotionTransformBufferOffset_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, motionTransformBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformBufferOffset_, motionTransformBufferOffset);
    }

/**
 * @brief Maximum number of motion transforms
 */
    maxMotionTransformCount :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxMotionTransformCount);
    }

    setMaxMotionTransformCount_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, maxMotionTransformCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxMotionTransformCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxMotionTransformCount_, maxMotionTransformCount);
    }

/**
 * @brief Buffer containing the motion transform count as a uint32_t value. Value at build time
 * must be less than or equal to maxMotionTransformCount.
 */
    motionTransformCountBuffer :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformCountBuffer);
    }

    setMotionTransformCountBuffer_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformCountBuffer: *MTLBuffer) -> void {
        func: #type (obj: *void, selector: *void, motionTransformCountBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformCountBuffer_, motionTransformCountBuffer);
    }

/**
 * @brief Offset into the motion transform count buffer. Must be a multiple of 4 bytes and must be
 * aligned to the platform's buffer offset alignment.
 */
    motionTransformCountBufferOffset :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformCountBufferOffset);
    }

    setMotionTransformCountBufferOffset_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformCountBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, motionTransformCountBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformCountBufferOffset_, motionTransformCountBufferOffset);
    }

/**
 * Matrix layout of the transformation matrices in the instance descriptors
 * in the instance descriptor buffer and the transformation matrices in the
 * transformation matrix buffer. Defaults to MTLMatrixLayoutColumnMajor.
 */
    instanceTransformationMatrixLayout :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> MTLMatrixLayout {
        func: #type (obj: *void, selector: *void) -> MTLMatrixLayout #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceTransformationMatrixLayout);
    }

    setInstanceTransformationMatrixLayout_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceTransformationMatrixLayout: MTLMatrixLayout) -> void {
        func: #type (obj: *void, selector: *void, instanceTransformationMatrixLayout: MTLMatrixLayout) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceTransformationMatrixLayout_, instanceTransformationMatrixLayout);
    }

/**
 * @brief Type of motion transforms. Defaults to MTLTransformTypePackedFloat4x3.
 */
    motionTransformType :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> MTLTransformType {
        func: #type (obj: *void, selector: *void) -> MTLTransformType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformType);
    }

    setMotionTransformType_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformType: MTLTransformType) -> void {
        func: #type (obj: *void, selector: *void, motionTransformType: MTLTransformType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformType_, motionTransformType);
    }

/**
 * @brief Motion transform stride. Defaults to 0, indicating that transforms are tightly packed according to the
 * motion transform type.
 */
    motionTransformStride :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformStride);
    }

    setMotionTransformStride_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformStride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, motionTransformStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformStride_, motionTransformStride);
    }

}

/*!
 @class MTLHeapDescriptor
 */
MTLHeapDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @property size
 @abstract Requested size of the heap's backing memory.
 @discussion The size may be rounded up to GPU page granularity.
 */
    size :: (self: *MTLHeapDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.size);
    }

    setSize_ :: (self: *MTLHeapDescriptor, size: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, size: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSize_, size);
    }

/*!
 @property storageMode
 @abstract Storage mode for the heap. Default is MTLStorageModePrivate.
 @discussion All resources created from this heap share the same storage mode.
 MTLStorageModeManaged and MTLStorageModeMemoryless are disallowed.
 */
    storageMode :: (self: *MTLHeapDescriptor) -> MTLStorageMode {
        func: #type (obj: *void, selector: *void) -> MTLStorageMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.storageMode);
    }

    setStorageMode_ :: (self: *MTLHeapDescriptor, storageMode: MTLStorageMode) -> void {
        func: #type (obj: *void, selector: *void, storageMode: MTLStorageMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStorageMode_, storageMode);
    }

/*!
 @property cpuCacheMode
 @abstract CPU cache mode for the heap. Default is MTLCPUCacheModeDefaultCache.
 @discussion All resources created from this heap share the same cache mode.
 CPU cache mode is ignored for MTLStorageModePrivate.
 */
    cpuCacheMode :: (self: *MTLHeapDescriptor) -> MTLCPUCacheMode {
        func: #type (obj: *void, selector: *void) -> MTLCPUCacheMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.cpuCacheMode);
    }

    setCpuCacheMode_ :: (self: *MTLHeapDescriptor, cpuCacheMode: MTLCPUCacheMode) -> void {
        func: #type (obj: *void, selector: *void, cpuCacheMode: MTLCPUCacheMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCpuCacheMode_, cpuCacheMode);
    }

/*!
 @property sparsePageSize
 @abstract The sparse page size to use for resources created from the heap.
 */
    sparsePageSize :: (self: *MTLHeapDescriptor) -> MTLSparsePageSize {
        func: #type (obj: *void, selector: *void) -> MTLSparsePageSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sparsePageSize);
    }

    setSparsePageSize_ :: (self: *MTLHeapDescriptor, sparsePageSize: MTLSparsePageSize) -> void {
        func: #type (obj: *void, selector: *void, sparsePageSize: MTLSparsePageSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSparsePageSize_, sparsePageSize);
    }

/*!
 @property hazardTrackingMode
 @abstract Set hazard tracking mode for the heap. The default value is MTLHazardTrackingModeDefault.
 @discussion For heaps, MTLHazardTrackingModeDefault is treated as MTLHazardTrackingModeUntracked.
 Setting hazardTrackingMode to MTLHazardTrackingModeTracked causes hazard tracking to be enabled heap.
 When a resource on a hazard tracked heap is modified, reads and writes from all resources suballocated on that heap will be delayed until the modification is complete.
 Similarly, modifying heap resources will be delayed until all in-flight reads and writes from all resources suballocated on that heap have completed.
 For optimal performance, perform hazard tracking manually through MTLFence or MTLEvent instead.
 All resources created from this heap shared the same hazard tracking mode.
 */
    hazardTrackingMode :: (self: *MTLHeapDescriptor) -> MTLHazardTrackingMode {
        func: #type (obj: *void, selector: *void) -> MTLHazardTrackingMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.hazardTrackingMode);
    }

    setHazardTrackingMode_ :: (self: *MTLHeapDescriptor, hazardTrackingMode: MTLHazardTrackingMode) -> void {
        func: #type (obj: *void, selector: *void, hazardTrackingMode: MTLHazardTrackingMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setHazardTrackingMode_, hazardTrackingMode);
    }

/*!
 @property resourceOptions
 @abstract A packed tuple of the storageMode, cpuCacheMode and hazardTrackingMode properties.
 @discussion Modifications to this property are reflected in the other properties and vice versa.
 */
    resourceOptions :: (self: *MTLHeapDescriptor) -> MTLResourceOptions {
        func: #type (obj: *void, selector: *void) -> MTLResourceOptions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resourceOptions);
    }

    setResourceOptions_ :: (self: *MTLHeapDescriptor, resourceOptions: MTLResourceOptions) -> void {
        func: #type (obj: *void, selector: *void, resourceOptions: MTLResourceOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setResourceOptions_, resourceOptions);
    }

/*!
 @property type
 @abstract The type of the heap. The default value is MTLHeapTypeAutomatic.
 @discussion This constrains the resource creation functions that are available.
 */
    type :: (self: *MTLHeapDescriptor) -> MTLHeapType {
        func: #type (obj: *void, selector: *void) -> MTLHeapType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.type);
    }

    setType_ :: (self: *MTLHeapDescriptor, type: MTLHeapType) -> void {
        func: #type (obj: *void, selector: *void, type: MTLHeapType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setType_, type);
    }

/// Specifies the largest sparse page size that the Metal heap supports.
///
/// This parameter only affects the heap if you set the ``type`` property of this descriptor
/// to ``MTLHeapType/MTLHeapTypePlacement``.
///
/// The value you assign to this property determines the compatibility of the Metal heap with with placement sparse
/// resources, because placement sparse resources require that their sparse page size be less than or equal to the
/// placement sparse page of the Metal heap that this property controls.
///
    maxCompatiblePlacementSparsePageSize :: (self: *MTLHeapDescriptor) -> MTLSparsePageSize {
        func: #type (obj: *void, selector: *void) -> MTLSparsePageSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxCompatiblePlacementSparsePageSize);
    }

    setMaxCompatiblePlacementSparsePageSize_ :: (self: *MTLHeapDescriptor, maxCompatiblePlacementSparsePageSize: MTLSparsePageSize) -> void {
        func: #type (obj: *void, selector: *void, maxCompatiblePlacementSparsePageSize: MTLSparsePageSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxCompatiblePlacementSparsePageSize_, maxCompatiblePlacementSparsePageSize);
    }

}

/// Options to configure a command buffer before encoding work into it.
MTL4CommandBufferOptions :: struct #type_info_none {
    nsobject: *NSObject;
/// Contains information related to shader logging.
///
/// To enable shader logging, call ``MTL4CommandBuffer/beginCommandBufferWithAllocator:options:`` with an instance
/// of ``MTL4CommandBufferOptions`` that contains a non-`nil` ``MTLLogState`` instance in this property.
///
/// Shader functions log messages until the command buffer ends.
    logState :: (self: *MTL4CommandBufferOptions) -> *MTLLogState {
        func: #type (obj: *void, selector: *void) -> *MTLLogState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.logState);
    }

    setLogState_ :: (self: *MTL4CommandBufferOptions, logState: *MTLLogState) -> void {
        func: #type (obj: *void, selector: *void, logState: *MTLLogState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLogState_, logState);
    }

}

/*!
 @class MTLSharedEventListener
 @abstract This class provides a simple interface for handling the dispatching of MTLSharedEvent notifications from Metal.
*/
MTLSharedEventListener :: struct #type_info_none {
    nsobject: *NSObject;
// A shared instance constructed with a standard serial dispatch queue.
// This instance can be used for short-running notifications without QoS requirements.
    sharedListener :: () -> *MTLSharedEventListener {
        func: #type (obj: *void, selector: *void) -> *MTLSharedEventListener #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLSharedEventListener"), __sel.sharedListener);
    }

    init :: (self: *MTLSharedEventListener) -> *MTLSharedEventListener {
        func: #type (obj: *void, selector: *void) -> *MTLSharedEventListener #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.init);
    }

    initWithDispatchQueue_ :: (self: *MTLSharedEventListener, dispatchQueue: dispatch_queue_t) -> *MTLSharedEventListener {
        func: #type (obj: *void, selector: *void, dispatchQueue: dispatch_queue_t) -> *MTLSharedEventListener #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.initWithDispatchQueue_, dispatchQueue);
    }

    dispatchQueue :: (self: *MTLSharedEventListener) -> dispatch_queue_t {
        func: #type (obj: *void, selector: *void) -> dispatch_queue_t #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dispatchQueue);
    }

}

// MTLSharedEventHandle objects may be passed between processes via XPC connections and then used to recreate
// a MTLSharedEvent via an existing MTLDevice.
MTLSharedEventHandle :: struct #type_info_none {
    nsobject: *NSObject;
    label :: (self: *MTLSharedEventHandle) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

}

/// Represents options to configure a commit operation on a command queue.
///
/// You pass these options as a parameter when you call ``MTL4CommandQueue/commit:count:options:``.
///
/// - Note Instances of this class are not thread-safe. If your app modifies a shared commit options instance from
/// multiple threads simultaneously, you are responsible for providing external synchronization.
MTL4CommitOptions :: struct #type_info_none {
    nsobject: *NSObject;
/// Registers a commit feedback handler that Metal calls with feedback data when available.
///
/// - Parameter block: ``MTL4CommitFeedbackHandler`` that Metal invokes.
    addFeedbackHandler_ :: (self: *MTL4CommitOptions, block: MTL4CommitFeedbackHandler) -> void {
        func: #type (obj: *void, selector: *void, block: MTL4CommitFeedbackHandler) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addFeedbackHandler_, block);
    }

}

/// Groups together parameters for the creation of a new command queue.
MTL4CommandQueueDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Assigns an optional label to the command queue instance for debugging purposes.
    label :: (self: *MTL4CommandQueueDescriptor) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTL4CommandQueueDescriptor, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

/// Assigns a dispatch queue to which Metal submits feedback notification blocks.
///
/// When you assign a dispatch queue via this method, Metal requires that the queue parameter you provide is a serial queue.
///
/// If you set the value of property to `nil`, the default, Metal allocates an internal dispatch queue to service feedback
/// notifications.
    feedbackQueue :: (self: *MTL4CommandQueueDescriptor) -> dispatch_queue_t {
        func: #type (obj: *void, selector: *void) -> dispatch_queue_t #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.feedbackQueue);
    }

    setFeedbackQueue_ :: (self: *MTL4CommandQueueDescriptor, feedbackQueue: dispatch_queue_t) -> void {
        func: #type (obj: *void, selector: *void, feedbackQueue: dispatch_queue_t) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFeedbackQueue_, feedbackQueue);
    }

}

MTLCaptureDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/**
    @brief The object that is captured.

    Must be one of the following:
 
    MTLDevice captures all command queues of the device.
 
    MTLCommandQueue captures a single command queue.
 
    MTLCaptureScope captures between the next begin and end of the scope.
 */
    captureObject :: (self: *MTLCaptureDescriptor) -> id {
        func: #type (obj: *void, selector: *void) -> id #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.captureObject);
    }

    setCaptureObject_ :: (self: *MTLCaptureDescriptor, captureObject: id) -> void {
        func: #type (obj: *void, selector: *void, captureObject: id) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCaptureObject_, captureObject);
    }

/// The destination you want the GPU trace to be captured to.
    destination :: (self: *MTLCaptureDescriptor) -> MTLCaptureDestination {
        func: #type (obj: *void, selector: *void) -> MTLCaptureDestination #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.destination);
    }

    setDestination_ :: (self: *MTLCaptureDescriptor, destination: MTLCaptureDestination) -> void {
        func: #type (obj: *void, selector: *void, destination: MTLCaptureDestination) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDestination_, destination);
    }

/// URL the GPU Trace document will be captured to.
/// Must be specified when destiation is MTLCaptureDestinationGPUTraceDocument.
    outputURL :: (self: *MTLCaptureDescriptor) -> *NSURL {
        func: #type (obj: *void, selector: *void) -> *NSURL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.outputURL);
    }

    setOutputURL_ :: (self: *MTLCaptureDescriptor, outputURL: *NSURL) -> void {
        func: #type (obj: *void, selector: *void, outputURL: *NSURL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOutputURL_, outputURL);
    }

}

MTLCaptureManager :: struct #type_info_none {
    nsobject: *NSObject;
/** Retrieves the shared capture manager for this process. There is only one capture manager per process.
    The capture manager allows the user to create capture scopes and trigger captures from code.
    When a capture has been completed, it will be displayed in Xcode and the application will be paused.
    @remarks: only MTLCommandBuffers created after starting a capture and committed before stopping it are captured. 
 */
    sharedCaptureManager :: () -> *MTLCaptureManager {
        func: #type (obj: *void, selector: *void) -> *MTLCaptureManager #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLCaptureManager"), __sel.sharedCaptureManager);
    }

// Use +[sharedCaptureManager]
    init :: (self: *MTLCaptureManager) -> *MTLCaptureManager {
        func: #type (obj: *void, selector: *void) -> *MTLCaptureManager #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.init);
    }

// Creates a new capture scope for the given capture device
    newCaptureScopeWithDevice_ :: (self: *MTLCaptureManager, device: *MTLDevice) -> *MTLCaptureScope {
        func: #type (obj: *void, selector: *void, device: *MTLDevice) -> *MTLCaptureScope #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newCaptureScopeWithDevice_, device);
    }

// Creates a new capture scope for the given command queue
    newCaptureScopeWithCommandQueue_ :: (self: *MTLCaptureManager, commandQueue: *MTLCommandQueue) -> *MTLCaptureScope {
        func: #type (obj: *void, selector: *void, commandQueue: *MTLCommandQueue) -> *MTLCaptureScope #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newCaptureScopeWithCommandQueue_, commandQueue);
    }

// Creates a new capture scope for the given Metal 4 command queue
    newCaptureScopeWithMTL4CommandQueue_ :: (self: *MTLCaptureManager, commandQueue: *MTL4CommandQueue) -> *MTLCaptureScope {
        func: #type (obj: *void, selector: *void, commandQueue: *MTL4CommandQueue) -> *MTLCaptureScope #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newCaptureScopeWithMTL4CommandQueue_, commandQueue);
    }

// Checks if a given capture destination is supported.
    supportsDestination_ :: (self: *MTLCaptureManager, destination: MTLCaptureDestination) -> BOOL {
        func: #type (obj: *void, selector: *void, destination: MTLCaptureDestination) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsDestination_, destination);
    }

/// Start capturing until stopCapture is called.
/// @param descriptor MTLCaptureDescriptor specifies the parameters.
/// @param error Optional error output to check why a capture could not be started.
/// @return true if the capture was successfully started, otherwise false.
/// @remarks Only MTLCommandBuffer​s created after starting and committed before stopping it are captured.
    startCaptureWithDescriptor_error_ :: (self: *MTLCaptureManager, descriptor: *MTLCaptureDescriptor, error: **NSError) -> BOOL {
        func: #type (obj: *void, selector: *void, descriptor: *MTLCaptureDescriptor, error: **NSError) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.startCaptureWithDescriptor_error_, descriptor, error);
    }

// Starts capturing, for all queues of the given device, new MTLCommandBuffer's until -[stopCapture] or Xcode’s stop capture button is pressed
    startCaptureWithDevice_ :: (self: *MTLCaptureManager, device: *MTLDevice) -> void {
        func: #type (obj: *void, selector: *void, device: *MTLDevice) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.startCaptureWithDevice_, device);
    }

// Starts capturing, for the given command queue, command buffers that are created after invoking this method and committed before invoking -[stopCapture] or clicking Xcode’s stop capture button.
    startCaptureWithCommandQueue_ :: (self: *MTLCaptureManager, commandQueue: *MTLCommandQueue) -> void {
        func: #type (obj: *void, selector: *void, commandQueue: *MTLCommandQueue) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.startCaptureWithCommandQueue_, commandQueue);
    }

// Start a capture with the given scope: from the scope's begin until its end, restricting the capture to the scope's device(s) and, if selected, the scope's command queue
    startCaptureWithScope_ :: (self: *MTLCaptureManager, captureScope: *MTLCaptureScope) -> void {
        func: #type (obj: *void, selector: *void, captureScope: *MTLCaptureScope) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.startCaptureWithScope_, captureScope);
    }

// Stops a capture started from startCaptureWithDevice:/startCaptureWithCommandQueue:/startCaptureWithScope: or from Xcode’s capture button
    stopCapture :: (self: *MTLCaptureManager) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stopCapture);
    }

// Default scope to be captured when a capture is initiated from Xcode’s capture button. When nil, it’ll fall back to presentDrawable:, presentDrawable:atTime:, presentDrawable:afterMinimumDuration: in MTLCommandBuffer or present:, present:atTime:, present:afterMinimumDuration: in MTLDrawable.
    defaultCaptureScope :: (self: *MTLCaptureManager) -> *MTLCaptureScope {
        func: #type (obj: *void, selector: *void) -> *MTLCaptureScope #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.defaultCaptureScope);
    }

    setDefaultCaptureScope_ :: (self: *MTLCaptureManager, defaultCaptureScope: *MTLCaptureScope) -> void {
        func: #type (obj: *void, selector: *void, defaultCaptureScope: *MTLCaptureScope) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDefaultCaptureScope_, defaultCaptureScope);
    }

// Query if a capture is currently in progress
    isCapturing :: (self: *MTLCaptureManager) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isCapturing);
    }

}

/*!
 @abstract
 Describes the limits and features that can be used in an indirect command
 */
MTLIndirectCommandBufferDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @abstract
 A bitfield of the command types that be encoded.
 @discussion
 MTLCommandTypeDispatch cannot be mixed with any other command type.
 */
    commandTypes :: (self: *MTLIndirectCommandBufferDescriptor) -> MTLIndirectCommandType {
        func: #type (obj: *void, selector: *void) -> MTLIndirectCommandType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.commandTypes);
    }

    setCommandTypes_ :: (self: *MTLIndirectCommandBufferDescriptor, commandTypes: MTLIndirectCommandType) -> void {
        func: #type (obj: *void, selector: *void, commandTypes: MTLIndirectCommandType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCommandTypes_, commandTypes);
    }

/*!
 @abstract
 Whether the render or compute pipeline are inherited from the encoder
 */
    inheritPipelineState :: (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.inheritPipelineState);
    }

    setInheritPipelineState_ :: (self: *MTLIndirectCommandBufferDescriptor, inheritPipelineState: BOOL) -> void {
        func: #type (obj: *void, selector: *void, inheritPipelineState: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInheritPipelineState_, inheritPipelineState);
    }

/*!
 @abstract
 Whether the render or compute pipeline can set arguments.
 */
    inheritBuffers :: (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.inheritBuffers);
    }

    setInheritBuffers_ :: (self: *MTLIndirectCommandBufferDescriptor, inheritBuffers: BOOL) -> void {
        func: #type (obj: *void, selector: *void, inheritBuffers: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInheritBuffers_, inheritBuffers);
    }

/// Configures whether the indirect command buffer inherits the depth stencil state from the encoder.
///
/// The property's default value is <doc://com.apple.documentation/documentation/swift/true>.
    inheritDepthStencilState :: (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.inheritDepthStencilState);
    }

    setInheritDepthStencilState_ :: (self: *MTLIndirectCommandBufferDescriptor, inheritDepthStencilState: BOOL) -> void {
        func: #type (obj: *void, selector: *void, inheritDepthStencilState: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInheritDepthStencilState_, inheritDepthStencilState);
    }

/// Configures whether the indirect command buffer inherits the depth bias from the encoder.
///
/// The property's default value is <doc://com.apple.documentation/documentation/swift/true>.
    inheritDepthBias :: (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.inheritDepthBias);
    }

    setInheritDepthBias_ :: (self: *MTLIndirectCommandBufferDescriptor, inheritDepthBias: BOOL) -> void {
        func: #type (obj: *void, selector: *void, inheritDepthBias: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInheritDepthBias_, inheritDepthBias);
    }

/// Configures whether the indirect command buffer inherits the depth clip mode from the encoder.
///
/// The property's default value is <doc://com.apple.documentation/documentation/swift/true>.
    inheritDepthClipMode :: (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.inheritDepthClipMode);
    }

    setInheritDepthClipMode_ :: (self: *MTLIndirectCommandBufferDescriptor, inheritDepthClipMode: BOOL) -> void {
        func: #type (obj: *void, selector: *void, inheritDepthClipMode: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInheritDepthClipMode_, inheritDepthClipMode);
    }

/// Configures whether the indirect command buffer inherits the cull mode from the encoder.
///
/// The property's default value is <doc://com.apple.documentation/documentation/swift/true>.
    inheritCullMode :: (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.inheritCullMode);
    }

    setInheritCullMode_ :: (self: *MTLIndirectCommandBufferDescriptor, inheritCullMode: BOOL) -> void {
        func: #type (obj: *void, selector: *void, inheritCullMode: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInheritCullMode_, inheritCullMode);
    }

/// Configures whether the indirect command buffer inherits the front facing winding from the encoder.
///
/// The property's default value is <doc://com.apple.documentation/documentation/swift/true>.
    inheritFrontFacingWinding :: (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.inheritFrontFacingWinding);
    }

    setInheritFrontFacingWinding_ :: (self: *MTLIndirectCommandBufferDescriptor, inheritFrontFacingWinding: BOOL) -> void {
        func: #type (obj: *void, selector: *void, inheritFrontFacingWinding: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInheritFrontFacingWinding_, inheritFrontFacingWinding);
    }

/// Configures whether the indirect command buffer inherits the triangle fill mode from the encoder.
///
/// The property's default value is <doc://com.apple.documentation/documentation/swift/true>.
    inheritTriangleFillMode :: (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.inheritTriangleFillMode);
    }

    setInheritTriangleFillMode_ :: (self: *MTLIndirectCommandBufferDescriptor, inheritTriangleFillMode: BOOL) -> void {
        func: #type (obj: *void, selector: *void, inheritTriangleFillMode: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInheritTriangleFillMode_, inheritTriangleFillMode);
    }

/*!
 @abstract
 The maximum bind index of vertex argument buffers that can be set per command.
 */
    maxVertexBufferBindCount :: (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxVertexBufferBindCount);
    }

    setMaxVertexBufferBindCount_ :: (self: *MTLIndirectCommandBufferDescriptor, maxVertexBufferBindCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxVertexBufferBindCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxVertexBufferBindCount_, maxVertexBufferBindCount);
    }

/*!
 @abstract
 The maximum bind index of fragment argument buffers that can be set per command.
 */
    maxFragmentBufferBindCount :: (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxFragmentBufferBindCount);
    }

    setMaxFragmentBufferBindCount_ :: (self: *MTLIndirectCommandBufferDescriptor, maxFragmentBufferBindCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxFragmentBufferBindCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxFragmentBufferBindCount_, maxFragmentBufferBindCount);
    }

/*!
 @abstract
 The maximum bind index of kernel (or tile) argument buffers that can be set per command.
 */
    maxKernelBufferBindCount :: (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxKernelBufferBindCount);
    }

    setMaxKernelBufferBindCount_ :: (self: *MTLIndirectCommandBufferDescriptor, maxKernelBufferBindCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxKernelBufferBindCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxKernelBufferBindCount_, maxKernelBufferBindCount);
    }

/*!
 @abstract
 The maximum bind index of kernel (or tile) threadgroup memory that can be set per command.
 The default value is 31.
 */
    maxKernelThreadgroupMemoryBindCount :: (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxKernelThreadgroupMemoryBindCount);
    }

    setMaxKernelThreadgroupMemoryBindCount_ :: (self: *MTLIndirectCommandBufferDescriptor, maxKernelThreadgroupMemoryBindCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxKernelThreadgroupMemoryBindCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxKernelThreadgroupMemoryBindCount_, maxKernelThreadgroupMemoryBindCount);
    }

/*!
 @abstract
 The maximum bind index of object stage buffers that can be set per render command.
 */
    maxObjectBufferBindCount :: (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxObjectBufferBindCount);
    }

    setMaxObjectBufferBindCount_ :: (self: *MTLIndirectCommandBufferDescriptor, maxObjectBufferBindCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxObjectBufferBindCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxObjectBufferBindCount_, maxObjectBufferBindCount);
    }

/*!
 @abstract
 The maximum bind index of mesh stage buffers that can be set per render command.
 */
    maxMeshBufferBindCount :: (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxMeshBufferBindCount);
    }

    setMaxMeshBufferBindCount_ :: (self: *MTLIndirectCommandBufferDescriptor, maxMeshBufferBindCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxMeshBufferBindCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxMeshBufferBindCount_, maxMeshBufferBindCount);
    }

/*!
 @abstract
 The maximum bind index of object threadgroup memory that can be set per render command.
 The default value is 0.
 */
    maxObjectThreadgroupMemoryBindCount :: (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxObjectThreadgroupMemoryBindCount);
    }

    setMaxObjectThreadgroupMemoryBindCount_ :: (self: *MTLIndirectCommandBufferDescriptor, maxObjectThreadgroupMemoryBindCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxObjectThreadgroupMemoryBindCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxObjectThreadgroupMemoryBindCount_, maxObjectThreadgroupMemoryBindCount);
    }

/*!
 @abstract
 Whether the render or compute commands can use ray tracing. Default value is NO.
 */
    supportRayTracing :: (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportRayTracing);
    }

    setSupportRayTracing_ :: (self: *MTLIndirectCommandBufferDescriptor, supportRayTracing: BOOL) -> void {
        func: #type (obj: *void, selector: *void, supportRayTracing: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportRayTracing_, supportRayTracing);
    }

/*!
  @brief
    allows binding pipelines that have at least one MTLBufferLayout with a
    stride of `MTLBufferLayoutStrideDynamic`

    will allow setting attributeStride in `setVertexBuffer` / `setKernelBuffer`
    calls
*/
    supportDynamicAttributeStride :: (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportDynamicAttributeStride);
    }

    setSupportDynamicAttributeStride_ :: (self: *MTLIndirectCommandBufferDescriptor, supportDynamicAttributeStride: BOOL) -> void {
        func: #type (obj: *void, selector: *void, supportDynamicAttributeStride: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportDynamicAttributeStride_, supportDynamicAttributeStride);
    }

/// Specifies if the indirect command buffer should support color attachment mapping.
    supportColorAttachmentMapping :: (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportColorAttachmentMapping);
    }

    setSupportColorAttachmentMapping_ :: (self: *MTLIndirectCommandBufferDescriptor, supportColorAttachmentMapping: BOOL) -> void {
        func: #type (obj: *void, selector: *void, supportColorAttachmentMapping: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportColorAttachmentMapping_, supportColorAttachmentMapping);
    }

}

MTLAccelerationStructurePassSampleBufferAttachmentDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
@property sampleBuffer
@abstract The sample buffer to store samples for the acceleration structure pass defined samples.
If sampleBuffer is non-nil, the sample indices will be used to store samples into
the sample buffer.  If no sample buffer is provided, no samples will be taken.
If any of the sample indices are specified as MTLCounterDontSample, no sample
will be taken for that action.
*/
    sampleBuffer :: (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor) -> *MTLCounterSampleBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLCounterSampleBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleBuffer);
    }

    setSampleBuffer_ :: (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor, sampleBuffer: *MTLCounterSampleBuffer) -> void {
        func: #type (obj: *void, selector: *void, sampleBuffer: *MTLCounterSampleBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSampleBuffer_, sampleBuffer);
    }

/*!
 @property startOfEncoderSampleIndex
 @abstract The sample index to use to store the sample taken at the start of
 command encoder processing.  Setting the value to MTLCounterDontSample will cause
 this sample to be omitted.
 @discussion On devices where MTLCounterSamplingPointAtStageBoundary is unsupported,
 this sample index is invalid and must be set to MTLCounterDontSample or creation of an
 acceleration structure pass will fail.
 */
    startOfEncoderSampleIndex :: (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.startOfEncoderSampleIndex);
    }

    setStartOfEncoderSampleIndex_ :: (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor, startOfEncoderSampleIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, startOfEncoderSampleIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStartOfEncoderSampleIndex_, startOfEncoderSampleIndex);
    }

/*!
 @property endOfEncoderSampleIndex
 @abstract The sample index to use to store the sample taken at the end of
 command encoder processing.  Setting the value to MTLCounterDontSample will cause
 this sample to be omitted.
 @discussion On devices where MTLCounterSamplingPointAtStageBoundary is unsupported,
 this sample index is invalid and must be set to MTLCounterDontSample or creation of an
 acceleration structure pass will fail.
 */
    endOfEncoderSampleIndex :: (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.endOfEncoderSampleIndex);
    }

    setEndOfEncoderSampleIndex_ :: (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor, endOfEncoderSampleIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, endOfEncoderSampleIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setEndOfEncoderSampleIndex_, endOfEncoderSampleIndex);
    }

}

MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray :: struct #type_info_none {
    nsobject: *NSObject;
/* Individual attachment state access */
    objectAtIndexedSubscript_ :: (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor {
        func: #type (obj: *void, selector: *void, attachmentIndex: NSUInteger) -> *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, attachmentIndex);
    }

/* This always uses 'copy' semantics.  It is safe to set the attachment state at any legal index to nil, which resets that attachment descriptor state to default values. */
    setObject_atIndexedSubscript_ :: (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray, attachment: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, attachment: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, attachment, attachmentIndex);
    }

}

/*!
 @class MTLAccelerationStructurePassDescriptor
 @abstract MTLAccelerationStructurePassDescriptor represents a collection of attachments to be used to create a concrete acceleration structure encoder.
 */
MTLAccelerationStructurePassDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @method accelerationStructurePassDescriptor
 @abstract Create an autoreleased default acceleration structure pass descriptor
 */
    accelerationStructurePassDescriptor :: () -> *MTLAccelerationStructurePassDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLAccelerationStructurePassDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLAccelerationStructurePassDescriptor"), __sel.accelerationStructurePassDescriptor);
    }

/*!
 @property sampleBufferAttachments
 @abstract An array of sample buffers and associated sample indices.
 */
    sampleBufferAttachments :: (self: *MTLAccelerationStructurePassDescriptor) -> *MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray {
        func: #type (obj: *void, selector: *void) -> *MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleBufferAttachments);
    }

}

/*!
 @interface MTLRasterizationRateSampleArray
 @abstract A helper object for convient access to samples stored in an array.
 */
MTLRasterizationRateSampleArray :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @method objectAtIndexedSubscript:
 @abstract Retrieves the sample value at the specified index.
 @return NSNumber instance describing the value of the sample at the specified index, or 0 if the index is out of range.
 */
    objectAtIndexedSubscript_ :: (self: *MTLRasterizationRateSampleArray, index: NSUInteger) -> *NSNumber {
        func: #type (obj: *void, selector: *void, index: NSUInteger) -> *NSNumber #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, index);
    }

/*!
 @method setObject:atIndexedSubscript:
 @abstract Stores a sample value at the specified index.
 @discussion The value will be converted to a single precision floating point value.
 */
    setObject_atIndexedSubscript_ :: (self: *MTLRasterizationRateSampleArray, value: *NSNumber, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, value: *NSNumber, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, value, index);
    }

}

/*!
 @interface MTLRasterizationRateLayerDescriptor
 @abstract Describes the minimum rasterization rate screen space using two piecewise linear functions.
 @discussion The two piecewise linear function (PLF) describe the desired rasterization quality on the horizontal and vertical axis separately.
 Each quality sample in the PLF is stored in an array as single precision floating point value between 0 (lowest quality) and 1 (highest quality).
 The first sample in the array describes the quality at the top (vertical) or left (horizontal) edge of screen space.
 The last sample in the array describes the quality at the bottom (vertical) or right (horizontal) edge of screen space.
 All other samples are spaced equidistant in screen space.
 MTLRasterizationRateLayerDescriptor instances will be stored inside a MTLRasterizationRateMapDescriptor which in turn is compiled by MTLDevice into a MTLRasterizationRateMap.
 Because MTLDevice may not support the requested granularity, the provided samples may be rounded up (towards higher quality) during compilation.
 */
MTLRasterizationRateLayerDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @method init
 @abstract Do not use, instead use initWithNumSamples:
 */
    init :: (self: *MTLRasterizationRateLayerDescriptor) -> *MTLRasterizationRateLayerDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLRasterizationRateLayerDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.init);
    }

/*!
 @method initWithSampleCount:
 @abstract Initialize a descriptor for a layer with the given number of quality samples on the horizontal and vertical axis.
 @param sampleCount The width and height components are the number of samples on the horizontal and vertical axis respectively. The depth component is ignored.
 @discussion All values are initialized to zero.
 */
    initWithSampleCount_ :: (self: *MTLRasterizationRateLayerDescriptor, sampleCount: MTLSize) -> *MTLRasterizationRateLayerDescriptor {
        func: #type (obj: *void, selector: *void, sampleCount: MTLSize) -> *MTLRasterizationRateLayerDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.initWithSampleCount_, sampleCount);
    }

/*!
 @method initWithSampleCount:horizontal:vertical:
 @abstract Initialize a descriptor for a layer with the given number of quality samples on the horizontal and vertical axis.
 @param sampleCount The width and height components are the number of samples on the horizontal and vertical axis respectively. The depth component is ignored.
 @param horizontal The initial sample values on the horizontal axis. Must point to an array of sampleCount.width elements, of which the values will be copied into the MTLRasterizationRateLayerDescriptor.
 @param vertical The initial sample values on the vertical axis. Must point to an array of sampleCount.height elements, of which the values will be copied into the MTLRasterizationRateLayerDescriptor.
 @discussion Use initWithSampleCount: to initialize with zeroes instead.
 */
    initWithSampleCount_horizontal_vertical_ :: (self: *MTLRasterizationRateLayerDescriptor, sampleCount: MTLSize, horizontal: *float32, vertical: *float32) -> *MTLRasterizationRateLayerDescriptor {
        func: #type (obj: *void, selector: *void, sampleCount: MTLSize, horizontal: *float32, vertical: *float32) -> *MTLRasterizationRateLayerDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.initWithSampleCount_horizontal_vertical_, sampleCount, horizontal, vertical);
    }

/*!
 @property sampleCount
 @return The number of quality samples that this descriptor uses to describe its current function, for the horizontal and vertical axis. The depth component of the returned MTLSize is always 0.
 */
    sampleCount :: (self: *MTLRasterizationRateLayerDescriptor) -> MTLSize {
        func: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleCount);
    }

/*!
 @property maxSampleCount
 @return The maximum number of quality samples that this descriptor can use to describe its function, for the horizontal and vertical axis, this is the sampleCount that the descriptor was initialized with. The depth component of the returned MTLSize is always 0.
 */
    maxSampleCount :: (self: *MTLRasterizationRateLayerDescriptor) -> MTLSize {
        func: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxSampleCount);
    }

/*!
 @property horizontalSampleStorage
 @abstract Provide direct access to the quality samples stored in the descriptor.
 @return Pointer to the (mutable) storage array for samples on the horizontal axis.
 @discussion The returned pointer points to the first element of an array of sampleCount.width elements.
 */
    horizontalSampleStorage :: (self: *MTLRasterizationRateLayerDescriptor) -> *float32 {
        func: #type (obj: *void, selector: *void) -> *float32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.horizontalSampleStorage);
    }

/*!
 @property verticalSampleStorage
 @abstract Provide direct access to the quality samples stored in the descriptor.
 @return Pointer to the (mutable) storage array for samples on the vertical axis.
 @discussion The returned pointer points to the first element of an array of sampleCount.height elements.
 */
    verticalSampleStorage :: (self: *MTLRasterizationRateLayerDescriptor) -> *float32 {
        func: #type (obj: *void, selector: *void) -> *float32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.verticalSampleStorage);
    }

/*!
 @property horizontal
 @abstract Provide convenient bounds-checked access to the quality samples stored in the descriptor.
 @return Returns a syntactic sugar helper to get or set sample values on the horizontal axis.
 */
    horizontal :: (self: *MTLRasterizationRateLayerDescriptor) -> *MTLRasterizationRateSampleArray {
        func: #type (obj: *void, selector: *void) -> *MTLRasterizationRateSampleArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.horizontal);
    }

/*!
 @property vertical
 @abstract Provide convenient bounds-checked access to the quality samples stored in the descriptor.
 @return Returns a syntactic sugar helper to get or set sample values on the vertical axis.
 */
    vertical :: (self: *MTLRasterizationRateLayerDescriptor) -> *MTLRasterizationRateSampleArray {
        func: #type (obj: *void, selector: *void) -> *MTLRasterizationRateSampleArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertical);
    }

}

/*!
 @interface MTLRasterizationRateLayerArray
 @abstract Mutable array of MTLRasterizationRateLayerDescriptor
 */
MTLRasterizationRateLayerArray :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @method objectAtIndexedSubscript:
 @return The MTLRasterizationRateLayerDescriptor instance for the given layerIndex, or nil if no instance hasn't been set for this index.
 @discussion Use setObject:atIndexedSubscript: to set the layer
 */
    objectAtIndexedSubscript_ :: (self: *MTLRasterizationRateLayerArray, layerIndex: NSUInteger) -> *MTLRasterizationRateLayerDescriptor {
        func: #type (obj: *void, selector: *void, layerIndex: NSUInteger) -> *MTLRasterizationRateLayerDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, layerIndex);
    }

/*!
 @method setObject:atIndexedSubscript:
 @abstract Sets the MTLRasterizationRateLayerDescriptor instance for the given layerIndex.
 @discussion The previous instance at this index will be overwritten.
 */
    setObject_atIndexedSubscript_ :: (self: *MTLRasterizationRateLayerArray, layer: *MTLRasterizationRateLayerDescriptor, layerIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, layer: *MTLRasterizationRateLayerDescriptor, layerIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, layer, layerIndex);
    }

}

/*!
 @interface MTLRasterizationRateMapDescriptor
 @abstract Describes a MTLRasterizationRateMap containing an arbitrary number of MTLRasterizationRateLayerDescriptor instances.
 @discussion An MTLRasterizationRateMapDescriptor is compiled into an MTLRasterizationRateMap using MTLDevice.
 */
MTLRasterizationRateMapDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @method rasterizationRateMapDescriptorWithScreenSize:
 @abstract Convenience descriptor creation function without layers
 @param screenSize The dimensions, in screen space pixels, of the region where variable rasterization is applied. The depth component of MTLSize is ignored.
 @return A descriptor containing no layers. Add or remove layers using setObject:atIndexedSubscript:.
 */
    rasterizationRateMapDescriptorWithScreenSize_ :: (screenSize: MTLSize) -> *MTLRasterizationRateMapDescriptor {
        func: #type (obj: *void, selector: *void, screenSize: MTLSize) -> *MTLRasterizationRateMapDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLRasterizationRateMapDescriptor"), __sel.rasterizationRateMapDescriptorWithScreenSize_, screenSize);
    }

/*!
 @method rasterizationRateMapDescriptorWithScreenSize:layer:
 @abstract Convenience descriptor creation function for a single layer.
 @param screenSize The dimensions, in screen space pixels, of the region where variable rasterization is applied. The depth component of MTLSize is ignored.
 @param layer The single layer describing how the rasterization rate varies in screen space
 @return A descriptor containing a single layer. Add or remove layers using setObject:atIndexedSubscript:.
 */
    rasterizationRateMapDescriptorWithScreenSize_layer_ :: (screenSize: MTLSize, layer: *MTLRasterizationRateLayerDescriptor) -> *MTLRasterizationRateMapDescriptor {
        func: #type (obj: *void, selector: *void, screenSize: MTLSize, layer: *MTLRasterizationRateLayerDescriptor) -> *MTLRasterizationRateMapDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLRasterizationRateMapDescriptor"), __sel.rasterizationRateMapDescriptorWithScreenSize_layer_, screenSize, layer);
    }

/*!
 @method rasterizationRateMapDescriptorWithScreenSize:layerCount:layers:
 @abstract Convenience descriptor creation function for an arbitrary amount of layers stored in a C-array.
 @param screenSize The dimensions, in screen space pixels, of the region where variable rasterization is applied. The depth component of MTLSize is ignored.
 @param layerCount The number of layers in the descriptor.
 @param layers An array of pointers to layer descriptors. The array must contain layerCount non-null pointers to MTLRasterizationRateLayerDescriptor instances.
 @return A descriptor containing all the specified layers. Add or remove layers using setObject:atIndexedSubscript:.
 @discussion The function copies the array of pointers internally, the caller need not keep the array alive after creating the descriptor.
 */
    rasterizationRateMapDescriptorWithScreenSize_layerCount_layers_ :: (screenSize: MTLSize, layerCount: NSUInteger, layers: **MTLRasterizationRateLayerDescriptor) -> *MTLRasterizationRateMapDescriptor {
        func: #type (obj: *void, selector: *void, screenSize: MTLSize, layerCount: NSUInteger, layers: **MTLRasterizationRateLayerDescriptor) -> *MTLRasterizationRateMapDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLRasterizationRateMapDescriptor"), __sel.rasterizationRateMapDescriptorWithScreenSize_layerCount_layers_, screenSize, layerCount, layers);
    }

/*!
 @method layerAtIndex:
 @return The MTLRasterizationRateLayerDescriptor instance for the given layerIndex, or nil if no instance hasn't been set for this index.
 @discussion Use setLayer:atIndex: to add or set the layer.
 Identical to "layers[layerIndex]".
 */
    layerAtIndex_ :: (self: *MTLRasterizationRateMapDescriptor, layerIndex: NSUInteger) -> *MTLRasterizationRateLayerDescriptor {
        func: #type (obj: *void, selector: *void, layerIndex: NSUInteger) -> *MTLRasterizationRateLayerDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.layerAtIndex_, layerIndex);
    }

/*!
 @method setLayer:atIndex:
 @abstract Sets the MTLRasterizationRateLayerDescriptor instance for the given layerIndex.
 @discussion The previous instance at the index, if any, will be overwritten.
 Set nil to an index to remove the layer at that index from the descriptor.
 Identical to "layers[layerIndex] = layer".
 */
    setLayer_atIndex_ :: (self: *MTLRasterizationRateMapDescriptor, layer: *MTLRasterizationRateLayerDescriptor, layerIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, layer: *MTLRasterizationRateLayerDescriptor, layerIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLayer_atIndex_, layer, layerIndex);
    }

/*!
 @property layers
 @return A modifiable array of layers
 @discussion Accesses the layers currently stored in the descriptor.
 Syntactic sugar around "layerAtIndex:" and "setLayer:atIndex:"
 */
    layers :: (self: *MTLRasterizationRateMapDescriptor) -> *MTLRasterizationRateLayerArray {
        func: #type (obj: *void, selector: *void) -> *MTLRasterizationRateLayerArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.layers);
    }

/*!
 @property screenSize
 @return The dimensions, in screen space pixels, of the region where variable rasterization is applied.
 @discussion The region always has its origin at [0, 0].
 The depth component of MTLSize is ignored.
 */
    screenSize :: (self: *MTLRasterizationRateMapDescriptor) -> MTLSize {
        func: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.screenSize);
    }

    setScreenSize_ :: (self: *MTLRasterizationRateMapDescriptor, screenSize: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, screenSize: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setScreenSize_, screenSize);
    }

/*!
 @property label
 @abstract A string to help identify this object.
 @discussion The default value is nil.
 */
    label :: (self: *MTLRasterizationRateMapDescriptor) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLRasterizationRateMapDescriptor, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

/*!
 @property layerCount
 @return The number of subsequent non-nil layer instances stored in the descriptor, starting at index 0.
 @discussion This property is modified by setting new layer instances using setLayer:atIndex: or assigning to layers[X]
 */
    layerCount :: (self: *MTLRasterizationRateMapDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.layerCount);
    }

}

MTLLogStateDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
@abstract level indicates the minimum level of the logs that will be printed.
@discussion All the logs with level less than given level will be skipped on the GPU Side.
 */
    level :: (self: *MTLLogStateDescriptor) -> MTLLogLevel {
        func: #type (obj: *void, selector: *void) -> MTLLogLevel #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.level);
    }

    setLevel_ :: (self: *MTLLogStateDescriptor, level: MTLLogLevel) -> void {
        func: #type (obj: *void, selector: *void, level: MTLLogLevel) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLevel_, level);
    }

/*!
 * @abstract bufferSize indicates the size of the buffer where GPU will store the logging content from shaders. Minimum value is 1KB
 */
    bufferSize :: (self: *MTLLogStateDescriptor) -> NSInteger {
        func: #type (obj: *void, selector: *void) -> NSInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bufferSize);
    }

    setBufferSize_ :: (self: *MTLLogStateDescriptor, bufferSize: NSInteger) -> void {
        func: #type (obj: *void, selector: *void, bufferSize: NSInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBufferSize_, bufferSize);
    }

}

/*!
 @class MTLBinaryArchiveDescriptor
 @abstract A class used to indicate how an archive should be created
 */
MTLBinaryArchiveDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @property url
 @abstract The file URL from which to open a MTLBinaryArchive, or nil to create an empty MTLBinaryArchive.
 */
    url :: (self: *MTLBinaryArchiveDescriptor) -> *NSURL {
        func: #type (obj: *void, selector: *void) -> *NSURL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.url);
    }

    setUrl_ :: (self: *MTLBinaryArchiveDescriptor, url: *NSURL) -> void {
        func: #type (obj: *void, selector: *void, url: *NSURL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setUrl_, url);
    }

}

MTLIntersectionFunctionTableDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @method intersectionFunctionTableDescriptor
 @abstract Create an autoreleased intersection function table descriptor
 */
    intersectionFunctionTableDescriptor :: () -> *MTLIntersectionFunctionTableDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLIntersectionFunctionTableDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLIntersectionFunctionTableDescriptor"), __sel.intersectionFunctionTableDescriptor);
    }

/*!
* @property functionCount
* @abstract The number of functions in the table.
*/
    functionCount :: (self: *MTLIntersectionFunctionTableDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionCount);
    }

    setFunctionCount_ :: (self: *MTLIntersectionFunctionTableDescriptor, functionCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, functionCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFunctionCount_, functionCount);
    }

}

/*!
 @interface MTLFunctionStitchingAttributeAlwaysInline
 @abstract Applies the `__attribute__((always_inline))` attribute to the produced stitched function.
 */
MTLFunctionStitchingAttributeAlwaysInline :: struct #type_info_none {
    nsobject: *NSObject;
}

/*!
 @interface MTLFunctionStitchingInputNode
 @abstract An indexed input node of the produced stitched function.
 */
MTLFunctionStitchingInputNode :: struct #type_info_none {
    nsobject: *NSObject;
    initWithArgumentIndex_ :: (self: *MTLFunctionStitchingInputNode, argument: NSUInteger) -> *MTLFunctionStitchingInputNode {
        func: #type (obj: *void, selector: *void, argument: NSUInteger) -> *MTLFunctionStitchingInputNode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.initWithArgumentIndex_, argument);
    }

    argumentIndex :: (self: *MTLFunctionStitchingInputNode) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.argumentIndex);
    }

    setArgumentIndex_ :: (self: *MTLFunctionStitchingInputNode, argumentIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, argumentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setArgumentIndex_, argumentIndex);
    }

}

/*!
 @interface MTLFunctionStitchingFunctionNode
 @abstract A function node that calls the specified function with arguments and ordering determined by data and control dependencies.
 */
MTLFunctionStitchingFunctionNode :: struct #type_info_none {
    nsobject: *NSObject;
    initWithName_arguments_controlDependencies_ :: (self: *MTLFunctionStitchingFunctionNode, name: *NSString, arguments: *NSArray(*MTLFunctionStitchingNode), controlDependencies: *NSArray(*MTLFunctionStitchingFunctionNode)) -> *MTLFunctionStitchingFunctionNode {
        func: #type (obj: *void, selector: *void, name: *NSString, arguments: *NSArray(*MTLFunctionStitchingNode), controlDependencies: *NSArray(*MTLFunctionStitchingFunctionNode)) -> *MTLFunctionStitchingFunctionNode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.initWithName_arguments_controlDependencies_, name, arguments, controlDependencies);
    }

    name :: (self: *MTLFunctionStitchingFunctionNode) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

    setName_ :: (self: *MTLFunctionStitchingFunctionNode, name: *NSString) -> void {
        func: #type (obj: *void, selector: *void, name: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setName_, name);
    }

    arguments :: (self: *MTLFunctionStitchingFunctionNode) -> *NSArray(*MTLFunctionStitchingNode) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLFunctionStitchingNode) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.arguments);
    }

    setArguments_ :: (self: *MTLFunctionStitchingFunctionNode, arguments: *NSArray(*MTLFunctionStitchingNode)) -> void {
        func: #type (obj: *void, selector: *void, arguments: *NSArray(*MTLFunctionStitchingNode)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setArguments_, arguments);
    }

    controlDependencies :: (self: *MTLFunctionStitchingFunctionNode) -> *NSArray(*MTLFunctionStitchingFunctionNode) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLFunctionStitchingFunctionNode) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlDependencies);
    }

    setControlDependencies_ :: (self: *MTLFunctionStitchingFunctionNode, controlDependencies: *NSArray(*MTLFunctionStitchingFunctionNode)) -> void {
        func: #type (obj: *void, selector: *void, controlDependencies: *NSArray(*MTLFunctionStitchingFunctionNode)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlDependencies_, controlDependencies);
    }

}

/*!
 @interface MTLFunctionStitchingGraph
 @abstract A function graph that describes a directed acyclic graph.
 @discussion The return value of the output node will be used as the return value for the final stitched graph.
 */
MTLFunctionStitchingGraph :: struct #type_info_none {
    nsobject: *NSObject;
    initWithFunctionName_nodes_outputNode_attributes_ :: (self: *MTLFunctionStitchingGraph, functionName: *NSString, nodes: *NSArray(*MTLFunctionStitchingFunctionNode), outputNode: *MTLFunctionStitchingFunctionNode, attributes: *NSArray(*MTLFunctionStitchingAttribute)) -> *MTLFunctionStitchingGraph {
        func: #type (obj: *void, selector: *void, functionName: *NSString, nodes: *NSArray(*MTLFunctionStitchingFunctionNode), outputNode: *MTLFunctionStitchingFunctionNode, attributes: *NSArray(*MTLFunctionStitchingAttribute)) -> *MTLFunctionStitchingGraph #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.initWithFunctionName_nodes_outputNode_attributes_, functionName, nodes, outputNode, attributes);
    }

    functionName :: (self: *MTLFunctionStitchingGraph) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionName);
    }

    setFunctionName_ :: (self: *MTLFunctionStitchingGraph, functionName: *NSString) -> void {
        func: #type (obj: *void, selector: *void, functionName: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFunctionName_, functionName);
    }

    nodes :: (self: *MTLFunctionStitchingGraph) -> *NSArray(*MTLFunctionStitchingFunctionNode) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLFunctionStitchingFunctionNode) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.nodes);
    }

    setNodes_ :: (self: *MTLFunctionStitchingGraph, nodes: *NSArray(*MTLFunctionStitchingFunctionNode)) -> void {
        func: #type (obj: *void, selector: *void, nodes: *NSArray(*MTLFunctionStitchingFunctionNode)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setNodes_, nodes);
    }

    outputNode :: (self: *MTLFunctionStitchingGraph) -> *MTLFunctionStitchingFunctionNode {
        func: #type (obj: *void, selector: *void) -> *MTLFunctionStitchingFunctionNode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.outputNode);
    }

    setOutputNode_ :: (self: *MTLFunctionStitchingGraph, outputNode: *MTLFunctionStitchingFunctionNode) -> void {
        func: #type (obj: *void, selector: *void, outputNode: *MTLFunctionStitchingFunctionNode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOutputNode_, outputNode);
    }

    attributes :: (self: *MTLFunctionStitchingGraph) -> *NSArray(*MTLFunctionStitchingAttribute) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLFunctionStitchingAttribute) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.attributes);
    }

    setAttributes_ :: (self: *MTLFunctionStitchingGraph, attributes: *NSArray(*MTLFunctionStitchingAttribute)) -> void {
        func: #type (obj: *void, selector: *void, attributes: *NSArray(*MTLFunctionStitchingAttribute)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAttributes_, attributes);
    }

}

/*!
 @interface MTLStitchedLibraryDescriptor
 @abstract A container for the graphs and functions needed to create the stitched functions described by the graphs.
 */
MTLStitchedLibraryDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
    functionGraphs :: (self: *MTLStitchedLibraryDescriptor) -> *NSArray(*MTLFunctionStitchingGraph) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLFunctionStitchingGraph) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionGraphs);
    }

    setFunctionGraphs_ :: (self: *MTLStitchedLibraryDescriptor, functionGraphs: *NSArray(*MTLFunctionStitchingGraph)) -> void {
        func: #type (obj: *void, selector: *void, functionGraphs: *NSArray(*MTLFunctionStitchingGraph)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFunctionGraphs_, functionGraphs);
    }

    functions :: (self: *MTLStitchedLibraryDescriptor) -> *NSArray(*MTLFunction) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLFunction) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functions);
    }

    setFunctions_ :: (self: *MTLStitchedLibraryDescriptor, functions: *NSArray(*MTLFunction)) -> void {
        func: #type (obj: *void, selector: *void, functions: *NSArray(*MTLFunction)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFunctions_, functions);
    }

/*!
@property binaryArchives
@abstract The array of archives to be searched.
@discussion Binary archives to be searched for precompiled stitched libraries during the compilation of this library.
*/
    binaryArchives :: (self: *MTLStitchedLibraryDescriptor) -> *NSArray(*MTLBinaryArchive) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLBinaryArchive) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.binaryArchives);
    }

    setBinaryArchives_ :: (self: *MTLStitchedLibraryDescriptor, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void {
        func: #type (obj: *void, selector: *void, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBinaryArchives_, binaryArchives);
    }

/*!
* @property options
* @abstract The options to use for this new MTLLibrary.
*/
    options :: (self: *MTLStitchedLibraryDescriptor) -> MTLStitchedLibraryOptions {
        func: #type (obj: *void, selector: *void) -> MTLStitchedLibraryOptions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.options);
    }

    setOptions_ :: (self: *MTLStitchedLibraryDescriptor, options: MTLStitchedLibraryOptions) -> void {
        func: #type (obj: *void, selector: *void, options: MTLStitchedLibraryOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOptions_, options);
    }

}

/*!
 @interface MTLIOCommandQueueDescriptor
 @abstract Represents a descriptor to create a MTLIOCommandQueue.
 */
MTLIOCommandQueueDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @property maxCommandBufferCount
 @abstract The maximum number of commandBuffers that can be in flight at a given time for the queue.
*/
    maxCommandBufferCount :: (self: *MTLIOCommandQueueDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxCommandBufferCount);
    }

    setMaxCommandBufferCount_ :: (self: *MTLIOCommandQueueDescriptor, maxCommandBufferCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxCommandBufferCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxCommandBufferCount_, maxCommandBufferCount);
    }

/*!
 @property priority
 @abstract The priority of the commands executed by this queue.
*/
    priority :: (self: *MTLIOCommandQueueDescriptor) -> MTLIOPriority {
        func: #type (obj: *void, selector: *void) -> MTLIOPriority #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.priority);
    }

    setPriority_ :: (self: *MTLIOCommandQueueDescriptor, priority: MTLIOPriority) -> void {
        func: #type (obj: *void, selector: *void, priority: MTLIOPriority) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPriority_, priority);
    }

/*!
 @property type
 @abstract The type (serial or concurrent) of the queue.
*/
    type :: (self: *MTLIOCommandQueueDescriptor) -> MTLIOCommandQueueType {
        func: #type (obj: *void, selector: *void) -> MTLIOCommandQueueType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.type);
    }

    setType_ :: (self: *MTLIOCommandQueueDescriptor, type: MTLIOCommandQueueType) -> void {
        func: #type (obj: *void, selector: *void, type: MTLIOCommandQueueType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setType_, type);
    }

/*!
 @property maxCommandsInFlight
 @abstract The maximum number of IO commands that can be in flight at a given time for the queue.
 @discussion A zero value defaults to the system dependent maximum value, a smaller number can be
 provided to bound the utilization of the storage device.
*/
    maxCommandsInFlight :: (self: *MTLIOCommandQueueDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxCommandsInFlight);
    }

    setMaxCommandsInFlight_ :: (self: *MTLIOCommandQueueDescriptor, maxCommandsInFlight: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxCommandsInFlight: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxCommandsInFlight_, maxCommandsInFlight);
    }

/*!
 @property scratchBufferAllocator
 @abstract An optional property that allows setting a custom allocator for scratch buffers by the queue.
 @discussion An application can manage scratch buffers manually by implemeting a class  conforming
 to the MTLIOScratchBufferAllocator protocol and creating an instance that is passed in here.
*/
    scratchBufferAllocator :: (self: *MTLIOCommandQueueDescriptor) -> *MTLIOScratchBufferAllocator {
        func: #type (obj: *void, selector: *void) -> *MTLIOScratchBufferAllocator #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.scratchBufferAllocator);
    }

    setScratchBufferAllocator_ :: (self: *MTLIOCommandQueueDescriptor, scratchBufferAllocator: *MTLIOScratchBufferAllocator) -> void {
        func: #type (obj: *void, selector: *void, scratchBufferAllocator: *MTLIOScratchBufferAllocator) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setScratchBufferAllocator_, scratchBufferAllocator);
    }

}

/*!
 @interface MTLResidencySetDescriptor
 @abstract Specifies the parameters for MTLResidencySet creation.
 */
MTLResidencySetDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/*!
 @property label
 @abstract An optional label for the MTLResidencySet.
 */
    label :: (self: *MTLResidencySetDescriptor) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLResidencySetDescriptor, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

/*!
 @property initialCapacity
 @abstract If non-zero, defines the number of allocations for which to initialize the internal arrays. Defaults to zero.
 */
    initialCapacity :: (self: *MTLResidencySetDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.initialCapacity);
    }

    setInitialCapacity_ :: (self: *MTLResidencySetDescriptor, initialCapacity: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, initialCapacity: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInitialCapacity_, initialCapacity);
    }

}

/// Provides parameters for creating a resource view pool.
MTLResourceViewPoolDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Configures the number of resource views with which Metal creates the resource view pool.
    resourceViewCount :: (self: *MTLResourceViewPoolDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resourceViewCount);
    }

    setResourceViewCount_ :: (self: *MTLResourceViewPoolDescriptor, resourceViewCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, resourceViewCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setResourceViewCount_, resourceViewCount);
    }

/// Assigns an optional label you to the resource view pool for debugging purposes.
    label :: (self: *MTLResourceViewPoolDescriptor) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLResourceViewPoolDescriptor, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

}

/// Groups parameters for the creation of a Metal argument table.
///
/// Argument tables provide resource bindings to your Metal pipeline states.
MTL4ArgumentTableDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Determines the number of buffer-binding slots for the argument table.
///
/// The maximum value of this parameter is 31.
    maxBufferBindCount :: (self: *MTL4ArgumentTableDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxBufferBindCount);
    }

    setMaxBufferBindCount_ :: (self: *MTL4ArgumentTableDescriptor, maxBufferBindCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxBufferBindCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxBufferBindCount_, maxBufferBindCount);
    }

/// Determines the number of texture-binding slots for the argument table.
///
/// The maximum value of this parameter is 128.
    maxTextureBindCount :: (self: *MTL4ArgumentTableDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTextureBindCount);
    }

    setMaxTextureBindCount_ :: (self: *MTL4ArgumentTableDescriptor, maxTextureBindCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxTextureBindCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxTextureBindCount_, maxTextureBindCount);
    }

/// Determines the number of sampler state-binding slots for the argument table.
///
/// The maximum value of this parameter is 16.
    maxSamplerStateBindCount :: (self: *MTL4ArgumentTableDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxSamplerStateBindCount);
    }

    setMaxSamplerStateBindCount_ :: (self: *MTL4ArgumentTableDescriptor, maxSamplerStateBindCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxSamplerStateBindCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxSamplerStateBindCount_, maxSamplerStateBindCount);
    }

/// Configures whether Metal initializes the bindings to nil values upon creation of argument table.
///
/// The default value of this property is <doc://com.apple.documentation/documentation/swift/false>.
    initializeBindings :: (self: *MTL4ArgumentTableDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.initializeBindings);
    }

    setInitializeBindings_ :: (self: *MTL4ArgumentTableDescriptor, initializeBindings: BOOL) -> void {
        func: #type (obj: *void, selector: *void, initializeBindings: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInitializeBindings_, initializeBindings);
    }

/// Controls whether Metal should reserve memory for attribute strides in the argument table.
///
/// Set this value to true if you intend to provide dynamic attribute strides when binding vertex
/// array buffers to the argument table by calling ``MTL4ArgumentTable/setAddress:attributeStride:atIndex:``
///
/// The default value of this property is <doc://com.apple.documentation/documentation/swift/false>.
    supportAttributeStrides :: (self: *MTL4ArgumentTableDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportAttributeStrides);
    }

    setSupportAttributeStrides_ :: (self: *MTL4ArgumentTableDescriptor, supportAttributeStrides: BOOL) -> void {
        func: #type (obj: *void, selector: *void, supportAttributeStrides: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportAttributeStrides_, supportAttributeStrides);
    }

/// Assigns an optional label with the argument table for debug purposes.
    label :: (self: *MTL4ArgumentTableDescriptor) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTL4ArgumentTableDescriptor, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

}

/// Groups together parameters for creating a command allocator.
MTL4CommandAllocatorDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// An optional label you can assign to the command allocator to aid debugging.
    label :: (self: *MTL4CommandAllocatorDescriptor) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTL4CommandAllocatorDescriptor, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

}

/// Describes a render pass.
///
/// You use render pass descriptors to create instances of ``MTL4RenderCommandEncoder`` and encode draw
/// commands into instances of ``MTL4CommandBuffer``.
///
/// To create render command encoders, you typically call ``MTL4CommandBuffer/renderCommandEncoderWithDescriptor:``.
/// The ``MTL4CommandBuffer/renderCommandEncoderWithDescriptor:options:`` variant of this method allows you to specify
/// additional options to encode a render pass in parallel from multiple CPU cores by creating *suspending* and *resuming*
/// render passes.
MTL4RenderPassDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Configures the custom sample positions to use in MSAA rendering.
///
/// - Parameters:
///   - positions: Array of ``MTLSamplePosition`` instances.
///   - count:     Number of ``MTLSamplePosition`` instances in the array. This value
///                needs to be a valid sample count, or `0` to disable custom sample positions.
    setSamplePositions_count_ :: (self: *MTL4RenderPassDescriptor, positions: *MTLSamplePosition, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, positions: *MTLSamplePosition, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSamplePositions_count_, positions, count);
    }

/// Retrieves the previously-configured custom sample positions.
///
/// This method stores the app's last set custom sample positions into an output array. Metal only modifies the array
/// when the `count` parameter consists of a length sufficient to store the number of sample positions.
///
/// - Parameters:
///   - positions: The destination array where Metal stores ``MTLSamplePosition`` instances.
///   - count:     Number of ``MTLSamplePosition`` instances in the array. This array
///                needs to be large enough to store all sample positions.
///
/// - Returns: The number of previously-configured custom sample positions.
    getSamplePositions_count_ :: (self: *MTL4RenderPassDescriptor, positions: *MTLSamplePosition, count: NSUInteger) -> NSUInteger {
        func: #type (obj: *void, selector: *void, positions: *MTLSamplePosition, count: NSUInteger) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.getSamplePositions_count_, positions, count);
    }

/// Accesses the array of state information for render attachments that store color data.
    colorAttachments :: (self: *MTL4RenderPassDescriptor) -> *MTLRenderPassColorAttachmentDescriptorArray {
        func: #type (obj: *void, selector: *void) -> *MTLRenderPassColorAttachmentDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.colorAttachments);
    }

/// Accesses state information for a render attachment that stores depth data.
    depthAttachment :: (self: *MTL4RenderPassDescriptor) -> *MTLRenderPassDepthAttachmentDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLRenderPassDepthAttachmentDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.depthAttachment);
    }

    setDepthAttachment_ :: (self: *MTL4RenderPassDescriptor, depthAttachment: *MTLRenderPassDepthAttachmentDescriptor) -> void {
        func: #type (obj: *void, selector: *void, depthAttachment: *MTLRenderPassDepthAttachmentDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthAttachment_, depthAttachment);
    }

/// Accesses state information for a render attachment that stores stencil data.
    stencilAttachment :: (self: *MTL4RenderPassDescriptor) -> *MTLRenderPassStencilAttachmentDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLRenderPassStencilAttachmentDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stencilAttachment);
    }

    setStencilAttachment_ :: (self: *MTL4RenderPassDescriptor, stencilAttachment: *MTLRenderPassStencilAttachmentDescriptor) -> void {
        func: #type (obj: *void, selector: *void, stencilAttachment: *MTLRenderPassStencilAttachmentDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilAttachment_, stencilAttachment);
    }

/// Assigns the number of layers that all attachments this descriptor references have.
    renderTargetArrayLength :: (self: *MTL4RenderPassDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.renderTargetArrayLength);
    }

    setRenderTargetArrayLength_ :: (self: *MTL4RenderPassDescriptor, renderTargetArrayLength: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, renderTargetArrayLength: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRenderTargetArrayLength_, renderTargetArrayLength);
    }

/// Assigns the per-sample size, in bytes, of the largest explicit imageblock layout in the render pass.
    imageblockSampleLength :: (self: *MTL4RenderPassDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.imageblockSampleLength);
    }

    setImageblockSampleLength_ :: (self: *MTL4RenderPassDescriptor, imageblockSampleLength: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, imageblockSampleLength: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setImageblockSampleLength_, imageblockSampleLength);
    }

/// Assigns the per-tile size, in bytes, of the persistent threadgroup memory allocation of this render pass.
    threadgroupMemoryLength :: (self: *MTL4RenderPassDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.threadgroupMemoryLength);
    }

    setThreadgroupMemoryLength_ :: (self: *MTL4RenderPassDescriptor, threadgroupMemoryLength: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, threadgroupMemoryLength: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setThreadgroupMemoryLength_, threadgroupMemoryLength);
    }

/// The width of the tiles, in pixels, a render pass you create with this descriptor applies to its attachments.
///
/// For tile-based rendering, Metal divides each render attachment into smaller regions, or _tiles_.
/// The property's default is `0`, which tells Metal to select a size that fits in tile memory.
///
/// See <doc:tailor-your-apps-for-apple-gpus-and-tile-based-deferred-rendering>
/// for more information about tiles, tile memory, and deferred rendering.
    tileWidth :: (self: *MTL4RenderPassDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileWidth);
    }

    setTileWidth_ :: (self: *MTL4RenderPassDescriptor, tileWidth: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, tileWidth: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileWidth_, tileWidth);
    }

/// The height of the tiles, in pixels, a render pass you create with this descriptor applies to its attachments.
///
/// For tile-based rendering, Metal divides each render attachment into smaller regions, or _tiles_.
/// The property's default is `0`, which tells Metal to select a size that fits in tile memory.
///
/// See <doc:tailor-your-apps-for-apple-gpus-and-tile-based-deferred-rendering>
/// for more information about tiles, tile memory, and deferred rendering.
    tileHeight :: (self: *MTL4RenderPassDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileHeight);
    }

    setTileHeight_ :: (self: *MTL4RenderPassDescriptor, tileHeight: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, tileHeight: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileHeight_, tileHeight);
    }

/// Sets the default raster sample count for the render pass when it references no attachments.
    defaultRasterSampleCount :: (self: *MTL4RenderPassDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.defaultRasterSampleCount);
    }

    setDefaultRasterSampleCount_ :: (self: *MTL4RenderPassDescriptor, defaultRasterSampleCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, defaultRasterSampleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDefaultRasterSampleCount_, defaultRasterSampleCount);
    }

/// Sets the width, in pixels, to which Metal constrains the render target.
///
/// When this value is non-zero, you need to assign it to be smaller than or equal to the minimum width of all attachments.
///
/// The default value of this property is `0`.
///
    renderTargetWidth :: (self: *MTL4RenderPassDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.renderTargetWidth);
    }

    setRenderTargetWidth_ :: (self: *MTL4RenderPassDescriptor, renderTargetWidth: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, renderTargetWidth: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRenderTargetWidth_, renderTargetWidth);
    }

/// Sets the height, in pixels, to which Metal constrains the render target.
///
/// When this value is non-zero, you need to assign it to be smaller than or equal to the minimum height of all attachments.
///
/// The default value of this property is `0`.
///
    renderTargetHeight :: (self: *MTL4RenderPassDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.renderTargetHeight);
    }

    setRenderTargetHeight_ :: (self: *MTL4RenderPassDescriptor, renderTargetHeight: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, renderTargetHeight: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRenderTargetHeight_, renderTargetHeight);
    }

/// Assigns an optional variable rasterization rate map that Metal uses in the render pass.
///
/// Enabling variable rasterization rate allows Metal to decrease the rasterization rate, typically in unimportant
/// regions of color attachments, to accelerate processing.
///
/// When set to `nil`, the default, Metal doesn't use variable rasterization rate.
///
    rasterizationRateMap :: (self: *MTL4RenderPassDescriptor) -> *MTLRasterizationRateMap {
        func: #type (obj: *void, selector: *void) -> *MTLRasterizationRateMap #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.rasterizationRateMap);
    }

    setRasterizationRateMap_ :: (self: *MTL4RenderPassDescriptor, rasterizationRateMap: *MTLRasterizationRateMap) -> void {
        func: #type (obj: *void, selector: *void, rasterizationRateMap: *MTLRasterizationRateMap) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRasterizationRateMap_, rasterizationRateMap);
    }

/// Configures a buffer into which Metal writes counts of fragments (pixels) passing the depth and stencil tests.
    visibilityResultBuffer :: (self: *MTL4RenderPassDescriptor) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.visibilityResultBuffer);
    }

    setVisibilityResultBuffer_ :: (self: *MTL4RenderPassDescriptor, visibilityResultBuffer: *MTLBuffer) -> void {
        func: #type (obj: *void, selector: *void, visibilityResultBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVisibilityResultBuffer_, visibilityResultBuffer);
    }

/// Determines if Metal accumulates visibility results between render encoders or resets them.
    visibilityResultType :: (self: *MTL4RenderPassDescriptor) -> MTLVisibilityResultType {
        func: #type (obj: *void, selector: *void) -> MTLVisibilityResultType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.visibilityResultType);
    }

    setVisibilityResultType_ :: (self: *MTL4RenderPassDescriptor, visibilityResultType: MTLVisibilityResultType) -> void {
        func: #type (obj: *void, selector: *void, visibilityResultType: MTLVisibilityResultType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVisibilityResultType_, visibilityResultType);
    }

/// Controls if the render pass supports color attachment mapping.
    supportColorAttachmentMapping :: (self: *MTL4RenderPassDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportColorAttachmentMapping);
    }

    setSupportColorAttachmentMapping_ :: (self: *MTL4RenderPassDescriptor, supportColorAttachmentMapping: BOOL) -> void {
        func: #type (obj: *void, selector: *void, supportColorAttachmentMapping: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportColorAttachmentMapping_, supportColorAttachmentMapping);
    }

}

/// Base class for Metal 4 acceleration structure descriptors.
///
/// Don't use this class directly. Use one of its subclasses instead.
MTL4AccelerationStructureDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
}

/// Base class for all Metal 4 acceleration structure geometry descriptors.
///
/// Don't use this class directly. Use one of the derived classes instead.
MTL4AccelerationStructureGeometryDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Sets the offset that this geometry contributes to determining the intersection function to invoke when a ray intersects it.
///
/// When you perform a ray tracing operation in the Metal Shading Language, and provide the ray intersector object
/// with an instance of ``MTLIntersectionFunctionTable``, Metal adds this offset to the instance offset from structs such
/// as:
///
/// - ``MTLAccelerationStructureInstanceDescriptor``
/// - ``MTLAccelerationStructureUserIDInstanceDescriptor``
/// - ``MTLAccelerationStructureMotionInstanceDescriptor``
/// - ``MTLIndirectAccelerationStructureInstanceDescriptor``
/// - ``MTLIndirectAccelerationStructureMotionInstanceDescriptor``
///
/// The sum of these offsets provides an index into the intersection function table that the ray tracing system uses
/// to retrieve and invoke the function at this index, allowing you to customize the intersection evaluation process.
    intersectionFunctionTableOffset :: (self: *MTL4AccelerationStructureGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.intersectionFunctionTableOffset);
    }

    setIntersectionFunctionTableOffset_ :: (self: *MTL4AccelerationStructureGeometryDescriptor, intersectionFunctionTableOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, intersectionFunctionTableOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIntersectionFunctionTableOffset_, intersectionFunctionTableOffset);
    }

/// Provides a hint to Metal that this geometry is opaque, potentially accelerating the ray/primitive intersection process.
    opaque :: (self: *MTL4AccelerationStructureGeometryDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.opaque);
    }

    setOpaque_ :: (self: *MTL4AccelerationStructureGeometryDescriptor, opaque: BOOL) -> void {
        func: #type (obj: *void, selector: *void, opaque: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOpaque_, opaque);
    }

/// A boolean value that indicates whether the ray-tracing system in Metal allows the invocation of intersection functions
/// more than once per ray-primitive intersection.
///
/// The property's default value is <doc://com.apple.documentation/documentation/swift/true>.
    allowDuplicateIntersectionFunctionInvocation :: (self: *MTL4AccelerationStructureGeometryDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.allowDuplicateIntersectionFunctionInvocation);
    }

    setAllowDuplicateIntersectionFunctionInvocation_ :: (self: *MTL4AccelerationStructureGeometryDescriptor, allowDuplicateIntersectionFunctionInvocation: BOOL) -> void {
        func: #type (obj: *void, selector: *void, allowDuplicateIntersectionFunctionInvocation: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAllowDuplicateIntersectionFunctionInvocation_, allowDuplicateIntersectionFunctionInvocation);
    }

/// Assigns an optional label you can assign to this geometry for debugging purposes.
    label :: (self: *MTL4AccelerationStructureGeometryDescriptor) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTL4AccelerationStructureGeometryDescriptor, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

/// Assigns optional buffer containing data to associate with each primitive in this geometry.
///
/// You can use zero as the buffer address in this buffer range.
    primitiveDataBuffer :: (self: *MTL4AccelerationStructureGeometryDescriptor) -> MTL4BufferRange {
        func: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.primitiveDataBuffer);
    }

    setPrimitiveDataBuffer_ :: (self: *MTL4AccelerationStructureGeometryDescriptor, primitiveDataBuffer: MTL4BufferRange) -> void {
        func: #type (obj: *void, selector: *void, primitiveDataBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPrimitiveDataBuffer_, primitiveDataBuffer);
    }

/// Defines the stride, in bytes, between each primitive's data in the primitive data buffer ``primitiveDataBuffer`` references.
///
/// You are responsible for ensuring the stride is at least ``primitiveDataElementSize`` in size and a multiple of 4 bytes.
///
/// This property defaults to `0` bytes,  which indicates the stride is equal to ``primitiveDataElementSize``.
    primitiveDataStride :: (self: *MTL4AccelerationStructureGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.primitiveDataStride);
    }

    setPrimitiveDataStride_ :: (self: *MTL4AccelerationStructureGeometryDescriptor, primitiveDataStride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveDataStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPrimitiveDataStride_, primitiveDataStride);
    }

/// Sets the size, in bytes, of the data for each primitive in the primitive data buffer ``primitiveDataBuffer`` references.
///
/// This size needs to be at most ``primitiveDataStride`` in size and a multiple of 4 bytes.
///
/// This property defaults to 0 bytes.
    primitiveDataElementSize :: (self: *MTL4AccelerationStructureGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.primitiveDataElementSize);
    }

    setPrimitiveDataElementSize_ :: (self: *MTL4AccelerationStructureGeometryDescriptor, primitiveDataElementSize: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveDataElementSize: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPrimitiveDataElementSize_, primitiveDataElementSize);
    }

}

/// Descriptor for a primitive acceleration structure that directly references geometric shapes, such as triangles and
/// bounding boxes.
MTL4PrimitiveAccelerationStructureDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Associates the array of geometry descriptors that comprise this primitive acceleration structure.
///
/// If you enable keyframe motion by setting property ``motionKeyframeCount`` to a value greater than `1`, then
/// all geometry descriptors this array references need to be motion geometry descriptors and have a number of
/// primitive buffers equals to ``motionKeyframeCount``.
///
/// Example of motion geometry descriptors include: ``MTL4AccelerationStructureMotionTriangleGeometryDescriptor``,
/// ``MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor``, ``MTL4AccelerationStructureMotionCurveGeometryDescriptor``.
    geometryDescriptors :: (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> *NSArray(*MTL4AccelerationStructureGeometryDescriptor) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTL4AccelerationStructureGeometryDescriptor) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.geometryDescriptors);
    }

    setGeometryDescriptors_ :: (self: *MTL4PrimitiveAccelerationStructureDescriptor, geometryDescriptors: *NSArray(*MTL4AccelerationStructureGeometryDescriptor)) -> void {
        func: #type (obj: *void, selector: *void, geometryDescriptors: *NSArray(*MTL4AccelerationStructureGeometryDescriptor)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setGeometryDescriptors_, geometryDescriptors);
    }

/// Configures the behavior when the ray-tracing system samples the acceleration structure before the motion start time.
///
/// Use this property to control the behavior when the ray-tracing system samples the acceleration structure
/// at a time prior to the one you set for ``motionStartTime``.
///
/// The default value of this property is `MTLMotionBorderModeClamp`.
    motionStartBorderMode :: (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> MTLMotionBorderMode {
        func: #type (obj: *void, selector: *void) -> MTLMotionBorderMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionStartBorderMode);
    }

    setMotionStartBorderMode_ :: (self: *MTL4PrimitiveAccelerationStructureDescriptor, motionStartBorderMode: MTLMotionBorderMode) -> void {
        func: #type (obj: *void, selector: *void, motionStartBorderMode: MTLMotionBorderMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionStartBorderMode_, motionStartBorderMode);
    }

/// Configures the motion border mode.
///
/// This property controls what happens if Metal samples the acceleration structure after ``motionEndTime``.
///
/// Its default value is `MTLMotionBorderModeClamp`.
    motionEndBorderMode :: (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> MTLMotionBorderMode {
        func: #type (obj: *void, selector: *void) -> MTLMotionBorderMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionEndBorderMode);
    }

    setMotionEndBorderMode_ :: (self: *MTL4PrimitiveAccelerationStructureDescriptor, motionEndBorderMode: MTLMotionBorderMode) -> void {
        func: #type (obj: *void, selector: *void, motionEndBorderMode: MTLMotionBorderMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionEndBorderMode_, motionEndBorderMode);
    }

/// Configures the motion start time for this geometry.
///
/// The default value of this property is `0.0f`.
    motionStartTime :: (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> float32 {
        func: #type (obj: *void, selector: *void) -> float32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionStartTime);
    }

    setMotionStartTime_ :: (self: *MTL4PrimitiveAccelerationStructureDescriptor, motionStartTime: float32) -> void {
        func: #type (obj: *void, selector: *void, motionStartTime: float32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionStartTime_, motionStartTime);
    }

/// Configures the motion end time for this geometry.
///
/// The default value of this property is `1.0f`.
    motionEndTime :: (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> float32 {
        func: #type (obj: *void, selector: *void) -> float32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionEndTime);
    }

    setMotionEndTime_ :: (self: *MTL4PrimitiveAccelerationStructureDescriptor, motionEndTime: float32) -> void {
        func: #type (obj: *void, selector: *void, motionEndTime: float32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionEndTime_, motionEndTime);
    }

/// Sets the motion keyframe count.
///
/// This property's default is `1`, indicating no motion.
    motionKeyframeCount :: (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionKeyframeCount);
    }

    setMotionKeyframeCount_ :: (self: *MTL4PrimitiveAccelerationStructureDescriptor, motionKeyframeCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, motionKeyframeCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionKeyframeCount_, motionKeyframeCount);
    }

}

/// Describes triangle geometry suitable for ray tracing.
///
/// Use a ``MTLResidencySet`` to mark residency of all buffers this descriptor references when you build this
/// acceleration structure.
MTL4AccelerationStructureTriangleGeometryDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Associates a vertex buffer containing triangle vertices.
///
/// You are responsible for ensuring that the format of all vertex positions match the ``vertexFormat`` property, and
/// that the buffer address for the buffer range is not zero.
    vertexBuffer :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTL4BufferRange {
        func: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexBuffer);
    }

    setVertexBuffer_ :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, vertexBuffer: MTL4BufferRange) -> void {
        func: #type (obj: *void, selector: *void, vertexBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexBuffer_, vertexBuffer);
    }

/// Describes the format of the vertices in the vertex buffer.
///
/// This property controls the format of the position attribute of the vertices the ``vertexBuffer`` references.
///
/// The format defaults to `MTLAttributeFormatFloat3`, corresponding to three packed floating point numbers.
    vertexFormat :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTLAttributeFormat {
        func: #type (obj: *void, selector: *void) -> MTLAttributeFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexFormat);
    }

    setVertexFormat_ :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, vertexFormat: MTLAttributeFormat) -> void {
        func: #type (obj: *void, selector: *void, vertexFormat: MTLAttributeFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexFormat_, vertexFormat);
    }

/// Sets the stride, in bytes, between vertices in the vertex buffer.
///
/// The stride you specify needs to be a multiple of the size of the vertex format you provide in the ``vertexFormat``
/// property. Similarly, you are responsible for ensuring this stride matches the vertex format data type's alignment.
///
/// Defaults to `0`, which signals the stride matches the size of the ``vertexFormat`` data.
    vertexStride :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexStride);
    }

    setVertexStride_ :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, vertexStride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, vertexStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexStride_, vertexStride);
    }

/// Sets an optional index buffer containing references to vertices in the `vertexBuffer`.
///
/// You can set this property to `0`, the default, to avoid specifying an index buffer.
    indexBuffer :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTL4BufferRange {
        func: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexBuffer);
    }

    setIndexBuffer_ :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, indexBuffer: MTL4BufferRange) -> void {
        func: #type (obj: *void, selector: *void, indexBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexBuffer_, indexBuffer);
    }

/// Configures the size of the indices the `indexBuffer` contains, which is typically either 16 or 32-bits for each index.
    indexType :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTLIndexType {
        func: #type (obj: *void, selector: *void) -> MTLIndexType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexType);
    }

    setIndexType_ :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, indexType: MTLIndexType) -> void {
        func: #type (obj: *void, selector: *void, indexType: MTLIndexType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexType_, indexType);
    }

/// Declares the number of triangles in this geometry descriptor.
    triangleCount :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.triangleCount);
    }

    setTriangleCount_ :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, triangleCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, triangleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTriangleCount_, triangleCount);
    }

/// Assigns an optional reference to a buffer containing a `float4x3` transformation matrix.
///
/// When the buffer address is non-zero, Metal applies this transform to the vertex data positions when building
/// the acceleration structure.
///
/// Building an acceleration structure with a descriptor that specifies this property doesn't modify the contents of
/// the input `vertexBuffer`.
    transformationMatrixBuffer :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTL4BufferRange {
        func: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.transformationMatrixBuffer);
    }

    setTransformationMatrixBuffer_ :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, transformationMatrixBuffer: MTL4BufferRange) -> void {
        func: #type (obj: *void, selector: *void, transformationMatrixBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTransformationMatrixBuffer_, transformationMatrixBuffer);
    }

/// Configures the layout for the transformation matrix in the transformation matrix buffer.
///
/// You can provide matrices in column-major or row-major form, and this property allows you to control
/// how Metal interprets them.
///
/// Defaults to `MTLMatrixLayoutColumnMajor`.
    transformationMatrixLayout :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTLMatrixLayout {
        func: #type (obj: *void, selector: *void) -> MTLMatrixLayout #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.transformationMatrixLayout);
    }

    setTransformationMatrixLayout_ :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, transformationMatrixLayout: MTLMatrixLayout) -> void {
        func: #type (obj: *void, selector: *void, transformationMatrixLayout: MTLMatrixLayout) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTransformationMatrixLayout_, transformationMatrixLayout);
    }

}

/// Describes bounding-box geometry suitable for ray tracing.
///
/// You use bounding boxes to implement procedural geometry for ray tracing, such as spheres or any other shape
/// you define by using intersection functions.
///
/// Use a ``MTLResidencySet`` to mark residency of all buffers this descriptor references when you build this
/// acceleration structure.
MTL4AccelerationStructureBoundingBoxGeometryDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// References a buffer containing bounding box data in `MTLAxisAlignedBoundingBoxes` format.
///
/// You are responsible for ensuring the buffer address of the range is not zero.
    boundingBoxBuffer :: (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor) -> MTL4BufferRange {
        func: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.boundingBoxBuffer);
    }

    setBoundingBoxBuffer_ :: (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxBuffer: MTL4BufferRange) -> void {
        func: #type (obj: *void, selector: *void, boundingBoxBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBoundingBoxBuffer_, boundingBoxBuffer);
    }

/// Assigns the stride, in bytes, between bounding boxes in the bounding box buffer `boundingBoxBuffer` references.
///
/// You are responsible for ensuring this stride is at least 24 bytes and a multiple of 4 bytes.
///
/// This property defaults to `24` bytes.
    boundingBoxStride :: (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.boundingBoxStride);
    }

    setBoundingBoxStride_ :: (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxStride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, boundingBoxStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBoundingBoxStride_, boundingBoxStride);
    }

/// Describes the number of bounding boxes the `boundingBoxBuffer` contains.
    boundingBoxCount :: (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.boundingBoxCount);
    }

    setBoundingBoxCount_ :: (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, boundingBoxCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBoundingBoxCount_, boundingBoxCount);
    }

}

/// Describes motion triangle geometry, suitable for motion ray tracing.
///
/// Use a ``MTLResidencySet`` to mark residency of all buffers this descriptor references when you build this
/// acceleration structure.
MTL4AccelerationStructureMotionTriangleGeometryDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Assigns a buffer where each entry contains a reference to a vertex buffer.
///
/// This property references a buffer that conceptually represents an array with one entry for each keyframe in the
/// motion animation. Each one of these entries consists of a ``MTL4BufferRange`` that, in turn, references a
/// vertex buffer containing the vertex data for the keyframe.
///
/// You are responsible for ensuring the buffer address is not zero for the top-level buffer, as well as for all
/// the vertex buffers it references.
    vertexBuffers :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTL4BufferRange {
        func: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexBuffers);
    }

    setVertexBuffers_ :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, vertexBuffers: MTL4BufferRange) -> void {
        func: #type (obj: *void, selector: *void, vertexBuffers: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexBuffers_, vertexBuffers);
    }

/// Defines the format of the vertices in the vertex buffers.
///
/// All keyframes share the same vertex format. Defaults to `MTLAttributeFormatFloat3`, corresponding to three packed
/// floating point numbers.
    vertexFormat :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTLAttributeFormat {
        func: #type (obj: *void, selector: *void) -> MTLAttributeFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexFormat);
    }

    setVertexFormat_ :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, vertexFormat: MTLAttributeFormat) -> void {
        func: #type (obj: *void, selector: *void, vertexFormat: MTLAttributeFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexFormat_, vertexFormat);
    }

/// Sets the stride, in bytes, between vertices in all the vertex buffer.
///
/// All keyframes share the same vertex stride. This stride needs to be a multiple of the size of the vertex format you
/// provide in the ``vertexFormat`` property.
///
/// Similarly, you are responsible for ensuring this stride matches the vertex format data type's alignment.
///
/// Defaults to `0`, which signals the stride matches the size of the ``vertexFormat`` data.
    vertexStride :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexStride);
    }

    setVertexStride_ :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, vertexStride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, vertexStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexStride_, vertexStride);
    }

/// Assigns an optional index buffer containing references to vertices in the vertex buffers you reference through the
/// vertex buffers property.
///
/// You can set this property to `0`, the default, to avoid specifying an index buffer. All keyframes share the same
/// index buffer.
    indexBuffer :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTL4BufferRange {
        func: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexBuffer);
    }

    setIndexBuffer_ :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, indexBuffer: MTL4BufferRange) -> void {
        func: #type (obj: *void, selector: *void, indexBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexBuffer_, indexBuffer);
    }

/// Specifies the size of the indices the `indexBuffer` contains, which is typically either 16 or 32-bits for each index.
    indexType :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTLIndexType {
        func: #type (obj: *void, selector: *void) -> MTLIndexType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexType);
    }

    setIndexType_ :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, indexType: MTLIndexType) -> void {
        func: #type (obj: *void, selector: *void, indexType: MTLIndexType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexType_, indexType);
    }

/// Declares the number of triangles in the vertex buffers that the buffer in the vertex buffers property references.
///
/// All keyframes share the same triangle count.
    triangleCount :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.triangleCount);
    }

    setTriangleCount_ :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, triangleCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, triangleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTriangleCount_, triangleCount);
    }

/// Assings an optional reference to a buffer containing a `float4x3` transformation matrix.
///
/// When the buffer address is non-zero, Metal applies this transform to the vertex data positions when building
/// the acceleration structure. All keyframes share the same transformation matrix.
///
/// Building an acceleration structure with a descriptor that specifies this property doesn't modify the contents of
/// the input `vertexBuffer`.
    transformationMatrixBuffer :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTL4BufferRange {
        func: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.transformationMatrixBuffer);
    }

    setTransformationMatrixBuffer_ :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, transformationMatrixBuffer: MTL4BufferRange) -> void {
        func: #type (obj: *void, selector: *void, transformationMatrixBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTransformationMatrixBuffer_, transformationMatrixBuffer);
    }

/// Configures the layout for the transformation matrix in the transformation matrix buffer.
///
/// You can provide matrices in column-major or row-major form, and this property allows you to control
/// how Metal interprets them.
///
/// Defaults to `MTLMatrixLayoutColumnMajor`.
    transformationMatrixLayout :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTLMatrixLayout {
        func: #type (obj: *void, selector: *void) -> MTLMatrixLayout #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.transformationMatrixLayout);
    }

    setTransformationMatrixLayout_ :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, transformationMatrixLayout: MTLMatrixLayout) -> void {
        func: #type (obj: *void, selector: *void, transformationMatrixLayout: MTLMatrixLayout) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTransformationMatrixLayout_, transformationMatrixLayout);
    }

}

/// Describes motion bounding box geometry, suitable for motion ray tracing.
///
/// You use bounding boxes to implement procedural geometry for ray tracing, such as spheres or any other shape
/// you define by using intersection functions.
///
/// Use a ``MTLResidencySet`` to mark residency of all buffers this descriptor references when you build this
/// acceleration structure.
MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Configures a reference to a buffer where each entry contains a reference to a buffer of bounding boxes.
///
/// This property references a buffer that conceptually represents an array with one entry for each keyframe in the
/// motion animation. Each one of these entries consists of a ``MTL4BufferRange`` that, in turn, references a
/// vertex buffer containing the bounding box data for the keyframe.
///
/// You are responsible for ensuring the buffer address is not zero for the top-level buffer, as well as for all
/// the vertex buffers it references.
///
    boundingBoxBuffers :: (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor) -> MTL4BufferRange {
        func: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.boundingBoxBuffers);
    }

    setBoundingBoxBuffers_ :: (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxBuffers: MTL4BufferRange) -> void {
        func: #type (obj: *void, selector: *void, boundingBoxBuffers: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBoundingBoxBuffers_, boundingBoxBuffers);
    }

/// Declares the stride, in bytes, between bounding boxes in the bounding box buffers each entry in `boundingBoxBuffer`
/// references.
///
/// All keyframes share the same bounding box stride. You are responsible for ensuring this stride is at least 24 bytes
/// and a multiple of 4 bytes.
///
/// This property defaults to `24` bytes.
    boundingBoxStride :: (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.boundingBoxStride);
    }

    setBoundingBoxStride_ :: (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxStride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, boundingBoxStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBoundingBoxStride_, boundingBoxStride);
    }

/// Declares the number of bounding boxes in each buffer that `boundingBoxBuffer` references.
///
/// All keyframes share the same bounding box count.
    boundingBoxCount :: (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.boundingBoxCount);
    }

    setBoundingBoxCount_ :: (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, boundingBoxCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBoundingBoxCount_, boundingBoxCount);
    }

}

/// Describes curve geometry suitable for ray tracing.
///
/// Use a ``MTLResidencySet`` to mark residency of all buffers this descriptor references when you build this
/// acceleration structure.
MTL4AccelerationStructureCurveGeometryDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// References a buffer containing curve control points.
///
/// Control points are interpolated according to the basis function you specify in ``curveBasis``.
///
/// You are responsible for ensuring each control is in a format matching the control point format ``controlPointFormat``
/// specifies, as well as ensuring that the buffer address of the range is not zero.
    controlPointBuffer :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTL4BufferRange {
        func: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointBuffer);
    }

    setControlPointBuffer_ :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, controlPointBuffer: MTL4BufferRange) -> void {
        func: #type (obj: *void, selector: *void, controlPointBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointBuffer_, controlPointBuffer);
    }

/// Declares the number of control points in the control point buffer.
    controlPointCount :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointCount);
    }

    setControlPointCount_ :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, controlPointCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, controlPointCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointCount_, controlPointCount);
    }

/// Sets the stride, in bytes, between control points in the control point buffer the control point buffer references.
///
/// You are responsible for ensuring this stride is a multiple of the control point format's element size, and
/// at a minimum exactly the control point format's size.
///
/// This property defaults to `0`, indicating that the control points are tightly-packed.
    controlPointStride :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointStride);
    }

    setControlPointStride_ :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, controlPointStride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, controlPointStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointStride_, controlPointStride);
    }

/// Declares the format of the control points the control point buffer references.
///
/// Defaults to `MTLAttributeFormatFloat3`, representing 3 floating point values tightly packed.
    controlPointFormat :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLAttributeFormat {
        func: #type (obj: *void, selector: *void) -> MTLAttributeFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointFormat);
    }

    setControlPointFormat_ :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, controlPointFormat: MTLAttributeFormat) -> void {
        func: #type (obj: *void, selector: *void, controlPointFormat: MTLAttributeFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointFormat_, controlPointFormat);
    }

/// Assigns a reference to a buffer containing the curve radius for each control point.
///
/// Metal interpolates curve radii according to the basis function you specify via ``curveBasis``.
///
/// You are responsible for ensuring the type of each radius matches the type property ``radiusFormat`` specifies,
/// that each radius is at least zero, and that the buffer address of the range is not zero.
    radiusBuffer :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTL4BufferRange {
        func: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.radiusBuffer);
    }

    setRadiusBuffer_ :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, radiusBuffer: MTL4BufferRange) -> void {
        func: #type (obj: *void, selector: *void, radiusBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRadiusBuffer_, radiusBuffer);
    }

/// Declares the format of the radii in the radius buffer.
///
/// Defaults to  `MTLAttributeFormatFloat`.
    radiusFormat :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLAttributeFormat {
        func: #type (obj: *void, selector: *void) -> MTLAttributeFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.radiusFormat);
    }

    setRadiusFormat_ :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, radiusFormat: MTLAttributeFormat) -> void {
        func: #type (obj: *void, selector: *void, radiusFormat: MTLAttributeFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRadiusFormat_, radiusFormat);
    }

/// Configures the stride, in bytes, between radii in the radius buffer.
///
/// You are responsible for ensuring this property is set to a multiple of the size corresponding to the ``radiusFormat``.
///
/// This property defaults to `0` bytes, indicating that the radii are tightly packed.
    radiusStride :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.radiusStride);
    }

    setRadiusStride_ :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, radiusStride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, radiusStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRadiusStride_, radiusStride);
    }

/// Assigns an optional index buffer containing references to control points in the control point buffer.
///
/// Each index represents the first control point of a curve segment. You are responsible for ensuring the buffer
/// address of the range is not zero.
    indexBuffer :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTL4BufferRange {
        func: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexBuffer);
    }

    setIndexBuffer_ :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, indexBuffer: MTL4BufferRange) -> void {
        func: #type (obj: *void, selector: *void, indexBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexBuffer_, indexBuffer);
    }

/// Specifies the size of the indices the `indexBuffer` contains, which is typically either 16 or 32-bits for each index.
    indexType :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLIndexType {
        func: #type (obj: *void, selector: *void) -> MTLIndexType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexType);
    }

    setIndexType_ :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, indexType: MTLIndexType) -> void {
        func: #type (obj: *void, selector: *void, indexType: MTLIndexType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexType_, indexType);
    }

/// Declares the number of curve segments.
    segmentCount :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.segmentCount);
    }

    setSegmentCount_ :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, segmentCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, segmentCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSegmentCount_, segmentCount);
    }

/// Declares the number of control points per curve segment.
///
/// Valid values for this property are `2`, `3`, or `4`.
    segmentControlPointCount :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.segmentControlPointCount);
    }

    setSegmentControlPointCount_ :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, segmentControlPointCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, segmentControlPointCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSegmentControlPointCount_, segmentControlPointCount);
    }

/// Controls the curve type.
///
/// Defaults to `MTLCurveTypeRound`.
    curveType :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLCurveType {
        func: #type (obj: *void, selector: *void) -> MTLCurveType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.curveType);
    }

    setCurveType_ :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, curveType: MTLCurveType) -> void {
        func: #type (obj: *void, selector: *void, curveType: MTLCurveType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCurveType_, curveType);
    }

/// Controls the curve basis function, determining how Metal interpolates the control points.
///
/// Defaults to `MTLCurveBasisBSpline`.
    curveBasis :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLCurveBasis {
        func: #type (obj: *void, selector: *void) -> MTLCurveBasis #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.curveBasis);
    }

    setCurveBasis_ :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, curveBasis: MTLCurveBasis) -> void {
        func: #type (obj: *void, selector: *void, curveBasis: MTLCurveBasis) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCurveBasis_, curveBasis);
    }

/// Sets the type of curve end caps.
///
/// Defaults to `MTLCurveEndCapsNone`.
    curveEndCaps :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLCurveEndCaps {
        func: #type (obj: *void, selector: *void) -> MTLCurveEndCaps #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.curveEndCaps);
    }

    setCurveEndCaps_ :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, curveEndCaps: MTLCurveEndCaps) -> void {
        func: #type (obj: *void, selector: *void, curveEndCaps: MTLCurveEndCaps) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCurveEndCaps_, curveEndCaps);
    }

}

/// Describes motion curve geometry, suitable for motion ray tracing.
///
/// Use a ``MTLResidencySet`` to mark residency of all buffers this descriptor references when you build this
/// acceleration structure.
MTL4AccelerationStructureMotionCurveGeometryDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Assigns a reference to a buffer where each entry contains a reference to a buffer of control points.
///
/// This property references a buffer that conceptually represents an array with one entry for each keyframe in the
/// motion animation. Each one of these entries consists of a ``MTL4BufferRange`` that, in turn, references a
/// buffer containing the control points corresponding to the keyframe.
///
/// You are responsible for ensuring the buffer address is not zero for the top-level buffer, as well as for all
/// the vertex buffers it references.
///
    controlPointBuffers :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTL4BufferRange {
        func: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointBuffers);
    }

    setControlPointBuffers_ :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, controlPointBuffers: MTL4BufferRange) -> void {
        func: #type (obj: *void, selector: *void, controlPointBuffers: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointBuffers_, controlPointBuffers);
    }

/// Specifies the number of control points in the buffers the control point buffers reference.
///
/// All keyframes have the same number of control points.
    controlPointCount :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointCount);
    }

    setControlPointCount_ :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, controlPointCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, controlPointCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointCount_, controlPointCount);
    }

/// Sets the stride, in bytes, between control points in the control point buffer.
///
/// All keyframes share the same control point stride.
///
/// You are responsible for ensuring this stride is a multiple of the control point format's element size, and
/// at a minimum exactly the control point format's size.
///
/// This property defaults to `0`, indicating that the control points are tightly-packed.
    controlPointStride :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointStride);
    }

    setControlPointStride_ :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, controlPointStride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, controlPointStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointStride_, controlPointStride);
    }

/// Declares the format of the control points in the buffers that the control point buffers reference.
///
/// All keyframes share the same control point format. Defaults to `MTLAttributeFormatFloat3`, representing 3 floating
/// point values tightly packed.
    controlPointFormat :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLAttributeFormat {
        func: #type (obj: *void, selector: *void) -> MTLAttributeFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointFormat);
    }

    setControlPointFormat_ :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, controlPointFormat: MTLAttributeFormat) -> void {
        func: #type (obj: *void, selector: *void, controlPointFormat: MTLAttributeFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointFormat_, controlPointFormat);
    }

/// Assigns a reference to a buffer containing, in turn, references to curve radii buffers.
///
/// This property references a buffer that conceptually represents an array with one entry for each keyframe in the
/// motion animation. Each one of these entries consists of a ``MTL4BufferRange`` that, in turn, references a
/// buffer containing the radii corresponding to the keyframe.
///
/// Metal interpolates curve radii according to the basis function you specify via ``curveBasis``.
///
/// You are responsible for ensuring the type of each radius matches the type property ``radiusFormat`` specifies,
/// that each radius is at least zero, and that the buffer address of the top-level buffer, as well as of buffer
/// it references, is not zero.
    radiusBuffers :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTL4BufferRange {
        func: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.radiusBuffers);
    }

    setRadiusBuffers_ :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, radiusBuffers: MTL4BufferRange) -> void {
        func: #type (obj: *void, selector: *void, radiusBuffers: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRadiusBuffers_, radiusBuffers);
    }

/// Sets the format of the radii in the radius buffer.
///
/// Defaults to  `MTLAttributeFormatFloat`. All keyframes share the same radius format.
    radiusFormat :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLAttributeFormat {
        func: #type (obj: *void, selector: *void) -> MTLAttributeFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.radiusFormat);
    }

    setRadiusFormat_ :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, radiusFormat: MTLAttributeFormat) -> void {
        func: #type (obj: *void, selector: *void, radiusFormat: MTLAttributeFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRadiusFormat_, radiusFormat);
    }

/// Sets the stride, in bytes, between radii in the radius buffer.
///
/// You are responsible for ensuring this property is set to a multiple of the size corresponding to the ``radiusFormat``.
/// All keyframes share the same radius stride.
///
/// This property defaults to `0` bytes, indicating that the radii are tightly packed.
    radiusStride :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.radiusStride);
    }

    setRadiusStride_ :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, radiusStride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, radiusStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRadiusStride_, radiusStride);
    }

/// Assigns an optional index buffer containing references to control points in the control point buffers.
///
/// All keyframes share the same index buffer, with each index representing the first control point of a curve segment.
///
/// You are responsible for ensuring the buffer address of the range is not zero.
    indexBuffer :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTL4BufferRange {
        func: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexBuffer);
    }

    setIndexBuffer_ :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, indexBuffer: MTL4BufferRange) -> void {
        func: #type (obj: *void, selector: *void, indexBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexBuffer_, indexBuffer);
    }

/// Configures the size of the indices the `indexBuffer` contains, which is typically either 16 or 32-bits for each index.
    indexType :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLIndexType {
        func: #type (obj: *void, selector: *void) -> MTLIndexType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexType);
    }

    setIndexType_ :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, indexType: MTLIndexType) -> void {
        func: #type (obj: *void, selector: *void, indexType: MTLIndexType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexType_, indexType);
    }

/// Declares the number of curve segments.
///
/// All keyframes have the same number of curve segments.
    segmentCount :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.segmentCount);
    }

    setSegmentCount_ :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, segmentCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, segmentCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSegmentCount_, segmentCount);
    }

/// Controls the number of control points per curve segment.
///
/// Valid values for this property are `2`, `3`, or `4`. All keyframes have the same number of control points per curve segment.
    segmentControlPointCount :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.segmentControlPointCount);
    }

    setSegmentControlPointCount_ :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, segmentControlPointCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, segmentControlPointCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSegmentControlPointCount_, segmentControlPointCount);
    }

/// Controls the curve type.
///
/// Defaults to `MTLCurveTypeRound`. All keyframes share the same curve type.
    curveType :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveType {
        func: #type (obj: *void, selector: *void) -> MTLCurveType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.curveType);
    }

    setCurveType_ :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, curveType: MTLCurveType) -> void {
        func: #type (obj: *void, selector: *void, curveType: MTLCurveType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCurveType_, curveType);
    }

/// Sets the curve basis function, determining how Metal interpolates the control points.
///
/// Defaults to `MTLCurveBasisBSpline`. All keyframes share the same curve basis function.
    curveBasis :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveBasis {
        func: #type (obj: *void, selector: *void) -> MTLCurveBasis #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.curveBasis);
    }

    setCurveBasis_ :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, curveBasis: MTLCurveBasis) -> void {
        func: #type (obj: *void, selector: *void, curveBasis: MTLCurveBasis) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCurveBasis_, curveBasis);
    }

/// Configures the type of curve end caps.
///
/// Defaults to `MTLCurveEndCapsNone`. All keyframes share the same end cap type.
    curveEndCaps :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveEndCaps {
        func: #type (obj: *void, selector: *void) -> MTLCurveEndCaps #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.curveEndCaps);
    }

    setCurveEndCaps_ :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, curveEndCaps: MTLCurveEndCaps) -> void {
        func: #type (obj: *void, selector: *void, curveEndCaps: MTLCurveEndCaps) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCurveEndCaps_, curveEndCaps);
    }

}

/// Descriptor for an instance acceleration structure.
///
/// An instance acceleration structure references other acceleration structures, and provides the ability to
/// "instantiate" them multiple times, each one with potentially a different transformation matrix.
///
/// You specify the properties of the instances in the acceleration structure this descriptor builds by providing a
/// buffer of `structs` via its ``instanceDescriptorBuffer`` property.
///
/// Use a ``MTLResidencySet`` to mark residency of all buffers and acceleration structures this descriptor references
/// when you build this acceleration structure.
MTL4InstanceAccelerationStructureDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Assigns a reference to a buffer containing instance descriptors for acceleration structures to reference.
///
/// This buffer conceptually represents an array of instance data. The specific format for the structs that comprise
/// each entry depends on the value of the  ``instanceDescriptorType`` property.
///
/// You are responsible for ensuring the buffer address the range contains is not zero.
    instanceDescriptorBuffer :: (self: *MTL4InstanceAccelerationStructureDescriptor) -> MTL4BufferRange {
        func: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceDescriptorBuffer);
    }

    setInstanceDescriptorBuffer_ :: (self: *MTL4InstanceAccelerationStructureDescriptor, instanceDescriptorBuffer: MTL4BufferRange) -> void {
        func: #type (obj: *void, selector: *void, instanceDescriptorBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceDescriptorBuffer_, instanceDescriptorBuffer);
    }

/// Sets the stride, in bytes, between instance descriptors the instance descriptor buffer references.
///
/// You are responsible for ensuring this stride is at least the size of the structure type corresponding to the instance
/// descriptor type and a multiple of 4 bytes.
///
/// Defaults to `0`, indicating the instance descriptors are tightly packed.
    instanceDescriptorStride :: (self: *MTL4InstanceAccelerationStructureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceDescriptorStride);
    }

    setInstanceDescriptorStride_ :: (self: *MTL4InstanceAccelerationStructureDescriptor, instanceDescriptorStride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, instanceDescriptorStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceDescriptorStride_, instanceDescriptorStride);
    }

/// Controls the number of instance descriptors in the instance descriptor buffer references.
    instanceCount :: (self: *MTL4InstanceAccelerationStructureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceCount);
    }

    setInstanceCount_ :: (self: *MTL4InstanceAccelerationStructureDescriptor, instanceCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, instanceCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceCount_, instanceCount);
    }

/// Sets the type of instance descriptor that the instance descriptor buffer references.
///
/// This value determines the layout Metal expects for the structs the instance descriptor buffer contains.
///
/// Defaults to `MTLAccelerationStructureInstanceDescriptorTypeIndirect`. Valid values for this property are
/// `MTLAccelerationStructureInstanceDescriptorTypeIndirect` or `MTLAccelerationStructureInstanceDescriptorTypeIndirectMotion`.
    instanceDescriptorType :: (self: *MTL4InstanceAccelerationStructureDescriptor) -> MTLAccelerationStructureInstanceDescriptorType {
        func: #type (obj: *void, selector: *void) -> MTLAccelerationStructureInstanceDescriptorType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceDescriptorType);
    }

    setInstanceDescriptorType_ :: (self: *MTL4InstanceAccelerationStructureDescriptor, instanceDescriptorType: MTLAccelerationStructureInstanceDescriptorType) -> void {
        func: #type (obj: *void, selector: *void, instanceDescriptorType: MTLAccelerationStructureInstanceDescriptorType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceDescriptorType_, instanceDescriptorType);
    }

/// A buffer containing transformation information for instance motion keyframes, formatted according
/// to the motion transform type.
///
/// Each instance can have a different number of keyframes that you configure via individual instance
/// descriptors.
///
/// You are responsible for ensuring the buffer address the range references is not zero when using motion instance descriptors.
    motionTransformBuffer :: (self: *MTL4InstanceAccelerationStructureDescriptor) -> MTL4BufferRange {
        func: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformBuffer);
    }

    setMotionTransformBuffer_ :: (self: *MTL4InstanceAccelerationStructureDescriptor, motionTransformBuffer: MTL4BufferRange) -> void {
        func: #type (obj: *void, selector: *void, motionTransformBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformBuffer_, motionTransformBuffer);
    }

/// Controls the total number of motion transforms in the motion transform buffer.
    motionTransformCount :: (self: *MTL4InstanceAccelerationStructureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformCount);
    }

    setMotionTransformCount_ :: (self: *MTL4InstanceAccelerationStructureDescriptor, motionTransformCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, motionTransformCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformCount_, motionTransformCount);
    }

/// Specifies the layout for the transformation matrices in the instance descriptor buffer and the motion transformation matrix buffer.
///
/// Metal interprets the value of this property as the layout for the buffers that both ``instanceDescriptorBuffer`` and
/// ``motionTransformBuffer`` reference.
///
/// Defaults to `MTLMatrixLayoutColumnMajor`.
    instanceTransformationMatrixLayout :: (self: *MTL4InstanceAccelerationStructureDescriptor) -> MTLMatrixLayout {
        func: #type (obj: *void, selector: *void) -> MTLMatrixLayout #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceTransformationMatrixLayout);
    }

    setInstanceTransformationMatrixLayout_ :: (self: *MTL4InstanceAccelerationStructureDescriptor, instanceTransformationMatrixLayout: MTLMatrixLayout) -> void {
        func: #type (obj: *void, selector: *void, instanceTransformationMatrixLayout: MTLMatrixLayout) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceTransformationMatrixLayout_, instanceTransformationMatrixLayout);
    }

/// Controls the type of motion transforms, either as a matrix or individual components.
///
/// Defaults to `MTLTransformTypePackedFloat4x3`. Using a `MTLTransformTypeComponent` allows you to represent the
/// rotation by a quaternion (instead as of part of the matrix), allowing for correct motion interpolation.
    motionTransformType :: (self: *MTL4InstanceAccelerationStructureDescriptor) -> MTLTransformType {
        func: #type (obj: *void, selector: *void) -> MTLTransformType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformType);
    }

    setMotionTransformType_ :: (self: *MTL4InstanceAccelerationStructureDescriptor, motionTransformType: MTLTransformType) -> void {
        func: #type (obj: *void, selector: *void, motionTransformType: MTLTransformType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformType_, motionTransformType);
    }

/// Specify the stride for motion transform.
///
/// Defaults to `0`, indicating that transforms are tightly packed according to the motion transform type.
    motionTransformStride :: (self: *MTL4InstanceAccelerationStructureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformStride);
    }

    setMotionTransformStride_ :: (self: *MTL4InstanceAccelerationStructureDescriptor, motionTransformStride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, motionTransformStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformStride_, motionTransformStride);
    }

}

/// Descriptor for an "indirect" instance acceleration structure that allows providing the instance count and
/// motion transform count indirectly, through buffer references.
///
/// An instance acceleration structure references other acceleration structures, and provides the ability to
/// "instantiate" them multiple times, each one with potentially a different transformation matrix.
///
/// You specify the properties of the instances in the acceleration structure this descriptor builds by providing a
/// buffer of `structs` via its ``instanceDescriptorBuffer`` property.
///
/// Compared to ``MTL4InstanceAccelerationStructureDescriptor``, this descriptor allows you to provide the number
/// of instances it references indirectly through a buffer reference, as well as the number of motion transforms.
///
/// This enables you to determine these counts indirectly in the GPU timeline via a compute pipeline.
/// Metal needs only to know the maximum possible number of instances and motion transforms to support,
/// which you specify via the ``maxInstanceCount`` and ``maxMotionTransformCount`` properties.
///
/// Use a ``MTLResidencySet`` to mark residency of all buffers and acceleration structures this descriptor references
/// when you build this acceleration structure.
MTL4IndirectInstanceAccelerationStructureDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Assigns a reference to a buffer containing instance descriptors for acceleration structures to reference.
///
/// This buffer conceptually represents an array of instance data. The specific format for the structs that comprise
/// each entry depends on the value of the  ``instanceDescriptorType`` property.
///
/// You are responsible for ensuring the buffer address the range contains is not zero.
    instanceDescriptorBuffer :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTL4BufferRange {
        func: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceDescriptorBuffer);
    }

    setInstanceDescriptorBuffer_ :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, instanceDescriptorBuffer: MTL4BufferRange) -> void {
        func: #type (obj: *void, selector: *void, instanceDescriptorBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceDescriptorBuffer_, instanceDescriptorBuffer);
    }

/// Sets the stride, in bytes, between instance descriptors in the instance descriptor buffer.
///
/// You are responsible for ensuring this stride is at least the size of the structure type corresponding to the instance
/// descriptor type and a multiple of 4 bytes.
///
/// Defaults to `0`, indicating the instance descriptors are tightly packed.
    instanceDescriptorStride :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceDescriptorStride);
    }

    setInstanceDescriptorStride_ :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, instanceDescriptorStride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, instanceDescriptorStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceDescriptorStride_, instanceDescriptorStride);
    }

/// Controls the maximum number of instance descriptors the instance descriptor buffer can reference.
///
/// You are responsible for ensuring that the final number of instances at build time, which you provide indirectly
/// via a buffer reference in ``instanceCountBuffer``, is less than or equal to this number.
    maxInstanceCount :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxInstanceCount);
    }

    setMaxInstanceCount_ :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, maxInstanceCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxInstanceCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxInstanceCount_, maxInstanceCount);
    }

/// Provides a reference to a buffer containing the number of instances in the instance descriptor buffer, formatted as a
/// 32-bit unsigned integer.
///
/// You are responsible for ensuring that the final number of instances at build time, which you provide indirectly
/// via this buffer reference , is less than or equal to the value of property ``maxInstanceCount``.
    instanceCountBuffer :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTL4BufferRange {
        func: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceCountBuffer);
    }

    setInstanceCountBuffer_ :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, instanceCountBuffer: MTL4BufferRange) -> void {
        func: #type (obj: *void, selector: *void, instanceCountBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceCountBuffer_, instanceCountBuffer);
    }

/// Controls the type of instance descriptor that the instance descriptor buffer references.
///
/// This value determines the layout Metal expects for the structs the instance descriptor buffer contains.
///
/// Defaults to `MTLAccelerationStructureInstanceDescriptorTypeIndirect`. Valid values for this property are
/// `MTLAccelerationStructureInstanceDescriptorTypeIndirect` or `MTLAccelerationStructureInstanceDescriptorTypeIndirectMotion`.
    instanceDescriptorType :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTLAccelerationStructureInstanceDescriptorType {
        func: #type (obj: *void, selector: *void) -> MTLAccelerationStructureInstanceDescriptorType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceDescriptorType);
    }

    setInstanceDescriptorType_ :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, instanceDescriptorType: MTLAccelerationStructureInstanceDescriptorType) -> void {
        func: #type (obj: *void, selector: *void, instanceDescriptorType: MTLAccelerationStructureInstanceDescriptorType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceDescriptorType_, instanceDescriptorType);
    }

/// A buffer containing transformation information for instance motion keyframes, formatted according
/// to the motion transform type.
///
/// Each instance can have a different number of keyframes that you configure via individual instance
/// descriptors.
///
/// You are responsible for ensuring the buffer address the range references is not zero when using motion instance descriptors.
    motionTransformBuffer :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTL4BufferRange {
        func: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformBuffer);
    }

    setMotionTransformBuffer_ :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, motionTransformBuffer: MTL4BufferRange) -> void {
        func: #type (obj: *void, selector: *void, motionTransformBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformBuffer_, motionTransformBuffer);
    }

/// Controls the maximum number of motion transforms in the motion transform buffer.
///
/// You are responsible for ensuring that final number of motion transforms at build time that the buffer
/// ``motionTransformCountBuffer`` references is less than or equal to this number.
    maxMotionTransformCount :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxMotionTransformCount);
    }

    setMaxMotionTransformCount_ :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, maxMotionTransformCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxMotionTransformCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxMotionTransformCount_, maxMotionTransformCount);
    }

/// Associates a buffer reference containing the number of motion transforms in the motion transform buffer, formatted as a
/// 32-bit unsigned integer.
///
/// You are responsible for ensuring that the final number of motion transforms at build time in the buffer this property
/// references is less than or equal to the value of property ``maxMotionTransformCount``.
    motionTransformCountBuffer :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTL4BufferRange {
        func: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformCountBuffer);
    }

    setMotionTransformCountBuffer_ :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, motionTransformCountBuffer: MTL4BufferRange) -> void {
        func: #type (obj: *void, selector: *void, motionTransformCountBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformCountBuffer_, motionTransformCountBuffer);
    }

/// Specifies the layout for the transformation matrices in the instance descriptor buffer and the motion transformation matrix buffer.
///
/// Metal interprets the value of this property as the layout for the buffers that both ``instanceDescriptorBuffer`` and
/// ``motionTransformBuffer`` reference.
///
/// Defaults to `MTLMatrixLayoutColumnMajor`.
    instanceTransformationMatrixLayout :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTLMatrixLayout {
        func: #type (obj: *void, selector: *void) -> MTLMatrixLayout #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceTransformationMatrixLayout);
    }

    setInstanceTransformationMatrixLayout_ :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, instanceTransformationMatrixLayout: MTLMatrixLayout) -> void {
        func: #type (obj: *void, selector: *void, instanceTransformationMatrixLayout: MTLMatrixLayout) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceTransformationMatrixLayout_, instanceTransformationMatrixLayout);
    }

/// Sets the type of motion transforms, either as a matrix or individual components.
///
/// Defaults to `MTLTransformTypePackedFloat4x3`. Using a `MTLTransformTypeComponent` allows you to represent the
/// rotation by a quaternion (instead as of part of the matrix), allowing for correct motion interpolation.
    motionTransformType :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTLTransformType {
        func: #type (obj: *void, selector: *void) -> MTLTransformType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformType);
    }

    setMotionTransformType_ :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, motionTransformType: MTLTransformType) -> void {
        func: #type (obj: *void, selector: *void, motionTransformType: MTLTransformType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformType_, motionTransformType);
    }

/// Sets the stride for motion transform.
///
/// Defaults to `0`, indicating that transforms are tightly packed according to the motion transform type.
    motionTransformStride :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformStride);
    }

    setMotionTransformStride_ :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, motionTransformStride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, motionTransformStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformStride_, motionTransformStride);
    }

}

/// Serves as the base descriptor for creating a Metal library.
MTL4LibraryDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Assigns an optional string containing the source code of the shader language program to compile into a
/// Metal library.
    source :: (self: *MTL4LibraryDescriptor) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.source);
    }

    setSource_ :: (self: *MTL4LibraryDescriptor, source: *NSString) -> void {
        func: #type (obj: *void, selector: *void, source: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSource_, source);
    }

/// Provides compile-time options for the Metal library.
    options :: (self: *MTL4LibraryDescriptor) -> *MTLCompileOptions {
        func: #type (obj: *void, selector: *void) -> *MTLCompileOptions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.options);
    }

    setOptions_ :: (self: *MTL4LibraryDescriptor, options: *MTLCompileOptions) -> void {
        func: #type (obj: *void, selector: *void, options: *MTLCompileOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOptions_, options);
    }

/// Assigns an optional name to the Metal library.
    name :: (self: *MTL4LibraryDescriptor) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

    setName_ :: (self: *MTL4LibraryDescriptor, name: *NSString) -> void {
        func: #type (obj: *void, selector: *void, name: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setName_, name);
    }

}

/// Base interface for describing a Metal 4 shader function.
MTL4FunctionDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
}

/// Describes a shader function from a Metal library.
MTL4LibraryFunctionDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Assigns a name to the function.
    name :: (self: *MTL4LibraryFunctionDescriptor) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

    setName_ :: (self: *MTL4LibraryFunctionDescriptor, name: *NSString) -> void {
        func: #type (obj: *void, selector: *void, name: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setName_, name);
    }

/// Returns a reference to the library containing the function.
    library :: (self: *MTL4LibraryFunctionDescriptor) -> *MTLLibrary {
        func: #type (obj: *void, selector: *void) -> *MTLLibrary #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.library);
    }

    setLibrary_ :: (self: *MTL4LibraryFunctionDescriptor, library: *MTLLibrary) -> void {
        func: #type (obj: *void, selector: *void, library: *MTLLibrary) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLibrary_, library);
    }

}

/// Groups together properties to configure and create a specialized function by passing it to a factory method.
///
/// You can pass an instance of this class to any methods that accept a ``MTL4FunctionDescriptor`` parameter to
/// provide extra configuration, such as function constants or a name.
MTL4SpecializedFunctionDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Provides a descriptor that corresponds to a base function that the specialization applies to.
    functionDescriptor :: (self: *MTL4SpecializedFunctionDescriptor) -> *MTL4FunctionDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTL4FunctionDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionDescriptor);
    }

    setFunctionDescriptor_ :: (self: *MTL4SpecializedFunctionDescriptor, functionDescriptor: *MTL4FunctionDescriptor) -> void {
        func: #type (obj: *void, selector: *void, functionDescriptor: *MTL4FunctionDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFunctionDescriptor_, functionDescriptor);
    }

/// Assigns an optional name to the specialized function.
    specializedName :: (self: *MTL4SpecializedFunctionDescriptor) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.specializedName);
    }

    setSpecializedName_ :: (self: *MTL4SpecializedFunctionDescriptor, specializedName: *NSString) -> void {
        func: #type (obj: *void, selector: *void, specializedName: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSpecializedName_, specializedName);
    }

/// Configures optional function constant values to associate with the function.
    constantValues :: (self: *MTL4SpecializedFunctionDescriptor) -> *MTLFunctionConstantValues {
        func: #type (obj: *void, selector: *void) -> *MTLFunctionConstantValues #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.constantValues);
    }

    setConstantValues_ :: (self: *MTL4SpecializedFunctionDescriptor, constantValues: *MTLFunctionConstantValues) -> void {
        func: #type (obj: *void, selector: *void, constantValues: *MTLFunctionConstantValues) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setConstantValues_, constantValues);
    }

}

/// Groups together properties that describe a shader function suitable for stitching.
MTL4StitchedFunctionDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Sets the graph representing how to stitch functions together.
    functionGraph :: (self: *MTL4StitchedFunctionDescriptor) -> *MTLFunctionStitchingGraph {
        func: #type (obj: *void, selector: *void) -> *MTLFunctionStitchingGraph #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionGraph);
    }

    setFunctionGraph_ :: (self: *MTL4StitchedFunctionDescriptor, functionGraph: *MTLFunctionStitchingGraph) -> void {
        func: #type (obj: *void, selector: *void, functionGraph: *MTLFunctionStitchingGraph) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFunctionGraph_, functionGraph);
    }

/// Configures an array of function descriptors with references to functions that contribute to the stitching process.
    functionDescriptors :: (self: *MTL4StitchedFunctionDescriptor) -> *NSArray(*MTL4FunctionDescriptor) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTL4FunctionDescriptor) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionDescriptors);
    }

    setFunctionDescriptors_ :: (self: *MTL4StitchedFunctionDescriptor, functionDescriptors: *NSArray(*MTL4FunctionDescriptor)) -> void {
        func: #type (obj: *void, selector: *void, functionDescriptors: *NSArray(*MTL4FunctionDescriptor)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFunctionDescriptors_, functionDescriptors);
    }

}

/// Provides options controlling how to compile a pipeline state.
///
/// You provide these options through the ``MTL4PipelineDescriptor`` class at compilation time.
MTL4PipelineOptions :: struct #type_info_none {
    nsobject: *NSObject;
/// Controls whether to enable or disable Metal Shader Validation for the pipeline.
    shaderValidation :: (self: *MTL4PipelineOptions) -> MTLShaderValidation {
        func: #type (obj: *void, selector: *void) -> MTLShaderValidation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.shaderValidation);
    }

    setShaderValidation_ :: (self: *MTL4PipelineOptions, shaderValidation: MTLShaderValidation) -> void {
        func: #type (obj: *void, selector: *void, shaderValidation: MTLShaderValidation) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setShaderValidation_, shaderValidation);
    }

/// Controls whether to include Metal shader reflection in this pipeline.
    shaderReflection :: (self: *MTL4PipelineOptions) -> MTL4ShaderReflection {
        func: #type (obj: *void, selector: *void) -> MTL4ShaderReflection #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.shaderReflection);
    }

    setShaderReflection_ :: (self: *MTL4PipelineOptions, shaderReflection: MTL4ShaderReflection) -> void {
        func: #type (obj: *void, selector: *void, shaderReflection: MTL4ShaderReflection) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setShaderReflection_, shaderReflection);
    }

}

/// Base type for descriptors you use for building pipeline state objects.
MTL4PipelineDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Assigns an optional string that uniquely identifies a pipeline descriptor.
///
/// After you provide this label, you can use it to look up a pipeline state object by name in a binary archive.
    label :: (self: *MTL4PipelineDescriptor) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTL4PipelineDescriptor, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

/// Provides compile-time options when you build the pipeline.
    options :: (self: *MTL4PipelineDescriptor) -> *MTL4PipelineOptions {
        func: #type (obj: *void, selector: *void) -> *MTL4PipelineOptions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.options);
    }

    setOptions_ :: (self: *MTL4PipelineDescriptor, options: *MTL4PipelineOptions) -> void {
        func: #type (obj: *void, selector: *void, options: *MTL4PipelineOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOptions_, options);
    }

}

/// Describes a compute pipeline state.
MTL4ComputePipelineDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Resets the descriptor to its default values.
    reset :: (self: *MTL4ComputePipelineDescriptor) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

/// A descriptor representing the compute pipeline's function.
///
/// You don't assign instances of ``MTL4FunctionDescriptor`` to this property directly, instead
/// assign an instance of one of its subclasses, such as ``MTL4LibraryFunctionDescriptor``, which
/// represents a function from a Metal library.
    computeFunctionDescriptor :: (self: *MTL4ComputePipelineDescriptor) -> *MTL4FunctionDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTL4FunctionDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.computeFunctionDescriptor);
    }

    setComputeFunctionDescriptor_ :: (self: *MTL4ComputePipelineDescriptor, computeFunctionDescriptor: *MTL4FunctionDescriptor) -> void {
        func: #type (obj: *void, selector: *void, computeFunctionDescriptor: *MTL4FunctionDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setComputeFunctionDescriptor_, computeFunctionDescriptor);
    }

/// A boolean value indicating whether each dimension of the threadgroup size is a multiple of its
/// corresponding thread execution width.
    threadGroupSizeIsMultipleOfThreadExecutionWidth :: (self: *MTL4ComputePipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.threadGroupSizeIsMultipleOfThreadExecutionWidth);
    }

    setThreadGroupSizeIsMultipleOfThreadExecutionWidth_ :: (self: *MTL4ComputePipelineDescriptor, threadGroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void {
        func: #type (obj: *void, selector: *void, threadGroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setThreadGroupSizeIsMultipleOfThreadExecutionWidth_, threadGroupSizeIsMultipleOfThreadExecutionWidth);
    }

/// The maximum total number of threads that Metal can execute in a single threadgroup for the
/// compute function.
    maxTotalThreadsPerThreadgroup :: (self: *MTL4ComputePipelineDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadsPerThreadgroup);
    }

    setMaxTotalThreadsPerThreadgroup_ :: (self: *MTL4ComputePipelineDescriptor, maxTotalThreadsPerThreadgroup: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxTotalThreadsPerThreadgroup: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxTotalThreadsPerThreadgroup_, maxTotalThreadsPerThreadgroup);
    }

/// The required number of threads per threadgroup for compute dispatches.
///
/// When you set this value, you are responsible for ensuring that the `threadsPerThreadgroup` argument of any compute
/// dispatch matches it.
///
/// Setting this property is optional, except in cases where the pipeline uses *CooperativeTensors*.
///
/// This property's default value is `0`, which disables its effect.
    requiredThreadsPerThreadgroup :: (self: *MTL4ComputePipelineDescriptor) -> MTLSize {
        func: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.requiredThreadsPerThreadgroup);
    }

    setRequiredThreadsPerThreadgroup_ :: (self: *MTL4ComputePipelineDescriptor, requiredThreadsPerThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, requiredThreadsPerThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRequiredThreadsPerThreadgroup_, requiredThreadsPerThreadgroup);
    }

/// A boolean value indicating whether the compute pipeline supports linking binary functions.
    supportBinaryLinking :: (self: *MTL4ComputePipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportBinaryLinking);
    }

    setSupportBinaryLinking_ :: (self: *MTL4ComputePipelineDescriptor, supportBinaryLinking: BOOL) -> void {
        func: #type (obj: *void, selector: *void, supportBinaryLinking: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportBinaryLinking_, supportBinaryLinking);
    }

/// An object that contains information about functions to link to the compute pipeline.
    staticLinkingDescriptor :: (self: *MTL4ComputePipelineDescriptor) -> *MTL4StaticLinkingDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTL4StaticLinkingDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.staticLinkingDescriptor);
    }

    setStaticLinkingDescriptor_ :: (self: *MTL4ComputePipelineDescriptor, staticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void {
        func: #type (obj: *void, selector: *void, staticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStaticLinkingDescriptor_, staticLinkingDescriptor);
    }

/// A value indicating whether the pipeline supports Metal indirect command buffers.
    supportIndirectCommandBuffers :: (self: *MTL4ComputePipelineDescriptor) -> MTL4IndirectCommandBufferSupportState {
        func: #type (obj: *void, selector: *void) -> MTL4IndirectCommandBufferSupportState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportIndirectCommandBuffers);
    }

    setSupportIndirectCommandBuffers_ :: (self: *MTL4ComputePipelineDescriptor, supportIndirectCommandBuffers: MTL4IndirectCommandBufferSupportState) -> void {
        func: #type (obj: *void, selector: *void, supportIndirectCommandBuffers: MTL4IndirectCommandBufferSupportState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportIndirectCommandBuffers_, supportIndirectCommandBuffers);
    }

}

// Groups together properties of a color attachment for a ``MTL4RenderPipeline``.
MTL4RenderPipelineColorAttachmentDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Resets this descriptor to its default state.
    reset :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

/// Configures the pixel format.
///
/// This property defaults to ``MTLPixelFormatInvalid``.
    pixelFormat :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLPixelFormat {
        func: #type (obj: *void, selector: *void) -> MTLPixelFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pixelFormat);
    }

    setPixelFormat_ :: (self: *MTL4RenderPipelineColorAttachmentDescriptor, pixelFormat: MTLPixelFormat) -> void {
        func: #type (obj: *void, selector: *void, pixelFormat: MTLPixelFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPixelFormat_, pixelFormat);
    }

/// Configure the blend state for color attachments the pipeline state uses.
///
/// This property's default value is ``MTL4BlendStateDisabled``.
    blendingState :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTL4BlendState {
        func: #type (obj: *void, selector: *void) -> MTL4BlendState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.blendingState);
    }

    setBlendingState_ :: (self: *MTL4RenderPipelineColorAttachmentDescriptor, blendingState: MTL4BlendState) -> void {
        func: #type (obj: *void, selector: *void, blendingState: MTL4BlendState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBlendingState_, blendingState);
    }

/// Configures the source RGB blend factor.
///
/// This property defaults to ``MTLBlendFactorOne``.
    sourceRGBBlendFactor :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
        func: #type (obj: *void, selector: *void) -> MTLBlendFactor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sourceRGBBlendFactor);
    }

    setSourceRGBBlendFactor_ :: (self: *MTL4RenderPipelineColorAttachmentDescriptor, sourceRGBBlendFactor: MTLBlendFactor) -> void {
        func: #type (obj: *void, selector: *void, sourceRGBBlendFactor: MTLBlendFactor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSourceRGBBlendFactor_, sourceRGBBlendFactor);
    }

/// Configures the destination RGB blend factor.
///
/// This property defaults to ``MTLBlendFactorZero``.
    destinationRGBBlendFactor :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
        func: #type (obj: *void, selector: *void) -> MTLBlendFactor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.destinationRGBBlendFactor);
    }

    setDestinationRGBBlendFactor_ :: (self: *MTL4RenderPipelineColorAttachmentDescriptor, destinationRGBBlendFactor: MTLBlendFactor) -> void {
        func: #type (obj: *void, selector: *void, destinationRGBBlendFactor: MTLBlendFactor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDestinationRGBBlendFactor_, destinationRGBBlendFactor);
    }

/// Configures the RGB blend operation.
///
/// This property defaults to ``MTLBlendOperationAdd``.
    rgbBlendOperation :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendOperation {
        func: #type (obj: *void, selector: *void) -> MTLBlendOperation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.rgbBlendOperation);
    }

    setRgbBlendOperation_ :: (self: *MTL4RenderPipelineColorAttachmentDescriptor, rgbBlendOperation: MTLBlendOperation) -> void {
        func: #type (obj: *void, selector: *void, rgbBlendOperation: MTLBlendOperation) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRgbBlendOperation_, rgbBlendOperation);
    }

/// Configures the source-alpha blend factor.
///
/// This property defaults to ``MTLBlendFactorOne``.
    sourceAlphaBlendFactor :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
        func: #type (obj: *void, selector: *void) -> MTLBlendFactor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sourceAlphaBlendFactor);
    }

    setSourceAlphaBlendFactor_ :: (self: *MTL4RenderPipelineColorAttachmentDescriptor, sourceAlphaBlendFactor: MTLBlendFactor) -> void {
        func: #type (obj: *void, selector: *void, sourceAlphaBlendFactor: MTLBlendFactor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSourceAlphaBlendFactor_, sourceAlphaBlendFactor);
    }

/// Configures the destination-alpha blend factor.
///
/// This property defaults to ``MTLBlendFactorZero``.
    destinationAlphaBlendFactor :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
        func: #type (obj: *void, selector: *void) -> MTLBlendFactor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.destinationAlphaBlendFactor);
    }

    setDestinationAlphaBlendFactor_ :: (self: *MTL4RenderPipelineColorAttachmentDescriptor, destinationAlphaBlendFactor: MTLBlendFactor) -> void {
        func: #type (obj: *void, selector: *void, destinationAlphaBlendFactor: MTLBlendFactor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDestinationAlphaBlendFactor_, destinationAlphaBlendFactor);
    }

/// Configures the alpha blending operation.
///
/// This property defaults to ``MTLBlendOperationAdd``.
    alphaBlendOperation :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendOperation {
        func: #type (obj: *void, selector: *void) -> MTLBlendOperation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.alphaBlendOperation);
    }

    setAlphaBlendOperation_ :: (self: *MTL4RenderPipelineColorAttachmentDescriptor, alphaBlendOperation: MTLBlendOperation) -> void {
        func: #type (obj: *void, selector: *void, alphaBlendOperation: MTLBlendOperation) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAlphaBlendOperation_, alphaBlendOperation);
    }

/// Configures the color write mask.
///
/// This property defaults to ``MTLColorWriteMaskAll``.
    writeMask :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLColorWriteMask {
        func: #type (obj: *void, selector: *void) -> MTLColorWriteMask #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.writeMask);
    }

    setWriteMask_ :: (self: *MTL4RenderPipelineColorAttachmentDescriptor, writeMask: MTLColorWriteMask) -> void {
        func: #type (obj: *void, selector: *void, writeMask: MTLColorWriteMask) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setWriteMask_, writeMask);
    }

}

/// An array of color attachment descriptions for a render pipeline.
MTL4RenderPipelineColorAttachmentDescriptorArray :: struct #type_info_none {
    nsobject: *NSObject;
/// Accesses a color attachment at a specific index.
///
/// - Parameter attachmentIndex: Index of the attachment to access.
    objectAtIndexedSubscript_ :: (self: *MTL4RenderPipelineColorAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTL4RenderPipelineColorAttachmentDescriptor {
        func: #type (obj: *void, selector: *void, attachmentIndex: NSUInteger) -> *MTL4RenderPipelineColorAttachmentDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, attachmentIndex);
    }

/// Sets an attachment at an index.
///
/// This function offers 'copy' semantics.
///
/// You can safely set the color attachment at any legal index to nil. This has the effect of resetting that attachment
/// descriptor's state to its default values.
///
/// - Parameters:
///   - attachment: the descriptor of the attachment to set.
///   - attachmentIndex: the index of the attachment within the array.
    setObject_atIndexedSubscript_ :: (self: *MTL4RenderPipelineColorAttachmentDescriptorArray, attachment: *MTL4RenderPipelineColorAttachmentDescriptor, attachmentIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, attachment: *MTL4RenderPipelineColorAttachmentDescriptor, attachmentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, attachment, attachmentIndex);
    }

/// Resets the elements of the descriptor array
    reset :: (self: *MTL4RenderPipelineColorAttachmentDescriptorArray) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

}

/// Allows you to specify additional binary functions to link to each stage of a render pipeline.
MTL4RenderPipelineBinaryFunctionsDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Resets this descriptor to its default state.
    reset :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

/// Provides an array of binary functions representing additional binary vertex shader functions.
    vertexAdditionalBinaryFunctions :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> *NSArray(*MTL4BinaryFunction) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTL4BinaryFunction) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexAdditionalBinaryFunctions);
    }

    setVertexAdditionalBinaryFunctions_ :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor, vertexAdditionalBinaryFunctions: *NSArray(*MTL4BinaryFunction)) -> void {
        func: #type (obj: *void, selector: *void, vertexAdditionalBinaryFunctions: *NSArray(*MTL4BinaryFunction)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexAdditionalBinaryFunctions_, vertexAdditionalBinaryFunctions);
    }

/// Provides an array of binary functions representing additional binary fragment shader functions.
    fragmentAdditionalBinaryFunctions :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> *NSArray(*MTL4BinaryFunction) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTL4BinaryFunction) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentAdditionalBinaryFunctions);
    }

    setFragmentAdditionalBinaryFunctions_ :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor, fragmentAdditionalBinaryFunctions: *NSArray(*MTL4BinaryFunction)) -> void {
        func: #type (obj: *void, selector: *void, fragmentAdditionalBinaryFunctions: *NSArray(*MTL4BinaryFunction)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentAdditionalBinaryFunctions_, fragmentAdditionalBinaryFunctions);
    }

/// Provides an array of binary functions representing additional binary tile shader functions.
    tileAdditionalBinaryFunctions :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> *NSArray(*MTL4BinaryFunction) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTL4BinaryFunction) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileAdditionalBinaryFunctions);
    }

    setTileAdditionalBinaryFunctions_ :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor, tileAdditionalBinaryFunctions: *NSArray(*MTL4BinaryFunction)) -> void {
        func: #type (obj: *void, selector: *void, tileAdditionalBinaryFunctions: *NSArray(*MTL4BinaryFunction)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileAdditionalBinaryFunctions_, tileAdditionalBinaryFunctions);
    }

/// Provides an array of binary functions representing additional binary object shader functions.
    objectAdditionalBinaryFunctions :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> *NSArray(*MTL4BinaryFunction) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTL4BinaryFunction) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAdditionalBinaryFunctions);
    }

    setObjectAdditionalBinaryFunctions_ :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor, objectAdditionalBinaryFunctions: *NSArray(*MTL4BinaryFunction)) -> void {
        func: #type (obj: *void, selector: *void, objectAdditionalBinaryFunctions: *NSArray(*MTL4BinaryFunction)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectAdditionalBinaryFunctions_, objectAdditionalBinaryFunctions);
    }

/// Provides an array of binary functions representing additional binary mesh shader functions.
    meshAdditionalBinaryFunctions :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> *NSArray(*MTL4BinaryFunction) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTL4BinaryFunction) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.meshAdditionalBinaryFunctions);
    }

    setMeshAdditionalBinaryFunctions_ :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor, meshAdditionalBinaryFunctions: *NSArray(*MTL4BinaryFunction)) -> void {
        func: #type (obj: *void, selector: *void, meshAdditionalBinaryFunctions: *NSArray(*MTL4BinaryFunction)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshAdditionalBinaryFunctions_, meshAdditionalBinaryFunctions);
    }

}

/// Groups together properties to create a render pipeline state object.
///
/// Compared to ``MTLRenderPipelineDescriptor``, this interface doesn't offer a mechanism to hint to Metal mutability of
/// vertex and fragment buffers. Additionally, using this descriptor, you don't specify binary archives.
MTL4RenderPipelineDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Resets this descriptor to its default state.
    reset :: (self: *MTL4RenderPipelineDescriptor) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

/// Assigns the shader function that this pipeline executes for each vertex.
    vertexFunctionDescriptor :: (self: *MTL4RenderPipelineDescriptor) -> *MTL4FunctionDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTL4FunctionDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexFunctionDescriptor);
    }

    setVertexFunctionDescriptor_ :: (self: *MTL4RenderPipelineDescriptor, vertexFunctionDescriptor: *MTL4FunctionDescriptor) -> void {
        func: #type (obj: *void, selector: *void, vertexFunctionDescriptor: *MTL4FunctionDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexFunctionDescriptor_, vertexFunctionDescriptor);
    }

/// Assigns the shader function that this pipeline executes for each fragment.
///
/// When you don't specify a fragment function, you need to disable rasterization by setting property
/// ``rasterizationEnabled`` to false.
    fragmentFunctionDescriptor :: (self: *MTL4RenderPipelineDescriptor) -> *MTL4FunctionDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTL4FunctionDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentFunctionDescriptor);
    }

    setFragmentFunctionDescriptor_ :: (self: *MTL4RenderPipelineDescriptor, fragmentFunctionDescriptor: *MTL4FunctionDescriptor) -> void {
        func: #type (obj: *void, selector: *void, fragmentFunctionDescriptor: *MTL4FunctionDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentFunctionDescriptor_, fragmentFunctionDescriptor);
    }

/// Configures an optional vertex descriptor for the vertex input.
///
/// A vertex descriptor specifies the layout of your vertex data, allowing your vertex shaders to access the content
/// in your vertex arrays via the `[[stage_in]]` attribute in Metal Shading Language.
    vertexDescriptor :: (self: *MTL4RenderPipelineDescriptor) -> *MTLVertexDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLVertexDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexDescriptor);
    }

    setVertexDescriptor_ :: (self: *MTL4RenderPipelineDescriptor, vertexDescriptor: *MTLVertexDescriptor) -> void {
        func: #type (obj: *void, selector: *void, vertexDescriptor: *MTLVertexDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexDescriptor_, vertexDescriptor);
    }

/// Controls the number of samples this pipeline applies for each fragment.
    rasterSampleCount :: (self: *MTL4RenderPipelineDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.rasterSampleCount);
    }

    setRasterSampleCount_ :: (self: *MTL4RenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, rasterSampleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRasterSampleCount_, rasterSampleCount);
    }

/// Indicates whether to read and use the alpha channel fragment output of color attachments to compute a sample coverage mask.
    alphaToCoverageState :: (self: *MTL4RenderPipelineDescriptor) -> MTL4AlphaToCoverageState {
        func: #type (obj: *void, selector: *void) -> MTL4AlphaToCoverageState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.alphaToCoverageState);
    }

    setAlphaToCoverageState_ :: (self: *MTL4RenderPipelineDescriptor, alphaToCoverageState: MTL4AlphaToCoverageState) -> void {
        func: #type (obj: *void, selector: *void, alphaToCoverageState: MTL4AlphaToCoverageState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAlphaToCoverageState_, alphaToCoverageState);
    }

/// Indicates whether the pipeline forces alpha channel values of color attachments to the largest representable value.
    alphaToOneState :: (self: *MTL4RenderPipelineDescriptor) -> MTL4AlphaToOneState {
        func: #type (obj: *void, selector: *void) -> MTL4AlphaToOneState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.alphaToOneState);
    }

    setAlphaToOneState_ :: (self: *MTL4RenderPipelineDescriptor, alphaToOneState: MTL4AlphaToOneState) -> void {
        func: #type (obj: *void, selector: *void, alphaToOneState: MTL4AlphaToOneState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAlphaToOneState_, alphaToOneState);
    }

    isRasterizationEnabled :: (self: *MTL4RenderPipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isRasterizationEnabled);
    }

    setRasterizationEnabled_ :: (self: *MTL4RenderPipelineDescriptor, rasterizationEnabled: BOOL) -> void {
        func: #type (obj: *void, selector: *void, rasterizationEnabled: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRasterizationEnabled_, rasterizationEnabled);
    }

/// Determines the maximum value that can you can pass as the pipeline's amplification count.
///
/// This property controls the maximum count you pass to ``MTL4RenderCommandEncoder/setVertexAmplificationCount:viewMappings:``
/// when using vertex amplification with this pipeline.
    maxVertexAmplificationCount :: (self: *MTL4RenderPipelineDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxVertexAmplificationCount);
    }

    setMaxVertexAmplificationCount_ :: (self: *MTL4RenderPipelineDescriptor, maxVertexAmplificationCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxVertexAmplificationCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxVertexAmplificationCount_, maxVertexAmplificationCount);
    }

/// Accesses an array containing descriptions of the color attachments this pipeline writes to.
    colorAttachments :: (self: *MTL4RenderPipelineDescriptor) -> *MTL4RenderPipelineColorAttachmentDescriptorArray {
        func: #type (obj: *void, selector: *void) -> *MTL4RenderPipelineColorAttachmentDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.colorAttachments);
    }

/// Assigns type of primitive topology this pipeline renders.
    inputPrimitiveTopology :: (self: *MTL4RenderPipelineDescriptor) -> MTLPrimitiveTopologyClass {
        func: #type (obj: *void, selector: *void) -> MTLPrimitiveTopologyClass #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.inputPrimitiveTopology);
    }

    setInputPrimitiveTopology_ :: (self: *MTL4RenderPipelineDescriptor, inputPrimitiveTopology: MTLPrimitiveTopologyClass) -> void {
        func: #type (obj: *void, selector: *void, inputPrimitiveTopology: MTLPrimitiveTopologyClass) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInputPrimitiveTopology_, inputPrimitiveTopology);
    }

/// Provides static linking information for the vertex stage of the render pipeline.
///
/// Use this property to link extra shader functions to the vertex stage of the render pipeline.
    vertexStaticLinkingDescriptor :: (self: *MTL4RenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTL4StaticLinkingDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexStaticLinkingDescriptor);
    }

    setVertexStaticLinkingDescriptor_ :: (self: *MTL4RenderPipelineDescriptor, vertexStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void {
        func: #type (obj: *void, selector: *void, vertexStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexStaticLinkingDescriptor_, vertexStaticLinkingDescriptor);
    }

/// Provides static linking information for the fragment stage of the render pipeline.
///
/// Use this property to link extra shader functions to the fragment stage of the render pipeline.
    fragmentStaticLinkingDescriptor :: (self: *MTL4RenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTL4StaticLinkingDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentStaticLinkingDescriptor);
    }

    setFragmentStaticLinkingDescriptor_ :: (self: *MTL4RenderPipelineDescriptor, fragmentStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void {
        func: #type (obj: *void, selector: *void, fragmentStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentStaticLinkingDescriptor_, fragmentStaticLinkingDescriptor);
    }

/// Indicates whether you can use the render pipeline to create new pipelines by
/// adding binary functions to the vertex shader function’s callable functions list.
    supportVertexBinaryLinking :: (self: *MTL4RenderPipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportVertexBinaryLinking);
    }

    setSupportVertexBinaryLinking_ :: (self: *MTL4RenderPipelineDescriptor, supportVertexBinaryLinking: BOOL) -> void {
        func: #type (obj: *void, selector: *void, supportVertexBinaryLinking: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportVertexBinaryLinking_, supportVertexBinaryLinking);
    }

/// Indicates whether you can use the pipeline to create new pipelines by
/// adding binary functions to the fragment shader function’s callable functions list.
    supportFragmentBinaryLinking :: (self: *MTL4RenderPipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportFragmentBinaryLinking);
    }

    setSupportFragmentBinaryLinking_ :: (self: *MTL4RenderPipelineDescriptor, supportFragmentBinaryLinking: BOOL) -> void {
        func: #type (obj: *void, selector: *void, supportFragmentBinaryLinking: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportFragmentBinaryLinking_, supportFragmentBinaryLinking);
    }

/// Configures a logical-to-physical rendering remap state.
///
/// Use this property to assign how a ``MTL4RenderCommandEncoder`` instance maps the output of your fragment shader to
/// physical color attachments.
    colorAttachmentMappingState :: (self: *MTL4RenderPipelineDescriptor) -> MTL4LogicalToPhysicalColorAttachmentMappingState {
        func: #type (obj: *void, selector: *void) -> MTL4LogicalToPhysicalColorAttachmentMappingState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.colorAttachmentMappingState);
    }

    setColorAttachmentMappingState_ :: (self: *MTL4RenderPipelineDescriptor, colorAttachmentMappingState: MTL4LogicalToPhysicalColorAttachmentMappingState) -> void {
        func: #type (obj: *void, selector: *void, colorAttachmentMappingState: MTL4LogicalToPhysicalColorAttachmentMappingState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setColorAttachmentMappingState_, colorAttachmentMappingState);
    }

/// Indicates whether the pipeline supports indirect command buffers.
    supportIndirectCommandBuffers :: (self: *MTL4RenderPipelineDescriptor) -> MTL4IndirectCommandBufferSupportState {
        func: #type (obj: *void, selector: *void) -> MTL4IndirectCommandBufferSupportState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportIndirectCommandBuffers);
    }

    setSupportIndirectCommandBuffers_ :: (self: *MTL4RenderPipelineDescriptor, supportIndirectCommandBuffers: MTL4IndirectCommandBufferSupportState) -> void {
        func: #type (obj: *void, selector: *void, supportIndirectCommandBuffers: MTL4IndirectCommandBufferSupportState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportIndirectCommandBuffers_, supportIndirectCommandBuffers);
    }

}

/// Description for a machine learning pipeline state.
MTL4MachineLearningPipelineDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Sets the dimension of an input tensor at a buffer index.
///
/// - Parameters:
///   - dimensions: the dimensions of the tensor.
///   - bufferIndex: Index of the tensor to modify.
    setInputDimensions_atBufferIndex_ :: (self: *MTL4MachineLearningPipelineDescriptor, dimensions: *MTLTensorExtents, bufferIndex: NSInteger) -> void {
        func: #type (obj: *void, selector: *void, dimensions: *MTLTensorExtents, bufferIndex: NSInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInputDimensions_atBufferIndex_, dimensions, bufferIndex);
    }

/// Sets the dimensions of multiple input tensors on a range of buffer bindings.
///
/// Use this method to specify the dimensions of multiple input tensors at a range of indices in a single call.
///
/// You can indicate that any tensors in the range have unspecified dimensions by providing `NSNull` at the their
/// corresponding index location in the array.
///
/// - Important: The range's length property needs to match the number of dimensions you provide. Specifically,
/// `range.length` needs to match `dimensions.count`.
///
/// - Parameters:
///   - dimensions: An array of tensor extents.
///   - range: The range of inputs of the `dimensions` argument.
///   The range's `length` needs to match the dimensions' `count` property.
    setInputDimensions_withRange_ :: (self: *MTL4MachineLearningPipelineDescriptor, dimensions: *NSArray(*MTLTensorExtents), range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, dimensions: *NSArray(*MTLTensorExtents), range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInputDimensions_withRange_, dimensions, range);
    }

/// Obtains the dimensions of the input tensor at `bufferIndex` if set, `nil` otherwise.
    inputDimensionsAtBufferIndex_ :: (self: *MTL4MachineLearningPipelineDescriptor, bufferIndex: NSInteger) -> *MTLTensorExtents {
        func: #type (obj: *void, selector: *void, bufferIndex: NSInteger) -> *MTLTensorExtents #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.inputDimensionsAtBufferIndex_, bufferIndex);
    }

/// Resets the descriptor to its default values.
    reset :: (self: *MTL4MachineLearningPipelineDescriptor) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

/// Assigns an optional string that helps identify pipeline states you create from this descriptor.
    label :: (self: *MTL4MachineLearningPipelineDescriptor) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTL4MachineLearningPipelineDescriptor, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

/// Assigns the function that the machine learning pipeline you create from this descriptor executes.
    machineLearningFunctionDescriptor :: (self: *MTL4MachineLearningPipelineDescriptor) -> *MTL4FunctionDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTL4FunctionDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.machineLearningFunctionDescriptor);
    }

    setMachineLearningFunctionDescriptor_ :: (self: *MTL4MachineLearningPipelineDescriptor, machineLearningFunctionDescriptor: *MTL4FunctionDescriptor) -> void {
        func: #type (obj: *void, selector: *void, machineLearningFunctionDescriptor: *MTL4FunctionDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMachineLearningFunctionDescriptor_, machineLearningFunctionDescriptor);
    }

}

/// Represents reflection information for a machine learning pipeline state.
MTL4MachineLearningPipelineReflection :: struct #type_info_none {
    nsobject: *NSObject;
/// Describes every input and output of the pipeline.
    bindings :: (self: *MTL4MachineLearningPipelineReflection) -> *NSArray(*MTLBinding) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLBinding) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bindings);
    }

}

/// Groups together properties you use to create a tile render pipeline state object.
MTL4TileRenderPipelineDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Resets the descriptor to the default state.
    reset :: (self: *MTL4TileRenderPipelineDescriptor) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

/// Configures the tile function that the render pipeline executes for each tile in the tile shader stage.
    tileFunctionDescriptor :: (self: *MTL4TileRenderPipelineDescriptor) -> *MTL4FunctionDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTL4FunctionDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileFunctionDescriptor);
    }

    setTileFunctionDescriptor_ :: (self: *MTL4TileRenderPipelineDescriptor, tileFunctionDescriptor: *MTL4FunctionDescriptor) -> void {
        func: #type (obj: *void, selector: *void, tileFunctionDescriptor: *MTL4FunctionDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileFunctionDescriptor_, tileFunctionDescriptor);
    }

/// Configures the number of samples per pixel used for multisampling.
    rasterSampleCount :: (self: *MTL4TileRenderPipelineDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.rasterSampleCount);
    }

    setRasterSampleCount_ :: (self: *MTL4TileRenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, rasterSampleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRasterSampleCount_, rasterSampleCount);
    }

/// Access an array of descriptors that configure the properties of each color attachment in the tile render
/// pipeline.
    colorAttachments :: (self: *MTL4TileRenderPipelineDescriptor) -> *MTLTileRenderPipelineColorAttachmentDescriptorArray {
        func: #type (obj: *void, selector: *void) -> *MTLTileRenderPipelineColorAttachmentDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.colorAttachments);
    }

/// Indicating whether the size of the threadgroup matches the size of a tile in the render pipeline.
    threadgroupSizeMatchesTileSize :: (self: *MTL4TileRenderPipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.threadgroupSizeMatchesTileSize);
    }

    setThreadgroupSizeMatchesTileSize_ :: (self: *MTL4TileRenderPipelineDescriptor, threadgroupSizeMatchesTileSize: BOOL) -> void {
        func: #type (obj: *void, selector: *void, threadgroupSizeMatchesTileSize: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setThreadgroupSizeMatchesTileSize_, threadgroupSizeMatchesTileSize);
    }

/// Sets the maximum number of threads that the GPU can execute simultaneously within a single threadgroup in
/// the tile render pipeline.
    maxTotalThreadsPerThreadgroup :: (self: *MTL4TileRenderPipelineDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadsPerThreadgroup);
    }

    setMaxTotalThreadsPerThreadgroup_ :: (self: *MTL4TileRenderPipelineDescriptor, maxTotalThreadsPerThreadgroup: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxTotalThreadsPerThreadgroup: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxTotalThreadsPerThreadgroup_, maxTotalThreadsPerThreadgroup);
    }

/// Sets the required number of threads per threadgroup for tile dispatches.
///
/// This value is typically optional, except in the cases where the tile function that ``tileFunctionDescriptor``
/// references uses `CooperativeTensors`. In this case, you need to provide a non-zero value to this property.
///
/// Additionally, when you set this value, the `threadsPerTile` argument of any tile dispatch needs to match it.
///
/// Setting this value to a size of 0 in every dimension disables this property.
    requiredThreadsPerThreadgroup :: (self: *MTL4TileRenderPipelineDescriptor) -> MTLSize {
        func: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.requiredThreadsPerThreadgroup);
    }

    setRequiredThreadsPerThreadgroup_ :: (self: *MTL4TileRenderPipelineDescriptor, requiredThreadsPerThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, requiredThreadsPerThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRequiredThreadsPerThreadgroup_, requiredThreadsPerThreadgroup);
    }

/// Configures an object that contains information about functions to link to the tile render pipeline
/// when Metal builds it.
    staticLinkingDescriptor :: (self: *MTL4TileRenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTL4StaticLinkingDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.staticLinkingDescriptor);
    }

    setStaticLinkingDescriptor_ :: (self: *MTL4TileRenderPipelineDescriptor, staticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void {
        func: #type (obj: *void, selector: *void, staticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStaticLinkingDescriptor_, staticLinkingDescriptor);
    }

/// Indicates whether the pipeline supports linking binary functions.
    supportBinaryLinking :: (self: *MTL4TileRenderPipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportBinaryLinking);
    }

    setSupportBinaryLinking_ :: (self: *MTL4TileRenderPipelineDescriptor, supportBinaryLinking: BOOL) -> void {
        func: #type (obj: *void, selector: *void, supportBinaryLinking: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportBinaryLinking_, supportBinaryLinking);
    }

}

/// Groups together properties you use to create a mesh render pipeline state object.
///
/// Compared to ``MTLMeshRenderPipelineDescriptor``, this interface doesn't offer a mechanism to hint to Metal mutability
/// of object, mesh, or fragment buffers. Additionally, when you use this descriptor, you don't specify binary archives.
MTL4MeshRenderPipelineDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Resets this descriptor to its default state.
    reset :: (self: *MTL4MeshRenderPipelineDescriptor) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

/// Assigns a function descriptor representing the function this pipeline executes for each *object* in the object shader stage.
    objectFunctionDescriptor :: (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4FunctionDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTL4FunctionDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectFunctionDescriptor);
    }

    setObjectFunctionDescriptor_ :: (self: *MTL4MeshRenderPipelineDescriptor, objectFunctionDescriptor: *MTL4FunctionDescriptor) -> void {
        func: #type (obj: *void, selector: *void, objectFunctionDescriptor: *MTL4FunctionDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectFunctionDescriptor_, objectFunctionDescriptor);
    }

/// Assigns a function descriptor representing the function this pipeline executes for each primitive in the mesh shader stage.
    meshFunctionDescriptor :: (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4FunctionDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTL4FunctionDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.meshFunctionDescriptor);
    }

    setMeshFunctionDescriptor_ :: (self: *MTL4MeshRenderPipelineDescriptor, meshFunctionDescriptor: *MTL4FunctionDescriptor) -> void {
        func: #type (obj: *void, selector: *void, meshFunctionDescriptor: *MTL4FunctionDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshFunctionDescriptor_, meshFunctionDescriptor);
    }

/// Assigns a function descriptor representing the function this pipeline executes for each fragment.
    fragmentFunctionDescriptor :: (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4FunctionDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTL4FunctionDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentFunctionDescriptor);
    }

    setFragmentFunctionDescriptor_ :: (self: *MTL4MeshRenderPipelineDescriptor, fragmentFunctionDescriptor: *MTL4FunctionDescriptor) -> void {
        func: #type (obj: *void, selector: *void, fragmentFunctionDescriptor: *MTL4FunctionDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentFunctionDescriptor_, fragmentFunctionDescriptor);
    }

/// Controls the largest number of threads the pipeline state can execute in a single object shader threadgroup dispatch.
///
/// This number represents the maximum size of the product of the components of parameter `threadsPerObjectThreadgroup`
/// that Metal can use when drawing with this pipeline in mesh shader dispatch methods, such as
/// ``MTL4RenderCommandEncoder/drawMeshThreadgroups:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:``.
///
/// The compiler's optimizer can use the value of this property to generate more efficient code, specifically when
/// the value doesn't exceed the thread execution width of the underlying GPU.
///
/// The default value of this property is `0`, which indicates that the number you pass to attribute
/// `[[max_total_threads_per_threadgroup(N)]]` of the pipeline's object function determines the maximum
/// total threads per threadgroup.
///
/// When you specify both the `[[max_total_threads_per_threadgroup(N)]]` attribute and this property, you are responsible
/// for making sure these values match.
///
/// Additionally, you are responsible for ensuring this value doesn't exceed the "maximum threads per threadgroup"
/// device limit documented in the "Metal Feature Set Tables" PDF:
/// <https://developer.apple.com/metal/Metal-Feature-Set-Tables.pdf>.
///
    maxTotalThreadsPerObjectThreadgroup :: (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadsPerObjectThreadgroup);
    }

    setMaxTotalThreadsPerObjectThreadgroup_ :: (self: *MTL4MeshRenderPipelineDescriptor, maxTotalThreadsPerObjectThreadgroup: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxTotalThreadsPerObjectThreadgroup: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxTotalThreadsPerObjectThreadgroup_, maxTotalThreadsPerObjectThreadgroup);
    }

/// Controls the largest number of threads the pipeline state can execute in a single mesh shader threadgroup dispatch.
///
/// This number represents the maximum size of the product of the components of parameter `threadsPerMeshThreadgroup`
/// that Metal can use when drawing with this pipeline in mesh shader dispatch methods, such as
/// ``MTL4RenderCommandEncoder/drawMeshThreadgroups:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:``.
///
/// The compiler's optimizer can use the value of this property to generate more efficient code, specifically when
/// the value doesn't exceed the thread execution width of the underlying GPU.
///
/// The default value of this property is `0`, thish indicates that the Metal Shader Language attribute
/// `[[max_total_threads_per_threadgroup]]` you attache to the pipeline's mesh shader function determines
/// the value of this property.
///
///
/// When you specify both the `[[max_total_threads_per_threadgroup(N)]]` attribute and this property, you are responsible
/// for making sure these values match.
///
/// Additionally, you are responsible for ensuring this value doesn't exceed the "maximum threads per threadgroup"
/// device limit documented in the "Metal Feature Set Tables" PDF:
/// <https://developer.apple.com/metal/Metal-Feature-Set-Tables.pdf>.
///
    maxTotalThreadsPerMeshThreadgroup :: (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadsPerMeshThreadgroup);
    }

    setMaxTotalThreadsPerMeshThreadgroup_ :: (self: *MTL4MeshRenderPipelineDescriptor, maxTotalThreadsPerMeshThreadgroup: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxTotalThreadsPerMeshThreadgroup: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxTotalThreadsPerMeshThreadgroup_, maxTotalThreadsPerMeshThreadgroup);
    }

/// Controls the required number of object threads-per-threadgroup when drawing with a mesh shader pipeline you create
/// from this descriptor.
///
/// This argument is optional, unless this pipeline uses `CooperativeTensors`, in which case you are responsible for providing it.
///
/// When this value is set to non-zero, you are responsible for ensuring the parameter `threadsPerObjectThreadgroup`
/// in any mesh dispatch draw calls that use this mesh render pipeline, such as
/// ``MTL4RenderCommandEncoder/drawMeshThreadgroups:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:``,
/// match it.
///
/// Setting this value to a size of 0 in every dimension disables this property.
///
    requiredThreadsPerObjectThreadgroup :: (self: *MTL4MeshRenderPipelineDescriptor) -> MTLSize {
        func: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.requiredThreadsPerObjectThreadgroup);
    }

    setRequiredThreadsPerObjectThreadgroup_ :: (self: *MTL4MeshRenderPipelineDescriptor, requiredThreadsPerObjectThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, requiredThreadsPerObjectThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRequiredThreadsPerObjectThreadgroup_, requiredThreadsPerObjectThreadgroup);
    }

/// Controls the required number of mesh threads-per-threadgroup when drawing with a mesh shader pipeline you create
/// from this descriptor.
///
/// This argument is optional, unless this pipeline uses `CooperativeTensors`, in which case you are responsible for providing it.
///
/// When this value is set to non-zero, you are responsible for ensuring the parameter `threadsPerMeshThreadgroup`
/// in any mesh dispatch draw calls that use this mesh render pipeline, such as
/// ``MTL4RenderCommandEncoder/drawMeshThreadgroups:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:``,
/// match it.
///
/// Setting this value to a size of 0 in every dimension disables this property.
///
    requiredThreadsPerMeshThreadgroup :: (self: *MTL4MeshRenderPipelineDescriptor) -> MTLSize {
        func: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.requiredThreadsPerMeshThreadgroup);
    }

    setRequiredThreadsPerMeshThreadgroup_ :: (self: *MTL4MeshRenderPipelineDescriptor, requiredThreadsPerMeshThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, requiredThreadsPerMeshThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRequiredThreadsPerMeshThreadgroup_, requiredThreadsPerMeshThreadgroup);
    }

/// Provides a guarantee to Metal regarding the number of threadgroup threads for the object stage of a pipeline you
/// create from this descriptor.
///
/// If you set this property to <doc://com.apple.documentation/documentation/swift/true>, you state to Metal that when
/// you use a mesh render pipeline you create from this descriptor, the number of threadgroup threads you dispatch for
/// the object stage is a multiple of its ``MTLRenderPipelineState/objectThreadExecutionWidth``. The compiler's optimizer can use this guarantee to generate
///  more efficient code.
///
/// This property's default value is <doc://com.apple.documentation/documentation/swift/false>.
    objectThreadgroupSizeIsMultipleOfThreadExecutionWidth :: (self: *MTL4MeshRenderPipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectThreadgroupSizeIsMultipleOfThreadExecutionWidth);
    }

    setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth_ :: (self: *MTL4MeshRenderPipelineDescriptor, objectThreadgroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void {
        func: #type (obj: *void, selector: *void, objectThreadgroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth_, objectThreadgroupSizeIsMultipleOfThreadExecutionWidth);
    }

/// Provides a guarantee to Metal regarding the number of threadgroup threads for the mesh stage of a pipeline you
/// create from this descriptor.
///
/// If you set this property to <doc://com.apple.documentation/documentation/swift/true>, you state to Metal that when
/// you use a mesh render pipeline you create from this descriptor, the number of threadgroup threads you dispatch for
/// the mesh stage is a multiple of its ``MTLRenderPipelineState/meshThreadExecutionWidth``. The compiler's optimizer
/// can use this guarantee to generate more efficient code.
///
/// This property's default value is <doc://com.apple.documentation/documentation/swift/false>.
    meshThreadgroupSizeIsMultipleOfThreadExecutionWidth :: (self: *MTL4MeshRenderPipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.meshThreadgroupSizeIsMultipleOfThreadExecutionWidth);
    }

    setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth_ :: (self: *MTL4MeshRenderPipelineDescriptor, meshThreadgroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void {
        func: #type (obj: *void, selector: *void, meshThreadgroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth_, meshThreadgroupSizeIsMultipleOfThreadExecutionWidth);
    }

/// Reserves storage for the object-to-mesh stage payload.
///
/// This property determines the size, in bytes, of the buffer you indicate via the Metal Shading Language `[[payload]]`
/// attribute in the object and mesh shader functions of the mesh render pipeline.
///
/// If this value is `0`, Metal derives the size from the (dereferenced) type you declare for the payload in the object
/// shader function. If the type is a pointer, Metal reserves space for a single element.
///
/// The default value is `0`.
    payloadMemoryLength :: (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.payloadMemoryLength);
    }

    setPayloadMemoryLength_ :: (self: *MTL4MeshRenderPipelineDescriptor, payloadMemoryLength: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, payloadMemoryLength: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPayloadMemoryLength_, payloadMemoryLength);
    }

/// Controls the largest number of threads the pipeline state can execute when the object stage of a mesh
/// render pipeline you create from this descriptor dispatches its mesh stage.
///
/// This number represents the maximum size of the product of the components of the parameter you pass to Metal
/// Shading Language's built-in function `mesh_grid_properties::set_threadgroups_per_grid`.
///
/// The default value of this property is `0`, which indicates that the Metal Shading Language attribute
/// `[[max_total_threadgroups_per_mesh_grid(N)]]` you attach to the pipeline's mesh shader function determines
/// the value of this property.
///
/// When you specify both the `[[max_total_threadgroups_per_mesh_grid(N)]]` attribute and this property, you are
/// responsible for making sure these values match.
///
/// Additionally, you are responsible for ensuring this value doesn't exceed the "maximum threads per mesh grid"
/// device limit documented in the "Metal Feature Set Tables" PDF:
/// <https://developer.apple.com/metal/Metal-Feature-Set-Tables.pdf>.
///
    maxTotalThreadgroupsPerMeshGrid :: (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadgroupsPerMeshGrid);
    }

    setMaxTotalThreadgroupsPerMeshGrid_ :: (self: *MTL4MeshRenderPipelineDescriptor, maxTotalThreadgroupsPerMeshGrid: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxTotalThreadgroupsPerMeshGrid: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxTotalThreadgroupsPerMeshGrid_, maxTotalThreadgroupsPerMeshGrid);
    }

/// Sets number of samples this pipeline applies for each fragment.
    rasterSampleCount :: (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.rasterSampleCount);
    }

    setRasterSampleCount_ :: (self: *MTL4MeshRenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, rasterSampleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRasterSampleCount_, rasterSampleCount);
    }

/// Indicates whether to read and use the alpha channel fragment output of color attachments to compute a sample coverage mask.
    alphaToCoverageState :: (self: *MTL4MeshRenderPipelineDescriptor) -> MTL4AlphaToCoverageState {
        func: #type (obj: *void, selector: *void) -> MTL4AlphaToCoverageState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.alphaToCoverageState);
    }

    setAlphaToCoverageState_ :: (self: *MTL4MeshRenderPipelineDescriptor, alphaToCoverageState: MTL4AlphaToCoverageState) -> void {
        func: #type (obj: *void, selector: *void, alphaToCoverageState: MTL4AlphaToCoverageState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAlphaToCoverageState_, alphaToCoverageState);
    }

/// Indicates whether the pipeline forces alpha channel values of color attachments to the largest representable value.
    alphaToOneState :: (self: *MTL4MeshRenderPipelineDescriptor) -> MTL4AlphaToOneState {
        func: #type (obj: *void, selector: *void) -> MTL4AlphaToOneState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.alphaToOneState);
    }

    setAlphaToOneState_ :: (self: *MTL4MeshRenderPipelineDescriptor, alphaToOneState: MTL4AlphaToOneState) -> void {
        func: #type (obj: *void, selector: *void, alphaToOneState: MTL4AlphaToOneState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAlphaToOneState_, alphaToOneState);
    }

    isRasterizationEnabled :: (self: *MTL4MeshRenderPipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isRasterizationEnabled);
    }

    setRasterizationEnabled_ :: (self: *MTL4MeshRenderPipelineDescriptor, rasterizationEnabled: BOOL) -> void {
        func: #type (obj: *void, selector: *void, rasterizationEnabled: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRasterizationEnabled_, rasterizationEnabled);
    }

/// Determines the maximum value that can you can pass as the pipeline's amplification count.
///
/// This property controls the maximum count you pass to ``MTL4RenderCommandEncoder/setVertexAmplificationCount:viewMappings:``
/// when using vertex amplification with this pipeline.
    maxVertexAmplificationCount :: (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxVertexAmplificationCount);
    }

    setMaxVertexAmplificationCount_ :: (self: *MTL4MeshRenderPipelineDescriptor, maxVertexAmplificationCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxVertexAmplificationCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxVertexAmplificationCount_, maxVertexAmplificationCount);
    }

/// Accesses an array containing descriptions of the color attachments this pipeline writes to.
    colorAttachments :: (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4RenderPipelineColorAttachmentDescriptorArray {
        func: #type (obj: *void, selector: *void) -> *MTL4RenderPipelineColorAttachmentDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.colorAttachments);
    }

/// Provides static linking information for the object stage of the render pipeline.
///
/// Use this property to link extra shader functions to the object stage of the render pipeline.
    objectStaticLinkingDescriptor :: (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTL4StaticLinkingDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectStaticLinkingDescriptor);
    }

    setObjectStaticLinkingDescriptor_ :: (self: *MTL4MeshRenderPipelineDescriptor, objectStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void {
        func: #type (obj: *void, selector: *void, objectStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectStaticLinkingDescriptor_, objectStaticLinkingDescriptor);
    }

/// Provides static linking information for the mesh stage of the render pipeline.
///
/// Use this property to link extra shader functions to the mesh stage of the render pipeline.
    meshStaticLinkingDescriptor :: (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTL4StaticLinkingDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.meshStaticLinkingDescriptor);
    }

    setMeshStaticLinkingDescriptor_ :: (self: *MTL4MeshRenderPipelineDescriptor, meshStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void {
        func: #type (obj: *void, selector: *void, meshStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshStaticLinkingDescriptor_, meshStaticLinkingDescriptor);
    }

/// Provides static linking information for the fragment stage of the render pipeline.
///
/// Use this property to link extra shader functions to the fragment stage of the render pipeline.
    fragmentStaticLinkingDescriptor :: (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTL4StaticLinkingDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentStaticLinkingDescriptor);
    }

    setFragmentStaticLinkingDescriptor_ :: (self: *MTL4MeshRenderPipelineDescriptor, fragmentStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void {
        func: #type (obj: *void, selector: *void, fragmentStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentStaticLinkingDescriptor_, fragmentStaticLinkingDescriptor);
    }

/// Indicates whether you can use the render pipeline to create new pipelines by adding binary functions to the object
/// shader function’s callable functions list.
    supportObjectBinaryLinking :: (self: *MTL4MeshRenderPipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportObjectBinaryLinking);
    }

    setSupportObjectBinaryLinking_ :: (self: *MTL4MeshRenderPipelineDescriptor, supportObjectBinaryLinking: BOOL) -> void {
        func: #type (obj: *void, selector: *void, supportObjectBinaryLinking: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportObjectBinaryLinking_, supportObjectBinaryLinking);
    }

/// Indicates whether you can use the render pipeline to create new pipelines by adding binary functions to the mesh
/// shader function’s callable functions list.
    supportMeshBinaryLinking :: (self: *MTL4MeshRenderPipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportMeshBinaryLinking);
    }

    setSupportMeshBinaryLinking_ :: (self: *MTL4MeshRenderPipelineDescriptor, supportMeshBinaryLinking: BOOL) -> void {
        func: #type (obj: *void, selector: *void, supportMeshBinaryLinking: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportMeshBinaryLinking_, supportMeshBinaryLinking);
    }

/// Indicates whether you can use the render pipeline to create new pipelines by adding binary functions to the fragment
/// shader function’s callable functions list.
    supportFragmentBinaryLinking :: (self: *MTL4MeshRenderPipelineDescriptor) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportFragmentBinaryLinking);
    }

    setSupportFragmentBinaryLinking_ :: (self: *MTL4MeshRenderPipelineDescriptor, supportFragmentBinaryLinking: BOOL) -> void {
        func: #type (obj: *void, selector: *void, supportFragmentBinaryLinking: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportFragmentBinaryLinking_, supportFragmentBinaryLinking);
    }

/// Sets the logical-to-physical rendering remap state.
///
/// Use this property to assign how a ``MTL4RenderCommandEncoder`` instance maps the output of your fragment shader to
/// physical color attachments.
    colorAttachmentMappingState :: (self: *MTL4MeshRenderPipelineDescriptor) -> MTL4LogicalToPhysicalColorAttachmentMappingState {
        func: #type (obj: *void, selector: *void) -> MTL4LogicalToPhysicalColorAttachmentMappingState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.colorAttachmentMappingState);
    }

    setColorAttachmentMappingState_ :: (self: *MTL4MeshRenderPipelineDescriptor, colorAttachmentMappingState: MTL4LogicalToPhysicalColorAttachmentMappingState) -> void {
        func: #type (obj: *void, selector: *void, colorAttachmentMappingState: MTL4LogicalToPhysicalColorAttachmentMappingState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setColorAttachmentMappingState_, colorAttachmentMappingState);
    }

/// Indicates whether the pipeline supports indirect command buffers.
    supportIndirectCommandBuffers :: (self: *MTL4MeshRenderPipelineDescriptor) -> MTL4IndirectCommandBufferSupportState {
        func: #type (obj: *void, selector: *void) -> MTL4IndirectCommandBufferSupportState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportIndirectCommandBuffers);
    }

    setSupportIndirectCommandBuffers_ :: (self: *MTL4MeshRenderPipelineDescriptor, supportIndirectCommandBuffers: MTL4IndirectCommandBufferSupportState) -> void {
        func: #type (obj: *void, selector: *void, supportIndirectCommandBuffers: MTL4IndirectCommandBufferSupportState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportIndirectCommandBuffers_, supportIndirectCommandBuffers);
    }

}

/// Groups together properties to create a pipeline data set serializer.
MTL4PipelineDataSetSerializerDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Specifies the configuration of the serialization process.
///
/// The configuration of the serialization process determines the mechanisms you use to serialize pipeline data sets.
///
/// When this configuration contains ``MTL4PipelineDataSetSerializerConfigurationCaptureDescriptors``, use
/// ``serializeAsPipelinesScriptWithError:`` to serialize pipeline scripts.
///
/// If this option contains ``MTL4PipelineDataSetSerializerConfigurationCaptureBinaries``, the serializer can additionally
/// serialize to a binary archive by calling ``serializeAsArchiveAndFlushToURL:error::``.
    configuration :: (self: *MTL4PipelineDataSetSerializerDescriptor) -> MTL4PipelineDataSetSerializerConfiguration {
        func: #type (obj: *void, selector: *void) -> MTL4PipelineDataSetSerializerConfiguration #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.configuration);
    }

    setConfiguration_ :: (self: *MTL4PipelineDataSetSerializerDescriptor, configuration: MTL4PipelineDataSetSerializerConfiguration) -> void {
        func: #type (obj: *void, selector: *void, configuration: MTL4PipelineDataSetSerializerConfiguration) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setConfiguration_, configuration);
    }

}

/// Base interface for other function-derived interfaces.
MTL4BinaryFunctionDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Associates a string that uniquely identifies a binary function.
///
/// You can use this property to look up a corresponding binary function by name in a ``MTL4Archive`` instance.
    name :: (self: *MTL4BinaryFunctionDescriptor) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

    setName_ :: (self: *MTL4BinaryFunctionDescriptor, name: *NSString) -> void {
        func: #type (obj: *void, selector: *void, name: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setName_, name);
    }

/// Provides the function descriptor corresponding to the function to compile into a binary function.
    functionDescriptor :: (self: *MTL4BinaryFunctionDescriptor) -> *MTL4FunctionDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTL4FunctionDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionDescriptor);
    }

    setFunctionDescriptor_ :: (self: *MTL4BinaryFunctionDescriptor, functionDescriptor: *MTL4FunctionDescriptor) -> void {
        func: #type (obj: *void, selector: *void, functionDescriptor: *MTL4FunctionDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFunctionDescriptor_, functionDescriptor);
    }

/// Configure the options to use at binary function creation time.
    options :: (self: *MTL4BinaryFunctionDescriptor) -> MTL4BinaryFunctionOptions {
        func: #type (obj: *void, selector: *void) -> MTL4BinaryFunctionOptions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.options);
    }

    setOptions_ :: (self: *MTL4BinaryFunctionDescriptor, options: MTL4BinaryFunctionOptions) -> void {
        func: #type (obj: *void, selector: *void, options: MTL4BinaryFunctionOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOptions_, options);
    }

}

/// Groups together properties to drive a static linking process.
MTL4StaticLinkingDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Provides an array of functions to link at the Metal IR level.
    functionDescriptors :: (self: *MTL4StaticLinkingDescriptor) -> *NSArray(*MTL4FunctionDescriptor) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTL4FunctionDescriptor) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionDescriptors);
    }

    setFunctionDescriptors_ :: (self: *MTL4StaticLinkingDescriptor, functionDescriptors: *NSArray(*MTL4FunctionDescriptor)) -> void {
        func: #type (obj: *void, selector: *void, functionDescriptors: *NSArray(*MTL4FunctionDescriptor)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFunctionDescriptors_, functionDescriptors);
    }

/// Provides an array of private functions to link at the Metal IR level.
///
/// You specify private functions to link separately from ``functionDescriptors`` because pipelines don't export private functions as ``MTLFunctionHandle`` instances.
/// - Note: You can link private functions even when your ``MTLDevice`` doesn't support function pointers.
    privateFunctionDescriptors :: (self: *MTL4StaticLinkingDescriptor) -> *NSArray(*MTL4FunctionDescriptor) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTL4FunctionDescriptor) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.privateFunctionDescriptors);
    }

    setPrivateFunctionDescriptors_ :: (self: *MTL4StaticLinkingDescriptor, privateFunctionDescriptors: *NSArray(*MTL4FunctionDescriptor)) -> void {
        func: #type (obj: *void, selector: *void, privateFunctionDescriptors: *NSArray(*MTL4FunctionDescriptor)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPrivateFunctionDescriptors_, privateFunctionDescriptors);
    }

/// Assigns groups of functions to match call-site attributes in shader code.
///
/// Function groups help the compiler reduce the number of candidate functions it needs to evaluate for shader function calls, potentially increasing runtime performance.
    groups :: (self: *MTL4StaticLinkingDescriptor) -> *NSDictionary(*NSString, *NSArray(*MTL4FunctionDescriptor)) {
        func: #type (obj: *void, selector: *void) -> *NSDictionary(*NSString, *NSArray(*MTL4FunctionDescriptor)) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.groups);
    }

    setGroups_ :: (self: *MTL4StaticLinkingDescriptor, groups: *NSDictionary(*NSString, *NSArray(*MTL4FunctionDescriptor))) -> void {
        func: #type (obj: *void, selector: *void, groups: *NSDictionary(*NSString, *NSArray(*MTL4FunctionDescriptor))) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setGroups_, groups);
    }

}

/// Groups together properties to drive the dynamic linking process of a pipeline stage.
MTL4PipelineStageDynamicLinkingDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Limits the maximum depth of the call stack for indirect function calls in the pipeline stage function.
    maxCallStackDepth :: (self: *MTL4PipelineStageDynamicLinkingDescriptor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxCallStackDepth);
    }

    setMaxCallStackDepth_ :: (self: *MTL4PipelineStageDynamicLinkingDescriptor, maxCallStackDepth: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maxCallStackDepth: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxCallStackDepth_, maxCallStackDepth);
    }

/// Provides the array of binary functions to link.
///
/// Binary functions are shader functions that you compile from Metal IR to machine code ahead of time
/// using instances of ``MTL4Compiler``.
    binaryLinkedFunctions :: (self: *MTL4PipelineStageDynamicLinkingDescriptor) -> *NSArray(*MTL4BinaryFunction) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTL4BinaryFunction) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.binaryLinkedFunctions);
    }

    setBinaryLinkedFunctions_ :: (self: *MTL4PipelineStageDynamicLinkingDescriptor, binaryLinkedFunctions: *NSArray(*MTL4BinaryFunction)) -> void {
        func: #type (obj: *void, selector: *void, binaryLinkedFunctions: *NSArray(*MTL4BinaryFunction)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBinaryLinkedFunctions_, binaryLinkedFunctions);
    }

/// Provides an array of dynamic libraries the compiler loads when it builds the pipeline.
    preloadedLibraries :: (self: *MTL4PipelineStageDynamicLinkingDescriptor) -> *NSArray(*MTLDynamicLibrary) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLDynamicLibrary) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.preloadedLibraries);
    }

    setPreloadedLibraries_ :: (self: *MTL4PipelineStageDynamicLinkingDescriptor, preloadedLibraries: *NSArray(*MTLDynamicLibrary)) -> void {
        func: #type (obj: *void, selector: *void, preloadedLibraries: *NSArray(*MTLDynamicLibrary)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPreloadedLibraries_, preloadedLibraries);
    }

}

/// Groups together properties that provide linking properties for render pipelines.
MTL4RenderPipelineDynamicLinkingDescriptor :: struct #type_info_none {
    nsobject: *NSObject;
/// Controls properties for linking the vertex stage of the render pipeline.
    vertexLinkingDescriptor :: (self: *MTL4RenderPipelineDynamicLinkingDescriptor) -> *MTL4PipelineStageDynamicLinkingDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTL4PipelineStageDynamicLinkingDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexLinkingDescriptor);
    }

/// Controls properties for linking the fragment stage of the render pipeline.
    fragmentLinkingDescriptor :: (self: *MTL4RenderPipelineDynamicLinkingDescriptor) -> *MTL4PipelineStageDynamicLinkingDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTL4PipelineStageDynamicLinkingDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentLinkingDescriptor);
    }

/// Controls properties for linking the tile stage of the render pipeline.
    tileLinkingDescriptor :: (self: *MTL4RenderPipelineDynamicLinkingDescriptor) -> *MTL4PipelineStageDynamicLinkingDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTL4PipelineStageDynamicLinkingDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileLinkingDescriptor);
    }

/// Controls properties for link the object stage of the render pipeline.
    objectLinkingDescriptor :: (self: *MTL4RenderPipelineDynamicLinkingDescriptor) -> *MTL4PipelineStageDynamicLinkingDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTL4PipelineStageDynamicLinkingDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectLinkingDescriptor);
    }

/// Controls properties for linking the mesh stage of the render pipeline.
    meshLinkingDescriptor :: (self: *MTL4RenderPipelineDynamicLinkingDescriptor) -> *MTL4PipelineStageDynamicLinkingDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTL4PipelineStageDynamicLinkingDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.meshLinkingDescriptor);
    }

}

CAMetalLayer :: struct #type_info_none {
    nsobject: *NSObject;
/* Get the swap queue's next available drawable. Always blocks until a drawable
 * is available. Can return nil under the following conditions:
 *     1) The layer has an invalid combination of drawable properties.
 *     2) All drawables in the swap queue are in-use and the 1 second timeout
 *        has elapsed. (except when `allowsNextDrawableTimeout' is set to NO)
 *     3) Process is out of memory. */
    nextDrawable :: (self: *CAMetalLayer) -> *CAMetalDrawable {
        func: #type (obj: *void, selector: *void) -> *CAMetalDrawable #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.nextDrawable);
    }

/* This property determines which MTLDevice the MTLTexture objects for
 * the drawables will be created from.
 * On iOS this defaults to MTLCreateSystemDefaultDevice().
 * On macOS this defaults to nil and must be set explicitly before asking for
 * the first drawable. */
    device :: (self: *CAMetalLayer) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

    setDevice_ :: (self: *CAMetalLayer, device: *MTLDevice) -> void {
        func: #type (obj: *void, selector: *void, device: *MTLDevice) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDevice_, device);
    }

/* This property returns the preferred MTLDevice for this CAMetalLayer. */
    preferredDevice :: (self: *CAMetalLayer) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.preferredDevice);
    }

/* This property controls the pixel format of the MTLTexture objects.
 * The two supported values are MTLPixelFormatBGRA8Unorm and
 * MTLPixelFormatBGRA8Unorm_sRGB. */
    pixelFormat :: (self: *CAMetalLayer) -> MTLPixelFormat {
        func: #type (obj: *void, selector: *void) -> MTLPixelFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pixelFormat);
    }

    setPixelFormat_ :: (self: *CAMetalLayer, pixelFormat: MTLPixelFormat) -> void {
        func: #type (obj: *void, selector: *void, pixelFormat: MTLPixelFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPixelFormat_, pixelFormat);
    }

/* This property controls whether or not the returned drawables'
 * MTLTextures may only be used for framebuffer attachments (YES) or
 * whether they may also be used for texture sampling and pixel
 * read/write operations (NO). A value of YES allows CAMetalLayer to
 * allocate the MTLTexture objects in ways that are optimized for display
 * purposes that makes them unsuitable for sampling. The recommended
 * value for most applications is YES. */
    framebufferOnly :: (self: *CAMetalLayer) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.framebufferOnly);
    }

    setFramebufferOnly_ :: (self: *CAMetalLayer, framebufferOnly: BOOL) -> void {
        func: #type (obj: *void, selector: *void, framebufferOnly: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFramebufferOnly_, framebufferOnly);
    }

/* This property controls the pixel dimensions of the returned drawable
 * objects. The most typical value will be the layer size multiplied by
 * the layer contentsScale property. */
    drawableSize :: (self: *CAMetalLayer) -> CGSize {
        func: #type (obj: *void, selector: *void) -> CGSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawableSize);
    }

    setDrawableSize_ :: (self: *CAMetalLayer, drawableSize: CGSize) -> void {
        func: #type (obj: *void, selector: *void, drawableSize: CGSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDrawableSize_, drawableSize);
    }

/* Controls the number maximum number of drawables in the swap queue. The
 * default value is 3. Values set outside of range [2, 3] are ignored and an
 * exception will be thrown. */
    maximumDrawableCount :: (self: *CAMetalLayer) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maximumDrawableCount);
    }

    setMaximumDrawableCount_ :: (self: *CAMetalLayer, maximumDrawableCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, maximumDrawableCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaximumDrawableCount_, maximumDrawableCount);
    }

/* When false (the default value) changes to the layer's render buffer
 * appear on-screen asynchronously to normal layer updates. When true,
 * changes to the MTL content are sent to the screen via the standard
 * CATransaction mechanisms. */
    presentsWithTransaction :: (self: *CAMetalLayer) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.presentsWithTransaction);
    }

    setPresentsWithTransaction_ :: (self: *CAMetalLayer, presentsWithTransaction: BOOL) -> void {
        func: #type (obj: *void, selector: *void, presentsWithTransaction: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPresentsWithTransaction_, presentsWithTransaction);
    }

/* The colorspace of the rendered frames. If nil, no colormatching occurs.
 * If non-nil, the rendered content will be colormatched to the colorspace of
 * the context containing this layer (typically the display's colorspace). */
    colorspace :: (self: *CAMetalLayer) -> CGColorSpaceRef {
        func: #type (obj: *void, selector: *void) -> CGColorSpaceRef #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.colorspace);
    }

    setColorspace_ :: (self: *CAMetalLayer, colorspace: CGColorSpaceRef) -> void {
        func: #type (obj: *void, selector: *void, colorspace: CGColorSpaceRef) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setColorspace_, colorspace);
    }

/* If any rendering context on the screen has this enabled, all content will be
 * clamped to its NSScreen’s maximumExtendedDynamicRangeColorComponentValue
 * rather than 1.0. The default is NO.  */
    wantsExtendedDynamicRangeContent :: (self: *CAMetalLayer) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.wantsExtendedDynamicRangeContent);
    }

    setWantsExtendedDynamicRangeContent_ :: (self: *CAMetalLayer, wantsExtendedDynamicRangeContent: BOOL) -> void {
        func: #type (obj: *void, selector: *void, wantsExtendedDynamicRangeContent: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setWantsExtendedDynamicRangeContent_, wantsExtendedDynamicRangeContent);
    }

/* Metadata describing extended dynamic range content in the layer's drawable.
 * Must be set before calling nextDrawable. If non-nil, content may be
 * tone mapped to match the current display characteristics. If nil, samples
 * will be rendered without tone mapping and values above the maximum EDR value
 * -[NSScreen maximumExtendedDynamicRangeColorComponentValue] may be clamped.
 * Defaults to nil. */
    EDRMetadata :: (self: *CAMetalLayer) -> *CAEDRMetadata {
        func: #type (obj: *void, selector: *void) -> *CAEDRMetadata #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.EDRMetadata);
    }

    setEDRMetadata_ :: (self: *CAMetalLayer, EDRMetadata: *CAEDRMetadata) -> void {
        func: #type (obj: *void, selector: *void, EDRMetadata: *CAEDRMetadata) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setEDRMetadata_, EDRMetadata);
    }

/* This property controls if this layer and its drawables will be synchronized
 * to the display's Vsync. The default value is YES. */
    displaySyncEnabled :: (self: *CAMetalLayer) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.displaySyncEnabled);
    }

    setDisplaySyncEnabled_ :: (self: *CAMetalLayer, displaySyncEnabled: BOOL) -> void {
        func: #type (obj: *void, selector: *void, displaySyncEnabled: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDisplaySyncEnabled_, displaySyncEnabled);
    }

/* Controls if `-nextDrawable' is allowed to timeout after 1 second and return
 * nil if * the system does not have a free drawable available. The default
 * value is YES. If set to NO, then `-nextDrawable' will block forever until a
 * free drawable is available. */
    allowsNextDrawableTimeout :: (self: *CAMetalLayer) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.allowsNextDrawableTimeout);
    }

    setAllowsNextDrawableTimeout_ :: (self: *CAMetalLayer, allowsNextDrawableTimeout: BOOL) -> void {
        func: #type (obj: *void, selector: *void, allowsNextDrawableTimeout: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAllowsNextDrawableTimeout_, allowsNextDrawableTimeout);
    }

/* When non-nil, controls the options of developer HUD. Defaults to nil. */
    developerHUDProperties :: (self: *CAMetalLayer) -> *NSDictionary {
        func: #type (obj: *void, selector: *void) -> *NSDictionary #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.developerHUDProperties);
    }

    setDeveloperHUDProperties_ :: (self: *CAMetalLayer, developerHUDProperties: *NSDictionary) -> void {
        func: #type (obj: *void, selector: *void, developerHUDProperties: *NSDictionary) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDeveloperHUDProperties_, developerHUDProperties);
    }

/* Metal residency set containing resources for presenting layer's drawables
 *
 * Applications should use this residency set to ensure all Metal resources
 * needed to render into or present drawables are resident before use. The
 * residency set will be updated automatically to always track the latest
 * resources. When the `device` property is changed, the previous residency
 * set will be invalidated and the application must request a new instance.
 * Applications must not make any modifications to this residency set. The
 * residency set will not be available if the device propery is nil, or if 
 * it does not support residency sets. */
    residencySet :: (self: *CAMetalLayer) -> *MTLResidencySet {
        func: #type (obj: *void, selector: *void) -> *MTLResidencySet #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.residencySet);
    }

}

