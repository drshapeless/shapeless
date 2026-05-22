MTLTensorExtents :: struct {
    initWithRank_values_ :: (self: *MTLTensorExtents, rank: NSUInteger, values: *const NSInteger) -> *MTLTensorExtents {
        func :: #type (obj: *void, selector: *void, rank: NSUInteger, values: *const NSInteger) -> instancetype #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.initWithRank_values_, rank, values);
    }

    extentAtDimensionIndex_ :: (self: *MTLTensorExtents, dimensionIndex: NSUInteger) -> NSInteger {
        func :: #type (obj: *void, selector: *void, dimensionIndex: NSUInteger) -> NSInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.extentAtDimensionIndex_, dimensionIndex);
    }

    rank :: (self: *MTLTensorExtents) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.rank);
    }

}

MTLTensorDescriptor :: struct {
    dimensions :: (self: *MTLTensorDescriptor) -> *MTLTensorExtents {
        func :: #type (obj: *void, selector: *void) -> *MTLTensorExtents #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dimensions);
    }

    setDimensions_ :: (self: *MTLTensorDescriptor, dimensions: *MTLTensorExtents) -> void {
        func :: #type (obj: *void, selector: *void, dimensions: *MTLTensorExtents) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDimensions_, dimensions);
    }

    strides :: (self: *MTLTensorDescriptor) -> *MTLTensorExtents {
        func :: #type (obj: *void, selector: *void) -> *MTLTensorExtents #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.strides);
    }

    setStrides_ :: (self: *MTLTensorDescriptor, strides: *MTLTensorExtents) -> void {
        func :: #type (obj: *void, selector: *void, strides: *MTLTensorExtents) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStrides_, strides);
    }

    dataType :: (self: *MTLTensorDescriptor) -> MTLTensorDataType {
        func :: #type (obj: *void, selector: *void) -> MTLTensorDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dataType);
    }

    setDataType_ :: (self: *MTLTensorDescriptor, dataType: MTLTensorDataType) -> void {
        func :: #type (obj: *void, selector: *void, dataType: MTLTensorDataType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDataType_, dataType);
    }

    usage :: (self: *MTLTensorDescriptor) -> MTLTensorUsage {
        func :: #type (obj: *void, selector: *void) -> MTLTensorUsage #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.usage);
    }

    setUsage_ :: (self: *MTLTensorDescriptor, usage: MTLTensorUsage) -> void {
        func :: #type (obj: *void, selector: *void, usage: MTLTensorUsage) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setUsage_, usage);
    }

    resourceOptions :: (self: *MTLTensorDescriptor) -> MTLResourceOptions {
        func :: #type (obj: *void, selector: *void) -> MTLResourceOptions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resourceOptions);
    }

    setResourceOptions_ :: (self: *MTLTensorDescriptor, resourceOptions: MTLResourceOptions) -> void {
        func :: #type (obj: *void, selector: *void, resourceOptions: MTLResourceOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setResourceOptions_, resourceOptions);
    }

    cpuCacheMode :: (self: *MTLTensorDescriptor) -> MTLCPUCacheMode {
        func :: #type (obj: *void, selector: *void) -> MTLCPUCacheMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.cpuCacheMode);
    }

    setCpuCacheMode_ :: (self: *MTLTensorDescriptor, cpuCacheMode: MTLCPUCacheMode) -> void {
        func :: #type (obj: *void, selector: *void, cpuCacheMode: MTLCPUCacheMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCpuCacheMode_, cpuCacheMode);
    }

    storageMode :: (self: *MTLTensorDescriptor) -> MTLStorageMode {
        func :: #type (obj: *void, selector: *void) -> MTLStorageMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.storageMode);
    }

    setStorageMode_ :: (self: *MTLTensorDescriptor, storageMode: MTLStorageMode) -> void {
        func :: #type (obj: *void, selector: *void, storageMode: MTLStorageMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStorageMode_, storageMode);
    }

    hazardTrackingMode :: (self: *MTLTensorDescriptor) -> MTLHazardTrackingMode {
        func :: #type (obj: *void, selector: *void) -> MTLHazardTrackingMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.hazardTrackingMode);
    }

    setHazardTrackingMode_ :: (self: *MTLTensorDescriptor, hazardTrackingMode: MTLHazardTrackingMode) -> void {
        func :: #type (obj: *void, selector: *void, hazardTrackingMode: MTLHazardTrackingMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setHazardTrackingMode_, hazardTrackingMode);
    }

}

MTLSharedTextureHandle :: struct {
    device :: (self: *MTLSharedTextureHandle) -> *MTLDevice {
        func :: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

    label :: (self: *MTLSharedTextureHandle) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

}

MTLTextureDescriptor :: struct {
    texture2DDescriptorWithPixelFormat_width_height_mipmapped_ :: (pixelFormat: MTLPixelFormat, width: NSUInteger, height: NSUInteger, mipmapped: BOOL) -> *MTLTextureDescriptor {
        func: #type (obj: *void, selector: *void, pixelFormat: MTLPixelFormat, width: NSUInteger, height: NSUInteger, mipmapped: BOOL) -> *MTLTextureDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLTextureDescriptor", __sel.texture2DDescriptorWithPixelFormat_width_height_mipmapped_, pixelFormat, width, height, mipmapped);
    }

    textureCubeDescriptorWithPixelFormat_size_mipmapped_ :: (pixelFormat: MTLPixelFormat, size: NSUInteger, mipmapped: BOOL) -> *MTLTextureDescriptor {
        func: #type (obj: *void, selector: *void, pixelFormat: MTLPixelFormat, size: NSUInteger, mipmapped: BOOL) -> *MTLTextureDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLTextureDescriptor", __sel.textureCubeDescriptorWithPixelFormat_size_mipmapped_, pixelFormat, size, mipmapped);
    }

    textureBufferDescriptorWithPixelFormat_width_resourceOptions_usage_ :: (pixelFormat: MTLPixelFormat, width: NSUInteger, resourceOptions: MTLResourceOptions, usage: MTLTextureUsage) -> *MTLTextureDescriptor {
        func: #type (obj: *void, selector: *void, pixelFormat: MTLPixelFormat, width: NSUInteger, resourceOptions: MTLResourceOptions, usage: MTLTextureUsage) -> *MTLTextureDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLTextureDescriptor", __sel.textureBufferDescriptorWithPixelFormat_width_resourceOptions_usage_, pixelFormat, width, resourceOptions, usage);
    }

    textureType :: (self: *MTLTextureDescriptor) -> MTLTextureType {
        func :: #type (obj: *void, selector: *void) -> MTLTextureType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.textureType);
    }

    setTextureType_ :: (self: *MTLTextureDescriptor, textureType: MTLTextureType) -> void {
        func :: #type (obj: *void, selector: *void, textureType: MTLTextureType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTextureType_, textureType);
    }

    pixelFormat :: (self: *MTLTextureDescriptor) -> MTLPixelFormat {
        func :: #type (obj: *void, selector: *void) -> MTLPixelFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pixelFormat);
    }

    setPixelFormat_ :: (self: *MTLTextureDescriptor, pixelFormat: MTLPixelFormat) -> void {
        func :: #type (obj: *void, selector: *void, pixelFormat: MTLPixelFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPixelFormat_, pixelFormat);
    }

    width :: (self: *MTLTextureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.width);
    }

    setWidth_ :: (self: *MTLTextureDescriptor, width: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, width: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setWidth_, width);
    }

    height :: (self: *MTLTextureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.height);
    }

    setHeight_ :: (self: *MTLTextureDescriptor, height: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, height: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setHeight_, height);
    }

    depth :: (self: *MTLTextureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.depth);
    }

    setDepth_ :: (self: *MTLTextureDescriptor, depth: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, depth: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepth_, depth);
    }

    mipmapLevelCount :: (self: *MTLTextureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.mipmapLevelCount);
    }

    setMipmapLevelCount_ :: (self: *MTLTextureDescriptor, mipmapLevelCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, mipmapLevelCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMipmapLevelCount_, mipmapLevelCount);
    }

    sampleCount :: (self: *MTLTextureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleCount);
    }

    setSampleCount_ :: (self: *MTLTextureDescriptor, sampleCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, sampleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSampleCount_, sampleCount);
    }

    arrayLength :: (self: *MTLTextureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.arrayLength);
    }

    setArrayLength_ :: (self: *MTLTextureDescriptor, arrayLength: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, arrayLength: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setArrayLength_, arrayLength);
    }

    resourceOptions :: (self: *MTLTextureDescriptor) -> MTLResourceOptions {
        func :: #type (obj: *void, selector: *void) -> MTLResourceOptions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resourceOptions);
    }

    setResourceOptions_ :: (self: *MTLTextureDescriptor, resourceOptions: MTLResourceOptions) -> void {
        func :: #type (obj: *void, selector: *void, resourceOptions: MTLResourceOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setResourceOptions_, resourceOptions);
    }

    cpuCacheMode :: (self: *MTLTextureDescriptor) -> MTLCPUCacheMode {
        func :: #type (obj: *void, selector: *void) -> MTLCPUCacheMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.cpuCacheMode);
    }

    setCpuCacheMode_ :: (self: *MTLTextureDescriptor, cpuCacheMode: MTLCPUCacheMode) -> void {
        func :: #type (obj: *void, selector: *void, cpuCacheMode: MTLCPUCacheMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCpuCacheMode_, cpuCacheMode);
    }

    storageMode :: (self: *MTLTextureDescriptor) -> MTLStorageMode {
        func :: #type (obj: *void, selector: *void) -> MTLStorageMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.storageMode);
    }

    setStorageMode_ :: (self: *MTLTextureDescriptor, storageMode: MTLStorageMode) -> void {
        func :: #type (obj: *void, selector: *void, storageMode: MTLStorageMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStorageMode_, storageMode);
    }

    hazardTrackingMode :: (self: *MTLTextureDescriptor) -> MTLHazardTrackingMode {
        func :: #type (obj: *void, selector: *void) -> MTLHazardTrackingMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.hazardTrackingMode);
    }

    setHazardTrackingMode_ :: (self: *MTLTextureDescriptor, hazardTrackingMode: MTLHazardTrackingMode) -> void {
        func :: #type (obj: *void, selector: *void, hazardTrackingMode: MTLHazardTrackingMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setHazardTrackingMode_, hazardTrackingMode);
    }

    usage :: (self: *MTLTextureDescriptor) -> MTLTextureUsage {
        func :: #type (obj: *void, selector: *void) -> MTLTextureUsage #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.usage);
    }

    setUsage_ :: (self: *MTLTextureDescriptor, usage: MTLTextureUsage) -> void {
        func :: #type (obj: *void, selector: *void, usage: MTLTextureUsage) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setUsage_, usage);
    }

    allowGPUOptimizedContents :: (self: *MTLTextureDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.allowGPUOptimizedContents);
    }

    setAllowGPUOptimizedContents_ :: (self: *MTLTextureDescriptor, allowGPUOptimizedContents: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, allowGPUOptimizedContents: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAllowGPUOptimizedContents_, allowGPUOptimizedContents);
    }

    compressionType :: (self: *MTLTextureDescriptor) -> MTLTextureCompressionType {
        func :: #type (obj: *void, selector: *void) -> MTLTextureCompressionType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.compressionType);
    }

    setCompressionType_ :: (self: *MTLTextureDescriptor, compressionType: MTLTextureCompressionType) -> void {
        func :: #type (obj: *void, selector: *void, compressionType: MTLTextureCompressionType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCompressionType_, compressionType);
    }

    swizzle :: (self: *MTLTextureDescriptor) -> MTLTextureSwizzleChannels {
        func :: #type (obj: *void, selector: *void) -> MTLTextureSwizzleChannels #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.swizzle);
    }

    setSwizzle_ :: (self: *MTLTextureDescriptor, swizzle: MTLTextureSwizzleChannels) -> void {
        func :: #type (obj: *void, selector: *void, swizzle: MTLTextureSwizzleChannels) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSwizzle_, swizzle);
    }

    placementSparsePageSize :: (self: *MTLTextureDescriptor) -> MTLSparsePageSize {
        func :: #type (obj: *void, selector: *void) -> MTLSparsePageSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.placementSparsePageSize);
    }

    setPlacementSparsePageSize_ :: (self: *MTLTextureDescriptor, placementSparsePageSize: MTLSparsePageSize) -> void {
        func :: #type (obj: *void, selector: *void, placementSparsePageSize: MTLSparsePageSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPlacementSparsePageSize_, placementSparsePageSize);
    }

}

MTLTextureViewDescriptor :: struct {
    pixelFormat :: (self: *MTLTextureViewDescriptor) -> MTLPixelFormat {
        func :: #type (obj: *void, selector: *void) -> MTLPixelFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pixelFormat);
    }

    setPixelFormat_ :: (self: *MTLTextureViewDescriptor, pixelFormat: MTLPixelFormat) -> void {
        func :: #type (obj: *void, selector: *void, pixelFormat: MTLPixelFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPixelFormat_, pixelFormat);
    }

    textureType :: (self: *MTLTextureViewDescriptor) -> MTLTextureType {
        func :: #type (obj: *void, selector: *void) -> MTLTextureType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.textureType);
    }

    setTextureType_ :: (self: *MTLTextureViewDescriptor, textureType: MTLTextureType) -> void {
        func :: #type (obj: *void, selector: *void, textureType: MTLTextureType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTextureType_, textureType);
    }

    levelRange :: (self: *MTLTextureViewDescriptor) -> NSRange {
        func :: #type (obj: *void, selector: *void) -> NSRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.levelRange);
    }

    setLevelRange_ :: (self: *MTLTextureViewDescriptor, levelRange: NSRange) -> void {
        func :: #type (obj: *void, selector: *void, levelRange: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLevelRange_, levelRange);
    }

    sliceRange :: (self: *MTLTextureViewDescriptor) -> NSRange {
        func :: #type (obj: *void, selector: *void) -> NSRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sliceRange);
    }

    setSliceRange_ :: (self: *MTLTextureViewDescriptor, sliceRange: NSRange) -> void {
        func :: #type (obj: *void, selector: *void, sliceRange: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSliceRange_, sliceRange);
    }

    swizzle :: (self: *MTLTextureViewDescriptor) -> MTLTextureSwizzleChannels {
        func :: #type (obj: *void, selector: *void) -> MTLTextureSwizzleChannels #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.swizzle);
    }

    setSwizzle_ :: (self: *MTLTextureViewDescriptor, swizzle: MTLTextureSwizzleChannels) -> void {
        func :: #type (obj: *void, selector: *void, swizzle: MTLTextureSwizzleChannels) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSwizzle_, swizzle);
    }

}

MTLType :: struct {
    dataType :: (self: *MTLType) -> MTLDataType {
        func :: #type (obj: *void, selector: *void) -> MTLDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dataType);
    }

}

MTLStructMember :: struct {
    structType :: (self: *MTLStructMember) -> *MTLStructType {
        func :: #type (obj: *void, selector: *void) -> *MTLStructType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.structType);
    }

    arrayType :: (self: *MTLStructMember) -> *MTLArrayType {
        func :: #type (obj: *void, selector: *void) -> *MTLArrayType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.arrayType);
    }

    textureReferenceType :: (self: *MTLStructMember) -> *MTLTextureReferenceType {
        func :: #type (obj: *void, selector: *void) -> *MTLTextureReferenceType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.textureReferenceType);
    }

    pointerType :: (self: *MTLStructMember) -> *MTLPointerType {
        func :: #type (obj: *void, selector: *void) -> *MTLPointerType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pointerType);
    }

    tensorReferenceType :: (self: *MTLStructMember) -> *MTLTensorReferenceType {
        func :: #type (obj: *void, selector: *void) -> *MTLTensorReferenceType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tensorReferenceType);
    }

    name :: (self: *MTLStructMember) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

    offset :: (self: *MTLStructMember) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.offset);
    }

    dataType :: (self: *MTLStructMember) -> MTLDataType {
        func :: #type (obj: *void, selector: *void) -> MTLDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dataType);
    }

    argumentIndex :: (self: *MTLStructMember) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.argumentIndex);
    }

}

MTLStructType :: struct {
    memberByName_ :: (self: *MTLStructType, name: *NSString) -> *MTLStructMember {
        func :: #type (obj: *void, selector: *void, name: *NSString) -> *MTLStructMember #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.memberByName_, name);
    }

    members :: (self: *MTLStructType) -> *NSArray(*MTLStructMember) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLStructMember) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.members);
    }

}

MTLArrayType :: struct {
    elementStructType :: (self: *MTLArrayType) -> *MTLStructType {
        func :: #type (obj: *void, selector: *void) -> *MTLStructType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.elementStructType);
    }

    elementArrayType :: (self: *MTLArrayType) -> *MTLArrayType {
        func :: #type (obj: *void, selector: *void) -> *MTLArrayType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.elementArrayType);
    }

    elementTextureReferenceType :: (self: *MTLArrayType) -> *MTLTextureReferenceType {
        func :: #type (obj: *void, selector: *void) -> *MTLTextureReferenceType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.elementTextureReferenceType);
    }

    elementPointerType :: (self: *MTLArrayType) -> *MTLPointerType {
        func :: #type (obj: *void, selector: *void) -> *MTLPointerType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.elementPointerType);
    }

    elementTensorReferenceType :: (self: *MTLArrayType) -> *MTLTensorReferenceType {
        func :: #type (obj: *void, selector: *void) -> *MTLTensorReferenceType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.elementTensorReferenceType);
    }

    elementType :: (self: *MTLArrayType) -> MTLDataType {
        func :: #type (obj: *void, selector: *void) -> MTLDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.elementType);
    }

    arrayLength :: (self: *MTLArrayType) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.arrayLength);
    }

    stride :: (self: *MTLArrayType) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stride);
    }

    argumentIndexStride :: (self: *MTLArrayType) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.argumentIndexStride);
    }

}

MTLPointerType :: struct {
    elementStructType :: (self: *MTLPointerType) -> *MTLStructType {
        func :: #type (obj: *void, selector: *void) -> *MTLStructType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.elementStructType);
    }

    elementArrayType :: (self: *MTLPointerType) -> *MTLArrayType {
        func :: #type (obj: *void, selector: *void) -> *MTLArrayType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.elementArrayType);
    }

    elementType :: (self: *MTLPointerType) -> MTLDataType {
        func :: #type (obj: *void, selector: *void) -> MTLDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.elementType);
    }

    access :: (self: *MTLPointerType) -> MTLBindingAccess {
        func :: #type (obj: *void, selector: *void) -> MTLBindingAccess #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.access);
    }

    alignment :: (self: *MTLPointerType) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.alignment);
    }

    dataSize :: (self: *MTLPointerType) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dataSize);
    }

    elementIsArgumentBuffer :: (self: *MTLPointerType) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.elementIsArgumentBuffer);
    }

}

MTLTextureReferenceType :: struct {
    textureDataType :: (self: *MTLTextureReferenceType) -> MTLDataType {
        func :: #type (obj: *void, selector: *void) -> MTLDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.textureDataType);
    }

    textureType :: (self: *MTLTextureReferenceType) -> MTLTextureType {
        func :: #type (obj: *void, selector: *void) -> MTLTextureType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.textureType);
    }

    access :: (self: *MTLTextureReferenceType) -> MTLBindingAccess {
        func :: #type (obj: *void, selector: *void) -> MTLBindingAccess #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.access);
    }

    isDepthTexture :: (self: *MTLTextureReferenceType) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isDepthTexture);
    }

}

MTLTensorReferenceType :: struct {
    tensorDataType :: (self: *MTLTensorReferenceType) -> MTLTensorDataType {
        func :: #type (obj: *void, selector: *void) -> MTLTensorDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tensorDataType);
    }

    indexType :: (self: *MTLTensorReferenceType) -> MTLDataType {
        func :: #type (obj: *void, selector: *void) -> MTLDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexType);
    }

    dimensions :: (self: *MTLTensorReferenceType) -> *MTLTensorExtents {
        func :: #type (obj: *void, selector: *void) -> *MTLTensorExtents #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dimensions);
    }

    access :: (self: *MTLTensorReferenceType) -> MTLBindingAccess {
        func :: #type (obj: *void, selector: *void) -> MTLBindingAccess #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.access);
    }

}

MTLArgument :: struct {
    name :: (self: *MTLArgument) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

    type :: (self: *MTLArgument) -> MTLArgumentType {
        func :: #type (obj: *void, selector: *void) -> MTLArgumentType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.type);
    }

    access :: (self: *MTLArgument) -> MTLBindingAccess {
        func :: #type (obj: *void, selector: *void) -> MTLBindingAccess #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.access);
    }

    index :: (self: *MTLArgument) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.index);
    }

    isActive :: (self: *MTLArgument) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isActive);
    }

    bufferAlignment :: (self: *MTLArgument) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bufferAlignment);
    }

    bufferDataSize :: (self: *MTLArgument) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bufferDataSize);
    }

    bufferDataType :: (self: *MTLArgument) -> MTLDataType {
        func :: #type (obj: *void, selector: *void) -> MTLDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bufferDataType);
    }

    bufferStructType :: (self: *MTLArgument) -> *MTLStructType {
        func :: #type (obj: *void, selector: *void) -> *MTLStructType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bufferStructType);
    }

    bufferPointerType :: (self: *MTLArgument) -> *MTLPointerType {
        func :: #type (obj: *void, selector: *void) -> *MTLPointerType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bufferPointerType);
    }

    threadgroupMemoryAlignment :: (self: *MTLArgument) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.threadgroupMemoryAlignment);
    }

    threadgroupMemoryDataSize :: (self: *MTLArgument) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.threadgroupMemoryDataSize);
    }

    textureType :: (self: *MTLArgument) -> MTLTextureType {
        func :: #type (obj: *void, selector: *void) -> MTLTextureType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.textureType);
    }

    textureDataType :: (self: *MTLArgument) -> MTLDataType {
        func :: #type (obj: *void, selector: *void) -> MTLDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.textureDataType);
    }

    isDepthTexture :: (self: *MTLArgument) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isDepthTexture);
    }

    arrayLength :: (self: *MTLArgument) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.arrayLength);
    }

}

MTLFunctionConstantValues :: struct {
    setConstantValue_type_atIndex_ :: (self: *MTLFunctionConstantValues, value: *void, type: MTLDataType, index: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, value: *void, type: MTLDataType, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setConstantValue_type_atIndex_, value, type, index);
    }

    setConstantValues_type_withRange_ :: (self: *MTLFunctionConstantValues, values: *void, type: MTLDataType, range: NSRange) -> void {
        func :: #type (obj: *void, selector: *void, values: *void, type: MTLDataType, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setConstantValues_type_withRange_, values, type, range);
    }

    setConstantValue_type_withName_ :: (self: *MTLFunctionConstantValues, value: *void, type: MTLDataType, name: *NSString) -> void {
        func :: #type (obj: *void, selector: *void, value: *void, type: MTLDataType, name: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setConstantValue_type_withName_, value, type, name);
    }

    reset :: (self: *MTLFunctionConstantValues) -> void {
        func :: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

}

MTLFunctionDescriptor :: struct {
    functionDescriptor :: () -> *MTLFunctionDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLFunctionDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLFunctionDescriptor", __sel.functionDescriptor);
    }

    name :: (self: *MTLFunctionDescriptor) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

    setName_ :: (self: *MTLFunctionDescriptor, name: *NSString) -> void {
        func :: #type (obj: *void, selector: *void, name: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setName_, name);
    }

    specializedName :: (self: *MTLFunctionDescriptor) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.specializedName);
    }

    setSpecializedName_ :: (self: *MTLFunctionDescriptor, specializedName: *NSString) -> void {
        func :: #type (obj: *void, selector: *void, specializedName: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSpecializedName_, specializedName);
    }

    constantValues :: (self: *MTLFunctionDescriptor) -> *MTLFunctionConstantValues {
        func :: #type (obj: *void, selector: *void) -> *MTLFunctionConstantValues #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.constantValues);
    }

    setConstantValues_ :: (self: *MTLFunctionDescriptor, constantValues: *MTLFunctionConstantValues) -> void {
        func :: #type (obj: *void, selector: *void, constantValues: *MTLFunctionConstantValues) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setConstantValues_, constantValues);
    }

    options :: (self: *MTLFunctionDescriptor) -> MTLFunctionOptions {
        func :: #type (obj: *void, selector: *void) -> MTLFunctionOptions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.options);
    }

    setOptions_ :: (self: *MTLFunctionDescriptor, options: MTLFunctionOptions) -> void {
        func :: #type (obj: *void, selector: *void, options: MTLFunctionOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOptions_, options);
    }

    binaryArchives :: (self: *MTLFunctionDescriptor) -> *NSArray(*MTLBinaryArchive) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLBinaryArchive) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.binaryArchives);
    }

    setBinaryArchives_ :: (self: *MTLFunctionDescriptor, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void {
        func :: #type (obj: *void, selector: *void, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBinaryArchives_, binaryArchives);
    }

}

MTLIntersectionFunctionDescriptor :: struct {
}

MTLVertexAttribute :: struct {
    name :: (self: *MTLVertexAttribute) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

    attributeIndex :: (self: *MTLVertexAttribute) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.attributeIndex);
    }

    attributeType :: (self: *MTLVertexAttribute) -> MTLDataType {
        func :: #type (obj: *void, selector: *void) -> MTLDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.attributeType);
    }

    isActive :: (self: *MTLVertexAttribute) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isActive);
    }

    isPatchData :: (self: *MTLVertexAttribute) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isPatchData);
    }

    isPatchControlPointData :: (self: *MTLVertexAttribute) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isPatchControlPointData);
    }

}

MTLAttribute :: struct {
    name :: (self: *MTLAttribute) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

    attributeIndex :: (self: *MTLAttribute) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.attributeIndex);
    }

    attributeType :: (self: *MTLAttribute) -> MTLDataType {
        func :: #type (obj: *void, selector: *void) -> MTLDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.attributeType);
    }

    isActive :: (self: *MTLAttribute) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isActive);
    }

    isPatchData :: (self: *MTLAttribute) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isPatchData);
    }

    isPatchControlPointData :: (self: *MTLAttribute) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isPatchControlPointData);
    }

}

MTLFunctionConstant :: struct {
    name :: (self: *MTLFunctionConstant) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

    type :: (self: *MTLFunctionConstant) -> MTLDataType {
        func :: #type (obj: *void, selector: *void) -> MTLDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.type);
    }

    index :: (self: *MTLFunctionConstant) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.index);
    }

    required :: (self: *MTLFunctionConstant) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.required);
    }

}

MTLCompileOptions :: struct {
    preprocessorMacros :: (self: *MTLCompileOptions) -> *NSDictionary(*NSString, *NSObject) {
        func :: #type (obj: *void, selector: *void) -> *NSDictionary(*NSString, *NSObject) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.preprocessorMacros);
    }

    setPreprocessorMacros_ :: (self: *MTLCompileOptions, preprocessorMacros: *NSDictionary(*NSString, *NSObject)) -> void {
        func :: #type (obj: *void, selector: *void, preprocessorMacros: *NSDictionary(*NSString, *NSObject)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPreprocessorMacros_, preprocessorMacros);
    }

    fastMathEnabled :: (self: *MTLCompileOptions) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fastMathEnabled);
    }

    setFastMathEnabled_ :: (self: *MTLCompileOptions, fastMathEnabled: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, fastMathEnabled: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFastMathEnabled_, fastMathEnabled);
    }

    mathMode :: (self: *MTLCompileOptions) -> MTLMathMode {
        func :: #type (obj: *void, selector: *void) -> MTLMathMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.mathMode);
    }

    setMathMode_ :: (self: *MTLCompileOptions, mathMode: MTLMathMode) -> void {
        func :: #type (obj: *void, selector: *void, mathMode: MTLMathMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMathMode_, mathMode);
    }

    mathFloatingPointFunctions :: (self: *MTLCompileOptions) -> MTLMathFloatingPointFunctions {
        func :: #type (obj: *void, selector: *void) -> MTLMathFloatingPointFunctions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.mathFloatingPointFunctions);
    }

    setMathFloatingPointFunctions_ :: (self: *MTLCompileOptions, mathFloatingPointFunctions: MTLMathFloatingPointFunctions) -> void {
        func :: #type (obj: *void, selector: *void, mathFloatingPointFunctions: MTLMathFloatingPointFunctions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMathFloatingPointFunctions_, mathFloatingPointFunctions);
    }

    languageVersion :: (self: *MTLCompileOptions) -> MTLLanguageVersion {
        func :: #type (obj: *void, selector: *void) -> MTLLanguageVersion #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.languageVersion);
    }

    setLanguageVersion_ :: (self: *MTLCompileOptions, languageVersion: MTLLanguageVersion) -> void {
        func :: #type (obj: *void, selector: *void, languageVersion: MTLLanguageVersion) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLanguageVersion_, languageVersion);
    }

    libraryType :: (self: *MTLCompileOptions) -> MTLLibraryType {
        func :: #type (obj: *void, selector: *void) -> MTLLibraryType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.libraryType);
    }

    setLibraryType_ :: (self: *MTLCompileOptions, libraryType: MTLLibraryType) -> void {
        func :: #type (obj: *void, selector: *void, libraryType: MTLLibraryType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLibraryType_, libraryType);
    }

    installName :: (self: *MTLCompileOptions) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.installName);
    }

    setInstallName_ :: (self: *MTLCompileOptions, installName: *NSString) -> void {
        func :: #type (obj: *void, selector: *void, installName: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstallName_, installName);
    }

    libraries :: (self: *MTLCompileOptions) -> *NSArray(*MTLDynamicLibrary) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLDynamicLibrary) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.libraries);
    }

    setLibraries_ :: (self: *MTLCompileOptions, libraries: *NSArray(*MTLDynamicLibrary)) -> void {
        func :: #type (obj: *void, selector: *void, libraries: *NSArray(*MTLDynamicLibrary)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLibraries_, libraries);
    }

    preserveInvariance :: (self: *MTLCompileOptions) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.preserveInvariance);
    }

    setPreserveInvariance_ :: (self: *MTLCompileOptions, preserveInvariance: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, preserveInvariance: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPreserveInvariance_, preserveInvariance);
    }

    optimizationLevel :: (self: *MTLCompileOptions) -> MTLLibraryOptimizationLevel {
        func :: #type (obj: *void, selector: *void) -> MTLLibraryOptimizationLevel #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.optimizationLevel);
    }

    setOptimizationLevel_ :: (self: *MTLCompileOptions, optimizationLevel: MTLLibraryOptimizationLevel) -> void {
        func :: #type (obj: *void, selector: *void, optimizationLevel: MTLLibraryOptimizationLevel) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOptimizationLevel_, optimizationLevel);
    }

    compileSymbolVisibility :: (self: *MTLCompileOptions) -> MTLCompileSymbolVisibility {
        func :: #type (obj: *void, selector: *void) -> MTLCompileSymbolVisibility #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.compileSymbolVisibility);
    }

    setCompileSymbolVisibility_ :: (self: *MTLCompileOptions, compileSymbolVisibility: MTLCompileSymbolVisibility) -> void {
        func :: #type (obj: *void, selector: *void, compileSymbolVisibility: MTLCompileSymbolVisibility) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCompileSymbolVisibility_, compileSymbolVisibility);
    }

    allowReferencingUndefinedSymbols :: (self: *MTLCompileOptions) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.allowReferencingUndefinedSymbols);
    }

    setAllowReferencingUndefinedSymbols_ :: (self: *MTLCompileOptions, allowReferencingUndefinedSymbols: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, allowReferencingUndefinedSymbols: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAllowReferencingUndefinedSymbols_, allowReferencingUndefinedSymbols);
    }

    maxTotalThreadsPerThreadgroup :: (self: *MTLCompileOptions) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadsPerThreadgroup);
    }

    setMaxTotalThreadsPerThreadgroup_ :: (self: *MTLCompileOptions, maxTotalThreadsPerThreadgroup: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxTotalThreadsPerThreadgroup: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxTotalThreadsPerThreadgroup_, maxTotalThreadsPerThreadgroup);
    }

    requiredThreadsPerThreadgroup :: (self: *MTLCompileOptions) -> MTLSize {
        func :: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.requiredThreadsPerThreadgroup);
    }

    setRequiredThreadsPerThreadgroup_ :: (self: *MTLCompileOptions, requiredThreadsPerThreadgroup: MTLSize) -> void {
        func :: #type (obj: *void, selector: *void, requiredThreadsPerThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRequiredThreadsPerThreadgroup_, requiredThreadsPerThreadgroup);
    }

    enableLogging :: (self: *MTLCompileOptions) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.enableLogging);
    }

    setEnableLogging_ :: (self: *MTLCompileOptions, enableLogging: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, enableLogging: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setEnableLogging_, enableLogging);
    }

}

MTLFunctionReflection :: struct {
    bindings :: (self: *MTLFunctionReflection) -> *NSArray(*MTLBinding) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLBinding) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bindings);
    }

    userAnnotation :: (self: *MTLFunctionReflection) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.userAnnotation);
    }

}

MTLCounterSampleBufferDescriptor :: struct {
    counterSet :: (self: *MTLCounterSampleBufferDescriptor) -> *MTLCounterSet {
        func :: #type (obj: *void, selector: *void) -> *MTLCounterSet #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.counterSet);
    }

    setCounterSet_ :: (self: *MTLCounterSampleBufferDescriptor, counterSet: *MTLCounterSet) -> void {
        func :: #type (obj: *void, selector: *void, counterSet: *MTLCounterSet) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCounterSet_, counterSet);
    }

    label :: (self: *MTLCounterSampleBufferDescriptor) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLCounterSampleBufferDescriptor, label: *NSString) -> void {
        func :: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

    storageMode :: (self: *MTLCounterSampleBufferDescriptor) -> MTLStorageMode {
        func :: #type (obj: *void, selector: *void) -> MTLStorageMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.storageMode);
    }

    setStorageMode_ :: (self: *MTLCounterSampleBufferDescriptor, storageMode: MTLStorageMode) -> void {
        func :: #type (obj: *void, selector: *void, storageMode: MTLStorageMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStorageMode_, storageMode);
    }

    sampleCount :: (self: *MTLCounterSampleBufferDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleCount);
    }

    setSampleCount_ :: (self: *MTLCounterSampleBufferDescriptor, sampleCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, sampleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSampleCount_, sampleCount);
    }

}

MTL4CompilerDescriptor :: struct {
    label :: (self: *MTL4CompilerDescriptor) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTL4CompilerDescriptor, label: *NSString) -> void {
        func :: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

    pipelineDataSetSerializer :: (self: *MTL4CompilerDescriptor) -> *MTL4PipelineDataSetSerializer {
        func :: #type (obj: *void, selector: *void) -> *MTL4PipelineDataSetSerializer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pipelineDataSetSerializer);
    }

    setPipelineDataSetSerializer_ :: (self: *MTL4CompilerDescriptor, pipelineDataSetSerializer: *MTL4PipelineDataSetSerializer) -> void {
        func :: #type (obj: *void, selector: *void, pipelineDataSetSerializer: *MTL4PipelineDataSetSerializer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPipelineDataSetSerializer_, pipelineDataSetSerializer);
    }

}

MTL4CompilerTaskOptions :: struct {
    lookupArchives :: (self: *MTL4CompilerTaskOptions) -> *NSArray(*MTL4Archive) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTL4Archive) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.lookupArchives);
    }

    setLookupArchives_ :: (self: *MTL4CompilerTaskOptions, lookupArchives: *NSArray(*MTL4Archive)) -> void {
        func :: #type (obj: *void, selector: *void, lookupArchives: *NSArray(*MTL4Archive)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLookupArchives_, lookupArchives);
    }

}

MTL4CounterHeapDescriptor :: struct {
    type :: (self: *MTL4CounterHeapDescriptor) -> MTL4CounterHeapType {
        func :: #type (obj: *void, selector: *void) -> MTL4CounterHeapType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.type);
    }

    setType_ :: (self: *MTL4CounterHeapDescriptor, type: MTL4CounterHeapType) -> void {
        func :: #type (obj: *void, selector: *void, type: MTL4CounterHeapType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setType_, type);
    }

    count :: (self: *MTL4CounterHeapDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.count);
    }

    setCount_ :: (self: *MTL4CounterHeapDescriptor, count: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCount_, count);
    }

}

MTLArgumentDescriptor :: struct {
    argumentDescriptor :: () -> *MTLArgumentDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLArgumentDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLArgumentDescriptor", __sel.argumentDescriptor);
    }

    dataType :: (self: *MTLArgumentDescriptor) -> MTLDataType {
        func :: #type (obj: *void, selector: *void) -> MTLDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dataType);
    }

    setDataType_ :: (self: *MTLArgumentDescriptor, dataType: MTLDataType) -> void {
        func :: #type (obj: *void, selector: *void, dataType: MTLDataType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDataType_, dataType);
    }

    index :: (self: *MTLArgumentDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.index);
    }

    setIndex_ :: (self: *MTLArgumentDescriptor, index: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndex_, index);
    }

    arrayLength :: (self: *MTLArgumentDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.arrayLength);
    }

    setArrayLength_ :: (self: *MTLArgumentDescriptor, arrayLength: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, arrayLength: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setArrayLength_, arrayLength);
    }

    access :: (self: *MTLArgumentDescriptor) -> MTLBindingAccess {
        func :: #type (obj: *void, selector: *void) -> MTLBindingAccess #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.access);
    }

    setAccess_ :: (self: *MTLArgumentDescriptor, access: MTLBindingAccess) -> void {
        func :: #type (obj: *void, selector: *void, access: MTLBindingAccess) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAccess_, access);
    }

    textureType :: (self: *MTLArgumentDescriptor) -> MTLTextureType {
        func :: #type (obj: *void, selector: *void) -> MTLTextureType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.textureType);
    }

    setTextureType_ :: (self: *MTLArgumentDescriptor, textureType: MTLTextureType) -> void {
        func :: #type (obj: *void, selector: *void, textureType: MTLTextureType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTextureType_, textureType);
    }

    constantBlockAlignment :: (self: *MTLArgumentDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.constantBlockAlignment);
    }

    setConstantBlockAlignment_ :: (self: *MTLArgumentDescriptor, constantBlockAlignment: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, constantBlockAlignment: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setConstantBlockAlignment_, constantBlockAlignment);
    }

}

MTLArchitecture :: struct {
    name :: (self: *MTLArchitecture) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

}

MTLResourceStatePassSampleBufferAttachmentDescriptor :: struct {
    sampleBuffer :: (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor) -> *MTLCounterSampleBuffer {
        func :: #type (obj: *void, selector: *void) -> *MTLCounterSampleBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleBuffer);
    }

    setSampleBuffer_ :: (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor, sampleBuffer: *MTLCounterSampleBuffer) -> void {
        func :: #type (obj: *void, selector: *void, sampleBuffer: *MTLCounterSampleBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSampleBuffer_, sampleBuffer);
    }

    startOfEncoderSampleIndex :: (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.startOfEncoderSampleIndex);
    }

    setStartOfEncoderSampleIndex_ :: (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor, startOfEncoderSampleIndex: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, startOfEncoderSampleIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStartOfEncoderSampleIndex_, startOfEncoderSampleIndex);
    }

    endOfEncoderSampleIndex :: (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.endOfEncoderSampleIndex);
    }

    setEndOfEncoderSampleIndex_ :: (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor, endOfEncoderSampleIndex: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, endOfEncoderSampleIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setEndOfEncoderSampleIndex_, endOfEncoderSampleIndex);
    }

}

MTLResourceStatePassSampleBufferAttachmentDescriptorArray :: struct {
    objectAtIndexedSubscript_ :: (self: *MTLResourceStatePassSampleBufferAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLResourceStatePassSampleBufferAttachmentDescriptor {
        func :: #type (obj: *void, selector: *void, attachmentIndex: NSUInteger) -> *MTLResourceStatePassSampleBufferAttachmentDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, attachmentIndex);
    }

    setObject_atIndexedSubscript_ :: (self: *MTLResourceStatePassSampleBufferAttachmentDescriptorArray, attachment: *MTLResourceStatePassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, attachment: *MTLResourceStatePassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, attachment, attachmentIndex);
    }

}

MTLResourceStatePassDescriptor :: struct {
    resourceStatePassDescriptor :: () -> *MTLResourceStatePassDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLResourceStatePassDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLResourceStatePassDescriptor", __sel.resourceStatePassDescriptor);
    }

    sampleBufferAttachments :: (self: *MTLResourceStatePassDescriptor) -> *MTLResourceStatePassSampleBufferAttachmentDescriptorArray {
        func :: #type (obj: *void, selector: *void) -> *MTLResourceStatePassSampleBufferAttachmentDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleBufferAttachments);
    }

}

MTLRenderPassAttachmentDescriptor :: struct {
    texture :: (self: *MTLRenderPassAttachmentDescriptor) -> *MTLTexture {
        func :: #type (obj: *void, selector: *void) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.texture);
    }

    setTexture_ :: (self: *MTLRenderPassAttachmentDescriptor, texture: *MTLTexture) -> void {
        func :: #type (obj: *void, selector: *void, texture: *MTLTexture) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTexture_, texture);
    }

    level :: (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.level);
    }

    setLevel_ :: (self: *MTLRenderPassAttachmentDescriptor, level: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, level: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLevel_, level);
    }

    slice :: (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.slice);
    }

    setSlice_ :: (self: *MTLRenderPassAttachmentDescriptor, slice: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, slice: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSlice_, slice);
    }

    depthPlane :: (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.depthPlane);
    }

    setDepthPlane_ :: (self: *MTLRenderPassAttachmentDescriptor, depthPlane: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, depthPlane: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthPlane_, depthPlane);
    }

    resolveTexture :: (self: *MTLRenderPassAttachmentDescriptor) -> *MTLTexture {
        func :: #type (obj: *void, selector: *void) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resolveTexture);
    }

    setResolveTexture_ :: (self: *MTLRenderPassAttachmentDescriptor, resolveTexture: *MTLTexture) -> void {
        func :: #type (obj: *void, selector: *void, resolveTexture: *MTLTexture) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setResolveTexture_, resolveTexture);
    }

    resolveLevel :: (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resolveLevel);
    }

    setResolveLevel_ :: (self: *MTLRenderPassAttachmentDescriptor, resolveLevel: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, resolveLevel: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setResolveLevel_, resolveLevel);
    }

    resolveSlice :: (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resolveSlice);
    }

    setResolveSlice_ :: (self: *MTLRenderPassAttachmentDescriptor, resolveSlice: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, resolveSlice: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setResolveSlice_, resolveSlice);
    }

    resolveDepthPlane :: (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resolveDepthPlane);
    }

    setResolveDepthPlane_ :: (self: *MTLRenderPassAttachmentDescriptor, resolveDepthPlane: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, resolveDepthPlane: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setResolveDepthPlane_, resolveDepthPlane);
    }

    loadAction :: (self: *MTLRenderPassAttachmentDescriptor) -> MTLLoadAction {
        func :: #type (obj: *void, selector: *void) -> MTLLoadAction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.loadAction);
    }

    setLoadAction_ :: (self: *MTLRenderPassAttachmentDescriptor, loadAction: MTLLoadAction) -> void {
        func :: #type (obj: *void, selector: *void, loadAction: MTLLoadAction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLoadAction_, loadAction);
    }

    storeAction :: (self: *MTLRenderPassAttachmentDescriptor) -> MTLStoreAction {
        func :: #type (obj: *void, selector: *void) -> MTLStoreAction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.storeAction);
    }

    setStoreAction_ :: (self: *MTLRenderPassAttachmentDescriptor, storeAction: MTLStoreAction) -> void {
        func :: #type (obj: *void, selector: *void, storeAction: MTLStoreAction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStoreAction_, storeAction);
    }

    storeActionOptions :: (self: *MTLRenderPassAttachmentDescriptor) -> MTLStoreActionOptions {
        func :: #type (obj: *void, selector: *void) -> MTLStoreActionOptions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.storeActionOptions);
    }

    setStoreActionOptions_ :: (self: *MTLRenderPassAttachmentDescriptor, storeActionOptions: MTLStoreActionOptions) -> void {
        func :: #type (obj: *void, selector: *void, storeActionOptions: MTLStoreActionOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStoreActionOptions_, storeActionOptions);
    }

}

MTLRenderPassColorAttachmentDescriptor :: struct {
    clearColor :: (self: *MTLRenderPassColorAttachmentDescriptor) -> MTLClearColor {
        func :: #type (obj: *void, selector: *void) -> MTLClearColor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.clearColor);
    }

    setClearColor_ :: (self: *MTLRenderPassColorAttachmentDescriptor, clearColor: MTLClearColor) -> void {
        func :: #type (obj: *void, selector: *void, clearColor: MTLClearColor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setClearColor_, clearColor);
    }

}

MTLRenderPassDepthAttachmentDescriptor :: struct {
    clearDepth :: (self: *MTLRenderPassDepthAttachmentDescriptor) -> float64 {
        func :: #type (obj: *void, selector: *void) -> float64 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.clearDepth);
    }

    setClearDepth_ :: (self: *MTLRenderPassDepthAttachmentDescriptor, clearDepth: float64) -> void {
        func :: #type (obj: *void, selector: *void, clearDepth: float64) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setClearDepth_, clearDepth);
    }

    depthResolveFilter :: (self: *MTLRenderPassDepthAttachmentDescriptor) -> MTLMultisampleDepthResolveFilter {
        func :: #type (obj: *void, selector: *void) -> MTLMultisampleDepthResolveFilter #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.depthResolveFilter);
    }

    setDepthResolveFilter_ :: (self: *MTLRenderPassDepthAttachmentDescriptor, depthResolveFilter: MTLMultisampleDepthResolveFilter) -> void {
        func :: #type (obj: *void, selector: *void, depthResolveFilter: MTLMultisampleDepthResolveFilter) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthResolveFilter_, depthResolveFilter);
    }

}

MTLRenderPassStencilAttachmentDescriptor :: struct {
    clearStencil :: (self: *MTLRenderPassStencilAttachmentDescriptor) -> u32 {
        func :: #type (obj: *void, selector: *void) -> u32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.clearStencil);
    }

    setClearStencil_ :: (self: *MTLRenderPassStencilAttachmentDescriptor, clearStencil: u32) -> void {
        func :: #type (obj: *void, selector: *void, clearStencil: u32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setClearStencil_, clearStencil);
    }

    stencilResolveFilter :: (self: *MTLRenderPassStencilAttachmentDescriptor) -> MTLMultisampleStencilResolveFilter {
        func :: #type (obj: *void, selector: *void) -> MTLMultisampleStencilResolveFilter #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stencilResolveFilter);
    }

    setStencilResolveFilter_ :: (self: *MTLRenderPassStencilAttachmentDescriptor, stencilResolveFilter: MTLMultisampleStencilResolveFilter) -> void {
        func :: #type (obj: *void, selector: *void, stencilResolveFilter: MTLMultisampleStencilResolveFilter) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilResolveFilter_, stencilResolveFilter);
    }

}

MTLRenderPassColorAttachmentDescriptorArray :: struct {
    objectAtIndexedSubscript_ :: (self: *MTLRenderPassColorAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLRenderPassColorAttachmentDescriptor {
        func :: #type (obj: *void, selector: *void, attachmentIndex: NSUInteger) -> *MTLRenderPassColorAttachmentDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, attachmentIndex);
    }

    setObject_atIndexedSubscript_ :: (self: *MTLRenderPassColorAttachmentDescriptorArray, attachment: *MTLRenderPassColorAttachmentDescriptor, attachmentIndex: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, attachment: *MTLRenderPassColorAttachmentDescriptor, attachmentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, attachment, attachmentIndex);
    }

}

MTLRenderPassSampleBufferAttachmentDescriptor :: struct {
    sampleBuffer :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor) -> *MTLCounterSampleBuffer {
        func :: #type (obj: *void, selector: *void) -> *MTLCounterSampleBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleBuffer);
    }

    setSampleBuffer_ :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor, sampleBuffer: *MTLCounterSampleBuffer) -> void {
        func :: #type (obj: *void, selector: *void, sampleBuffer: *MTLCounterSampleBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSampleBuffer_, sampleBuffer);
    }

    startOfVertexSampleIndex :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.startOfVertexSampleIndex);
    }

    setStartOfVertexSampleIndex_ :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor, startOfVertexSampleIndex: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, startOfVertexSampleIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStartOfVertexSampleIndex_, startOfVertexSampleIndex);
    }

    endOfVertexSampleIndex :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.endOfVertexSampleIndex);
    }

    setEndOfVertexSampleIndex_ :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor, endOfVertexSampleIndex: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, endOfVertexSampleIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setEndOfVertexSampleIndex_, endOfVertexSampleIndex);
    }

    startOfFragmentSampleIndex :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.startOfFragmentSampleIndex);
    }

    setStartOfFragmentSampleIndex_ :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor, startOfFragmentSampleIndex: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, startOfFragmentSampleIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStartOfFragmentSampleIndex_, startOfFragmentSampleIndex);
    }

    endOfFragmentSampleIndex :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.endOfFragmentSampleIndex);
    }

    setEndOfFragmentSampleIndex_ :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor, endOfFragmentSampleIndex: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, endOfFragmentSampleIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setEndOfFragmentSampleIndex_, endOfFragmentSampleIndex);
    }

}

MTLRenderPassSampleBufferAttachmentDescriptorArray :: struct {
    objectAtIndexedSubscript_ :: (self: *MTLRenderPassSampleBufferAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLRenderPassSampleBufferAttachmentDescriptor {
        func :: #type (obj: *void, selector: *void, attachmentIndex: NSUInteger) -> *MTLRenderPassSampleBufferAttachmentDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, attachmentIndex);
    }

    setObject_atIndexedSubscript_ :: (self: *MTLRenderPassSampleBufferAttachmentDescriptorArray, attachment: *MTLRenderPassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, attachment: *MTLRenderPassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, attachment, attachmentIndex);
    }

}

MTLRenderPassDescriptor :: struct {
    renderPassDescriptor :: () -> *MTLRenderPassDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLRenderPassDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLRenderPassDescriptor", __sel.renderPassDescriptor);
    }

    setSamplePositions_count_ :: (self: *MTLRenderPassDescriptor, positions: *const MTLSamplePosition, count: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, positions: *const MTLSamplePosition, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSamplePositions_count_, positions, count);
    }

    getSamplePositions_count_ :: (self: *MTLRenderPassDescriptor, positions: *MTLSamplePosition, count: NSUInteger) -> NSUInteger {
        func :: #type (obj: *void, selector: *void, positions: *MTLSamplePosition, count: NSUInteger) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.getSamplePositions_count_, positions, count);
    }

    colorAttachments :: (self: *MTLRenderPassDescriptor) -> *MTLRenderPassColorAttachmentDescriptorArray {
        func :: #type (obj: *void, selector: *void) -> *MTLRenderPassColorAttachmentDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.colorAttachments);
    }

    depthAttachment :: (self: *MTLRenderPassDescriptor) -> *MTLRenderPassDepthAttachmentDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTLRenderPassDepthAttachmentDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.depthAttachment);
    }

    setDepthAttachment_ :: (self: *MTLRenderPassDescriptor, depthAttachment: *MTLRenderPassDepthAttachmentDescriptor) -> void {
        func :: #type (obj: *void, selector: *void, depthAttachment: *MTLRenderPassDepthAttachmentDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthAttachment_, depthAttachment);
    }

    stencilAttachment :: (self: *MTLRenderPassDescriptor) -> *MTLRenderPassStencilAttachmentDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTLRenderPassStencilAttachmentDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stencilAttachment);
    }

    setStencilAttachment_ :: (self: *MTLRenderPassDescriptor, stencilAttachment: *MTLRenderPassStencilAttachmentDescriptor) -> void {
        func :: #type (obj: *void, selector: *void, stencilAttachment: *MTLRenderPassStencilAttachmentDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilAttachment_, stencilAttachment);
    }

    visibilityResultBuffer :: (self: *MTLRenderPassDescriptor) -> *MTLBuffer {
        func :: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.visibilityResultBuffer);
    }

    setVisibilityResultBuffer_ :: (self: *MTLRenderPassDescriptor, visibilityResultBuffer: *MTLBuffer) -> void {
        func :: #type (obj: *void, selector: *void, visibilityResultBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVisibilityResultBuffer_, visibilityResultBuffer);
    }

    renderTargetArrayLength :: (self: *MTLRenderPassDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.renderTargetArrayLength);
    }

    setRenderTargetArrayLength_ :: (self: *MTLRenderPassDescriptor, renderTargetArrayLength: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, renderTargetArrayLength: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRenderTargetArrayLength_, renderTargetArrayLength);
    }

    imageblockSampleLength :: (self: *MTLRenderPassDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.imageblockSampleLength);
    }

    setImageblockSampleLength_ :: (self: *MTLRenderPassDescriptor, imageblockSampleLength: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, imageblockSampleLength: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setImageblockSampleLength_, imageblockSampleLength);
    }

    threadgroupMemoryLength :: (self: *MTLRenderPassDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.threadgroupMemoryLength);
    }

    setThreadgroupMemoryLength_ :: (self: *MTLRenderPassDescriptor, threadgroupMemoryLength: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, threadgroupMemoryLength: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setThreadgroupMemoryLength_, threadgroupMemoryLength);
    }

    tileWidth :: (self: *MTLRenderPassDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileWidth);
    }

    setTileWidth_ :: (self: *MTLRenderPassDescriptor, tileWidth: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, tileWidth: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileWidth_, tileWidth);
    }

    tileHeight :: (self: *MTLRenderPassDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileHeight);
    }

    setTileHeight_ :: (self: *MTLRenderPassDescriptor, tileHeight: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, tileHeight: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileHeight_, tileHeight);
    }

    defaultRasterSampleCount :: (self: *MTLRenderPassDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.defaultRasterSampleCount);
    }

    setDefaultRasterSampleCount_ :: (self: *MTLRenderPassDescriptor, defaultRasterSampleCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, defaultRasterSampleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDefaultRasterSampleCount_, defaultRasterSampleCount);
    }

    renderTargetWidth :: (self: *MTLRenderPassDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.renderTargetWidth);
    }

    setRenderTargetWidth_ :: (self: *MTLRenderPassDescriptor, renderTargetWidth: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, renderTargetWidth: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRenderTargetWidth_, renderTargetWidth);
    }

    renderTargetHeight :: (self: *MTLRenderPassDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.renderTargetHeight);
    }

    setRenderTargetHeight_ :: (self: *MTLRenderPassDescriptor, renderTargetHeight: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, renderTargetHeight: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRenderTargetHeight_, renderTargetHeight);
    }

    rasterizationRateMap :: (self: *MTLRenderPassDescriptor) -> *MTLRasterizationRateMap {
        func :: #type (obj: *void, selector: *void) -> *MTLRasterizationRateMap #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.rasterizationRateMap);
    }

    setRasterizationRateMap_ :: (self: *MTLRenderPassDescriptor, rasterizationRateMap: *MTLRasterizationRateMap) -> void {
        func :: #type (obj: *void, selector: *void, rasterizationRateMap: *MTLRasterizationRateMap) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRasterizationRateMap_, rasterizationRateMap);
    }

    sampleBufferAttachments :: (self: *MTLRenderPassDescriptor) -> *MTLRenderPassSampleBufferAttachmentDescriptorArray {
        func :: #type (obj: *void, selector: *void) -> *MTLRenderPassSampleBufferAttachmentDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleBufferAttachments);
    }

    visibilityResultType :: (self: *MTLRenderPassDescriptor) -> MTLVisibilityResultType {
        func :: #type (obj: *void, selector: *void) -> MTLVisibilityResultType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.visibilityResultType);
    }

    setVisibilityResultType_ :: (self: *MTLRenderPassDescriptor, visibilityResultType: MTLVisibilityResultType) -> void {
        func :: #type (obj: *void, selector: *void, visibilityResultType: MTLVisibilityResultType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVisibilityResultType_, visibilityResultType);
    }

    supportColorAttachmentMapping :: (self: *MTLRenderPassDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportColorAttachmentMapping);
    }

    setSupportColorAttachmentMapping_ :: (self: *MTLRenderPassDescriptor, supportColorAttachmentMapping: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, supportColorAttachmentMapping: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportColorAttachmentMapping_, supportColorAttachmentMapping);
    }

}

MTLBlitPassSampleBufferAttachmentDescriptor :: struct {
    sampleBuffer :: (self: *MTLBlitPassSampleBufferAttachmentDescriptor) -> *MTLCounterSampleBuffer {
        func :: #type (obj: *void, selector: *void) -> *MTLCounterSampleBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleBuffer);
    }

    setSampleBuffer_ :: (self: *MTLBlitPassSampleBufferAttachmentDescriptor, sampleBuffer: *MTLCounterSampleBuffer) -> void {
        func :: #type (obj: *void, selector: *void, sampleBuffer: *MTLCounterSampleBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSampleBuffer_, sampleBuffer);
    }

    startOfEncoderSampleIndex :: (self: *MTLBlitPassSampleBufferAttachmentDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.startOfEncoderSampleIndex);
    }

    setStartOfEncoderSampleIndex_ :: (self: *MTLBlitPassSampleBufferAttachmentDescriptor, startOfEncoderSampleIndex: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, startOfEncoderSampleIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStartOfEncoderSampleIndex_, startOfEncoderSampleIndex);
    }

    endOfEncoderSampleIndex :: (self: *MTLBlitPassSampleBufferAttachmentDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.endOfEncoderSampleIndex);
    }

    setEndOfEncoderSampleIndex_ :: (self: *MTLBlitPassSampleBufferAttachmentDescriptor, endOfEncoderSampleIndex: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, endOfEncoderSampleIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setEndOfEncoderSampleIndex_, endOfEncoderSampleIndex);
    }

}

MTLBlitPassSampleBufferAttachmentDescriptorArray :: struct {
    objectAtIndexedSubscript_ :: (self: *MTLBlitPassSampleBufferAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLBlitPassSampleBufferAttachmentDescriptor {
        func :: #type (obj: *void, selector: *void, attachmentIndex: NSUInteger) -> *MTLBlitPassSampleBufferAttachmentDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, attachmentIndex);
    }

    setObject_atIndexedSubscript_ :: (self: *MTLBlitPassSampleBufferAttachmentDescriptorArray, attachment: *MTLBlitPassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, attachment: *MTLBlitPassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, attachment, attachmentIndex);
    }

}

MTLBlitPassDescriptor :: struct {
    blitPassDescriptor :: () -> *MTLBlitPassDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLBlitPassDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLBlitPassDescriptor", __sel.blitPassDescriptor);
    }

    sampleBufferAttachments :: (self: *MTLBlitPassDescriptor) -> *MTLBlitPassSampleBufferAttachmentDescriptorArray {
        func :: #type (obj: *void, selector: *void) -> *MTLBlitPassSampleBufferAttachmentDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleBufferAttachments);
    }

}

MTLCommandBufferDescriptor :: struct {
    retainedReferences :: (self: *MTLCommandBufferDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.retainedReferences);
    }

    setRetainedReferences_ :: (self: *MTLCommandBufferDescriptor, retainedReferences: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, retainedReferences: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRetainedReferences_, retainedReferences);
    }

    errorOptions :: (self: *MTLCommandBufferDescriptor) -> MTLCommandBufferErrorOption {
        func :: #type (obj: *void, selector: *void) -> MTLCommandBufferErrorOption #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.errorOptions);
    }

    setErrorOptions_ :: (self: *MTLCommandBufferDescriptor, errorOptions: MTLCommandBufferErrorOption) -> void {
        func :: #type (obj: *void, selector: *void, errorOptions: MTLCommandBufferErrorOption) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setErrorOptions_, errorOptions);
    }

    logState :: (self: *MTLCommandBufferDescriptor) -> *MTLLogState {
        func :: #type (obj: *void, selector: *void) -> *MTLLogState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.logState);
    }

    setLogState_ :: (self: *MTLCommandBufferDescriptor, logState: *MTLLogState) -> void {
        func :: #type (obj: *void, selector: *void, logState: *MTLLogState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLogState_, logState);
    }

}

MTLComputePassSampleBufferAttachmentDescriptor :: struct {
    sampleBuffer :: (self: *MTLComputePassSampleBufferAttachmentDescriptor) -> *MTLCounterSampleBuffer {
        func :: #type (obj: *void, selector: *void) -> *MTLCounterSampleBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleBuffer);
    }

    setSampleBuffer_ :: (self: *MTLComputePassSampleBufferAttachmentDescriptor, sampleBuffer: *MTLCounterSampleBuffer) -> void {
        func :: #type (obj: *void, selector: *void, sampleBuffer: *MTLCounterSampleBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSampleBuffer_, sampleBuffer);
    }

    startOfEncoderSampleIndex :: (self: *MTLComputePassSampleBufferAttachmentDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.startOfEncoderSampleIndex);
    }

    setStartOfEncoderSampleIndex_ :: (self: *MTLComputePassSampleBufferAttachmentDescriptor, startOfEncoderSampleIndex: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, startOfEncoderSampleIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStartOfEncoderSampleIndex_, startOfEncoderSampleIndex);
    }

    endOfEncoderSampleIndex :: (self: *MTLComputePassSampleBufferAttachmentDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.endOfEncoderSampleIndex);
    }

    setEndOfEncoderSampleIndex_ :: (self: *MTLComputePassSampleBufferAttachmentDescriptor, endOfEncoderSampleIndex: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, endOfEncoderSampleIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setEndOfEncoderSampleIndex_, endOfEncoderSampleIndex);
    }

}

MTLComputePassSampleBufferAttachmentDescriptorArray :: struct {
    objectAtIndexedSubscript_ :: (self: *MTLComputePassSampleBufferAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLComputePassSampleBufferAttachmentDescriptor {
        func :: #type (obj: *void, selector: *void, attachmentIndex: NSUInteger) -> *MTLComputePassSampleBufferAttachmentDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, attachmentIndex);
    }

    setObject_atIndexedSubscript_ :: (self: *MTLComputePassSampleBufferAttachmentDescriptorArray, attachment: *MTLComputePassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, attachment: *MTLComputePassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, attachment, attachmentIndex);
    }

}

MTLComputePassDescriptor :: struct {
    computePassDescriptor :: () -> *MTLComputePassDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLComputePassDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLComputePassDescriptor", __sel.computePassDescriptor);
    }

    dispatchType :: (self: *MTLComputePassDescriptor) -> MTLDispatchType {
        func :: #type (obj: *void, selector: *void) -> MTLDispatchType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dispatchType);
    }

    setDispatchType_ :: (self: *MTLComputePassDescriptor, dispatchType: MTLDispatchType) -> void {
        func :: #type (obj: *void, selector: *void, dispatchType: MTLDispatchType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDispatchType_, dispatchType);
    }

    sampleBufferAttachments :: (self: *MTLComputePassDescriptor) -> *MTLComputePassSampleBufferAttachmentDescriptorArray {
        func :: #type (obj: *void, selector: *void) -> *MTLComputePassSampleBufferAttachmentDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleBufferAttachments);
    }

}

MTLCommandQueueDescriptor :: struct {
    maxCommandBufferCount :: (self: *MTLCommandQueueDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxCommandBufferCount);
    }

    setMaxCommandBufferCount_ :: (self: *MTLCommandQueueDescriptor, maxCommandBufferCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxCommandBufferCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxCommandBufferCount_, maxCommandBufferCount);
    }

    logState :: (self: *MTLCommandQueueDescriptor) -> *MTLLogState {
        func :: #type (obj: *void, selector: *void) -> *MTLLogState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.logState);
    }

    setLogState_ :: (self: *MTLCommandQueueDescriptor, logState: *MTLLogState) -> void {
        func :: #type (obj: *void, selector: *void, logState: *MTLLogState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLogState_, logState);
    }

}

MTLStencilDescriptor :: struct {
    stencilCompareFunction :: (self: *MTLStencilDescriptor) -> MTLCompareFunction {
        func :: #type (obj: *void, selector: *void) -> MTLCompareFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stencilCompareFunction);
    }

    setStencilCompareFunction_ :: (self: *MTLStencilDescriptor, stencilCompareFunction: MTLCompareFunction) -> void {
        func :: #type (obj: *void, selector: *void, stencilCompareFunction: MTLCompareFunction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilCompareFunction_, stencilCompareFunction);
    }

    stencilFailureOperation :: (self: *MTLStencilDescriptor) -> MTLStencilOperation {
        func :: #type (obj: *void, selector: *void) -> MTLStencilOperation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stencilFailureOperation);
    }

    setStencilFailureOperation_ :: (self: *MTLStencilDescriptor, stencilFailureOperation: MTLStencilOperation) -> void {
        func :: #type (obj: *void, selector: *void, stencilFailureOperation: MTLStencilOperation) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilFailureOperation_, stencilFailureOperation);
    }

    depthFailureOperation :: (self: *MTLStencilDescriptor) -> MTLStencilOperation {
        func :: #type (obj: *void, selector: *void) -> MTLStencilOperation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.depthFailureOperation);
    }

    setDepthFailureOperation_ :: (self: *MTLStencilDescriptor, depthFailureOperation: MTLStencilOperation) -> void {
        func :: #type (obj: *void, selector: *void, depthFailureOperation: MTLStencilOperation) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthFailureOperation_, depthFailureOperation);
    }

    depthStencilPassOperation :: (self: *MTLStencilDescriptor) -> MTLStencilOperation {
        func :: #type (obj: *void, selector: *void) -> MTLStencilOperation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.depthStencilPassOperation);
    }

    setDepthStencilPassOperation_ :: (self: *MTLStencilDescriptor, depthStencilPassOperation: MTLStencilOperation) -> void {
        func :: #type (obj: *void, selector: *void, depthStencilPassOperation: MTLStencilOperation) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthStencilPassOperation_, depthStencilPassOperation);
    }

    readMask :: (self: *MTLStencilDescriptor) -> u32 {
        func :: #type (obj: *void, selector: *void) -> u32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.readMask);
    }

    setReadMask_ :: (self: *MTLStencilDescriptor, readMask: u32) -> void {
        func :: #type (obj: *void, selector: *void, readMask: u32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setReadMask_, readMask);
    }

    writeMask :: (self: *MTLStencilDescriptor) -> u32 {
        func :: #type (obj: *void, selector: *void) -> u32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.writeMask);
    }

    setWriteMask_ :: (self: *MTLStencilDescriptor, writeMask: u32) -> void {
        func :: #type (obj: *void, selector: *void, writeMask: u32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setWriteMask_, writeMask);
    }

}

MTLDepthStencilDescriptor :: struct {
    depthCompareFunction :: (self: *MTLDepthStencilDescriptor) -> MTLCompareFunction {
        func :: #type (obj: *void, selector: *void) -> MTLCompareFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.depthCompareFunction);
    }

    setDepthCompareFunction_ :: (self: *MTLDepthStencilDescriptor, depthCompareFunction: MTLCompareFunction) -> void {
        func :: #type (obj: *void, selector: *void, depthCompareFunction: MTLCompareFunction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthCompareFunction_, depthCompareFunction);
    }

    isDepthWriteEnabled :: (self: *MTLDepthStencilDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isDepthWriteEnabled);
    }

    setDepthWriteEnabled_ :: (self: *MTLDepthStencilDescriptor, depthWriteEnabled: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, depthWriteEnabled: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthWriteEnabled_, depthWriteEnabled);
    }

    frontFaceStencil :: (self: *MTLDepthStencilDescriptor) -> *MTLStencilDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTLStencilDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.frontFaceStencil);
    }

    setFrontFaceStencil_ :: (self: *MTLDepthStencilDescriptor, frontFaceStencil: *MTLStencilDescriptor) -> void {
        func :: #type (obj: *void, selector: *void, frontFaceStencil: *MTLStencilDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFrontFaceStencil_, frontFaceStencil);
    }

    backFaceStencil :: (self: *MTLDepthStencilDescriptor) -> *MTLStencilDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTLStencilDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.backFaceStencil);
    }

    setBackFaceStencil_ :: (self: *MTLDepthStencilDescriptor, backFaceStencil: *MTLStencilDescriptor) -> void {
        func :: #type (obj: *void, selector: *void, backFaceStencil: *MTLStencilDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBackFaceStencil_, backFaceStencil);
    }

    label :: (self: *MTLDepthStencilDescriptor) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLDepthStencilDescriptor, label: *NSString) -> void {
        func :: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

}

MTLVertexBufferLayoutDescriptor :: struct {
    stride :: (self: *MTLVertexBufferLayoutDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stride);
    }

    setStride_ :: (self: *MTLVertexBufferLayoutDescriptor, stride: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, stride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStride_, stride);
    }

    stepFunction :: (self: *MTLVertexBufferLayoutDescriptor) -> MTLVertexStepFunction {
        func :: #type (obj: *void, selector: *void) -> MTLVertexStepFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stepFunction);
    }

    setStepFunction_ :: (self: *MTLVertexBufferLayoutDescriptor, stepFunction: MTLVertexStepFunction) -> void {
        func :: #type (obj: *void, selector: *void, stepFunction: MTLVertexStepFunction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStepFunction_, stepFunction);
    }

    stepRate :: (self: *MTLVertexBufferLayoutDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stepRate);
    }

    setStepRate_ :: (self: *MTLVertexBufferLayoutDescriptor, stepRate: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, stepRate: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStepRate_, stepRate);
    }

}

MTLVertexBufferLayoutDescriptorArray :: struct {
    objectAtIndexedSubscript_ :: (self: *MTLVertexBufferLayoutDescriptorArray, index: NSUInteger) -> *MTLVertexBufferLayoutDescriptor {
        func :: #type (obj: *void, selector: *void, index: NSUInteger) -> *MTLVertexBufferLayoutDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, index);
    }

    setObject_atIndexedSubscript_ :: (self: *MTLVertexBufferLayoutDescriptorArray, bufferDesc: *MTLVertexBufferLayoutDescriptor, index: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, bufferDesc: *MTLVertexBufferLayoutDescriptor, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, bufferDesc, index);
    }

}

MTLVertexAttributeDescriptor :: struct {
    format :: (self: *MTLVertexAttributeDescriptor) -> MTLVertexFormat {
        func :: #type (obj: *void, selector: *void) -> MTLVertexFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.format);
    }

    setFormat_ :: (self: *MTLVertexAttributeDescriptor, format: MTLVertexFormat) -> void {
        func :: #type (obj: *void, selector: *void, format: MTLVertexFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFormat_, format);
    }

    offset :: (self: *MTLVertexAttributeDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.offset);
    }

    setOffset_ :: (self: *MTLVertexAttributeDescriptor, offset: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, offset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOffset_, offset);
    }

    bufferIndex :: (self: *MTLVertexAttributeDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bufferIndex);
    }

    setBufferIndex_ :: (self: *MTLVertexAttributeDescriptor, bufferIndex: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBufferIndex_, bufferIndex);
    }

}

MTLVertexAttributeDescriptorArray :: struct {
    objectAtIndexedSubscript_ :: (self: *MTLVertexAttributeDescriptorArray, index: NSUInteger) -> *MTLVertexAttributeDescriptor {
        func :: #type (obj: *void, selector: *void, index: NSUInteger) -> *MTLVertexAttributeDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, index);
    }

    setObject_atIndexedSubscript_ :: (self: *MTLVertexAttributeDescriptorArray, attributeDesc: *MTLVertexAttributeDescriptor, index: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, attributeDesc: *MTLVertexAttributeDescriptor, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, attributeDesc, index);
    }

}

MTLVertexDescriptor :: struct {
    vertexDescriptor :: () -> *MTLVertexDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLVertexDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLVertexDescriptor", __sel.vertexDescriptor);
    }

    reset :: (self: *MTLVertexDescriptor) -> void {
        func :: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

    layouts :: (self: *MTLVertexDescriptor) -> *MTLVertexBufferLayoutDescriptorArray {
        func :: #type (obj: *void, selector: *void) -> *MTLVertexBufferLayoutDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.layouts);
    }

    attributes :: (self: *MTLVertexDescriptor) -> *MTLVertexAttributeDescriptorArray {
        func :: #type (obj: *void, selector: *void) -> *MTLVertexAttributeDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.attributes);
    }

}

MTLBufferLayoutDescriptor :: struct {
    stride :: (self: *MTLBufferLayoutDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stride);
    }

    setStride_ :: (self: *MTLBufferLayoutDescriptor, stride: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, stride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStride_, stride);
    }

    stepFunction :: (self: *MTLBufferLayoutDescriptor) -> MTLStepFunction {
        func :: #type (obj: *void, selector: *void) -> MTLStepFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stepFunction);
    }

    setStepFunction_ :: (self: *MTLBufferLayoutDescriptor, stepFunction: MTLStepFunction) -> void {
        func :: #type (obj: *void, selector: *void, stepFunction: MTLStepFunction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStepFunction_, stepFunction);
    }

    stepRate :: (self: *MTLBufferLayoutDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stepRate);
    }

    setStepRate_ :: (self: *MTLBufferLayoutDescriptor, stepRate: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, stepRate: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStepRate_, stepRate);
    }

}

MTLBufferLayoutDescriptorArray :: struct {
    objectAtIndexedSubscript_ :: (self: *MTLBufferLayoutDescriptorArray, index: NSUInteger) -> *MTLBufferLayoutDescriptor {
        func :: #type (obj: *void, selector: *void, index: NSUInteger) -> *MTLBufferLayoutDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, index);
    }

    setObject_atIndexedSubscript_ :: (self: *MTLBufferLayoutDescriptorArray, bufferDesc: *MTLBufferLayoutDescriptor, index: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, bufferDesc: *MTLBufferLayoutDescriptor, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, bufferDesc, index);
    }

}

MTLAttributeDescriptor :: struct {
    format :: (self: *MTLAttributeDescriptor) -> MTLAttributeFormat {
        func :: #type (obj: *void, selector: *void) -> MTLAttributeFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.format);
    }

    setFormat_ :: (self: *MTLAttributeDescriptor, format: MTLAttributeFormat) -> void {
        func :: #type (obj: *void, selector: *void, format: MTLAttributeFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFormat_, format);
    }

    offset :: (self: *MTLAttributeDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.offset);
    }

    setOffset_ :: (self: *MTLAttributeDescriptor, offset: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, offset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOffset_, offset);
    }

    bufferIndex :: (self: *MTLAttributeDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bufferIndex);
    }

    setBufferIndex_ :: (self: *MTLAttributeDescriptor, bufferIndex: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBufferIndex_, bufferIndex);
    }

}

MTLAttributeDescriptorArray :: struct {
    objectAtIndexedSubscript_ :: (self: *MTLAttributeDescriptorArray, index: NSUInteger) -> *MTLAttributeDescriptor {
        func :: #type (obj: *void, selector: *void, index: NSUInteger) -> *MTLAttributeDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, index);
    }

    setObject_atIndexedSubscript_ :: (self: *MTLAttributeDescriptorArray, attributeDesc: *MTLAttributeDescriptor, index: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, attributeDesc: *MTLAttributeDescriptor, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, attributeDesc, index);
    }

}

MTLStageInputOutputDescriptor :: struct {
    stageInputOutputDescriptor :: () -> *MTLStageInputOutputDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLStageInputOutputDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLStageInputOutputDescriptor", __sel.stageInputOutputDescriptor);
    }

    reset :: (self: *MTLStageInputOutputDescriptor) -> void {
        func :: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

    layouts :: (self: *MTLStageInputOutputDescriptor) -> *MTLBufferLayoutDescriptorArray {
        func :: #type (obj: *void, selector: *void) -> *MTLBufferLayoutDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.layouts);
    }

    attributes :: (self: *MTLStageInputOutputDescriptor) -> *MTLAttributeDescriptorArray {
        func :: #type (obj: *void, selector: *void) -> *MTLAttributeDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.attributes);
    }

    indexType :: (self: *MTLStageInputOutputDescriptor) -> MTLIndexType {
        func :: #type (obj: *void, selector: *void) -> MTLIndexType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexType);
    }

    setIndexType_ :: (self: *MTLStageInputOutputDescriptor, indexType: MTLIndexType) -> void {
        func :: #type (obj: *void, selector: *void, indexType: MTLIndexType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexType_, indexType);
    }

    indexBufferIndex :: (self: *MTLStageInputOutputDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexBufferIndex);
    }

    setIndexBufferIndex_ :: (self: *MTLStageInputOutputDescriptor, indexBufferIndex: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, indexBufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexBufferIndex_, indexBufferIndex);
    }

}

MTLPipelineBufferDescriptor :: struct {
    mutability :: (self: *MTLPipelineBufferDescriptor) -> MTLMutability {
        func :: #type (obj: *void, selector: *void) -> MTLMutability #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.mutability);
    }

    setMutability_ :: (self: *MTLPipelineBufferDescriptor, mutability: MTLMutability) -> void {
        func :: #type (obj: *void, selector: *void, mutability: MTLMutability) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMutability_, mutability);
    }

}

MTLPipelineBufferDescriptorArray :: struct {
    objectAtIndexedSubscript_ :: (self: *MTLPipelineBufferDescriptorArray, bufferIndex: NSUInteger) -> *MTLPipelineBufferDescriptor {
        func :: #type (obj: *void, selector: *void, bufferIndex: NSUInteger) -> *MTLPipelineBufferDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, bufferIndex);
    }

    setObject_atIndexedSubscript_ :: (self: *MTLPipelineBufferDescriptorArray, buffer: *MTLPipelineBufferDescriptor, bufferIndex: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, buffer: *MTLPipelineBufferDescriptor, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, buffer, bufferIndex);
    }

}

MTLLinkedFunctions :: struct {
    linkedFunctions :: () -> *MTLLinkedFunctions {
        func: #type (obj: *void, selector: *void) -> *MTLLinkedFunctions #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLLinkedFunctions", __sel.linkedFunctions);
    }

    functions :: (self: *MTLLinkedFunctions) -> *NSArray(*MTLFunction) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLFunction) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functions);
    }

    setFunctions_ :: (self: *MTLLinkedFunctions, functions: *NSArray(*MTLFunction)) -> void {
        func :: #type (obj: *void, selector: *void, functions: *NSArray(*MTLFunction)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFunctions_, functions);
    }

    binaryFunctions :: (self: *MTLLinkedFunctions) -> *NSArray(*MTLFunction) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLFunction) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.binaryFunctions);
    }

    setBinaryFunctions_ :: (self: *MTLLinkedFunctions, binaryFunctions: *NSArray(*MTLFunction)) -> void {
        func :: #type (obj: *void, selector: *void, binaryFunctions: *NSArray(*MTLFunction)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBinaryFunctions_, binaryFunctions);
    }

    groups :: (self: *MTLLinkedFunctions) -> *NSDictionary(*NSString, *NSArray(*MTLFunction)) {
        func :: #type (obj: *void, selector: *void) -> *NSDictionary(*NSString, *NSArray(*MTLFunction)) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.groups);
    }

    setGroups_ :: (self: *MTLLinkedFunctions, groups: *NSDictionary(*NSString, *NSArray(*MTLFunction))) -> void {
        func :: #type (obj: *void, selector: *void, groups: *NSDictionary(*NSString, *NSArray(*MTLFunction))) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setGroups_, groups);
    }

    privateFunctions :: (self: *MTLLinkedFunctions) -> *NSArray(*MTLFunction) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLFunction) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.privateFunctions);
    }

    setPrivateFunctions_ :: (self: *MTLLinkedFunctions, privateFunctions: *NSArray(*MTLFunction)) -> void {
        func :: #type (obj: *void, selector: *void, privateFunctions: *NSArray(*MTLFunction)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPrivateFunctions_, privateFunctions);
    }

}

MTLComputePipelineReflection :: struct {
    bindings :: (self: *MTLComputePipelineReflection) -> *NSArray(*MTLBinding) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLBinding) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bindings);
    }

    arguments :: (self: *MTLComputePipelineReflection) -> *NSArray(*MTLArgument) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLArgument) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.arguments);
    }

}

MTLComputePipelineDescriptor :: struct {
    reset :: (self: *MTLComputePipelineDescriptor) -> void {
        func :: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

    label :: (self: *MTLComputePipelineDescriptor) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLComputePipelineDescriptor, label: *NSString) -> void {
        func :: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

    computeFunction :: (self: *MTLComputePipelineDescriptor) -> *MTLFunction {
        func :: #type (obj: *void, selector: *void) -> *MTLFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.computeFunction);
    }

    setComputeFunction_ :: (self: *MTLComputePipelineDescriptor, computeFunction: *MTLFunction) -> void {
        func :: #type (obj: *void, selector: *void, computeFunction: *MTLFunction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setComputeFunction_, computeFunction);
    }

    threadGroupSizeIsMultipleOfThreadExecutionWidth :: (self: *MTLComputePipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.threadGroupSizeIsMultipleOfThreadExecutionWidth);
    }

    setThreadGroupSizeIsMultipleOfThreadExecutionWidth_ :: (self: *MTLComputePipelineDescriptor, threadGroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, threadGroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setThreadGroupSizeIsMultipleOfThreadExecutionWidth_, threadGroupSizeIsMultipleOfThreadExecutionWidth);
    }

    maxTotalThreadsPerThreadgroup :: (self: *MTLComputePipelineDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadsPerThreadgroup);
    }

    setMaxTotalThreadsPerThreadgroup_ :: (self: *MTLComputePipelineDescriptor, maxTotalThreadsPerThreadgroup: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxTotalThreadsPerThreadgroup: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxTotalThreadsPerThreadgroup_, maxTotalThreadsPerThreadgroup);
    }

    stageInputDescriptor :: (self: *MTLComputePipelineDescriptor) -> *MTLStageInputOutputDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTLStageInputOutputDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stageInputDescriptor);
    }

    setStageInputDescriptor_ :: (self: *MTLComputePipelineDescriptor, stageInputDescriptor: *MTLStageInputOutputDescriptor) -> void {
        func :: #type (obj: *void, selector: *void, stageInputDescriptor: *MTLStageInputOutputDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStageInputDescriptor_, stageInputDescriptor);
    }

    buffers :: (self: *MTLComputePipelineDescriptor) -> *MTLPipelineBufferDescriptorArray {
        func :: #type (obj: *void, selector: *void) -> *MTLPipelineBufferDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.buffers);
    }

    supportIndirectCommandBuffers :: (self: *MTLComputePipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportIndirectCommandBuffers);
    }

    setSupportIndirectCommandBuffers_ :: (self: *MTLComputePipelineDescriptor, supportIndirectCommandBuffers: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, supportIndirectCommandBuffers: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportIndirectCommandBuffers_, supportIndirectCommandBuffers);
    }

    insertLibraries :: (self: *MTLComputePipelineDescriptor) -> *NSArray(*MTLDynamicLibrary) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLDynamicLibrary) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.insertLibraries);
    }

    setInsertLibraries_ :: (self: *MTLComputePipelineDescriptor, insertLibraries: *NSArray(*MTLDynamicLibrary)) -> void {
        func :: #type (obj: *void, selector: *void, insertLibraries: *NSArray(*MTLDynamicLibrary)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInsertLibraries_, insertLibraries);
    }

    preloadedLibraries :: (self: *MTLComputePipelineDescriptor) -> *NSArray(*MTLDynamicLibrary) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLDynamicLibrary) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.preloadedLibraries);
    }

    setPreloadedLibraries_ :: (self: *MTLComputePipelineDescriptor, preloadedLibraries: *NSArray(*MTLDynamicLibrary)) -> void {
        func :: #type (obj: *void, selector: *void, preloadedLibraries: *NSArray(*MTLDynamicLibrary)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPreloadedLibraries_, preloadedLibraries);
    }

    binaryArchives :: (self: *MTLComputePipelineDescriptor) -> *NSArray(*MTLBinaryArchive) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLBinaryArchive) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.binaryArchives);
    }

    setBinaryArchives_ :: (self: *MTLComputePipelineDescriptor, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void {
        func :: #type (obj: *void, selector: *void, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBinaryArchives_, binaryArchives);
    }

    linkedFunctions :: (self: *MTLComputePipelineDescriptor) -> *MTLLinkedFunctions {
        func :: #type (obj: *void, selector: *void) -> *MTLLinkedFunctions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.linkedFunctions);
    }

    setLinkedFunctions_ :: (self: *MTLComputePipelineDescriptor, linkedFunctions: *MTLLinkedFunctions) -> void {
        func :: #type (obj: *void, selector: *void, linkedFunctions: *MTLLinkedFunctions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLinkedFunctions_, linkedFunctions);
    }

    supportAddingBinaryFunctions :: (self: *MTLComputePipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportAddingBinaryFunctions);
    }

    setSupportAddingBinaryFunctions_ :: (self: *MTLComputePipelineDescriptor, supportAddingBinaryFunctions: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, supportAddingBinaryFunctions: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportAddingBinaryFunctions_, supportAddingBinaryFunctions);
    }

    maxCallStackDepth :: (self: *MTLComputePipelineDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxCallStackDepth);
    }

    setMaxCallStackDepth_ :: (self: *MTLComputePipelineDescriptor, maxCallStackDepth: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxCallStackDepth: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxCallStackDepth_, maxCallStackDepth);
    }

    shaderValidation :: (self: *MTLComputePipelineDescriptor) -> MTLShaderValidation {
        func :: #type (obj: *void, selector: *void) -> MTLShaderValidation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.shaderValidation);
    }

    setShaderValidation_ :: (self: *MTLComputePipelineDescriptor, shaderValidation: MTLShaderValidation) -> void {
        func :: #type (obj: *void, selector: *void, shaderValidation: MTLShaderValidation) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setShaderValidation_, shaderValidation);
    }

    requiredThreadsPerThreadgroup :: (self: *MTLComputePipelineDescriptor) -> MTLSize {
        func :: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.requiredThreadsPerThreadgroup);
    }

    setRequiredThreadsPerThreadgroup_ :: (self: *MTLComputePipelineDescriptor, requiredThreadsPerThreadgroup: MTLSize) -> void {
        func :: #type (obj: *void, selector: *void, requiredThreadsPerThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRequiredThreadsPerThreadgroup_, requiredThreadsPerThreadgroup);
    }

}

MTLVisibleFunctionTableDescriptor :: struct {
    visibleFunctionTableDescriptor :: () -> *MTLVisibleFunctionTableDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLVisibleFunctionTableDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLVisibleFunctionTableDescriptor", __sel.visibleFunctionTableDescriptor);
    }

    functionCount :: (self: *MTLVisibleFunctionTableDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionCount);
    }

    setFunctionCount_ :: (self: *MTLVisibleFunctionTableDescriptor, functionCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, functionCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFunctionCount_, functionCount);
    }

}

MTLRenderPipelineColorAttachmentDescriptor :: struct {
    pixelFormat :: (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLPixelFormat {
        func :: #type (obj: *void, selector: *void) -> MTLPixelFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pixelFormat);
    }

    setPixelFormat_ :: (self: *MTLRenderPipelineColorAttachmentDescriptor, pixelFormat: MTLPixelFormat) -> void {
        func :: #type (obj: *void, selector: *void, pixelFormat: MTLPixelFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPixelFormat_, pixelFormat);
    }

    isBlendingEnabled :: (self: *MTLRenderPipelineColorAttachmentDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isBlendingEnabled);
    }

    setBlendingEnabled_ :: (self: *MTLRenderPipelineColorAttachmentDescriptor, blendingEnabled: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, blendingEnabled: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBlendingEnabled_, blendingEnabled);
    }

    sourceRGBBlendFactor :: (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
        func :: #type (obj: *void, selector: *void) -> MTLBlendFactor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sourceRGBBlendFactor);
    }

    setSourceRGBBlendFactor_ :: (self: *MTLRenderPipelineColorAttachmentDescriptor, sourceRGBBlendFactor: MTLBlendFactor) -> void {
        func :: #type (obj: *void, selector: *void, sourceRGBBlendFactor: MTLBlendFactor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSourceRGBBlendFactor_, sourceRGBBlendFactor);
    }

    destinationRGBBlendFactor :: (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
        func :: #type (obj: *void, selector: *void) -> MTLBlendFactor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.destinationRGBBlendFactor);
    }

    setDestinationRGBBlendFactor_ :: (self: *MTLRenderPipelineColorAttachmentDescriptor, destinationRGBBlendFactor: MTLBlendFactor) -> void {
        func :: #type (obj: *void, selector: *void, destinationRGBBlendFactor: MTLBlendFactor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDestinationRGBBlendFactor_, destinationRGBBlendFactor);
    }

    rgbBlendOperation :: (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendOperation {
        func :: #type (obj: *void, selector: *void) -> MTLBlendOperation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.rgbBlendOperation);
    }

    setRgbBlendOperation_ :: (self: *MTLRenderPipelineColorAttachmentDescriptor, rgbBlendOperation: MTLBlendOperation) -> void {
        func :: #type (obj: *void, selector: *void, rgbBlendOperation: MTLBlendOperation) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRgbBlendOperation_, rgbBlendOperation);
    }

    sourceAlphaBlendFactor :: (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
        func :: #type (obj: *void, selector: *void) -> MTLBlendFactor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sourceAlphaBlendFactor);
    }

    setSourceAlphaBlendFactor_ :: (self: *MTLRenderPipelineColorAttachmentDescriptor, sourceAlphaBlendFactor: MTLBlendFactor) -> void {
        func :: #type (obj: *void, selector: *void, sourceAlphaBlendFactor: MTLBlendFactor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSourceAlphaBlendFactor_, sourceAlphaBlendFactor);
    }

    destinationAlphaBlendFactor :: (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
        func :: #type (obj: *void, selector: *void) -> MTLBlendFactor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.destinationAlphaBlendFactor);
    }

    setDestinationAlphaBlendFactor_ :: (self: *MTLRenderPipelineColorAttachmentDescriptor, destinationAlphaBlendFactor: MTLBlendFactor) -> void {
        func :: #type (obj: *void, selector: *void, destinationAlphaBlendFactor: MTLBlendFactor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDestinationAlphaBlendFactor_, destinationAlphaBlendFactor);
    }

    alphaBlendOperation :: (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendOperation {
        func :: #type (obj: *void, selector: *void) -> MTLBlendOperation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.alphaBlendOperation);
    }

    setAlphaBlendOperation_ :: (self: *MTLRenderPipelineColorAttachmentDescriptor, alphaBlendOperation: MTLBlendOperation) -> void {
        func :: #type (obj: *void, selector: *void, alphaBlendOperation: MTLBlendOperation) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAlphaBlendOperation_, alphaBlendOperation);
    }

    writeMask :: (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLColorWriteMask {
        func :: #type (obj: *void, selector: *void) -> MTLColorWriteMask #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.writeMask);
    }

    setWriteMask_ :: (self: *MTLRenderPipelineColorAttachmentDescriptor, writeMask: MTLColorWriteMask) -> void {
        func :: #type (obj: *void, selector: *void, writeMask: MTLColorWriteMask) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setWriteMask_, writeMask);
    }

}

MTLLogicalToPhysicalColorAttachmentMap :: struct {
    setPhysicalIndex_forLogicalIndex_ :: (self: *MTLLogicalToPhysicalColorAttachmentMap, physicalIndex: NSUInteger, logicalIndex: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, physicalIndex: NSUInteger, logicalIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPhysicalIndex_forLogicalIndex_, physicalIndex, logicalIndex);
    }

    getPhysicalIndexForLogicalIndex_ :: (self: *MTLLogicalToPhysicalColorAttachmentMap, logicalIndex: NSUInteger) -> NSUInteger {
        func :: #type (obj: *void, selector: *void, logicalIndex: NSUInteger) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.getPhysicalIndexForLogicalIndex_, logicalIndex);
    }

    reset :: (self: *MTLLogicalToPhysicalColorAttachmentMap) -> void {
        func :: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

}

MTLRenderPipelineReflection :: struct {
    vertexBindings :: (self: *MTLRenderPipelineReflection) -> *NSArray(*MTLBinding) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLBinding) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexBindings);
    }

    fragmentBindings :: (self: *MTLRenderPipelineReflection) -> *NSArray(*MTLBinding) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLBinding) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentBindings);
    }

    tileBindings :: (self: *MTLRenderPipelineReflection) -> *NSArray(*MTLBinding) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLBinding) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileBindings);
    }

    objectBindings :: (self: *MTLRenderPipelineReflection) -> *NSArray(*MTLBinding) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLBinding) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectBindings);
    }

    meshBindings :: (self: *MTLRenderPipelineReflection) -> *NSArray(*MTLBinding) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLBinding) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.meshBindings);
    }

    vertexArguments :: (self: *MTLRenderPipelineReflection) -> *NSArray(*MTLArgument) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLArgument) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexArguments);
    }

    fragmentArguments :: (self: *MTLRenderPipelineReflection) -> *NSArray(*MTLArgument) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLArgument) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentArguments);
    }

    tileArguments :: (self: *MTLRenderPipelineReflection) -> *NSArray(*MTLArgument) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLArgument) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileArguments);
    }

}

MTLRenderPipelineDescriptor :: struct {
    reset :: (self: *MTLRenderPipelineDescriptor) -> void {
        func :: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

    label :: (self: *MTLRenderPipelineDescriptor) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLRenderPipelineDescriptor, label: *NSString) -> void {
        func :: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

    vertexFunction :: (self: *MTLRenderPipelineDescriptor) -> *MTLFunction {
        func :: #type (obj: *void, selector: *void) -> *MTLFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexFunction);
    }

    setVertexFunction_ :: (self: *MTLRenderPipelineDescriptor, vertexFunction: *MTLFunction) -> void {
        func :: #type (obj: *void, selector: *void, vertexFunction: *MTLFunction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexFunction_, vertexFunction);
    }

    fragmentFunction :: (self: *MTLRenderPipelineDescriptor) -> *MTLFunction {
        func :: #type (obj: *void, selector: *void) -> *MTLFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentFunction);
    }

    setFragmentFunction_ :: (self: *MTLRenderPipelineDescriptor, fragmentFunction: *MTLFunction) -> void {
        func :: #type (obj: *void, selector: *void, fragmentFunction: *MTLFunction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentFunction_, fragmentFunction);
    }

    vertexDescriptor :: (self: *MTLRenderPipelineDescriptor) -> *MTLVertexDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTLVertexDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexDescriptor);
    }

    setVertexDescriptor_ :: (self: *MTLRenderPipelineDescriptor, vertexDescriptor: *MTLVertexDescriptor) -> void {
        func :: #type (obj: *void, selector: *void, vertexDescriptor: *MTLVertexDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexDescriptor_, vertexDescriptor);
    }

    sampleCount :: (self: *MTLRenderPipelineDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleCount);
    }

    setSampleCount_ :: (self: *MTLRenderPipelineDescriptor, sampleCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, sampleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSampleCount_, sampleCount);
    }

    rasterSampleCount :: (self: *MTLRenderPipelineDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.rasterSampleCount);
    }

    setRasterSampleCount_ :: (self: *MTLRenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, rasterSampleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRasterSampleCount_, rasterSampleCount);
    }

    isAlphaToCoverageEnabled :: (self: *MTLRenderPipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isAlphaToCoverageEnabled);
    }

    setAlphaToCoverageEnabled_ :: (self: *MTLRenderPipelineDescriptor, alphaToCoverageEnabled: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, alphaToCoverageEnabled: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAlphaToCoverageEnabled_, alphaToCoverageEnabled);
    }

    isAlphaToOneEnabled :: (self: *MTLRenderPipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isAlphaToOneEnabled);
    }

    setAlphaToOneEnabled_ :: (self: *MTLRenderPipelineDescriptor, alphaToOneEnabled: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, alphaToOneEnabled: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAlphaToOneEnabled_, alphaToOneEnabled);
    }

    isRasterizationEnabled :: (self: *MTLRenderPipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isRasterizationEnabled);
    }

    setRasterizationEnabled_ :: (self: *MTLRenderPipelineDescriptor, rasterizationEnabled: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, rasterizationEnabled: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRasterizationEnabled_, rasterizationEnabled);
    }

    maxVertexAmplificationCount :: (self: *MTLRenderPipelineDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxVertexAmplificationCount);
    }

    setMaxVertexAmplificationCount_ :: (self: *MTLRenderPipelineDescriptor, maxVertexAmplificationCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxVertexAmplificationCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxVertexAmplificationCount_, maxVertexAmplificationCount);
    }

    colorAttachments :: (self: *MTLRenderPipelineDescriptor) -> *MTLRenderPipelineColorAttachmentDescriptorArray {
        func :: #type (obj: *void, selector: *void) -> *MTLRenderPipelineColorAttachmentDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.colorAttachments);
    }

    depthAttachmentPixelFormat :: (self: *MTLRenderPipelineDescriptor) -> MTLPixelFormat {
        func :: #type (obj: *void, selector: *void) -> MTLPixelFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.depthAttachmentPixelFormat);
    }

    setDepthAttachmentPixelFormat_ :: (self: *MTLRenderPipelineDescriptor, depthAttachmentPixelFormat: MTLPixelFormat) -> void {
        func :: #type (obj: *void, selector: *void, depthAttachmentPixelFormat: MTLPixelFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthAttachmentPixelFormat_, depthAttachmentPixelFormat);
    }

    stencilAttachmentPixelFormat :: (self: *MTLRenderPipelineDescriptor) -> MTLPixelFormat {
        func :: #type (obj: *void, selector: *void) -> MTLPixelFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stencilAttachmentPixelFormat);
    }

    setStencilAttachmentPixelFormat_ :: (self: *MTLRenderPipelineDescriptor, stencilAttachmentPixelFormat: MTLPixelFormat) -> void {
        func :: #type (obj: *void, selector: *void, stencilAttachmentPixelFormat: MTLPixelFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilAttachmentPixelFormat_, stencilAttachmentPixelFormat);
    }

    inputPrimitiveTopology :: (self: *MTLRenderPipelineDescriptor) -> MTLPrimitiveTopologyClass {
        func :: #type (obj: *void, selector: *void) -> MTLPrimitiveTopologyClass #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.inputPrimitiveTopology);
    }

    setInputPrimitiveTopology_ :: (self: *MTLRenderPipelineDescriptor, inputPrimitiveTopology: MTLPrimitiveTopologyClass) -> void {
        func :: #type (obj: *void, selector: *void, inputPrimitiveTopology: MTLPrimitiveTopologyClass) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInputPrimitiveTopology_, inputPrimitiveTopology);
    }

    tessellationPartitionMode :: (self: *MTLRenderPipelineDescriptor) -> MTLTessellationPartitionMode {
        func :: #type (obj: *void, selector: *void) -> MTLTessellationPartitionMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tessellationPartitionMode);
    }

    setTessellationPartitionMode_ :: (self: *MTLRenderPipelineDescriptor, tessellationPartitionMode: MTLTessellationPartitionMode) -> void {
        func :: #type (obj: *void, selector: *void, tessellationPartitionMode: MTLTessellationPartitionMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTessellationPartitionMode_, tessellationPartitionMode);
    }

    maxTessellationFactor :: (self: *MTLRenderPipelineDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTessellationFactor);
    }

    setMaxTessellationFactor_ :: (self: *MTLRenderPipelineDescriptor, maxTessellationFactor: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxTessellationFactor: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxTessellationFactor_, maxTessellationFactor);
    }

    isTessellationFactorScaleEnabled :: (self: *MTLRenderPipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isTessellationFactorScaleEnabled);
    }

    setTessellationFactorScaleEnabled_ :: (self: *MTLRenderPipelineDescriptor, tessellationFactorScaleEnabled: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, tessellationFactorScaleEnabled: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTessellationFactorScaleEnabled_, tessellationFactorScaleEnabled);
    }

    tessellationFactorFormat :: (self: *MTLRenderPipelineDescriptor) -> MTLTessellationFactorFormat {
        func :: #type (obj: *void, selector: *void) -> MTLTessellationFactorFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tessellationFactorFormat);
    }

    setTessellationFactorFormat_ :: (self: *MTLRenderPipelineDescriptor, tessellationFactorFormat: MTLTessellationFactorFormat) -> void {
        func :: #type (obj: *void, selector: *void, tessellationFactorFormat: MTLTessellationFactorFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTessellationFactorFormat_, tessellationFactorFormat);
    }

    tessellationControlPointIndexType :: (self: *MTLRenderPipelineDescriptor) -> MTLTessellationControlPointIndexType {
        func :: #type (obj: *void, selector: *void) -> MTLTessellationControlPointIndexType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tessellationControlPointIndexType);
    }

    setTessellationControlPointIndexType_ :: (self: *MTLRenderPipelineDescriptor, tessellationControlPointIndexType: MTLTessellationControlPointIndexType) -> void {
        func :: #type (obj: *void, selector: *void, tessellationControlPointIndexType: MTLTessellationControlPointIndexType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTessellationControlPointIndexType_, tessellationControlPointIndexType);
    }

    tessellationFactorStepFunction :: (self: *MTLRenderPipelineDescriptor) -> MTLTessellationFactorStepFunction {
        func :: #type (obj: *void, selector: *void) -> MTLTessellationFactorStepFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tessellationFactorStepFunction);
    }

    setTessellationFactorStepFunction_ :: (self: *MTLRenderPipelineDescriptor, tessellationFactorStepFunction: MTLTessellationFactorStepFunction) -> void {
        func :: #type (obj: *void, selector: *void, tessellationFactorStepFunction: MTLTessellationFactorStepFunction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTessellationFactorStepFunction_, tessellationFactorStepFunction);
    }

    tessellationOutputWindingOrder :: (self: *MTLRenderPipelineDescriptor) -> MTLWinding {
        func :: #type (obj: *void, selector: *void) -> MTLWinding #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tessellationOutputWindingOrder);
    }

    setTessellationOutputWindingOrder_ :: (self: *MTLRenderPipelineDescriptor, tessellationOutputWindingOrder: MTLWinding) -> void {
        func :: #type (obj: *void, selector: *void, tessellationOutputWindingOrder: MTLWinding) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTessellationOutputWindingOrder_, tessellationOutputWindingOrder);
    }

    vertexBuffers :: (self: *MTLRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray {
        func :: #type (obj: *void, selector: *void) -> *MTLPipelineBufferDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexBuffers);
    }

    fragmentBuffers :: (self: *MTLRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray {
        func :: #type (obj: *void, selector: *void) -> *MTLPipelineBufferDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentBuffers);
    }

    supportIndirectCommandBuffers :: (self: *MTLRenderPipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportIndirectCommandBuffers);
    }

    setSupportIndirectCommandBuffers_ :: (self: *MTLRenderPipelineDescriptor, supportIndirectCommandBuffers: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, supportIndirectCommandBuffers: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportIndirectCommandBuffers_, supportIndirectCommandBuffers);
    }

    binaryArchives :: (self: *MTLRenderPipelineDescriptor) -> *NSArray(*MTLBinaryArchive) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLBinaryArchive) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.binaryArchives);
    }

    setBinaryArchives_ :: (self: *MTLRenderPipelineDescriptor, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void {
        func :: #type (obj: *void, selector: *void, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBinaryArchives_, binaryArchives);
    }

    vertexPreloadedLibraries :: (self: *MTLRenderPipelineDescriptor) -> *NSArray(*MTLDynamicLibrary) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLDynamicLibrary) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexPreloadedLibraries);
    }

    setVertexPreloadedLibraries_ :: (self: *MTLRenderPipelineDescriptor, vertexPreloadedLibraries: *NSArray(*MTLDynamicLibrary)) -> void {
        func :: #type (obj: *void, selector: *void, vertexPreloadedLibraries: *NSArray(*MTLDynamicLibrary)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexPreloadedLibraries_, vertexPreloadedLibraries);
    }

    fragmentPreloadedLibraries :: (self: *MTLRenderPipelineDescriptor) -> *NSArray(*MTLDynamicLibrary) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLDynamicLibrary) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentPreloadedLibraries);
    }

    setFragmentPreloadedLibraries_ :: (self: *MTLRenderPipelineDescriptor, fragmentPreloadedLibraries: *NSArray(*MTLDynamicLibrary)) -> void {
        func :: #type (obj: *void, selector: *void, fragmentPreloadedLibraries: *NSArray(*MTLDynamicLibrary)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentPreloadedLibraries_, fragmentPreloadedLibraries);
    }

    vertexLinkedFunctions :: (self: *MTLRenderPipelineDescriptor) -> *MTLLinkedFunctions {
        func :: #type (obj: *void, selector: *void) -> *MTLLinkedFunctions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexLinkedFunctions);
    }

    setVertexLinkedFunctions_ :: (self: *MTLRenderPipelineDescriptor, vertexLinkedFunctions: *MTLLinkedFunctions) -> void {
        func :: #type (obj: *void, selector: *void, vertexLinkedFunctions: *MTLLinkedFunctions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexLinkedFunctions_, vertexLinkedFunctions);
    }

    fragmentLinkedFunctions :: (self: *MTLRenderPipelineDescriptor) -> *MTLLinkedFunctions {
        func :: #type (obj: *void, selector: *void) -> *MTLLinkedFunctions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentLinkedFunctions);
    }

    setFragmentLinkedFunctions_ :: (self: *MTLRenderPipelineDescriptor, fragmentLinkedFunctions: *MTLLinkedFunctions) -> void {
        func :: #type (obj: *void, selector: *void, fragmentLinkedFunctions: *MTLLinkedFunctions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentLinkedFunctions_, fragmentLinkedFunctions);
    }

    supportAddingVertexBinaryFunctions :: (self: *MTLRenderPipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportAddingVertexBinaryFunctions);
    }

    setSupportAddingVertexBinaryFunctions_ :: (self: *MTLRenderPipelineDescriptor, supportAddingVertexBinaryFunctions: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, supportAddingVertexBinaryFunctions: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportAddingVertexBinaryFunctions_, supportAddingVertexBinaryFunctions);
    }

    supportAddingFragmentBinaryFunctions :: (self: *MTLRenderPipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportAddingFragmentBinaryFunctions);
    }

    setSupportAddingFragmentBinaryFunctions_ :: (self: *MTLRenderPipelineDescriptor, supportAddingFragmentBinaryFunctions: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, supportAddingFragmentBinaryFunctions: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportAddingFragmentBinaryFunctions_, supportAddingFragmentBinaryFunctions);
    }

    maxVertexCallStackDepth :: (self: *MTLRenderPipelineDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxVertexCallStackDepth);
    }

    setMaxVertexCallStackDepth_ :: (self: *MTLRenderPipelineDescriptor, maxVertexCallStackDepth: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxVertexCallStackDepth: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxVertexCallStackDepth_, maxVertexCallStackDepth);
    }

    maxFragmentCallStackDepth :: (self: *MTLRenderPipelineDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxFragmentCallStackDepth);
    }

    setMaxFragmentCallStackDepth_ :: (self: *MTLRenderPipelineDescriptor, maxFragmentCallStackDepth: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxFragmentCallStackDepth: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxFragmentCallStackDepth_, maxFragmentCallStackDepth);
    }

    shaderValidation :: (self: *MTLRenderPipelineDescriptor) -> MTLShaderValidation {
        func :: #type (obj: *void, selector: *void) -> MTLShaderValidation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.shaderValidation);
    }

    setShaderValidation_ :: (self: *MTLRenderPipelineDescriptor, shaderValidation: MTLShaderValidation) -> void {
        func :: #type (obj: *void, selector: *void, shaderValidation: MTLShaderValidation) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setShaderValidation_, shaderValidation);
    }

}

MTLRenderPipelineFunctionsDescriptor :: struct {
    vertexAdditionalBinaryFunctions :: (self: *MTLRenderPipelineFunctionsDescriptor) -> *NSArray(*MTLFunction) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLFunction) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexAdditionalBinaryFunctions);
    }

    setVertexAdditionalBinaryFunctions_ :: (self: *MTLRenderPipelineFunctionsDescriptor, vertexAdditionalBinaryFunctions: *NSArray(*MTLFunction)) -> void {
        func :: #type (obj: *void, selector: *void, vertexAdditionalBinaryFunctions: *NSArray(*MTLFunction)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexAdditionalBinaryFunctions_, vertexAdditionalBinaryFunctions);
    }

    fragmentAdditionalBinaryFunctions :: (self: *MTLRenderPipelineFunctionsDescriptor) -> *NSArray(*MTLFunction) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLFunction) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentAdditionalBinaryFunctions);
    }

    setFragmentAdditionalBinaryFunctions_ :: (self: *MTLRenderPipelineFunctionsDescriptor, fragmentAdditionalBinaryFunctions: *NSArray(*MTLFunction)) -> void {
        func :: #type (obj: *void, selector: *void, fragmentAdditionalBinaryFunctions: *NSArray(*MTLFunction)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentAdditionalBinaryFunctions_, fragmentAdditionalBinaryFunctions);
    }

    tileAdditionalBinaryFunctions :: (self: *MTLRenderPipelineFunctionsDescriptor) -> *NSArray(*MTLFunction) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLFunction) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileAdditionalBinaryFunctions);
    }

    setTileAdditionalBinaryFunctions_ :: (self: *MTLRenderPipelineFunctionsDescriptor, tileAdditionalBinaryFunctions: *NSArray(*MTLFunction)) -> void {
        func :: #type (obj: *void, selector: *void, tileAdditionalBinaryFunctions: *NSArray(*MTLFunction)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileAdditionalBinaryFunctions_, tileAdditionalBinaryFunctions);
    }

}

MTLRenderPipelineColorAttachmentDescriptorArray :: struct {
    objectAtIndexedSubscript_ :: (self: *MTLRenderPipelineColorAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLRenderPipelineColorAttachmentDescriptor {
        func :: #type (obj: *void, selector: *void, attachmentIndex: NSUInteger) -> *MTLRenderPipelineColorAttachmentDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, attachmentIndex);
    }

    setObject_atIndexedSubscript_ :: (self: *MTLRenderPipelineColorAttachmentDescriptorArray, attachment: *MTLRenderPipelineColorAttachmentDescriptor, attachmentIndex: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, attachment: *MTLRenderPipelineColorAttachmentDescriptor, attachmentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, attachment, attachmentIndex);
    }

}

MTLTileRenderPipelineColorAttachmentDescriptor :: struct {
    pixelFormat :: (self: *MTLTileRenderPipelineColorAttachmentDescriptor) -> MTLPixelFormat {
        func :: #type (obj: *void, selector: *void) -> MTLPixelFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pixelFormat);
    }

    setPixelFormat_ :: (self: *MTLTileRenderPipelineColorAttachmentDescriptor, pixelFormat: MTLPixelFormat) -> void {
        func :: #type (obj: *void, selector: *void, pixelFormat: MTLPixelFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPixelFormat_, pixelFormat);
    }

}

MTLTileRenderPipelineColorAttachmentDescriptorArray :: struct {
    objectAtIndexedSubscript_ :: (self: *MTLTileRenderPipelineColorAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLTileRenderPipelineColorAttachmentDescriptor {
        func :: #type (obj: *void, selector: *void, attachmentIndex: NSUInteger) -> *MTLTileRenderPipelineColorAttachmentDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, attachmentIndex);
    }

    setObject_atIndexedSubscript_ :: (self: *MTLTileRenderPipelineColorAttachmentDescriptorArray, attachment: *MTLTileRenderPipelineColorAttachmentDescriptor, attachmentIndex: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, attachment: *MTLTileRenderPipelineColorAttachmentDescriptor, attachmentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, attachment, attachmentIndex);
    }

}

MTLTileRenderPipelineDescriptor :: struct {
    reset :: (self: *MTLTileRenderPipelineDescriptor) -> void {
        func :: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

    label :: (self: *MTLTileRenderPipelineDescriptor) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLTileRenderPipelineDescriptor, label: *NSString) -> void {
        func :: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

    tileFunction :: (self: *MTLTileRenderPipelineDescriptor) -> *MTLFunction {
        func :: #type (obj: *void, selector: *void) -> *MTLFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileFunction);
    }

    setTileFunction_ :: (self: *MTLTileRenderPipelineDescriptor, tileFunction: *MTLFunction) -> void {
        func :: #type (obj: *void, selector: *void, tileFunction: *MTLFunction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileFunction_, tileFunction);
    }

    rasterSampleCount :: (self: *MTLTileRenderPipelineDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.rasterSampleCount);
    }

    setRasterSampleCount_ :: (self: *MTLTileRenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, rasterSampleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRasterSampleCount_, rasterSampleCount);
    }

    colorAttachments :: (self: *MTLTileRenderPipelineDescriptor) -> *MTLTileRenderPipelineColorAttachmentDescriptorArray {
        func :: #type (obj: *void, selector: *void) -> *MTLTileRenderPipelineColorAttachmentDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.colorAttachments);
    }

    threadgroupSizeMatchesTileSize :: (self: *MTLTileRenderPipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.threadgroupSizeMatchesTileSize);
    }

    setThreadgroupSizeMatchesTileSize_ :: (self: *MTLTileRenderPipelineDescriptor, threadgroupSizeMatchesTileSize: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, threadgroupSizeMatchesTileSize: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setThreadgroupSizeMatchesTileSize_, threadgroupSizeMatchesTileSize);
    }

    tileBuffers :: (self: *MTLTileRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray {
        func :: #type (obj: *void, selector: *void) -> *MTLPipelineBufferDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileBuffers);
    }

    maxTotalThreadsPerThreadgroup :: (self: *MTLTileRenderPipelineDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadsPerThreadgroup);
    }

    setMaxTotalThreadsPerThreadgroup_ :: (self: *MTLTileRenderPipelineDescriptor, maxTotalThreadsPerThreadgroup: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxTotalThreadsPerThreadgroup: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxTotalThreadsPerThreadgroup_, maxTotalThreadsPerThreadgroup);
    }

    binaryArchives :: (self: *MTLTileRenderPipelineDescriptor) -> *NSArray(*MTLBinaryArchive) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLBinaryArchive) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.binaryArchives);
    }

    setBinaryArchives_ :: (self: *MTLTileRenderPipelineDescriptor, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void {
        func :: #type (obj: *void, selector: *void, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBinaryArchives_, binaryArchives);
    }

    preloadedLibraries :: (self: *MTLTileRenderPipelineDescriptor) -> *NSArray(*MTLDynamicLibrary) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLDynamicLibrary) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.preloadedLibraries);
    }

    setPreloadedLibraries_ :: (self: *MTLTileRenderPipelineDescriptor, preloadedLibraries: *NSArray(*MTLDynamicLibrary)) -> void {
        func :: #type (obj: *void, selector: *void, preloadedLibraries: *NSArray(*MTLDynamicLibrary)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPreloadedLibraries_, preloadedLibraries);
    }

    linkedFunctions :: (self: *MTLTileRenderPipelineDescriptor) -> *MTLLinkedFunctions {
        func :: #type (obj: *void, selector: *void) -> *MTLLinkedFunctions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.linkedFunctions);
    }

    setLinkedFunctions_ :: (self: *MTLTileRenderPipelineDescriptor, linkedFunctions: *MTLLinkedFunctions) -> void {
        func :: #type (obj: *void, selector: *void, linkedFunctions: *MTLLinkedFunctions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLinkedFunctions_, linkedFunctions);
    }

    supportAddingBinaryFunctions :: (self: *MTLTileRenderPipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportAddingBinaryFunctions);
    }

    setSupportAddingBinaryFunctions_ :: (self: *MTLTileRenderPipelineDescriptor, supportAddingBinaryFunctions: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, supportAddingBinaryFunctions: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportAddingBinaryFunctions_, supportAddingBinaryFunctions);
    }

    maxCallStackDepth :: (self: *MTLTileRenderPipelineDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxCallStackDepth);
    }

    setMaxCallStackDepth_ :: (self: *MTLTileRenderPipelineDescriptor, maxCallStackDepth: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxCallStackDepth: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxCallStackDepth_, maxCallStackDepth);
    }

    shaderValidation :: (self: *MTLTileRenderPipelineDescriptor) -> MTLShaderValidation {
        func :: #type (obj: *void, selector: *void) -> MTLShaderValidation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.shaderValidation);
    }

    setShaderValidation_ :: (self: *MTLTileRenderPipelineDescriptor, shaderValidation: MTLShaderValidation) -> void {
        func :: #type (obj: *void, selector: *void, shaderValidation: MTLShaderValidation) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setShaderValidation_, shaderValidation);
    }

    requiredThreadsPerThreadgroup :: (self: *MTLTileRenderPipelineDescriptor) -> MTLSize {
        func :: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.requiredThreadsPerThreadgroup);
    }

    setRequiredThreadsPerThreadgroup_ :: (self: *MTLTileRenderPipelineDescriptor, requiredThreadsPerThreadgroup: MTLSize) -> void {
        func :: #type (obj: *void, selector: *void, requiredThreadsPerThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRequiredThreadsPerThreadgroup_, requiredThreadsPerThreadgroup);
    }

}

MTLMeshRenderPipelineDescriptor :: struct {
    reset :: (self: *MTLMeshRenderPipelineDescriptor) -> void {
        func :: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

    label :: (self: *MTLMeshRenderPipelineDescriptor) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLMeshRenderPipelineDescriptor, label: *NSString) -> void {
        func :: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

    objectFunction :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLFunction {
        func :: #type (obj: *void, selector: *void) -> *MTLFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectFunction);
    }

    setObjectFunction_ :: (self: *MTLMeshRenderPipelineDescriptor, objectFunction: *MTLFunction) -> void {
        func :: #type (obj: *void, selector: *void, objectFunction: *MTLFunction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectFunction_, objectFunction);
    }

    meshFunction :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLFunction {
        func :: #type (obj: *void, selector: *void) -> *MTLFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.meshFunction);
    }

    setMeshFunction_ :: (self: *MTLMeshRenderPipelineDescriptor, meshFunction: *MTLFunction) -> void {
        func :: #type (obj: *void, selector: *void, meshFunction: *MTLFunction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshFunction_, meshFunction);
    }

    fragmentFunction :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLFunction {
        func :: #type (obj: *void, selector: *void) -> *MTLFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentFunction);
    }

    setFragmentFunction_ :: (self: *MTLMeshRenderPipelineDescriptor, fragmentFunction: *MTLFunction) -> void {
        func :: #type (obj: *void, selector: *void, fragmentFunction: *MTLFunction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentFunction_, fragmentFunction);
    }

    maxTotalThreadsPerObjectThreadgroup :: (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadsPerObjectThreadgroup);
    }

    setMaxTotalThreadsPerObjectThreadgroup_ :: (self: *MTLMeshRenderPipelineDescriptor, maxTotalThreadsPerObjectThreadgroup: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxTotalThreadsPerObjectThreadgroup: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxTotalThreadsPerObjectThreadgroup_, maxTotalThreadsPerObjectThreadgroup);
    }

    maxTotalThreadsPerMeshThreadgroup :: (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadsPerMeshThreadgroup);
    }

    setMaxTotalThreadsPerMeshThreadgroup_ :: (self: *MTLMeshRenderPipelineDescriptor, maxTotalThreadsPerMeshThreadgroup: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxTotalThreadsPerMeshThreadgroup: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxTotalThreadsPerMeshThreadgroup_, maxTotalThreadsPerMeshThreadgroup);
    }

    objectThreadgroupSizeIsMultipleOfThreadExecutionWidth :: (self: *MTLMeshRenderPipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectThreadgroupSizeIsMultipleOfThreadExecutionWidth);
    }

    setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth_ :: (self: *MTLMeshRenderPipelineDescriptor, objectThreadgroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, objectThreadgroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth_, objectThreadgroupSizeIsMultipleOfThreadExecutionWidth);
    }

    meshThreadgroupSizeIsMultipleOfThreadExecutionWidth :: (self: *MTLMeshRenderPipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.meshThreadgroupSizeIsMultipleOfThreadExecutionWidth);
    }

    setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth_ :: (self: *MTLMeshRenderPipelineDescriptor, meshThreadgroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, meshThreadgroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth_, meshThreadgroupSizeIsMultipleOfThreadExecutionWidth);
    }

    payloadMemoryLength :: (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.payloadMemoryLength);
    }

    setPayloadMemoryLength_ :: (self: *MTLMeshRenderPipelineDescriptor, payloadMemoryLength: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, payloadMemoryLength: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPayloadMemoryLength_, payloadMemoryLength);
    }

    maxTotalThreadgroupsPerMeshGrid :: (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadgroupsPerMeshGrid);
    }

    setMaxTotalThreadgroupsPerMeshGrid_ :: (self: *MTLMeshRenderPipelineDescriptor, maxTotalThreadgroupsPerMeshGrid: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxTotalThreadgroupsPerMeshGrid: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxTotalThreadgroupsPerMeshGrid_, maxTotalThreadgroupsPerMeshGrid);
    }

    objectBuffers :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray {
        func :: #type (obj: *void, selector: *void) -> *MTLPipelineBufferDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectBuffers);
    }

    meshBuffers :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray {
        func :: #type (obj: *void, selector: *void) -> *MTLPipelineBufferDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.meshBuffers);
    }

    fragmentBuffers :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray {
        func :: #type (obj: *void, selector: *void) -> *MTLPipelineBufferDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentBuffers);
    }

    rasterSampleCount :: (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.rasterSampleCount);
    }

    setRasterSampleCount_ :: (self: *MTLMeshRenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, rasterSampleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRasterSampleCount_, rasterSampleCount);
    }

    isAlphaToCoverageEnabled :: (self: *MTLMeshRenderPipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isAlphaToCoverageEnabled);
    }

    setAlphaToCoverageEnabled_ :: (self: *MTLMeshRenderPipelineDescriptor, alphaToCoverageEnabled: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, alphaToCoverageEnabled: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAlphaToCoverageEnabled_, alphaToCoverageEnabled);
    }

    isAlphaToOneEnabled :: (self: *MTLMeshRenderPipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isAlphaToOneEnabled);
    }

    setAlphaToOneEnabled_ :: (self: *MTLMeshRenderPipelineDescriptor, alphaToOneEnabled: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, alphaToOneEnabled: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAlphaToOneEnabled_, alphaToOneEnabled);
    }

    isRasterizationEnabled :: (self: *MTLMeshRenderPipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isRasterizationEnabled);
    }

    setRasterizationEnabled_ :: (self: *MTLMeshRenderPipelineDescriptor, rasterizationEnabled: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, rasterizationEnabled: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRasterizationEnabled_, rasterizationEnabled);
    }

    maxVertexAmplificationCount :: (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxVertexAmplificationCount);
    }

    setMaxVertexAmplificationCount_ :: (self: *MTLMeshRenderPipelineDescriptor, maxVertexAmplificationCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxVertexAmplificationCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxVertexAmplificationCount_, maxVertexAmplificationCount);
    }

    colorAttachments :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLRenderPipelineColorAttachmentDescriptorArray {
        func :: #type (obj: *void, selector: *void) -> *MTLRenderPipelineColorAttachmentDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.colorAttachments);
    }

    depthAttachmentPixelFormat :: (self: *MTLMeshRenderPipelineDescriptor) -> MTLPixelFormat {
        func :: #type (obj: *void, selector: *void) -> MTLPixelFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.depthAttachmentPixelFormat);
    }

    setDepthAttachmentPixelFormat_ :: (self: *MTLMeshRenderPipelineDescriptor, depthAttachmentPixelFormat: MTLPixelFormat) -> void {
        func :: #type (obj: *void, selector: *void, depthAttachmentPixelFormat: MTLPixelFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthAttachmentPixelFormat_, depthAttachmentPixelFormat);
    }

    stencilAttachmentPixelFormat :: (self: *MTLMeshRenderPipelineDescriptor) -> MTLPixelFormat {
        func :: #type (obj: *void, selector: *void) -> MTLPixelFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stencilAttachmentPixelFormat);
    }

    setStencilAttachmentPixelFormat_ :: (self: *MTLMeshRenderPipelineDescriptor, stencilAttachmentPixelFormat: MTLPixelFormat) -> void {
        func :: #type (obj: *void, selector: *void, stencilAttachmentPixelFormat: MTLPixelFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilAttachmentPixelFormat_, stencilAttachmentPixelFormat);
    }

    supportIndirectCommandBuffers :: (self: *MTLMeshRenderPipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportIndirectCommandBuffers);
    }

    setSupportIndirectCommandBuffers_ :: (self: *MTLMeshRenderPipelineDescriptor, supportIndirectCommandBuffers: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, supportIndirectCommandBuffers: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportIndirectCommandBuffers_, supportIndirectCommandBuffers);
    }

    binaryArchives :: (self: *MTLMeshRenderPipelineDescriptor) -> *NSArray(*MTLBinaryArchive) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLBinaryArchive) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.binaryArchives);
    }

    setBinaryArchives_ :: (self: *MTLMeshRenderPipelineDescriptor, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void {
        func :: #type (obj: *void, selector: *void, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBinaryArchives_, binaryArchives);
    }

    objectLinkedFunctions :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLLinkedFunctions {
        func :: #type (obj: *void, selector: *void) -> *MTLLinkedFunctions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectLinkedFunctions);
    }

    setObjectLinkedFunctions_ :: (self: *MTLMeshRenderPipelineDescriptor, objectLinkedFunctions: *MTLLinkedFunctions) -> void {
        func :: #type (obj: *void, selector: *void, objectLinkedFunctions: *MTLLinkedFunctions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectLinkedFunctions_, objectLinkedFunctions);
    }

    meshLinkedFunctions :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLLinkedFunctions {
        func :: #type (obj: *void, selector: *void) -> *MTLLinkedFunctions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.meshLinkedFunctions);
    }

    setMeshLinkedFunctions_ :: (self: *MTLMeshRenderPipelineDescriptor, meshLinkedFunctions: *MTLLinkedFunctions) -> void {
        func :: #type (obj: *void, selector: *void, meshLinkedFunctions: *MTLLinkedFunctions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshLinkedFunctions_, meshLinkedFunctions);
    }

    fragmentLinkedFunctions :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLLinkedFunctions {
        func :: #type (obj: *void, selector: *void) -> *MTLLinkedFunctions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentLinkedFunctions);
    }

    setFragmentLinkedFunctions_ :: (self: *MTLMeshRenderPipelineDescriptor, fragmentLinkedFunctions: *MTLLinkedFunctions) -> void {
        func :: #type (obj: *void, selector: *void, fragmentLinkedFunctions: *MTLLinkedFunctions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentLinkedFunctions_, fragmentLinkedFunctions);
    }

    shaderValidation :: (self: *MTLMeshRenderPipelineDescriptor) -> MTLShaderValidation {
        func :: #type (obj: *void, selector: *void) -> MTLShaderValidation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.shaderValidation);
    }

    setShaderValidation_ :: (self: *MTLMeshRenderPipelineDescriptor, shaderValidation: MTLShaderValidation) -> void {
        func :: #type (obj: *void, selector: *void, shaderValidation: MTLShaderValidation) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setShaderValidation_, shaderValidation);
    }

    requiredThreadsPerObjectThreadgroup :: (self: *MTLMeshRenderPipelineDescriptor) -> MTLSize {
        func :: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.requiredThreadsPerObjectThreadgroup);
    }

    setRequiredThreadsPerObjectThreadgroup_ :: (self: *MTLMeshRenderPipelineDescriptor, requiredThreadsPerObjectThreadgroup: MTLSize) -> void {
        func :: #type (obj: *void, selector: *void, requiredThreadsPerObjectThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRequiredThreadsPerObjectThreadgroup_, requiredThreadsPerObjectThreadgroup);
    }

    requiredThreadsPerMeshThreadgroup :: (self: *MTLMeshRenderPipelineDescriptor) -> MTLSize {
        func :: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.requiredThreadsPerMeshThreadgroup);
    }

    setRequiredThreadsPerMeshThreadgroup_ :: (self: *MTLMeshRenderPipelineDescriptor, requiredThreadsPerMeshThreadgroup: MTLSize) -> void {
        func :: #type (obj: *void, selector: *void, requiredThreadsPerMeshThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRequiredThreadsPerMeshThreadgroup_, requiredThreadsPerMeshThreadgroup);
    }

}

MTLSamplerDescriptor :: struct {
    minFilter :: (self: *MTLSamplerDescriptor) -> MTLSamplerMinMagFilter {
        func :: #type (obj: *void, selector: *void) -> MTLSamplerMinMagFilter #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.minFilter);
    }

    setMinFilter_ :: (self: *MTLSamplerDescriptor, minFilter: MTLSamplerMinMagFilter) -> void {
        func :: #type (obj: *void, selector: *void, minFilter: MTLSamplerMinMagFilter) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMinFilter_, minFilter);
    }

    magFilter :: (self: *MTLSamplerDescriptor) -> MTLSamplerMinMagFilter {
        func :: #type (obj: *void, selector: *void) -> MTLSamplerMinMagFilter #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.magFilter);
    }

    setMagFilter_ :: (self: *MTLSamplerDescriptor, magFilter: MTLSamplerMinMagFilter) -> void {
        func :: #type (obj: *void, selector: *void, magFilter: MTLSamplerMinMagFilter) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMagFilter_, magFilter);
    }

    mipFilter :: (self: *MTLSamplerDescriptor) -> MTLSamplerMipFilter {
        func :: #type (obj: *void, selector: *void) -> MTLSamplerMipFilter #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.mipFilter);
    }

    setMipFilter_ :: (self: *MTLSamplerDescriptor, mipFilter: MTLSamplerMipFilter) -> void {
        func :: #type (obj: *void, selector: *void, mipFilter: MTLSamplerMipFilter) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMipFilter_, mipFilter);
    }

    maxAnisotropy :: (self: *MTLSamplerDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxAnisotropy);
    }

    setMaxAnisotropy_ :: (self: *MTLSamplerDescriptor, maxAnisotropy: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxAnisotropy: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxAnisotropy_, maxAnisotropy);
    }

    sAddressMode :: (self: *MTLSamplerDescriptor) -> MTLSamplerAddressMode {
        func :: #type (obj: *void, selector: *void) -> MTLSamplerAddressMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sAddressMode);
    }

    setSAddressMode_ :: (self: *MTLSamplerDescriptor, sAddressMode: MTLSamplerAddressMode) -> void {
        func :: #type (obj: *void, selector: *void, sAddressMode: MTLSamplerAddressMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSAddressMode_, sAddressMode);
    }

    tAddressMode :: (self: *MTLSamplerDescriptor) -> MTLSamplerAddressMode {
        func :: #type (obj: *void, selector: *void) -> MTLSamplerAddressMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tAddressMode);
    }

    setTAddressMode_ :: (self: *MTLSamplerDescriptor, tAddressMode: MTLSamplerAddressMode) -> void {
        func :: #type (obj: *void, selector: *void, tAddressMode: MTLSamplerAddressMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTAddressMode_, tAddressMode);
    }

    rAddressMode :: (self: *MTLSamplerDescriptor) -> MTLSamplerAddressMode {
        func :: #type (obj: *void, selector: *void) -> MTLSamplerAddressMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.rAddressMode);
    }

    setRAddressMode_ :: (self: *MTLSamplerDescriptor, rAddressMode: MTLSamplerAddressMode) -> void {
        func :: #type (obj: *void, selector: *void, rAddressMode: MTLSamplerAddressMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRAddressMode_, rAddressMode);
    }

    borderColor :: (self: *MTLSamplerDescriptor) -> MTLSamplerBorderColor {
        func :: #type (obj: *void, selector: *void) -> MTLSamplerBorderColor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.borderColor);
    }

    setBorderColor_ :: (self: *MTLSamplerDescriptor, borderColor: MTLSamplerBorderColor) -> void {
        func :: #type (obj: *void, selector: *void, borderColor: MTLSamplerBorderColor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBorderColor_, borderColor);
    }

    reductionMode :: (self: *MTLSamplerDescriptor) -> MTLSamplerReductionMode {
        func :: #type (obj: *void, selector: *void) -> MTLSamplerReductionMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reductionMode);
    }

    setReductionMode_ :: (self: *MTLSamplerDescriptor, reductionMode: MTLSamplerReductionMode) -> void {
        func :: #type (obj: *void, selector: *void, reductionMode: MTLSamplerReductionMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setReductionMode_, reductionMode);
    }

    normalizedCoordinates :: (self: *MTLSamplerDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.normalizedCoordinates);
    }

    setNormalizedCoordinates_ :: (self: *MTLSamplerDescriptor, normalizedCoordinates: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, normalizedCoordinates: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setNormalizedCoordinates_, normalizedCoordinates);
    }

    lodMinClamp :: (self: *MTLSamplerDescriptor) -> float32 {
        func :: #type (obj: *void, selector: *void) -> float32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.lodMinClamp);
    }

    setLodMinClamp_ :: (self: *MTLSamplerDescriptor, lodMinClamp: float32) -> void {
        func :: #type (obj: *void, selector: *void, lodMinClamp: float32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLodMinClamp_, lodMinClamp);
    }

    lodMaxClamp :: (self: *MTLSamplerDescriptor) -> float32 {
        func :: #type (obj: *void, selector: *void) -> float32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.lodMaxClamp);
    }

    setLodMaxClamp_ :: (self: *MTLSamplerDescriptor, lodMaxClamp: float32) -> void {
        func :: #type (obj: *void, selector: *void, lodMaxClamp: float32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLodMaxClamp_, lodMaxClamp);
    }

    lodAverage :: (self: *MTLSamplerDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.lodAverage);
    }

    setLodAverage_ :: (self: *MTLSamplerDescriptor, lodAverage: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, lodAverage: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLodAverage_, lodAverage);
    }

    lodBias :: (self: *MTLSamplerDescriptor) -> float32 {
        func :: #type (obj: *void, selector: *void) -> float32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.lodBias);
    }

    setLodBias_ :: (self: *MTLSamplerDescriptor, lodBias: float32) -> void {
        func :: #type (obj: *void, selector: *void, lodBias: float32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLodBias_, lodBias);
    }

    compareFunction :: (self: *MTLSamplerDescriptor) -> MTLCompareFunction {
        func :: #type (obj: *void, selector: *void) -> MTLCompareFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.compareFunction);
    }

    setCompareFunction_ :: (self: *MTLSamplerDescriptor, compareFunction: MTLCompareFunction) -> void {
        func :: #type (obj: *void, selector: *void, compareFunction: MTLCompareFunction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCompareFunction_, compareFunction);
    }

    supportArgumentBuffers :: (self: *MTLSamplerDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportArgumentBuffers);
    }

    setSupportArgumentBuffers_ :: (self: *MTLSamplerDescriptor, supportArgumentBuffers: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, supportArgumentBuffers: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportArgumentBuffers_, supportArgumentBuffers);
    }

    label :: (self: *MTLSamplerDescriptor) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLSamplerDescriptor, label: *NSString) -> void {
        func :: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

}

MTLAccelerationStructureDescriptor :: struct {
    usage :: (self: *MTLAccelerationStructureDescriptor) -> MTLAccelerationStructureUsage {
        func :: #type (obj: *void, selector: *void) -> MTLAccelerationStructureUsage #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.usage);
    }

    setUsage_ :: (self: *MTLAccelerationStructureDescriptor, usage: MTLAccelerationStructureUsage) -> void {
        func :: #type (obj: *void, selector: *void, usage: MTLAccelerationStructureUsage) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setUsage_, usage);
    }

}

MTLAccelerationStructureGeometryDescriptor :: struct {
    intersectionFunctionTableOffset :: (self: *MTLAccelerationStructureGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.intersectionFunctionTableOffset);
    }

    setIntersectionFunctionTableOffset_ :: (self: *MTLAccelerationStructureGeometryDescriptor, intersectionFunctionTableOffset: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, intersectionFunctionTableOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIntersectionFunctionTableOffset_, intersectionFunctionTableOffset);
    }

    opaque :: (self: *MTLAccelerationStructureGeometryDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.opaque);
    }

    setOpaque_ :: (self: *MTLAccelerationStructureGeometryDescriptor, opaque: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, opaque: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOpaque_, opaque);
    }

    allowDuplicateIntersectionFunctionInvocation :: (self: *MTLAccelerationStructureGeometryDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.allowDuplicateIntersectionFunctionInvocation);
    }

    setAllowDuplicateIntersectionFunctionInvocation_ :: (self: *MTLAccelerationStructureGeometryDescriptor, allowDuplicateIntersectionFunctionInvocation: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, allowDuplicateIntersectionFunctionInvocation: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAllowDuplicateIntersectionFunctionInvocation_, allowDuplicateIntersectionFunctionInvocation);
    }

    label :: (self: *MTLAccelerationStructureGeometryDescriptor) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLAccelerationStructureGeometryDescriptor, label: *NSString) -> void {
        func :: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

    primitiveDataBuffer :: (self: *MTLAccelerationStructureGeometryDescriptor) -> *MTLBuffer {
        func :: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.primitiveDataBuffer);
    }

    setPrimitiveDataBuffer_ :: (self: *MTLAccelerationStructureGeometryDescriptor, primitiveDataBuffer: *MTLBuffer) -> void {
        func :: #type (obj: *void, selector: *void, primitiveDataBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPrimitiveDataBuffer_, primitiveDataBuffer);
    }

    primitiveDataBufferOffset :: (self: *MTLAccelerationStructureGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.primitiveDataBufferOffset);
    }

    setPrimitiveDataBufferOffset_ :: (self: *MTLAccelerationStructureGeometryDescriptor, primitiveDataBufferOffset: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, primitiveDataBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPrimitiveDataBufferOffset_, primitiveDataBufferOffset);
    }

    primitiveDataStride :: (self: *MTLAccelerationStructureGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.primitiveDataStride);
    }

    setPrimitiveDataStride_ :: (self: *MTLAccelerationStructureGeometryDescriptor, primitiveDataStride: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, primitiveDataStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPrimitiveDataStride_, primitiveDataStride);
    }

    primitiveDataElementSize :: (self: *MTLAccelerationStructureGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.primitiveDataElementSize);
    }

    setPrimitiveDataElementSize_ :: (self: *MTLAccelerationStructureGeometryDescriptor, primitiveDataElementSize: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, primitiveDataElementSize: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPrimitiveDataElementSize_, primitiveDataElementSize);
    }

}

MTLPrimitiveAccelerationStructureDescriptor :: struct {
    descriptor :: () -> *MTLPrimitiveAccelerationStructureDescriptor {
        func: #type (obj: *void, selector: *void) -> instancetype #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLPrimitiveAccelerationStructureDescriptor", __sel.descriptor);
    }

    geometryDescriptors :: (self: *MTLPrimitiveAccelerationStructureDescriptor) -> *NSArray(*MTLAccelerationStructureGeometryDescriptor) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLAccelerationStructureGeometryDescriptor) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.geometryDescriptors);
    }

    setGeometryDescriptors_ :: (self: *MTLPrimitiveAccelerationStructureDescriptor, geometryDescriptors: *NSArray(*MTLAccelerationStructureGeometryDescriptor)) -> void {
        func :: #type (obj: *void, selector: *void, geometryDescriptors: *NSArray(*MTLAccelerationStructureGeometryDescriptor)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setGeometryDescriptors_, geometryDescriptors);
    }

    motionStartBorderMode :: (self: *MTLPrimitiveAccelerationStructureDescriptor) -> MTLMotionBorderMode {
        func :: #type (obj: *void, selector: *void) -> MTLMotionBorderMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionStartBorderMode);
    }

    setMotionStartBorderMode_ :: (self: *MTLPrimitiveAccelerationStructureDescriptor, motionStartBorderMode: MTLMotionBorderMode) -> void {
        func :: #type (obj: *void, selector: *void, motionStartBorderMode: MTLMotionBorderMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionStartBorderMode_, motionStartBorderMode);
    }

    motionEndBorderMode :: (self: *MTLPrimitiveAccelerationStructureDescriptor) -> MTLMotionBorderMode {
        func :: #type (obj: *void, selector: *void) -> MTLMotionBorderMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionEndBorderMode);
    }

    setMotionEndBorderMode_ :: (self: *MTLPrimitiveAccelerationStructureDescriptor, motionEndBorderMode: MTLMotionBorderMode) -> void {
        func :: #type (obj: *void, selector: *void, motionEndBorderMode: MTLMotionBorderMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionEndBorderMode_, motionEndBorderMode);
    }

    motionStartTime :: (self: *MTLPrimitiveAccelerationStructureDescriptor) -> float32 {
        func :: #type (obj: *void, selector: *void) -> float32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionStartTime);
    }

    setMotionStartTime_ :: (self: *MTLPrimitiveAccelerationStructureDescriptor, motionStartTime: float32) -> void {
        func :: #type (obj: *void, selector: *void, motionStartTime: float32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionStartTime_, motionStartTime);
    }

    motionEndTime :: (self: *MTLPrimitiveAccelerationStructureDescriptor) -> float32 {
        func :: #type (obj: *void, selector: *void) -> float32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionEndTime);
    }

    setMotionEndTime_ :: (self: *MTLPrimitiveAccelerationStructureDescriptor, motionEndTime: float32) -> void {
        func :: #type (obj: *void, selector: *void, motionEndTime: float32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionEndTime_, motionEndTime);
    }

    motionKeyframeCount :: (self: *MTLPrimitiveAccelerationStructureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionKeyframeCount);
    }

    setMotionKeyframeCount_ :: (self: *MTLPrimitiveAccelerationStructureDescriptor, motionKeyframeCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, motionKeyframeCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionKeyframeCount_, motionKeyframeCount);
    }

}

MTLAccelerationStructureTriangleGeometryDescriptor :: struct {
    descriptor :: () -> *MTLAccelerationStructureTriangleGeometryDescriptor {
        func: #type (obj: *void, selector: *void) -> instancetype #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLAccelerationStructureTriangleGeometryDescriptor", __sel.descriptor);
    }

    vertexBuffer :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> *MTLBuffer {
        func :: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexBuffer);
    }

    setVertexBuffer_ :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, vertexBuffer: *MTLBuffer) -> void {
        func :: #type (obj: *void, selector: *void, vertexBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexBuffer_, vertexBuffer);
    }

    vertexBufferOffset :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexBufferOffset);
    }

    setVertexBufferOffset_ :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, vertexBufferOffset: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, vertexBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexBufferOffset_, vertexBufferOffset);
    }

    vertexFormat :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> MTLAttributeFormat {
        func :: #type (obj: *void, selector: *void) -> MTLAttributeFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexFormat);
    }

    setVertexFormat_ :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, vertexFormat: MTLAttributeFormat) -> void {
        func :: #type (obj: *void, selector: *void, vertexFormat: MTLAttributeFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexFormat_, vertexFormat);
    }

    vertexStride :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexStride);
    }

    setVertexStride_ :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, vertexStride: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, vertexStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexStride_, vertexStride);
    }

    indexBuffer :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> *MTLBuffer {
        func :: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexBuffer);
    }

    setIndexBuffer_ :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, indexBuffer: *MTLBuffer) -> void {
        func :: #type (obj: *void, selector: *void, indexBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexBuffer_, indexBuffer);
    }

    indexBufferOffset :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexBufferOffset);
    }

    setIndexBufferOffset_ :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, indexBufferOffset: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, indexBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexBufferOffset_, indexBufferOffset);
    }

    indexType :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> MTLIndexType {
        func :: #type (obj: *void, selector: *void) -> MTLIndexType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexType);
    }

    setIndexType_ :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, indexType: MTLIndexType) -> void {
        func :: #type (obj: *void, selector: *void, indexType: MTLIndexType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexType_, indexType);
    }

    triangleCount :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.triangleCount);
    }

    setTriangleCount_ :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, triangleCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, triangleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTriangleCount_, triangleCount);
    }

    transformationMatrixBuffer :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> *MTLBuffer {
        func :: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.transformationMatrixBuffer);
    }

    setTransformationMatrixBuffer_ :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, transformationMatrixBuffer: *MTLBuffer) -> void {
        func :: #type (obj: *void, selector: *void, transformationMatrixBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTransformationMatrixBuffer_, transformationMatrixBuffer);
    }

    transformationMatrixBufferOffset :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.transformationMatrixBufferOffset);
    }

    setTransformationMatrixBufferOffset_ :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, transformationMatrixBufferOffset: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, transformationMatrixBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTransformationMatrixBufferOffset_, transformationMatrixBufferOffset);
    }

    transformationMatrixLayout :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> MTLMatrixLayout {
        func :: #type (obj: *void, selector: *void) -> MTLMatrixLayout #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.transformationMatrixLayout);
    }

    setTransformationMatrixLayout_ :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, transformationMatrixLayout: MTLMatrixLayout) -> void {
        func :: #type (obj: *void, selector: *void, transformationMatrixLayout: MTLMatrixLayout) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTransformationMatrixLayout_, transformationMatrixLayout);
    }

}

MTLAccelerationStructureBoundingBoxGeometryDescriptor :: struct {
    descriptor :: () -> *MTLAccelerationStructureBoundingBoxGeometryDescriptor {
        func: #type (obj: *void, selector: *void) -> instancetype #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLAccelerationStructureBoundingBoxGeometryDescriptor", __sel.descriptor);
    }

    boundingBoxBuffer :: (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor) -> *MTLBuffer {
        func :: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.boundingBoxBuffer);
    }

    setBoundingBoxBuffer_ :: (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxBuffer: *MTLBuffer) -> void {
        func :: #type (obj: *void, selector: *void, boundingBoxBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBoundingBoxBuffer_, boundingBoxBuffer);
    }

    boundingBoxBufferOffset :: (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.boundingBoxBufferOffset);
    }

    setBoundingBoxBufferOffset_ :: (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxBufferOffset: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, boundingBoxBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBoundingBoxBufferOffset_, boundingBoxBufferOffset);
    }

    boundingBoxStride :: (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.boundingBoxStride);
    }

    setBoundingBoxStride_ :: (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxStride: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, boundingBoxStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBoundingBoxStride_, boundingBoxStride);
    }

    boundingBoxCount :: (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.boundingBoxCount);
    }

    setBoundingBoxCount_ :: (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, boundingBoxCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBoundingBoxCount_, boundingBoxCount);
    }

}

MTLMotionKeyframeData :: struct {
    data :: () -> *MTLMotionKeyframeData {
        func: #type (obj: *void, selector: *void) -> instancetype #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLMotionKeyframeData", __sel.data);
    }

    buffer :: (self: *MTLMotionKeyframeData) -> *MTLBuffer {
        func :: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.buffer);
    }

    setBuffer_ :: (self: *MTLMotionKeyframeData, buffer: *MTLBuffer) -> void {
        func :: #type (obj: *void, selector: *void, buffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBuffer_, buffer);
    }

    offset :: (self: *MTLMotionKeyframeData) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.offset);
    }

    setOffset_ :: (self: *MTLMotionKeyframeData, offset: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, offset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOffset_, offset);
    }

}

MTLAccelerationStructureMotionTriangleGeometryDescriptor :: struct {
    descriptor :: () -> *MTLAccelerationStructureMotionTriangleGeometryDescriptor {
        func: #type (obj: *void, selector: *void) -> instancetype #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLAccelerationStructureMotionTriangleGeometryDescriptor", __sel.descriptor);
    }

    vertexBuffers :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> *NSArray(*MTLMotionKeyframeData) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLMotionKeyframeData) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexBuffers);
    }

    setVertexBuffers_ :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, vertexBuffers: *NSArray(*MTLMotionKeyframeData)) -> void {
        func :: #type (obj: *void, selector: *void, vertexBuffers: *NSArray(*MTLMotionKeyframeData)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexBuffers_, vertexBuffers);
    }

    vertexFormat :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> MTLAttributeFormat {
        func :: #type (obj: *void, selector: *void) -> MTLAttributeFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexFormat);
    }

    setVertexFormat_ :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, vertexFormat: MTLAttributeFormat) -> void {
        func :: #type (obj: *void, selector: *void, vertexFormat: MTLAttributeFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexFormat_, vertexFormat);
    }

    vertexStride :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexStride);
    }

    setVertexStride_ :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, vertexStride: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, vertexStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexStride_, vertexStride);
    }

    indexBuffer :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> *MTLBuffer {
        func :: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexBuffer);
    }

    setIndexBuffer_ :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, indexBuffer: *MTLBuffer) -> void {
        func :: #type (obj: *void, selector: *void, indexBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexBuffer_, indexBuffer);
    }

    indexBufferOffset :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexBufferOffset);
    }

    setIndexBufferOffset_ :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, indexBufferOffset: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, indexBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexBufferOffset_, indexBufferOffset);
    }

    indexType :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> MTLIndexType {
        func :: #type (obj: *void, selector: *void) -> MTLIndexType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexType);
    }

    setIndexType_ :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, indexType: MTLIndexType) -> void {
        func :: #type (obj: *void, selector: *void, indexType: MTLIndexType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexType_, indexType);
    }

    triangleCount :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.triangleCount);
    }

    setTriangleCount_ :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, triangleCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, triangleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTriangleCount_, triangleCount);
    }

    transformationMatrixBuffer :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> *MTLBuffer {
        func :: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.transformationMatrixBuffer);
    }

    setTransformationMatrixBuffer_ :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, transformationMatrixBuffer: *MTLBuffer) -> void {
        func :: #type (obj: *void, selector: *void, transformationMatrixBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTransformationMatrixBuffer_, transformationMatrixBuffer);
    }

    transformationMatrixBufferOffset :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.transformationMatrixBufferOffset);
    }

    setTransformationMatrixBufferOffset_ :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, transformationMatrixBufferOffset: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, transformationMatrixBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTransformationMatrixBufferOffset_, transformationMatrixBufferOffset);
    }

    transformationMatrixLayout :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> MTLMatrixLayout {
        func :: #type (obj: *void, selector: *void) -> MTLMatrixLayout #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.transformationMatrixLayout);
    }

    setTransformationMatrixLayout_ :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, transformationMatrixLayout: MTLMatrixLayout) -> void {
        func :: #type (obj: *void, selector: *void, transformationMatrixLayout: MTLMatrixLayout) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTransformationMatrixLayout_, transformationMatrixLayout);
    }

}

MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor :: struct {
    descriptor :: () -> *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor {
        func: #type (obj: *void, selector: *void) -> instancetype #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor", __sel.descriptor);
    }

    boundingBoxBuffers :: (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor) -> *NSArray(*MTLMotionKeyframeData) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLMotionKeyframeData) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.boundingBoxBuffers);
    }

    setBoundingBoxBuffers_ :: (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxBuffers: *NSArray(*MTLMotionKeyframeData)) -> void {
        func :: #type (obj: *void, selector: *void, boundingBoxBuffers: *NSArray(*MTLMotionKeyframeData)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBoundingBoxBuffers_, boundingBoxBuffers);
    }

    boundingBoxStride :: (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.boundingBoxStride);
    }

    setBoundingBoxStride_ :: (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxStride: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, boundingBoxStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBoundingBoxStride_, boundingBoxStride);
    }

    boundingBoxCount :: (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.boundingBoxCount);
    }

    setBoundingBoxCount_ :: (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, boundingBoxCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBoundingBoxCount_, boundingBoxCount);
    }

}

MTLAccelerationStructureCurveGeometryDescriptor :: struct {
    descriptor :: () -> *MTLAccelerationStructureCurveGeometryDescriptor {
        func: #type (obj: *void, selector: *void) -> instancetype #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLAccelerationStructureCurveGeometryDescriptor", __sel.descriptor);
    }

    controlPointBuffer :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> *MTLBuffer {
        func :: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointBuffer);
    }

    setControlPointBuffer_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, controlPointBuffer: *MTLBuffer) -> void {
        func :: #type (obj: *void, selector: *void, controlPointBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointBuffer_, controlPointBuffer);
    }

    controlPointBufferOffset :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointBufferOffset);
    }

    setControlPointBufferOffset_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, controlPointBufferOffset: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, controlPointBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointBufferOffset_, controlPointBufferOffset);
    }

    controlPointCount :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointCount);
    }

    setControlPointCount_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, controlPointCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, controlPointCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointCount_, controlPointCount);
    }

    controlPointStride :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointStride);
    }

    setControlPointStride_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, controlPointStride: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, controlPointStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointStride_, controlPointStride);
    }

    controlPointFormat :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLAttributeFormat {
        func :: #type (obj: *void, selector: *void) -> MTLAttributeFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointFormat);
    }

    setControlPointFormat_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, controlPointFormat: MTLAttributeFormat) -> void {
        func :: #type (obj: *void, selector: *void, controlPointFormat: MTLAttributeFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointFormat_, controlPointFormat);
    }

    radiusBuffer :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> *MTLBuffer {
        func :: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.radiusBuffer);
    }

    setRadiusBuffer_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, radiusBuffer: *MTLBuffer) -> void {
        func :: #type (obj: *void, selector: *void, radiusBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRadiusBuffer_, radiusBuffer);
    }

    radiusBufferOffset :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.radiusBufferOffset);
    }

    setRadiusBufferOffset_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, radiusBufferOffset: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, radiusBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRadiusBufferOffset_, radiusBufferOffset);
    }

    radiusFormat :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLAttributeFormat {
        func :: #type (obj: *void, selector: *void) -> MTLAttributeFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.radiusFormat);
    }

    setRadiusFormat_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, radiusFormat: MTLAttributeFormat) -> void {
        func :: #type (obj: *void, selector: *void, radiusFormat: MTLAttributeFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRadiusFormat_, radiusFormat);
    }

    radiusStride :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.radiusStride);
    }

    setRadiusStride_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, radiusStride: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, radiusStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRadiusStride_, radiusStride);
    }

    indexBuffer :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> *MTLBuffer {
        func :: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexBuffer);
    }

    setIndexBuffer_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, indexBuffer: *MTLBuffer) -> void {
        func :: #type (obj: *void, selector: *void, indexBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexBuffer_, indexBuffer);
    }

    indexBufferOffset :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexBufferOffset);
    }

    setIndexBufferOffset_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, indexBufferOffset: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, indexBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexBufferOffset_, indexBufferOffset);
    }

    indexType :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLIndexType {
        func :: #type (obj: *void, selector: *void) -> MTLIndexType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexType);
    }

    setIndexType_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, indexType: MTLIndexType) -> void {
        func :: #type (obj: *void, selector: *void, indexType: MTLIndexType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexType_, indexType);
    }

    segmentCount :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.segmentCount);
    }

    setSegmentCount_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, segmentCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, segmentCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSegmentCount_, segmentCount);
    }

    segmentControlPointCount :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.segmentControlPointCount);
    }

    setSegmentControlPointCount_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, segmentControlPointCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, segmentControlPointCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSegmentControlPointCount_, segmentControlPointCount);
    }

    curveType :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLCurveType {
        func :: #type (obj: *void, selector: *void) -> MTLCurveType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.curveType);
    }

    setCurveType_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, curveType: MTLCurveType) -> void {
        func :: #type (obj: *void, selector: *void, curveType: MTLCurveType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCurveType_, curveType);
    }

    curveBasis :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLCurveBasis {
        func :: #type (obj: *void, selector: *void) -> MTLCurveBasis #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.curveBasis);
    }

    setCurveBasis_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, curveBasis: MTLCurveBasis) -> void {
        func :: #type (obj: *void, selector: *void, curveBasis: MTLCurveBasis) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCurveBasis_, curveBasis);
    }

    curveEndCaps :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLCurveEndCaps {
        func :: #type (obj: *void, selector: *void) -> MTLCurveEndCaps #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.curveEndCaps);
    }

    setCurveEndCaps_ :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, curveEndCaps: MTLCurveEndCaps) -> void {
        func :: #type (obj: *void, selector: *void, curveEndCaps: MTLCurveEndCaps) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCurveEndCaps_, curveEndCaps);
    }

}

MTLAccelerationStructureMotionCurveGeometryDescriptor :: struct {
    descriptor :: () -> *MTLAccelerationStructureMotionCurveGeometryDescriptor {
        func: #type (obj: *void, selector: *void) -> instancetype #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLAccelerationStructureMotionCurveGeometryDescriptor", __sel.descriptor);
    }

    controlPointBuffers :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> *NSArray(*MTLMotionKeyframeData) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLMotionKeyframeData) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointBuffers);
    }

    setControlPointBuffers_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, controlPointBuffers: *NSArray(*MTLMotionKeyframeData)) -> void {
        func :: #type (obj: *void, selector: *void, controlPointBuffers: *NSArray(*MTLMotionKeyframeData)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointBuffers_, controlPointBuffers);
    }

    controlPointCount :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointCount);
    }

    setControlPointCount_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, controlPointCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, controlPointCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointCount_, controlPointCount);
    }

    controlPointStride :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointStride);
    }

    setControlPointStride_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, controlPointStride: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, controlPointStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointStride_, controlPointStride);
    }

    controlPointFormat :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLAttributeFormat {
        func :: #type (obj: *void, selector: *void) -> MTLAttributeFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointFormat);
    }

    setControlPointFormat_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, controlPointFormat: MTLAttributeFormat) -> void {
        func :: #type (obj: *void, selector: *void, controlPointFormat: MTLAttributeFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointFormat_, controlPointFormat);
    }

    radiusBuffers :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> *NSArray(*MTLMotionKeyframeData) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLMotionKeyframeData) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.radiusBuffers);
    }

    setRadiusBuffers_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, radiusBuffers: *NSArray(*MTLMotionKeyframeData)) -> void {
        func :: #type (obj: *void, selector: *void, radiusBuffers: *NSArray(*MTLMotionKeyframeData)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRadiusBuffers_, radiusBuffers);
    }

    radiusFormat :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLAttributeFormat {
        func :: #type (obj: *void, selector: *void) -> MTLAttributeFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.radiusFormat);
    }

    setRadiusFormat_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, radiusFormat: MTLAttributeFormat) -> void {
        func :: #type (obj: *void, selector: *void, radiusFormat: MTLAttributeFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRadiusFormat_, radiusFormat);
    }

    radiusStride :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.radiusStride);
    }

    setRadiusStride_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, radiusStride: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, radiusStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRadiusStride_, radiusStride);
    }

    indexBuffer :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> *MTLBuffer {
        func :: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexBuffer);
    }

    setIndexBuffer_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, indexBuffer: *MTLBuffer) -> void {
        func :: #type (obj: *void, selector: *void, indexBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexBuffer_, indexBuffer);
    }

    indexBufferOffset :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexBufferOffset);
    }

    setIndexBufferOffset_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, indexBufferOffset: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, indexBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexBufferOffset_, indexBufferOffset);
    }

    indexType :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLIndexType {
        func :: #type (obj: *void, selector: *void) -> MTLIndexType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexType);
    }

    setIndexType_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, indexType: MTLIndexType) -> void {
        func :: #type (obj: *void, selector: *void, indexType: MTLIndexType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexType_, indexType);
    }

    segmentCount :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.segmentCount);
    }

    setSegmentCount_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, segmentCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, segmentCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSegmentCount_, segmentCount);
    }

    segmentControlPointCount :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.segmentControlPointCount);
    }

    setSegmentControlPointCount_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, segmentControlPointCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, segmentControlPointCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSegmentControlPointCount_, segmentControlPointCount);
    }

    curveType :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveType {
        func :: #type (obj: *void, selector: *void) -> MTLCurveType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.curveType);
    }

    setCurveType_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, curveType: MTLCurveType) -> void {
        func :: #type (obj: *void, selector: *void, curveType: MTLCurveType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCurveType_, curveType);
    }

    curveBasis :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveBasis {
        func :: #type (obj: *void, selector: *void) -> MTLCurveBasis #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.curveBasis);
    }

    setCurveBasis_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, curveBasis: MTLCurveBasis) -> void {
        func :: #type (obj: *void, selector: *void, curveBasis: MTLCurveBasis) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCurveBasis_, curveBasis);
    }

    curveEndCaps :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveEndCaps {
        func :: #type (obj: *void, selector: *void) -> MTLCurveEndCaps #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.curveEndCaps);
    }

    setCurveEndCaps_ :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, curveEndCaps: MTLCurveEndCaps) -> void {
        func :: #type (obj: *void, selector: *void, curveEndCaps: MTLCurveEndCaps) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCurveEndCaps_, curveEndCaps);
    }

}

MTLInstanceAccelerationStructureDescriptor :: struct {
    descriptor :: () -> *MTLInstanceAccelerationStructureDescriptor {
        func: #type (obj: *void, selector: *void) -> instancetype #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLInstanceAccelerationStructureDescriptor", __sel.descriptor);
    }

    instanceDescriptorBuffer :: (self: *MTLInstanceAccelerationStructureDescriptor) -> *MTLBuffer {
        func :: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceDescriptorBuffer);
    }

    setInstanceDescriptorBuffer_ :: (self: *MTLInstanceAccelerationStructureDescriptor, instanceDescriptorBuffer: *MTLBuffer) -> void {
        func :: #type (obj: *void, selector: *void, instanceDescriptorBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceDescriptorBuffer_, instanceDescriptorBuffer);
    }

    instanceDescriptorBufferOffset :: (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceDescriptorBufferOffset);
    }

    setInstanceDescriptorBufferOffset_ :: (self: *MTLInstanceAccelerationStructureDescriptor, instanceDescriptorBufferOffset: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, instanceDescriptorBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceDescriptorBufferOffset_, instanceDescriptorBufferOffset);
    }

    instanceDescriptorStride :: (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceDescriptorStride);
    }

    setInstanceDescriptorStride_ :: (self: *MTLInstanceAccelerationStructureDescriptor, instanceDescriptorStride: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, instanceDescriptorStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceDescriptorStride_, instanceDescriptorStride);
    }

    instanceCount :: (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceCount);
    }

    setInstanceCount_ :: (self: *MTLInstanceAccelerationStructureDescriptor, instanceCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, instanceCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceCount_, instanceCount);
    }

    instancedAccelerationStructures :: (self: *MTLInstanceAccelerationStructureDescriptor) -> *NSArray(*MTLAccelerationStructure) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLAccelerationStructure) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instancedAccelerationStructures);
    }

    setInstancedAccelerationStructures_ :: (self: *MTLInstanceAccelerationStructureDescriptor, instancedAccelerationStructures: *NSArray(*MTLAccelerationStructure)) -> void {
        func :: #type (obj: *void, selector: *void, instancedAccelerationStructures: *NSArray(*MTLAccelerationStructure)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstancedAccelerationStructures_, instancedAccelerationStructures);
    }

    instanceDescriptorType :: (self: *MTLInstanceAccelerationStructureDescriptor) -> MTLAccelerationStructureInstanceDescriptorType {
        func :: #type (obj: *void, selector: *void) -> MTLAccelerationStructureInstanceDescriptorType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceDescriptorType);
    }

    setInstanceDescriptorType_ :: (self: *MTLInstanceAccelerationStructureDescriptor, instanceDescriptorType: MTLAccelerationStructureInstanceDescriptorType) -> void {
        func :: #type (obj: *void, selector: *void, instanceDescriptorType: MTLAccelerationStructureInstanceDescriptorType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceDescriptorType_, instanceDescriptorType);
    }

    motionTransformBuffer :: (self: *MTLInstanceAccelerationStructureDescriptor) -> *MTLBuffer {
        func :: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformBuffer);
    }

    setMotionTransformBuffer_ :: (self: *MTLInstanceAccelerationStructureDescriptor, motionTransformBuffer: *MTLBuffer) -> void {
        func :: #type (obj: *void, selector: *void, motionTransformBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformBuffer_, motionTransformBuffer);
    }

    motionTransformBufferOffset :: (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformBufferOffset);
    }

    setMotionTransformBufferOffset_ :: (self: *MTLInstanceAccelerationStructureDescriptor, motionTransformBufferOffset: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, motionTransformBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformBufferOffset_, motionTransformBufferOffset);
    }

    motionTransformCount :: (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformCount);
    }

    setMotionTransformCount_ :: (self: *MTLInstanceAccelerationStructureDescriptor, motionTransformCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, motionTransformCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformCount_, motionTransformCount);
    }

    instanceTransformationMatrixLayout :: (self: *MTLInstanceAccelerationStructureDescriptor) -> MTLMatrixLayout {
        func :: #type (obj: *void, selector: *void) -> MTLMatrixLayout #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceTransformationMatrixLayout);
    }

    setInstanceTransformationMatrixLayout_ :: (self: *MTLInstanceAccelerationStructureDescriptor, instanceTransformationMatrixLayout: MTLMatrixLayout) -> void {
        func :: #type (obj: *void, selector: *void, instanceTransformationMatrixLayout: MTLMatrixLayout) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceTransformationMatrixLayout_, instanceTransformationMatrixLayout);
    }

    motionTransformType :: (self: *MTLInstanceAccelerationStructureDescriptor) -> MTLTransformType {
        func :: #type (obj: *void, selector: *void) -> MTLTransformType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformType);
    }

    setMotionTransformType_ :: (self: *MTLInstanceAccelerationStructureDescriptor, motionTransformType: MTLTransformType) -> void {
        func :: #type (obj: *void, selector: *void, motionTransformType: MTLTransformType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformType_, motionTransformType);
    }

    motionTransformStride :: (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformStride);
    }

    setMotionTransformStride_ :: (self: *MTLInstanceAccelerationStructureDescriptor, motionTransformStride: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, motionTransformStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformStride_, motionTransformStride);
    }

}

MTLIndirectInstanceAccelerationStructureDescriptor :: struct {
    descriptor :: () -> *MTLIndirectInstanceAccelerationStructureDescriptor {
        func: #type (obj: *void, selector: *void) -> instancetype #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLIndirectInstanceAccelerationStructureDescriptor", __sel.descriptor);
    }

    instanceDescriptorBuffer :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> *MTLBuffer {
        func :: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceDescriptorBuffer);
    }

    setInstanceDescriptorBuffer_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceDescriptorBuffer: *MTLBuffer) -> void {
        func :: #type (obj: *void, selector: *void, instanceDescriptorBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceDescriptorBuffer_, instanceDescriptorBuffer);
    }

    instanceDescriptorBufferOffset :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceDescriptorBufferOffset);
    }

    setInstanceDescriptorBufferOffset_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceDescriptorBufferOffset: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, instanceDescriptorBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceDescriptorBufferOffset_, instanceDescriptorBufferOffset);
    }

    instanceDescriptorStride :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceDescriptorStride);
    }

    setInstanceDescriptorStride_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceDescriptorStride: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, instanceDescriptorStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceDescriptorStride_, instanceDescriptorStride);
    }

    maxInstanceCount :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxInstanceCount);
    }

    setMaxInstanceCount_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, maxInstanceCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxInstanceCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxInstanceCount_, maxInstanceCount);
    }

    instanceCountBuffer :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> *MTLBuffer {
        func :: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceCountBuffer);
    }

    setInstanceCountBuffer_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceCountBuffer: *MTLBuffer) -> void {
        func :: #type (obj: *void, selector: *void, instanceCountBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceCountBuffer_, instanceCountBuffer);
    }

    instanceCountBufferOffset :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceCountBufferOffset);
    }

    setInstanceCountBufferOffset_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceCountBufferOffset: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, instanceCountBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceCountBufferOffset_, instanceCountBufferOffset);
    }

    instanceDescriptorType :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> MTLAccelerationStructureInstanceDescriptorType {
        func :: #type (obj: *void, selector: *void) -> MTLAccelerationStructureInstanceDescriptorType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceDescriptorType);
    }

    setInstanceDescriptorType_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceDescriptorType: MTLAccelerationStructureInstanceDescriptorType) -> void {
        func :: #type (obj: *void, selector: *void, instanceDescriptorType: MTLAccelerationStructureInstanceDescriptorType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceDescriptorType_, instanceDescriptorType);
    }

    motionTransformBuffer :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> *MTLBuffer {
        func :: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformBuffer);
    }

    setMotionTransformBuffer_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformBuffer: *MTLBuffer) -> void {
        func :: #type (obj: *void, selector: *void, motionTransformBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformBuffer_, motionTransformBuffer);
    }

    motionTransformBufferOffset :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformBufferOffset);
    }

    setMotionTransformBufferOffset_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformBufferOffset: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, motionTransformBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformBufferOffset_, motionTransformBufferOffset);
    }

    maxMotionTransformCount :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxMotionTransformCount);
    }

    setMaxMotionTransformCount_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, maxMotionTransformCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxMotionTransformCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxMotionTransformCount_, maxMotionTransformCount);
    }

    motionTransformCountBuffer :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> *MTLBuffer {
        func :: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformCountBuffer);
    }

    setMotionTransformCountBuffer_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformCountBuffer: *MTLBuffer) -> void {
        func :: #type (obj: *void, selector: *void, motionTransformCountBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformCountBuffer_, motionTransformCountBuffer);
    }

    motionTransformCountBufferOffset :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformCountBufferOffset);
    }

    setMotionTransformCountBufferOffset_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformCountBufferOffset: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, motionTransformCountBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformCountBufferOffset_, motionTransformCountBufferOffset);
    }

    instanceTransformationMatrixLayout :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> MTLMatrixLayout {
        func :: #type (obj: *void, selector: *void) -> MTLMatrixLayout #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceTransformationMatrixLayout);
    }

    setInstanceTransformationMatrixLayout_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceTransformationMatrixLayout: MTLMatrixLayout) -> void {
        func :: #type (obj: *void, selector: *void, instanceTransformationMatrixLayout: MTLMatrixLayout) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceTransformationMatrixLayout_, instanceTransformationMatrixLayout);
    }

    motionTransformType :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> MTLTransformType {
        func :: #type (obj: *void, selector: *void) -> MTLTransformType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformType);
    }

    setMotionTransformType_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformType: MTLTransformType) -> void {
        func :: #type (obj: *void, selector: *void, motionTransformType: MTLTransformType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformType_, motionTransformType);
    }

    motionTransformStride :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformStride);
    }

    setMotionTransformStride_ :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformStride: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, motionTransformStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformStride_, motionTransformStride);
    }

}

MTLHeapDescriptor :: struct {
    size :: (self: *MTLHeapDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.size);
    }

    setSize_ :: (self: *MTLHeapDescriptor, size: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, size: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSize_, size);
    }

    storageMode :: (self: *MTLHeapDescriptor) -> MTLStorageMode {
        func :: #type (obj: *void, selector: *void) -> MTLStorageMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.storageMode);
    }

    setStorageMode_ :: (self: *MTLHeapDescriptor, storageMode: MTLStorageMode) -> void {
        func :: #type (obj: *void, selector: *void, storageMode: MTLStorageMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStorageMode_, storageMode);
    }

    cpuCacheMode :: (self: *MTLHeapDescriptor) -> MTLCPUCacheMode {
        func :: #type (obj: *void, selector: *void) -> MTLCPUCacheMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.cpuCacheMode);
    }

    setCpuCacheMode_ :: (self: *MTLHeapDescriptor, cpuCacheMode: MTLCPUCacheMode) -> void {
        func :: #type (obj: *void, selector: *void, cpuCacheMode: MTLCPUCacheMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCpuCacheMode_, cpuCacheMode);
    }

    sparsePageSize :: (self: *MTLHeapDescriptor) -> MTLSparsePageSize {
        func :: #type (obj: *void, selector: *void) -> MTLSparsePageSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sparsePageSize);
    }

    setSparsePageSize_ :: (self: *MTLHeapDescriptor, sparsePageSize: MTLSparsePageSize) -> void {
        func :: #type (obj: *void, selector: *void, sparsePageSize: MTLSparsePageSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSparsePageSize_, sparsePageSize);
    }

    hazardTrackingMode :: (self: *MTLHeapDescriptor) -> MTLHazardTrackingMode {
        func :: #type (obj: *void, selector: *void) -> MTLHazardTrackingMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.hazardTrackingMode);
    }

    setHazardTrackingMode_ :: (self: *MTLHeapDescriptor, hazardTrackingMode: MTLHazardTrackingMode) -> void {
        func :: #type (obj: *void, selector: *void, hazardTrackingMode: MTLHazardTrackingMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setHazardTrackingMode_, hazardTrackingMode);
    }

    resourceOptions :: (self: *MTLHeapDescriptor) -> MTLResourceOptions {
        func :: #type (obj: *void, selector: *void) -> MTLResourceOptions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resourceOptions);
    }

    setResourceOptions_ :: (self: *MTLHeapDescriptor, resourceOptions: MTLResourceOptions) -> void {
        func :: #type (obj: *void, selector: *void, resourceOptions: MTLResourceOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setResourceOptions_, resourceOptions);
    }

    type :: (self: *MTLHeapDescriptor) -> MTLHeapType {
        func :: #type (obj: *void, selector: *void) -> MTLHeapType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.type);
    }

    setType_ :: (self: *MTLHeapDescriptor, type: MTLHeapType) -> void {
        func :: #type (obj: *void, selector: *void, type: MTLHeapType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setType_, type);
    }

    maxCompatiblePlacementSparsePageSize :: (self: *MTLHeapDescriptor) -> MTLSparsePageSize {
        func :: #type (obj: *void, selector: *void) -> MTLSparsePageSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxCompatiblePlacementSparsePageSize);
    }

    setMaxCompatiblePlacementSparsePageSize_ :: (self: *MTLHeapDescriptor, maxCompatiblePlacementSparsePageSize: MTLSparsePageSize) -> void {
        func :: #type (obj: *void, selector: *void, maxCompatiblePlacementSparsePageSize: MTLSparsePageSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxCompatiblePlacementSparsePageSize_, maxCompatiblePlacementSparsePageSize);
    }

}

MTL4CommandBufferOptions :: struct {
    logState :: (self: *MTL4CommandBufferOptions) -> *MTLLogState {
        func :: #type (obj: *void, selector: *void) -> *MTLLogState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.logState);
    }

    setLogState_ :: (self: *MTL4CommandBufferOptions, logState: *MTLLogState) -> void {
        func :: #type (obj: *void, selector: *void, logState: *MTLLogState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLogState_, logState);
    }

}

MTLSharedEventListener :: struct {
    sharedListener :: () -> *MTLSharedEventListener {
        func: #type (obj: *void, selector: *void) -> *MTLSharedEventListener #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLSharedEventListener", __sel.sharedListener);
    }

    init :: (self: *MTLSharedEventListener) -> *MTLSharedEventListener {
        func :: #type (obj: *void, selector: *void) -> instancetype #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.init);
    }

    initWithDispatchQueue_ :: (self: *MTLSharedEventListener, dispatchQueue: dispatch_queue_t) -> *MTLSharedEventListener {
        func :: #type (obj: *void, selector: *void, dispatchQueue: dispatch_queue_t) -> instancetype #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.initWithDispatchQueue_, dispatchQueue);
    }

    dispatchQueue :: (self: *MTLSharedEventListener) -> dispatch_queue_t {
        func :: #type (obj: *void, selector: *void) -> dispatch_queue_t #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dispatchQueue);
    }

}

MTLSharedEventHandle :: struct {
    label :: (self: *MTLSharedEventHandle) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

}

MTL4CommitOptions :: struct {
    addFeedbackHandler_ :: (self: *MTL4CommitOptions, block: MTL4CommitFeedbackHandler) -> void {
        func :: #type (obj: *void, selector: *void, block: MTL4CommitFeedbackHandler) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addFeedbackHandler_, block);
    }

}

MTL4CommandQueueDescriptor :: struct {
    label :: (self: *MTL4CommandQueueDescriptor) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTL4CommandQueueDescriptor, label: *NSString) -> void {
        func :: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

    feedbackQueue :: (self: *MTL4CommandQueueDescriptor) -> dispatch_queue_t {
        func :: #type (obj: *void, selector: *void) -> dispatch_queue_t #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.feedbackQueue);
    }

    setFeedbackQueue_ :: (self: *MTL4CommandQueueDescriptor, feedbackQueue: dispatch_queue_t) -> void {
        func :: #type (obj: *void, selector: *void, feedbackQueue: dispatch_queue_t) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFeedbackQueue_, feedbackQueue);
    }

}

MTLCaptureDescriptor :: struct {
    captureObject :: (self: *MTLCaptureDescriptor) -> id {
        func :: #type (obj: *void, selector: *void) -> id #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.captureObject);
    }

    setCaptureObject_ :: (self: *MTLCaptureDescriptor, captureObject: id) -> void {
        func :: #type (obj: *void, selector: *void, captureObject: id) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCaptureObject_, captureObject);
    }

    destination :: (self: *MTLCaptureDescriptor) -> MTLCaptureDestination {
        func :: #type (obj: *void, selector: *void) -> MTLCaptureDestination #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.destination);
    }

    setDestination_ :: (self: *MTLCaptureDescriptor, destination: MTLCaptureDestination) -> void {
        func :: #type (obj: *void, selector: *void, destination: MTLCaptureDestination) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDestination_, destination);
    }

    outputURL :: (self: *MTLCaptureDescriptor) -> *NSURL {
        func :: #type (obj: *void, selector: *void) -> *NSURL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.outputURL);
    }

    setOutputURL_ :: (self: *MTLCaptureDescriptor, outputURL: *NSURL) -> void {
        func :: #type (obj: *void, selector: *void, outputURL: *NSURL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOutputURL_, outputURL);
    }

}

MTLCaptureManager :: struct {
    sharedCaptureManager :: () -> *MTLCaptureManager {
        func: #type (obj: *void, selector: *void) -> *MTLCaptureManager #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLCaptureManager", __sel.sharedCaptureManager);
    }

    init :: (self: *MTLCaptureManager) -> *MTLCaptureManager {
        func :: #type (obj: *void, selector: *void) -> instancetype #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.init);
    }

    newCaptureScopeWithDevice_ :: (self: *MTLCaptureManager, device: *MTLDevice) -> *MTLCaptureScope {
        func :: #type (obj: *void, selector: *void, device: *MTLDevice) -> *MTLCaptureScope #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newCaptureScopeWithDevice_, device);
    }

    newCaptureScopeWithCommandQueue_ :: (self: *MTLCaptureManager, commandQueue: *MTLCommandQueue) -> *MTLCaptureScope {
        func :: #type (obj: *void, selector: *void, commandQueue: *MTLCommandQueue) -> *MTLCaptureScope #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newCaptureScopeWithCommandQueue_, commandQueue);
    }

    newCaptureScopeWithMTL4CommandQueue_ :: (self: *MTLCaptureManager, commandQueue: *MTL4CommandQueue) -> *MTLCaptureScope {
        func :: #type (obj: *void, selector: *void, commandQueue: *MTL4CommandQueue) -> *MTLCaptureScope #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newCaptureScopeWithMTL4CommandQueue_, commandQueue);
    }

    supportsDestination_ :: (self: *MTLCaptureManager, destination: MTLCaptureDestination) -> BOOL {
        func :: #type (obj: *void, selector: *void, destination: MTLCaptureDestination) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsDestination_, destination);
    }

    startCaptureWithDescriptor_error_ :: (self: *MTLCaptureManager, descriptor: *MTLCaptureDescriptor, error: **NSError) -> BOOL {
        func :: #type (obj: *void, selector: *void, descriptor: *MTLCaptureDescriptor, error: **NSError) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.startCaptureWithDescriptor_error_, descriptor, error);
    }

    startCaptureWithDevice_ :: (self: *MTLCaptureManager, device: *MTLDevice) -> void {
        func :: #type (obj: *void, selector: *void, device: *MTLDevice) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.startCaptureWithDevice_, device);
    }

    startCaptureWithCommandQueue_ :: (self: *MTLCaptureManager, commandQueue: *MTLCommandQueue) -> void {
        func :: #type (obj: *void, selector: *void, commandQueue: *MTLCommandQueue) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.startCaptureWithCommandQueue_, commandQueue);
    }

    startCaptureWithScope_ :: (self: *MTLCaptureManager, captureScope: *MTLCaptureScope) -> void {
        func :: #type (obj: *void, selector: *void, captureScope: *MTLCaptureScope) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.startCaptureWithScope_, captureScope);
    }

    stopCapture :: (self: *MTLCaptureManager) -> void {
        func :: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stopCapture);
    }

    defaultCaptureScope :: (self: *MTLCaptureManager) -> *MTLCaptureScope {
        func :: #type (obj: *void, selector: *void) -> *MTLCaptureScope #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.defaultCaptureScope);
    }

    setDefaultCaptureScope_ :: (self: *MTLCaptureManager, defaultCaptureScope: *MTLCaptureScope) -> void {
        func :: #type (obj: *void, selector: *void, defaultCaptureScope: *MTLCaptureScope) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDefaultCaptureScope_, defaultCaptureScope);
    }

    isCapturing :: (self: *MTLCaptureManager) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isCapturing);
    }

}

MTLIndirectCommandBufferDescriptor :: struct {
    commandTypes :: (self: *MTLIndirectCommandBufferDescriptor) -> MTLIndirectCommandType {
        func :: #type (obj: *void, selector: *void) -> MTLIndirectCommandType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.commandTypes);
    }

    setCommandTypes_ :: (self: *MTLIndirectCommandBufferDescriptor, commandTypes: MTLIndirectCommandType) -> void {
        func :: #type (obj: *void, selector: *void, commandTypes: MTLIndirectCommandType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCommandTypes_, commandTypes);
    }

    inheritPipelineState :: (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.inheritPipelineState);
    }

    setInheritPipelineState_ :: (self: *MTLIndirectCommandBufferDescriptor, inheritPipelineState: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, inheritPipelineState: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInheritPipelineState_, inheritPipelineState);
    }

    inheritBuffers :: (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.inheritBuffers);
    }

    setInheritBuffers_ :: (self: *MTLIndirectCommandBufferDescriptor, inheritBuffers: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, inheritBuffers: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInheritBuffers_, inheritBuffers);
    }

    inheritDepthStencilState :: (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.inheritDepthStencilState);
    }

    setInheritDepthStencilState_ :: (self: *MTLIndirectCommandBufferDescriptor, inheritDepthStencilState: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, inheritDepthStencilState: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInheritDepthStencilState_, inheritDepthStencilState);
    }

    inheritDepthBias :: (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.inheritDepthBias);
    }

    setInheritDepthBias_ :: (self: *MTLIndirectCommandBufferDescriptor, inheritDepthBias: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, inheritDepthBias: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInheritDepthBias_, inheritDepthBias);
    }

    inheritDepthClipMode :: (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.inheritDepthClipMode);
    }

    setInheritDepthClipMode_ :: (self: *MTLIndirectCommandBufferDescriptor, inheritDepthClipMode: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, inheritDepthClipMode: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInheritDepthClipMode_, inheritDepthClipMode);
    }

    inheritCullMode :: (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.inheritCullMode);
    }

    setInheritCullMode_ :: (self: *MTLIndirectCommandBufferDescriptor, inheritCullMode: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, inheritCullMode: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInheritCullMode_, inheritCullMode);
    }

    inheritFrontFacingWinding :: (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.inheritFrontFacingWinding);
    }

    setInheritFrontFacingWinding_ :: (self: *MTLIndirectCommandBufferDescriptor, inheritFrontFacingWinding: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, inheritFrontFacingWinding: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInheritFrontFacingWinding_, inheritFrontFacingWinding);
    }

    inheritTriangleFillMode :: (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.inheritTriangleFillMode);
    }

    setInheritTriangleFillMode_ :: (self: *MTLIndirectCommandBufferDescriptor, inheritTriangleFillMode: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, inheritTriangleFillMode: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInheritTriangleFillMode_, inheritTriangleFillMode);
    }

    maxVertexBufferBindCount :: (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxVertexBufferBindCount);
    }

    setMaxVertexBufferBindCount_ :: (self: *MTLIndirectCommandBufferDescriptor, maxVertexBufferBindCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxVertexBufferBindCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxVertexBufferBindCount_, maxVertexBufferBindCount);
    }

    maxFragmentBufferBindCount :: (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxFragmentBufferBindCount);
    }

    setMaxFragmentBufferBindCount_ :: (self: *MTLIndirectCommandBufferDescriptor, maxFragmentBufferBindCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxFragmentBufferBindCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxFragmentBufferBindCount_, maxFragmentBufferBindCount);
    }

    maxKernelBufferBindCount :: (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxKernelBufferBindCount);
    }

    setMaxKernelBufferBindCount_ :: (self: *MTLIndirectCommandBufferDescriptor, maxKernelBufferBindCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxKernelBufferBindCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxKernelBufferBindCount_, maxKernelBufferBindCount);
    }

    maxKernelThreadgroupMemoryBindCount :: (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxKernelThreadgroupMemoryBindCount);
    }

    setMaxKernelThreadgroupMemoryBindCount_ :: (self: *MTLIndirectCommandBufferDescriptor, maxKernelThreadgroupMemoryBindCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxKernelThreadgroupMemoryBindCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxKernelThreadgroupMemoryBindCount_, maxKernelThreadgroupMemoryBindCount);
    }

    maxObjectBufferBindCount :: (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxObjectBufferBindCount);
    }

    setMaxObjectBufferBindCount_ :: (self: *MTLIndirectCommandBufferDescriptor, maxObjectBufferBindCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxObjectBufferBindCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxObjectBufferBindCount_, maxObjectBufferBindCount);
    }

    maxMeshBufferBindCount :: (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxMeshBufferBindCount);
    }

    setMaxMeshBufferBindCount_ :: (self: *MTLIndirectCommandBufferDescriptor, maxMeshBufferBindCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxMeshBufferBindCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxMeshBufferBindCount_, maxMeshBufferBindCount);
    }

    maxObjectThreadgroupMemoryBindCount :: (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxObjectThreadgroupMemoryBindCount);
    }

    setMaxObjectThreadgroupMemoryBindCount_ :: (self: *MTLIndirectCommandBufferDescriptor, maxObjectThreadgroupMemoryBindCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxObjectThreadgroupMemoryBindCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxObjectThreadgroupMemoryBindCount_, maxObjectThreadgroupMemoryBindCount);
    }

    supportRayTracing :: (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportRayTracing);
    }

    setSupportRayTracing_ :: (self: *MTLIndirectCommandBufferDescriptor, supportRayTracing: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, supportRayTracing: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportRayTracing_, supportRayTracing);
    }

    supportDynamicAttributeStride :: (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportDynamicAttributeStride);
    }

    setSupportDynamicAttributeStride_ :: (self: *MTLIndirectCommandBufferDescriptor, supportDynamicAttributeStride: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, supportDynamicAttributeStride: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportDynamicAttributeStride_, supportDynamicAttributeStride);
    }

    supportColorAttachmentMapping :: (self: *MTLIndirectCommandBufferDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportColorAttachmentMapping);
    }

    setSupportColorAttachmentMapping_ :: (self: *MTLIndirectCommandBufferDescriptor, supportColorAttachmentMapping: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, supportColorAttachmentMapping: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportColorAttachmentMapping_, supportColorAttachmentMapping);
    }

}

MTLAccelerationStructurePassSampleBufferAttachmentDescriptor :: struct {
    sampleBuffer :: (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor) -> *MTLCounterSampleBuffer {
        func :: #type (obj: *void, selector: *void) -> *MTLCounterSampleBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleBuffer);
    }

    setSampleBuffer_ :: (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor, sampleBuffer: *MTLCounterSampleBuffer) -> void {
        func :: #type (obj: *void, selector: *void, sampleBuffer: *MTLCounterSampleBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSampleBuffer_, sampleBuffer);
    }

    startOfEncoderSampleIndex :: (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.startOfEncoderSampleIndex);
    }

    setStartOfEncoderSampleIndex_ :: (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor, startOfEncoderSampleIndex: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, startOfEncoderSampleIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStartOfEncoderSampleIndex_, startOfEncoderSampleIndex);
    }

    endOfEncoderSampleIndex :: (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.endOfEncoderSampleIndex);
    }

    setEndOfEncoderSampleIndex_ :: (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor, endOfEncoderSampleIndex: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, endOfEncoderSampleIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setEndOfEncoderSampleIndex_, endOfEncoderSampleIndex);
    }

}

MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray :: struct {
    objectAtIndexedSubscript_ :: (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor {
        func :: #type (obj: *void, selector: *void, attachmentIndex: NSUInteger) -> *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, attachmentIndex);
    }

    setObject_atIndexedSubscript_ :: (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray, attachment: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, attachment: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, attachment, attachmentIndex);
    }

}

MTLAccelerationStructurePassDescriptor :: struct {
    accelerationStructurePassDescriptor :: () -> *MTLAccelerationStructurePassDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLAccelerationStructurePassDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLAccelerationStructurePassDescriptor", __sel.accelerationStructurePassDescriptor);
    }

    sampleBufferAttachments :: (self: *MTLAccelerationStructurePassDescriptor) -> *MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray {
        func :: #type (obj: *void, selector: *void) -> *MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleBufferAttachments);
    }

}

MTLRasterizationRateSampleArray :: struct {
    objectAtIndexedSubscript_ :: (self: *MTLRasterizationRateSampleArray, index: NSUInteger) -> *NSNumber {
        func :: #type (obj: *void, selector: *void, index: NSUInteger) -> *NSNumber #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, index);
    }

    setObject_atIndexedSubscript_ :: (self: *MTLRasterizationRateSampleArray, value: *NSNumber, index: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, value: *NSNumber, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, value, index);
    }

}

MTLRasterizationRateLayerDescriptor :: struct {
    init :: (self: *MTLRasterizationRateLayerDescriptor) -> *MTLRasterizationRateLayerDescriptor {
        func :: #type (obj: *void, selector: *void) -> instancetype #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.init);
    }

    initWithSampleCount_ :: (self: *MTLRasterizationRateLayerDescriptor, sampleCount: MTLSize) -> *MTLRasterizationRateLayerDescriptor {
        func :: #type (obj: *void, selector: *void, sampleCount: MTLSize) -> instancetype #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.initWithSampleCount_, sampleCount);
    }

    initWithSampleCount_horizontal_vertical_ :: (self: *MTLRasterizationRateLayerDescriptor, sampleCount: MTLSize, horizontal: *float32, vertical: *float32) -> *MTLRasterizationRateLayerDescriptor {
        func :: #type (obj: *void, selector: *void, sampleCount: MTLSize, horizontal: *float32, vertical: *float32) -> instancetype #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.initWithSampleCount_horizontal_vertical_, sampleCount, horizontal, vertical);
    }

    sampleCount :: (self: *MTLRasterizationRateLayerDescriptor) -> MTLSize {
        func :: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleCount);
    }

    maxSampleCount :: (self: *MTLRasterizationRateLayerDescriptor) -> MTLSize {
        func :: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxSampleCount);
    }

    horizontalSampleStorage :: (self: *MTLRasterizationRateLayerDescriptor) -> *float32 {
        func :: #type (obj: *void, selector: *void) -> *float32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.horizontalSampleStorage);
    }

    verticalSampleStorage :: (self: *MTLRasterizationRateLayerDescriptor) -> *float32 {
        func :: #type (obj: *void, selector: *void) -> *float32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.verticalSampleStorage);
    }

    horizontal :: (self: *MTLRasterizationRateLayerDescriptor) -> *MTLRasterizationRateSampleArray {
        func :: #type (obj: *void, selector: *void) -> *MTLRasterizationRateSampleArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.horizontal);
    }

    vertical :: (self: *MTLRasterizationRateLayerDescriptor) -> *MTLRasterizationRateSampleArray {
        func :: #type (obj: *void, selector: *void) -> *MTLRasterizationRateSampleArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertical);
    }

}

MTLRasterizationRateLayerArray :: struct {
    objectAtIndexedSubscript_ :: (self: *MTLRasterizationRateLayerArray, layerIndex: NSUInteger) -> *MTLRasterizationRateLayerDescriptor {
        func :: #type (obj: *void, selector: *void, layerIndex: NSUInteger) -> *MTLRasterizationRateLayerDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, layerIndex);
    }

    setObject_atIndexedSubscript_ :: (self: *MTLRasterizationRateLayerArray, layer: *MTLRasterizationRateLayerDescriptor, layerIndex: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, layer: *MTLRasterizationRateLayerDescriptor, layerIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, layer, layerIndex);
    }

}

MTLRasterizationRateMapDescriptor :: struct {
    rasterizationRateMapDescriptorWithScreenSize_ :: (screenSize: MTLSize) -> *MTLRasterizationRateMapDescriptor {
        func: #type (obj: *void, selector: *void, screenSize: MTLSize) -> *MTLRasterizationRateMapDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLRasterizationRateMapDescriptor", __sel.rasterizationRateMapDescriptorWithScreenSize_, screenSize);
    }

    rasterizationRateMapDescriptorWithScreenSize_layer_ :: (screenSize: MTLSize, layer: *MTLRasterizationRateLayerDescriptor) -> *MTLRasterizationRateMapDescriptor {
        func: #type (obj: *void, selector: *void, screenSize: MTLSize, layer: *MTLRasterizationRateLayerDescriptor) -> *MTLRasterizationRateMapDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLRasterizationRateMapDescriptor", __sel.rasterizationRateMapDescriptorWithScreenSize_layer_, screenSize, layer);
    }

    rasterizationRateMapDescriptorWithScreenSize_layerCount_layers_ :: (screenSize: MTLSize, layerCount: NSUInteger, layers: **MTLRasterizationRateLayerDescriptor) -> *MTLRasterizationRateMapDescriptor {
        func: #type (obj: *void, selector: *void, screenSize: MTLSize, layerCount: NSUInteger, layers: **MTLRasterizationRateLayerDescriptor) -> *MTLRasterizationRateMapDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLRasterizationRateMapDescriptor", __sel.rasterizationRateMapDescriptorWithScreenSize_layerCount_layers_, screenSize, layerCount, layers);
    }

    layerAtIndex_ :: (self: *MTLRasterizationRateMapDescriptor, layerIndex: NSUInteger) -> *MTLRasterizationRateLayerDescriptor {
        func :: #type (obj: *void, selector: *void, layerIndex: NSUInteger) -> *MTLRasterizationRateLayerDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.layerAtIndex_, layerIndex);
    }

    setLayer_atIndex_ :: (self: *MTLRasterizationRateMapDescriptor, layer: *MTLRasterizationRateLayerDescriptor, layerIndex: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, layer: *MTLRasterizationRateLayerDescriptor, layerIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLayer_atIndex_, layer, layerIndex);
    }

    layers :: (self: *MTLRasterizationRateMapDescriptor) -> *MTLRasterizationRateLayerArray {
        func :: #type (obj: *void, selector: *void) -> *MTLRasterizationRateLayerArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.layers);
    }

    screenSize :: (self: *MTLRasterizationRateMapDescriptor) -> MTLSize {
        func :: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.screenSize);
    }

    setScreenSize_ :: (self: *MTLRasterizationRateMapDescriptor, screenSize: MTLSize) -> void {
        func :: #type (obj: *void, selector: *void, screenSize: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setScreenSize_, screenSize);
    }

    label :: (self: *MTLRasterizationRateMapDescriptor) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLRasterizationRateMapDescriptor, label: *NSString) -> void {
        func :: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

    layerCount :: (self: *MTLRasterizationRateMapDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.layerCount);
    }

}

MTLLogStateDescriptor :: struct {
    level :: (self: *MTLLogStateDescriptor) -> MTLLogLevel {
        func :: #type (obj: *void, selector: *void) -> MTLLogLevel #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.level);
    }

    setLevel_ :: (self: *MTLLogStateDescriptor, level: MTLLogLevel) -> void {
        func :: #type (obj: *void, selector: *void, level: MTLLogLevel) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLevel_, level);
    }

    bufferSize :: (self: *MTLLogStateDescriptor) -> NSInteger {
        func :: #type (obj: *void, selector: *void) -> NSInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bufferSize);
    }

    setBufferSize_ :: (self: *MTLLogStateDescriptor, bufferSize: NSInteger) -> void {
        func :: #type (obj: *void, selector: *void, bufferSize: NSInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBufferSize_, bufferSize);
    }

}

MTLBinaryArchiveDescriptor :: struct {
    url :: (self: *MTLBinaryArchiveDescriptor) -> *NSURL {
        func :: #type (obj: *void, selector: *void) -> *NSURL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.url);
    }

    setUrl_ :: (self: *MTLBinaryArchiveDescriptor, url: *NSURL) -> void {
        func :: #type (obj: *void, selector: *void, url: *NSURL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setUrl_, url);
    }

}

MTLIntersectionFunctionTableDescriptor :: struct {
    intersectionFunctionTableDescriptor :: () -> *MTLIntersectionFunctionTableDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTLIntersectionFunctionTableDescriptor #c_call;
        func = xx objc_msgSend;
        return func(objc_getClass("MTLIntersectionFunctionTableDescriptor", __sel.intersectionFunctionTableDescriptor);
    }

    functionCount :: (self: *MTLIntersectionFunctionTableDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionCount);
    }

    setFunctionCount_ :: (self: *MTLIntersectionFunctionTableDescriptor, functionCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, functionCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFunctionCount_, functionCount);
    }

}

MTLFunctionStitchingAttributeAlwaysInline :: struct {
}

MTLFunctionStitchingInputNode :: struct {
    initWithArgumentIndex_ :: (self: *MTLFunctionStitchingInputNode, argument: NSUInteger) -> *MTLFunctionStitchingInputNode {
        func :: #type (obj: *void, selector: *void, argument: NSUInteger) -> instancetype #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.initWithArgumentIndex_, argument);
    }

    argumentIndex :: (self: *MTLFunctionStitchingInputNode) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.argumentIndex);
    }

    setArgumentIndex_ :: (self: *MTLFunctionStitchingInputNode, argumentIndex: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, argumentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setArgumentIndex_, argumentIndex);
    }

}

MTLFunctionStitchingFunctionNode :: struct {
    initWithName_arguments_controlDependencies_ :: (self: *MTLFunctionStitchingFunctionNode, name: *NSString, arguments: *NSArray(*MTLFunctionStitchingNode), controlDependencies: *NSArray(*MTLFunctionStitchingFunctionNode)) -> *MTLFunctionStitchingFunctionNode {
        func :: #type (obj: *void, selector: *void, name: *NSString, arguments: *NSArray(*MTLFunctionStitchingNode), controlDependencies: *NSArray(*MTLFunctionStitchingFunctionNode)) -> instancetype #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.initWithName_arguments_controlDependencies_, name, arguments, controlDependencies);
    }

    name :: (self: *MTLFunctionStitchingFunctionNode) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

    setName_ :: (self: *MTLFunctionStitchingFunctionNode, name: *NSString) -> void {
        func :: #type (obj: *void, selector: *void, name: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setName_, name);
    }

    arguments :: (self: *MTLFunctionStitchingFunctionNode) -> *NSArray(*MTLFunctionStitchingNode) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLFunctionStitchingNode) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.arguments);
    }

    setArguments_ :: (self: *MTLFunctionStitchingFunctionNode, arguments: *NSArray(*MTLFunctionStitchingNode)) -> void {
        func :: #type (obj: *void, selector: *void, arguments: *NSArray(*MTLFunctionStitchingNode)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setArguments_, arguments);
    }

    controlDependencies :: (self: *MTLFunctionStitchingFunctionNode) -> *NSArray(*MTLFunctionStitchingFunctionNode) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLFunctionStitchingFunctionNode) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlDependencies);
    }

    setControlDependencies_ :: (self: *MTLFunctionStitchingFunctionNode, controlDependencies: *NSArray(*MTLFunctionStitchingFunctionNode)) -> void {
        func :: #type (obj: *void, selector: *void, controlDependencies: *NSArray(*MTLFunctionStitchingFunctionNode)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlDependencies_, controlDependencies);
    }

}

MTLFunctionStitchingGraph :: struct {
    initWithFunctionName_nodes_outputNode_attributes_ :: (self: *MTLFunctionStitchingGraph, functionName: *NSString, nodes: *NSArray(*MTLFunctionStitchingFunctionNode), outputNode: *MTLFunctionStitchingFunctionNode, attributes: *NSArray(*MTLFunctionStitchingAttribute)) -> *MTLFunctionStitchingGraph {
        func :: #type (obj: *void, selector: *void, functionName: *NSString, nodes: *NSArray(*MTLFunctionStitchingFunctionNode), outputNode: *MTLFunctionStitchingFunctionNode, attributes: *NSArray(*MTLFunctionStitchingAttribute)) -> instancetype #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.initWithFunctionName_nodes_outputNode_attributes_, functionName, nodes, outputNode, attributes);
    }

    functionName :: (self: *MTLFunctionStitchingGraph) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionName);
    }

    setFunctionName_ :: (self: *MTLFunctionStitchingGraph, functionName: *NSString) -> void {
        func :: #type (obj: *void, selector: *void, functionName: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFunctionName_, functionName);
    }

    nodes :: (self: *MTLFunctionStitchingGraph) -> *NSArray(*MTLFunctionStitchingFunctionNode) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLFunctionStitchingFunctionNode) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.nodes);
    }

    setNodes_ :: (self: *MTLFunctionStitchingGraph, nodes: *NSArray(*MTLFunctionStitchingFunctionNode)) -> void {
        func :: #type (obj: *void, selector: *void, nodes: *NSArray(*MTLFunctionStitchingFunctionNode)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setNodes_, nodes);
    }

    outputNode :: (self: *MTLFunctionStitchingGraph) -> *MTLFunctionStitchingFunctionNode {
        func :: #type (obj: *void, selector: *void) -> *MTLFunctionStitchingFunctionNode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.outputNode);
    }

    setOutputNode_ :: (self: *MTLFunctionStitchingGraph, outputNode: *MTLFunctionStitchingFunctionNode) -> void {
        func :: #type (obj: *void, selector: *void, outputNode: *MTLFunctionStitchingFunctionNode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOutputNode_, outputNode);
    }

    attributes :: (self: *MTLFunctionStitchingGraph) -> *NSArray(*MTLFunctionStitchingAttribute) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLFunctionStitchingAttribute) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.attributes);
    }

    setAttributes_ :: (self: *MTLFunctionStitchingGraph, attributes: *NSArray(*MTLFunctionStitchingAttribute)) -> void {
        func :: #type (obj: *void, selector: *void, attributes: *NSArray(*MTLFunctionStitchingAttribute)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAttributes_, attributes);
    }

}

MTLStitchedLibraryDescriptor :: struct {
    functionGraphs :: (self: *MTLStitchedLibraryDescriptor) -> *NSArray(*MTLFunctionStitchingGraph) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLFunctionStitchingGraph) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionGraphs);
    }

    setFunctionGraphs_ :: (self: *MTLStitchedLibraryDescriptor, functionGraphs: *NSArray(*MTLFunctionStitchingGraph)) -> void {
        func :: #type (obj: *void, selector: *void, functionGraphs: *NSArray(*MTLFunctionStitchingGraph)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFunctionGraphs_, functionGraphs);
    }

    functions :: (self: *MTLStitchedLibraryDescriptor) -> *NSArray(*MTLFunction) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLFunction) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functions);
    }

    setFunctions_ :: (self: *MTLStitchedLibraryDescriptor, functions: *NSArray(*MTLFunction)) -> void {
        func :: #type (obj: *void, selector: *void, functions: *NSArray(*MTLFunction)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFunctions_, functions);
    }

    binaryArchives :: (self: *MTLStitchedLibraryDescriptor) -> *NSArray(*MTLBinaryArchive) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLBinaryArchive) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.binaryArchives);
    }

    setBinaryArchives_ :: (self: *MTLStitchedLibraryDescriptor, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void {
        func :: #type (obj: *void, selector: *void, binaryArchives: *NSArray(*MTLBinaryArchive)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBinaryArchives_, binaryArchives);
    }

    options :: (self: *MTLStitchedLibraryDescriptor) -> MTLStitchedLibraryOptions {
        func :: #type (obj: *void, selector: *void) -> MTLStitchedLibraryOptions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.options);
    }

    setOptions_ :: (self: *MTLStitchedLibraryDescriptor, options: MTLStitchedLibraryOptions) -> void {
        func :: #type (obj: *void, selector: *void, options: MTLStitchedLibraryOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOptions_, options);
    }

}

MTLIOCommandQueueDescriptor :: struct {
    maxCommandBufferCount :: (self: *MTLIOCommandQueueDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxCommandBufferCount);
    }

    setMaxCommandBufferCount_ :: (self: *MTLIOCommandQueueDescriptor, maxCommandBufferCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxCommandBufferCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxCommandBufferCount_, maxCommandBufferCount);
    }

    priority :: (self: *MTLIOCommandQueueDescriptor) -> MTLIOPriority {
        func :: #type (obj: *void, selector: *void) -> MTLIOPriority #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.priority);
    }

    setPriority_ :: (self: *MTLIOCommandQueueDescriptor, priority: MTLIOPriority) -> void {
        func :: #type (obj: *void, selector: *void, priority: MTLIOPriority) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPriority_, priority);
    }

    type :: (self: *MTLIOCommandQueueDescriptor) -> MTLIOCommandQueueType {
        func :: #type (obj: *void, selector: *void) -> MTLIOCommandQueueType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.type);
    }

    setType_ :: (self: *MTLIOCommandQueueDescriptor, type: MTLIOCommandQueueType) -> void {
        func :: #type (obj: *void, selector: *void, type: MTLIOCommandQueueType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setType_, type);
    }

    maxCommandsInFlight :: (self: *MTLIOCommandQueueDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxCommandsInFlight);
    }

    setMaxCommandsInFlight_ :: (self: *MTLIOCommandQueueDescriptor, maxCommandsInFlight: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxCommandsInFlight: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxCommandsInFlight_, maxCommandsInFlight);
    }

    scratchBufferAllocator :: (self: *MTLIOCommandQueueDescriptor) -> *MTLIOScratchBufferAllocator {
        func :: #type (obj: *void, selector: *void) -> *MTLIOScratchBufferAllocator #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.scratchBufferAllocator);
    }

    setScratchBufferAllocator_ :: (self: *MTLIOCommandQueueDescriptor, scratchBufferAllocator: *MTLIOScratchBufferAllocator) -> void {
        func :: #type (obj: *void, selector: *void, scratchBufferAllocator: *MTLIOScratchBufferAllocator) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setScratchBufferAllocator_, scratchBufferAllocator);
    }

}

MTLResidencySetDescriptor :: struct {
    label :: (self: *MTLResidencySetDescriptor) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLResidencySetDescriptor, label: *NSString) -> void {
        func :: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

    initialCapacity :: (self: *MTLResidencySetDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.initialCapacity);
    }

    setInitialCapacity_ :: (self: *MTLResidencySetDescriptor, initialCapacity: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, initialCapacity: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInitialCapacity_, initialCapacity);
    }

}

MTLResourceViewPoolDescriptor :: struct {
    resourceViewCount :: (self: *MTLResourceViewPoolDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resourceViewCount);
    }

    setResourceViewCount_ :: (self: *MTLResourceViewPoolDescriptor, resourceViewCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, resourceViewCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setResourceViewCount_, resourceViewCount);
    }

    label :: (self: *MTLResourceViewPoolDescriptor) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLResourceViewPoolDescriptor, label: *NSString) -> void {
        func :: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

}

MTL4ArgumentTableDescriptor :: struct {
    maxBufferBindCount :: (self: *MTL4ArgumentTableDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxBufferBindCount);
    }

    setMaxBufferBindCount_ :: (self: *MTL4ArgumentTableDescriptor, maxBufferBindCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxBufferBindCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxBufferBindCount_, maxBufferBindCount);
    }

    maxTextureBindCount :: (self: *MTL4ArgumentTableDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTextureBindCount);
    }

    setMaxTextureBindCount_ :: (self: *MTL4ArgumentTableDescriptor, maxTextureBindCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxTextureBindCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxTextureBindCount_, maxTextureBindCount);
    }

    maxSamplerStateBindCount :: (self: *MTL4ArgumentTableDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxSamplerStateBindCount);
    }

    setMaxSamplerStateBindCount_ :: (self: *MTL4ArgumentTableDescriptor, maxSamplerStateBindCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxSamplerStateBindCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxSamplerStateBindCount_, maxSamplerStateBindCount);
    }

    initializeBindings :: (self: *MTL4ArgumentTableDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.initializeBindings);
    }

    setInitializeBindings_ :: (self: *MTL4ArgumentTableDescriptor, initializeBindings: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, initializeBindings: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInitializeBindings_, initializeBindings);
    }

    supportAttributeStrides :: (self: *MTL4ArgumentTableDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportAttributeStrides);
    }

    setSupportAttributeStrides_ :: (self: *MTL4ArgumentTableDescriptor, supportAttributeStrides: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, supportAttributeStrides: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportAttributeStrides_, supportAttributeStrides);
    }

    label :: (self: *MTL4ArgumentTableDescriptor) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTL4ArgumentTableDescriptor, label: *NSString) -> void {
        func :: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

}

MTL4CommandAllocatorDescriptor :: struct {
    label :: (self: *MTL4CommandAllocatorDescriptor) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTL4CommandAllocatorDescriptor, label: *NSString) -> void {
        func :: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

}

MTL4RenderPassDescriptor :: struct {
    setSamplePositions_count_ :: (self: *MTL4RenderPassDescriptor, positions: *const MTLSamplePosition, count: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, positions: *const MTLSamplePosition, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSamplePositions_count_, positions, count);
    }

    getSamplePositions_count_ :: (self: *MTL4RenderPassDescriptor, positions: *MTLSamplePosition, count: NSUInteger) -> NSUInteger {
        func :: #type (obj: *void, selector: *void, positions: *MTLSamplePosition, count: NSUInteger) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.getSamplePositions_count_, positions, count);
    }

    colorAttachments :: (self: *MTL4RenderPassDescriptor) -> *MTLRenderPassColorAttachmentDescriptorArray {
        func :: #type (obj: *void, selector: *void) -> *MTLRenderPassColorAttachmentDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.colorAttachments);
    }

    depthAttachment :: (self: *MTL4RenderPassDescriptor) -> *MTLRenderPassDepthAttachmentDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTLRenderPassDepthAttachmentDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.depthAttachment);
    }

    setDepthAttachment_ :: (self: *MTL4RenderPassDescriptor, depthAttachment: *MTLRenderPassDepthAttachmentDescriptor) -> void {
        func :: #type (obj: *void, selector: *void, depthAttachment: *MTLRenderPassDepthAttachmentDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthAttachment_, depthAttachment);
    }

    stencilAttachment :: (self: *MTL4RenderPassDescriptor) -> *MTLRenderPassStencilAttachmentDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTLRenderPassStencilAttachmentDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stencilAttachment);
    }

    setStencilAttachment_ :: (self: *MTL4RenderPassDescriptor, stencilAttachment: *MTLRenderPassStencilAttachmentDescriptor) -> void {
        func :: #type (obj: *void, selector: *void, stencilAttachment: *MTLRenderPassStencilAttachmentDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilAttachment_, stencilAttachment);
    }

    renderTargetArrayLength :: (self: *MTL4RenderPassDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.renderTargetArrayLength);
    }

    setRenderTargetArrayLength_ :: (self: *MTL4RenderPassDescriptor, renderTargetArrayLength: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, renderTargetArrayLength: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRenderTargetArrayLength_, renderTargetArrayLength);
    }

    imageblockSampleLength :: (self: *MTL4RenderPassDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.imageblockSampleLength);
    }

    setImageblockSampleLength_ :: (self: *MTL4RenderPassDescriptor, imageblockSampleLength: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, imageblockSampleLength: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setImageblockSampleLength_, imageblockSampleLength);
    }

    threadgroupMemoryLength :: (self: *MTL4RenderPassDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.threadgroupMemoryLength);
    }

    setThreadgroupMemoryLength_ :: (self: *MTL4RenderPassDescriptor, threadgroupMemoryLength: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, threadgroupMemoryLength: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setThreadgroupMemoryLength_, threadgroupMemoryLength);
    }

    tileWidth :: (self: *MTL4RenderPassDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileWidth);
    }

    setTileWidth_ :: (self: *MTL4RenderPassDescriptor, tileWidth: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, tileWidth: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileWidth_, tileWidth);
    }

    tileHeight :: (self: *MTL4RenderPassDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileHeight);
    }

    setTileHeight_ :: (self: *MTL4RenderPassDescriptor, tileHeight: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, tileHeight: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileHeight_, tileHeight);
    }

    defaultRasterSampleCount :: (self: *MTL4RenderPassDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.defaultRasterSampleCount);
    }

    setDefaultRasterSampleCount_ :: (self: *MTL4RenderPassDescriptor, defaultRasterSampleCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, defaultRasterSampleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDefaultRasterSampleCount_, defaultRasterSampleCount);
    }

    renderTargetWidth :: (self: *MTL4RenderPassDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.renderTargetWidth);
    }

    setRenderTargetWidth_ :: (self: *MTL4RenderPassDescriptor, renderTargetWidth: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, renderTargetWidth: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRenderTargetWidth_, renderTargetWidth);
    }

    renderTargetHeight :: (self: *MTL4RenderPassDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.renderTargetHeight);
    }

    setRenderTargetHeight_ :: (self: *MTL4RenderPassDescriptor, renderTargetHeight: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, renderTargetHeight: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRenderTargetHeight_, renderTargetHeight);
    }

    rasterizationRateMap :: (self: *MTL4RenderPassDescriptor) -> *MTLRasterizationRateMap {
        func :: #type (obj: *void, selector: *void) -> *MTLRasterizationRateMap #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.rasterizationRateMap);
    }

    setRasterizationRateMap_ :: (self: *MTL4RenderPassDescriptor, rasterizationRateMap: *MTLRasterizationRateMap) -> void {
        func :: #type (obj: *void, selector: *void, rasterizationRateMap: *MTLRasterizationRateMap) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRasterizationRateMap_, rasterizationRateMap);
    }

    visibilityResultBuffer :: (self: *MTL4RenderPassDescriptor) -> *MTLBuffer {
        func :: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.visibilityResultBuffer);
    }

    setVisibilityResultBuffer_ :: (self: *MTL4RenderPassDescriptor, visibilityResultBuffer: *MTLBuffer) -> void {
        func :: #type (obj: *void, selector: *void, visibilityResultBuffer: *MTLBuffer) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVisibilityResultBuffer_, visibilityResultBuffer);
    }

    visibilityResultType :: (self: *MTL4RenderPassDescriptor) -> MTLVisibilityResultType {
        func :: #type (obj: *void, selector: *void) -> MTLVisibilityResultType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.visibilityResultType);
    }

    setVisibilityResultType_ :: (self: *MTL4RenderPassDescriptor, visibilityResultType: MTLVisibilityResultType) -> void {
        func :: #type (obj: *void, selector: *void, visibilityResultType: MTLVisibilityResultType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVisibilityResultType_, visibilityResultType);
    }

    supportColorAttachmentMapping :: (self: *MTL4RenderPassDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportColorAttachmentMapping);
    }

    setSupportColorAttachmentMapping_ :: (self: *MTL4RenderPassDescriptor, supportColorAttachmentMapping: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, supportColorAttachmentMapping: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportColorAttachmentMapping_, supportColorAttachmentMapping);
    }

}

MTL4AccelerationStructureDescriptor :: struct {
}

MTL4AccelerationStructureGeometryDescriptor :: struct {
    intersectionFunctionTableOffset :: (self: *MTL4AccelerationStructureGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.intersectionFunctionTableOffset);
    }

    setIntersectionFunctionTableOffset_ :: (self: *MTL4AccelerationStructureGeometryDescriptor, intersectionFunctionTableOffset: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, intersectionFunctionTableOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIntersectionFunctionTableOffset_, intersectionFunctionTableOffset);
    }

    opaque :: (self: *MTL4AccelerationStructureGeometryDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.opaque);
    }

    setOpaque_ :: (self: *MTL4AccelerationStructureGeometryDescriptor, opaque: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, opaque: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOpaque_, opaque);
    }

    allowDuplicateIntersectionFunctionInvocation :: (self: *MTL4AccelerationStructureGeometryDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.allowDuplicateIntersectionFunctionInvocation);
    }

    setAllowDuplicateIntersectionFunctionInvocation_ :: (self: *MTL4AccelerationStructureGeometryDescriptor, allowDuplicateIntersectionFunctionInvocation: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, allowDuplicateIntersectionFunctionInvocation: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAllowDuplicateIntersectionFunctionInvocation_, allowDuplicateIntersectionFunctionInvocation);
    }

    label :: (self: *MTL4AccelerationStructureGeometryDescriptor) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTL4AccelerationStructureGeometryDescriptor, label: *NSString) -> void {
        func :: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

    primitiveDataBuffer :: (self: *MTL4AccelerationStructureGeometryDescriptor) -> MTL4BufferRange {
        func :: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.primitiveDataBuffer);
    }

    setPrimitiveDataBuffer_ :: (self: *MTL4AccelerationStructureGeometryDescriptor, primitiveDataBuffer: MTL4BufferRange) -> void {
        func :: #type (obj: *void, selector: *void, primitiveDataBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPrimitiveDataBuffer_, primitiveDataBuffer);
    }

    primitiveDataStride :: (self: *MTL4AccelerationStructureGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.primitiveDataStride);
    }

    setPrimitiveDataStride_ :: (self: *MTL4AccelerationStructureGeometryDescriptor, primitiveDataStride: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, primitiveDataStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPrimitiveDataStride_, primitiveDataStride);
    }

    primitiveDataElementSize :: (self: *MTL4AccelerationStructureGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.primitiveDataElementSize);
    }

    setPrimitiveDataElementSize_ :: (self: *MTL4AccelerationStructureGeometryDescriptor, primitiveDataElementSize: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, primitiveDataElementSize: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPrimitiveDataElementSize_, primitiveDataElementSize);
    }

}

MTL4PrimitiveAccelerationStructureDescriptor :: struct {
    geometryDescriptors :: (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> *NSArray(*MTL4AccelerationStructureGeometryDescriptor) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTL4AccelerationStructureGeometryDescriptor) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.geometryDescriptors);
    }

    setGeometryDescriptors_ :: (self: *MTL4PrimitiveAccelerationStructureDescriptor, geometryDescriptors: *NSArray(*MTL4AccelerationStructureGeometryDescriptor)) -> void {
        func :: #type (obj: *void, selector: *void, geometryDescriptors: *NSArray(*MTL4AccelerationStructureGeometryDescriptor)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setGeometryDescriptors_, geometryDescriptors);
    }

    motionStartBorderMode :: (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> MTLMotionBorderMode {
        func :: #type (obj: *void, selector: *void) -> MTLMotionBorderMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionStartBorderMode);
    }

    setMotionStartBorderMode_ :: (self: *MTL4PrimitiveAccelerationStructureDescriptor, motionStartBorderMode: MTLMotionBorderMode) -> void {
        func :: #type (obj: *void, selector: *void, motionStartBorderMode: MTLMotionBorderMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionStartBorderMode_, motionStartBorderMode);
    }

    motionEndBorderMode :: (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> MTLMotionBorderMode {
        func :: #type (obj: *void, selector: *void) -> MTLMotionBorderMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionEndBorderMode);
    }

    setMotionEndBorderMode_ :: (self: *MTL4PrimitiveAccelerationStructureDescriptor, motionEndBorderMode: MTLMotionBorderMode) -> void {
        func :: #type (obj: *void, selector: *void, motionEndBorderMode: MTLMotionBorderMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionEndBorderMode_, motionEndBorderMode);
    }

    motionStartTime :: (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> float32 {
        func :: #type (obj: *void, selector: *void) -> float32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionStartTime);
    }

    setMotionStartTime_ :: (self: *MTL4PrimitiveAccelerationStructureDescriptor, motionStartTime: float32) -> void {
        func :: #type (obj: *void, selector: *void, motionStartTime: float32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionStartTime_, motionStartTime);
    }

    motionEndTime :: (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> float32 {
        func :: #type (obj: *void, selector: *void) -> float32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionEndTime);
    }

    setMotionEndTime_ :: (self: *MTL4PrimitiveAccelerationStructureDescriptor, motionEndTime: float32) -> void {
        func :: #type (obj: *void, selector: *void, motionEndTime: float32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionEndTime_, motionEndTime);
    }

    motionKeyframeCount :: (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionKeyframeCount);
    }

    setMotionKeyframeCount_ :: (self: *MTL4PrimitiveAccelerationStructureDescriptor, motionKeyframeCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, motionKeyframeCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionKeyframeCount_, motionKeyframeCount);
    }

}

MTL4AccelerationStructureTriangleGeometryDescriptor :: struct {
    vertexBuffer :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTL4BufferRange {
        func :: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexBuffer);
    }

    setVertexBuffer_ :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, vertexBuffer: MTL4BufferRange) -> void {
        func :: #type (obj: *void, selector: *void, vertexBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexBuffer_, vertexBuffer);
    }

    vertexFormat :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTLAttributeFormat {
        func :: #type (obj: *void, selector: *void) -> MTLAttributeFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexFormat);
    }

    setVertexFormat_ :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, vertexFormat: MTLAttributeFormat) -> void {
        func :: #type (obj: *void, selector: *void, vertexFormat: MTLAttributeFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexFormat_, vertexFormat);
    }

    vertexStride :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexStride);
    }

    setVertexStride_ :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, vertexStride: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, vertexStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexStride_, vertexStride);
    }

    indexBuffer :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTL4BufferRange {
        func :: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexBuffer);
    }

    setIndexBuffer_ :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, indexBuffer: MTL4BufferRange) -> void {
        func :: #type (obj: *void, selector: *void, indexBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexBuffer_, indexBuffer);
    }

    indexType :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTLIndexType {
        func :: #type (obj: *void, selector: *void) -> MTLIndexType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexType);
    }

    setIndexType_ :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, indexType: MTLIndexType) -> void {
        func :: #type (obj: *void, selector: *void, indexType: MTLIndexType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexType_, indexType);
    }

    triangleCount :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.triangleCount);
    }

    setTriangleCount_ :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, triangleCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, triangleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTriangleCount_, triangleCount);
    }

    transformationMatrixBuffer :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTL4BufferRange {
        func :: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.transformationMatrixBuffer);
    }

    setTransformationMatrixBuffer_ :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, transformationMatrixBuffer: MTL4BufferRange) -> void {
        func :: #type (obj: *void, selector: *void, transformationMatrixBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTransformationMatrixBuffer_, transformationMatrixBuffer);
    }

    transformationMatrixLayout :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTLMatrixLayout {
        func :: #type (obj: *void, selector: *void) -> MTLMatrixLayout #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.transformationMatrixLayout);
    }

    setTransformationMatrixLayout_ :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, transformationMatrixLayout: MTLMatrixLayout) -> void {
        func :: #type (obj: *void, selector: *void, transformationMatrixLayout: MTLMatrixLayout) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTransformationMatrixLayout_, transformationMatrixLayout);
    }

}

MTL4AccelerationStructureBoundingBoxGeometryDescriptor :: struct {
    boundingBoxBuffer :: (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor) -> MTL4BufferRange {
        func :: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.boundingBoxBuffer);
    }

    setBoundingBoxBuffer_ :: (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxBuffer: MTL4BufferRange) -> void {
        func :: #type (obj: *void, selector: *void, boundingBoxBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBoundingBoxBuffer_, boundingBoxBuffer);
    }

    boundingBoxStride :: (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.boundingBoxStride);
    }

    setBoundingBoxStride_ :: (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxStride: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, boundingBoxStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBoundingBoxStride_, boundingBoxStride);
    }

    boundingBoxCount :: (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.boundingBoxCount);
    }

    setBoundingBoxCount_ :: (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, boundingBoxCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBoundingBoxCount_, boundingBoxCount);
    }

}

MTL4AccelerationStructureMotionTriangleGeometryDescriptor :: struct {
    vertexBuffers :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTL4BufferRange {
        func :: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexBuffers);
    }

    setVertexBuffers_ :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, vertexBuffers: MTL4BufferRange) -> void {
        func :: #type (obj: *void, selector: *void, vertexBuffers: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexBuffers_, vertexBuffers);
    }

    vertexFormat :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTLAttributeFormat {
        func :: #type (obj: *void, selector: *void) -> MTLAttributeFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexFormat);
    }

    setVertexFormat_ :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, vertexFormat: MTLAttributeFormat) -> void {
        func :: #type (obj: *void, selector: *void, vertexFormat: MTLAttributeFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexFormat_, vertexFormat);
    }

    vertexStride :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexStride);
    }

    setVertexStride_ :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, vertexStride: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, vertexStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexStride_, vertexStride);
    }

    indexBuffer :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTL4BufferRange {
        func :: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexBuffer);
    }

    setIndexBuffer_ :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, indexBuffer: MTL4BufferRange) -> void {
        func :: #type (obj: *void, selector: *void, indexBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexBuffer_, indexBuffer);
    }

    indexType :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTLIndexType {
        func :: #type (obj: *void, selector: *void) -> MTLIndexType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexType);
    }

    setIndexType_ :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, indexType: MTLIndexType) -> void {
        func :: #type (obj: *void, selector: *void, indexType: MTLIndexType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexType_, indexType);
    }

    triangleCount :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.triangleCount);
    }

    setTriangleCount_ :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, triangleCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, triangleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTriangleCount_, triangleCount);
    }

    transformationMatrixBuffer :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTL4BufferRange {
        func :: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.transformationMatrixBuffer);
    }

    setTransformationMatrixBuffer_ :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, transformationMatrixBuffer: MTL4BufferRange) -> void {
        func :: #type (obj: *void, selector: *void, transformationMatrixBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTransformationMatrixBuffer_, transformationMatrixBuffer);
    }

    transformationMatrixLayout :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTLMatrixLayout {
        func :: #type (obj: *void, selector: *void) -> MTLMatrixLayout #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.transformationMatrixLayout);
    }

    setTransformationMatrixLayout_ :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, transformationMatrixLayout: MTLMatrixLayout) -> void {
        func :: #type (obj: *void, selector: *void, transformationMatrixLayout: MTLMatrixLayout) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTransformationMatrixLayout_, transformationMatrixLayout);
    }

}

MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor :: struct {
    boundingBoxBuffers :: (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor) -> MTL4BufferRange {
        func :: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.boundingBoxBuffers);
    }

    setBoundingBoxBuffers_ :: (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxBuffers: MTL4BufferRange) -> void {
        func :: #type (obj: *void, selector: *void, boundingBoxBuffers: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBoundingBoxBuffers_, boundingBoxBuffers);
    }

    boundingBoxStride :: (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.boundingBoxStride);
    }

    setBoundingBoxStride_ :: (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxStride: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, boundingBoxStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBoundingBoxStride_, boundingBoxStride);
    }

    boundingBoxCount :: (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.boundingBoxCount);
    }

    setBoundingBoxCount_ :: (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, boundingBoxCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBoundingBoxCount_, boundingBoxCount);
    }

}

MTL4AccelerationStructureCurveGeometryDescriptor :: struct {
    controlPointBuffer :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTL4BufferRange {
        func :: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointBuffer);
    }

    setControlPointBuffer_ :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, controlPointBuffer: MTL4BufferRange) -> void {
        func :: #type (obj: *void, selector: *void, controlPointBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointBuffer_, controlPointBuffer);
    }

    controlPointCount :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointCount);
    }

    setControlPointCount_ :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, controlPointCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, controlPointCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointCount_, controlPointCount);
    }

    controlPointStride :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointStride);
    }

    setControlPointStride_ :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, controlPointStride: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, controlPointStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointStride_, controlPointStride);
    }

    controlPointFormat :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLAttributeFormat {
        func :: #type (obj: *void, selector: *void) -> MTLAttributeFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointFormat);
    }

    setControlPointFormat_ :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, controlPointFormat: MTLAttributeFormat) -> void {
        func :: #type (obj: *void, selector: *void, controlPointFormat: MTLAttributeFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointFormat_, controlPointFormat);
    }

    radiusBuffer :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTL4BufferRange {
        func :: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.radiusBuffer);
    }

    setRadiusBuffer_ :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, radiusBuffer: MTL4BufferRange) -> void {
        func :: #type (obj: *void, selector: *void, radiusBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRadiusBuffer_, radiusBuffer);
    }

    radiusFormat :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLAttributeFormat {
        func :: #type (obj: *void, selector: *void) -> MTLAttributeFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.radiusFormat);
    }

    setRadiusFormat_ :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, radiusFormat: MTLAttributeFormat) -> void {
        func :: #type (obj: *void, selector: *void, radiusFormat: MTLAttributeFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRadiusFormat_, radiusFormat);
    }

    radiusStride :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.radiusStride);
    }

    setRadiusStride_ :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, radiusStride: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, radiusStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRadiusStride_, radiusStride);
    }

    indexBuffer :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTL4BufferRange {
        func :: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexBuffer);
    }

    setIndexBuffer_ :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, indexBuffer: MTL4BufferRange) -> void {
        func :: #type (obj: *void, selector: *void, indexBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexBuffer_, indexBuffer);
    }

    indexType :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLIndexType {
        func :: #type (obj: *void, selector: *void) -> MTLIndexType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexType);
    }

    setIndexType_ :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, indexType: MTLIndexType) -> void {
        func :: #type (obj: *void, selector: *void, indexType: MTLIndexType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexType_, indexType);
    }

    segmentCount :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.segmentCount);
    }

    setSegmentCount_ :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, segmentCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, segmentCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSegmentCount_, segmentCount);
    }

    segmentControlPointCount :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.segmentControlPointCount);
    }

    setSegmentControlPointCount_ :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, segmentControlPointCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, segmentControlPointCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSegmentControlPointCount_, segmentControlPointCount);
    }

    curveType :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLCurveType {
        func :: #type (obj: *void, selector: *void) -> MTLCurveType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.curveType);
    }

    setCurveType_ :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, curveType: MTLCurveType) -> void {
        func :: #type (obj: *void, selector: *void, curveType: MTLCurveType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCurveType_, curveType);
    }

    curveBasis :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLCurveBasis {
        func :: #type (obj: *void, selector: *void) -> MTLCurveBasis #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.curveBasis);
    }

    setCurveBasis_ :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, curveBasis: MTLCurveBasis) -> void {
        func :: #type (obj: *void, selector: *void, curveBasis: MTLCurveBasis) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCurveBasis_, curveBasis);
    }

    curveEndCaps :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLCurveEndCaps {
        func :: #type (obj: *void, selector: *void) -> MTLCurveEndCaps #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.curveEndCaps);
    }

    setCurveEndCaps_ :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, curveEndCaps: MTLCurveEndCaps) -> void {
        func :: #type (obj: *void, selector: *void, curveEndCaps: MTLCurveEndCaps) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCurveEndCaps_, curveEndCaps);
    }

}

MTL4AccelerationStructureMotionCurveGeometryDescriptor :: struct {
    controlPointBuffers :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTL4BufferRange {
        func :: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointBuffers);
    }

    setControlPointBuffers_ :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, controlPointBuffers: MTL4BufferRange) -> void {
        func :: #type (obj: *void, selector: *void, controlPointBuffers: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointBuffers_, controlPointBuffers);
    }

    controlPointCount :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointCount);
    }

    setControlPointCount_ :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, controlPointCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, controlPointCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointCount_, controlPointCount);
    }

    controlPointStride :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointStride);
    }

    setControlPointStride_ :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, controlPointStride: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, controlPointStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointStride_, controlPointStride);
    }

    controlPointFormat :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLAttributeFormat {
        func :: #type (obj: *void, selector: *void) -> MTLAttributeFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.controlPointFormat);
    }

    setControlPointFormat_ :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, controlPointFormat: MTLAttributeFormat) -> void {
        func :: #type (obj: *void, selector: *void, controlPointFormat: MTLAttributeFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setControlPointFormat_, controlPointFormat);
    }

    radiusBuffers :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTL4BufferRange {
        func :: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.radiusBuffers);
    }

    setRadiusBuffers_ :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, radiusBuffers: MTL4BufferRange) -> void {
        func :: #type (obj: *void, selector: *void, radiusBuffers: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRadiusBuffers_, radiusBuffers);
    }

    radiusFormat :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLAttributeFormat {
        func :: #type (obj: *void, selector: *void) -> MTLAttributeFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.radiusFormat);
    }

    setRadiusFormat_ :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, radiusFormat: MTLAttributeFormat) -> void {
        func :: #type (obj: *void, selector: *void, radiusFormat: MTLAttributeFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRadiusFormat_, radiusFormat);
    }

    radiusStride :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.radiusStride);
    }

    setRadiusStride_ :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, radiusStride: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, radiusStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRadiusStride_, radiusStride);
    }

    indexBuffer :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTL4BufferRange {
        func :: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexBuffer);
    }

    setIndexBuffer_ :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, indexBuffer: MTL4BufferRange) -> void {
        func :: #type (obj: *void, selector: *void, indexBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexBuffer_, indexBuffer);
    }

    indexType :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLIndexType {
        func :: #type (obj: *void, selector: *void) -> MTLIndexType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexType);
    }

    setIndexType_ :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, indexType: MTLIndexType) -> void {
        func :: #type (obj: *void, selector: *void, indexType: MTLIndexType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndexType_, indexType);
    }

    segmentCount :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.segmentCount);
    }

    setSegmentCount_ :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, segmentCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, segmentCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSegmentCount_, segmentCount);
    }

    segmentControlPointCount :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.segmentControlPointCount);
    }

    setSegmentControlPointCount_ :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, segmentControlPointCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, segmentControlPointCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSegmentControlPointCount_, segmentControlPointCount);
    }

    curveType :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveType {
        func :: #type (obj: *void, selector: *void) -> MTLCurveType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.curveType);
    }

    setCurveType_ :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, curveType: MTLCurveType) -> void {
        func :: #type (obj: *void, selector: *void, curveType: MTLCurveType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCurveType_, curveType);
    }

    curveBasis :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveBasis {
        func :: #type (obj: *void, selector: *void) -> MTLCurveBasis #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.curveBasis);
    }

    setCurveBasis_ :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, curveBasis: MTLCurveBasis) -> void {
        func :: #type (obj: *void, selector: *void, curveBasis: MTLCurveBasis) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCurveBasis_, curveBasis);
    }

    curveEndCaps :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveEndCaps {
        func :: #type (obj: *void, selector: *void) -> MTLCurveEndCaps #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.curveEndCaps);
    }

    setCurveEndCaps_ :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, curveEndCaps: MTLCurveEndCaps) -> void {
        func :: #type (obj: *void, selector: *void, curveEndCaps: MTLCurveEndCaps) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCurveEndCaps_, curveEndCaps);
    }

}

MTL4InstanceAccelerationStructureDescriptor :: struct {
    instanceDescriptorBuffer :: (self: *MTL4InstanceAccelerationStructureDescriptor) -> MTL4BufferRange {
        func :: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceDescriptorBuffer);
    }

    setInstanceDescriptorBuffer_ :: (self: *MTL4InstanceAccelerationStructureDescriptor, instanceDescriptorBuffer: MTL4BufferRange) -> void {
        func :: #type (obj: *void, selector: *void, instanceDescriptorBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceDescriptorBuffer_, instanceDescriptorBuffer);
    }

    instanceDescriptorStride :: (self: *MTL4InstanceAccelerationStructureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceDescriptorStride);
    }

    setInstanceDescriptorStride_ :: (self: *MTL4InstanceAccelerationStructureDescriptor, instanceDescriptorStride: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, instanceDescriptorStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceDescriptorStride_, instanceDescriptorStride);
    }

    instanceCount :: (self: *MTL4InstanceAccelerationStructureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceCount);
    }

    setInstanceCount_ :: (self: *MTL4InstanceAccelerationStructureDescriptor, instanceCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, instanceCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceCount_, instanceCount);
    }

    instanceDescriptorType :: (self: *MTL4InstanceAccelerationStructureDescriptor) -> MTLAccelerationStructureInstanceDescriptorType {
        func :: #type (obj: *void, selector: *void) -> MTLAccelerationStructureInstanceDescriptorType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceDescriptorType);
    }

    setInstanceDescriptorType_ :: (self: *MTL4InstanceAccelerationStructureDescriptor, instanceDescriptorType: MTLAccelerationStructureInstanceDescriptorType) -> void {
        func :: #type (obj: *void, selector: *void, instanceDescriptorType: MTLAccelerationStructureInstanceDescriptorType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceDescriptorType_, instanceDescriptorType);
    }

    motionTransformBuffer :: (self: *MTL4InstanceAccelerationStructureDescriptor) -> MTL4BufferRange {
        func :: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformBuffer);
    }

    setMotionTransformBuffer_ :: (self: *MTL4InstanceAccelerationStructureDescriptor, motionTransformBuffer: MTL4BufferRange) -> void {
        func :: #type (obj: *void, selector: *void, motionTransformBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformBuffer_, motionTransformBuffer);
    }

    motionTransformCount :: (self: *MTL4InstanceAccelerationStructureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformCount);
    }

    setMotionTransformCount_ :: (self: *MTL4InstanceAccelerationStructureDescriptor, motionTransformCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, motionTransformCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformCount_, motionTransformCount);
    }

    instanceTransformationMatrixLayout :: (self: *MTL4InstanceAccelerationStructureDescriptor) -> MTLMatrixLayout {
        func :: #type (obj: *void, selector: *void) -> MTLMatrixLayout #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceTransformationMatrixLayout);
    }

    setInstanceTransformationMatrixLayout_ :: (self: *MTL4InstanceAccelerationStructureDescriptor, instanceTransformationMatrixLayout: MTLMatrixLayout) -> void {
        func :: #type (obj: *void, selector: *void, instanceTransformationMatrixLayout: MTLMatrixLayout) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceTransformationMatrixLayout_, instanceTransformationMatrixLayout);
    }

    motionTransformType :: (self: *MTL4InstanceAccelerationStructureDescriptor) -> MTLTransformType {
        func :: #type (obj: *void, selector: *void) -> MTLTransformType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformType);
    }

    setMotionTransformType_ :: (self: *MTL4InstanceAccelerationStructureDescriptor, motionTransformType: MTLTransformType) -> void {
        func :: #type (obj: *void, selector: *void, motionTransformType: MTLTransformType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformType_, motionTransformType);
    }

    motionTransformStride :: (self: *MTL4InstanceAccelerationStructureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformStride);
    }

    setMotionTransformStride_ :: (self: *MTL4InstanceAccelerationStructureDescriptor, motionTransformStride: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, motionTransformStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformStride_, motionTransformStride);
    }

}

MTL4IndirectInstanceAccelerationStructureDescriptor :: struct {
    instanceDescriptorBuffer :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTL4BufferRange {
        func :: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceDescriptorBuffer);
    }

    setInstanceDescriptorBuffer_ :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, instanceDescriptorBuffer: MTL4BufferRange) -> void {
        func :: #type (obj: *void, selector: *void, instanceDescriptorBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceDescriptorBuffer_, instanceDescriptorBuffer);
    }

    instanceDescriptorStride :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceDescriptorStride);
    }

    setInstanceDescriptorStride_ :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, instanceDescriptorStride: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, instanceDescriptorStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceDescriptorStride_, instanceDescriptorStride);
    }

    maxInstanceCount :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxInstanceCount);
    }

    setMaxInstanceCount_ :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, maxInstanceCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxInstanceCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxInstanceCount_, maxInstanceCount);
    }

    instanceCountBuffer :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTL4BufferRange {
        func :: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceCountBuffer);
    }

    setInstanceCountBuffer_ :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, instanceCountBuffer: MTL4BufferRange) -> void {
        func :: #type (obj: *void, selector: *void, instanceCountBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceCountBuffer_, instanceCountBuffer);
    }

    instanceDescriptorType :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTLAccelerationStructureInstanceDescriptorType {
        func :: #type (obj: *void, selector: *void) -> MTLAccelerationStructureInstanceDescriptorType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceDescriptorType);
    }

    setInstanceDescriptorType_ :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, instanceDescriptorType: MTLAccelerationStructureInstanceDescriptorType) -> void {
        func :: #type (obj: *void, selector: *void, instanceDescriptorType: MTLAccelerationStructureInstanceDescriptorType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceDescriptorType_, instanceDescriptorType);
    }

    motionTransformBuffer :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTL4BufferRange {
        func :: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformBuffer);
    }

    setMotionTransformBuffer_ :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, motionTransformBuffer: MTL4BufferRange) -> void {
        func :: #type (obj: *void, selector: *void, motionTransformBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformBuffer_, motionTransformBuffer);
    }

    maxMotionTransformCount :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxMotionTransformCount);
    }

    setMaxMotionTransformCount_ :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, maxMotionTransformCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxMotionTransformCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxMotionTransformCount_, maxMotionTransformCount);
    }

    motionTransformCountBuffer :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTL4BufferRange {
        func :: #type (obj: *void, selector: *void) -> MTL4BufferRange #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformCountBuffer);
    }

    setMotionTransformCountBuffer_ :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, motionTransformCountBuffer: MTL4BufferRange) -> void {
        func :: #type (obj: *void, selector: *void, motionTransformCountBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformCountBuffer_, motionTransformCountBuffer);
    }

    instanceTransformationMatrixLayout :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTLMatrixLayout {
        func :: #type (obj: *void, selector: *void) -> MTLMatrixLayout #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.instanceTransformationMatrixLayout);
    }

    setInstanceTransformationMatrixLayout_ :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, instanceTransformationMatrixLayout: MTLMatrixLayout) -> void {
        func :: #type (obj: *void, selector: *void, instanceTransformationMatrixLayout: MTLMatrixLayout) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInstanceTransformationMatrixLayout_, instanceTransformationMatrixLayout);
    }

    motionTransformType :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTLTransformType {
        func :: #type (obj: *void, selector: *void) -> MTLTransformType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformType);
    }

    setMotionTransformType_ :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, motionTransformType: MTLTransformType) -> void {
        func :: #type (obj: *void, selector: *void, motionTransformType: MTLTransformType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformType_, motionTransformType);
    }

    motionTransformStride :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.motionTransformStride);
    }

    setMotionTransformStride_ :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, motionTransformStride: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, motionTransformStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMotionTransformStride_, motionTransformStride);
    }

}

MTL4LibraryDescriptor :: struct {
    source :: (self: *MTL4LibraryDescriptor) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.source);
    }

    setSource_ :: (self: *MTL4LibraryDescriptor, source: *NSString) -> void {
        func :: #type (obj: *void, selector: *void, source: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSource_, source);
    }

    options :: (self: *MTL4LibraryDescriptor) -> *MTLCompileOptions {
        func :: #type (obj: *void, selector: *void) -> *MTLCompileOptions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.options);
    }

    setOptions_ :: (self: *MTL4LibraryDescriptor, options: *MTLCompileOptions) -> void {
        func :: #type (obj: *void, selector: *void, options: *MTLCompileOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOptions_, options);
    }

    name :: (self: *MTL4LibraryDescriptor) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

    setName_ :: (self: *MTL4LibraryDescriptor, name: *NSString) -> void {
        func :: #type (obj: *void, selector: *void, name: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setName_, name);
    }

}

MTL4FunctionDescriptor :: struct {
}

MTL4LibraryFunctionDescriptor :: struct {
    name :: (self: *MTL4LibraryFunctionDescriptor) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

    setName_ :: (self: *MTL4LibraryFunctionDescriptor, name: *NSString) -> void {
        func :: #type (obj: *void, selector: *void, name: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setName_, name);
    }

    library :: (self: *MTL4LibraryFunctionDescriptor) -> *MTLLibrary {
        func :: #type (obj: *void, selector: *void) -> *MTLLibrary #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.library);
    }

    setLibrary_ :: (self: *MTL4LibraryFunctionDescriptor, library: *MTLLibrary) -> void {
        func :: #type (obj: *void, selector: *void, library: *MTLLibrary) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLibrary_, library);
    }

}

MTL4SpecializedFunctionDescriptor :: struct {
    functionDescriptor :: (self: *MTL4SpecializedFunctionDescriptor) -> *MTL4FunctionDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTL4FunctionDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionDescriptor);
    }

    setFunctionDescriptor_ :: (self: *MTL4SpecializedFunctionDescriptor, functionDescriptor: *MTL4FunctionDescriptor) -> void {
        func :: #type (obj: *void, selector: *void, functionDescriptor: *MTL4FunctionDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFunctionDescriptor_, functionDescriptor);
    }

    specializedName :: (self: *MTL4SpecializedFunctionDescriptor) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.specializedName);
    }

    setSpecializedName_ :: (self: *MTL4SpecializedFunctionDescriptor, specializedName: *NSString) -> void {
        func :: #type (obj: *void, selector: *void, specializedName: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSpecializedName_, specializedName);
    }

    constantValues :: (self: *MTL4SpecializedFunctionDescriptor) -> *MTLFunctionConstantValues {
        func :: #type (obj: *void, selector: *void) -> *MTLFunctionConstantValues #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.constantValues);
    }

    setConstantValues_ :: (self: *MTL4SpecializedFunctionDescriptor, constantValues: *MTLFunctionConstantValues) -> void {
        func :: #type (obj: *void, selector: *void, constantValues: *MTLFunctionConstantValues) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setConstantValues_, constantValues);
    }

}

MTL4StitchedFunctionDescriptor :: struct {
    functionGraph :: (self: *MTL4StitchedFunctionDescriptor) -> *MTLFunctionStitchingGraph {
        func :: #type (obj: *void, selector: *void) -> *MTLFunctionStitchingGraph #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionGraph);
    }

    setFunctionGraph_ :: (self: *MTL4StitchedFunctionDescriptor, functionGraph: *MTLFunctionStitchingGraph) -> void {
        func :: #type (obj: *void, selector: *void, functionGraph: *MTLFunctionStitchingGraph) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFunctionGraph_, functionGraph);
    }

    functionDescriptors :: (self: *MTL4StitchedFunctionDescriptor) -> *NSArray(*MTL4FunctionDescriptor) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTL4FunctionDescriptor) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionDescriptors);
    }

    setFunctionDescriptors_ :: (self: *MTL4StitchedFunctionDescriptor, functionDescriptors: *NSArray(*MTL4FunctionDescriptor)) -> void {
        func :: #type (obj: *void, selector: *void, functionDescriptors: *NSArray(*MTL4FunctionDescriptor)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFunctionDescriptors_, functionDescriptors);
    }

}

MTL4PipelineOptions :: struct {
    shaderValidation :: (self: *MTL4PipelineOptions) -> MTLShaderValidation {
        func :: #type (obj: *void, selector: *void) -> MTLShaderValidation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.shaderValidation);
    }

    setShaderValidation_ :: (self: *MTL4PipelineOptions, shaderValidation: MTLShaderValidation) -> void {
        func :: #type (obj: *void, selector: *void, shaderValidation: MTLShaderValidation) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setShaderValidation_, shaderValidation);
    }

    shaderReflection :: (self: *MTL4PipelineOptions) -> MTL4ShaderReflection {
        func :: #type (obj: *void, selector: *void) -> MTL4ShaderReflection #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.shaderReflection);
    }

    setShaderReflection_ :: (self: *MTL4PipelineOptions, shaderReflection: MTL4ShaderReflection) -> void {
        func :: #type (obj: *void, selector: *void, shaderReflection: MTL4ShaderReflection) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setShaderReflection_, shaderReflection);
    }

}

MTL4PipelineDescriptor :: struct {
    label :: (self: *MTL4PipelineDescriptor) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTL4PipelineDescriptor, label: *NSString) -> void {
        func :: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

    options :: (self: *MTL4PipelineDescriptor) -> *MTL4PipelineOptions {
        func :: #type (obj: *void, selector: *void) -> *MTL4PipelineOptions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.options);
    }

    setOptions_ :: (self: *MTL4PipelineDescriptor, options: *MTL4PipelineOptions) -> void {
        func :: #type (obj: *void, selector: *void, options: *MTL4PipelineOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOptions_, options);
    }

}

MTL4ComputePipelineDescriptor :: struct {
    reset :: (self: *MTL4ComputePipelineDescriptor) -> void {
        func :: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

    computeFunctionDescriptor :: (self: *MTL4ComputePipelineDescriptor) -> *MTL4FunctionDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTL4FunctionDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.computeFunctionDescriptor);
    }

    setComputeFunctionDescriptor_ :: (self: *MTL4ComputePipelineDescriptor, computeFunctionDescriptor: *MTL4FunctionDescriptor) -> void {
        func :: #type (obj: *void, selector: *void, computeFunctionDescriptor: *MTL4FunctionDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setComputeFunctionDescriptor_, computeFunctionDescriptor);
    }

    threadGroupSizeIsMultipleOfThreadExecutionWidth :: (self: *MTL4ComputePipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.threadGroupSizeIsMultipleOfThreadExecutionWidth);
    }

    setThreadGroupSizeIsMultipleOfThreadExecutionWidth_ :: (self: *MTL4ComputePipelineDescriptor, threadGroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, threadGroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setThreadGroupSizeIsMultipleOfThreadExecutionWidth_, threadGroupSizeIsMultipleOfThreadExecutionWidth);
    }

    maxTotalThreadsPerThreadgroup :: (self: *MTL4ComputePipelineDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadsPerThreadgroup);
    }

    setMaxTotalThreadsPerThreadgroup_ :: (self: *MTL4ComputePipelineDescriptor, maxTotalThreadsPerThreadgroup: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxTotalThreadsPerThreadgroup: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxTotalThreadsPerThreadgroup_, maxTotalThreadsPerThreadgroup);
    }

    requiredThreadsPerThreadgroup :: (self: *MTL4ComputePipelineDescriptor) -> MTLSize {
        func :: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.requiredThreadsPerThreadgroup);
    }

    setRequiredThreadsPerThreadgroup_ :: (self: *MTL4ComputePipelineDescriptor, requiredThreadsPerThreadgroup: MTLSize) -> void {
        func :: #type (obj: *void, selector: *void, requiredThreadsPerThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRequiredThreadsPerThreadgroup_, requiredThreadsPerThreadgroup);
    }

    supportBinaryLinking :: (self: *MTL4ComputePipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportBinaryLinking);
    }

    setSupportBinaryLinking_ :: (self: *MTL4ComputePipelineDescriptor, supportBinaryLinking: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, supportBinaryLinking: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportBinaryLinking_, supportBinaryLinking);
    }

    staticLinkingDescriptor :: (self: *MTL4ComputePipelineDescriptor) -> *MTL4StaticLinkingDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTL4StaticLinkingDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.staticLinkingDescriptor);
    }

    setStaticLinkingDescriptor_ :: (self: *MTL4ComputePipelineDescriptor, staticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void {
        func :: #type (obj: *void, selector: *void, staticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStaticLinkingDescriptor_, staticLinkingDescriptor);
    }

    supportIndirectCommandBuffers :: (self: *MTL4ComputePipelineDescriptor) -> MTL4IndirectCommandBufferSupportState {
        func :: #type (obj: *void, selector: *void) -> MTL4IndirectCommandBufferSupportState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportIndirectCommandBuffers);
    }

    setSupportIndirectCommandBuffers_ :: (self: *MTL4ComputePipelineDescriptor, supportIndirectCommandBuffers: MTL4IndirectCommandBufferSupportState) -> void {
        func :: #type (obj: *void, selector: *void, supportIndirectCommandBuffers: MTL4IndirectCommandBufferSupportState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportIndirectCommandBuffers_, supportIndirectCommandBuffers);
    }

}

MTL4RenderPipelineColorAttachmentDescriptor :: struct {
    reset :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> void {
        func :: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

    pixelFormat :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLPixelFormat {
        func :: #type (obj: *void, selector: *void) -> MTLPixelFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pixelFormat);
    }

    setPixelFormat_ :: (self: *MTL4RenderPipelineColorAttachmentDescriptor, pixelFormat: MTLPixelFormat) -> void {
        func :: #type (obj: *void, selector: *void, pixelFormat: MTLPixelFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPixelFormat_, pixelFormat);
    }

    blendingState :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTL4BlendState {
        func :: #type (obj: *void, selector: *void) -> MTL4BlendState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.blendingState);
    }

    setBlendingState_ :: (self: *MTL4RenderPipelineColorAttachmentDescriptor, blendingState: MTL4BlendState) -> void {
        func :: #type (obj: *void, selector: *void, blendingState: MTL4BlendState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBlendingState_, blendingState);
    }

    sourceRGBBlendFactor :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
        func :: #type (obj: *void, selector: *void) -> MTLBlendFactor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sourceRGBBlendFactor);
    }

    setSourceRGBBlendFactor_ :: (self: *MTL4RenderPipelineColorAttachmentDescriptor, sourceRGBBlendFactor: MTLBlendFactor) -> void {
        func :: #type (obj: *void, selector: *void, sourceRGBBlendFactor: MTLBlendFactor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSourceRGBBlendFactor_, sourceRGBBlendFactor);
    }

    destinationRGBBlendFactor :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
        func :: #type (obj: *void, selector: *void) -> MTLBlendFactor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.destinationRGBBlendFactor);
    }

    setDestinationRGBBlendFactor_ :: (self: *MTL4RenderPipelineColorAttachmentDescriptor, destinationRGBBlendFactor: MTLBlendFactor) -> void {
        func :: #type (obj: *void, selector: *void, destinationRGBBlendFactor: MTLBlendFactor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDestinationRGBBlendFactor_, destinationRGBBlendFactor);
    }

    rgbBlendOperation :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendOperation {
        func :: #type (obj: *void, selector: *void) -> MTLBlendOperation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.rgbBlendOperation);
    }

    setRgbBlendOperation_ :: (self: *MTL4RenderPipelineColorAttachmentDescriptor, rgbBlendOperation: MTLBlendOperation) -> void {
        func :: #type (obj: *void, selector: *void, rgbBlendOperation: MTLBlendOperation) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRgbBlendOperation_, rgbBlendOperation);
    }

    sourceAlphaBlendFactor :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
        func :: #type (obj: *void, selector: *void) -> MTLBlendFactor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sourceAlphaBlendFactor);
    }

    setSourceAlphaBlendFactor_ :: (self: *MTL4RenderPipelineColorAttachmentDescriptor, sourceAlphaBlendFactor: MTLBlendFactor) -> void {
        func :: #type (obj: *void, selector: *void, sourceAlphaBlendFactor: MTLBlendFactor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSourceAlphaBlendFactor_, sourceAlphaBlendFactor);
    }

    destinationAlphaBlendFactor :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
        func :: #type (obj: *void, selector: *void) -> MTLBlendFactor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.destinationAlphaBlendFactor);
    }

    setDestinationAlphaBlendFactor_ :: (self: *MTL4RenderPipelineColorAttachmentDescriptor, destinationAlphaBlendFactor: MTLBlendFactor) -> void {
        func :: #type (obj: *void, selector: *void, destinationAlphaBlendFactor: MTLBlendFactor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDestinationAlphaBlendFactor_, destinationAlphaBlendFactor);
    }

    alphaBlendOperation :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendOperation {
        func :: #type (obj: *void, selector: *void) -> MTLBlendOperation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.alphaBlendOperation);
    }

    setAlphaBlendOperation_ :: (self: *MTL4RenderPipelineColorAttachmentDescriptor, alphaBlendOperation: MTLBlendOperation) -> void {
        func :: #type (obj: *void, selector: *void, alphaBlendOperation: MTLBlendOperation) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAlphaBlendOperation_, alphaBlendOperation);
    }

    writeMask :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLColorWriteMask {
        func :: #type (obj: *void, selector: *void) -> MTLColorWriteMask #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.writeMask);
    }

    setWriteMask_ :: (self: *MTL4RenderPipelineColorAttachmentDescriptor, writeMask: MTLColorWriteMask) -> void {
        func :: #type (obj: *void, selector: *void, writeMask: MTLColorWriteMask) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setWriteMask_, writeMask);
    }

}

MTL4RenderPipelineColorAttachmentDescriptorArray :: struct {
    objectAtIndexedSubscript_ :: (self: *MTL4RenderPipelineColorAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTL4RenderPipelineColorAttachmentDescriptor {
        func :: #type (obj: *void, selector: *void, attachmentIndex: NSUInteger) -> *MTL4RenderPipelineColorAttachmentDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAtIndexedSubscript_, attachmentIndex);
    }

    setObject_atIndexedSubscript_ :: (self: *MTL4RenderPipelineColorAttachmentDescriptorArray, attachment: *MTL4RenderPipelineColorAttachmentDescriptor, attachmentIndex: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, attachment: *MTL4RenderPipelineColorAttachmentDescriptor, attachmentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObject_atIndexedSubscript_, attachment, attachmentIndex);
    }

    reset :: (self: *MTL4RenderPipelineColorAttachmentDescriptorArray) -> void {
        func :: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

}

MTL4RenderPipelineBinaryFunctionsDescriptor :: struct {
    reset :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> void {
        func :: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

    vertexAdditionalBinaryFunctions :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> *NSArray(*MTL4BinaryFunction) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTL4BinaryFunction) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexAdditionalBinaryFunctions);
    }

    setVertexAdditionalBinaryFunctions_ :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor, vertexAdditionalBinaryFunctions: *NSArray(*MTL4BinaryFunction)) -> void {
        func :: #type (obj: *void, selector: *void, vertexAdditionalBinaryFunctions: *NSArray(*MTL4BinaryFunction)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexAdditionalBinaryFunctions_, vertexAdditionalBinaryFunctions);
    }

    fragmentAdditionalBinaryFunctions :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> *NSArray(*MTL4BinaryFunction) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTL4BinaryFunction) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentAdditionalBinaryFunctions);
    }

    setFragmentAdditionalBinaryFunctions_ :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor, fragmentAdditionalBinaryFunctions: *NSArray(*MTL4BinaryFunction)) -> void {
        func :: #type (obj: *void, selector: *void, fragmentAdditionalBinaryFunctions: *NSArray(*MTL4BinaryFunction)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentAdditionalBinaryFunctions_, fragmentAdditionalBinaryFunctions);
    }

    tileAdditionalBinaryFunctions :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> *NSArray(*MTL4BinaryFunction) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTL4BinaryFunction) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileAdditionalBinaryFunctions);
    }

    setTileAdditionalBinaryFunctions_ :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor, tileAdditionalBinaryFunctions: *NSArray(*MTL4BinaryFunction)) -> void {
        func :: #type (obj: *void, selector: *void, tileAdditionalBinaryFunctions: *NSArray(*MTL4BinaryFunction)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileAdditionalBinaryFunctions_, tileAdditionalBinaryFunctions);
    }

    objectAdditionalBinaryFunctions :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> *NSArray(*MTL4BinaryFunction) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTL4BinaryFunction) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectAdditionalBinaryFunctions);
    }

    setObjectAdditionalBinaryFunctions_ :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor, objectAdditionalBinaryFunctions: *NSArray(*MTL4BinaryFunction)) -> void {
        func :: #type (obj: *void, selector: *void, objectAdditionalBinaryFunctions: *NSArray(*MTL4BinaryFunction)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectAdditionalBinaryFunctions_, objectAdditionalBinaryFunctions);
    }

    meshAdditionalBinaryFunctions :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> *NSArray(*MTL4BinaryFunction) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTL4BinaryFunction) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.meshAdditionalBinaryFunctions);
    }

    setMeshAdditionalBinaryFunctions_ :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor, meshAdditionalBinaryFunctions: *NSArray(*MTL4BinaryFunction)) -> void {
        func :: #type (obj: *void, selector: *void, meshAdditionalBinaryFunctions: *NSArray(*MTL4BinaryFunction)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshAdditionalBinaryFunctions_, meshAdditionalBinaryFunctions);
    }

}

MTL4RenderPipelineDescriptor :: struct {
    reset :: (self: *MTL4RenderPipelineDescriptor) -> void {
        func :: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

    vertexFunctionDescriptor :: (self: *MTL4RenderPipelineDescriptor) -> *MTL4FunctionDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTL4FunctionDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexFunctionDescriptor);
    }

    setVertexFunctionDescriptor_ :: (self: *MTL4RenderPipelineDescriptor, vertexFunctionDescriptor: *MTL4FunctionDescriptor) -> void {
        func :: #type (obj: *void, selector: *void, vertexFunctionDescriptor: *MTL4FunctionDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexFunctionDescriptor_, vertexFunctionDescriptor);
    }

    fragmentFunctionDescriptor :: (self: *MTL4RenderPipelineDescriptor) -> *MTL4FunctionDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTL4FunctionDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentFunctionDescriptor);
    }

    setFragmentFunctionDescriptor_ :: (self: *MTL4RenderPipelineDescriptor, fragmentFunctionDescriptor: *MTL4FunctionDescriptor) -> void {
        func :: #type (obj: *void, selector: *void, fragmentFunctionDescriptor: *MTL4FunctionDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentFunctionDescriptor_, fragmentFunctionDescriptor);
    }

    vertexDescriptor :: (self: *MTL4RenderPipelineDescriptor) -> *MTLVertexDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTLVertexDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexDescriptor);
    }

    setVertexDescriptor_ :: (self: *MTL4RenderPipelineDescriptor, vertexDescriptor: *MTLVertexDescriptor) -> void {
        func :: #type (obj: *void, selector: *void, vertexDescriptor: *MTLVertexDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexDescriptor_, vertexDescriptor);
    }

    rasterSampleCount :: (self: *MTL4RenderPipelineDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.rasterSampleCount);
    }

    setRasterSampleCount_ :: (self: *MTL4RenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, rasterSampleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRasterSampleCount_, rasterSampleCount);
    }

    alphaToCoverageState :: (self: *MTL4RenderPipelineDescriptor) -> MTL4AlphaToCoverageState {
        func :: #type (obj: *void, selector: *void) -> MTL4AlphaToCoverageState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.alphaToCoverageState);
    }

    setAlphaToCoverageState_ :: (self: *MTL4RenderPipelineDescriptor, alphaToCoverageState: MTL4AlphaToCoverageState) -> void {
        func :: #type (obj: *void, selector: *void, alphaToCoverageState: MTL4AlphaToCoverageState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAlphaToCoverageState_, alphaToCoverageState);
    }

    alphaToOneState :: (self: *MTL4RenderPipelineDescriptor) -> MTL4AlphaToOneState {
        func :: #type (obj: *void, selector: *void) -> MTL4AlphaToOneState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.alphaToOneState);
    }

    setAlphaToOneState_ :: (self: *MTL4RenderPipelineDescriptor, alphaToOneState: MTL4AlphaToOneState) -> void {
        func :: #type (obj: *void, selector: *void, alphaToOneState: MTL4AlphaToOneState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAlphaToOneState_, alphaToOneState);
    }

    isRasterizationEnabled :: (self: *MTL4RenderPipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isRasterizationEnabled);
    }

    setRasterizationEnabled_ :: (self: *MTL4RenderPipelineDescriptor, rasterizationEnabled: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, rasterizationEnabled: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRasterizationEnabled_, rasterizationEnabled);
    }

    maxVertexAmplificationCount :: (self: *MTL4RenderPipelineDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxVertexAmplificationCount);
    }

    setMaxVertexAmplificationCount_ :: (self: *MTL4RenderPipelineDescriptor, maxVertexAmplificationCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxVertexAmplificationCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxVertexAmplificationCount_, maxVertexAmplificationCount);
    }

    colorAttachments :: (self: *MTL4RenderPipelineDescriptor) -> *MTL4RenderPipelineColorAttachmentDescriptorArray {
        func :: #type (obj: *void, selector: *void) -> *MTL4RenderPipelineColorAttachmentDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.colorAttachments);
    }

    inputPrimitiveTopology :: (self: *MTL4RenderPipelineDescriptor) -> MTLPrimitiveTopologyClass {
        func :: #type (obj: *void, selector: *void) -> MTLPrimitiveTopologyClass #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.inputPrimitiveTopology);
    }

    setInputPrimitiveTopology_ :: (self: *MTL4RenderPipelineDescriptor, inputPrimitiveTopology: MTLPrimitiveTopologyClass) -> void {
        func :: #type (obj: *void, selector: *void, inputPrimitiveTopology: MTLPrimitiveTopologyClass) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInputPrimitiveTopology_, inputPrimitiveTopology);
    }

    vertexStaticLinkingDescriptor :: (self: *MTL4RenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTL4StaticLinkingDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexStaticLinkingDescriptor);
    }

    setVertexStaticLinkingDescriptor_ :: (self: *MTL4RenderPipelineDescriptor, vertexStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void {
        func :: #type (obj: *void, selector: *void, vertexStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexStaticLinkingDescriptor_, vertexStaticLinkingDescriptor);
    }

    fragmentStaticLinkingDescriptor :: (self: *MTL4RenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTL4StaticLinkingDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentStaticLinkingDescriptor);
    }

    setFragmentStaticLinkingDescriptor_ :: (self: *MTL4RenderPipelineDescriptor, fragmentStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void {
        func :: #type (obj: *void, selector: *void, fragmentStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentStaticLinkingDescriptor_, fragmentStaticLinkingDescriptor);
    }

    supportVertexBinaryLinking :: (self: *MTL4RenderPipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportVertexBinaryLinking);
    }

    setSupportVertexBinaryLinking_ :: (self: *MTL4RenderPipelineDescriptor, supportVertexBinaryLinking: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, supportVertexBinaryLinking: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportVertexBinaryLinking_, supportVertexBinaryLinking);
    }

    supportFragmentBinaryLinking :: (self: *MTL4RenderPipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportFragmentBinaryLinking);
    }

    setSupportFragmentBinaryLinking_ :: (self: *MTL4RenderPipelineDescriptor, supportFragmentBinaryLinking: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, supportFragmentBinaryLinking: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportFragmentBinaryLinking_, supportFragmentBinaryLinking);
    }

    colorAttachmentMappingState :: (self: *MTL4RenderPipelineDescriptor) -> MTL4LogicalToPhysicalColorAttachmentMappingState {
        func :: #type (obj: *void, selector: *void) -> MTL4LogicalToPhysicalColorAttachmentMappingState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.colorAttachmentMappingState);
    }

    setColorAttachmentMappingState_ :: (self: *MTL4RenderPipelineDescriptor, colorAttachmentMappingState: MTL4LogicalToPhysicalColorAttachmentMappingState) -> void {
        func :: #type (obj: *void, selector: *void, colorAttachmentMappingState: MTL4LogicalToPhysicalColorAttachmentMappingState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setColorAttachmentMappingState_, colorAttachmentMappingState);
    }

    supportIndirectCommandBuffers :: (self: *MTL4RenderPipelineDescriptor) -> MTL4IndirectCommandBufferSupportState {
        func :: #type (obj: *void, selector: *void) -> MTL4IndirectCommandBufferSupportState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportIndirectCommandBuffers);
    }

    setSupportIndirectCommandBuffers_ :: (self: *MTL4RenderPipelineDescriptor, supportIndirectCommandBuffers: MTL4IndirectCommandBufferSupportState) -> void {
        func :: #type (obj: *void, selector: *void, supportIndirectCommandBuffers: MTL4IndirectCommandBufferSupportState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportIndirectCommandBuffers_, supportIndirectCommandBuffers);
    }

}

MTL4MachineLearningPipelineDescriptor :: struct {
    setInputDimensions_atBufferIndex_ :: (self: *MTL4MachineLearningPipelineDescriptor, dimensions: *MTLTensorExtents, bufferIndex: NSInteger) -> void {
        func :: #type (obj: *void, selector: *void, dimensions: *MTLTensorExtents, bufferIndex: NSInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInputDimensions_atBufferIndex_, dimensions, bufferIndex);
    }

    setInputDimensions_withRange_ :: (self: *MTL4MachineLearningPipelineDescriptor, dimensions: *NSArray(*MTLTensorExtents), range: NSRange) -> void {
        func :: #type (obj: *void, selector: *void, dimensions: *NSArray(*MTLTensorExtents), range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setInputDimensions_withRange_, dimensions, range);
    }

    inputDimensionsAtBufferIndex_ :: (self: *MTL4MachineLearningPipelineDescriptor, bufferIndex: NSInteger) -> *MTLTensorExtents {
        func :: #type (obj: *void, selector: *void, bufferIndex: NSInteger) -> *MTLTensorExtents #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.inputDimensionsAtBufferIndex_, bufferIndex);
    }

    reset :: (self: *MTL4MachineLearningPipelineDescriptor) -> void {
        func :: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

    label :: (self: *MTL4MachineLearningPipelineDescriptor) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTL4MachineLearningPipelineDescriptor, label: *NSString) -> void {
        func :: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

    machineLearningFunctionDescriptor :: (self: *MTL4MachineLearningPipelineDescriptor) -> *MTL4FunctionDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTL4FunctionDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.machineLearningFunctionDescriptor);
    }

    setMachineLearningFunctionDescriptor_ :: (self: *MTL4MachineLearningPipelineDescriptor, machineLearningFunctionDescriptor: *MTL4FunctionDescriptor) -> void {
        func :: #type (obj: *void, selector: *void, machineLearningFunctionDescriptor: *MTL4FunctionDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMachineLearningFunctionDescriptor_, machineLearningFunctionDescriptor);
    }

}

MTL4MachineLearningPipelineReflection :: struct {
    bindings :: (self: *MTL4MachineLearningPipelineReflection) -> *NSArray(*MTLBinding) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLBinding) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bindings);
    }

}

MTL4TileRenderPipelineDescriptor :: struct {
    reset :: (self: *MTL4TileRenderPipelineDescriptor) -> void {
        func :: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

    tileFunctionDescriptor :: (self: *MTL4TileRenderPipelineDescriptor) -> *MTL4FunctionDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTL4FunctionDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileFunctionDescriptor);
    }

    setTileFunctionDescriptor_ :: (self: *MTL4TileRenderPipelineDescriptor, tileFunctionDescriptor: *MTL4FunctionDescriptor) -> void {
        func :: #type (obj: *void, selector: *void, tileFunctionDescriptor: *MTL4FunctionDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileFunctionDescriptor_, tileFunctionDescriptor);
    }

    rasterSampleCount :: (self: *MTL4TileRenderPipelineDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.rasterSampleCount);
    }

    setRasterSampleCount_ :: (self: *MTL4TileRenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, rasterSampleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRasterSampleCount_, rasterSampleCount);
    }

    colorAttachments :: (self: *MTL4TileRenderPipelineDescriptor) -> *MTLTileRenderPipelineColorAttachmentDescriptorArray {
        func :: #type (obj: *void, selector: *void) -> *MTLTileRenderPipelineColorAttachmentDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.colorAttachments);
    }

    threadgroupSizeMatchesTileSize :: (self: *MTL4TileRenderPipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.threadgroupSizeMatchesTileSize);
    }

    setThreadgroupSizeMatchesTileSize_ :: (self: *MTL4TileRenderPipelineDescriptor, threadgroupSizeMatchesTileSize: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, threadgroupSizeMatchesTileSize: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setThreadgroupSizeMatchesTileSize_, threadgroupSizeMatchesTileSize);
    }

    maxTotalThreadsPerThreadgroup :: (self: *MTL4TileRenderPipelineDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadsPerThreadgroup);
    }

    setMaxTotalThreadsPerThreadgroup_ :: (self: *MTL4TileRenderPipelineDescriptor, maxTotalThreadsPerThreadgroup: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxTotalThreadsPerThreadgroup: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxTotalThreadsPerThreadgroup_, maxTotalThreadsPerThreadgroup);
    }

    requiredThreadsPerThreadgroup :: (self: *MTL4TileRenderPipelineDescriptor) -> MTLSize {
        func :: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.requiredThreadsPerThreadgroup);
    }

    setRequiredThreadsPerThreadgroup_ :: (self: *MTL4TileRenderPipelineDescriptor, requiredThreadsPerThreadgroup: MTLSize) -> void {
        func :: #type (obj: *void, selector: *void, requiredThreadsPerThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRequiredThreadsPerThreadgroup_, requiredThreadsPerThreadgroup);
    }

    staticLinkingDescriptor :: (self: *MTL4TileRenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTL4StaticLinkingDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.staticLinkingDescriptor);
    }

    setStaticLinkingDescriptor_ :: (self: *MTL4TileRenderPipelineDescriptor, staticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void {
        func :: #type (obj: *void, selector: *void, staticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStaticLinkingDescriptor_, staticLinkingDescriptor);
    }

    supportBinaryLinking :: (self: *MTL4TileRenderPipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportBinaryLinking);
    }

    setSupportBinaryLinking_ :: (self: *MTL4TileRenderPipelineDescriptor, supportBinaryLinking: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, supportBinaryLinking: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportBinaryLinking_, supportBinaryLinking);
    }

}

MTL4MeshRenderPipelineDescriptor :: struct {
    reset :: (self: *MTL4MeshRenderPipelineDescriptor) -> void {
        func :: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

    objectFunctionDescriptor :: (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4FunctionDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTL4FunctionDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectFunctionDescriptor);
    }

    setObjectFunctionDescriptor_ :: (self: *MTL4MeshRenderPipelineDescriptor, objectFunctionDescriptor: *MTL4FunctionDescriptor) -> void {
        func :: #type (obj: *void, selector: *void, objectFunctionDescriptor: *MTL4FunctionDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectFunctionDescriptor_, objectFunctionDescriptor);
    }

    meshFunctionDescriptor :: (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4FunctionDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTL4FunctionDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.meshFunctionDescriptor);
    }

    setMeshFunctionDescriptor_ :: (self: *MTL4MeshRenderPipelineDescriptor, meshFunctionDescriptor: *MTL4FunctionDescriptor) -> void {
        func :: #type (obj: *void, selector: *void, meshFunctionDescriptor: *MTL4FunctionDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshFunctionDescriptor_, meshFunctionDescriptor);
    }

    fragmentFunctionDescriptor :: (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4FunctionDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTL4FunctionDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentFunctionDescriptor);
    }

    setFragmentFunctionDescriptor_ :: (self: *MTL4MeshRenderPipelineDescriptor, fragmentFunctionDescriptor: *MTL4FunctionDescriptor) -> void {
        func :: #type (obj: *void, selector: *void, fragmentFunctionDescriptor: *MTL4FunctionDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentFunctionDescriptor_, fragmentFunctionDescriptor);
    }

    maxTotalThreadsPerObjectThreadgroup :: (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadsPerObjectThreadgroup);
    }

    setMaxTotalThreadsPerObjectThreadgroup_ :: (self: *MTL4MeshRenderPipelineDescriptor, maxTotalThreadsPerObjectThreadgroup: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxTotalThreadsPerObjectThreadgroup: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxTotalThreadsPerObjectThreadgroup_, maxTotalThreadsPerObjectThreadgroup);
    }

    maxTotalThreadsPerMeshThreadgroup :: (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadsPerMeshThreadgroup);
    }

    setMaxTotalThreadsPerMeshThreadgroup_ :: (self: *MTL4MeshRenderPipelineDescriptor, maxTotalThreadsPerMeshThreadgroup: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxTotalThreadsPerMeshThreadgroup: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxTotalThreadsPerMeshThreadgroup_, maxTotalThreadsPerMeshThreadgroup);
    }

    requiredThreadsPerObjectThreadgroup :: (self: *MTL4MeshRenderPipelineDescriptor) -> MTLSize {
        func :: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.requiredThreadsPerObjectThreadgroup);
    }

    setRequiredThreadsPerObjectThreadgroup_ :: (self: *MTL4MeshRenderPipelineDescriptor, requiredThreadsPerObjectThreadgroup: MTLSize) -> void {
        func :: #type (obj: *void, selector: *void, requiredThreadsPerObjectThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRequiredThreadsPerObjectThreadgroup_, requiredThreadsPerObjectThreadgroup);
    }

    requiredThreadsPerMeshThreadgroup :: (self: *MTL4MeshRenderPipelineDescriptor) -> MTLSize {
        func :: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.requiredThreadsPerMeshThreadgroup);
    }

    setRequiredThreadsPerMeshThreadgroup_ :: (self: *MTL4MeshRenderPipelineDescriptor, requiredThreadsPerMeshThreadgroup: MTLSize) -> void {
        func :: #type (obj: *void, selector: *void, requiredThreadsPerMeshThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRequiredThreadsPerMeshThreadgroup_, requiredThreadsPerMeshThreadgroup);
    }

    objectThreadgroupSizeIsMultipleOfThreadExecutionWidth :: (self: *MTL4MeshRenderPipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectThreadgroupSizeIsMultipleOfThreadExecutionWidth);
    }

    setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth_ :: (self: *MTL4MeshRenderPipelineDescriptor, objectThreadgroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, objectThreadgroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth_, objectThreadgroupSizeIsMultipleOfThreadExecutionWidth);
    }

    meshThreadgroupSizeIsMultipleOfThreadExecutionWidth :: (self: *MTL4MeshRenderPipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.meshThreadgroupSizeIsMultipleOfThreadExecutionWidth);
    }

    setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth_ :: (self: *MTL4MeshRenderPipelineDescriptor, meshThreadgroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, meshThreadgroupSizeIsMultipleOfThreadExecutionWidth: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth_, meshThreadgroupSizeIsMultipleOfThreadExecutionWidth);
    }

    payloadMemoryLength :: (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.payloadMemoryLength);
    }

    setPayloadMemoryLength_ :: (self: *MTL4MeshRenderPipelineDescriptor, payloadMemoryLength: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, payloadMemoryLength: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPayloadMemoryLength_, payloadMemoryLength);
    }

    maxTotalThreadgroupsPerMeshGrid :: (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadgroupsPerMeshGrid);
    }

    setMaxTotalThreadgroupsPerMeshGrid_ :: (self: *MTL4MeshRenderPipelineDescriptor, maxTotalThreadgroupsPerMeshGrid: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxTotalThreadgroupsPerMeshGrid: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxTotalThreadgroupsPerMeshGrid_, maxTotalThreadgroupsPerMeshGrid);
    }

    rasterSampleCount :: (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.rasterSampleCount);
    }

    setRasterSampleCount_ :: (self: *MTL4MeshRenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, rasterSampleCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRasterSampleCount_, rasterSampleCount);
    }

    alphaToCoverageState :: (self: *MTL4MeshRenderPipelineDescriptor) -> MTL4AlphaToCoverageState {
        func :: #type (obj: *void, selector: *void) -> MTL4AlphaToCoverageState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.alphaToCoverageState);
    }

    setAlphaToCoverageState_ :: (self: *MTL4MeshRenderPipelineDescriptor, alphaToCoverageState: MTL4AlphaToCoverageState) -> void {
        func :: #type (obj: *void, selector: *void, alphaToCoverageState: MTL4AlphaToCoverageState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAlphaToCoverageState_, alphaToCoverageState);
    }

    alphaToOneState :: (self: *MTL4MeshRenderPipelineDescriptor) -> MTL4AlphaToOneState {
        func :: #type (obj: *void, selector: *void) -> MTL4AlphaToOneState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.alphaToOneState);
    }

    setAlphaToOneState_ :: (self: *MTL4MeshRenderPipelineDescriptor, alphaToOneState: MTL4AlphaToOneState) -> void {
        func :: #type (obj: *void, selector: *void, alphaToOneState: MTL4AlphaToOneState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAlphaToOneState_, alphaToOneState);
    }

    isRasterizationEnabled :: (self: *MTL4MeshRenderPipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isRasterizationEnabled);
    }

    setRasterizationEnabled_ :: (self: *MTL4MeshRenderPipelineDescriptor, rasterizationEnabled: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, rasterizationEnabled: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRasterizationEnabled_, rasterizationEnabled);
    }

    maxVertexAmplificationCount :: (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxVertexAmplificationCount);
    }

    setMaxVertexAmplificationCount_ :: (self: *MTL4MeshRenderPipelineDescriptor, maxVertexAmplificationCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxVertexAmplificationCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxVertexAmplificationCount_, maxVertexAmplificationCount);
    }

    colorAttachments :: (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4RenderPipelineColorAttachmentDescriptorArray {
        func :: #type (obj: *void, selector: *void) -> *MTL4RenderPipelineColorAttachmentDescriptorArray #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.colorAttachments);
    }

    objectStaticLinkingDescriptor :: (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTL4StaticLinkingDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectStaticLinkingDescriptor);
    }

    setObjectStaticLinkingDescriptor_ :: (self: *MTL4MeshRenderPipelineDescriptor, objectStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void {
        func :: #type (obj: *void, selector: *void, objectStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectStaticLinkingDescriptor_, objectStaticLinkingDescriptor);
    }

    meshStaticLinkingDescriptor :: (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTL4StaticLinkingDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.meshStaticLinkingDescriptor);
    }

    setMeshStaticLinkingDescriptor_ :: (self: *MTL4MeshRenderPipelineDescriptor, meshStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void {
        func :: #type (obj: *void, selector: *void, meshStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshStaticLinkingDescriptor_, meshStaticLinkingDescriptor);
    }

    fragmentStaticLinkingDescriptor :: (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTL4StaticLinkingDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentStaticLinkingDescriptor);
    }

    setFragmentStaticLinkingDescriptor_ :: (self: *MTL4MeshRenderPipelineDescriptor, fragmentStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void {
        func :: #type (obj: *void, selector: *void, fragmentStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentStaticLinkingDescriptor_, fragmentStaticLinkingDescriptor);
    }

    supportObjectBinaryLinking :: (self: *MTL4MeshRenderPipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportObjectBinaryLinking);
    }

    setSupportObjectBinaryLinking_ :: (self: *MTL4MeshRenderPipelineDescriptor, supportObjectBinaryLinking: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, supportObjectBinaryLinking: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportObjectBinaryLinking_, supportObjectBinaryLinking);
    }

    supportMeshBinaryLinking :: (self: *MTL4MeshRenderPipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportMeshBinaryLinking);
    }

    setSupportMeshBinaryLinking_ :: (self: *MTL4MeshRenderPipelineDescriptor, supportMeshBinaryLinking: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, supportMeshBinaryLinking: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportMeshBinaryLinking_, supportMeshBinaryLinking);
    }

    supportFragmentBinaryLinking :: (self: *MTL4MeshRenderPipelineDescriptor) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportFragmentBinaryLinking);
    }

    setSupportFragmentBinaryLinking_ :: (self: *MTL4MeshRenderPipelineDescriptor, supportFragmentBinaryLinking: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, supportFragmentBinaryLinking: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportFragmentBinaryLinking_, supportFragmentBinaryLinking);
    }

    colorAttachmentMappingState :: (self: *MTL4MeshRenderPipelineDescriptor) -> MTL4LogicalToPhysicalColorAttachmentMappingState {
        func :: #type (obj: *void, selector: *void) -> MTL4LogicalToPhysicalColorAttachmentMappingState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.colorAttachmentMappingState);
    }

    setColorAttachmentMappingState_ :: (self: *MTL4MeshRenderPipelineDescriptor, colorAttachmentMappingState: MTL4LogicalToPhysicalColorAttachmentMappingState) -> void {
        func :: #type (obj: *void, selector: *void, colorAttachmentMappingState: MTL4LogicalToPhysicalColorAttachmentMappingState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setColorAttachmentMappingState_, colorAttachmentMappingState);
    }

    supportIndirectCommandBuffers :: (self: *MTL4MeshRenderPipelineDescriptor) -> MTL4IndirectCommandBufferSupportState {
        func :: #type (obj: *void, selector: *void) -> MTL4IndirectCommandBufferSupportState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportIndirectCommandBuffers);
    }

    setSupportIndirectCommandBuffers_ :: (self: *MTL4MeshRenderPipelineDescriptor, supportIndirectCommandBuffers: MTL4IndirectCommandBufferSupportState) -> void {
        func :: #type (obj: *void, selector: *void, supportIndirectCommandBuffers: MTL4IndirectCommandBufferSupportState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSupportIndirectCommandBuffers_, supportIndirectCommandBuffers);
    }

}

MTL4PipelineDataSetSerializerDescriptor :: struct {
    configuration :: (self: *MTL4PipelineDataSetSerializerDescriptor) -> MTL4PipelineDataSetSerializerConfiguration {
        func :: #type (obj: *void, selector: *void) -> MTL4PipelineDataSetSerializerConfiguration #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.configuration);
    }

    setConfiguration_ :: (self: *MTL4PipelineDataSetSerializerDescriptor, configuration: MTL4PipelineDataSetSerializerConfiguration) -> void {
        func :: #type (obj: *void, selector: *void, configuration: MTL4PipelineDataSetSerializerConfiguration) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setConfiguration_, configuration);
    }

}

MTL4BinaryFunctionDescriptor :: struct {
    name :: (self: *MTL4BinaryFunctionDescriptor) -> *NSString {
        func :: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

    setName_ :: (self: *MTL4BinaryFunctionDescriptor, name: *NSString) -> void {
        func :: #type (obj: *void, selector: *void, name: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setName_, name);
    }

    functionDescriptor :: (self: *MTL4BinaryFunctionDescriptor) -> *MTL4FunctionDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTL4FunctionDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionDescriptor);
    }

    setFunctionDescriptor_ :: (self: *MTL4BinaryFunctionDescriptor, functionDescriptor: *MTL4FunctionDescriptor) -> void {
        func :: #type (obj: *void, selector: *void, functionDescriptor: *MTL4FunctionDescriptor) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFunctionDescriptor_, functionDescriptor);
    }

    options :: (self: *MTL4BinaryFunctionDescriptor) -> MTL4BinaryFunctionOptions {
        func :: #type (obj: *void, selector: *void) -> MTL4BinaryFunctionOptions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.options);
    }

    setOptions_ :: (self: *MTL4BinaryFunctionDescriptor, options: MTL4BinaryFunctionOptions) -> void {
        func :: #type (obj: *void, selector: *void, options: MTL4BinaryFunctionOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOptions_, options);
    }

}

MTL4StaticLinkingDescriptor :: struct {
    functionDescriptors :: (self: *MTL4StaticLinkingDescriptor) -> *NSArray(*MTL4FunctionDescriptor) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTL4FunctionDescriptor) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionDescriptors);
    }

    setFunctionDescriptors_ :: (self: *MTL4StaticLinkingDescriptor, functionDescriptors: *NSArray(*MTL4FunctionDescriptor)) -> void {
        func :: #type (obj: *void, selector: *void, functionDescriptors: *NSArray(*MTL4FunctionDescriptor)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFunctionDescriptors_, functionDescriptors);
    }

    privateFunctionDescriptors :: (self: *MTL4StaticLinkingDescriptor) -> *NSArray(*MTL4FunctionDescriptor) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTL4FunctionDescriptor) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.privateFunctionDescriptors);
    }

    setPrivateFunctionDescriptors_ :: (self: *MTL4StaticLinkingDescriptor, privateFunctionDescriptors: *NSArray(*MTL4FunctionDescriptor)) -> void {
        func :: #type (obj: *void, selector: *void, privateFunctionDescriptors: *NSArray(*MTL4FunctionDescriptor)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPrivateFunctionDescriptors_, privateFunctionDescriptors);
    }

    groups :: (self: *MTL4StaticLinkingDescriptor) -> *NSDictionary(*NSString, *NSArray(*MTL4FunctionDescriptor)) {
        func :: #type (obj: *void, selector: *void) -> *NSDictionary(*NSString, *NSArray(*MTL4FunctionDescriptor)) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.groups);
    }

    setGroups_ :: (self: *MTL4StaticLinkingDescriptor, groups: *NSDictionary(*NSString, *NSArray(*MTL4FunctionDescriptor))) -> void {
        func :: #type (obj: *void, selector: *void, groups: *NSDictionary(*NSString, *NSArray(*MTL4FunctionDescriptor))) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setGroups_, groups);
    }

}

MTL4PipelineStageDynamicLinkingDescriptor :: struct {
    maxCallStackDepth :: (self: *MTL4PipelineStageDynamicLinkingDescriptor) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxCallStackDepth);
    }

    setMaxCallStackDepth_ :: (self: *MTL4PipelineStageDynamicLinkingDescriptor, maxCallStackDepth: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maxCallStackDepth: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaxCallStackDepth_, maxCallStackDepth);
    }

    binaryLinkedFunctions :: (self: *MTL4PipelineStageDynamicLinkingDescriptor) -> *NSArray(*MTL4BinaryFunction) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTL4BinaryFunction) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.binaryLinkedFunctions);
    }

    setBinaryLinkedFunctions_ :: (self: *MTL4PipelineStageDynamicLinkingDescriptor, binaryLinkedFunctions: *NSArray(*MTL4BinaryFunction)) -> void {
        func :: #type (obj: *void, selector: *void, binaryLinkedFunctions: *NSArray(*MTL4BinaryFunction)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBinaryLinkedFunctions_, binaryLinkedFunctions);
    }

    preloadedLibraries :: (self: *MTL4PipelineStageDynamicLinkingDescriptor) -> *NSArray(*MTLDynamicLibrary) {
        func :: #type (obj: *void, selector: *void) -> *NSArray(*MTLDynamicLibrary) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.preloadedLibraries);
    }

    setPreloadedLibraries_ :: (self: *MTL4PipelineStageDynamicLinkingDescriptor, preloadedLibraries: *NSArray(*MTLDynamicLibrary)) -> void {
        func :: #type (obj: *void, selector: *void, preloadedLibraries: *NSArray(*MTLDynamicLibrary)) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPreloadedLibraries_, preloadedLibraries);
    }

}

MTL4RenderPipelineDynamicLinkingDescriptor :: struct {
    vertexLinkingDescriptor :: (self: *MTL4RenderPipelineDynamicLinkingDescriptor) -> *MTL4PipelineStageDynamicLinkingDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTL4PipelineStageDynamicLinkingDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexLinkingDescriptor);
    }

    fragmentLinkingDescriptor :: (self: *MTL4RenderPipelineDynamicLinkingDescriptor) -> *MTL4PipelineStageDynamicLinkingDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTL4PipelineStageDynamicLinkingDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fragmentLinkingDescriptor);
    }

    tileLinkingDescriptor :: (self: *MTL4RenderPipelineDynamicLinkingDescriptor) -> *MTL4PipelineStageDynamicLinkingDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTL4PipelineStageDynamicLinkingDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileLinkingDescriptor);
    }

    objectLinkingDescriptor :: (self: *MTL4RenderPipelineDynamicLinkingDescriptor) -> *MTL4PipelineStageDynamicLinkingDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTL4PipelineStageDynamicLinkingDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectLinkingDescriptor);
    }

    meshLinkingDescriptor :: (self: *MTL4RenderPipelineDynamicLinkingDescriptor) -> *MTL4PipelineStageDynamicLinkingDescriptor {
        func :: #type (obj: *void, selector: *void) -> *MTL4PipelineStageDynamicLinkingDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.meshLinkingDescriptor);
    }

}

CAMetalLayer :: struct {
    nextDrawable :: (self: *CAMetalLayer) -> *CAMetalDrawable {
        func :: #type (obj: *void, selector: *void) -> *CAMetalDrawable #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.nextDrawable);
    }

    device :: (self: *CAMetalLayer) -> *MTLDevice {
        func :: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

    setDevice_ :: (self: *CAMetalLayer, device: *MTLDevice) -> void {
        func :: #type (obj: *void, selector: *void, device: *MTLDevice) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDevice_, device);
    }

    preferredDevice :: (self: *CAMetalLayer) -> *MTLDevice {
        func :: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.preferredDevice);
    }

    pixelFormat :: (self: *CAMetalLayer) -> MTLPixelFormat {
        func :: #type (obj: *void, selector: *void) -> MTLPixelFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pixelFormat);
    }

    setPixelFormat_ :: (self: *CAMetalLayer, pixelFormat: MTLPixelFormat) -> void {
        func :: #type (obj: *void, selector: *void, pixelFormat: MTLPixelFormat) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPixelFormat_, pixelFormat);
    }

    framebufferOnly :: (self: *CAMetalLayer) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.framebufferOnly);
    }

    setFramebufferOnly_ :: (self: *CAMetalLayer, framebufferOnly: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, framebufferOnly: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFramebufferOnly_, framebufferOnly);
    }

    drawableSize :: (self: *CAMetalLayer) -> CGSize {
        func :: #type (obj: *void, selector: *void) -> CGSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawableSize);
    }

    setDrawableSize_ :: (self: *CAMetalLayer, drawableSize: CGSize) -> void {
        func :: #type (obj: *void, selector: *void, drawableSize: CGSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDrawableSize_, drawableSize);
    }

    maximumDrawableCount :: (self: *CAMetalLayer) -> NSUInteger {
        func :: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maximumDrawableCount);
    }

    setMaximumDrawableCount_ :: (self: *CAMetalLayer, maximumDrawableCount: NSUInteger) -> void {
        func :: #type (obj: *void, selector: *void, maximumDrawableCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMaximumDrawableCount_, maximumDrawableCount);
    }

    presentsWithTransaction :: (self: *CAMetalLayer) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.presentsWithTransaction);
    }

    setPresentsWithTransaction_ :: (self: *CAMetalLayer, presentsWithTransaction: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, presentsWithTransaction: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPresentsWithTransaction_, presentsWithTransaction);
    }

    colorspace :: (self: *CAMetalLayer) -> CGColorSpaceRef {
        func :: #type (obj: *void, selector: *void) -> CGColorSpaceRef #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.colorspace);
    }

    setColorspace_ :: (self: *CAMetalLayer, colorspace: CGColorSpaceRef) -> void {
        func :: #type (obj: *void, selector: *void, colorspace: CGColorSpaceRef) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setColorspace_, colorspace);
    }

    wantsExtendedDynamicRangeContent :: (self: *CAMetalLayer) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.wantsExtendedDynamicRangeContent);
    }

    setWantsExtendedDynamicRangeContent_ :: (self: *CAMetalLayer, wantsExtendedDynamicRangeContent: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, wantsExtendedDynamicRangeContent: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setWantsExtendedDynamicRangeContent_, wantsExtendedDynamicRangeContent);
    }

    EDRMetadata :: (self: *CAMetalLayer) -> *CAEDRMetadata {
        func :: #type (obj: *void, selector: *void) -> *CAEDRMetadata #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.EDRMetadata);
    }

    setEDRMetadata_ :: (self: *CAMetalLayer, EDRMetadata: *CAEDRMetadata) -> void {
        func :: #type (obj: *void, selector: *void, EDRMetadata: *CAEDRMetadata) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setEDRMetadata_, EDRMetadata);
    }

    displaySyncEnabled :: (self: *CAMetalLayer) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.displaySyncEnabled);
    }

    setDisplaySyncEnabled_ :: (self: *CAMetalLayer, displaySyncEnabled: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, displaySyncEnabled: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDisplaySyncEnabled_, displaySyncEnabled);
    }

    allowsNextDrawableTimeout :: (self: *CAMetalLayer) -> BOOL {
        func :: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.allowsNextDrawableTimeout);
    }

    setAllowsNextDrawableTimeout_ :: (self: *CAMetalLayer, allowsNextDrawableTimeout: BOOL) -> void {
        func :: #type (obj: *void, selector: *void, allowsNextDrawableTimeout: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAllowsNextDrawableTimeout_, allowsNextDrawableTimeout);
    }

    developerHUDProperties :: (self: *CAMetalLayer) -> *NSDictionary {
        func :: #type (obj: *void, selector: *void) -> *NSDictionary #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.developerHUDProperties);
    }

    setDeveloperHUDProperties_ :: (self: *CAMetalLayer, developerHUDProperties: *NSDictionary) -> void {
        func :: #type (obj: *void, selector: *void, developerHUDProperties: *NSDictionary) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDeveloperHUDProperties_, developerHUDProperties);
    }

    residencySet :: (self: *CAMetalLayer) -> *MTLResidencySet {
        func :: #type (obj: *void, selector: *void) -> *MTLResidencySet #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.residencySet);
    }

}

