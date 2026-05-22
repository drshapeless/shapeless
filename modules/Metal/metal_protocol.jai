MTLCommandEncoder :: struct #type_info_no_size_complaint {
    endEncoding :: (self: *MTLCommandEncoder) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.endEncoding);
    }

    barrierAfterQueueStages_beforeStages_ :: (self: *MTLCommandEncoder, afterQueueStages: MTLStages, beforeStages: MTLStages) -> void {
        func: #type (obj: *void, selector: *void, afterQueueStages: MTLStages, beforeStages: MTLStages) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.barrierAfterQueueStages_beforeStages_, afterQueueStages, beforeStages);
    }

    insertDebugSignpost_ :: (self: *MTLCommandEncoder, str: *NSString) -> void {
        func: #type (obj: *void, selector: *void, str: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.insertDebugSignpost_, str);
    }

    pushDebugGroup_ :: (self: *MTLCommandEncoder, str: *NSString) -> void {
        func: #type (obj: *void, selector: *void, str: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pushDebugGroup_, str);
    }

    popDebugGroup :: (self: *MTLCommandEncoder) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.popDebugGroup);
    }

    device :: (self: *MTLCommandEncoder) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

    label :: (self: *MTLCommandEncoder) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLCommandEncoder, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

}

MTLAllocation :: struct #type_info_no_size_complaint {
    allocatedSize :: (self: *MTLAllocation) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.allocatedSize);
    }

}

MTLResource :: struct #type_info_no_size_complaint {
    setPurgeableState_ :: (self: *MTLResource, state: MTLPurgeableState) -> MTLPurgeableState {
        func: #type (obj: *void, selector: *void, state: MTLPurgeableState) -> MTLPurgeableState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPurgeableState_, state);
    }

    makeAliasable :: (self: *MTLResource) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.makeAliasable);
    }

    isAliasable :: (self: *MTLResource) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isAliasable);
    }

    setOwnerWithIdentity_ :: (self: *MTLResource, task_id_token: u32) -> s32 {
        func: #type (obj: *void, selector: *void, task_id_token: u32) -> s32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOwnerWithIdentity_, task_id_token);
    }

    label :: (self: *MTLResource) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLResource, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

    device :: (self: *MTLResource) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

    cpuCacheMode :: (self: *MTLResource) -> MTLCPUCacheMode {
        func: #type (obj: *void, selector: *void) -> MTLCPUCacheMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.cpuCacheMode);
    }

    storageMode :: (self: *MTLResource) -> MTLStorageMode {
        func: #type (obj: *void, selector: *void) -> MTLStorageMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.storageMode);
    }

    hazardTrackingMode :: (self: *MTLResource) -> MTLHazardTrackingMode {
        func: #type (obj: *void, selector: *void) -> MTLHazardTrackingMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.hazardTrackingMode);
    }

    resourceOptions :: (self: *MTLResource) -> MTLResourceOptions {
        func: #type (obj: *void, selector: *void) -> MTLResourceOptions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resourceOptions);
    }

    heap :: (self: *MTLResource) -> *MTLHeap {
        func: #type (obj: *void, selector: *void) -> *MTLHeap #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.heap);
    }

    heapOffset :: (self: *MTLResource) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.heapOffset);
    }

    allocatedSize :: (self: *MTLResource) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.allocatedSize);
    }

}

MTLTensor :: struct #type_info_no_size_complaint {
    replaceSliceOrigin_sliceDimensions_withBytes_strides_ :: (self: *MTLTensor, sliceOrigin: *MTLTensorExtents, sliceDimensions: *MTLTensorExtents, bytes: *void, strides: *MTLTensorExtents) -> void {
        func: #type (obj: *void, selector: *void, sliceOrigin: *MTLTensorExtents, sliceDimensions: *MTLTensorExtents, bytes: *void, strides: *MTLTensorExtents) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.replaceSliceOrigin_sliceDimensions_withBytes_strides_, sliceOrigin, sliceDimensions, bytes, strides);
    }

    getBytes_strides_fromSliceOrigin_sliceDimensions_ :: (self: *MTLTensor, bytes: *void, strides: *MTLTensorExtents, sliceOrigin: *MTLTensorExtents, sliceDimensions: *MTLTensorExtents) -> void {
        func: #type (obj: *void, selector: *void, bytes: *void, strides: *MTLTensorExtents, sliceOrigin: *MTLTensorExtents, sliceDimensions: *MTLTensorExtents) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.getBytes_strides_fromSliceOrigin_sliceDimensions_, bytes, strides, sliceOrigin, sliceDimensions);
    }

    gpuResourceID :: (self: *MTLTensor) -> MTLResourceID {
        func: #type (obj: *void, selector: *void) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.gpuResourceID);
    }

    buffer :: (self: *MTLTensor) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.buffer);
    }

    bufferOffset :: (self: *MTLTensor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bufferOffset);
    }

    strides :: (self: *MTLTensor) -> *MTLTensorExtents {
        func: #type (obj: *void, selector: *void) -> *MTLTensorExtents #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.strides);
    }

    dimensions :: (self: *MTLTensor) -> *MTLTensorExtents {
        func: #type (obj: *void, selector: *void) -> *MTLTensorExtents #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dimensions);
    }

    dataType :: (self: *MTLTensor) -> MTLTensorDataType {
        func: #type (obj: *void, selector: *void) -> MTLTensorDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dataType);
    }

    usage :: (self: *MTLTensor) -> MTLTensorUsage {
        func: #type (obj: *void, selector: *void) -> MTLTensorUsage #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.usage);
    }

}

MTLBuffer :: struct #type_info_no_size_complaint {
    contents :: (self: *MTLBuffer) -> *void {
        func: #type (obj: *void, selector: *void) -> *void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.contents);
    }

    didModifyRange_ :: (self: *MTLBuffer, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.didModifyRange_, range);
    }

    newTextureWithDescriptor_offset_bytesPerRow_ :: (self: *MTLBuffer, descriptor: *MTLTextureDescriptor, offset: NSUInteger, bytesPerRow: NSUInteger) -> *MTLTexture {
        func: #type (obj: *void, selector: *void, descriptor: *MTLTextureDescriptor, offset: NSUInteger, bytesPerRow: NSUInteger) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newTextureWithDescriptor_offset_bytesPerRow_, descriptor, offset, bytesPerRow);
    }

    newTensorWithDescriptor_offset_error_ :: (self: *MTLBuffer, descriptor: *MTLTensorDescriptor, offset: NSUInteger, error: **NSError) -> *MTLTensor {
        func: #type (obj: *void, selector: *void, descriptor: *MTLTensorDescriptor, offset: NSUInteger, error: **NSError) -> *MTLTensor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newTensorWithDescriptor_offset_error_, descriptor, offset, error);
    }

    addDebugMarker_range_ :: (self: *MTLBuffer, marker: *NSString, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, marker: *NSString, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addDebugMarker_range_, marker, range);
    }

    removeAllDebugMarkers :: (self: *MTLBuffer) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.removeAllDebugMarkers);
    }

    newRemoteBufferViewForDevice_ :: (self: *MTLBuffer, device: *MTLDevice) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void, device: *MTLDevice) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRemoteBufferViewForDevice_, device);
    }

    length :: (self: *MTLBuffer) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.length);
    }

    remoteStorageBuffer :: (self: *MTLBuffer) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.remoteStorageBuffer);
    }

    gpuAddress :: (self: *MTLBuffer) -> MTLGPUAddress {
        func: #type (obj: *void, selector: *void) -> MTLGPUAddress #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.gpuAddress);
    }

    sparseBufferTier :: (self: *MTLBuffer) -> MTLBufferSparseTier {
        func: #type (obj: *void, selector: *void) -> MTLBufferSparseTier #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sparseBufferTier);
    }

}

MTLTexture :: struct #type_info_no_size_complaint {
    getBytes_bytesPerRow_bytesPerImage_fromRegion_mipmapLevel_slice_ :: (self: *MTLTexture, pixelBytes: *void, bytesPerRow: NSUInteger, bytesPerImage: NSUInteger, region: MTLRegion, level: NSUInteger, slice: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, pixelBytes: *void, bytesPerRow: NSUInteger, bytesPerImage: NSUInteger, region: MTLRegion, level: NSUInteger, slice: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.getBytes_bytesPerRow_bytesPerImage_fromRegion_mipmapLevel_slice_, pixelBytes, bytesPerRow, bytesPerImage, region, level, slice);
    }

    replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage_ :: (self: *MTLTexture, region: MTLRegion, level: NSUInteger, slice: NSUInteger, pixelBytes: *void, bytesPerRow: NSUInteger, bytesPerImage: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, region: MTLRegion, level: NSUInteger, slice: NSUInteger, pixelBytes: *void, bytesPerRow: NSUInteger, bytesPerImage: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage_, region, level, slice, pixelBytes, bytesPerRow, bytesPerImage);
    }

    getBytes_bytesPerRow_fromRegion_mipmapLevel_ :: (self: *MTLTexture, pixelBytes: *void, bytesPerRow: NSUInteger, region: MTLRegion, level: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, pixelBytes: *void, bytesPerRow: NSUInteger, region: MTLRegion, level: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.getBytes_bytesPerRow_fromRegion_mipmapLevel_, pixelBytes, bytesPerRow, region, level);
    }

    replaceRegion_mipmapLevel_withBytes_bytesPerRow_ :: (self: *MTLTexture, region: MTLRegion, level: NSUInteger, pixelBytes: *void, bytesPerRow: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, region: MTLRegion, level: NSUInteger, pixelBytes: *void, bytesPerRow: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.replaceRegion_mipmapLevel_withBytes_bytesPerRow_, region, level, pixelBytes, bytesPerRow);
    }

    newTextureViewWithPixelFormat_ :: (self: *MTLTexture, pixelFormat: MTLPixelFormat) -> *MTLTexture {
        func: #type (obj: *void, selector: *void, pixelFormat: MTLPixelFormat) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newTextureViewWithPixelFormat_, pixelFormat);
    }

    newTextureViewWithPixelFormat_textureType_levels_slices_ :: (self: *MTLTexture, pixelFormat: MTLPixelFormat, textureType: MTLTextureType, levelRange: NSRange, sliceRange: NSRange) -> *MTLTexture {
        func: #type (obj: *void, selector: *void, pixelFormat: MTLPixelFormat, textureType: MTLTextureType, levelRange: NSRange, sliceRange: NSRange) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newTextureViewWithPixelFormat_textureType_levels_slices_, pixelFormat, textureType, levelRange, sliceRange);
    }

    newSharedTextureHandle :: (self: *MTLTexture) -> *MTLSharedTextureHandle {
        func: #type (obj: *void, selector: *void) -> *MTLSharedTextureHandle #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newSharedTextureHandle);
    }

    newTextureViewWithDescriptor_ :: (self: *MTLTexture, descriptor: *MTLTextureViewDescriptor) -> *MTLTexture {
        func: #type (obj: *void, selector: *void, descriptor: *MTLTextureViewDescriptor) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newTextureViewWithDescriptor_, descriptor);
    }

    newRemoteTextureViewForDevice_ :: (self: *MTLTexture, device: *MTLDevice) -> *MTLTexture {
        func: #type (obj: *void, selector: *void, device: *MTLDevice) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRemoteTextureViewForDevice_, device);
    }

    newTextureViewWithPixelFormat_textureType_levels_slices_swizzle_ :: (self: *MTLTexture, pixelFormat: MTLPixelFormat, textureType: MTLTextureType, levelRange: NSRange, sliceRange: NSRange, swizzle: MTLTextureSwizzleChannels) -> *MTLTexture {
        func: #type (obj: *void, selector: *void, pixelFormat: MTLPixelFormat, textureType: MTLTextureType, levelRange: NSRange, sliceRange: NSRange, swizzle: MTLTextureSwizzleChannels) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newTextureViewWithPixelFormat_textureType_levels_slices_swizzle_, pixelFormat, textureType, levelRange, sliceRange, swizzle);
    }

    rootResource :: (self: *MTLTexture) -> *MTLResource {
        func: #type (obj: *void, selector: *void) -> *MTLResource #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.rootResource);
    }

    parentTexture :: (self: *MTLTexture) -> *MTLTexture {
        func: #type (obj: *void, selector: *void) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.parentTexture);
    }

    parentRelativeLevel :: (self: *MTLTexture) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.parentRelativeLevel);
    }

    parentRelativeSlice :: (self: *MTLTexture) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.parentRelativeSlice);
    }

    buffer :: (self: *MTLTexture) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.buffer);
    }

    bufferOffset :: (self: *MTLTexture) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bufferOffset);
    }

    bufferBytesPerRow :: (self: *MTLTexture) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bufferBytesPerRow);
    }

    iosurface :: (self: *MTLTexture) -> IOSurfaceRef {
        func: #type (obj: *void, selector: *void) -> IOSurfaceRef #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.iosurface);
    }

    iosurfacePlane :: (self: *MTLTexture) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.iosurfacePlane);
    }

    textureType :: (self: *MTLTexture) -> MTLTextureType {
        func: #type (obj: *void, selector: *void) -> MTLTextureType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.textureType);
    }

    pixelFormat :: (self: *MTLTexture) -> MTLPixelFormat {
        func: #type (obj: *void, selector: *void) -> MTLPixelFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pixelFormat);
    }

    width :: (self: *MTLTexture) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.width);
    }

    height :: (self: *MTLTexture) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.height);
    }

    depth :: (self: *MTLTexture) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.depth);
    }

    mipmapLevelCount :: (self: *MTLTexture) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.mipmapLevelCount);
    }

    sampleCount :: (self: *MTLTexture) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleCount);
    }

    arrayLength :: (self: *MTLTexture) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.arrayLength);
    }

    usage :: (self: *MTLTexture) -> MTLTextureUsage {
        func: #type (obj: *void, selector: *void) -> MTLTextureUsage #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.usage);
    }

    isShareable :: (self: *MTLTexture) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isShareable);
    }

    isFramebufferOnly :: (self: *MTLTexture) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isFramebufferOnly);
    }

    firstMipmapInTail :: (self: *MTLTexture) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.firstMipmapInTail);
    }

    tailSizeInBytes :: (self: *MTLTexture) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tailSizeInBytes);
    }

    isSparse :: (self: *MTLTexture) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isSparse);
    }

    allowGPUOptimizedContents :: (self: *MTLTexture) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.allowGPUOptimizedContents);
    }

    compressionType :: (self: *MTLTexture) -> MTLTextureCompressionType {
        func: #type (obj: *void, selector: *void) -> MTLTextureCompressionType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.compressionType);
    }

    gpuResourceID :: (self: *MTLTexture) -> MTLResourceID {
        func: #type (obj: *void, selector: *void) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.gpuResourceID);
    }

    remoteStorageTexture :: (self: *MTLTexture) -> *MTLTexture {
        func: #type (obj: *void, selector: *void) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.remoteStorageTexture);
    }

    swizzle :: (self: *MTLTexture) -> MTLTextureSwizzleChannels {
        func: #type (obj: *void, selector: *void) -> MTLTextureSwizzleChannels #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.swizzle);
    }

    sparseTextureTier :: (self: *MTLTexture) -> MTLTextureSparseTier {
        func: #type (obj: *void, selector: *void) -> MTLTextureSparseTier #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sparseTextureTier);
    }

}

MTLBinding :: struct #type_info_no_size_complaint {
    name :: (self: *MTLBinding) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

    type :: (self: *MTLBinding) -> MTLBindingType {
        func: #type (obj: *void, selector: *void) -> MTLBindingType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.type);
    }

    access :: (self: *MTLBinding) -> MTLBindingAccess {
        func: #type (obj: *void, selector: *void) -> MTLBindingAccess #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.access);
    }

    index :: (self: *MTLBinding) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.index);
    }

    isUsed :: (self: *MTLBinding) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isUsed);
    }

    isArgument :: (self: *MTLBinding) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isArgument);
    }

}

MTLBufferBinding :: struct #type_info_no_size_complaint {
    bufferAlignment :: (self: *MTLBufferBinding) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bufferAlignment);
    }

    bufferDataSize :: (self: *MTLBufferBinding) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bufferDataSize);
    }

    bufferDataType :: (self: *MTLBufferBinding) -> MTLDataType {
        func: #type (obj: *void, selector: *void) -> MTLDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bufferDataType);
    }

    bufferStructType :: (self: *MTLBufferBinding) -> *MTLStructType {
        func: #type (obj: *void, selector: *void) -> *MTLStructType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bufferStructType);
    }

    bufferPointerType :: (self: *MTLBufferBinding) -> *MTLPointerType {
        func: #type (obj: *void, selector: *void) -> *MTLPointerType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bufferPointerType);
    }

}

MTLThreadgroupBinding :: struct #type_info_no_size_complaint {
    threadgroupMemoryAlignment :: (self: *MTLThreadgroupBinding) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.threadgroupMemoryAlignment);
    }

    threadgroupMemoryDataSize :: (self: *MTLThreadgroupBinding) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.threadgroupMemoryDataSize);
    }

}

MTLTextureBinding :: struct #type_info_no_size_complaint {
    textureType :: (self: *MTLTextureBinding) -> MTLTextureType {
        func: #type (obj: *void, selector: *void) -> MTLTextureType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.textureType);
    }

    textureDataType :: (self: *MTLTextureBinding) -> MTLDataType {
        func: #type (obj: *void, selector: *void) -> MTLDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.textureDataType);
    }

    isDepthTexture :: (self: *MTLTextureBinding) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isDepthTexture);
    }

    arrayLength :: (self: *MTLTextureBinding) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.arrayLength);
    }

}

MTLObjectPayloadBinding :: struct #type_info_no_size_complaint {
    objectPayloadAlignment :: (self: *MTLObjectPayloadBinding) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectPayloadAlignment);
    }

    objectPayloadDataSize :: (self: *MTLObjectPayloadBinding) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectPayloadDataSize);
    }

}

MTLTensorBinding :: struct #type_info_no_size_complaint {
    tensorDataType :: (self: *MTLTensorBinding) -> MTLTensorDataType {
        func: #type (obj: *void, selector: *void) -> MTLTensorDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tensorDataType);
    }

    indexType :: (self: *MTLTensorBinding) -> MTLDataType {
        func: #type (obj: *void, selector: *void) -> MTLDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexType);
    }

    dimensions :: (self: *MTLTensorBinding) -> *MTLTensorExtents {
        func: #type (obj: *void, selector: *void) -> *MTLTensorExtents #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dimensions);
    }

}

MTLFunction :: struct #type_info_no_size_complaint {
    newArgumentEncoderWithBufferIndex_ :: (self: *MTLFunction, bufferIndex: NSUInteger) -> *MTLArgumentEncoder {
        func: #type (obj: *void, selector: *void, bufferIndex: NSUInteger) -> *MTLArgumentEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newArgumentEncoderWithBufferIndex_, bufferIndex);
    }

    newArgumentEncoderWithBufferIndex_reflection_ :: (self: *MTLFunction, bufferIndex: NSUInteger, reflection: **MTLArgument) -> *MTLArgumentEncoder {
        func: #type (obj: *void, selector: *void, bufferIndex: NSUInteger, reflection: **MTLArgument) -> *MTLArgumentEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newArgumentEncoderWithBufferIndex_reflection_, bufferIndex, reflection);
    }

    label :: (self: *MTLFunction) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLFunction, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

    device :: (self: *MTLFunction) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

    functionType :: (self: *MTLFunction) -> MTLFunctionType {
        func: #type (obj: *void, selector: *void) -> MTLFunctionType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionType);
    }

    patchType :: (self: *MTLFunction) -> MTLPatchType {
        func: #type (obj: *void, selector: *void) -> MTLPatchType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.patchType);
    }

    patchControlPointCount :: (self: *MTLFunction) -> NSInteger {
        func: #type (obj: *void, selector: *void) -> NSInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.patchControlPointCount);
    }

    vertexAttributes :: (self: *MTLFunction) -> *NSArray(*MTLVertexAttribute) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLVertexAttribute) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.vertexAttributes);
    }

    stageInputAttributes :: (self: *MTLFunction) -> *NSArray(*MTLAttribute) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLAttribute) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stageInputAttributes);
    }

    name :: (self: *MTLFunction) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

    functionConstantsDictionary :: (self: *MTLFunction) -> *NSDictionary(*NSString, *MTLFunctionConstant) {
        func: #type (obj: *void, selector: *void) -> *NSDictionary(*NSString, *MTLFunctionConstant) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionConstantsDictionary);
    }

    options :: (self: *MTLFunction) -> MTLFunctionOptions {
        func: #type (obj: *void, selector: *void) -> MTLFunctionOptions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.options);
    }

}

MTLLibrary :: struct #type_info_no_size_complaint {
    newFunctionWithName_ :: (self: *MTLLibrary, functionName: *NSString) -> *MTLFunction {
        func: #type (obj: *void, selector: *void, functionName: *NSString) -> *MTLFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newFunctionWithName_, functionName);
    }

    newFunctionWithName_constantValues_error_ :: (self: *MTLLibrary, name: *NSString, constantValues: *MTLFunctionConstantValues, error: **NSError) -> *MTLFunction {
        func: #type (obj: *void, selector: *void, name: *NSString, constantValues: *MTLFunctionConstantValues, error: **NSError) -> *MTLFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newFunctionWithName_constantValues_error_, name, constantValues, error);
    }

    newFunctionWithName_constantValues_completionHandler_ :: (self: *MTLLibrary, name: *NSString, constantValues: *MTLFunctionConstantValues, completionHandler: *void) -> void {
        func: #type (obj: *void, selector: *void, name: *NSString, constantValues: *MTLFunctionConstantValues, completionHandler: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newFunctionWithName_constantValues_completionHandler_, name, constantValues, completionHandler);
    }

    reflectionForFunctionWithName_ :: (self: *MTLLibrary, functionName: *NSString) -> *MTLFunctionReflection {
        func: #type (obj: *void, selector: *void, functionName: *NSString) -> *MTLFunctionReflection #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reflectionForFunctionWithName_, functionName);
    }

    newFunctionWithDescriptor_completionHandler_ :: (self: *MTLLibrary, descriptor: *MTLFunctionDescriptor, completionHandler: *void) -> void {
        func: #type (obj: *void, selector: *void, descriptor: *MTLFunctionDescriptor, completionHandler: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newFunctionWithDescriptor_completionHandler_, descriptor, completionHandler);
    }

    newFunctionWithDescriptor_error_ :: (self: *MTLLibrary, descriptor: *MTLFunctionDescriptor, error: **NSError) -> *MTLFunction {
        func: #type (obj: *void, selector: *void, descriptor: *MTLFunctionDescriptor, error: **NSError) -> *MTLFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newFunctionWithDescriptor_error_, descriptor, error);
    }

    newIntersectionFunctionWithDescriptor_completionHandler_ :: (self: *MTLLibrary, descriptor: *MTLIntersectionFunctionDescriptor, completionHandler: *void) -> void {
        func: #type (obj: *void, selector: *void, descriptor: *MTLIntersectionFunctionDescriptor, completionHandler: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newIntersectionFunctionWithDescriptor_completionHandler_, descriptor, completionHandler);
    }

    newIntersectionFunctionWithDescriptor_error_ :: (self: *MTLLibrary, descriptor: *MTLIntersectionFunctionDescriptor, error: **NSError) -> *MTLFunction {
        func: #type (obj: *void, selector: *void, descriptor: *MTLIntersectionFunctionDescriptor, error: **NSError) -> *MTLFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newIntersectionFunctionWithDescriptor_error_, descriptor, error);
    }

    label :: (self: *MTLLibrary) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLLibrary, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

    device :: (self: *MTLLibrary) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

    functionNames :: (self: *MTLLibrary) -> *NSArray(*NSString) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*NSString) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionNames);
    }

    type :: (self: *MTLLibrary) -> MTLLibraryType {
        func: #type (obj: *void, selector: *void) -> MTLLibraryType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.type);
    }

    installName :: (self: *MTLLibrary) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.installName);
    }

}

MTLCounter :: struct #type_info_no_size_complaint {
    name :: (self: *MTLCounter) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

}

MTLCounterSet :: struct #type_info_no_size_complaint {
    name :: (self: *MTLCounterSet) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

    counters :: (self: *MTLCounterSet) -> *NSArray(*MTLCounter) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLCounter) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.counters);
    }

}

MTLCounterSampleBuffer :: struct #type_info_no_size_complaint {
    resolveCounterRange_ :: (self: *MTLCounterSampleBuffer, range: NSRange) -> *NSData {
        func: #type (obj: *void, selector: *void, range: NSRange) -> *NSData #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resolveCounterRange_, range);
    }

    device :: (self: *MTLCounterSampleBuffer) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

    label :: (self: *MTLCounterSampleBuffer) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    sampleCount :: (self: *MTLCounterSampleBuffer) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleCount);
    }

}

MTL4CompilerTask :: struct #type_info_no_size_complaint {
    waitUntilCompleted :: (self: *MTL4CompilerTask) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.waitUntilCompleted);
    }

    compiler :: (self: *MTL4CompilerTask) -> *MTL4Compiler {
        func: #type (obj: *void, selector: *void) -> *MTL4Compiler #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.compiler);
    }

    status :: (self: *MTL4CompilerTask) -> MTL4CompilerTaskStatus {
        func: #type (obj: *void, selector: *void) -> MTL4CompilerTaskStatus #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.status);
    }

}

MTL4Compiler :: struct #type_info_no_size_complaint {
    newLibraryWithDescriptor_error_ :: (self: *MTL4Compiler, descriptor: *MTL4LibraryDescriptor, error: **NSError) -> *MTLLibrary {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4LibraryDescriptor, error: **NSError) -> *MTLLibrary #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newLibraryWithDescriptor_error_, descriptor, error);
    }

    newDynamicLibrary_error_ :: (self: *MTL4Compiler, library: *MTLLibrary, error: **NSError) -> *MTLDynamicLibrary {
        func: #type (obj: *void, selector: *void, library: *MTLLibrary, error: **NSError) -> *MTLDynamicLibrary #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newDynamicLibrary_error_, library, error);
    }

    newDynamicLibraryWithURL_error_ :: (self: *MTL4Compiler, url: *NSURL, error: **NSError) -> *MTLDynamicLibrary {
        func: #type (obj: *void, selector: *void, url: *NSURL, error: **NSError) -> *MTLDynamicLibrary #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newDynamicLibraryWithURL_error_, url, error);
    }

    newComputePipelineStateWithDescriptor_compilerTaskOptions_error_ :: (self: *MTL4Compiler, descriptor: *MTL4ComputePipelineDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTLComputePipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4ComputePipelineDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTLComputePipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newComputePipelineStateWithDescriptor_compilerTaskOptions_error_, descriptor, compilerTaskOptions, error);
    }

    newComputePipelineStateWithDescriptor_dynamicLinkingDescriptor_compilerTaskOptions_error_ :: (self: *MTL4Compiler, descriptor: *MTL4ComputePipelineDescriptor, dynamicLinkingDescriptor: *MTL4PipelineStageDynamicLinkingDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTLComputePipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4ComputePipelineDescriptor, dynamicLinkingDescriptor: *MTL4PipelineStageDynamicLinkingDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTLComputePipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newComputePipelineStateWithDescriptor_dynamicLinkingDescriptor_compilerTaskOptions_error_, descriptor, dynamicLinkingDescriptor, compilerTaskOptions, error);
    }

    newRenderPipelineStateWithDescriptor_compilerTaskOptions_error_ :: (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTLRenderPipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4PipelineDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTLRenderPipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithDescriptor_compilerTaskOptions_error_, descriptor, compilerTaskOptions, error);
    }

    newRenderPipelineStateWithDescriptor_dynamicLinkingDescriptor_compilerTaskOptions_error_ :: (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, dynamicLinkingDescriptor: *MTL4RenderPipelineDynamicLinkingDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTLRenderPipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4PipelineDescriptor, dynamicLinkingDescriptor: *MTL4RenderPipelineDynamicLinkingDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTLRenderPipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithDescriptor_dynamicLinkingDescriptor_compilerTaskOptions_error_, descriptor, dynamicLinkingDescriptor, compilerTaskOptions, error);
    }

    newRenderPipelineStateBySpecializationWithDescriptor_pipeline_error_ :: (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, pipeline: *MTLRenderPipelineState, error: **NSError) -> *MTLRenderPipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4PipelineDescriptor, pipeline: *MTLRenderPipelineState, error: **NSError) -> *MTLRenderPipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateBySpecializationWithDescriptor_pipeline_error_, descriptor, pipeline, error);
    }

    newBinaryFunctionWithDescriptor_compilerTaskOptions_error_ :: (self: *MTL4Compiler, descriptor: *MTL4BinaryFunctionDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTL4BinaryFunction {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4BinaryFunctionDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTL4BinaryFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newBinaryFunctionWithDescriptor_compilerTaskOptions_error_, descriptor, compilerTaskOptions, error);
    }

    newLibraryWithDescriptor_completionHandler_ :: (self: *MTL4Compiler, descriptor: *MTL4LibraryDescriptor, completionHandler: MTLNewLibraryCompletionHandler) -> *MTL4CompilerTask {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4LibraryDescriptor, completionHandler: MTLNewLibraryCompletionHandler) -> *MTL4CompilerTask #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newLibraryWithDescriptor_completionHandler_, descriptor, completionHandler);
    }

    newDynamicLibrary_completionHandler_ :: (self: *MTL4Compiler, library: *MTLLibrary, completionHandler: MTLNewDynamicLibraryCompletionHandler) -> *MTL4CompilerTask {
        func: #type (obj: *void, selector: *void, library: *MTLLibrary, completionHandler: MTLNewDynamicLibraryCompletionHandler) -> *MTL4CompilerTask #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newDynamicLibrary_completionHandler_, library, completionHandler);
    }

    newDynamicLibraryWithURL_completionHandler_ :: (self: *MTL4Compiler, url: *NSURL, completionHandler: MTLNewDynamicLibraryCompletionHandler) -> *MTL4CompilerTask {
        func: #type (obj: *void, selector: *void, url: *NSURL, completionHandler: MTLNewDynamicLibraryCompletionHandler) -> *MTL4CompilerTask #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newDynamicLibraryWithURL_completionHandler_, url, completionHandler);
    }

    newComputePipelineStateWithDescriptor_compilerTaskOptions_completionHandler_ :: (self: *MTL4Compiler, descriptor: *MTL4ComputePipelineDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTLNewComputePipelineStateCompletionHandler) -> *MTL4CompilerTask {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4ComputePipelineDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTLNewComputePipelineStateCompletionHandler) -> *MTL4CompilerTask #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newComputePipelineStateWithDescriptor_compilerTaskOptions_completionHandler_, descriptor, compilerTaskOptions, completionHandler);
    }

    newComputePipelineStateWithDescriptor_dynamicLinkingDescriptor_compilerTaskOptions_completionHandler_ :: (self: *MTL4Compiler, descriptor: *MTL4ComputePipelineDescriptor, dynamicLinkingDescriptor: *MTL4PipelineStageDynamicLinkingDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTLNewComputePipelineStateCompletionHandler) -> *MTL4CompilerTask {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4ComputePipelineDescriptor, dynamicLinkingDescriptor: *MTL4PipelineStageDynamicLinkingDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTLNewComputePipelineStateCompletionHandler) -> *MTL4CompilerTask #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newComputePipelineStateWithDescriptor_dynamicLinkingDescriptor_compilerTaskOptions_completionHandler_, descriptor, dynamicLinkingDescriptor, compilerTaskOptions, completionHandler);
    }

    newRenderPipelineStateWithDescriptor_compilerTaskOptions_completionHandler_ :: (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTLNewRenderPipelineStateCompletionHandler) -> *MTL4CompilerTask {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4PipelineDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTLNewRenderPipelineStateCompletionHandler) -> *MTL4CompilerTask #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithDescriptor_compilerTaskOptions_completionHandler_, descriptor, compilerTaskOptions, completionHandler);
    }

    newRenderPipelineStateWithDescriptor_dynamicLinkingDescriptor_compilerTaskOptions_completionHandler_ :: (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, dynamicLinkingDescriptor: *MTL4RenderPipelineDynamicLinkingDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTLNewRenderPipelineStateCompletionHandler) -> *MTL4CompilerTask {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4PipelineDescriptor, dynamicLinkingDescriptor: *MTL4RenderPipelineDynamicLinkingDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTLNewRenderPipelineStateCompletionHandler) -> *MTL4CompilerTask #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithDescriptor_dynamicLinkingDescriptor_compilerTaskOptions_completionHandler_, descriptor, dynamicLinkingDescriptor, compilerTaskOptions, completionHandler);
    }

    newRenderPipelineStateBySpecializationWithDescriptor_pipeline_completionHandler_ :: (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, pipeline: *MTLRenderPipelineState, completionHandler: MTLNewRenderPipelineStateCompletionHandler) -> *MTL4CompilerTask {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4PipelineDescriptor, pipeline: *MTLRenderPipelineState, completionHandler: MTLNewRenderPipelineStateCompletionHandler) -> *MTL4CompilerTask #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateBySpecializationWithDescriptor_pipeline_completionHandler_, descriptor, pipeline, completionHandler);
    }

    newBinaryFunctionWithDescriptor_compilerTaskOptions_completionHandler_ :: (self: *MTL4Compiler, descriptor: *MTL4BinaryFunctionDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTL4NewBinaryFunctionCompletionHandler) -> *MTL4CompilerTask {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4BinaryFunctionDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTL4NewBinaryFunctionCompletionHandler) -> *MTL4CompilerTask #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newBinaryFunctionWithDescriptor_compilerTaskOptions_completionHandler_, descriptor, compilerTaskOptions, completionHandler);
    }

    newMachineLearningPipelineStateWithDescriptor_error_ :: (self: *MTL4Compiler, descriptor: *MTL4MachineLearningPipelineDescriptor, error: **NSError) -> *MTL4MachineLearningPipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4MachineLearningPipelineDescriptor, error: **NSError) -> *MTL4MachineLearningPipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newMachineLearningPipelineStateWithDescriptor_error_, descriptor, error);
    }

    newMachineLearningPipelineStateWithDescriptor_completionHandler_ :: (self: *MTL4Compiler, descriptor: *MTL4MachineLearningPipelineDescriptor, completionHandler: MTL4NewMachineLearningPipelineStateCompletionHandler) -> *MTL4CompilerTask {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4MachineLearningPipelineDescriptor, completionHandler: MTL4NewMachineLearningPipelineStateCompletionHandler) -> *MTL4CompilerTask #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newMachineLearningPipelineStateWithDescriptor_completionHandler_, descriptor, completionHandler);
    }

    device :: (self: *MTL4Compiler) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

    label :: (self: *MTL4Compiler) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    pipelineDataSetSerializer :: (self: *MTL4Compiler) -> *MTL4PipelineDataSetSerializer {
        func: #type (obj: *void, selector: *void) -> *MTL4PipelineDataSetSerializer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pipelineDataSetSerializer);
    }

}

MTL4CounterHeap :: struct #type_info_no_size_complaint {
    resolveCounterRange_ :: (self: *MTL4CounterHeap, range: NSRange) -> *NSData {
        func: #type (obj: *void, selector: *void, range: NSRange) -> *NSData #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resolveCounterRange_, range);
    }

    invalidateCounterRange_ :: (self: *MTL4CounterHeap, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.invalidateCounterRange_, range);
    }

    label :: (self: *MTL4CounterHeap) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTL4CounterHeap, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

    count :: (self: *MTL4CounterHeap) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.count);
    }

    type :: (self: *MTL4CounterHeap) -> MTL4CounterHeapType {
        func: #type (obj: *void, selector: *void) -> MTL4CounterHeapType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.type);
    }

}

MTLDevice :: struct #type_info_no_size_complaint {
    newLogStateWithDescriptor_error_ :: (self: *MTLDevice, descriptor: *MTLLogStateDescriptor, error: **NSError) -> *MTLLogState {
        func: #type (obj: *void, selector: *void, descriptor: *MTLLogStateDescriptor, error: **NSError) -> *MTLLogState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newLogStateWithDescriptor_error_, descriptor, error);
    }

    newCommandQueue :: (self: *MTLDevice) -> *MTLCommandQueue {
        func: #type (obj: *void, selector: *void) -> *MTLCommandQueue #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newCommandQueue);
    }

    newCommandQueueWithMaxCommandBufferCount_ :: (self: *MTLDevice, maxCommandBufferCount: NSUInteger) -> *MTLCommandQueue {
        func: #type (obj: *void, selector: *void, maxCommandBufferCount: NSUInteger) -> *MTLCommandQueue #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newCommandQueueWithMaxCommandBufferCount_, maxCommandBufferCount);
    }

    newCommandQueueWithDescriptor_ :: (self: *MTLDevice, descriptor: *MTLCommandQueueDescriptor) -> *MTLCommandQueue {
        func: #type (obj: *void, selector: *void, descriptor: *MTLCommandQueueDescriptor) -> *MTLCommandQueue #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newCommandQueueWithDescriptor_, descriptor);
    }

    heapTextureSizeAndAlignWithDescriptor_ :: (self: *MTLDevice, desc: *MTLTextureDescriptor) -> MTLSizeAndAlign {
        func: #type (obj: *void, selector: *void, desc: *MTLTextureDescriptor) -> MTLSizeAndAlign #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.heapTextureSizeAndAlignWithDescriptor_, desc);
    }

    heapBufferSizeAndAlignWithLength_options_ :: (self: *MTLDevice, length: NSUInteger, options: MTLResourceOptions) -> MTLSizeAndAlign {
        func: #type (obj: *void, selector: *void, length: NSUInteger, options: MTLResourceOptions) -> MTLSizeAndAlign #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.heapBufferSizeAndAlignWithLength_options_, length, options);
    }

    newHeapWithDescriptor_ :: (self: *MTLDevice, descriptor: *MTLHeapDescriptor) -> *MTLHeap {
        func: #type (obj: *void, selector: *void, descriptor: *MTLHeapDescriptor) -> *MTLHeap #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newHeapWithDescriptor_, descriptor);
    }

    newBufferWithLength_options_ :: (self: *MTLDevice, length: NSUInteger, options: MTLResourceOptions) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void, length: NSUInteger, options: MTLResourceOptions) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newBufferWithLength_options_, length, options);
    }

    newBufferWithBytes_length_options_ :: (self: *MTLDevice, pointer: *void, length: NSUInteger, options: MTLResourceOptions) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void, pointer: *void, length: NSUInteger, options: MTLResourceOptions) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newBufferWithBytes_length_options_, pointer, length, options);
    }

    newBufferWithBytesNoCopy_length_options_deallocator_ :: (self: *MTLDevice, pointer: *void, length: NSUInteger, options: MTLResourceOptions, deallocator: *void) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void, pointer: *void, length: NSUInteger, options: MTLResourceOptions, deallocator: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newBufferWithBytesNoCopy_length_options_deallocator_, pointer, length, options, deallocator);
    }

    newDepthStencilStateWithDescriptor_ :: (self: *MTLDevice, descriptor: *MTLDepthStencilDescriptor) -> *MTLDepthStencilState {
        func: #type (obj: *void, selector: *void, descriptor: *MTLDepthStencilDescriptor) -> *MTLDepthStencilState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newDepthStencilStateWithDescriptor_, descriptor);
    }

    newTextureWithDescriptor_ :: (self: *MTLDevice, descriptor: *MTLTextureDescriptor) -> *MTLTexture {
        func: #type (obj: *void, selector: *void, descriptor: *MTLTextureDescriptor) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newTextureWithDescriptor_, descriptor);
    }

    newTextureWithDescriptor_iosurface_plane_ :: (self: *MTLDevice, descriptor: *MTLTextureDescriptor, iosurface: IOSurfaceRef, plane: NSUInteger) -> *MTLTexture {
        func: #type (obj: *void, selector: *void, descriptor: *MTLTextureDescriptor, iosurface: IOSurfaceRef, plane: NSUInteger) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newTextureWithDescriptor_iosurface_plane_, descriptor, iosurface, plane);
    }

    newSharedTextureWithDescriptor_ :: (self: *MTLDevice, descriptor: *MTLTextureDescriptor) -> *MTLTexture {
        func: #type (obj: *void, selector: *void, descriptor: *MTLTextureDescriptor) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newSharedTextureWithDescriptor_, descriptor);
    }

    newSharedTextureWithHandle_ :: (self: *MTLDevice, sharedHandle: *MTLSharedTextureHandle) -> *MTLTexture {
        func: #type (obj: *void, selector: *void, sharedHandle: *MTLSharedTextureHandle) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newSharedTextureWithHandle_, sharedHandle);
    }

    newSamplerStateWithDescriptor_ :: (self: *MTLDevice, descriptor: *MTLSamplerDescriptor) -> *MTLSamplerState {
        func: #type (obj: *void, selector: *void, descriptor: *MTLSamplerDescriptor) -> *MTLSamplerState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newSamplerStateWithDescriptor_, descriptor);
    }

    newDefaultLibrary :: (self: *MTLDevice) -> *MTLLibrary {
        func: #type (obj: *void, selector: *void) -> *MTLLibrary #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newDefaultLibrary);
    }

    newDefaultLibraryWithBundle_error_ :: (self: *MTLDevice, bundle: *NSBundle, error: **NSError) -> *MTLLibrary {
        func: #type (obj: *void, selector: *void, bundle: *NSBundle, error: **NSError) -> *MTLLibrary #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newDefaultLibraryWithBundle_error_, bundle, error);
    }

    newLibraryWithFile_error_ :: (self: *MTLDevice, filepath: *NSString, error: **NSError) -> *MTLLibrary {
        func: #type (obj: *void, selector: *void, filepath: *NSString, error: **NSError) -> *MTLLibrary #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newLibraryWithFile_error_, filepath, error);
    }

    newLibraryWithURL_error_ :: (self: *MTLDevice, url: *NSURL, error: **NSError) -> *MTLLibrary {
        func: #type (obj: *void, selector: *void, url: *NSURL, error: **NSError) -> *MTLLibrary #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newLibraryWithURL_error_, url, error);
    }

    newLibraryWithData_error_ :: (self: *MTLDevice, data: dispatch_data_t, error: **NSError) -> *MTLLibrary {
        func: #type (obj: *void, selector: *void, data: dispatch_data_t, error: **NSError) -> *MTLLibrary #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newLibraryWithData_error_, data, error);
    }

    newLibraryWithSource_options_error_ :: (self: *MTLDevice, source: *NSString, options: *MTLCompileOptions, error: **NSError) -> *MTLLibrary {
        func: #type (obj: *void, selector: *void, source: *NSString, options: *MTLCompileOptions, error: **NSError) -> *MTLLibrary #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newLibraryWithSource_options_error_, source, options, error);
    }

    newLibraryWithSource_options_completionHandler_ :: (self: *MTLDevice, source: *NSString, options: *MTLCompileOptions, completionHandler: MTLNewLibraryCompletionHandler) -> void {
        func: #type (obj: *void, selector: *void, source: *NSString, options: *MTLCompileOptions, completionHandler: MTLNewLibraryCompletionHandler) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newLibraryWithSource_options_completionHandler_, source, options, completionHandler);
    }

    newLibraryWithStitchedDescriptor_error_ :: (self: *MTLDevice, descriptor: *MTLStitchedLibraryDescriptor, error: **NSError) -> *MTLLibrary {
        func: #type (obj: *void, selector: *void, descriptor: *MTLStitchedLibraryDescriptor, error: **NSError) -> *MTLLibrary #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newLibraryWithStitchedDescriptor_error_, descriptor, error);
    }

    newLibraryWithStitchedDescriptor_completionHandler_ :: (self: *MTLDevice, descriptor: *MTLStitchedLibraryDescriptor, completionHandler: MTLNewLibraryCompletionHandler) -> void {
        func: #type (obj: *void, selector: *void, descriptor: *MTLStitchedLibraryDescriptor, completionHandler: MTLNewLibraryCompletionHandler) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newLibraryWithStitchedDescriptor_completionHandler_, descriptor, completionHandler);
    }

    newRenderPipelineStateWithDescriptor_error_ :: (self: *MTLDevice, descriptor: *MTLRenderPipelineDescriptor, error: **NSError) -> *MTLRenderPipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTLRenderPipelineDescriptor, error: **NSError) -> *MTLRenderPipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithDescriptor_error_, descriptor, error);
    }

    newRenderPipelineStateWithDescriptor_options_reflection_error_ :: (self: *MTLDevice, descriptor: *MTLRenderPipelineDescriptor, options: MTLPipelineOption, reflection: **MTLRenderPipelineReflection, error: **NSError) -> *MTLRenderPipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTLRenderPipelineDescriptor, options: MTLPipelineOption, reflection: **MTLRenderPipelineReflection, error: **NSError) -> *MTLRenderPipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithDescriptor_options_reflection_error_, descriptor, options, reflection, error);
    }

    newRenderPipelineStateWithDescriptor_completionHandler_ :: (self: *MTLDevice, descriptor: *MTLRenderPipelineDescriptor, completionHandler: MTLNewRenderPipelineStateCompletionHandler) -> void {
        func: #type (obj: *void, selector: *void, descriptor: *MTLRenderPipelineDescriptor, completionHandler: MTLNewRenderPipelineStateCompletionHandler) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithDescriptor_completionHandler_, descriptor, completionHandler);
    }

    newRenderPipelineStateWithDescriptor_options_completionHandler_ :: (self: *MTLDevice, descriptor: *MTLRenderPipelineDescriptor, options: MTLPipelineOption, completionHandler: MTLNewRenderPipelineStateWithReflectionCompletionHandler) -> void {
        func: #type (obj: *void, selector: *void, descriptor: *MTLRenderPipelineDescriptor, options: MTLPipelineOption, completionHandler: MTLNewRenderPipelineStateWithReflectionCompletionHandler) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithDescriptor_options_completionHandler_, descriptor, options, completionHandler);
    }

    newComputePipelineStateWithFunction_error_ :: (self: *MTLDevice, computeFunction: *MTLFunction, error: **NSError) -> *MTLComputePipelineState {
        func: #type (obj: *void, selector: *void, computeFunction: *MTLFunction, error: **NSError) -> *MTLComputePipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newComputePipelineStateWithFunction_error_, computeFunction, error);
    }

    newComputePipelineStateWithFunction_options_reflection_error_ :: (self: *MTLDevice, computeFunction: *MTLFunction, options: MTLPipelineOption, reflection: **MTLComputePipelineReflection, error: **NSError) -> *MTLComputePipelineState {
        func: #type (obj: *void, selector: *void, computeFunction: *MTLFunction, options: MTLPipelineOption, reflection: **MTLComputePipelineReflection, error: **NSError) -> *MTLComputePipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newComputePipelineStateWithFunction_options_reflection_error_, computeFunction, options, reflection, error);
    }

    newComputePipelineStateWithFunction_completionHandler_ :: (self: *MTLDevice, computeFunction: *MTLFunction, completionHandler: MTLNewComputePipelineStateCompletionHandler) -> void {
        func: #type (obj: *void, selector: *void, computeFunction: *MTLFunction, completionHandler: MTLNewComputePipelineStateCompletionHandler) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newComputePipelineStateWithFunction_completionHandler_, computeFunction, completionHandler);
    }

    newComputePipelineStateWithFunction_options_completionHandler_ :: (self: *MTLDevice, computeFunction: *MTLFunction, options: MTLPipelineOption, completionHandler: MTLNewComputePipelineStateWithReflectionCompletionHandler) -> void {
        func: #type (obj: *void, selector: *void, computeFunction: *MTLFunction, options: MTLPipelineOption, completionHandler: MTLNewComputePipelineStateWithReflectionCompletionHandler) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newComputePipelineStateWithFunction_options_completionHandler_, computeFunction, options, completionHandler);
    }

    newComputePipelineStateWithDescriptor_options_reflection_error_ :: (self: *MTLDevice, descriptor: *MTLComputePipelineDescriptor, options: MTLPipelineOption, reflection: **MTLComputePipelineReflection, error: **NSError) -> *MTLComputePipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTLComputePipelineDescriptor, options: MTLPipelineOption, reflection: **MTLComputePipelineReflection, error: **NSError) -> *MTLComputePipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newComputePipelineStateWithDescriptor_options_reflection_error_, descriptor, options, reflection, error);
    }

    newComputePipelineStateWithDescriptor_options_completionHandler_ :: (self: *MTLDevice, descriptor: *MTLComputePipelineDescriptor, options: MTLPipelineOption, completionHandler: MTLNewComputePipelineStateWithReflectionCompletionHandler) -> void {
        func: #type (obj: *void, selector: *void, descriptor: *MTLComputePipelineDescriptor, options: MTLPipelineOption, completionHandler: MTLNewComputePipelineStateWithReflectionCompletionHandler) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newComputePipelineStateWithDescriptor_options_completionHandler_, descriptor, options, completionHandler);
    }

    newFence :: (self: *MTLDevice) -> *MTLFence {
        func: #type (obj: *void, selector: *void) -> *MTLFence #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newFence);
    }

    supportsFeatureSet_ :: (self: *MTLDevice, featureSet: MTLFeatureSet) -> BOOL {
        func: #type (obj: *void, selector: *void, featureSet: MTLFeatureSet) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsFeatureSet_, featureSet);
    }

    supportsFamily_ :: (self: *MTLDevice, gpuFamily: MTLGPUFamily) -> BOOL {
        func: #type (obj: *void, selector: *void, gpuFamily: MTLGPUFamily) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsFamily_, gpuFamily);
    }

    supportsTextureSampleCount_ :: (self: *MTLDevice, sampleCount: NSUInteger) -> BOOL {
        func: #type (obj: *void, selector: *void, sampleCount: NSUInteger) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsTextureSampleCount_, sampleCount);
    }

    minimumLinearTextureAlignmentForPixelFormat_ :: (self: *MTLDevice, format: MTLPixelFormat) -> NSUInteger {
        func: #type (obj: *void, selector: *void, format: MTLPixelFormat) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.minimumLinearTextureAlignmentForPixelFormat_, format);
    }

    minimumTextureBufferAlignmentForPixelFormat_ :: (self: *MTLDevice, format: MTLPixelFormat) -> NSUInteger {
        func: #type (obj: *void, selector: *void, format: MTLPixelFormat) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.minimumTextureBufferAlignmentForPixelFormat_, format);
    }

    newRenderPipelineStateWithTileDescriptor_options_reflection_error_ :: (self: *MTLDevice, descriptor: *MTLTileRenderPipelineDescriptor, options: MTLPipelineOption, reflection: **MTLRenderPipelineReflection, error: **NSError) -> *MTLRenderPipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTLTileRenderPipelineDescriptor, options: MTLPipelineOption, reflection: **MTLRenderPipelineReflection, error: **NSError) -> *MTLRenderPipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithTileDescriptor_options_reflection_error_, descriptor, options, reflection, error);
    }

    newRenderPipelineStateWithTileDescriptor_options_completionHandler_ :: (self: *MTLDevice, descriptor: *MTLTileRenderPipelineDescriptor, options: MTLPipelineOption, completionHandler: MTLNewRenderPipelineStateWithReflectionCompletionHandler) -> void {
        func: #type (obj: *void, selector: *void, descriptor: *MTLTileRenderPipelineDescriptor, options: MTLPipelineOption, completionHandler: MTLNewRenderPipelineStateWithReflectionCompletionHandler) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithTileDescriptor_options_completionHandler_, descriptor, options, completionHandler);
    }

    newRenderPipelineStateWithMeshDescriptor_options_reflection_error_ :: (self: *MTLDevice, descriptor: *MTLMeshRenderPipelineDescriptor, options: MTLPipelineOption, reflection: **MTLRenderPipelineReflection, error: **NSError) -> *MTLRenderPipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTLMeshRenderPipelineDescriptor, options: MTLPipelineOption, reflection: **MTLRenderPipelineReflection, error: **NSError) -> *MTLRenderPipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithMeshDescriptor_options_reflection_error_, descriptor, options, reflection, error);
    }

    newRenderPipelineStateWithMeshDescriptor_options_completionHandler_ :: (self: *MTLDevice, descriptor: *MTLMeshRenderPipelineDescriptor, options: MTLPipelineOption, completionHandler: MTLNewRenderPipelineStateWithReflectionCompletionHandler) -> void {
        func: #type (obj: *void, selector: *void, descriptor: *MTLMeshRenderPipelineDescriptor, options: MTLPipelineOption, completionHandler: MTLNewRenderPipelineStateWithReflectionCompletionHandler) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithMeshDescriptor_options_completionHandler_, descriptor, options, completionHandler);
    }

    getDefaultSamplePositions_count_ :: (self: *MTLDevice, positions: *MTLSamplePosition, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, positions: *MTLSamplePosition, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.getDefaultSamplePositions_count_, positions, count);
    }

    newArgumentEncoderWithArguments_ :: (self: *MTLDevice, arguments: *NSArray(*MTLArgumentDescriptor)) -> *MTLArgumentEncoder {
        func: #type (obj: *void, selector: *void, arguments: *NSArray(*MTLArgumentDescriptor)) -> *MTLArgumentEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newArgumentEncoderWithArguments_, arguments);
    }

    supportsRasterizationRateMapWithLayerCount_ :: (self: *MTLDevice, layerCount: NSUInteger) -> BOOL {
        func: #type (obj: *void, selector: *void, layerCount: NSUInteger) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsRasterizationRateMapWithLayerCount_, layerCount);
    }

    newRasterizationRateMapWithDescriptor_ :: (self: *MTLDevice, descriptor: *MTLRasterizationRateMapDescriptor) -> *MTLRasterizationRateMap {
        func: #type (obj: *void, selector: *void, descriptor: *MTLRasterizationRateMapDescriptor) -> *MTLRasterizationRateMap #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRasterizationRateMapWithDescriptor_, descriptor);
    }

    newIndirectCommandBufferWithDescriptor_maxCommandCount_options_ :: (self: *MTLDevice, descriptor: *MTLIndirectCommandBufferDescriptor, maxCount: NSUInteger, options: MTLResourceOptions) -> *MTLIndirectCommandBuffer {
        func: #type (obj: *void, selector: *void, descriptor: *MTLIndirectCommandBufferDescriptor, maxCount: NSUInteger, options: MTLResourceOptions) -> *MTLIndirectCommandBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newIndirectCommandBufferWithDescriptor_maxCommandCount_options_, descriptor, maxCount, options);
    }

    newEvent :: (self: *MTLDevice) -> *MTLEvent {
        func: #type (obj: *void, selector: *void) -> *MTLEvent #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newEvent);
    }

    newSharedEvent :: (self: *MTLDevice) -> *MTLSharedEvent {
        func: #type (obj: *void, selector: *void) -> *MTLSharedEvent #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newSharedEvent);
    }

    newSharedEventWithHandle_ :: (self: *MTLDevice, sharedEventHandle: *MTLSharedEventHandle) -> *MTLSharedEvent {
        func: #type (obj: *void, selector: *void, sharedEventHandle: *MTLSharedEventHandle) -> *MTLSharedEvent #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newSharedEventWithHandle_, sharedEventHandle);
    }

    newIOHandleWithURL_error_ :: (self: *MTLDevice, url: *NSURL, error: **NSError) -> *MTLIOFileHandle {
        func: #type (obj: *void, selector: *void, url: *NSURL, error: **NSError) -> *MTLIOFileHandle #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newIOHandleWithURL_error_, url, error);
    }

    newIOCommandQueueWithDescriptor_error_ :: (self: *MTLDevice, descriptor: *MTLIOCommandQueueDescriptor, error: **NSError) -> *MTLIOCommandQueue {
        func: #type (obj: *void, selector: *void, descriptor: *MTLIOCommandQueueDescriptor, error: **NSError) -> *MTLIOCommandQueue #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newIOCommandQueueWithDescriptor_error_, descriptor, error);
    }

    newIOHandleWithURL_compressionMethod_error_ :: (self: *MTLDevice, url: *NSURL, compressionMethod: MTLIOCompressionMethod, error: **NSError) -> *MTLIOFileHandle {
        func: #type (obj: *void, selector: *void, url: *NSURL, compressionMethod: MTLIOCompressionMethod, error: **NSError) -> *MTLIOFileHandle #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newIOHandleWithURL_compressionMethod_error_, url, compressionMethod, error);
    }

    newIOFileHandleWithURL_error_ :: (self: *MTLDevice, url: *NSURL, error: **NSError) -> *MTLIOFileHandle {
        func: #type (obj: *void, selector: *void, url: *NSURL, error: **NSError) -> *MTLIOFileHandle #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newIOFileHandleWithURL_error_, url, error);
    }

    newIOFileHandleWithURL_compressionMethod_error_ :: (self: *MTLDevice, url: *NSURL, compressionMethod: MTLIOCompressionMethod, error: **NSError) -> *MTLIOFileHandle {
        func: #type (obj: *void, selector: *void, url: *NSURL, compressionMethod: MTLIOCompressionMethod, error: **NSError) -> *MTLIOFileHandle #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newIOFileHandleWithURL_compressionMethod_error_, url, compressionMethod, error);
    }

    sparseTileSizeWithTextureType_pixelFormat_sampleCount_ :: (self: *MTLDevice, textureType: MTLTextureType, pixelFormat: MTLPixelFormat, sampleCount: NSUInteger) -> MTLSize {
        func: #type (obj: *void, selector: *void, textureType: MTLTextureType, pixelFormat: MTLPixelFormat, sampleCount: NSUInteger) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sparseTileSizeWithTextureType_pixelFormat_sampleCount_, textureType, pixelFormat, sampleCount);
    }

    convertSparsePixelRegions_toTileRegions_withTileSize_alignmentMode_numRegions_ :: (self: *MTLDevice, pixelRegions: *MTLRegion, tileRegions: *MTLRegion, tileSize: MTLSize, mode: MTLSparseTextureRegionAlignmentMode, numRegions: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, pixelRegions: *MTLRegion, tileRegions: *MTLRegion, tileSize: MTLSize, mode: MTLSparseTextureRegionAlignmentMode, numRegions: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.convertSparsePixelRegions_toTileRegions_withTileSize_alignmentMode_numRegions_, pixelRegions, tileRegions, tileSize, mode, numRegions);
    }

    convertSparseTileRegions_toPixelRegions_withTileSize_numRegions_ :: (self: *MTLDevice, tileRegions: *MTLRegion, pixelRegions: *MTLRegion, tileSize: MTLSize, numRegions: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, tileRegions: *MTLRegion, pixelRegions: *MTLRegion, tileSize: MTLSize, numRegions: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.convertSparseTileRegions_toPixelRegions_withTileSize_numRegions_, tileRegions, pixelRegions, tileSize, numRegions);
    }

    sparseTileSizeInBytesForSparsePageSize_ :: (self: *MTLDevice, sparsePageSize: MTLSparsePageSize) -> NSUInteger {
        func: #type (obj: *void, selector: *void, sparsePageSize: MTLSparsePageSize) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sparseTileSizeInBytesForSparsePageSize_, sparsePageSize);
    }

    sparseTileSizeWithTextureType_pixelFormat_sampleCount_sparsePageSize_ :: (self: *MTLDevice, textureType: MTLTextureType, pixelFormat: MTLPixelFormat, sampleCount: NSUInteger, sparsePageSize: MTLSparsePageSize) -> MTLSize {
        func: #type (obj: *void, selector: *void, textureType: MTLTextureType, pixelFormat: MTLPixelFormat, sampleCount: NSUInteger, sparsePageSize: MTLSparsePageSize) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sparseTileSizeWithTextureType_pixelFormat_sampleCount_sparsePageSize_, textureType, pixelFormat, sampleCount, sparsePageSize);
    }

    newCounterSampleBufferWithDescriptor_error_ :: (self: *MTLDevice, descriptor: *MTLCounterSampleBufferDescriptor, error: **NSError) -> *MTLCounterSampleBuffer {
        func: #type (obj: *void, selector: *void, descriptor: *MTLCounterSampleBufferDescriptor, error: **NSError) -> *MTLCounterSampleBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newCounterSampleBufferWithDescriptor_error_, descriptor, error);
    }

    sampleTimestamps_gpuTimestamp_ :: (self: *MTLDevice, cpuTimestamp: *MTLTimestamp, gpuTimestamp: *MTLTimestamp) -> void {
        func: #type (obj: *void, selector: *void, cpuTimestamp: *MTLTimestamp, gpuTimestamp: *MTLTimestamp) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleTimestamps_gpuTimestamp_, cpuTimestamp, gpuTimestamp);
    }

    newArgumentEncoderWithBufferBinding_ :: (self: *MTLDevice, bufferBinding: *MTLBufferBinding) -> *MTLArgumentEncoder {
        func: #type (obj: *void, selector: *void, bufferBinding: *MTLBufferBinding) -> *MTLArgumentEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newArgumentEncoderWithBufferBinding_, bufferBinding);
    }

    supportsCounterSampling_ :: (self: *MTLDevice, samplingPoint: MTLCounterSamplingPoint) -> BOOL {
        func: #type (obj: *void, selector: *void, samplingPoint: MTLCounterSamplingPoint) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsCounterSampling_, samplingPoint);
    }

    supportsVertexAmplificationCount_ :: (self: *MTLDevice, count: NSUInteger) -> BOOL {
        func: #type (obj: *void, selector: *void, count: NSUInteger) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsVertexAmplificationCount_, count);
    }

    newDynamicLibrary_error_ :: (self: *MTLDevice, library: *MTLLibrary, error: **NSError) -> *MTLDynamicLibrary {
        func: #type (obj: *void, selector: *void, library: *MTLLibrary, error: **NSError) -> *MTLDynamicLibrary #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newDynamicLibrary_error_, library, error);
    }

    newDynamicLibraryWithURL_error_ :: (self: *MTLDevice, url: *NSURL, error: **NSError) -> *MTLDynamicLibrary {
        func: #type (obj: *void, selector: *void, url: *NSURL, error: **NSError) -> *MTLDynamicLibrary #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newDynamicLibraryWithURL_error_, url, error);
    }

    newBinaryArchiveWithDescriptor_error_ :: (self: *MTLDevice, descriptor: *MTLBinaryArchiveDescriptor, error: **NSError) -> *MTLBinaryArchive {
        func: #type (obj: *void, selector: *void, descriptor: *MTLBinaryArchiveDescriptor, error: **NSError) -> *MTLBinaryArchive #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newBinaryArchiveWithDescriptor_error_, descriptor, error);
    }

    accelerationStructureSizesWithDescriptor_ :: (self: *MTLDevice, descriptor: *MTLAccelerationStructureDescriptor) -> MTLAccelerationStructureSizes {
        func: #type (obj: *void, selector: *void, descriptor: *MTLAccelerationStructureDescriptor) -> MTLAccelerationStructureSizes #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.accelerationStructureSizesWithDescriptor_, descriptor);
    }

    newAccelerationStructureWithSize_ :: (self: *MTLDevice, size: NSUInteger) -> *MTLAccelerationStructure {
        func: #type (obj: *void, selector: *void, size: NSUInteger) -> *MTLAccelerationStructure #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newAccelerationStructureWithSize_, size);
    }

    newAccelerationStructureWithDescriptor_ :: (self: *MTLDevice, descriptor: *MTLAccelerationStructureDescriptor) -> *MTLAccelerationStructure {
        func: #type (obj: *void, selector: *void, descriptor: *MTLAccelerationStructureDescriptor) -> *MTLAccelerationStructure #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newAccelerationStructureWithDescriptor_, descriptor);
    }

    heapAccelerationStructureSizeAndAlignWithSize_ :: (self: *MTLDevice, size: NSUInteger) -> MTLSizeAndAlign {
        func: #type (obj: *void, selector: *void, size: NSUInteger) -> MTLSizeAndAlign #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.heapAccelerationStructureSizeAndAlignWithSize_, size);
    }

    heapAccelerationStructureSizeAndAlignWithDescriptor_ :: (self: *MTLDevice, descriptor: *MTLAccelerationStructureDescriptor) -> MTLSizeAndAlign {
        func: #type (obj: *void, selector: *void, descriptor: *MTLAccelerationStructureDescriptor) -> MTLSizeAndAlign #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.heapAccelerationStructureSizeAndAlignWithDescriptor_, descriptor);
    }

    newResidencySetWithDescriptor_error_ :: (self: *MTLDevice, desc: *MTLResidencySetDescriptor, error: **NSError) -> *MTLResidencySet {
        func: #type (obj: *void, selector: *void, desc: *MTLResidencySetDescriptor, error: **NSError) -> *MTLResidencySet #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newResidencySetWithDescriptor_error_, desc, error);
    }

    tensorSizeAndAlignWithDescriptor_ :: (self: *MTLDevice, descriptor: *MTLTensorDescriptor) -> MTLSizeAndAlign {
        func: #type (obj: *void, selector: *void, descriptor: *MTLTensorDescriptor) -> MTLSizeAndAlign #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tensorSizeAndAlignWithDescriptor_, descriptor);
    }

    newTensorWithDescriptor_error_ :: (self: *MTLDevice, descriptor: *MTLTensorDescriptor, error: **NSError) -> *MTLTensor {
        func: #type (obj: *void, selector: *void, descriptor: *MTLTensorDescriptor, error: **NSError) -> *MTLTensor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newTensorWithDescriptor_error_, descriptor, error);
    }

    functionHandleWithFunction_ :: (self: *MTLDevice, function: *MTLFunction) -> *MTLFunctionHandle {
        func: #type (obj: *void, selector: *void, function: *MTLFunction) -> *MTLFunctionHandle #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionHandleWithFunction_, function);
    }

    newCommandAllocator :: (self: *MTLDevice) -> *MTL4CommandAllocator {
        func: #type (obj: *void, selector: *void) -> *MTL4CommandAllocator #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newCommandAllocator);
    }

    newCommandAllocatorWithDescriptor_error_ :: (self: *MTLDevice, descriptor: *MTL4CommandAllocatorDescriptor, error: **NSError) -> *MTL4CommandAllocator {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4CommandAllocatorDescriptor, error: **NSError) -> *MTL4CommandAllocator #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newCommandAllocatorWithDescriptor_error_, descriptor, error);
    }

    newMTL4CommandQueue :: (self: *MTLDevice) -> *MTL4CommandQueue {
        func: #type (obj: *void, selector: *void) -> *MTL4CommandQueue #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newMTL4CommandQueue);
    }

    newMTL4CommandQueueWithDescriptor_error_ :: (self: *MTLDevice, descriptor: *MTL4CommandQueueDescriptor, error: **NSError) -> *MTL4CommandQueue {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4CommandQueueDescriptor, error: **NSError) -> *MTL4CommandQueue #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newMTL4CommandQueueWithDescriptor_error_, descriptor, error);
    }

    newCommandBuffer :: (self: *MTLDevice) -> *MTL4CommandBuffer {
        func: #type (obj: *void, selector: *void) -> *MTL4CommandBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newCommandBuffer);
    }

    newArgumentTableWithDescriptor_error_ :: (self: *MTLDevice, descriptor: *MTL4ArgumentTableDescriptor, error: **NSError) -> *MTL4ArgumentTable {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4ArgumentTableDescriptor, error: **NSError) -> *MTL4ArgumentTable #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newArgumentTableWithDescriptor_error_, descriptor, error);
    }

    newTextureViewPoolWithDescriptor_error_ :: (self: *MTLDevice, descriptor: *MTLResourceViewPoolDescriptor, error: **NSError) -> *MTLTextureViewPool {
        func: #type (obj: *void, selector: *void, descriptor: *MTLResourceViewPoolDescriptor, error: **NSError) -> *MTLTextureViewPool #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newTextureViewPoolWithDescriptor_error_, descriptor, error);
    }

    newCompilerWithDescriptor_error_ :: (self: *MTLDevice, descriptor: *MTL4CompilerDescriptor, error: **NSError) -> *MTL4Compiler {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4CompilerDescriptor, error: **NSError) -> *MTL4Compiler #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newCompilerWithDescriptor_error_, descriptor, error);
    }

    newArchiveWithURL_error_ :: (self: *MTLDevice, url: *NSURL, error: **NSError) -> *MTL4Archive {
        func: #type (obj: *void, selector: *void, url: *NSURL, error: **NSError) -> *MTL4Archive #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newArchiveWithURL_error_, url, error);
    }

    newPipelineDataSetSerializerWithDescriptor_ :: (self: *MTLDevice, descriptor: *MTL4PipelineDataSetSerializerDescriptor) -> *MTL4PipelineDataSetSerializer {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4PipelineDataSetSerializerDescriptor) -> *MTL4PipelineDataSetSerializer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newPipelineDataSetSerializerWithDescriptor_, descriptor);
    }

    newBufferWithLength_options_placementSparsePageSize_ :: (self: *MTLDevice, length: NSUInteger, options: MTLResourceOptions, placementSparsePageSize: MTLSparsePageSize) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void, length: NSUInteger, options: MTLResourceOptions, placementSparsePageSize: MTLSparsePageSize) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newBufferWithLength_options_placementSparsePageSize_, length, options, placementSparsePageSize);
    }

    newCounterHeapWithDescriptor_error_ :: (self: *MTLDevice, descriptor: *MTL4CounterHeapDescriptor, error: **NSError) -> *MTL4CounterHeap {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4CounterHeapDescriptor, error: **NSError) -> *MTL4CounterHeap #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newCounterHeapWithDescriptor_error_, descriptor, error);
    }

    sizeOfCounterHeapEntry_ :: (self: *MTLDevice, type: MTL4CounterHeapType) -> NSUInteger {
        func: #type (obj: *void, selector: *void, type: MTL4CounterHeapType) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sizeOfCounterHeapEntry_, type);
    }

    queryTimestampFrequency :: (self: *MTLDevice) -> u64 {
        func: #type (obj: *void, selector: *void) -> u64 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.queryTimestampFrequency);
    }

    functionHandleWithBinaryFunction_ :: (self: *MTLDevice, function: *MTL4BinaryFunction) -> *MTLFunctionHandle {
        func: #type (obj: *void, selector: *void, function: *MTL4BinaryFunction) -> *MTLFunctionHandle #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionHandleWithBinaryFunction_, function);
    }

    name :: (self: *MTLDevice) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

    registryID :: (self: *MTLDevice) -> u64 {
        func: #type (obj: *void, selector: *void) -> u64 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.registryID);
    }

    architecture :: (self: *MTLDevice) -> *MTLArchitecture {
        func: #type (obj: *void, selector: *void) -> *MTLArchitecture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.architecture);
    }

    maxThreadsPerThreadgroup :: (self: *MTLDevice) -> MTLSize {
        func: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxThreadsPerThreadgroup);
    }

    isLowPower :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isLowPower);
    }

    isHeadless :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isHeadless);
    }

    isRemovable :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isRemovable);
    }

    hasUnifiedMemory :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.hasUnifiedMemory);
    }

    recommendedMaxWorkingSetSize :: (self: *MTLDevice) -> u64 {
        func: #type (obj: *void, selector: *void) -> u64 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.recommendedMaxWorkingSetSize);
    }

    location :: (self: *MTLDevice) -> MTLDeviceLocation {
        func: #type (obj: *void, selector: *void) -> MTLDeviceLocation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.location);
    }

    locationNumber :: (self: *MTLDevice) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.locationNumber);
    }

    maxTransferRate :: (self: *MTLDevice) -> u64 {
        func: #type (obj: *void, selector: *void) -> u64 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTransferRate);
    }

    isDepth24Stencil8PixelFormatSupported :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isDepth24Stencil8PixelFormatSupported);
    }

    readWriteTextureSupport :: (self: *MTLDevice) -> MTLReadWriteTextureTier {
        func: #type (obj: *void, selector: *void) -> MTLReadWriteTextureTier #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.readWriteTextureSupport);
    }

    argumentBuffersSupport :: (self: *MTLDevice) -> MTLArgumentBuffersTier {
        func: #type (obj: *void, selector: *void) -> MTLArgumentBuffersTier #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.argumentBuffersSupport);
    }

    areRasterOrderGroupsSupported :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.areRasterOrderGroupsSupported);
    }

    supports32BitFloatFiltering :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supports32BitFloatFiltering);
    }

    supports32BitMSAA :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supports32BitMSAA);
    }

    supportsQueryTextureLOD :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsQueryTextureLOD);
    }

    supportsBCTextureCompression :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsBCTextureCompression);
    }

    supportsPullModelInterpolation :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsPullModelInterpolation);
    }

    areBarycentricCoordsSupported :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.areBarycentricCoordsSupported);
    }

    supportsShaderBarycentricCoordinates :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsShaderBarycentricCoordinates);
    }

    currentAllocatedSize :: (self: *MTLDevice) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.currentAllocatedSize);
    }

    maxThreadgroupMemoryLength :: (self: *MTLDevice) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxThreadgroupMemoryLength);
    }

    maxArgumentBufferSamplerCount :: (self: *MTLDevice) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxArgumentBufferSamplerCount);
    }

    areProgrammableSamplePositionsSupported :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.areProgrammableSamplePositionsSupported);
    }

    peerGroupID :: (self: *MTLDevice) -> u64 {
        func: #type (obj: *void, selector: *void) -> u64 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.peerGroupID);
    }

    peerIndex :: (self: *MTLDevice) -> u32 {
        func: #type (obj: *void, selector: *void) -> u32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.peerIndex);
    }

    peerCount :: (self: *MTLDevice) -> u32 {
        func: #type (obj: *void, selector: *void) -> u32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.peerCount);
    }

    sparseTileSizeInBytes :: (self: *MTLDevice) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sparseTileSizeInBytes);
    }

    maxBufferLength :: (self: *MTLDevice) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxBufferLength);
    }

    counterSets :: (self: *MTLDevice) -> *NSArray(*MTLCounterSet) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLCounterSet) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.counterSets);
    }

    supportsDynamicLibraries :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsDynamicLibraries);
    }

    supportsRenderDynamicLibraries :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsRenderDynamicLibraries);
    }

    supportsPlacementSparse :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsPlacementSparse);
    }

    supportsRaytracing :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsRaytracing);
    }

    supportsFunctionPointers :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsFunctionPointers);
    }

    supportsFunctionPointersFromRender :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsFunctionPointersFromRender);
    }

    supportsRaytracingFromRender :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsRaytracingFromRender);
    }

    supportsPrimitiveMotionBlur :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsPrimitiveMotionBlur);
    }

    shouldMaximizeConcurrentCompilation :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.shouldMaximizeConcurrentCompilation);
    }

    setShouldMaximizeConcurrentCompilation_ :: (self: *MTLDevice, shouldMaximizeConcurrentCompilation: BOOL) -> void {
        func: #type (obj: *void, selector: *void, shouldMaximizeConcurrentCompilation: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setShouldMaximizeConcurrentCompilation_, shouldMaximizeConcurrentCompilation);
    }

    maximumConcurrentCompilationTaskCount :: (self: *MTLDevice) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maximumConcurrentCompilationTaskCount);
    }

}

MTLFence :: struct #type_info_no_size_complaint {
    device :: (self: *MTLFence) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

    label :: (self: *MTLFence) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLFence, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

}

MTLResourceStateCommandEncoder :: struct #type_info_no_size_complaint {
    updateTextureMappings_mode_regions_mipLevels_slices_numRegions_ :: (self: *MTLResourceStateCommandEncoder, texture: *MTLTexture, mode: MTLSparseTextureMappingMode, regions: *MTLRegion, mipLevels: *NSUInteger, slices: *NSUInteger, numRegions: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, mode: MTLSparseTextureMappingMode, regions: *MTLRegion, mipLevels: *NSUInteger, slices: *NSUInteger, numRegions: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.updateTextureMappings_mode_regions_mipLevels_slices_numRegions_, texture, mode, regions, mipLevels, slices, numRegions);
    }

    updateTextureMapping_mode_region_mipLevel_slice_ :: (self: *MTLResourceStateCommandEncoder, texture: *MTLTexture, mode: MTLSparseTextureMappingMode, region: MTLRegion, mipLevel: NSUInteger, slice: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, mode: MTLSparseTextureMappingMode, region: MTLRegion, mipLevel: NSUInteger, slice: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.updateTextureMapping_mode_region_mipLevel_slice_, texture, mode, region, mipLevel, slice);
    }

    updateTextureMapping_mode_indirectBuffer_indirectBufferOffset_ :: (self: *MTLResourceStateCommandEncoder, texture: *MTLTexture, mode: MTLSparseTextureMappingMode, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, mode: MTLSparseTextureMappingMode, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.updateTextureMapping_mode_indirectBuffer_indirectBufferOffset_, texture, mode, indirectBuffer, indirectBufferOffset);
    }

    updateFence_ :: (self: *MTLResourceStateCommandEncoder, fence: *MTLFence) -> void {
        func: #type (obj: *void, selector: *void, fence: *MTLFence) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.updateFence_, fence);
    }

    waitForFence_ :: (self: *MTLResourceStateCommandEncoder, fence: *MTLFence) -> void {
        func: #type (obj: *void, selector: *void, fence: *MTLFence) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.waitForFence_, fence);
    }

    moveTextureMappingsFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_ :: (self: *MTLResourceStateCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> void {
        func: #type (obj: *void, selector: *void, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.moveTextureMappingsFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_, sourceTexture, sourceSlice, sourceLevel, sourceOrigin, sourceSize, destinationTexture, destinationSlice, destinationLevel, destinationOrigin);
    }

}

MTLBlitCommandEncoder :: struct #type_info_no_size_complaint {
    synchronizeResource_ :: (self: *MTLBlitCommandEncoder, resource: *MTLResource) -> void {
        func: #type (obj: *void, selector: *void, resource: *MTLResource) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.synchronizeResource_, resource);
    }

    synchronizeTexture_slice_level_ :: (self: *MTLBlitCommandEncoder, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.synchronizeTexture_slice_level_, texture, slice, level);
    }

    copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_ :: (self: *MTLBlitCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> void {
        func: #type (obj: *void, selector: *void, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_, sourceTexture, sourceSlice, sourceLevel, sourceOrigin, sourceSize, destinationTexture, destinationSlice, destinationLevel, destinationOrigin);
    }

    copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_ :: (self: *MTLBlitCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> void {
        func: #type (obj: *void, selector: *void, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_, sourceBuffer, sourceOffset, sourceBytesPerRow, sourceBytesPerImage, sourceSize, destinationTexture, destinationSlice, destinationLevel, destinationOrigin);
    }

    copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_options_ :: (self: *MTLBlitCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin, options: MTLBlitOption) -> void {
        func: #type (obj: *void, selector: *void, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin, options: MTLBlitOption) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_options_, sourceBuffer, sourceOffset, sourceBytesPerRow, sourceBytesPerImage, sourceSize, destinationTexture, destinationSlice, destinationLevel, destinationOrigin, options);
    }

    copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_ :: (self: *MTLBlitCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, destinationBytesPerRow: NSUInteger, destinationBytesPerImage: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, destinationBytesPerRow: NSUInteger, destinationBytesPerImage: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_, sourceTexture, sourceSlice, sourceLevel, sourceOrigin, sourceSize, destinationBuffer, destinationOffset, destinationBytesPerRow, destinationBytesPerImage);
    }

    copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_options_ :: (self: *MTLBlitCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, destinationBytesPerRow: NSUInteger, destinationBytesPerImage: NSUInteger, options: MTLBlitOption) -> void {
        func: #type (obj: *void, selector: *void, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, destinationBytesPerRow: NSUInteger, destinationBytesPerImage: NSUInteger, options: MTLBlitOption) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_options_, sourceTexture, sourceSlice, sourceLevel, sourceOrigin, sourceSize, destinationBuffer, destinationOffset, destinationBytesPerRow, destinationBytesPerImage, options);
    }

    generateMipmapsForTexture_ :: (self: *MTLBlitCommandEncoder, texture: *MTLTexture) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.generateMipmapsForTexture_, texture);
    }

    fillBuffer_range_value_ :: (self: *MTLBlitCommandEncoder, buffer: *MTLBuffer, range: NSRange, value: u8) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, range: NSRange, value: u8) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fillBuffer_range_value_, buffer, range, value);
    }

    copyFromTexture_sourceSlice_sourceLevel_toTexture_destinationSlice_destinationLevel_sliceCount_levelCount_ :: (self: *MTLBlitCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, sliceCount: NSUInteger, levelCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, sliceCount: NSUInteger, levelCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromTexture_sourceSlice_sourceLevel_toTexture_destinationSlice_destinationLevel_sliceCount_levelCount_, sourceTexture, sourceSlice, sourceLevel, destinationTexture, destinationSlice, destinationLevel, sliceCount, levelCount);
    }

    copyFromTexture_toTexture_ :: (self: *MTLBlitCommandEncoder, sourceTexture: *MTLTexture, destinationTexture: *MTLTexture) -> void {
        func: #type (obj: *void, selector: *void, sourceTexture: *MTLTexture, destinationTexture: *MTLTexture) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromTexture_toTexture_, sourceTexture, destinationTexture);
    }

    copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_ :: (self: *MTLBlitCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, size: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, size: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_, sourceBuffer, sourceOffset, destinationBuffer, destinationOffset, size);
    }

    updateFence_ :: (self: *MTLBlitCommandEncoder, fence: *MTLFence) -> void {
        func: #type (obj: *void, selector: *void, fence: *MTLFence) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.updateFence_, fence);
    }

    waitForFence_ :: (self: *MTLBlitCommandEncoder, fence: *MTLFence) -> void {
        func: #type (obj: *void, selector: *void, fence: *MTLFence) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.waitForFence_, fence);
    }

    getTextureAccessCounters_region_mipLevel_slice_resetCounters_countersBuffer_countersBufferOffset_ :: (self: *MTLBlitCommandEncoder, texture: *MTLTexture, region: MTLRegion, mipLevel: NSUInteger, slice: NSUInteger, resetCounters: BOOL, countersBuffer: *MTLBuffer, countersBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, region: MTLRegion, mipLevel: NSUInteger, slice: NSUInteger, resetCounters: BOOL, countersBuffer: *MTLBuffer, countersBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.getTextureAccessCounters_region_mipLevel_slice_resetCounters_countersBuffer_countersBufferOffset_, texture, region, mipLevel, slice, resetCounters, countersBuffer, countersBufferOffset);
    }

    resetTextureAccessCounters_region_mipLevel_slice_ :: (self: *MTLBlitCommandEncoder, texture: *MTLTexture, region: MTLRegion, mipLevel: NSUInteger, slice: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, region: MTLRegion, mipLevel: NSUInteger, slice: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resetTextureAccessCounters_region_mipLevel_slice_, texture, region, mipLevel, slice);
    }

    optimizeContentsForGPUAccess_ :: (self: *MTLBlitCommandEncoder, texture: *MTLTexture) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.optimizeContentsForGPUAccess_, texture);
    }

    optimizeContentsForGPUAccess_slice_level_ :: (self: *MTLBlitCommandEncoder, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.optimizeContentsForGPUAccess_slice_level_, texture, slice, level);
    }

    optimizeContentsForCPUAccess_ :: (self: *MTLBlitCommandEncoder, texture: *MTLTexture) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.optimizeContentsForCPUAccess_, texture);
    }

    optimizeContentsForCPUAccess_slice_level_ :: (self: *MTLBlitCommandEncoder, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.optimizeContentsForCPUAccess_slice_level_, texture, slice, level);
    }

    resetCommandsInBuffer_withRange_ :: (self: *MTLBlitCommandEncoder, buffer: *MTLIndirectCommandBuffer, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLIndirectCommandBuffer, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resetCommandsInBuffer_withRange_, buffer, range);
    }

    copyIndirectCommandBuffer_sourceRange_destination_destinationIndex_ :: (self: *MTLBlitCommandEncoder, source: *MTLIndirectCommandBuffer, sourceRange: NSRange, destination: *MTLIndirectCommandBuffer, destinationIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, source: *MTLIndirectCommandBuffer, sourceRange: NSRange, destination: *MTLIndirectCommandBuffer, destinationIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyIndirectCommandBuffer_sourceRange_destination_destinationIndex_, source, sourceRange, destination, destinationIndex);
    }

    optimizeIndirectCommandBuffer_withRange_ :: (self: *MTLBlitCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, indirectCommandBuffer: *MTLIndirectCommandBuffer, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.optimizeIndirectCommandBuffer_withRange_, indirectCommandBuffer, range);
    }

    sampleCountersInBuffer_atSampleIndex_withBarrier_ :: (self: *MTLBlitCommandEncoder, sampleBuffer: *MTLCounterSampleBuffer, sampleIndex: NSUInteger, barrier: BOOL) -> void {
        func: #type (obj: *void, selector: *void, sampleBuffer: *MTLCounterSampleBuffer, sampleIndex: NSUInteger, barrier: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleCountersInBuffer_atSampleIndex_withBarrier_, sampleBuffer, sampleIndex, barrier);
    }

    resolveCounters_inRange_destinationBuffer_destinationOffset_ :: (self: *MTLBlitCommandEncoder, sampleBuffer: *MTLCounterSampleBuffer, range: NSRange, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampleBuffer: *MTLCounterSampleBuffer, range: NSRange, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resolveCounters_inRange_destinationBuffer_destinationOffset_, sampleBuffer, range, destinationBuffer, destinationOffset);
    }

    copyFromTensor_sourceOrigin_sourceDimensions_toTensor_destinationOrigin_destinationDimensions_ :: (self: *MTLBlitCommandEncoder, sourceTensor: *MTLTensor, sourceOrigin: *MTLTensorExtents, sourceDimensions: *MTLTensorExtents, destinationTensor: *MTLTensor, destinationOrigin: *MTLTensorExtents, destinationDimensions: *MTLTensorExtents) -> void {
        func: #type (obj: *void, selector: *void, sourceTensor: *MTLTensor, sourceOrigin: *MTLTensorExtents, sourceDimensions: *MTLTensorExtents, destinationTensor: *MTLTensor, destinationOrigin: *MTLTensorExtents, destinationDimensions: *MTLTensorExtents) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromTensor_sourceOrigin_sourceDimensions_toTensor_destinationOrigin_destinationDimensions_, sourceTensor, sourceOrigin, sourceDimensions, destinationTensor, destinationOrigin, destinationDimensions);
    }

}

MTLCommandBufferEncoderInfo :: struct #type_info_no_size_complaint {
    label :: (self: *MTLCommandBufferEncoderInfo) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    debugSignposts :: (self: *MTLCommandBufferEncoderInfo) -> *NSArray(*NSString) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*NSString) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.debugSignposts);
    }

    errorState :: (self: *MTLCommandBufferEncoderInfo) -> MTLCommandEncoderErrorState {
        func: #type (obj: *void, selector: *void) -> MTLCommandEncoderErrorState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.errorState);
    }

}

MTLCommandBuffer :: struct #type_info_no_size_complaint {
    enqueue :: (self: *MTLCommandBuffer) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.enqueue);
    }

    commit :: (self: *MTLCommandBuffer) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.commit);
    }

    addScheduledHandler_ :: (self: *MTLCommandBuffer, block: MTLCommandBufferHandler) -> void {
        func: #type (obj: *void, selector: *void, block: MTLCommandBufferHandler) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addScheduledHandler_, block);
    }

    presentDrawable_ :: (self: *MTLCommandBuffer, drawable: *MTLDrawable) -> void {
        func: #type (obj: *void, selector: *void, drawable: *MTLDrawable) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.presentDrawable_, drawable);
    }

    presentDrawable_atTime_ :: (self: *MTLCommandBuffer, drawable: *MTLDrawable, presentationTime: CFTimeInterval) -> void {
        func: #type (obj: *void, selector: *void, drawable: *MTLDrawable, presentationTime: CFTimeInterval) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.presentDrawable_atTime_, drawable, presentationTime);
    }

    presentDrawable_afterMinimumDuration_ :: (self: *MTLCommandBuffer, drawable: *MTLDrawable, duration: CFTimeInterval) -> void {
        func: #type (obj: *void, selector: *void, drawable: *MTLDrawable, duration: CFTimeInterval) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.presentDrawable_afterMinimumDuration_, drawable, duration);
    }

    waitUntilScheduled :: (self: *MTLCommandBuffer) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.waitUntilScheduled);
    }

    addCompletedHandler_ :: (self: *MTLCommandBuffer, block: MTLCommandBufferHandler) -> void {
        func: #type (obj: *void, selector: *void, block: MTLCommandBufferHandler) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addCompletedHandler_, block);
    }

    waitUntilCompleted :: (self: *MTLCommandBuffer) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.waitUntilCompleted);
    }

    blitCommandEncoder :: (self: *MTLCommandBuffer) -> *MTLBlitCommandEncoder {
        func: #type (obj: *void, selector: *void) -> *MTLBlitCommandEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.blitCommandEncoder);
    }

    renderCommandEncoderWithDescriptor_ :: (self: *MTLCommandBuffer, renderPassDescriptor: *MTLRenderPassDescriptor) -> *MTLRenderCommandEncoder {
        func: #type (obj: *void, selector: *void, renderPassDescriptor: *MTLRenderPassDescriptor) -> *MTLRenderCommandEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.renderCommandEncoderWithDescriptor_, renderPassDescriptor);
    }

    computeCommandEncoderWithDescriptor_ :: (self: *MTLCommandBuffer, computePassDescriptor: *MTLComputePassDescriptor) -> *MTLComputeCommandEncoder {
        func: #type (obj: *void, selector: *void, computePassDescriptor: *MTLComputePassDescriptor) -> *MTLComputeCommandEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.computeCommandEncoderWithDescriptor_, computePassDescriptor);
    }

    blitCommandEncoderWithDescriptor_ :: (self: *MTLCommandBuffer, blitPassDescriptor: *MTLBlitPassDescriptor) -> *MTLBlitCommandEncoder {
        func: #type (obj: *void, selector: *void, blitPassDescriptor: *MTLBlitPassDescriptor) -> *MTLBlitCommandEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.blitCommandEncoderWithDescriptor_, blitPassDescriptor);
    }

    computeCommandEncoder :: (self: *MTLCommandBuffer) -> *MTLComputeCommandEncoder {
        func: #type (obj: *void, selector: *void) -> *MTLComputeCommandEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.computeCommandEncoder);
    }

    computeCommandEncoderWithDispatchType_ :: (self: *MTLCommandBuffer, dispatchType: MTLDispatchType) -> *MTLComputeCommandEncoder {
        func: #type (obj: *void, selector: *void, dispatchType: MTLDispatchType) -> *MTLComputeCommandEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.computeCommandEncoderWithDispatchType_, dispatchType);
    }

    encodeWaitForEvent_value_ :: (self: *MTLCommandBuffer, event: *MTLEvent, value: u64) -> void {
        func: #type (obj: *void, selector: *void, event: *MTLEvent, value: u64) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.encodeWaitForEvent_value_, event, value);
    }

    encodeSignalEvent_value_ :: (self: *MTLCommandBuffer, event: *MTLEvent, value: u64) -> void {
        func: #type (obj: *void, selector: *void, event: *MTLEvent, value: u64) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.encodeSignalEvent_value_, event, value);
    }

    parallelRenderCommandEncoderWithDescriptor_ :: (self: *MTLCommandBuffer, renderPassDescriptor: *MTLRenderPassDescriptor) -> *MTLParallelRenderCommandEncoder {
        func: #type (obj: *void, selector: *void, renderPassDescriptor: *MTLRenderPassDescriptor) -> *MTLParallelRenderCommandEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.parallelRenderCommandEncoderWithDescriptor_, renderPassDescriptor);
    }

    resourceStateCommandEncoder :: (self: *MTLCommandBuffer) -> *MTLResourceStateCommandEncoder {
        func: #type (obj: *void, selector: *void) -> *MTLResourceStateCommandEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resourceStateCommandEncoder);
    }

    resourceStateCommandEncoderWithDescriptor_ :: (self: *MTLCommandBuffer, resourceStatePassDescriptor: *MTLResourceStatePassDescriptor) -> *MTLResourceStateCommandEncoder {
        func: #type (obj: *void, selector: *void, resourceStatePassDescriptor: *MTLResourceStatePassDescriptor) -> *MTLResourceStateCommandEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resourceStateCommandEncoderWithDescriptor_, resourceStatePassDescriptor);
    }

    accelerationStructureCommandEncoder :: (self: *MTLCommandBuffer) -> *MTLAccelerationStructureCommandEncoder {
        func: #type (obj: *void, selector: *void) -> *MTLAccelerationStructureCommandEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.accelerationStructureCommandEncoder);
    }

    accelerationStructureCommandEncoderWithDescriptor_ :: (self: *MTLCommandBuffer, descriptor: *MTLAccelerationStructurePassDescriptor) -> *MTLAccelerationStructureCommandEncoder {
        func: #type (obj: *void, selector: *void, descriptor: *MTLAccelerationStructurePassDescriptor) -> *MTLAccelerationStructureCommandEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.accelerationStructureCommandEncoderWithDescriptor_, descriptor);
    }

    pushDebugGroup_ :: (self: *MTLCommandBuffer, str: *NSString) -> void {
        func: #type (obj: *void, selector: *void, str: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pushDebugGroup_, str);
    }

    popDebugGroup :: (self: *MTLCommandBuffer) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.popDebugGroup);
    }

    useResidencySet_ :: (self: *MTLCommandBuffer, residencySet: *MTLResidencySet) -> void {
        func: #type (obj: *void, selector: *void, residencySet: *MTLResidencySet) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useResidencySet_, residencySet);
    }

    useResidencySets_count_ :: (self: *MTLCommandBuffer, residencySets: **MTLResidencySet, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, residencySets: **MTLResidencySet, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useResidencySets_count_, residencySets, count);
    }

    device :: (self: *MTLCommandBuffer) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

    commandQueue :: (self: *MTLCommandBuffer) -> *MTLCommandQueue {
        func: #type (obj: *void, selector: *void) -> *MTLCommandQueue #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.commandQueue);
    }

    retainedReferences :: (self: *MTLCommandBuffer) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.retainedReferences);
    }

    errorOptions :: (self: *MTLCommandBuffer) -> MTLCommandBufferErrorOption {
        func: #type (obj: *void, selector: *void) -> MTLCommandBufferErrorOption #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.errorOptions);
    }

    label :: (self: *MTLCommandBuffer) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLCommandBuffer, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

    kernelStartTime :: (self: *MTLCommandBuffer) -> CFTimeInterval {
        func: #type (obj: *void, selector: *void) -> CFTimeInterval #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.kernelStartTime);
    }

    kernelEndTime :: (self: *MTLCommandBuffer) -> CFTimeInterval {
        func: #type (obj: *void, selector: *void) -> CFTimeInterval #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.kernelEndTime);
    }

    logs :: (self: *MTLCommandBuffer) -> *MTLLogContainer {
        func: #type (obj: *void, selector: *void) -> *MTLLogContainer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.logs);
    }

    GPUStartTime :: (self: *MTLCommandBuffer) -> CFTimeInterval {
        func: #type (obj: *void, selector: *void) -> CFTimeInterval #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.GPUStartTime);
    }

    GPUEndTime :: (self: *MTLCommandBuffer) -> CFTimeInterval {
        func: #type (obj: *void, selector: *void) -> CFTimeInterval #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.GPUEndTime);
    }

    status :: (self: *MTLCommandBuffer) -> MTLCommandBufferStatus {
        func: #type (obj: *void, selector: *void) -> MTLCommandBufferStatus #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.status);
    }

    error :: (self: *MTLCommandBuffer) -> *NSError {
        func: #type (obj: *void, selector: *void) -> *NSError #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.error);
    }

}

MTLComputeCommandEncoder :: struct #type_info_no_size_complaint {
    setComputePipelineState_ :: (self: *MTLComputeCommandEncoder, state: *MTLComputePipelineState) -> void {
        func: #type (obj: *void, selector: *void, state: *MTLComputePipelineState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setComputePipelineState_, state);
    }

    setBytes_length_atIndex_ :: (self: *MTLComputeCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, bytes: *void, length: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBytes_length_atIndex_, bytes, length, index);
    }

    setBuffer_offset_atIndex_ :: (self: *MTLComputeCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBuffer_offset_atIndex_, buffer, offset, index);
    }

    setBufferOffset_atIndex_ :: (self: *MTLComputeCommandEncoder, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBufferOffset_atIndex_, offset, index);
    }

    setBuffers_offsets_withRange_ :: (self: *MTLComputeCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBuffers_offsets_withRange_, buffers, offsets, range);
    }

    setBuffer_offset_attributeStride_atIndex_ :: (self: *MTLComputeCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBuffer_offset_attributeStride_atIndex_, buffer, offset, stride, index);
    }

    setBuffers_offsets_attributeStrides_withRange_ :: (self: *MTLComputeCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, strides: *NSUInteger, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, buffers: **MTLBuffer, offsets: *NSUInteger, strides: *NSUInteger, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBuffers_offsets_attributeStrides_withRange_, buffers, offsets, strides, range);
    }

    setBufferOffset_attributeStride_atIndex_ :: (self: *MTLComputeCommandEncoder, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBufferOffset_attributeStride_atIndex_, offset, stride, index);
    }

    setBytes_length_attributeStride_atIndex_ :: (self: *MTLComputeCommandEncoder, bytes: *void, length: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, bytes: *void, length: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBytes_length_attributeStride_atIndex_, bytes, length, stride, index);
    }

    setVisibleFunctionTable_atBufferIndex_ :: (self: *MTLComputeCommandEncoder, visibleFunctionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, visibleFunctionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVisibleFunctionTable_atBufferIndex_, visibleFunctionTable, bufferIndex);
    }

    setVisibleFunctionTables_withBufferRange_ :: (self: *MTLComputeCommandEncoder, visibleFunctionTables: **MTLVisibleFunctionTable, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, visibleFunctionTables: **MTLVisibleFunctionTable, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVisibleFunctionTables_withBufferRange_, visibleFunctionTables, range);
    }

    setIntersectionFunctionTable_atBufferIndex_ :: (self: *MTLComputeCommandEncoder, intersectionFunctionTable: *MTLIntersectionFunctionTable, bufferIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, intersectionFunctionTable: *MTLIntersectionFunctionTable, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIntersectionFunctionTable_atBufferIndex_, intersectionFunctionTable, bufferIndex);
    }

    setIntersectionFunctionTables_withBufferRange_ :: (self: *MTLComputeCommandEncoder, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIntersectionFunctionTables_withBufferRange_, intersectionFunctionTables, range);
    }

    setAccelerationStructure_atBufferIndex_ :: (self: *MTLComputeCommandEncoder, accelerationStructure: *MTLAccelerationStructure, bufferIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, accelerationStructure: *MTLAccelerationStructure, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAccelerationStructure_atBufferIndex_, accelerationStructure, bufferIndex);
    }

    setTexture_atIndex_ :: (self: *MTLComputeCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTexture_atIndex_, texture, index);
    }

    setTextures_withRange_ :: (self: *MTLComputeCommandEncoder, textures: **MTLTexture, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, textures: **MTLTexture, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTextures_withRange_, textures, range);
    }

    setSamplerState_atIndex_ :: (self: *MTLComputeCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampler: *MTLSamplerState, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSamplerState_atIndex_, sampler, index);
    }

    setSamplerStates_withRange_ :: (self: *MTLComputeCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, samplers: **MTLSamplerState, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSamplerStates_withRange_, samplers, range);
    }

    setSamplerState_lodMinClamp_lodMaxClamp_atIndex_ :: (self: *MTLComputeCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float32, lodMaxClamp: float32, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampler: *MTLSamplerState, lodMinClamp: float32, lodMaxClamp: float32, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSamplerState_lodMinClamp_lodMaxClamp_atIndex_, sampler, lodMinClamp, lodMaxClamp, index);
    }

    setSamplerStates_lodMinClamps_lodMaxClamps_withRange_ :: (self: *MTLComputeCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float32, lodMaxClamps: *float32, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, samplers: **MTLSamplerState, lodMinClamps: *float32, lodMaxClamps: *float32, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSamplerStates_lodMinClamps_lodMaxClamps_withRange_, samplers, lodMinClamps, lodMaxClamps, range);
    }

    setThreadgroupMemoryLength_atIndex_ :: (self: *MTLComputeCommandEncoder, length: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, length: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setThreadgroupMemoryLength_atIndex_, length, index);
    }

    setImageblockWidth_height_ :: (self: *MTLComputeCommandEncoder, width: NSUInteger, height: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, width: NSUInteger, height: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setImageblockWidth_height_, width, height);
    }

    setStageInRegion_ :: (self: *MTLComputeCommandEncoder, region: MTLRegion) -> void {
        func: #type (obj: *void, selector: *void, region: MTLRegion) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStageInRegion_, region);
    }

    setStageInRegionWithIndirectBuffer_indirectBufferOffset_ :: (self: *MTLComputeCommandEncoder, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStageInRegionWithIndirectBuffer_indirectBufferOffset_, indirectBuffer, indirectBufferOffset);
    }

    dispatchThreadgroups_threadsPerThreadgroup_ :: (self: *MTLComputeCommandEncoder, threadgroupsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, threadgroupsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dispatchThreadgroups_threadsPerThreadgroup_, threadgroupsPerGrid, threadsPerThreadgroup);
    }

    dispatchThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerThreadgroup_ :: (self: *MTLComputeCommandEncoder, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger, threadsPerThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger, threadsPerThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dispatchThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerThreadgroup_, indirectBuffer, indirectBufferOffset, threadsPerThreadgroup);
    }

    dispatchThreads_threadsPerThreadgroup_ :: (self: *MTLComputeCommandEncoder, threadsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, threadsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dispatchThreads_threadsPerThreadgroup_, threadsPerGrid, threadsPerThreadgroup);
    }

    updateFence_ :: (self: *MTLComputeCommandEncoder, fence: *MTLFence) -> void {
        func: #type (obj: *void, selector: *void, fence: *MTLFence) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.updateFence_, fence);
    }

    waitForFence_ :: (self: *MTLComputeCommandEncoder, fence: *MTLFence) -> void {
        func: #type (obj: *void, selector: *void, fence: *MTLFence) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.waitForFence_, fence);
    }

    useResource_usage_ :: (self: *MTLComputeCommandEncoder, resource: *MTLResource, usage: MTLResourceUsage) -> void {
        func: #type (obj: *void, selector: *void, resource: *MTLResource, usage: MTLResourceUsage) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useResource_usage_, resource, usage);
    }

    useResources_count_usage_ :: (self: *MTLComputeCommandEncoder, resources: **MTLResource, count: NSUInteger, usage: MTLResourceUsage) -> void {
        func: #type (obj: *void, selector: *void, resources: **MTLResource, count: NSUInteger, usage: MTLResourceUsage) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useResources_count_usage_, resources, count, usage);
    }

    useHeap_ :: (self: *MTLComputeCommandEncoder, heap: *MTLHeap) -> void {
        func: #type (obj: *void, selector: *void, heap: *MTLHeap) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useHeap_, heap);
    }

    useHeaps_count_ :: (self: *MTLComputeCommandEncoder, heaps: **MTLHeap, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, heaps: **MTLHeap, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useHeaps_count_, heaps, count);
    }

    executeCommandsInBuffer_withRange_ :: (self: *MTLComputeCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, executionRange: NSRange) -> void {
        func: #type (obj: *void, selector: *void, indirectCommandBuffer: *MTLIndirectCommandBuffer, executionRange: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.executeCommandsInBuffer_withRange_, indirectCommandBuffer, executionRange);
    }

    executeCommandsInBuffer_indirectBuffer_indirectBufferOffset_ :: (self: *MTLComputeCommandEncoder, indirectCommandbuffer: *MTLIndirectCommandBuffer, indirectRangeBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, indirectCommandbuffer: *MTLIndirectCommandBuffer, indirectRangeBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.executeCommandsInBuffer_indirectBuffer_indirectBufferOffset_, indirectCommandbuffer, indirectRangeBuffer, indirectBufferOffset);
    }

    memoryBarrierWithScope_ :: (self: *MTLComputeCommandEncoder, scope: MTLBarrierScope) -> void {
        func: #type (obj: *void, selector: *void, scope: MTLBarrierScope) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.memoryBarrierWithScope_, scope);
    }

    memoryBarrierWithResources_count_ :: (self: *MTLComputeCommandEncoder, resources: **MTLResource, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, resources: **MTLResource, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.memoryBarrierWithResources_count_, resources, count);
    }

    sampleCountersInBuffer_atSampleIndex_withBarrier_ :: (self: *MTLComputeCommandEncoder, sampleBuffer: *MTLCounterSampleBuffer, sampleIndex: NSUInteger, barrier: BOOL) -> void {
        func: #type (obj: *void, selector: *void, sampleBuffer: *MTLCounterSampleBuffer, sampleIndex: NSUInteger, barrier: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleCountersInBuffer_atSampleIndex_withBarrier_, sampleBuffer, sampleIndex, barrier);
    }

    dispatchType :: (self: *MTLComputeCommandEncoder) -> MTLDispatchType {
        func: #type (obj: *void, selector: *void) -> MTLDispatchType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dispatchType);
    }

}

MTLCommandQueue :: struct #type_info_no_size_complaint {
    commandBuffer :: (self: *MTLCommandQueue) -> *MTLCommandBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLCommandBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.commandBuffer);
    }

    commandBufferWithDescriptor_ :: (self: *MTLCommandQueue, descriptor: *MTLCommandBufferDescriptor) -> *MTLCommandBuffer {
        func: #type (obj: *void, selector: *void, descriptor: *MTLCommandBufferDescriptor) -> *MTLCommandBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.commandBufferWithDescriptor_, descriptor);
    }

    commandBufferWithUnretainedReferences :: (self: *MTLCommandQueue) -> *MTLCommandBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLCommandBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.commandBufferWithUnretainedReferences);
    }

    insertDebugCaptureBoundary :: (self: *MTLCommandQueue) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.insertDebugCaptureBoundary);
    }

    addResidencySet_ :: (self: *MTLCommandQueue, residencySet: *MTLResidencySet) -> void {
        func: #type (obj: *void, selector: *void, residencySet: *MTLResidencySet) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addResidencySet_, residencySet);
    }

    addResidencySets_count_ :: (self: *MTLCommandQueue, residencySets: **MTLResidencySet, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, residencySets: **MTLResidencySet, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addResidencySets_count_, residencySets, count);
    }

    removeResidencySet_ :: (self: *MTLCommandQueue, residencySet: *MTLResidencySet) -> void {
        func: #type (obj: *void, selector: *void, residencySet: *MTLResidencySet) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.removeResidencySet_, residencySet);
    }

    removeResidencySets_count_ :: (self: *MTLCommandQueue, residencySets: **MTLResidencySet, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, residencySets: **MTLResidencySet, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.removeResidencySets_count_, residencySets, count);
    }

    label :: (self: *MTLCommandQueue) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLCommandQueue, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

    device :: (self: *MTLCommandQueue) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

}

MTLDepthStencilState :: struct #type_info_no_size_complaint {
    label :: (self: *MTLDepthStencilState) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    device :: (self: *MTLDepthStencilState) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

    gpuResourceID :: (self: *MTLDepthStencilState) -> MTLResourceID {
        func: #type (obj: *void, selector: *void) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.gpuResourceID);
    }

}

MTLDrawable :: struct #type_info_no_size_complaint {
    present :: (self: *MTLDrawable) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.present);
    }

    presentAtTime_ :: (self: *MTLDrawable, presentationTime: CFTimeInterval) -> void {
        func: #type (obj: *void, selector: *void, presentationTime: CFTimeInterval) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.presentAtTime_, presentationTime);
    }

    presentAfterMinimumDuration_ :: (self: *MTLDrawable, duration: CFTimeInterval) -> void {
        func: #type (obj: *void, selector: *void, duration: CFTimeInterval) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.presentAfterMinimumDuration_, duration);
    }

    addPresentedHandler_ :: (self: *MTLDrawable, block: MTLDrawablePresentedHandler) -> void {
        func: #type (obj: *void, selector: *void, block: MTLDrawablePresentedHandler) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addPresentedHandler_, block);
    }

    presentedTime :: (self: *MTLDrawable) -> CFTimeInterval {
        func: #type (obj: *void, selector: *void) -> CFTimeInterval #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.presentedTime);
    }

    drawableID :: (self: *MTLDrawable) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawableID);
    }

}

MTLComputePipelineState :: struct #type_info_no_size_complaint {
    functionHandleWithName_ :: (self: *MTLComputePipelineState, name: *NSString) -> *MTLFunctionHandle {
        func: #type (obj: *void, selector: *void, name: *NSString) -> *MTLFunctionHandle #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionHandleWithName_, name);
    }

    functionHandleWithBinaryFunction_ :: (self: *MTLComputePipelineState, function: *MTL4BinaryFunction) -> *MTLFunctionHandle {
        func: #type (obj: *void, selector: *void, function: *MTL4BinaryFunction) -> *MTLFunctionHandle #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionHandleWithBinaryFunction_, function);
    }

    newComputePipelineStateWithBinaryFunctions_error_ :: (self: *MTLComputePipelineState, additionalBinaryFunctions: *NSArray(*MTL4BinaryFunction), error: **NSError) -> *MTLComputePipelineState {
        func: #type (obj: *void, selector: *void, additionalBinaryFunctions: *NSArray(*MTL4BinaryFunction), error: **NSError) -> *MTLComputePipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newComputePipelineStateWithBinaryFunctions_error_, additionalBinaryFunctions, error);
    }

    imageblockMemoryLengthForDimensions_ :: (self: *MTLComputePipelineState, imageblockDimensions: MTLSize) -> NSUInteger {
        func: #type (obj: *void, selector: *void, imageblockDimensions: MTLSize) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.imageblockMemoryLengthForDimensions_, imageblockDimensions);
    }

    functionHandleWithFunction_ :: (self: *MTLComputePipelineState, function: *MTLFunction) -> *MTLFunctionHandle {
        func: #type (obj: *void, selector: *void, function: *MTLFunction) -> *MTLFunctionHandle #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionHandleWithFunction_, function);
    }

    newComputePipelineStateWithAdditionalBinaryFunctions_error_ :: (self: *MTLComputePipelineState, functions: *NSArray(*MTLFunction), error: **NSError) -> *MTLComputePipelineState {
        func: #type (obj: *void, selector: *void, functions: *NSArray(*MTLFunction), error: **NSError) -> *MTLComputePipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newComputePipelineStateWithAdditionalBinaryFunctions_error_, functions, error);
    }

    newVisibleFunctionTableWithDescriptor_ :: (self: *MTLComputePipelineState, descriptor: *MTLVisibleFunctionTableDescriptor) -> *MTLVisibleFunctionTable {
        func: #type (obj: *void, selector: *void, descriptor: *MTLVisibleFunctionTableDescriptor) -> *MTLVisibleFunctionTable #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newVisibleFunctionTableWithDescriptor_, descriptor);
    }

    newIntersectionFunctionTableWithDescriptor_ :: (self: *MTLComputePipelineState, descriptor: *MTLIntersectionFunctionTableDescriptor) -> *MTLIntersectionFunctionTable {
        func: #type (obj: *void, selector: *void, descriptor: *MTLIntersectionFunctionTableDescriptor) -> *MTLIntersectionFunctionTable #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newIntersectionFunctionTableWithDescriptor_, descriptor);
    }

    label :: (self: *MTLComputePipelineState) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    reflection :: (self: *MTLComputePipelineState) -> *MTLComputePipelineReflection {
        func: #type (obj: *void, selector: *void) -> *MTLComputePipelineReflection #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reflection);
    }

    device :: (self: *MTLComputePipelineState) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

    maxTotalThreadsPerThreadgroup :: (self: *MTLComputePipelineState) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadsPerThreadgroup);
    }

    threadExecutionWidth :: (self: *MTLComputePipelineState) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.threadExecutionWidth);
    }

    staticThreadgroupMemoryLength :: (self: *MTLComputePipelineState) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.staticThreadgroupMemoryLength);
    }

    supportIndirectCommandBuffers :: (self: *MTLComputePipelineState) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportIndirectCommandBuffers);
    }

    gpuResourceID :: (self: *MTLComputePipelineState) -> MTLResourceID {
        func: #type (obj: *void, selector: *void) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.gpuResourceID);
    }

    shaderValidation :: (self: *MTLComputePipelineState) -> MTLShaderValidation {
        func: #type (obj: *void, selector: *void) -> MTLShaderValidation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.shaderValidation);
    }

    requiredThreadsPerThreadgroup :: (self: *MTLComputePipelineState) -> MTLSize {
        func: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.requiredThreadsPerThreadgroup);
    }

}

MTLRenderCommandEncoder :: struct #type_info_no_size_complaint {
    setRenderPipelineState_ :: (self: *MTLRenderCommandEncoder, pipelineState: *MTLRenderPipelineState) -> void {
        func: #type (obj: *void, selector: *void, pipelineState: *MTLRenderPipelineState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRenderPipelineState_, pipelineState);
    }

    setVertexBytes_length_atIndex_ :: (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, bytes: *void, length: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexBytes_length_atIndex_, bytes, length, index);
    }

    setVertexBuffer_offset_atIndex_ :: (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexBuffer_offset_atIndex_, buffer, offset, index);
    }

    setVertexBufferOffset_atIndex_ :: (self: *MTLRenderCommandEncoder, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexBufferOffset_atIndex_, offset, index);
    }

    setVertexBuffers_offsets_withRange_ :: (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexBuffers_offsets_withRange_, buffers, offsets, range);
    }

    setVertexBuffer_offset_attributeStride_atIndex_ :: (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexBuffer_offset_attributeStride_atIndex_, buffer, offset, stride, index);
    }

    setVertexBuffers_offsets_attributeStrides_withRange_ :: (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, strides: *NSUInteger, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, buffers: **MTLBuffer, offsets: *NSUInteger, strides: *NSUInteger, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexBuffers_offsets_attributeStrides_withRange_, buffers, offsets, strides, range);
    }

    setVertexBufferOffset_attributeStride_atIndex_ :: (self: *MTLRenderCommandEncoder, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexBufferOffset_attributeStride_atIndex_, offset, stride, index);
    }

    setVertexBytes_length_attributeStride_atIndex_ :: (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, bytes: *void, length: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexBytes_length_attributeStride_atIndex_, bytes, length, stride, index);
    }

    setVertexTexture_atIndex_ :: (self: *MTLRenderCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexTexture_atIndex_, texture, index);
    }

    setVertexTextures_withRange_ :: (self: *MTLRenderCommandEncoder, textures: **MTLTexture, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, textures: **MTLTexture, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexTextures_withRange_, textures, range);
    }

    setVertexSamplerState_atIndex_ :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampler: *MTLSamplerState, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexSamplerState_atIndex_, sampler, index);
    }

    setVertexSamplerStates_withRange_ :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, samplers: **MTLSamplerState, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexSamplerStates_withRange_, samplers, range);
    }

    setVertexSamplerState_lodMinClamp_lodMaxClamp_atIndex_ :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float32, lodMaxClamp: float32, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampler: *MTLSamplerState, lodMinClamp: float32, lodMaxClamp: float32, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexSamplerState_lodMinClamp_lodMaxClamp_atIndex_, sampler, lodMinClamp, lodMaxClamp, index);
    }

    setVertexSamplerStates_lodMinClamps_lodMaxClamps_withRange_ :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float32, lodMaxClamps: *float32, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, samplers: **MTLSamplerState, lodMinClamps: *float32, lodMaxClamps: *float32, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexSamplerStates_lodMinClamps_lodMaxClamps_withRange_, samplers, lodMinClamps, lodMaxClamps, range);
    }

    setVertexVisibleFunctionTable_atBufferIndex_ :: (self: *MTLRenderCommandEncoder, functionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, functionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexVisibleFunctionTable_atBufferIndex_, functionTable, bufferIndex);
    }

    setVertexVisibleFunctionTables_withBufferRange_ :: (self: *MTLRenderCommandEncoder, functionTables: **MTLVisibleFunctionTable, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, functionTables: **MTLVisibleFunctionTable, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexVisibleFunctionTables_withBufferRange_, functionTables, range);
    }

    setVertexIntersectionFunctionTable_atBufferIndex_ :: (self: *MTLRenderCommandEncoder, intersectionFunctionTable: *MTLIntersectionFunctionTable, bufferIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, intersectionFunctionTable: *MTLIntersectionFunctionTable, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexIntersectionFunctionTable_atBufferIndex_, intersectionFunctionTable, bufferIndex);
    }

    setVertexIntersectionFunctionTables_withBufferRange_ :: (self: *MTLRenderCommandEncoder, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexIntersectionFunctionTables_withBufferRange_, intersectionFunctionTables, range);
    }

    setVertexAccelerationStructure_atBufferIndex_ :: (self: *MTLRenderCommandEncoder, accelerationStructure: *MTLAccelerationStructure, bufferIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, accelerationStructure: *MTLAccelerationStructure, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexAccelerationStructure_atBufferIndex_, accelerationStructure, bufferIndex);
    }

    setViewport_ :: (self: *MTLRenderCommandEncoder, viewport: MTLViewport) -> void {
        func: #type (obj: *void, selector: *void, viewport: MTLViewport) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setViewport_, viewport);
    }

    setViewports_count_ :: (self: *MTLRenderCommandEncoder, viewports: *MTLViewport, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, viewports: *MTLViewport, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setViewports_count_, viewports, count);
    }

    setFrontFacingWinding_ :: (self: *MTLRenderCommandEncoder, frontFacingWinding: MTLWinding) -> void {
        func: #type (obj: *void, selector: *void, frontFacingWinding: MTLWinding) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFrontFacingWinding_, frontFacingWinding);
    }

    setVertexAmplificationCount_viewMappings_ :: (self: *MTLRenderCommandEncoder, count: NSUInteger, viewMappings: *MTLVertexAmplificationViewMapping) -> void {
        func: #type (obj: *void, selector: *void, count: NSUInteger, viewMappings: *MTLVertexAmplificationViewMapping) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexAmplificationCount_viewMappings_, count, viewMappings);
    }

    setCullMode_ :: (self: *MTLRenderCommandEncoder, cullMode: MTLCullMode) -> void {
        func: #type (obj: *void, selector: *void, cullMode: MTLCullMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCullMode_, cullMode);
    }

    setDepthClipMode_ :: (self: *MTLRenderCommandEncoder, depthClipMode: MTLDepthClipMode) -> void {
        func: #type (obj: *void, selector: *void, depthClipMode: MTLDepthClipMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthClipMode_, depthClipMode);
    }

    setDepthBias_slopeScale_clamp_ :: (self: *MTLRenderCommandEncoder, depthBias: float32, slopeScale: float32, clamp: float32) -> void {
        func: #type (obj: *void, selector: *void, depthBias: float32, slopeScale: float32, clamp: float32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthBias_slopeScale_clamp_, depthBias, slopeScale, clamp);
    }

    setDepthTestMinBound_maxBound_ :: (self: *MTLRenderCommandEncoder, minBound: float32, maxBound: float32) -> void {
        func: #type (obj: *void, selector: *void, minBound: float32, maxBound: float32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthTestMinBound_maxBound_, minBound, maxBound);
    }

    setScissorRect_ :: (self: *MTLRenderCommandEncoder, rect: MTLScissorRect) -> void {
        func: #type (obj: *void, selector: *void, rect: MTLScissorRect) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setScissorRect_, rect);
    }

    setScissorRects_count_ :: (self: *MTLRenderCommandEncoder, scissorRects: *MTLScissorRect, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, scissorRects: *MTLScissorRect, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setScissorRects_count_, scissorRects, count);
    }

    setTriangleFillMode_ :: (self: *MTLRenderCommandEncoder, fillMode: MTLTriangleFillMode) -> void {
        func: #type (obj: *void, selector: *void, fillMode: MTLTriangleFillMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTriangleFillMode_, fillMode);
    }

    setFragmentBytes_length_atIndex_ :: (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, bytes: *void, length: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentBytes_length_atIndex_, bytes, length, index);
    }

    setFragmentBuffer_offset_atIndex_ :: (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentBuffer_offset_atIndex_, buffer, offset, index);
    }

    setFragmentBufferOffset_atIndex_ :: (self: *MTLRenderCommandEncoder, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentBufferOffset_atIndex_, offset, index);
    }

    setFragmentBuffers_offsets_withRange_ :: (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentBuffers_offsets_withRange_, buffers, offsets, range);
    }

    setFragmentTexture_atIndex_ :: (self: *MTLRenderCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentTexture_atIndex_, texture, index);
    }

    setFragmentTextures_withRange_ :: (self: *MTLRenderCommandEncoder, textures: **MTLTexture, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, textures: **MTLTexture, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentTextures_withRange_, textures, range);
    }

    setFragmentSamplerState_atIndex_ :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampler: *MTLSamplerState, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentSamplerState_atIndex_, sampler, index);
    }

    setFragmentSamplerStates_withRange_ :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, samplers: **MTLSamplerState, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentSamplerStates_withRange_, samplers, range);
    }

    setFragmentSamplerState_lodMinClamp_lodMaxClamp_atIndex_ :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float32, lodMaxClamp: float32, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampler: *MTLSamplerState, lodMinClamp: float32, lodMaxClamp: float32, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentSamplerState_lodMinClamp_lodMaxClamp_atIndex_, sampler, lodMinClamp, lodMaxClamp, index);
    }

    setFragmentSamplerStates_lodMinClamps_lodMaxClamps_withRange_ :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float32, lodMaxClamps: *float32, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, samplers: **MTLSamplerState, lodMinClamps: *float32, lodMaxClamps: *float32, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentSamplerStates_lodMinClamps_lodMaxClamps_withRange_, samplers, lodMinClamps, lodMaxClamps, range);
    }

    setFragmentVisibleFunctionTable_atBufferIndex_ :: (self: *MTLRenderCommandEncoder, functionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, functionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentVisibleFunctionTable_atBufferIndex_, functionTable, bufferIndex);
    }

    setFragmentVisibleFunctionTables_withBufferRange_ :: (self: *MTLRenderCommandEncoder, functionTables: **MTLVisibleFunctionTable, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, functionTables: **MTLVisibleFunctionTable, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentVisibleFunctionTables_withBufferRange_, functionTables, range);
    }

    setFragmentIntersectionFunctionTable_atBufferIndex_ :: (self: *MTLRenderCommandEncoder, intersectionFunctionTable: *MTLIntersectionFunctionTable, bufferIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, intersectionFunctionTable: *MTLIntersectionFunctionTable, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentIntersectionFunctionTable_atBufferIndex_, intersectionFunctionTable, bufferIndex);
    }

    setFragmentIntersectionFunctionTables_withBufferRange_ :: (self: *MTLRenderCommandEncoder, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentIntersectionFunctionTables_withBufferRange_, intersectionFunctionTables, range);
    }

    setFragmentAccelerationStructure_atBufferIndex_ :: (self: *MTLRenderCommandEncoder, accelerationStructure: *MTLAccelerationStructure, bufferIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, accelerationStructure: *MTLAccelerationStructure, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentAccelerationStructure_atBufferIndex_, accelerationStructure, bufferIndex);
    }

    setBlendColorRed_green_blue_alpha_ :: (self: *MTLRenderCommandEncoder, red: float32, green: float32, blue: float32, alpha: float32) -> void {
        func: #type (obj: *void, selector: *void, red: float32, green: float32, blue: float32, alpha: float32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBlendColorRed_green_blue_alpha_, red, green, blue, alpha);
    }

    setDepthStencilState_ :: (self: *MTLRenderCommandEncoder, depthStencilState: *MTLDepthStencilState) -> void {
        func: #type (obj: *void, selector: *void, depthStencilState: *MTLDepthStencilState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthStencilState_, depthStencilState);
    }

    setStencilReferenceValue_ :: (self: *MTLRenderCommandEncoder, referenceValue: u32) -> void {
        func: #type (obj: *void, selector: *void, referenceValue: u32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilReferenceValue_, referenceValue);
    }

    setStencilFrontReferenceValue_backReferenceValue_ :: (self: *MTLRenderCommandEncoder, frontReferenceValue: u32, backReferenceValue: u32) -> void {
        func: #type (obj: *void, selector: *void, frontReferenceValue: u32, backReferenceValue: u32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilFrontReferenceValue_backReferenceValue_, frontReferenceValue, backReferenceValue);
    }

    setVisibilityResultMode_offset_ :: (self: *MTLRenderCommandEncoder, mode: MTLVisibilityResultMode, offset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, mode: MTLVisibilityResultMode, offset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVisibilityResultMode_offset_, mode, offset);
    }

    setColorStoreAction_atIndex_ :: (self: *MTLRenderCommandEncoder, storeAction: MTLStoreAction, colorAttachmentIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, storeAction: MTLStoreAction, colorAttachmentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setColorStoreAction_atIndex_, storeAction, colorAttachmentIndex);
    }

    setDepthStoreAction_ :: (self: *MTLRenderCommandEncoder, storeAction: MTLStoreAction) -> void {
        func: #type (obj: *void, selector: *void, storeAction: MTLStoreAction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthStoreAction_, storeAction);
    }

    setStencilStoreAction_ :: (self: *MTLRenderCommandEncoder, storeAction: MTLStoreAction) -> void {
        func: #type (obj: *void, selector: *void, storeAction: MTLStoreAction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilStoreAction_, storeAction);
    }

    setColorStoreActionOptions_atIndex_ :: (self: *MTLRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions, colorAttachmentIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, storeActionOptions: MTLStoreActionOptions, colorAttachmentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setColorStoreActionOptions_atIndex_, storeActionOptions, colorAttachmentIndex);
    }

    setDepthStoreActionOptions_ :: (self: *MTLRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions) -> void {
        func: #type (obj: *void, selector: *void, storeActionOptions: MTLStoreActionOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthStoreActionOptions_, storeActionOptions);
    }

    setStencilStoreActionOptions_ :: (self: *MTLRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions) -> void {
        func: #type (obj: *void, selector: *void, storeActionOptions: MTLStoreActionOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilStoreActionOptions_, storeActionOptions);
    }

    setObjectBytes_length_atIndex_ :: (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, bytes: *void, length: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectBytes_length_atIndex_, bytes, length, index);
    }

    setObjectBuffer_offset_atIndex_ :: (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectBuffer_offset_atIndex_, buffer, offset, index);
    }

    setObjectBufferOffset_atIndex_ :: (self: *MTLRenderCommandEncoder, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectBufferOffset_atIndex_, offset, index);
    }

    setObjectBuffers_offsets_withRange_ :: (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectBuffers_offsets_withRange_, buffers, offsets, range);
    }

    setObjectTexture_atIndex_ :: (self: *MTLRenderCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectTexture_atIndex_, texture, index);
    }

    setObjectTextures_withRange_ :: (self: *MTLRenderCommandEncoder, textures: **MTLTexture, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, textures: **MTLTexture, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectTextures_withRange_, textures, range);
    }

    setObjectSamplerState_atIndex_ :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampler: *MTLSamplerState, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectSamplerState_atIndex_, sampler, index);
    }

    setObjectSamplerStates_withRange_ :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, samplers: **MTLSamplerState, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectSamplerStates_withRange_, samplers, range);
    }

    setObjectSamplerState_lodMinClamp_lodMaxClamp_atIndex_ :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float32, lodMaxClamp: float32, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampler: *MTLSamplerState, lodMinClamp: float32, lodMaxClamp: float32, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectSamplerState_lodMinClamp_lodMaxClamp_atIndex_, sampler, lodMinClamp, lodMaxClamp, index);
    }

    setObjectSamplerStates_lodMinClamps_lodMaxClamps_withRange_ :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float32, lodMaxClamps: *float32, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, samplers: **MTLSamplerState, lodMinClamps: *float32, lodMaxClamps: *float32, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectSamplerStates_lodMinClamps_lodMaxClamps_withRange_, samplers, lodMinClamps, lodMaxClamps, range);
    }

    setObjectThreadgroupMemoryLength_atIndex_ :: (self: *MTLRenderCommandEncoder, length: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, length: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectThreadgroupMemoryLength_atIndex_, length, index);
    }

    setMeshBytes_length_atIndex_ :: (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, bytes: *void, length: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshBytes_length_atIndex_, bytes, length, index);
    }

    setMeshBuffer_offset_atIndex_ :: (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshBuffer_offset_atIndex_, buffer, offset, index);
    }

    setMeshBufferOffset_atIndex_ :: (self: *MTLRenderCommandEncoder, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshBufferOffset_atIndex_, offset, index);
    }

    setMeshBuffers_offsets_withRange_ :: (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshBuffers_offsets_withRange_, buffers, offsets, range);
    }

    setMeshTexture_atIndex_ :: (self: *MTLRenderCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshTexture_atIndex_, texture, index);
    }

    setMeshTextures_withRange_ :: (self: *MTLRenderCommandEncoder, textures: **MTLTexture, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, textures: **MTLTexture, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshTextures_withRange_, textures, range);
    }

    setMeshSamplerState_atIndex_ :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampler: *MTLSamplerState, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshSamplerState_atIndex_, sampler, index);
    }

    setMeshSamplerStates_withRange_ :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, samplers: **MTLSamplerState, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshSamplerStates_withRange_, samplers, range);
    }

    setMeshSamplerState_lodMinClamp_lodMaxClamp_atIndex_ :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float32, lodMaxClamp: float32, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampler: *MTLSamplerState, lodMinClamp: float32, lodMaxClamp: float32, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshSamplerState_lodMinClamp_lodMaxClamp_atIndex_, sampler, lodMinClamp, lodMaxClamp, index);
    }

    setMeshSamplerStates_lodMinClamps_lodMaxClamps_withRange_ :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float32, lodMaxClamps: *float32, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, samplers: **MTLSamplerState, lodMinClamps: *float32, lodMaxClamps: *float32, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshSamplerStates_lodMinClamps_lodMaxClamps_withRange_, samplers, lodMinClamps, lodMaxClamps, range);
    }

    drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_ :: (self: *MTLRenderCommandEncoder, threadgroupsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, threadgroupsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_, threadgroupsPerGrid, threadsPerObjectThreadgroup, threadsPerMeshThreadgroup);
    }

    drawMeshThreads_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_ :: (self: *MTLRenderCommandEncoder, threadsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, threadsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawMeshThreads_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_, threadsPerGrid, threadsPerObjectThreadgroup, threadsPerMeshThreadgroup);
    }

    drawMeshThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_ :: (self: *MTLRenderCommandEncoder, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawMeshThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_, indirectBuffer, indirectBufferOffset, threadsPerObjectThreadgroup, threadsPerMeshThreadgroup);
    }

    drawPrimitives_vertexStart_vertexCount_instanceCount_ :: (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawPrimitives_vertexStart_vertexCount_instanceCount_, primitiveType, vertexStart, vertexCount, instanceCount);
    }

    drawPrimitives_vertexStart_vertexCount_ :: (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawPrimitives_vertexStart_vertexCount_, primitiveType, vertexStart, vertexCount);
    }

    drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_ :: (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger, instanceCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger, instanceCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_, primitiveType, indexCount, indexType, indexBuffer, indexBufferOffset, instanceCount);
    }

    drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_ :: (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_, primitiveType, indexCount, indexType, indexBuffer, indexBufferOffset);
    }

    drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance_ :: (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance_, primitiveType, vertexStart, vertexCount, instanceCount, baseInstance);
    }

    drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_baseVertex_baseInstance_ :: (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseVertex: NSInteger, baseInstance: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseVertex: NSInteger, baseInstance: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_baseVertex_baseInstance_, primitiveType, indexCount, indexType, indexBuffer, indexBufferOffset, instanceCount, baseVertex, baseInstance);
    }

    drawPrimitives_indirectBuffer_indirectBufferOffset_ :: (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawPrimitives_indirectBuffer_indirectBufferOffset_, primitiveType, indirectBuffer, indirectBufferOffset);
    }

    drawIndexedPrimitives_indexType_indexBuffer_indexBufferOffset_indirectBuffer_indirectBufferOffset_ :: (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawIndexedPrimitives_indexType_indexBuffer_indexBufferOffset_indirectBuffer_indirectBufferOffset_, primitiveType, indexType, indexBuffer, indexBufferOffset, indirectBuffer, indirectBufferOffset);
    }

    textureBarrier :: (self: *MTLRenderCommandEncoder) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.textureBarrier);
    }

    updateFence_afterStages_ :: (self: *MTLRenderCommandEncoder, fence: *MTLFence, stages: MTLRenderStages) -> void {
        func: #type (obj: *void, selector: *void, fence: *MTLFence, stages: MTLRenderStages) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.updateFence_afterStages_, fence, stages);
    }

    waitForFence_beforeStages_ :: (self: *MTLRenderCommandEncoder, fence: *MTLFence, stages: MTLRenderStages) -> void {
        func: #type (obj: *void, selector: *void, fence: *MTLFence, stages: MTLRenderStages) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.waitForFence_beforeStages_, fence, stages);
    }

    setTessellationFactorBuffer_offset_instanceStride_ :: (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, instanceStride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger, instanceStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTessellationFactorBuffer_offset_instanceStride_, buffer, offset, instanceStride);
    }

    setTessellationFactorScale_ :: (self: *MTLRenderCommandEncoder, scale: float32) -> void {
        func: #type (obj: *void, selector: *void, scale: float32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTessellationFactorScale_, scale);
    }

    drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance_ :: (self: *MTLRenderCommandEncoder, numberOfPatchControlPoints: NSUInteger, patchStart: NSUInteger, patchCount: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, numberOfPatchControlPoints: NSUInteger, patchStart: NSUInteger, patchCount: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance_, numberOfPatchControlPoints, patchStart, patchCount, patchIndexBuffer, patchIndexBufferOffset, instanceCount, baseInstance);
    }

    drawPatches_patchIndexBuffer_patchIndexBufferOffset_indirectBuffer_indirectBufferOffset_ :: (self: *MTLRenderCommandEncoder, numberOfPatchControlPoints: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, numberOfPatchControlPoints: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawPatches_patchIndexBuffer_patchIndexBufferOffset_indirectBuffer_indirectBufferOffset_, numberOfPatchControlPoints, patchIndexBuffer, patchIndexBufferOffset, indirectBuffer, indirectBufferOffset);
    }

    drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_ :: (self: *MTLRenderCommandEncoder, numberOfPatchControlPoints: NSUInteger, patchStart: NSUInteger, patchCount: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, controlPointIndexBuffer: *MTLBuffer, controlPointIndexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, numberOfPatchControlPoints: NSUInteger, patchStart: NSUInteger, patchCount: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, controlPointIndexBuffer: *MTLBuffer, controlPointIndexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_, numberOfPatchControlPoints, patchStart, patchCount, patchIndexBuffer, patchIndexBufferOffset, controlPointIndexBuffer, controlPointIndexBufferOffset, instanceCount, baseInstance);
    }

    drawIndexedPatches_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_indirectBuffer_indirectBufferOffset_ :: (self: *MTLRenderCommandEncoder, numberOfPatchControlPoints: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, controlPointIndexBuffer: *MTLBuffer, controlPointIndexBufferOffset: NSUInteger, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, numberOfPatchControlPoints: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, controlPointIndexBuffer: *MTLBuffer, controlPointIndexBufferOffset: NSUInteger, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawIndexedPatches_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_indirectBuffer_indirectBufferOffset_, numberOfPatchControlPoints, patchIndexBuffer, patchIndexBufferOffset, controlPointIndexBuffer, controlPointIndexBufferOffset, indirectBuffer, indirectBufferOffset);
    }

    setTileBytes_length_atIndex_ :: (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, bytes: *void, length: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileBytes_length_atIndex_, bytes, length, index);
    }

    setTileBuffer_offset_atIndex_ :: (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileBuffer_offset_atIndex_, buffer, offset, index);
    }

    setTileBufferOffset_atIndex_ :: (self: *MTLRenderCommandEncoder, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileBufferOffset_atIndex_, offset, index);
    }

    setTileBuffers_offsets_withRange_ :: (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileBuffers_offsets_withRange_, buffers, offsets, range);
    }

    setTileTexture_atIndex_ :: (self: *MTLRenderCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileTexture_atIndex_, texture, index);
    }

    setTileTextures_withRange_ :: (self: *MTLRenderCommandEncoder, textures: **MTLTexture, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, textures: **MTLTexture, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileTextures_withRange_, textures, range);
    }

    setTileSamplerState_atIndex_ :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampler: *MTLSamplerState, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileSamplerState_atIndex_, sampler, index);
    }

    setTileSamplerStates_withRange_ :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, samplers: **MTLSamplerState, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileSamplerStates_withRange_, samplers, range);
    }

    setTileSamplerState_lodMinClamp_lodMaxClamp_atIndex_ :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float32, lodMaxClamp: float32, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampler: *MTLSamplerState, lodMinClamp: float32, lodMaxClamp: float32, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileSamplerState_lodMinClamp_lodMaxClamp_atIndex_, sampler, lodMinClamp, lodMaxClamp, index);
    }

    setTileSamplerStates_lodMinClamps_lodMaxClamps_withRange_ :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float32, lodMaxClamps: *float32, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, samplers: **MTLSamplerState, lodMinClamps: *float32, lodMaxClamps: *float32, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileSamplerStates_lodMinClamps_lodMaxClamps_withRange_, samplers, lodMinClamps, lodMaxClamps, range);
    }

    setTileVisibleFunctionTable_atBufferIndex_ :: (self: *MTLRenderCommandEncoder, functionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, functionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileVisibleFunctionTable_atBufferIndex_, functionTable, bufferIndex);
    }

    setTileVisibleFunctionTables_withBufferRange_ :: (self: *MTLRenderCommandEncoder, functionTables: **MTLVisibleFunctionTable, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, functionTables: **MTLVisibleFunctionTable, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileVisibleFunctionTables_withBufferRange_, functionTables, range);
    }

    setTileIntersectionFunctionTable_atBufferIndex_ :: (self: *MTLRenderCommandEncoder, intersectionFunctionTable: *MTLIntersectionFunctionTable, bufferIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, intersectionFunctionTable: *MTLIntersectionFunctionTable, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileIntersectionFunctionTable_atBufferIndex_, intersectionFunctionTable, bufferIndex);
    }

    setTileIntersectionFunctionTables_withBufferRange_ :: (self: *MTLRenderCommandEncoder, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileIntersectionFunctionTables_withBufferRange_, intersectionFunctionTables, range);
    }

    setTileAccelerationStructure_atBufferIndex_ :: (self: *MTLRenderCommandEncoder, accelerationStructure: *MTLAccelerationStructure, bufferIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, accelerationStructure: *MTLAccelerationStructure, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileAccelerationStructure_atBufferIndex_, accelerationStructure, bufferIndex);
    }

    dispatchThreadsPerTile_ :: (self: *MTLRenderCommandEncoder, threadsPerTile: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, threadsPerTile: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dispatchThreadsPerTile_, threadsPerTile);
    }

    setThreadgroupMemoryLength_offset_atIndex_ :: (self: *MTLRenderCommandEncoder, length: NSUInteger, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, length: NSUInteger, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setThreadgroupMemoryLength_offset_atIndex_, length, offset, index);
    }

    useResource_usage_ :: (self: *MTLRenderCommandEncoder, resource: *MTLResource, usage: MTLResourceUsage) -> void {
        func: #type (obj: *void, selector: *void, resource: *MTLResource, usage: MTLResourceUsage) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useResource_usage_, resource, usage);
    }

    useResources_count_usage_ :: (self: *MTLRenderCommandEncoder, resources: **MTLResource, count: NSUInteger, usage: MTLResourceUsage) -> void {
        func: #type (obj: *void, selector: *void, resources: **MTLResource, count: NSUInteger, usage: MTLResourceUsage) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useResources_count_usage_, resources, count, usage);
    }

    useResource_usage_stages_ :: (self: *MTLRenderCommandEncoder, resource: *MTLResource, usage: MTLResourceUsage, stages: MTLRenderStages) -> void {
        func: #type (obj: *void, selector: *void, resource: *MTLResource, usage: MTLResourceUsage, stages: MTLRenderStages) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useResource_usage_stages_, resource, usage, stages);
    }

    useResources_count_usage_stages_ :: (self: *MTLRenderCommandEncoder, resources: **MTLResource, count: NSUInteger, usage: MTLResourceUsage, stages: MTLRenderStages) -> void {
        func: #type (obj: *void, selector: *void, resources: **MTLResource, count: NSUInteger, usage: MTLResourceUsage, stages: MTLRenderStages) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useResources_count_usage_stages_, resources, count, usage, stages);
    }

    useHeap_ :: (self: *MTLRenderCommandEncoder, heap: *MTLHeap) -> void {
        func: #type (obj: *void, selector: *void, heap: *MTLHeap) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useHeap_, heap);
    }

    useHeaps_count_ :: (self: *MTLRenderCommandEncoder, heaps: **MTLHeap, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, heaps: **MTLHeap, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useHeaps_count_, heaps, count);
    }

    useHeap_stages_ :: (self: *MTLRenderCommandEncoder, heap: *MTLHeap, stages: MTLRenderStages) -> void {
        func: #type (obj: *void, selector: *void, heap: *MTLHeap, stages: MTLRenderStages) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useHeap_stages_, heap, stages);
    }

    useHeaps_count_stages_ :: (self: *MTLRenderCommandEncoder, heaps: **MTLHeap, count: NSUInteger, stages: MTLRenderStages) -> void {
        func: #type (obj: *void, selector: *void, heaps: **MTLHeap, count: NSUInteger, stages: MTLRenderStages) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useHeaps_count_stages_, heaps, count, stages);
    }

    executeCommandsInBuffer_withRange_ :: (self: *MTLRenderCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, executionRange: NSRange) -> void {
        func: #type (obj: *void, selector: *void, indirectCommandBuffer: *MTLIndirectCommandBuffer, executionRange: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.executeCommandsInBuffer_withRange_, indirectCommandBuffer, executionRange);
    }

    executeCommandsInBuffer_indirectBuffer_indirectBufferOffset_ :: (self: *MTLRenderCommandEncoder, indirectCommandbuffer: *MTLIndirectCommandBuffer, indirectRangeBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, indirectCommandbuffer: *MTLIndirectCommandBuffer, indirectRangeBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.executeCommandsInBuffer_indirectBuffer_indirectBufferOffset_, indirectCommandbuffer, indirectRangeBuffer, indirectBufferOffset);
    }

    memoryBarrierWithScope_afterStages_beforeStages_ :: (self: *MTLRenderCommandEncoder, scope: MTLBarrierScope, after: MTLRenderStages, before: MTLRenderStages) -> void {
        func: #type (obj: *void, selector: *void, scope: MTLBarrierScope, after: MTLRenderStages, before: MTLRenderStages) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.memoryBarrierWithScope_afterStages_beforeStages_, scope, after, before);
    }

    memoryBarrierWithResources_count_afterStages_beforeStages_ :: (self: *MTLRenderCommandEncoder, resources: **MTLResource, count: NSUInteger, after: MTLRenderStages, before: MTLRenderStages) -> void {
        func: #type (obj: *void, selector: *void, resources: **MTLResource, count: NSUInteger, after: MTLRenderStages, before: MTLRenderStages) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.memoryBarrierWithResources_count_afterStages_beforeStages_, resources, count, after, before);
    }

    sampleCountersInBuffer_atSampleIndex_withBarrier_ :: (self: *MTLRenderCommandEncoder, sampleBuffer: *MTLCounterSampleBuffer, sampleIndex: NSUInteger, barrier: BOOL) -> void {
        func: #type (obj: *void, selector: *void, sampleBuffer: *MTLCounterSampleBuffer, sampleIndex: NSUInteger, barrier: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleCountersInBuffer_atSampleIndex_withBarrier_, sampleBuffer, sampleIndex, barrier);
    }

    setColorAttachmentMap_ :: (self: *MTLRenderCommandEncoder, mapping: *MTLLogicalToPhysicalColorAttachmentMap) -> void {
        func: #type (obj: *void, selector: *void, mapping: *MTLLogicalToPhysicalColorAttachmentMap) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setColorAttachmentMap_, mapping);
    }

    tileWidth :: (self: *MTLRenderCommandEncoder) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileWidth);
    }

    tileHeight :: (self: *MTLRenderCommandEncoder) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileHeight);
    }

}

MTLFunctionHandle :: struct #type_info_no_size_complaint {
    functionType :: (self: *MTLFunctionHandle) -> MTLFunctionType {
        func: #type (obj: *void, selector: *void) -> MTLFunctionType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionType);
    }

    name :: (self: *MTLFunctionHandle) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

    device :: (self: *MTLFunctionHandle) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

    gpuResourceID :: (self: *MTLFunctionHandle) -> MTLResourceID {
        func: #type (obj: *void, selector: *void) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.gpuResourceID);
    }

}

MTLVisibleFunctionTable :: struct #type_info_no_size_complaint {
    setFunction_atIndex_ :: (self: *MTLVisibleFunctionTable, function: *MTLFunctionHandle, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, function: *MTLFunctionHandle, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFunction_atIndex_, function, index);
    }

    setFunctions_withRange_ :: (self: *MTLVisibleFunctionTable, functions: **MTLFunctionHandle, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, functions: **MTLFunctionHandle, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFunctions_withRange_, functions, range);
    }

    gpuResourceID :: (self: *MTLVisibleFunctionTable) -> MTLResourceID {
        func: #type (obj: *void, selector: *void) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.gpuResourceID);
    }

}

MTLRenderPipelineState :: struct #type_info_no_size_complaint {
    functionHandleWithName_stage_ :: (self: *MTLRenderPipelineState, name: *NSString, stage: MTLRenderStages) -> *MTLFunctionHandle {
        func: #type (obj: *void, selector: *void, name: *NSString, stage: MTLRenderStages) -> *MTLFunctionHandle #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionHandleWithName_stage_, name, stage);
    }

    functionHandleWithBinaryFunction_stage_ :: (self: *MTLRenderPipelineState, function: *MTL4BinaryFunction, stage: MTLRenderStages) -> *MTLFunctionHandle {
        func: #type (obj: *void, selector: *void, function: *MTL4BinaryFunction, stage: MTLRenderStages) -> *MTLFunctionHandle #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionHandleWithBinaryFunction_stage_, function, stage);
    }

    newRenderPipelineStateWithBinaryFunctions_error_ :: (self: *MTLRenderPipelineState, binaryFunctionsDescriptor: *MTL4RenderPipelineBinaryFunctionsDescriptor, error: **NSError) -> *MTLRenderPipelineState {
        func: #type (obj: *void, selector: *void, binaryFunctionsDescriptor: *MTL4RenderPipelineBinaryFunctionsDescriptor, error: **NSError) -> *MTLRenderPipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithBinaryFunctions_error_, binaryFunctionsDescriptor, error);
    }

    newRenderPipelineDescriptorForSpecialization :: (self: *MTLRenderPipelineState) -> *MTL4PipelineDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTL4PipelineDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineDescriptorForSpecialization);
    }

    imageblockMemoryLengthForDimensions_ :: (self: *MTLRenderPipelineState, imageblockDimensions: MTLSize) -> NSUInteger {
        func: #type (obj: *void, selector: *void, imageblockDimensions: MTLSize) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.imageblockMemoryLengthForDimensions_, imageblockDimensions);
    }

    functionHandleWithFunction_stage_ :: (self: *MTLRenderPipelineState, function: *MTLFunction, stage: MTLRenderStages) -> *MTLFunctionHandle {
        func: #type (obj: *void, selector: *void, function: *MTLFunction, stage: MTLRenderStages) -> *MTLFunctionHandle #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionHandleWithFunction_stage_, function, stage);
    }

    newVisibleFunctionTableWithDescriptor_stage_ :: (self: *MTLRenderPipelineState, descriptor: *MTLVisibleFunctionTableDescriptor, stage: MTLRenderStages) -> *MTLVisibleFunctionTable {
        func: #type (obj: *void, selector: *void, descriptor: *MTLVisibleFunctionTableDescriptor, stage: MTLRenderStages) -> *MTLVisibleFunctionTable #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newVisibleFunctionTableWithDescriptor_stage_, descriptor, stage);
    }

    newIntersectionFunctionTableWithDescriptor_stage_ :: (self: *MTLRenderPipelineState, descriptor: *MTLIntersectionFunctionTableDescriptor, stage: MTLRenderStages) -> *MTLIntersectionFunctionTable {
        func: #type (obj: *void, selector: *void, descriptor: *MTLIntersectionFunctionTableDescriptor, stage: MTLRenderStages) -> *MTLIntersectionFunctionTable #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newIntersectionFunctionTableWithDescriptor_stage_, descriptor, stage);
    }

    newRenderPipelineStateWithAdditionalBinaryFunctions_error_ :: (self: *MTLRenderPipelineState, additionalBinaryFunctions: *MTLRenderPipelineFunctionsDescriptor, error: **NSError) -> *MTLRenderPipelineState {
        func: #type (obj: *void, selector: *void, additionalBinaryFunctions: *MTLRenderPipelineFunctionsDescriptor, error: **NSError) -> *MTLRenderPipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithAdditionalBinaryFunctions_error_, additionalBinaryFunctions, error);
    }

    label :: (self: *MTLRenderPipelineState) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    device :: (self: *MTLRenderPipelineState) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

    reflection :: (self: *MTLRenderPipelineState) -> *MTLRenderPipelineReflection {
        func: #type (obj: *void, selector: *void) -> *MTLRenderPipelineReflection #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reflection);
    }

    maxTotalThreadsPerThreadgroup :: (self: *MTLRenderPipelineState) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadsPerThreadgroup);
    }

    threadgroupSizeMatchesTileSize :: (self: *MTLRenderPipelineState) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.threadgroupSizeMatchesTileSize);
    }

    imageblockSampleLength :: (self: *MTLRenderPipelineState) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.imageblockSampleLength);
    }

    supportIndirectCommandBuffers :: (self: *MTLRenderPipelineState) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportIndirectCommandBuffers);
    }

    maxTotalThreadsPerObjectThreadgroup :: (self: *MTLRenderPipelineState) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadsPerObjectThreadgroup);
    }

    maxTotalThreadsPerMeshThreadgroup :: (self: *MTLRenderPipelineState) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadsPerMeshThreadgroup);
    }

    objectThreadExecutionWidth :: (self: *MTLRenderPipelineState) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectThreadExecutionWidth);
    }

    meshThreadExecutionWidth :: (self: *MTLRenderPipelineState) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.meshThreadExecutionWidth);
    }

    maxTotalThreadgroupsPerMeshGrid :: (self: *MTLRenderPipelineState) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadgroupsPerMeshGrid);
    }

    gpuResourceID :: (self: *MTLRenderPipelineState) -> MTLResourceID {
        func: #type (obj: *void, selector: *void) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.gpuResourceID);
    }

    shaderValidation :: (self: *MTLRenderPipelineState) -> MTLShaderValidation {
        func: #type (obj: *void, selector: *void) -> MTLShaderValidation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.shaderValidation);
    }

    requiredThreadsPerTileThreadgroup :: (self: *MTLRenderPipelineState) -> MTLSize {
        func: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.requiredThreadsPerTileThreadgroup);
    }

    requiredThreadsPerObjectThreadgroup :: (self: *MTLRenderPipelineState) -> MTLSize {
        func: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.requiredThreadsPerObjectThreadgroup);
    }

    requiredThreadsPerMeshThreadgroup :: (self: *MTLRenderPipelineState) -> MTLSize {
        func: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.requiredThreadsPerMeshThreadgroup);
    }

}

MTLParallelRenderCommandEncoder :: struct #type_info_no_size_complaint {
    renderCommandEncoder :: (self: *MTLParallelRenderCommandEncoder) -> *MTLRenderCommandEncoder {
        func: #type (obj: *void, selector: *void) -> *MTLRenderCommandEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.renderCommandEncoder);
    }

    setColorStoreAction_atIndex_ :: (self: *MTLParallelRenderCommandEncoder, storeAction: MTLStoreAction, colorAttachmentIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, storeAction: MTLStoreAction, colorAttachmentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setColorStoreAction_atIndex_, storeAction, colorAttachmentIndex);
    }

    setDepthStoreAction_ :: (self: *MTLParallelRenderCommandEncoder, storeAction: MTLStoreAction) -> void {
        func: #type (obj: *void, selector: *void, storeAction: MTLStoreAction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthStoreAction_, storeAction);
    }

    setStencilStoreAction_ :: (self: *MTLParallelRenderCommandEncoder, storeAction: MTLStoreAction) -> void {
        func: #type (obj: *void, selector: *void, storeAction: MTLStoreAction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilStoreAction_, storeAction);
    }

    setColorStoreActionOptions_atIndex_ :: (self: *MTLParallelRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions, colorAttachmentIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, storeActionOptions: MTLStoreActionOptions, colorAttachmentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setColorStoreActionOptions_atIndex_, storeActionOptions, colorAttachmentIndex);
    }

    setDepthStoreActionOptions_ :: (self: *MTLParallelRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions) -> void {
        func: #type (obj: *void, selector: *void, storeActionOptions: MTLStoreActionOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthStoreActionOptions_, storeActionOptions);
    }

    setStencilStoreActionOptions_ :: (self: *MTLParallelRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions) -> void {
        func: #type (obj: *void, selector: *void, storeActionOptions: MTLStoreActionOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilStoreActionOptions_, storeActionOptions);
    }

}

MTLSamplerState :: struct #type_info_no_size_complaint {
    label :: (self: *MTLSamplerState) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    device :: (self: *MTLSamplerState) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

    gpuResourceID :: (self: *MTLSamplerState) -> MTLResourceID {
        func: #type (obj: *void, selector: *void) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.gpuResourceID);
    }

}

MTLAccelerationStructure :: struct #type_info_no_size_complaint {
    size :: (self: *MTLAccelerationStructure) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.size);
    }

    gpuResourceID :: (self: *MTLAccelerationStructure) -> MTLResourceID {
        func: #type (obj: *void, selector: *void) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.gpuResourceID);
    }

}

MTLHeap :: struct #type_info_no_size_complaint {
    maxAvailableSizeWithAlignment_ :: (self: *MTLHeap, alignment: NSUInteger) -> NSUInteger {
        func: #type (obj: *void, selector: *void, alignment: NSUInteger) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxAvailableSizeWithAlignment_, alignment);
    }

    newBufferWithLength_options_ :: (self: *MTLHeap, length: NSUInteger, options: MTLResourceOptions) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void, length: NSUInteger, options: MTLResourceOptions) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newBufferWithLength_options_, length, options);
    }

    newTextureWithDescriptor_ :: (self: *MTLHeap, descriptor: *MTLTextureDescriptor) -> *MTLTexture {
        func: #type (obj: *void, selector: *void, descriptor: *MTLTextureDescriptor) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newTextureWithDescriptor_, descriptor);
    }

    setPurgeableState_ :: (self: *MTLHeap, state: MTLPurgeableState) -> MTLPurgeableState {
        func: #type (obj: *void, selector: *void, state: MTLPurgeableState) -> MTLPurgeableState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPurgeableState_, state);
    }

    newBufferWithLength_options_offset_ :: (self: *MTLHeap, length: NSUInteger, options: MTLResourceOptions, offset: NSUInteger) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void, length: NSUInteger, options: MTLResourceOptions, offset: NSUInteger) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newBufferWithLength_options_offset_, length, options, offset);
    }

    newTextureWithDescriptor_offset_ :: (self: *MTLHeap, descriptor: *MTLTextureDescriptor, offset: NSUInteger) -> *MTLTexture {
        func: #type (obj: *void, selector: *void, descriptor: *MTLTextureDescriptor, offset: NSUInteger) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newTextureWithDescriptor_offset_, descriptor, offset);
    }

    newAccelerationStructureWithSize_ :: (self: *MTLHeap, size: NSUInteger) -> *MTLAccelerationStructure {
        func: #type (obj: *void, selector: *void, size: NSUInteger) -> *MTLAccelerationStructure #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newAccelerationStructureWithSize_, size);
    }

    newAccelerationStructureWithDescriptor_ :: (self: *MTLHeap, descriptor: *MTLAccelerationStructureDescriptor) -> *MTLAccelerationStructure {
        func: #type (obj: *void, selector: *void, descriptor: *MTLAccelerationStructureDescriptor) -> *MTLAccelerationStructure #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newAccelerationStructureWithDescriptor_, descriptor);
    }

    newAccelerationStructureWithSize_offset_ :: (self: *MTLHeap, size: NSUInteger, offset: NSUInteger) -> *MTLAccelerationStructure {
        func: #type (obj: *void, selector: *void, size: NSUInteger, offset: NSUInteger) -> *MTLAccelerationStructure #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newAccelerationStructureWithSize_offset_, size, offset);
    }

    newAccelerationStructureWithDescriptor_offset_ :: (self: *MTLHeap, descriptor: *MTLAccelerationStructureDescriptor, offset: NSUInteger) -> *MTLAccelerationStructure {
        func: #type (obj: *void, selector: *void, descriptor: *MTLAccelerationStructureDescriptor, offset: NSUInteger) -> *MTLAccelerationStructure #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newAccelerationStructureWithDescriptor_offset_, descriptor, offset);
    }

    label :: (self: *MTLHeap) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLHeap, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

    device :: (self: *MTLHeap) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

    storageMode :: (self: *MTLHeap) -> MTLStorageMode {
        func: #type (obj: *void, selector: *void) -> MTLStorageMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.storageMode);
    }

    cpuCacheMode :: (self: *MTLHeap) -> MTLCPUCacheMode {
        func: #type (obj: *void, selector: *void) -> MTLCPUCacheMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.cpuCacheMode);
    }

    hazardTrackingMode :: (self: *MTLHeap) -> MTLHazardTrackingMode {
        func: #type (obj: *void, selector: *void) -> MTLHazardTrackingMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.hazardTrackingMode);
    }

    resourceOptions :: (self: *MTLHeap) -> MTLResourceOptions {
        func: #type (obj: *void, selector: *void) -> MTLResourceOptions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resourceOptions);
    }

    size :: (self: *MTLHeap) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.size);
    }

    usedSize :: (self: *MTLHeap) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.usedSize);
    }

    currentAllocatedSize :: (self: *MTLHeap) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.currentAllocatedSize);
    }

    type :: (self: *MTLHeap) -> MTLHeapType {
        func: #type (obj: *void, selector: *void) -> MTLHeapType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.type);
    }

}

MTLArgumentEncoder :: struct #type_info_no_size_complaint {
    setArgumentBuffer_offset_ :: (self: *MTLArgumentEncoder, argumentBuffer: *MTLBuffer, offset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, argumentBuffer: *MTLBuffer, offset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setArgumentBuffer_offset_, argumentBuffer, offset);
    }

    setArgumentBuffer_startOffset_arrayElement_ :: (self: *MTLArgumentEncoder, argumentBuffer: *MTLBuffer, startOffset: NSUInteger, arrayElement: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, argumentBuffer: *MTLBuffer, startOffset: NSUInteger, arrayElement: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setArgumentBuffer_startOffset_arrayElement_, argumentBuffer, startOffset, arrayElement);
    }

    setBuffer_offset_atIndex_ :: (self: *MTLArgumentEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBuffer_offset_atIndex_, buffer, offset, index);
    }

    setBuffers_offsets_withRange_ :: (self: *MTLArgumentEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBuffers_offsets_withRange_, buffers, offsets, range);
    }

    setTexture_atIndex_ :: (self: *MTLArgumentEncoder, texture: *MTLTexture, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTexture_atIndex_, texture, index);
    }

    setTextures_withRange_ :: (self: *MTLArgumentEncoder, textures: **MTLTexture, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, textures: **MTLTexture, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTextures_withRange_, textures, range);
    }

    setSamplerState_atIndex_ :: (self: *MTLArgumentEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampler: *MTLSamplerState, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSamplerState_atIndex_, sampler, index);
    }

    setSamplerStates_withRange_ :: (self: *MTLArgumentEncoder, samplers: **MTLSamplerState, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, samplers: **MTLSamplerState, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSamplerStates_withRange_, samplers, range);
    }

    constantDataAtIndex_ :: (self: *MTLArgumentEncoder, index: NSUInteger) -> *void {
        func: #type (obj: *void, selector: *void, index: NSUInteger) -> *void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.constantDataAtIndex_, index);
    }

    setRenderPipelineState_atIndex_ :: (self: *MTLArgumentEncoder, pipeline: *MTLRenderPipelineState, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, pipeline: *MTLRenderPipelineState, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRenderPipelineState_atIndex_, pipeline, index);
    }

    setRenderPipelineStates_withRange_ :: (self: *MTLArgumentEncoder, pipelines: **MTLRenderPipelineState, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, pipelines: **MTLRenderPipelineState, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRenderPipelineStates_withRange_, pipelines, range);
    }

    setComputePipelineState_atIndex_ :: (self: *MTLArgumentEncoder, pipeline: *MTLComputePipelineState, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, pipeline: *MTLComputePipelineState, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setComputePipelineState_atIndex_, pipeline, index);
    }

    setComputePipelineStates_withRange_ :: (self: *MTLArgumentEncoder, pipelines: **MTLComputePipelineState, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, pipelines: **MTLComputePipelineState, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setComputePipelineStates_withRange_, pipelines, range);
    }

    setIndirectCommandBuffer_atIndex_ :: (self: *MTLArgumentEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, indirectCommandBuffer: *MTLIndirectCommandBuffer, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndirectCommandBuffer_atIndex_, indirectCommandBuffer, index);
    }

    setIndirectCommandBuffers_withRange_ :: (self: *MTLArgumentEncoder, buffers: **MTLIndirectCommandBuffer, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, buffers: **MTLIndirectCommandBuffer, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndirectCommandBuffers_withRange_, buffers, range);
    }

    setAccelerationStructure_atIndex_ :: (self: *MTLArgumentEncoder, accelerationStructure: *MTLAccelerationStructure, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, accelerationStructure: *MTLAccelerationStructure, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAccelerationStructure_atIndex_, accelerationStructure, index);
    }

    newArgumentEncoderForBufferAtIndex_ :: (self: *MTLArgumentEncoder, index: NSUInteger) -> *MTLArgumentEncoder {
        func: #type (obj: *void, selector: *void, index: NSUInteger) -> *MTLArgumentEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newArgumentEncoderForBufferAtIndex_, index);
    }

    setVisibleFunctionTable_atIndex_ :: (self: *MTLArgumentEncoder, visibleFunctionTable: *MTLVisibleFunctionTable, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, visibleFunctionTable: *MTLVisibleFunctionTable, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVisibleFunctionTable_atIndex_, visibleFunctionTable, index);
    }

    setVisibleFunctionTables_withRange_ :: (self: *MTLArgumentEncoder, visibleFunctionTables: **MTLVisibleFunctionTable, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, visibleFunctionTables: **MTLVisibleFunctionTable, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVisibleFunctionTables_withRange_, visibleFunctionTables, range);
    }

    setIntersectionFunctionTable_atIndex_ :: (self: *MTLArgumentEncoder, intersectionFunctionTable: *MTLIntersectionFunctionTable, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, intersectionFunctionTable: *MTLIntersectionFunctionTable, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIntersectionFunctionTable_atIndex_, intersectionFunctionTable, index);
    }

    setIntersectionFunctionTables_withRange_ :: (self: *MTLArgumentEncoder, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIntersectionFunctionTables_withRange_, intersectionFunctionTables, range);
    }

    setDepthStencilState_atIndex_ :: (self: *MTLArgumentEncoder, depthStencilState: *MTLDepthStencilState, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, depthStencilState: *MTLDepthStencilState, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthStencilState_atIndex_, depthStencilState, index);
    }

    setDepthStencilStates_withRange_ :: (self: *MTLArgumentEncoder, depthStencilStates: **MTLDepthStencilState, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, depthStencilStates: **MTLDepthStencilState, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthStencilStates_withRange_, depthStencilStates, range);
    }

    device :: (self: *MTLArgumentEncoder) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

    label :: (self: *MTLArgumentEncoder) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLArgumentEncoder, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

    encodedLength :: (self: *MTLArgumentEncoder) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.encodedLength);
    }

    alignment :: (self: *MTLArgumentEncoder) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.alignment);
    }

}

MTL4CommandEncoder :: struct #type_info_no_size_complaint {
    barrierAfterQueueStages_beforeStages_visibilityOptions_ :: (self: *MTL4CommandEncoder, afterQueueStages: MTLStages, beforeStages: MTLStages, visibilityOptions: MTL4VisibilityOptions) -> void {
        func: #type (obj: *void, selector: *void, afterQueueStages: MTLStages, beforeStages: MTLStages, visibilityOptions: MTL4VisibilityOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.barrierAfterQueueStages_beforeStages_visibilityOptions_, afterQueueStages, beforeStages, visibilityOptions);
    }

    barrierAfterStages_beforeQueueStages_visibilityOptions_ :: (self: *MTL4CommandEncoder, afterStages: MTLStages, beforeQueueStages: MTLStages, visibilityOptions: MTL4VisibilityOptions) -> void {
        func: #type (obj: *void, selector: *void, afterStages: MTLStages, beforeQueueStages: MTLStages, visibilityOptions: MTL4VisibilityOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.barrierAfterStages_beforeQueueStages_visibilityOptions_, afterStages, beforeQueueStages, visibilityOptions);
    }

    barrierAfterEncoderStages_beforeEncoderStages_visibilityOptions_ :: (self: *MTL4CommandEncoder, afterEncoderStages: MTLStages, beforeEncoderStages: MTLStages, visibilityOptions: MTL4VisibilityOptions) -> void {
        func: #type (obj: *void, selector: *void, afterEncoderStages: MTLStages, beforeEncoderStages: MTLStages, visibilityOptions: MTL4VisibilityOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.barrierAfterEncoderStages_beforeEncoderStages_visibilityOptions_, afterEncoderStages, beforeEncoderStages, visibilityOptions);
    }

    updateFence_afterEncoderStages_ :: (self: *MTL4CommandEncoder, fence: *MTLFence, afterEncoderStages: MTLStages) -> void {
        func: #type (obj: *void, selector: *void, fence: *MTLFence, afterEncoderStages: MTLStages) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.updateFence_afterEncoderStages_, fence, afterEncoderStages);
    }

    waitForFence_beforeEncoderStages_ :: (self: *MTL4CommandEncoder, fence: *MTLFence, beforeEncoderStages: MTLStages) -> void {
        func: #type (obj: *void, selector: *void, fence: *MTLFence, beforeEncoderStages: MTLStages) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.waitForFence_beforeEncoderStages_, fence, beforeEncoderStages);
    }

    insertDebugSignpost_ :: (self: *MTL4CommandEncoder, str: *NSString) -> void {
        func: #type (obj: *void, selector: *void, str: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.insertDebugSignpost_, str);
    }

    pushDebugGroup_ :: (self: *MTL4CommandEncoder, str: *NSString) -> void {
        func: #type (obj: *void, selector: *void, str: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pushDebugGroup_, str);
    }

    popDebugGroup :: (self: *MTL4CommandEncoder) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.popDebugGroup);
    }

    endEncoding :: (self: *MTL4CommandEncoder) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.endEncoding);
    }

    label :: (self: *MTL4CommandEncoder) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTL4CommandEncoder, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

    commandBuffer :: (self: *MTL4CommandEncoder) -> *MTL4CommandBuffer {
        func: #type (obj: *void, selector: *void) -> *MTL4CommandBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.commandBuffer);
    }

}

MTL4RenderCommandEncoder :: struct #type_info_no_size_complaint {
    setColorAttachmentMap_ :: (self: *MTL4RenderCommandEncoder, mapping: *MTLLogicalToPhysicalColorAttachmentMap) -> void {
        func: #type (obj: *void, selector: *void, mapping: *MTLLogicalToPhysicalColorAttachmentMap) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setColorAttachmentMap_, mapping);
    }

    setRenderPipelineState_ :: (self: *MTL4RenderCommandEncoder, pipelineState: *MTLRenderPipelineState) -> void {
        func: #type (obj: *void, selector: *void, pipelineState: *MTLRenderPipelineState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRenderPipelineState_, pipelineState);
    }

    setViewport_ :: (self: *MTL4RenderCommandEncoder, viewport: MTLViewport) -> void {
        func: #type (obj: *void, selector: *void, viewport: MTLViewport) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setViewport_, viewport);
    }

    setViewports_count_ :: (self: *MTL4RenderCommandEncoder, viewports: *MTLViewport, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, viewports: *MTLViewport, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setViewports_count_, viewports, count);
    }

    setVertexAmplificationCount_viewMappings_ :: (self: *MTL4RenderCommandEncoder, count: NSUInteger, viewMappings: *MTLVertexAmplificationViewMapping) -> void {
        func: #type (obj: *void, selector: *void, count: NSUInteger, viewMappings: *MTLVertexAmplificationViewMapping) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexAmplificationCount_viewMappings_, count, viewMappings);
    }

    setCullMode_ :: (self: *MTL4RenderCommandEncoder, cullMode: MTLCullMode) -> void {
        func: #type (obj: *void, selector: *void, cullMode: MTLCullMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCullMode_, cullMode);
    }

    setDepthClipMode_ :: (self: *MTL4RenderCommandEncoder, depthClipMode: MTLDepthClipMode) -> void {
        func: #type (obj: *void, selector: *void, depthClipMode: MTLDepthClipMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthClipMode_, depthClipMode);
    }

    setDepthBias_slopeScale_clamp_ :: (self: *MTL4RenderCommandEncoder, depthBias: float32, slopeScale: float32, clamp: float32) -> void {
        func: #type (obj: *void, selector: *void, depthBias: float32, slopeScale: float32, clamp: float32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthBias_slopeScale_clamp_, depthBias, slopeScale, clamp);
    }

    setDepthTestMinBound_maxBound_ :: (self: *MTL4RenderCommandEncoder, minBound: float32, maxBound: float32) -> void {
        func: #type (obj: *void, selector: *void, minBound: float32, maxBound: float32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthTestMinBound_maxBound_, minBound, maxBound);
    }

    setScissorRect_ :: (self: *MTL4RenderCommandEncoder, rect: MTLScissorRect) -> void {
        func: #type (obj: *void, selector: *void, rect: MTLScissorRect) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setScissorRect_, rect);
    }

    setScissorRects_count_ :: (self: *MTL4RenderCommandEncoder, scissorRects: *MTLScissorRect, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, scissorRects: *MTLScissorRect, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setScissorRects_count_, scissorRects, count);
    }

    setTriangleFillMode_ :: (self: *MTL4RenderCommandEncoder, fillMode: MTLTriangleFillMode) -> void {
        func: #type (obj: *void, selector: *void, fillMode: MTLTriangleFillMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTriangleFillMode_, fillMode);
    }

    setBlendColorRed_green_blue_alpha_ :: (self: *MTL4RenderCommandEncoder, red: float32, green: float32, blue: float32, alpha: float32) -> void {
        func: #type (obj: *void, selector: *void, red: float32, green: float32, blue: float32, alpha: float32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBlendColorRed_green_blue_alpha_, red, green, blue, alpha);
    }

    setDepthStencilState_ :: (self: *MTL4RenderCommandEncoder, depthStencilState: *MTLDepthStencilState) -> void {
        func: #type (obj: *void, selector: *void, depthStencilState: *MTLDepthStencilState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthStencilState_, depthStencilState);
    }

    setStencilReferenceValue_ :: (self: *MTL4RenderCommandEncoder, referenceValue: u32) -> void {
        func: #type (obj: *void, selector: *void, referenceValue: u32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilReferenceValue_, referenceValue);
    }

    setStencilFrontReferenceValue_backReferenceValue_ :: (self: *MTL4RenderCommandEncoder, frontReferenceValue: u32, backReferenceValue: u32) -> void {
        func: #type (obj: *void, selector: *void, frontReferenceValue: u32, backReferenceValue: u32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilFrontReferenceValue_backReferenceValue_, frontReferenceValue, backReferenceValue);
    }

    setVisibilityResultMode_offset_ :: (self: *MTL4RenderCommandEncoder, mode: MTLVisibilityResultMode, offset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, mode: MTLVisibilityResultMode, offset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVisibilityResultMode_offset_, mode, offset);
    }

    setColorStoreAction_atIndex_ :: (self: *MTL4RenderCommandEncoder, storeAction: MTLStoreAction, colorAttachmentIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, storeAction: MTLStoreAction, colorAttachmentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setColorStoreAction_atIndex_, storeAction, colorAttachmentIndex);
    }

    setDepthStoreAction_ :: (self: *MTL4RenderCommandEncoder, storeAction: MTLStoreAction) -> void {
        func: #type (obj: *void, selector: *void, storeAction: MTLStoreAction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthStoreAction_, storeAction);
    }

    setStencilStoreAction_ :: (self: *MTL4RenderCommandEncoder, storeAction: MTLStoreAction) -> void {
        func: #type (obj: *void, selector: *void, storeAction: MTLStoreAction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilStoreAction_, storeAction);
    }

    drawPrimitives_vertexStart_vertexCount_ :: (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawPrimitives_vertexStart_vertexCount_, primitiveType, vertexStart, vertexCount);
    }

    drawPrimitives_vertexStart_vertexCount_instanceCount_ :: (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawPrimitives_vertexStart_vertexCount_instanceCount_, primitiveType, vertexStart, vertexCount, instanceCount);
    }

    drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance_ :: (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance_, primitiveType, vertexStart, vertexCount, instanceCount, baseInstance);
    }

    drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferLength_ :: (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: MTLGPUAddress, indexBufferLength: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: MTLGPUAddress, indexBufferLength: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferLength_, primitiveType, indexCount, indexType, indexBuffer, indexBufferLength);
    }

    drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferLength_instanceCount_ :: (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: MTLGPUAddress, indexBufferLength: NSUInteger, instanceCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: MTLGPUAddress, indexBufferLength: NSUInteger, instanceCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferLength_instanceCount_, primitiveType, indexCount, indexType, indexBuffer, indexBufferLength, instanceCount);
    }

    drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferLength_instanceCount_baseVertex_baseInstance_ :: (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: MTLGPUAddress, indexBufferLength: NSUInteger, instanceCount: NSUInteger, baseVertex: NSInteger, baseInstance: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: MTLGPUAddress, indexBufferLength: NSUInteger, instanceCount: NSUInteger, baseVertex: NSInteger, baseInstance: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferLength_instanceCount_baseVertex_baseInstance_, primitiveType, indexCount, indexType, indexBuffer, indexBufferLength, instanceCount, baseVertex, baseInstance);
    }

    drawPrimitives_indirectBuffer_ :: (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, indirectBuffer: MTLGPUAddress) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, indirectBuffer: MTLGPUAddress) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawPrimitives_indirectBuffer_, primitiveType, indirectBuffer);
    }

    drawIndexedPrimitives_indexType_indexBuffer_indexBufferLength_indirectBuffer_ :: (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, indexType: MTLIndexType, indexBuffer: MTLGPUAddress, indexBufferLength: NSUInteger, indirectBuffer: MTLGPUAddress) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, indexType: MTLIndexType, indexBuffer: MTLGPUAddress, indexBufferLength: NSUInteger, indirectBuffer: MTLGPUAddress) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawIndexedPrimitives_indexType_indexBuffer_indexBufferLength_indirectBuffer_, primitiveType, indexType, indexBuffer, indexBufferLength, indirectBuffer);
    }

    executeCommandsInBuffer_withRange_ :: (self: *MTL4RenderCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, executionRange: NSRange) -> void {
        func: #type (obj: *void, selector: *void, indirectCommandBuffer: *MTLIndirectCommandBuffer, executionRange: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.executeCommandsInBuffer_withRange_, indirectCommandBuffer, executionRange);
    }

    executeCommandsInBuffer_indirectBuffer_ :: (self: *MTL4RenderCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, indirectRangeBuffer: MTLGPUAddress) -> void {
        func: #type (obj: *void, selector: *void, indirectCommandBuffer: *MTLIndirectCommandBuffer, indirectRangeBuffer: MTLGPUAddress) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.executeCommandsInBuffer_indirectBuffer_, indirectCommandBuffer, indirectRangeBuffer);
    }

    setObjectThreadgroupMemoryLength_atIndex_ :: (self: *MTL4RenderCommandEncoder, length: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, length: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectThreadgroupMemoryLength_atIndex_, length, index);
    }

    drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_ :: (self: *MTL4RenderCommandEncoder, threadgroupsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, threadgroupsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_, threadgroupsPerGrid, threadsPerObjectThreadgroup, threadsPerMeshThreadgroup);
    }

    drawMeshThreads_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_ :: (self: *MTL4RenderCommandEncoder, threadsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, threadsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawMeshThreads_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_, threadsPerGrid, threadsPerObjectThreadgroup, threadsPerMeshThreadgroup);
    }

    drawMeshThreadgroupsWithIndirectBuffer_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_ :: (self: *MTL4RenderCommandEncoder, indirectBuffer: MTLGPUAddress, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, indirectBuffer: MTLGPUAddress, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawMeshThreadgroupsWithIndirectBuffer_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_, indirectBuffer, threadsPerObjectThreadgroup, threadsPerMeshThreadgroup);
    }

    dispatchThreadsPerTile_ :: (self: *MTL4RenderCommandEncoder, threadsPerTile: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, threadsPerTile: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dispatchThreadsPerTile_, threadsPerTile);
    }

    setThreadgroupMemoryLength_offset_atIndex_ :: (self: *MTL4RenderCommandEncoder, length: NSUInteger, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, length: NSUInteger, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setThreadgroupMemoryLength_offset_atIndex_, length, offset, index);
    }

    setArgumentTable_atStages_ :: (self: *MTL4RenderCommandEncoder, argumentTable: *MTL4ArgumentTable, stages: MTLRenderStages) -> void {
        func: #type (obj: *void, selector: *void, argumentTable: *MTL4ArgumentTable, stages: MTLRenderStages) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setArgumentTable_atStages_, argumentTable, stages);
    }

    setFrontFacingWinding_ :: (self: *MTL4RenderCommandEncoder, frontFacingWinding: MTLWinding) -> void {
        func: #type (obj: *void, selector: *void, frontFacingWinding: MTLWinding) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFrontFacingWinding_, frontFacingWinding);
    }

    writeTimestampWithGranularity_afterStage_intoHeap_atIndex_ :: (self: *MTL4RenderCommandEncoder, granularity: MTL4TimestampGranularity, stage: MTLRenderStages, counterHeap: *MTL4CounterHeap, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, granularity: MTL4TimestampGranularity, stage: MTLRenderStages, counterHeap: *MTL4CounterHeap, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.writeTimestampWithGranularity_afterStage_intoHeap_atIndex_, granularity, stage, counterHeap, index);
    }

    tileWidth :: (self: *MTL4RenderCommandEncoder) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileWidth);
    }

    tileHeight :: (self: *MTL4RenderCommandEncoder) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileHeight);
    }

}

MTL4CommandBuffer :: struct #type_info_no_size_complaint {
    beginCommandBufferWithAllocator_ :: (self: *MTL4CommandBuffer, allocator: *MTL4CommandAllocator) -> void {
        func: #type (obj: *void, selector: *void, allocator: *MTL4CommandAllocator) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.beginCommandBufferWithAllocator_, allocator);
    }

    beginCommandBufferWithAllocator_options_ :: (self: *MTL4CommandBuffer, allocator: *MTL4CommandAllocator, options: *MTL4CommandBufferOptions) -> void {
        func: #type (obj: *void, selector: *void, allocator: *MTL4CommandAllocator, options: *MTL4CommandBufferOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.beginCommandBufferWithAllocator_options_, allocator, options);
    }

    endCommandBuffer :: (self: *MTL4CommandBuffer) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.endCommandBuffer);
    }

    renderCommandEncoderWithDescriptor_ :: (self: *MTL4CommandBuffer, descriptor: *MTL4RenderPassDescriptor) -> *MTL4RenderCommandEncoder {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4RenderPassDescriptor) -> *MTL4RenderCommandEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.renderCommandEncoderWithDescriptor_, descriptor);
    }

    renderCommandEncoderWithDescriptor_options_ :: (self: *MTL4CommandBuffer, descriptor: *MTL4RenderPassDescriptor, options: MTL4RenderEncoderOptions) -> *MTL4RenderCommandEncoder {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4RenderPassDescriptor, options: MTL4RenderEncoderOptions) -> *MTL4RenderCommandEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.renderCommandEncoderWithDescriptor_options_, descriptor, options);
    }

    computeCommandEncoder :: (self: *MTL4CommandBuffer) -> *MTL4ComputeCommandEncoder {
        func: #type (obj: *void, selector: *void) -> *MTL4ComputeCommandEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.computeCommandEncoder);
    }

    machineLearningCommandEncoder :: (self: *MTL4CommandBuffer) -> *MTL4MachineLearningCommandEncoder {
        func: #type (obj: *void, selector: *void) -> *MTL4MachineLearningCommandEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.machineLearningCommandEncoder);
    }

    useResidencySet_ :: (self: *MTL4CommandBuffer, residencySet: *MTLResidencySet) -> void {
        func: #type (obj: *void, selector: *void, residencySet: *MTLResidencySet) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useResidencySet_, residencySet);
    }

    useResidencySets_count_ :: (self: *MTL4CommandBuffer, residencySets: **MTLResidencySet, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, residencySets: **MTLResidencySet, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useResidencySets_count_, residencySets, count);
    }

    pushDebugGroup_ :: (self: *MTL4CommandBuffer, str: *NSString) -> void {
        func: #type (obj: *void, selector: *void, str: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pushDebugGroup_, str);
    }

    popDebugGroup :: (self: *MTL4CommandBuffer) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.popDebugGroup);
    }

    writeTimestampIntoHeap_atIndex_ :: (self: *MTL4CommandBuffer, counterHeap: *MTL4CounterHeap, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, counterHeap: *MTL4CounterHeap, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.writeTimestampIntoHeap_atIndex_, counterHeap, index);
    }

    resolveCounterHeap_withRange_intoBuffer_waitFence_updateFence_ :: (self: *MTL4CommandBuffer, counterHeap: *MTL4CounterHeap, range: NSRange, bufferRange: MTL4BufferRange, fenceToWait: *MTLFence, fenceToUpdate: *MTLFence) -> void {
        func: #type (obj: *void, selector: *void, counterHeap: *MTL4CounterHeap, range: NSRange, bufferRange: MTL4BufferRange, fenceToWait: *MTLFence, fenceToUpdate: *MTLFence) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resolveCounterHeap_withRange_intoBuffer_waitFence_updateFence_, counterHeap, range, bufferRange, fenceToWait, fenceToUpdate);
    }

    device :: (self: *MTL4CommandBuffer) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

    label :: (self: *MTL4CommandBuffer) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTL4CommandBuffer, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

}

MTLEvent :: struct #type_info_no_size_complaint {
    device :: (self: *MTLEvent) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

    label :: (self: *MTLEvent) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLEvent, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

}

MTLSharedEvent :: struct #type_info_no_size_complaint {
    notifyListener_atValue_block_ :: (self: *MTLSharedEvent, listener: *MTLSharedEventListener, value: u64, block: MTLSharedEventNotificationBlock) -> void {
        func: #type (obj: *void, selector: *void, listener: *MTLSharedEventListener, value: u64, block: MTLSharedEventNotificationBlock) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.notifyListener_atValue_block_, listener, value, block);
    }

    newSharedEventHandle :: (self: *MTLSharedEvent) -> *MTLSharedEventHandle {
        func: #type (obj: *void, selector: *void) -> *MTLSharedEventHandle #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newSharedEventHandle);
    }

    waitUntilSignaledValue_timeoutMS_ :: (self: *MTLSharedEvent, value: u64, milliseconds: u64) -> BOOL {
        func: #type (obj: *void, selector: *void, value: u64, milliseconds: u64) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.waitUntilSignaledValue_timeoutMS_, value, milliseconds);
    }

    signaledValue :: (self: *MTLSharedEvent) -> u64 {
        func: #type (obj: *void, selector: *void) -> u64 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.signaledValue);
    }

    setSignaledValue_ :: (self: *MTLSharedEvent, signaledValue: u64) -> void {
        func: #type (obj: *void, selector: *void, signaledValue: u64) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSignaledValue_, signaledValue);
    }

}

MTL4CommitFeedback :: struct #type_info_no_size_complaint {
    error :: (self: *MTL4CommitFeedback) -> *NSError {
        func: #type (obj: *void, selector: *void) -> *NSError #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.error);
    }

    GPUStartTime :: (self: *MTL4CommitFeedback) -> CFTimeInterval {
        func: #type (obj: *void, selector: *void) -> CFTimeInterval #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.GPUStartTime);
    }

    GPUEndTime :: (self: *MTL4CommitFeedback) -> CFTimeInterval {
        func: #type (obj: *void, selector: *void) -> CFTimeInterval #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.GPUEndTime);
    }

}

MTL4CommandQueue :: struct #type_info_no_size_complaint {
    commit_count_ :: (self: *MTL4CommandQueue, commandBuffers: **MTL4CommandBuffer, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, commandBuffers: **MTL4CommandBuffer, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.commit_count_, commandBuffers, count);
    }

    commit_count_options_ :: (self: *MTL4CommandQueue, commandBuffers: **MTL4CommandBuffer, count: NSUInteger, options: *MTL4CommitOptions) -> void {
        func: #type (obj: *void, selector: *void, commandBuffers: **MTL4CommandBuffer, count: NSUInteger, options: *MTL4CommitOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.commit_count_options_, commandBuffers, count, options);
    }

    signalEvent_value_ :: (self: *MTL4CommandQueue, event: *MTLEvent, value: u64) -> void {
        func: #type (obj: *void, selector: *void, event: *MTLEvent, value: u64) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.signalEvent_value_, event, value);
    }

    waitForEvent_value_ :: (self: *MTL4CommandQueue, event: *MTLEvent, value: u64) -> void {
        func: #type (obj: *void, selector: *void, event: *MTLEvent, value: u64) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.waitForEvent_value_, event, value);
    }

    signalDrawable_ :: (self: *MTL4CommandQueue, drawable: *MTLDrawable) -> void {
        func: #type (obj: *void, selector: *void, drawable: *MTLDrawable) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.signalDrawable_, drawable);
    }

    waitForDrawable_ :: (self: *MTL4CommandQueue, drawable: *MTLDrawable) -> void {
        func: #type (obj: *void, selector: *void, drawable: *MTLDrawable) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.waitForDrawable_, drawable);
    }

    addResidencySet_ :: (self: *MTL4CommandQueue, residencySet: *MTLResidencySet) -> void {
        func: #type (obj: *void, selector: *void, residencySet: *MTLResidencySet) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addResidencySet_, residencySet);
    }

    addResidencySets_count_ :: (self: *MTL4CommandQueue, residencySets: **MTLResidencySet, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, residencySets: **MTLResidencySet, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addResidencySets_count_, residencySets, count);
    }

    removeResidencySet_ :: (self: *MTL4CommandQueue, residencySet: *MTLResidencySet) -> void {
        func: #type (obj: *void, selector: *void, residencySet: *MTLResidencySet) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.removeResidencySet_, residencySet);
    }

    removeResidencySets_count_ :: (self: *MTL4CommandQueue, residencySets: **MTLResidencySet, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, residencySets: **MTLResidencySet, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.removeResidencySets_count_, residencySets, count);
    }

    updateTextureMappings_heap_operations_count_ :: (self: *MTL4CommandQueue, texture: *MTLTexture, heap: *MTLHeap, operations: *MTL4UpdateSparseTextureMappingOperation, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, heap: *MTLHeap, operations: *MTL4UpdateSparseTextureMappingOperation, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.updateTextureMappings_heap_operations_count_, texture, heap, operations, count);
    }

    copyTextureMappingsFromTexture_toTexture_operations_count_ :: (self: *MTL4CommandQueue, sourceTexture: *MTLTexture, destinationTexture: *MTLTexture, operations: *MTL4CopySparseTextureMappingOperation, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sourceTexture: *MTLTexture, destinationTexture: *MTLTexture, operations: *MTL4CopySparseTextureMappingOperation, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyTextureMappingsFromTexture_toTexture_operations_count_, sourceTexture, destinationTexture, operations, count);
    }

    updateBufferMappings_heap_operations_count_ :: (self: *MTL4CommandQueue, buffer: *MTLBuffer, heap: *MTLHeap, operations: *MTL4UpdateSparseBufferMappingOperation, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, heap: *MTLHeap, operations: *MTL4UpdateSparseBufferMappingOperation, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.updateBufferMappings_heap_operations_count_, buffer, heap, operations, count);
    }

    copyBufferMappingsFromBuffer_toBuffer_operations_count_ :: (self: *MTL4CommandQueue, sourceBuffer: *MTLBuffer, destinationBuffer: *MTLBuffer, operations: *MTL4CopySparseBufferMappingOperation, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sourceBuffer: *MTLBuffer, destinationBuffer: *MTLBuffer, operations: *MTL4CopySparseBufferMappingOperation, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyBufferMappingsFromBuffer_toBuffer_operations_count_, sourceBuffer, destinationBuffer, operations, count);
    }

    device :: (self: *MTL4CommandQueue) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

    label :: (self: *MTL4CommandQueue) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

}

MTLCaptureScope :: struct #type_info_no_size_complaint {
    beginScope :: (self: *MTLCaptureScope) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.beginScope);
    }

    endScope :: (self: *MTLCaptureScope) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.endScope);
    }

    label :: (self: *MTLCaptureScope) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLCaptureScope, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

    device :: (self: *MTLCaptureScope) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

    commandQueue :: (self: *MTLCaptureScope) -> *MTLCommandQueue {
        func: #type (obj: *void, selector: *void) -> *MTLCommandQueue #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.commandQueue);
    }

    mtl4CommandQueue :: (self: *MTLCaptureScope) -> *MTL4CommandQueue {
        func: #type (obj: *void, selector: *void) -> *MTL4CommandQueue #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.mtl4CommandQueue);
    }

}

MTLIndirectRenderCommand :: struct #type_info_no_size_complaint {
    setRenderPipelineState_ :: (self: *MTLIndirectRenderCommand, pipelineState: *MTLRenderPipelineState) -> void {
        func: #type (obj: *void, selector: *void, pipelineState: *MTLRenderPipelineState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRenderPipelineState_, pipelineState);
    }

    setVertexBuffer_offset_atIndex_ :: (self: *MTLIndirectRenderCommand, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexBuffer_offset_atIndex_, buffer, offset, index);
    }

    setFragmentBuffer_offset_atIndex_ :: (self: *MTLIndirectRenderCommand, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentBuffer_offset_atIndex_, buffer, offset, index);
    }

    setVertexBuffer_offset_attributeStride_atIndex_ :: (self: *MTLIndirectRenderCommand, buffer: *MTLBuffer, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexBuffer_offset_attributeStride_atIndex_, buffer, offset, stride, index);
    }

    drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance_tessellationFactorBuffer_tessellationFactorBufferOffset_tessellationFactorBufferInstanceStride_ :: (self: *MTLIndirectRenderCommand, numberOfPatchControlPoints: NSUInteger, patchStart: NSUInteger, patchCount: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger, buffer: *MTLBuffer, offset: NSUInteger, instanceStride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, numberOfPatchControlPoints: NSUInteger, patchStart: NSUInteger, patchCount: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger, buffer: *MTLBuffer, offset: NSUInteger, instanceStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance_tessellationFactorBuffer_tessellationFactorBufferOffset_tessellationFactorBufferInstanceStride_, numberOfPatchControlPoints, patchStart, patchCount, patchIndexBuffer, patchIndexBufferOffset, instanceCount, baseInstance, buffer, offset, instanceStride);
    }

    drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_tessellationFactorBuffer_tessellationFactorBufferOffset_tessellationFactorBufferInstanceStride_ :: (self: *MTLIndirectRenderCommand, numberOfPatchControlPoints: NSUInteger, patchStart: NSUInteger, patchCount: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, controlPointIndexBuffer: *MTLBuffer, controlPointIndexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger, buffer: *MTLBuffer, offset: NSUInteger, instanceStride: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, numberOfPatchControlPoints: NSUInteger, patchStart: NSUInteger, patchCount: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, controlPointIndexBuffer: *MTLBuffer, controlPointIndexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger, buffer: *MTLBuffer, offset: NSUInteger, instanceStride: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_tessellationFactorBuffer_tessellationFactorBufferOffset_tessellationFactorBufferInstanceStride_, numberOfPatchControlPoints, patchStart, patchCount, patchIndexBuffer, patchIndexBufferOffset, controlPointIndexBuffer, controlPointIndexBufferOffset, instanceCount, baseInstance, buffer, offset, instanceStride);
    }

    drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance_ :: (self: *MTLIndirectRenderCommand, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance_, primitiveType, vertexStart, vertexCount, instanceCount, baseInstance);
    }

    drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_baseVertex_baseInstance_ :: (self: *MTLIndirectRenderCommand, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseVertex: NSInteger, baseInstance: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseVertex: NSInteger, baseInstance: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_baseVertex_baseInstance_, primitiveType, indexCount, indexType, indexBuffer, indexBufferOffset, instanceCount, baseVertex, baseInstance);
    }

    setObjectThreadgroupMemoryLength_atIndex_ :: (self: *MTLIndirectRenderCommand, length: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, length: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectThreadgroupMemoryLength_atIndex_, length, index);
    }

    setObjectBuffer_offset_atIndex_ :: (self: *MTLIndirectRenderCommand, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectBuffer_offset_atIndex_, buffer, offset, index);
    }

    setMeshBuffer_offset_atIndex_ :: (self: *MTLIndirectRenderCommand, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshBuffer_offset_atIndex_, buffer, offset, index);
    }

    drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_ :: (self: *MTLIndirectRenderCommand, threadgroupsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, threadgroupsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_, threadgroupsPerGrid, threadsPerObjectThreadgroup, threadsPerMeshThreadgroup);
    }

    drawMeshThreads_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_ :: (self: *MTLIndirectRenderCommand, threadsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, threadsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawMeshThreads_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_, threadsPerGrid, threadsPerObjectThreadgroup, threadsPerMeshThreadgroup);
    }

    setBarrier :: (self: *MTLIndirectRenderCommand) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBarrier);
    }

    clearBarrier :: (self: *MTLIndirectRenderCommand) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.clearBarrier);
    }

    setDepthStencilState_ :: (self: *MTLIndirectRenderCommand, depthStencilState: *MTLDepthStencilState) -> void {
        func: #type (obj: *void, selector: *void, depthStencilState: *MTLDepthStencilState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthStencilState_, depthStencilState);
    }

    setDepthBias_slopeScale_clamp_ :: (self: *MTLIndirectRenderCommand, depthBias: float32, slopeScale: float32, clamp: float32) -> void {
        func: #type (obj: *void, selector: *void, depthBias: float32, slopeScale: float32, clamp: float32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthBias_slopeScale_clamp_, depthBias, slopeScale, clamp);
    }

    setDepthClipMode_ :: (self: *MTLIndirectRenderCommand, depthClipMode: MTLDepthClipMode) -> void {
        func: #type (obj: *void, selector: *void, depthClipMode: MTLDepthClipMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthClipMode_, depthClipMode);
    }

    setCullMode_ :: (self: *MTLIndirectRenderCommand, cullMode: MTLCullMode) -> void {
        func: #type (obj: *void, selector: *void, cullMode: MTLCullMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCullMode_, cullMode);
    }

    setFrontFacingWinding_ :: (self: *MTLIndirectRenderCommand, frontFacingWindning: MTLWinding) -> void {
        func: #type (obj: *void, selector: *void, frontFacingWindning: MTLWinding) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFrontFacingWinding_, frontFacingWindning);
    }

    setTriangleFillMode_ :: (self: *MTLIndirectRenderCommand, fillMode: MTLTriangleFillMode) -> void {
        func: #type (obj: *void, selector: *void, fillMode: MTLTriangleFillMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTriangleFillMode_, fillMode);
    }

    reset :: (self: *MTLIndirectRenderCommand) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

}

MTLIndirectComputeCommand :: struct #type_info_no_size_complaint {
    setComputePipelineState_ :: (self: *MTLIndirectComputeCommand, pipelineState: *MTLComputePipelineState) -> void {
        func: #type (obj: *void, selector: *void, pipelineState: *MTLComputePipelineState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setComputePipelineState_, pipelineState);
    }

    setKernelBuffer_offset_atIndex_ :: (self: *MTLIndirectComputeCommand, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setKernelBuffer_offset_atIndex_, buffer, offset, index);
    }

    setKernelBuffer_offset_attributeStride_atIndex_ :: (self: *MTLIndirectComputeCommand, buffer: *MTLBuffer, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setKernelBuffer_offset_attributeStride_atIndex_, buffer, offset, stride, index);
    }

    concurrentDispatchThreadgroups_threadsPerThreadgroup_ :: (self: *MTLIndirectComputeCommand, threadgroupsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, threadgroupsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.concurrentDispatchThreadgroups_threadsPerThreadgroup_, threadgroupsPerGrid, threadsPerThreadgroup);
    }

    concurrentDispatchThreads_threadsPerThreadgroup_ :: (self: *MTLIndirectComputeCommand, threadsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, threadsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.concurrentDispatchThreads_threadsPerThreadgroup_, threadsPerGrid, threadsPerThreadgroup);
    }

    setBarrier :: (self: *MTLIndirectComputeCommand) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBarrier);
    }

    clearBarrier :: (self: *MTLIndirectComputeCommand) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.clearBarrier);
    }

    setImageblockWidth_height_ :: (self: *MTLIndirectComputeCommand, width: NSUInteger, height: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, width: NSUInteger, height: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setImageblockWidth_height_, width, height);
    }

    reset :: (self: *MTLIndirectComputeCommand) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

    setThreadgroupMemoryLength_atIndex_ :: (self: *MTLIndirectComputeCommand, length: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, length: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setThreadgroupMemoryLength_atIndex_, length, index);
    }

    setStageInRegion_ :: (self: *MTLIndirectComputeCommand, region: MTLRegion) -> void {
        func: #type (obj: *void, selector: *void, region: MTLRegion) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStageInRegion_, region);
    }

}

MTLIndirectCommandBuffer :: struct #type_info_no_size_complaint {
    resetWithRange_ :: (self: *MTLIndirectCommandBuffer, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resetWithRange_, range);
    }

    indirectRenderCommandAtIndex_ :: (self: *MTLIndirectCommandBuffer, commandIndex: NSUInteger) -> *MTLIndirectRenderCommand {
        func: #type (obj: *void, selector: *void, commandIndex: NSUInteger) -> *MTLIndirectRenderCommand #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indirectRenderCommandAtIndex_, commandIndex);
    }

    indirectComputeCommandAtIndex_ :: (self: *MTLIndirectCommandBuffer, commandIndex: NSUInteger) -> *MTLIndirectComputeCommand {
        func: #type (obj: *void, selector: *void, commandIndex: NSUInteger) -> *MTLIndirectComputeCommand #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indirectComputeCommandAtIndex_, commandIndex);
    }

    size :: (self: *MTLIndirectCommandBuffer) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.size);
    }

    gpuResourceID :: (self: *MTLIndirectCommandBuffer) -> MTLResourceID {
        func: #type (obj: *void, selector: *void) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.gpuResourceID);
    }

}

MTLLogContainer :: struct #type_info_no_size_complaint {
}

MTLFunctionLogDebugLocation :: struct #type_info_no_size_complaint {
    functionName :: (self: *MTLFunctionLogDebugLocation) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionName);
    }

    URL :: (self: *MTLFunctionLogDebugLocation) -> *NSURL {
        func: #type (obj: *void, selector: *void) -> *NSURL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.URL);
    }

    line :: (self: *MTLFunctionLogDebugLocation) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.line);
    }

    column :: (self: *MTLFunctionLogDebugLocation) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.column);
    }

}

MTLFunctionLog :: struct #type_info_no_size_complaint {
    type :: (self: *MTLFunctionLog) -> MTLFunctionLogType {
        func: #type (obj: *void, selector: *void) -> MTLFunctionLogType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.type);
    }

    encoderLabel :: (self: *MTLFunctionLog) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.encoderLabel);
    }

    function :: (self: *MTLFunctionLog) -> *MTLFunction {
        func: #type (obj: *void, selector: *void) -> *MTLFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.function);
    }

    debugLocation :: (self: *MTLFunctionLog) -> *MTLFunctionLogDebugLocation {
        func: #type (obj: *void, selector: *void) -> *MTLFunctionLogDebugLocation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.debugLocation);
    }

}

MTLAccelerationStructureCommandEncoder :: struct #type_info_no_size_complaint {
    buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset_ :: (self: *MTLAccelerationStructureCommandEncoder, accelerationStructure: *MTLAccelerationStructure, descriptor: *MTLAccelerationStructureDescriptor, scratchBuffer: *MTLBuffer, scratchBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, accelerationStructure: *MTLAccelerationStructure, descriptor: *MTLAccelerationStructureDescriptor, scratchBuffer: *MTLBuffer, scratchBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset_, accelerationStructure, descriptor, scratchBuffer, scratchBufferOffset);
    }

    refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_ :: (self: *MTLAccelerationStructureCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, descriptor: *MTLAccelerationStructureDescriptor, destinationAccelerationStructure: *MTLAccelerationStructure, scratchBuffer: *MTLBuffer, scratchBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sourceAccelerationStructure: *MTLAccelerationStructure, descriptor: *MTLAccelerationStructureDescriptor, destinationAccelerationStructure: *MTLAccelerationStructure, scratchBuffer: *MTLBuffer, scratchBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_, sourceAccelerationStructure, descriptor, destinationAccelerationStructure, scratchBuffer, scratchBufferOffset);
    }

    refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options_ :: (self: *MTLAccelerationStructureCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, descriptor: *MTLAccelerationStructureDescriptor, destinationAccelerationStructure: *MTLAccelerationStructure, scratchBuffer: *MTLBuffer, scratchBufferOffset: NSUInteger, options: MTLAccelerationStructureRefitOptions) -> void {
        func: #type (obj: *void, selector: *void, sourceAccelerationStructure: *MTLAccelerationStructure, descriptor: *MTLAccelerationStructureDescriptor, destinationAccelerationStructure: *MTLAccelerationStructure, scratchBuffer: *MTLBuffer, scratchBufferOffset: NSUInteger, options: MTLAccelerationStructureRefitOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options_, sourceAccelerationStructure, descriptor, destinationAccelerationStructure, scratchBuffer, scratchBufferOffset, options);
    }

    copyAccelerationStructure_toAccelerationStructure_ :: (self: *MTLAccelerationStructureCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, destinationAccelerationStructure: *MTLAccelerationStructure) -> void {
        func: #type (obj: *void, selector: *void, sourceAccelerationStructure: *MTLAccelerationStructure, destinationAccelerationStructure: *MTLAccelerationStructure) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyAccelerationStructure_toAccelerationStructure_, sourceAccelerationStructure, destinationAccelerationStructure);
    }

    writeCompactedAccelerationStructureSize_toBuffer_offset_ :: (self: *MTLAccelerationStructureCommandEncoder, accelerationStructure: *MTLAccelerationStructure, buffer: *MTLBuffer, offset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, accelerationStructure: *MTLAccelerationStructure, buffer: *MTLBuffer, offset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.writeCompactedAccelerationStructureSize_toBuffer_offset_, accelerationStructure, buffer, offset);
    }

    writeCompactedAccelerationStructureSize_toBuffer_offset_sizeDataType_ :: (self: *MTLAccelerationStructureCommandEncoder, accelerationStructure: *MTLAccelerationStructure, buffer: *MTLBuffer, offset: NSUInteger, sizeDataType: MTLDataType) -> void {
        func: #type (obj: *void, selector: *void, accelerationStructure: *MTLAccelerationStructure, buffer: *MTLBuffer, offset: NSUInteger, sizeDataType: MTLDataType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.writeCompactedAccelerationStructureSize_toBuffer_offset_sizeDataType_, accelerationStructure, buffer, offset, sizeDataType);
    }

    copyAndCompactAccelerationStructure_toAccelerationStructure_ :: (self: *MTLAccelerationStructureCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, destinationAccelerationStructure: *MTLAccelerationStructure) -> void {
        func: #type (obj: *void, selector: *void, sourceAccelerationStructure: *MTLAccelerationStructure, destinationAccelerationStructure: *MTLAccelerationStructure) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyAndCompactAccelerationStructure_toAccelerationStructure_, sourceAccelerationStructure, destinationAccelerationStructure);
    }

    updateFence_ :: (self: *MTLAccelerationStructureCommandEncoder, fence: *MTLFence) -> void {
        func: #type (obj: *void, selector: *void, fence: *MTLFence) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.updateFence_, fence);
    }

    waitForFence_ :: (self: *MTLAccelerationStructureCommandEncoder, fence: *MTLFence) -> void {
        func: #type (obj: *void, selector: *void, fence: *MTLFence) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.waitForFence_, fence);
    }

    useResource_usage_ :: (self: *MTLAccelerationStructureCommandEncoder, resource: *MTLResource, usage: MTLResourceUsage) -> void {
        func: #type (obj: *void, selector: *void, resource: *MTLResource, usage: MTLResourceUsage) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useResource_usage_, resource, usage);
    }

    useResources_count_usage_ :: (self: *MTLAccelerationStructureCommandEncoder, resources: **MTLResource, count: NSUInteger, usage: MTLResourceUsage) -> void {
        func: #type (obj: *void, selector: *void, resources: **MTLResource, count: NSUInteger, usage: MTLResourceUsage) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useResources_count_usage_, resources, count, usage);
    }

    useHeap_ :: (self: *MTLAccelerationStructureCommandEncoder, heap: *MTLHeap) -> void {
        func: #type (obj: *void, selector: *void, heap: *MTLHeap) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useHeap_, heap);
    }

    useHeaps_count_ :: (self: *MTLAccelerationStructureCommandEncoder, heaps: **MTLHeap, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, heaps: **MTLHeap, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useHeaps_count_, heaps, count);
    }

    sampleCountersInBuffer_atSampleIndex_withBarrier_ :: (self: *MTLAccelerationStructureCommandEncoder, sampleBuffer: *MTLCounterSampleBuffer, sampleIndex: NSUInteger, barrier: BOOL) -> void {
        func: #type (obj: *void, selector: *void, sampleBuffer: *MTLCounterSampleBuffer, sampleIndex: NSUInteger, barrier: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleCountersInBuffer_atSampleIndex_withBarrier_, sampleBuffer, sampleIndex, barrier);
    }

}

MTLRasterizationRateMap :: struct #type_info_no_size_complaint {
    copyParameterDataToBuffer_offset_ :: (self: *MTLRasterizationRateMap, buffer: *MTLBuffer, offset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyParameterDataToBuffer_offset_, buffer, offset);
    }

    physicalSizeForLayer_ :: (self: *MTLRasterizationRateMap, layerIndex: NSUInteger) -> MTLSize {
        func: #type (obj: *void, selector: *void, layerIndex: NSUInteger) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.physicalSizeForLayer_, layerIndex);
    }

    mapScreenToPhysicalCoordinates_forLayer_ :: (self: *MTLRasterizationRateMap, screenCoordinates: MTLCoordinate2D, layerIndex: NSUInteger) -> MTLCoordinate2D {
        func: #type (obj: *void, selector: *void, screenCoordinates: MTLCoordinate2D, layerIndex: NSUInteger) -> MTLCoordinate2D #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.mapScreenToPhysicalCoordinates_forLayer_, screenCoordinates, layerIndex);
    }

    mapPhysicalToScreenCoordinates_forLayer_ :: (self: *MTLRasterizationRateMap, physicalCoordinates: MTLCoordinate2D, layerIndex: NSUInteger) -> MTLCoordinate2D {
        func: #type (obj: *void, selector: *void, physicalCoordinates: MTLCoordinate2D, layerIndex: NSUInteger) -> MTLCoordinate2D #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.mapPhysicalToScreenCoordinates_forLayer_, physicalCoordinates, layerIndex);
    }

    device :: (self: *MTLRasterizationRateMap) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

    label :: (self: *MTLRasterizationRateMap) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    screenSize :: (self: *MTLRasterizationRateMap) -> MTLSize {
        func: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.screenSize);
    }

    physicalGranularity :: (self: *MTLRasterizationRateMap) -> MTLSize {
        func: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.physicalGranularity);
    }

    layerCount :: (self: *MTLRasterizationRateMap) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.layerCount);
    }

    parameterBufferSizeAndAlign :: (self: *MTLRasterizationRateMap) -> MTLSizeAndAlign {
        func: #type (obj: *void, selector: *void) -> MTLSizeAndAlign #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.parameterBufferSizeAndAlign);
    }

}

MTLDynamicLibrary :: struct #type_info_no_size_complaint {
    serializeToURL_error_ :: (self: *MTLDynamicLibrary, url: *NSURL, error: **NSError) -> BOOL {
        func: #type (obj: *void, selector: *void, url: *NSURL, error: **NSError) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.serializeToURL_error_, url, error);
    }

    label :: (self: *MTLDynamicLibrary) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLDynamicLibrary, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

    device :: (self: *MTLDynamicLibrary) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

    installName :: (self: *MTLDynamicLibrary) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.installName);
    }

}

MTLLogState :: struct #type_info_no_size_complaint {
    addLogHandler_ :: (self: *MTLLogState, block: *void) -> void {
        func: #type (obj: *void, selector: *void, block: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addLogHandler_, block);
    }

}

MTLBinaryArchive :: struct #type_info_no_size_complaint {
    addComputePipelineFunctionsWithDescriptor_error_ :: (self: *MTLBinaryArchive, descriptor: *MTLComputePipelineDescriptor, error: **NSError) -> BOOL {
        func: #type (obj: *void, selector: *void, descriptor: *MTLComputePipelineDescriptor, error: **NSError) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addComputePipelineFunctionsWithDescriptor_error_, descriptor, error);
    }

    addRenderPipelineFunctionsWithDescriptor_error_ :: (self: *MTLBinaryArchive, descriptor: *MTLRenderPipelineDescriptor, error: **NSError) -> BOOL {
        func: #type (obj: *void, selector: *void, descriptor: *MTLRenderPipelineDescriptor, error: **NSError) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addRenderPipelineFunctionsWithDescriptor_error_, descriptor, error);
    }

    addTileRenderPipelineFunctionsWithDescriptor_error_ :: (self: *MTLBinaryArchive, descriptor: *MTLTileRenderPipelineDescriptor, error: **NSError) -> BOOL {
        func: #type (obj: *void, selector: *void, descriptor: *MTLTileRenderPipelineDescriptor, error: **NSError) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addTileRenderPipelineFunctionsWithDescriptor_error_, descriptor, error);
    }

    addMeshRenderPipelineFunctionsWithDescriptor_error_ :: (self: *MTLBinaryArchive, descriptor: *MTLMeshRenderPipelineDescriptor, error: **NSError) -> BOOL {
        func: #type (obj: *void, selector: *void, descriptor: *MTLMeshRenderPipelineDescriptor, error: **NSError) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addMeshRenderPipelineFunctionsWithDescriptor_error_, descriptor, error);
    }

    addLibraryWithDescriptor_error_ :: (self: *MTLBinaryArchive, descriptor: *MTLStitchedLibraryDescriptor, error: **NSError) -> BOOL {
        func: #type (obj: *void, selector: *void, descriptor: *MTLStitchedLibraryDescriptor, error: **NSError) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addLibraryWithDescriptor_error_, descriptor, error);
    }

    serializeToURL_error_ :: (self: *MTLBinaryArchive, url: *NSURL, error: **NSError) -> BOOL {
        func: #type (obj: *void, selector: *void, url: *NSURL, error: **NSError) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.serializeToURL_error_, url, error);
    }

    addFunctionWithDescriptor_library_error_ :: (self: *MTLBinaryArchive, descriptor: *MTLFunctionDescriptor, library: *MTLLibrary, error: **NSError) -> BOOL {
        func: #type (obj: *void, selector: *void, descriptor: *MTLFunctionDescriptor, library: *MTLLibrary, error: **NSError) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addFunctionWithDescriptor_library_error_, descriptor, library, error);
    }

    label :: (self: *MTLBinaryArchive) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLBinaryArchive, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

    device :: (self: *MTLBinaryArchive) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

}

MTLIntersectionFunctionTable :: struct #type_info_no_size_complaint {
    setBuffer_offset_atIndex_ :: (self: *MTLIntersectionFunctionTable, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBuffer_offset_atIndex_, buffer, offset, index);
    }

    setBuffers_offsets_withRange_ :: (self: *MTLIntersectionFunctionTable, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBuffers_offsets_withRange_, buffers, offsets, range);
    }

    setFunction_atIndex_ :: (self: *MTLIntersectionFunctionTable, function: *MTLFunctionHandle, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, function: *MTLFunctionHandle, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFunction_atIndex_, function, index);
    }

    setFunctions_withRange_ :: (self: *MTLIntersectionFunctionTable, functions: **MTLFunctionHandle, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, functions: **MTLFunctionHandle, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFunctions_withRange_, functions, range);
    }

    setOpaqueTriangleIntersectionFunctionWithSignature_atIndex_ :: (self: *MTLIntersectionFunctionTable, signature: MTLIntersectionFunctionSignature, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, signature: MTLIntersectionFunctionSignature, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOpaqueTriangleIntersectionFunctionWithSignature_atIndex_, signature, index);
    }

    setOpaqueTriangleIntersectionFunctionWithSignature_withRange_ :: (self: *MTLIntersectionFunctionTable, signature: MTLIntersectionFunctionSignature, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, signature: MTLIntersectionFunctionSignature, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOpaqueTriangleIntersectionFunctionWithSignature_withRange_, signature, range);
    }

    setOpaqueCurveIntersectionFunctionWithSignature_atIndex_ :: (self: *MTLIntersectionFunctionTable, signature: MTLIntersectionFunctionSignature, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, signature: MTLIntersectionFunctionSignature, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOpaqueCurveIntersectionFunctionWithSignature_atIndex_, signature, index);
    }

    setOpaqueCurveIntersectionFunctionWithSignature_withRange_ :: (self: *MTLIntersectionFunctionTable, signature: MTLIntersectionFunctionSignature, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, signature: MTLIntersectionFunctionSignature, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOpaqueCurveIntersectionFunctionWithSignature_withRange_, signature, range);
    }

    setVisibleFunctionTable_atBufferIndex_ :: (self: *MTLIntersectionFunctionTable, functionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, functionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVisibleFunctionTable_atBufferIndex_, functionTable, bufferIndex);
    }

    setVisibleFunctionTables_withBufferRange_ :: (self: *MTLIntersectionFunctionTable, functionTables: **MTLVisibleFunctionTable, bufferRange: NSRange) -> void {
        func: #type (obj: *void, selector: *void, functionTables: **MTLVisibleFunctionTable, bufferRange: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVisibleFunctionTables_withBufferRange_, functionTables, bufferRange);
    }

    gpuResourceID :: (self: *MTLIntersectionFunctionTable) -> MTLResourceID {
        func: #type (obj: *void, selector: *void) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.gpuResourceID);
    }

}

MTLFunctionStitchingAttribute :: struct #type_info_no_size_complaint {
}

MTLFunctionStitchingNode :: struct #type_info_no_size_complaint {
}

MTLIOCommandQueue :: struct #type_info_no_size_complaint {
    enqueueBarrier :: (self: *MTLIOCommandQueue) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.enqueueBarrier);
    }

    commandBuffer :: (self: *MTLIOCommandQueue) -> *MTLIOCommandBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLIOCommandBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.commandBuffer);
    }

    commandBufferWithUnretainedReferences :: (self: *MTLIOCommandQueue) -> *MTLIOCommandBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLIOCommandBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.commandBufferWithUnretainedReferences);
    }

    label :: (self: *MTLIOCommandQueue) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLIOCommandQueue, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

}

MTLIOScratchBuffer :: struct #type_info_no_size_complaint {
    buffer :: (self: *MTLIOScratchBuffer) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.buffer);
    }

}

MTLIOScratchBufferAllocator :: struct #type_info_no_size_complaint {
    newScratchBufferWithMinimumSize_ :: (self: *MTLIOScratchBufferAllocator, minimumSize: NSUInteger) -> *MTLIOScratchBuffer {
        func: #type (obj: *void, selector: *void, minimumSize: NSUInteger) -> *MTLIOScratchBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newScratchBufferWithMinimumSize_, minimumSize);
    }

}

MTLIOFileHandle :: struct #type_info_no_size_complaint {
    label :: (self: *MTLIOFileHandle) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLIOFileHandle, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

}

MTLIOCommandBuffer :: struct #type_info_no_size_complaint {
    addCompletedHandler_ :: (self: *MTLIOCommandBuffer, block: MTLIOCommandBufferHandler) -> void {
        func: #type (obj: *void, selector: *void, block: MTLIOCommandBufferHandler) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addCompletedHandler_, block);
    }

    loadBytes_size_sourceHandle_sourceHandleOffset_ :: (self: *MTLIOCommandBuffer, pointer: *void, size: NSUInteger, sourceHandle: *MTLIOFileHandle, sourceHandleOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, pointer: *void, size: NSUInteger, sourceHandle: *MTLIOFileHandle, sourceHandleOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.loadBytes_size_sourceHandle_sourceHandleOffset_, pointer, size, sourceHandle, sourceHandleOffset);
    }

    loadBuffer_offset_size_sourceHandle_sourceHandleOffset_ :: (self: *MTLIOCommandBuffer, buffer: *MTLBuffer, offset: NSUInteger, size: NSUInteger, sourceHandle: *MTLIOFileHandle, sourceHandleOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger, size: NSUInteger, sourceHandle: *MTLIOFileHandle, sourceHandleOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.loadBuffer_offset_size_sourceHandle_sourceHandleOffset_, buffer, offset, size, sourceHandle, sourceHandleOffset);
    }

    loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset_ :: (self: *MTLIOCommandBuffer, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger, size: MTLSize, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, destinationOrigin: MTLOrigin, sourceHandle: *MTLIOFileHandle, sourceHandleOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger, size: MTLSize, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, destinationOrigin: MTLOrigin, sourceHandle: *MTLIOFileHandle, sourceHandleOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset_, texture, slice, level, size, sourceBytesPerRow, sourceBytesPerImage, destinationOrigin, sourceHandle, sourceHandleOffset);
    }

    copyStatusToBuffer_offset_ :: (self: *MTLIOCommandBuffer, buffer: *MTLBuffer, offset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyStatusToBuffer_offset_, buffer, offset);
    }

    commit :: (self: *MTLIOCommandBuffer) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.commit);
    }

    waitUntilCompleted :: (self: *MTLIOCommandBuffer) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.waitUntilCompleted);
    }

    tryCancel :: (self: *MTLIOCommandBuffer) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tryCancel);
    }

    addBarrier :: (self: *MTLIOCommandBuffer) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addBarrier);
    }

    pushDebugGroup_ :: (self: *MTLIOCommandBuffer, str: *NSString) -> void {
        func: #type (obj: *void, selector: *void, str: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pushDebugGroup_, str);
    }

    popDebugGroup :: (self: *MTLIOCommandBuffer) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.popDebugGroup);
    }

    enqueue :: (self: *MTLIOCommandBuffer) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.enqueue);
    }

    waitForEvent_value_ :: (self: *MTLIOCommandBuffer, event: *MTLSharedEvent, value: u64) -> void {
        func: #type (obj: *void, selector: *void, event: *MTLSharedEvent, value: u64) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.waitForEvent_value_, event, value);
    }

    signalEvent_value_ :: (self: *MTLIOCommandBuffer, event: *MTLSharedEvent, value: u64) -> void {
        func: #type (obj: *void, selector: *void, event: *MTLSharedEvent, value: u64) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.signalEvent_value_, event, value);
    }

    label :: (self: *MTLIOCommandBuffer) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTLIOCommandBuffer, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

    status :: (self: *MTLIOCommandBuffer) -> MTLIOStatus {
        func: #type (obj: *void, selector: *void) -> MTLIOStatus #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.status);
    }

    error :: (self: *MTLIOCommandBuffer) -> *NSError {
        func: #type (obj: *void, selector: *void) -> *NSError #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.error);
    }

}

MTLResidencySet :: struct #type_info_no_size_complaint {
    requestResidency :: (self: *MTLResidencySet) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.requestResidency);
    }

    endResidency :: (self: *MTLResidencySet) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.endResidency);
    }

    addAllocation_ :: (self: *MTLResidencySet, allocation: *MTLAllocation) -> void {
        func: #type (obj: *void, selector: *void, allocation: *MTLAllocation) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addAllocation_, allocation);
    }

    addAllocations_count_ :: (self: *MTLResidencySet, allocations: **MTLAllocation, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, allocations: **MTLAllocation, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addAllocations_count_, allocations, count);
    }

    removeAllocation_ :: (self: *MTLResidencySet, allocation: *MTLAllocation) -> void {
        func: #type (obj: *void, selector: *void, allocation: *MTLAllocation) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.removeAllocation_, allocation);
    }

    removeAllocations_count_ :: (self: *MTLResidencySet, allocations: **MTLAllocation, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, allocations: **MTLAllocation, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.removeAllocations_count_, allocations, count);
    }

    removeAllAllocations :: (self: *MTLResidencySet) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.removeAllAllocations);
    }

    containsAllocation_ :: (self: *MTLResidencySet, anAllocation: *MTLAllocation) -> BOOL {
        func: #type (obj: *void, selector: *void, anAllocation: *MTLAllocation) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.containsAllocation_, anAllocation);
    }

    commit :: (self: *MTLResidencySet) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.commit);
    }

    device :: (self: *MTLResidencySet) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

    label :: (self: *MTLResidencySet) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    allocatedSize :: (self: *MTLResidencySet) -> u64 {
        func: #type (obj: *void, selector: *void) -> u64 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.allocatedSize);
    }

    allAllocations :: (self: *MTLResidencySet) -> *NSArray(*MTLAllocation) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLAllocation) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.allAllocations);
    }

    allocationCount :: (self: *MTLResidencySet) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.allocationCount);
    }

}

MTLResourceViewPool :: struct #type_info_no_size_complaint {
    copyResourceViewsFromPool_sourceRange_destinationIndex_ :: (self: *MTLResourceViewPool, sourcePool: *MTLResourceViewPool, sourceRange: NSRange, destinationIndex: NSUInteger) -> MTLResourceID {
        func: #type (obj: *void, selector: *void, sourcePool: *MTLResourceViewPool, sourceRange: NSRange, destinationIndex: NSUInteger) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyResourceViewsFromPool_sourceRange_destinationIndex_, sourcePool, sourceRange, destinationIndex);
    }

    baseResourceID :: (self: *MTLResourceViewPool) -> MTLResourceID {
        func: #type (obj: *void, selector: *void) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.baseResourceID);
    }

    resourceViewCount :: (self: *MTLResourceViewPool) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resourceViewCount);
    }

    device :: (self: *MTLResourceViewPool) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

    label :: (self: *MTLResourceViewPool) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

}

MTLTextureViewPool :: struct #type_info_no_size_complaint {
    setTextureView_atIndex_ :: (self: *MTLTextureViewPool, texture: *MTLTexture, index: NSUInteger) -> MTLResourceID {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, index: NSUInteger) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTextureView_atIndex_, texture, index);
    }

    setTextureView_descriptor_atIndex_ :: (self: *MTLTextureViewPool, texture: *MTLTexture, descriptor: *MTLTextureViewDescriptor, index: NSUInteger) -> MTLResourceID {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, descriptor: *MTLTextureViewDescriptor, index: NSUInteger) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTextureView_descriptor_atIndex_, texture, descriptor, index);
    }

    setTextureViewFromBuffer_descriptor_offset_bytesPerRow_atIndex_ :: (self: *MTLTextureViewPool, buffer: *MTLBuffer, descriptor: *MTLTextureDescriptor, offset: NSUInteger, bytesPerRow: NSUInteger, index: NSUInteger) -> MTLResourceID {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, descriptor: *MTLTextureDescriptor, offset: NSUInteger, bytesPerRow: NSUInteger, index: NSUInteger) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTextureViewFromBuffer_descriptor_offset_bytesPerRow_atIndex_, buffer, descriptor, offset, bytesPerRow, index);
    }

}

MTL4ArgumentTable :: struct #type_info_no_size_complaint {
    setAddress_atIndex_ :: (self: *MTL4ArgumentTable, gpuAddress: MTLGPUAddress, bindingIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, gpuAddress: MTLGPUAddress, bindingIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAddress_atIndex_, gpuAddress, bindingIndex);
    }

    setAddress_attributeStride_atIndex_ :: (self: *MTL4ArgumentTable, gpuAddress: MTLGPUAddress, stride: NSUInteger, bindingIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, gpuAddress: MTLGPUAddress, stride: NSUInteger, bindingIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAddress_attributeStride_atIndex_, gpuAddress, stride, bindingIndex);
    }

    setResource_atBufferIndex_ :: (self: *MTL4ArgumentTable, resourceID: MTLResourceID, bindingIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, resourceID: MTLResourceID, bindingIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setResource_atBufferIndex_, resourceID, bindingIndex);
    }

    setTexture_atIndex_ :: (self: *MTL4ArgumentTable, resourceID: MTLResourceID, bindingIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, resourceID: MTLResourceID, bindingIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTexture_atIndex_, resourceID, bindingIndex);
    }

    setSamplerState_atIndex_ :: (self: *MTL4ArgumentTable, resourceID: MTLResourceID, bindingIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, resourceID: MTLResourceID, bindingIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSamplerState_atIndex_, resourceID, bindingIndex);
    }

    device :: (self: *MTL4ArgumentTable) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

    label :: (self: *MTL4ArgumentTable) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

}

MTL4BinaryFunction :: struct #type_info_no_size_complaint {
    name :: (self: *MTL4BinaryFunction) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

    functionType :: (self: *MTL4BinaryFunction) -> MTLFunctionType {
        func: #type (obj: *void, selector: *void) -> MTLFunctionType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionType);
    }

}

MTL4CommandAllocator :: struct #type_info_no_size_complaint {
    allocatedSize :: (self: *MTL4CommandAllocator) -> u64 {
        func: #type (obj: *void, selector: *void) -> u64 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.allocatedSize);
    }

    reset :: (self: *MTL4CommandAllocator) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

    device :: (self: *MTL4CommandAllocator) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

    label :: (self: *MTL4CommandAllocator) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

}

MTL4ComputeCommandEncoder :: struct #type_info_no_size_complaint {
    stages :: (self: *MTL4ComputeCommandEncoder) -> MTLStages {
        func: #type (obj: *void, selector: *void) -> MTLStages #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stages);
    }

    setComputePipelineState_ :: (self: *MTL4ComputeCommandEncoder, state: *MTLComputePipelineState) -> void {
        func: #type (obj: *void, selector: *void, state: *MTLComputePipelineState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setComputePipelineState_, state);
    }

    setThreadgroupMemoryLength_atIndex_ :: (self: *MTL4ComputeCommandEncoder, length: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, length: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setThreadgroupMemoryLength_atIndex_, length, index);
    }

    setImageblockWidth_height_ :: (self: *MTL4ComputeCommandEncoder, width: NSUInteger, height: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, width: NSUInteger, height: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setImageblockWidth_height_, width, height);
    }

    dispatchThreads_threadsPerThreadgroup_ :: (self: *MTL4ComputeCommandEncoder, threadsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, threadsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dispatchThreads_threadsPerThreadgroup_, threadsPerGrid, threadsPerThreadgroup);
    }

    dispatchThreadgroups_threadsPerThreadgroup_ :: (self: *MTL4ComputeCommandEncoder, threadgroupsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, threadgroupsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dispatchThreadgroups_threadsPerThreadgroup_, threadgroupsPerGrid, threadsPerThreadgroup);
    }

    dispatchThreadgroupsWithIndirectBuffer_threadsPerThreadgroup_ :: (self: *MTL4ComputeCommandEncoder, indirectBuffer: MTLGPUAddress, threadsPerThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, indirectBuffer: MTLGPUAddress, threadsPerThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dispatchThreadgroupsWithIndirectBuffer_threadsPerThreadgroup_, indirectBuffer, threadsPerThreadgroup);
    }

    dispatchThreadsWithIndirectBuffer_ :: (self: *MTL4ComputeCommandEncoder, indirectBuffer: MTLGPUAddress) -> void {
        func: #type (obj: *void, selector: *void, indirectBuffer: MTLGPUAddress) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dispatchThreadsWithIndirectBuffer_, indirectBuffer);
    }

    executeCommandsInBuffer_withRange_ :: (self: *MTL4ComputeCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, executionRange: NSRange) -> void {
        func: #type (obj: *void, selector: *void, indirectCommandBuffer: *MTLIndirectCommandBuffer, executionRange: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.executeCommandsInBuffer_withRange_, indirectCommandBuffer, executionRange);
    }

    executeCommandsInBuffer_indirectBuffer_ :: (self: *MTL4ComputeCommandEncoder, indirectCommandbuffer: *MTLIndirectCommandBuffer, indirectRangeBuffer: MTLGPUAddress) -> void {
        func: #type (obj: *void, selector: *void, indirectCommandbuffer: *MTLIndirectCommandBuffer, indirectRangeBuffer: MTLGPUAddress) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.executeCommandsInBuffer_indirectBuffer_, indirectCommandbuffer, indirectRangeBuffer);
    }

    copyFromTexture_toTexture_ :: (self: *MTL4ComputeCommandEncoder, sourceTexture: *MTLTexture, destinationTexture: *MTLTexture) -> void {
        func: #type (obj: *void, selector: *void, sourceTexture: *MTLTexture, destinationTexture: *MTLTexture) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromTexture_toTexture_, sourceTexture, destinationTexture);
    }

    copyFromTexture_sourceSlice_sourceLevel_toTexture_destinationSlice_destinationLevel_sliceCount_levelCount_ :: (self: *MTL4ComputeCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, sliceCount: NSUInteger, levelCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, sliceCount: NSUInteger, levelCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromTexture_sourceSlice_sourceLevel_toTexture_destinationSlice_destinationLevel_sliceCount_levelCount_, sourceTexture, sourceSlice, sourceLevel, destinationTexture, destinationSlice, destinationLevel, sliceCount, levelCount);
    }

    copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_ :: (self: *MTL4ComputeCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> void {
        func: #type (obj: *void, selector: *void, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_, sourceTexture, sourceSlice, sourceLevel, sourceOrigin, sourceSize, destinationTexture, destinationSlice, destinationLevel, destinationOrigin);
    }

    copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_ :: (self: *MTL4ComputeCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, destinationBytesPerRow: NSUInteger, destinationBytesPerImage: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, destinationBytesPerRow: NSUInteger, destinationBytesPerImage: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_, sourceTexture, sourceSlice, sourceLevel, sourceOrigin, sourceSize, destinationBuffer, destinationOffset, destinationBytesPerRow, destinationBytesPerImage);
    }

    copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_options_ :: (self: *MTL4ComputeCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, destinationBytesPerRow: NSUInteger, destinationBytesPerImage: NSUInteger, options: MTLBlitOption) -> void {
        func: #type (obj: *void, selector: *void, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, destinationBytesPerRow: NSUInteger, destinationBytesPerImage: NSUInteger, options: MTLBlitOption) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_options_, sourceTexture, sourceSlice, sourceLevel, sourceOrigin, sourceSize, destinationBuffer, destinationOffset, destinationBytesPerRow, destinationBytesPerImage, options);
    }

    copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_ :: (self: *MTL4ComputeCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, size: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, size: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_, sourceBuffer, sourceOffset, destinationBuffer, destinationOffset, size);
    }

    copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_ :: (self: *MTL4ComputeCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> void {
        func: #type (obj: *void, selector: *void, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_, sourceBuffer, sourceOffset, sourceBytesPerRow, sourceBytesPerImage, sourceSize, destinationTexture, destinationSlice, destinationLevel, destinationOrigin);
    }

    copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_options_ :: (self: *MTL4ComputeCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin, options: MTLBlitOption) -> void {
        func: #type (obj: *void, selector: *void, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin, options: MTLBlitOption) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_options_, sourceBuffer, sourceOffset, sourceBytesPerRow, sourceBytesPerImage, sourceSize, destinationTexture, destinationSlice, destinationLevel, destinationOrigin, options);
    }

    copyFromTensor_sourceOrigin_sourceDimensions_toTensor_destinationOrigin_destinationDimensions_ :: (self: *MTL4ComputeCommandEncoder, sourceTensor: *MTLTensor, sourceOrigin: *MTLTensorExtents, sourceDimensions: *MTLTensorExtents, destinationTensor: *MTLTensor, destinationOrigin: *MTLTensorExtents, destinationDimensions: *MTLTensorExtents) -> void {
        func: #type (obj: *void, selector: *void, sourceTensor: *MTLTensor, sourceOrigin: *MTLTensorExtents, sourceDimensions: *MTLTensorExtents, destinationTensor: *MTLTensor, destinationOrigin: *MTLTensorExtents, destinationDimensions: *MTLTensorExtents) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromTensor_sourceOrigin_sourceDimensions_toTensor_destinationOrigin_destinationDimensions_, sourceTensor, sourceOrigin, sourceDimensions, destinationTensor, destinationOrigin, destinationDimensions);
    }

    generateMipmapsForTexture_ :: (self: *MTL4ComputeCommandEncoder, texture: *MTLTexture) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.generateMipmapsForTexture_, texture);
    }

    fillBuffer_range_value_ :: (self: *MTL4ComputeCommandEncoder, buffer: *MTLBuffer, range: NSRange, value: u8) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, range: NSRange, value: u8) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fillBuffer_range_value_, buffer, range, value);
    }

    optimizeContentsForGPUAccess_ :: (self: *MTL4ComputeCommandEncoder, texture: *MTLTexture) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.optimizeContentsForGPUAccess_, texture);
    }

    optimizeContentsForGPUAccess_slice_level_ :: (self: *MTL4ComputeCommandEncoder, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.optimizeContentsForGPUAccess_slice_level_, texture, slice, level);
    }

    optimizeContentsForCPUAccess_ :: (self: *MTL4ComputeCommandEncoder, texture: *MTLTexture) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.optimizeContentsForCPUAccess_, texture);
    }

    optimizeContentsForCPUAccess_slice_level_ :: (self: *MTL4ComputeCommandEncoder, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.optimizeContentsForCPUAccess_slice_level_, texture, slice, level);
    }

    resetCommandsInBuffer_withRange_ :: (self: *MTL4ComputeCommandEncoder, buffer: *MTLIndirectCommandBuffer, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLIndirectCommandBuffer, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resetCommandsInBuffer_withRange_, buffer, range);
    }

    copyIndirectCommandBuffer_sourceRange_destination_destinationIndex_ :: (self: *MTL4ComputeCommandEncoder, source: *MTLIndirectCommandBuffer, sourceRange: NSRange, destination: *MTLIndirectCommandBuffer, destinationIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, source: *MTLIndirectCommandBuffer, sourceRange: NSRange, destination: *MTLIndirectCommandBuffer, destinationIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyIndirectCommandBuffer_sourceRange_destination_destinationIndex_, source, sourceRange, destination, destinationIndex);
    }

    optimizeIndirectCommandBuffer_withRange_ :: (self: *MTL4ComputeCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, indirectCommandBuffer: *MTLIndirectCommandBuffer, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.optimizeIndirectCommandBuffer_withRange_, indirectCommandBuffer, range);
    }

    setArgumentTable_ :: (self: *MTL4ComputeCommandEncoder, argumentTable: *MTL4ArgumentTable) -> void {
        func: #type (obj: *void, selector: *void, argumentTable: *MTL4ArgumentTable) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setArgumentTable_, argumentTable);
    }

    buildAccelerationStructure_descriptor_scratchBuffer_ :: (self: *MTL4ComputeCommandEncoder, accelerationStructure: *MTLAccelerationStructure, descriptor: *MTL4AccelerationStructureDescriptor, scratchBuffer: MTL4BufferRange) -> void {
        func: #type (obj: *void, selector: *void, accelerationStructure: *MTLAccelerationStructure, descriptor: *MTL4AccelerationStructureDescriptor, scratchBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.buildAccelerationStructure_descriptor_scratchBuffer_, accelerationStructure, descriptor, scratchBuffer);
    }

    refitAccelerationStructure_descriptor_destination_scratchBuffer_ :: (self: *MTL4ComputeCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, descriptor: *MTL4AccelerationStructureDescriptor, destinationAccelerationStructure: *MTLAccelerationStructure, scratchBuffer: MTL4BufferRange) -> void {
        func: #type (obj: *void, selector: *void, sourceAccelerationStructure: *MTLAccelerationStructure, descriptor: *MTL4AccelerationStructureDescriptor, destinationAccelerationStructure: *MTLAccelerationStructure, scratchBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.refitAccelerationStructure_descriptor_destination_scratchBuffer_, sourceAccelerationStructure, descriptor, destinationAccelerationStructure, scratchBuffer);
    }

    refitAccelerationStructure_descriptor_destination_scratchBuffer_options_ :: (self: *MTL4ComputeCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, descriptor: *MTL4AccelerationStructureDescriptor, destinationAccelerationStructure: *MTLAccelerationStructure, scratchBuffer: MTL4BufferRange, options: MTLAccelerationStructureRefitOptions) -> void {
        func: #type (obj: *void, selector: *void, sourceAccelerationStructure: *MTLAccelerationStructure, descriptor: *MTL4AccelerationStructureDescriptor, destinationAccelerationStructure: *MTLAccelerationStructure, scratchBuffer: MTL4BufferRange, options: MTLAccelerationStructureRefitOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.refitAccelerationStructure_descriptor_destination_scratchBuffer_options_, sourceAccelerationStructure, descriptor, destinationAccelerationStructure, scratchBuffer, options);
    }

    copyAccelerationStructure_toAccelerationStructure_ :: (self: *MTL4ComputeCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, destinationAccelerationStructure: *MTLAccelerationStructure) -> void {
        func: #type (obj: *void, selector: *void, sourceAccelerationStructure: *MTLAccelerationStructure, destinationAccelerationStructure: *MTLAccelerationStructure) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyAccelerationStructure_toAccelerationStructure_, sourceAccelerationStructure, destinationAccelerationStructure);
    }

    writeCompactedAccelerationStructureSize_toBuffer_ :: (self: *MTL4ComputeCommandEncoder, accelerationStructure: *MTLAccelerationStructure, buffer: MTL4BufferRange) -> void {
        func: #type (obj: *void, selector: *void, accelerationStructure: *MTLAccelerationStructure, buffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.writeCompactedAccelerationStructureSize_toBuffer_, accelerationStructure, buffer);
    }

    copyAndCompactAccelerationStructure_toAccelerationStructure_ :: (self: *MTL4ComputeCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, destinationAccelerationStructure: *MTLAccelerationStructure) -> void {
        func: #type (obj: *void, selector: *void, sourceAccelerationStructure: *MTLAccelerationStructure, destinationAccelerationStructure: *MTLAccelerationStructure) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyAndCompactAccelerationStructure_toAccelerationStructure_, sourceAccelerationStructure, destinationAccelerationStructure);
    }

    writeTimestampWithGranularity_intoHeap_atIndex_ :: (self: *MTL4ComputeCommandEncoder, granularity: MTL4TimestampGranularity, counterHeap: *MTL4CounterHeap, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, granularity: MTL4TimestampGranularity, counterHeap: *MTL4CounterHeap, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.writeTimestampWithGranularity_intoHeap_atIndex_, granularity, counterHeap, index);
    }

}

MTL4MachineLearningCommandEncoder :: struct #type_info_no_size_complaint {
    setPipelineState_ :: (self: *MTL4MachineLearningCommandEncoder, pipelineState: *MTL4MachineLearningPipelineState) -> void {
        func: #type (obj: *void, selector: *void, pipelineState: *MTL4MachineLearningPipelineState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPipelineState_, pipelineState);
    }

    setArgumentTable_ :: (self: *MTL4MachineLearningCommandEncoder, argumentTable: *MTL4ArgumentTable) -> void {
        func: #type (obj: *void, selector: *void, argumentTable: *MTL4ArgumentTable) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setArgumentTable_, argumentTable);
    }

    dispatchNetworkWithIntermediatesHeap_ :: (self: *MTL4MachineLearningCommandEncoder, heap: *MTLHeap) -> void {
        func: #type (obj: *void, selector: *void, heap: *MTLHeap) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dispatchNetworkWithIntermediatesHeap_, heap);
    }

}

MTL4MachineLearningPipelineState :: struct #type_info_no_size_complaint {
    label :: (self: *MTL4MachineLearningPipelineState) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    device :: (self: *MTL4MachineLearningPipelineState) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

    reflection :: (self: *MTL4MachineLearningPipelineState) -> *MTL4MachineLearningPipelineReflection {
        func: #type (obj: *void, selector: *void) -> *MTL4MachineLearningPipelineReflection #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reflection);
    }

    intermediatesHeapSize :: (self: *MTL4MachineLearningPipelineState) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.intermediatesHeapSize);
    }

}

MTL4PipelineDataSetSerializer :: struct #type_info_no_size_complaint {
    serializeAsArchiveAndFlushToURL_error_ :: (self: *MTL4PipelineDataSetSerializer, url: *NSURL, error: **NSError) -> BOOL {
        func: #type (obj: *void, selector: *void, url: *NSURL, error: **NSError) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.serializeAsArchiveAndFlushToURL_error_, url, error);
    }

    serializeAsPipelinesScriptWithError_ :: (self: *MTL4PipelineDataSetSerializer, error: **NSError) -> *NSData {
        func: #type (obj: *void, selector: *void, error: **NSError) -> *NSData #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.serializeAsPipelinesScriptWithError_, error);
    }

}

MTL4Archive :: struct #type_info_no_size_complaint {
    newComputePipelineStateWithDescriptor_error_ :: (self: *MTL4Archive, descriptor: *MTL4ComputePipelineDescriptor, error: **NSError) -> *MTLComputePipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4ComputePipelineDescriptor, error: **NSError) -> *MTLComputePipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newComputePipelineStateWithDescriptor_error_, descriptor, error);
    }

    newComputePipelineStateWithDescriptor_dynamicLinkingDescriptor_error_ :: (self: *MTL4Archive, descriptor: *MTL4ComputePipelineDescriptor, dynamicLinkingDescriptor: *MTL4PipelineStageDynamicLinkingDescriptor, error: **NSError) -> *MTLComputePipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4ComputePipelineDescriptor, dynamicLinkingDescriptor: *MTL4PipelineStageDynamicLinkingDescriptor, error: **NSError) -> *MTLComputePipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newComputePipelineStateWithDescriptor_dynamicLinkingDescriptor_error_, descriptor, dynamicLinkingDescriptor, error);
    }

    newRenderPipelineStateWithDescriptor_error_ :: (self: *MTL4Archive, descriptor: *MTL4PipelineDescriptor, error: **NSError) -> *MTLRenderPipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4PipelineDescriptor, error: **NSError) -> *MTLRenderPipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithDescriptor_error_, descriptor, error);
    }

    newRenderPipelineStateWithDescriptor_dynamicLinkingDescriptor_error_ :: (self: *MTL4Archive, descriptor: *MTL4PipelineDescriptor, dynamicLinkingDescriptor: *MTL4RenderPipelineDynamicLinkingDescriptor, error: **NSError) -> *MTLRenderPipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4PipelineDescriptor, dynamicLinkingDescriptor: *MTL4RenderPipelineDynamicLinkingDescriptor, error: **NSError) -> *MTLRenderPipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithDescriptor_dynamicLinkingDescriptor_error_, descriptor, dynamicLinkingDescriptor, error);
    }

    newBinaryFunctionWithDescriptor_error_ :: (self: *MTL4Archive, descriptor: *MTL4BinaryFunctionDescriptor, error: **NSError) -> *MTL4BinaryFunction {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4BinaryFunctionDescriptor, error: **NSError) -> *MTL4BinaryFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newBinaryFunctionWithDescriptor_error_, descriptor, error);
    }

    label :: (self: *MTL4Archive) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

    setLabel_ :: (self: *MTL4Archive, label: *NSString) -> void {
        func: #type (obj: *void, selector: *void, label: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setLabel_, label);
    }

}

CAMetalDrawable :: struct #type_info_no_size_complaint {
    texture :: (self: *CAMetalDrawable) -> *MTLTexture {
        func: #type (obj: *void, selector: *void) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.texture);
    }

    layer :: (self: *CAMetalDrawable) -> *CAMetalLayer {
        func: #type (obj: *void, selector: *void) -> *CAMetalLayer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.layer);
    }

}

