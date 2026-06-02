/*!
 @protocol MTLCommandEncoder
 @abstract MTLCommandEncoder is the common interface for objects that write commands into MTLCommandBuffers.
 */
MTLCommandEncoder :: struct #type_info_no_size_complaint {
/*!
 @method endEncoding
 @abstract Declare that all command generation from this encoder is complete, and detach from the MTLCommandBuffer.
 */
    endEncoding :: (self: *MTLCommandEncoder) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.endEncoding);
    }

/// Encodes a consumer barrier on work you commit to the same command queue.
///
/// Encode a barrier that guarantees that any subsequent work you encode in the current command encoder that corresponds
/// to the `beforeStages` stages doesn't proceed until Metal completes all work prior to the current command encoder
/// corresponding to the `afterQueueStages` stages, completes.
///
/// Metal can reorder the exact point where it applies the barrier, so use this method for synchronizing between different passes.
///
/// If you need to synchronize work within a pass that you encode with an instance of a subclass of ``MTLCommandEncoder``,
/// use memory barriers instead. For subclasses of ``MTL4CommandEncoder``, use encoder barriers.
///
/// You can specify `afterQueueStages` and `beforeStages` that contain ``MTLStages`` unrelated to the current command
/// encoder.
///
/// - Parameters:
///   - afterQueueStages: ``MTLStages`` mask that represents the stages of work to wait for.
///                        This argument applies to work corresponding to these stages you
///                        encode in prior command encoders, and not for the current encoder.
///   - beforeStages:     ``MTLStages`` mask that represents the stages of work that wait.
///                        This argument applies to work you encode in the current command encoder.
    barrierAfterQueueStages_beforeStages_ :: (self: *MTLCommandEncoder, afterQueueStages: MTLStages, beforeStages: MTLStages) -> void {
        func: #type (obj: *void, selector: *void, afterQueueStages: MTLStages, beforeStages: MTLStages) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.barrierAfterQueueStages_beforeStages_, afterQueueStages, beforeStages);
    }

/*!
 @method insertDebugSignpost:
 @abstract Inserts a debug string into the command buffer.  This does not change any API behavior, but can be useful when debugging.
 */
    insertDebugSignpost_ :: (self: *MTLCommandEncoder, str: *NSString) -> void {
        func: #type (obj: *void, selector: *void, str: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.insertDebugSignpost_, str);
    }

/*!
 @method pushDebugGroup:
 @abstract Push a new named string onto a stack of string labels.
 */
    pushDebugGroup_ :: (self: *MTLCommandEncoder, str: *NSString) -> void {
        func: #type (obj: *void, selector: *void, str: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pushDebugGroup_, str);
    }

/*!
 @method popDebugGroup
 @abstract Pop the latest named string off of the stack.
*/
    popDebugGroup :: (self: *MTLCommandEncoder) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.popDebugGroup);
    }

/*!
 @property device
 @abstract The device this resource was created against.
 */
    device :: (self: *MTLCommandEncoder) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

/*!
 @property label
 @abstract A string to help identify this object.
 */
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

/// Base class for Metal allocations.
///
/// This protocol provides a common interface for adding Metal resources to ``MTLResidencySet`` instances. Call
/// ``MTLResidencySet/addAllocation:`` to add a Metal resource allocation to a residency set.
///
/// <doc:simplifying-gpu-resource-management-with-residency-sets.md>
MTLAllocation :: struct #type_info_no_size_complaint {
    allocatedSize :: (self: *MTLAllocation) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.allocatedSize);
    }

}

/*!
 @protocol MTLResource
 @abstract Common APIs available for MTLBuffer and MTLTexture instances
 */
MTLResource :: struct #type_info_no_size_complaint {
/*!
 @method setPurgeableState
 @abstract Set (or query) the purgeability state of a resource
 @discussion Synchronously set the purgeability state of a resource and return what the prior (or current) state is.
 FIXME: If the device is keeping a cached copy of the resource, both the shared copy and cached copy are made purgeable.  Any access to the resource by either the CPU or device will be undefined.
 */
    setPurgeableState_ :: (self: *MTLResource, state: MTLPurgeableState) -> MTLPurgeableState {
        func: #type (obj: *void, selector: *void, state: MTLPurgeableState) -> MTLPurgeableState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPurgeableState_, state);
    }

/*!
 @method makeAliasable
 @abstract Allow future heap sub-allocations to alias against this resource's memory.
 @discussion It is illegal to call this method on a non heap-based resource. 
 It is also illegal to call this method on texture views created from heap-based textures.
 The debug layer will raise an exception. Calling this method on textures sub-allocated
 from Buffers backed by heap memory has no effect.
 Once a resource is made aliasable, the decision cannot be reverted.
 */
    makeAliasable :: (self: *MTLResource) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.makeAliasable);
    }

/*!
 @method isAliasable
 @abstract Returns whether future heap sub-allocations may alias against this resource's memory.
 @return YES if <st>makeAliasable</st> was previously successfully called on this resource. NO otherwise.
 If resource is sub-allocated from other resource created on the heap, isAliasable returns 
 aliasing state of that base resource. Also returns NO when storage mode is memoryless.
 */
    isAliasable :: (self: *MTLResource) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isAliasable);
    }

/*!
 @method setOwnerWithIdentity:
 @abstract Assigns ownership of the resource's underlying memory to another task for the purposes of VM accounting.
*/
    setOwnerWithIdentity_ :: (self: *MTLResource, task_id_token: u32) -> s32 {
        func: #type (obj: *void, selector: *void, task_id_token: u32) -> s32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOwnerWithIdentity_, task_id_token);
    }

/*!
 @property label
 @abstract A string to help identify this object.
 */
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

/*!
 @property device
 @abstract The device this resource was created against.  This resource can only be used with this device.
 */
    device :: (self: *MTLResource) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

/*!
 @property cpuCacheMode
 @abstract The cache mode used for the CPU mapping for this resource
 */
    cpuCacheMode :: (self: *MTLResource) -> MTLCPUCacheMode {
        func: #type (obj: *void, selector: *void) -> MTLCPUCacheMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.cpuCacheMode);
    }

/*!
 @property storageMode
 @abstract The resource storage mode used for the CPU mapping for this resource
 */
    storageMode :: (self: *MTLResource) -> MTLStorageMode {
        func: #type (obj: *void, selector: *void) -> MTLStorageMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.storageMode);
    }

/*!
 @property hazardTrackingMode
 @abstract Whether or not the resource is hazard tracked.
 @discussion This value can be either MTLHazardTrackingModeUntracked or MTLHazardTrackingModeTracked.
 Resources created from heaps are by default untracked, whereas resources created from the device are by default tracked.
 */
    hazardTrackingMode :: (self: *MTLResource) -> MTLHazardTrackingMode {
        func: #type (obj: *void, selector: *void) -> MTLHazardTrackingMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.hazardTrackingMode);
    }

/*!
 @property resourceOptions
 @abstract A packed tuple of the storageMode, cpuCacheMode and hazardTrackingMode properties.
 */
    resourceOptions :: (self: *MTLResource) -> MTLResourceOptions {
        func: #type (obj: *void, selector: *void) -> MTLResourceOptions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resourceOptions);
    }

/*!
 @property heap
 @abstract The heap from which this resouce was created.
 @discussion Nil when this resource is not backed by a heap.
 */
    heap :: (self: *MTLResource) -> *MTLHeap {
        func: #type (obj: *void, selector: *void) -> *MTLHeap #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.heap);
    }

/*!
 @property heapOffset
 @abstract The offset inside the heap at which this resource was created.
 @discussion Zero when this resource was not created on a heap with MTLHeapTypePlacement.
 */
    heapOffset :: (self: *MTLResource) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.heapOffset);
    }

/*!
 @property allocatedSize
 @abstract The size in bytes occupied by this resource
*/
    allocatedSize :: (self: *MTLResource) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.allocatedSize);
    }

}

/// A resource representing a multi-dimensional array that you can use with machine learning workloads.
MTLTensor :: struct #type_info_no_size_complaint {
/// Replaces the contents of a slice of this tensor with data you provide.
///
/// - Parameters:
///   - sliceOrigin: An array of offsets, in elements, to the first element of the slice that this method writes data to.
///   - sliceDimensions: An array of sizes, in elements, of the slice this method writes data to.
///   - bytes: A pointer to bytes of data that this method copies into the slice you specify with `sliceOrigin` and `sliceDimensions`.
///   - strides: An array of strides, in elements, that describes the layout of the data in `bytes`. You are responsible for ensuring `strides` meets the following requirements:
///     - Elements of `strides`are in monotonically non-decreasing order.
///     - For any `i` larger than zero, `strides[i]` is greater than or equal to `strides[i-1] * dimensions[i-1]`.
    replaceSliceOrigin_sliceDimensions_withBytes_strides_ :: (self: *MTLTensor, sliceOrigin: *MTLTensorExtents, sliceDimensions: *MTLTensorExtents, bytes: *void, strides: *MTLTensorExtents) -> void {
        func: #type (obj: *void, selector: *void, sliceOrigin: *MTLTensorExtents, sliceDimensions: *MTLTensorExtents, bytes: *void, strides: *MTLTensorExtents) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.replaceSliceOrigin_sliceDimensions_withBytes_strides_, sliceOrigin, sliceDimensions, bytes, strides);
    }

/// Copies the data corresponding to a slice of this tensor into a pointer you provide.
///
/// - Parameters:
///   - bytes: A pointer to bytes of data that this method copies into the slice you specify with `sliceOrigin` and `sliceDimensions`.
///   - strides: An array of strides, in elements, that describes the layout of the data in `bytes`. You are responsible for ensuring `strides` meets the following requirements:
///     - Elements of `strides`are in monotonically non-decreasing order.
///     - For any `i` larger than zero, `strides[i]` is greater than or equal to `strides[i-1] * dimensions[i-1]`.
///   - sliceOrigin: An array of offsets, in elements, to the first element of the slice that this method reads data from.
///   - sliceDimensions: An array of sizes, in elements, of the slice this method reads data from.
    getBytes_strides_fromSliceOrigin_sliceDimensions_ :: (self: *MTLTensor, bytes: *void, strides: *MTLTensorExtents, sliceOrigin: *MTLTensorExtents, sliceDimensions: *MTLTensorExtents) -> void {
        func: #type (obj: *void, selector: *void, bytes: *void, strides: *MTLTensorExtents, sliceOrigin: *MTLTensorExtents, sliceDimensions: *MTLTensorExtents) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.getBytes_strides_fromSliceOrigin_sliceDimensions_, bytes, strides, sliceOrigin, sliceDimensions);
    }

/// A handle that represents the GPU resource, which you can store in an argument buffer.
    gpuResourceID :: (self: *MTLTensor) -> MTLResourceID {
        func: #type (obj: *void, selector: *void) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.gpuResourceID);
    }

/// A buffer instance this tensor shares its storage with or nil if this tensor does not wrap an underlying buffer.
    buffer :: (self: *MTLTensor) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.buffer);
    }

/// An offset, in bytes, into the buffer instance this tensor shares its storage with, or zero if this tensor does not wrap an underlying buffer.
    bufferOffset :: (self: *MTLTensor) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bufferOffset);
    }

/// An array of strides, in elements, one for each dimension of this tensor.
///
/// This property only applies if this tensor shares its storage with a buffer, otherwise it's nil.
    strides :: (self: *MTLTensor) -> *MTLTensorExtents {
        func: #type (obj: *void, selector: *void) -> *MTLTensorExtents #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.strides);
    }

/// An array of sizes, in elements, one for each dimension of this tensor.
    dimensions :: (self: *MTLTensor) -> *MTLTensorExtents {
        func: #type (obj: *void, selector: *void) -> *MTLTensorExtents #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dimensions);
    }

/// An underlying data format of this tensor.
    dataType :: (self: *MTLTensor) -> MTLTensorDataType {
        func: #type (obj: *void, selector: *void) -> MTLTensorDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dataType);
    }

/// A set of contexts in which you can use this tensor.
    usage :: (self: *MTLTensor) -> MTLTensorUsage {
        func: #type (obj: *void, selector: *void) -> MTLTensorUsage #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.usage);
    }

}

/*!
 @protocol MTLBuffer
 @abstract A typeless allocation accessible by both the CPU and the GPU (MTLDevice) or by only the GPU when the storage mode is
 MTLResourceStorageModePrivate.
 
 @discussion
 Unlike in OpenGL and OpenCL, access to buffers is not synchronized.  The caller may use the CPU to modify the data at any time
 but is also responsible for ensuring synchronization and coherency.
 
 The contents become undefined if both the CPU and GPU write to the same buffer without a synchronizing action between those writes.
 This is true even when the regions written do not overlap.
 */
MTLBuffer :: struct #type_info_no_size_complaint {
/*!
 @method contents
 @abstract Returns the data pointer of this buffer's shared copy.
 */
    contents :: (self: *MTLBuffer) -> *void {
        func: #type (obj: *void, selector: *void) -> *void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.contents);
    }

/*!
 @method didModifyRange:
 @abstract Inform the device of the range of a buffer that the CPU has modified, allowing the implementation to invalidate 
 its caches of the buffer's content.
 @discussion When the application writes to a buffer's sysmem copy via @a contents, that range of the buffer immediately 
 becomes undefined for any accesses by the GPU (MTLDevice).  To restore coherency, the buffer modification must be followed
 by -didModifyRange:, and then followed by a commit of the MTLCommandBuffer that will access the buffer.
 -didModifyRange does not make the contents coherent for any previously committed command buffers.
 Note: This method is only required if buffer is created with a storage mode of MTLResourceStorageModeManaged.
 It is not valid to invoke this method on buffers of other storage modes.
 @param range The range of bytes that have been modified.
 */
    didModifyRange_ :: (self: *MTLBuffer, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.didModifyRange_, range);
    }

/*!
 @method newTextureWithDescriptor:offset:bytesPerRow:
 @abstract Create a 2D texture or texture buffer that shares storage with this buffer.
 */
    newTextureWithDescriptor_offset_bytesPerRow_ :: (self: *MTLBuffer, descriptor: *MTLTextureDescriptor, offset: NSUInteger, bytesPerRow: NSUInteger) -> *MTLTexture {
        func: #type (obj: *void, selector: *void, descriptor: *MTLTextureDescriptor, offset: NSUInteger, bytesPerRow: NSUInteger) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newTextureWithDescriptor_offset_bytesPerRow_, descriptor, offset, bytesPerRow);
    }

/// Creates a tensor that shares storage with this buffer.
///
/// `offset` must be 0 when ``MTLTensorDescriptor/usage`` contains ``MTLTensorUsage/MTLTensorUsageMachineLearning``.
///
/// When ``MTLTensorDescriptor/dataType`` is a sub-byte ``MTLTensorDataType``, `offset` must be aligned to 128 bytes.
/// Although only required for sub-byte types, applying 128-byte alignment for all ``MTLTensorDataType``
/// values improves performance.
///
/// See ``MTLTensorDescriptor`` for more information.
///
/// - Parameters:
///   - descriptor: A description of the properties for the new tensor.
///   - offset: Offset into the buffer at which the data of the tensor begins.
///   - error: If an error occurs during creation, Metal populates this parameter to provide you information about it.
/// - Returns: The created ``MTLTensor`` instance, or `nil` if the function failed.
    newTensorWithDescriptor_offset_error_ :: (self: *MTLBuffer, descriptor: *MTLTensorDescriptor, offset: NSUInteger, error: **NSError) -> *MTLTensor {
        func: #type (obj: *void, selector: *void, descriptor: *MTLTensorDescriptor, offset: NSUInteger, error: **NSError) -> *MTLTensor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newTensorWithDescriptor_offset_error_, descriptor, offset, error);
    }

/*!
 @method addDebugMarker:range:
 @abstract Adds a marker to a specific range in the buffer.
 When inspecting a buffer in the GPU debugging tools the marker will be shown.
 @param marker A label used for the marker.
 @param range The range of bytes the marker is using.
 */
    addDebugMarker_range_ :: (self: *MTLBuffer, marker: *NSString, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, marker: *NSString, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addDebugMarker_range_, marker, range);
    }

/*!
 @method removeAllDebugMarkers
 @abstract Removes all debug markers from a buffer.
 */
    removeAllDebugMarkers :: (self: *MTLBuffer) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.removeAllDebugMarkers);
    }

/*!
 @method newRemoteBufferViewForDevice:
 @abstract On Metal devices that support peer to peer transfers, this method is used to create a remote buffer view on another device
 within the peer group.  The receiver must use MTLStorageModePrivate or be backed by an IOSurface.
 */
    newRemoteBufferViewForDevice_ :: (self: *MTLBuffer, device: *MTLDevice) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void, device: *MTLDevice) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRemoteBufferViewForDevice_, device);
    }

/*!
 @property length
 @abstract The length of the buffer in bytes.
 */
    length :: (self: *MTLBuffer) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.length);
    }

/*!
 @property remoteStorageBuffer
 @abstract For Metal buffer objects that are remote views, this returns the buffer associated with the storage on the originating device.
 */
    remoteStorageBuffer :: (self: *MTLBuffer) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.remoteStorageBuffer);
    }

/*!
 @property gpuAddress
 @abstract Represents the GPU virtual address of a buffer resource
 */
    gpuAddress :: (self: *MTLBuffer) -> MTLGPUAddress {
        func: #type (obj: *void, selector: *void) -> MTLGPUAddress #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.gpuAddress);
    }

/*!
 @property sparseBufferTier
 @abstract Query support tier for sparse buffers.
 */
    sparseBufferTier :: (self: *MTLBuffer) -> MTLBufferSparseTier {
        func: #type (obj: *void, selector: *void) -> MTLBufferSparseTier #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sparseBufferTier);
    }

}

/*!
 @protocol MTLTexture
 @abstract MTLTexture represents a collection of 1D, 2D, or 3D images.
 @discussion
 Each image in a texture is a 1D, 2D, 2DMultisample, or 3D image. The texture contains one or more images arranged in a mipmap stack. If there are multiple mipmap stacks, each one is referred to as a slice of the texture. 1D, 2D, 2DMultisample, and 3D textures have a single slice. In 1DArray and 2DArray textures, every slice is an array element. A Cube texture always has 6 slices, one for each face. In a CubeArray texture, each set of six slices is one element in the array.
 
 Most APIs that operate on individual images in a texture address those images via a tuple of a Slice, and Mipmap Level within that slice.
 */
MTLTexture :: struct #type_info_no_size_complaint {
/*!
 @method getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice:
 @abstract Copies a block of pixels from a texture slice into the application's memory.
 */
    getBytes_bytesPerRow_bytesPerImage_fromRegion_mipmapLevel_slice_ :: (self: *MTLTexture, pixelBytes: *void, bytesPerRow: NSUInteger, bytesPerImage: NSUInteger, region: MTLRegion, level: NSUInteger, slice: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, pixelBytes: *void, bytesPerRow: NSUInteger, bytesPerImage: NSUInteger, region: MTLRegion, level: NSUInteger, slice: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.getBytes_bytesPerRow_bytesPerImage_fromRegion_mipmapLevel_slice_, pixelBytes, bytesPerRow, bytesPerImage, region, level, slice);
    }

/*!
 @method replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage:
 @abstract Copy a block of pixel data from the caller's pointer into a texture slice.
 */
    replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage_ :: (self: *MTLTexture, region: MTLRegion, level: NSUInteger, slice: NSUInteger, pixelBytes: *void, bytesPerRow: NSUInteger, bytesPerImage: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, region: MTLRegion, level: NSUInteger, slice: NSUInteger, pixelBytes: *void, bytesPerRow: NSUInteger, bytesPerImage: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage_, region, level, slice, pixelBytes, bytesPerRow, bytesPerImage);
    }

/*!
 @method getBytes:bytesPerRow:fromRegion:mipmapLevel:
 @abstract Convenience for getBytes:bytesPerRow:bytesPerImage:fromRegion:mipmapLevel:slice: that doesn't require slice related arguments
 */
    getBytes_bytesPerRow_fromRegion_mipmapLevel_ :: (self: *MTLTexture, pixelBytes: *void, bytesPerRow: NSUInteger, region: MTLRegion, level: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, pixelBytes: *void, bytesPerRow: NSUInteger, region: MTLRegion, level: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.getBytes_bytesPerRow_fromRegion_mipmapLevel_, pixelBytes, bytesPerRow, region, level);
    }

/*!
 @method replaceRegion:mipmapLevel:withBytes:bytesPerRow:
 @abstract Convenience for replaceRegion:mipmapLevel:slice:withBytes:bytesPerRow:bytesPerImage: that doesn't require slice related arguments
 */
    replaceRegion_mipmapLevel_withBytes_bytesPerRow_ :: (self: *MTLTexture, region: MTLRegion, level: NSUInteger, pixelBytes: *void, bytesPerRow: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, region: MTLRegion, level: NSUInteger, pixelBytes: *void, bytesPerRow: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.replaceRegion_mipmapLevel_withBytes_bytesPerRow_, region, level, pixelBytes, bytesPerRow);
    }

/*!
 @method newTextureViewWithPixelFormat:
 @abstract Create a new texture which shares the same storage as the source texture, but with a different (but compatible) pixel format.
 */
    newTextureViewWithPixelFormat_ :: (self: *MTLTexture, pixelFormat: MTLPixelFormat) -> *MTLTexture {
        func: #type (obj: *void, selector: *void, pixelFormat: MTLPixelFormat) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newTextureViewWithPixelFormat_, pixelFormat);
    }

/*!
 @method newTextureViewWithPixelFormat:textureType:levels:slices:
 @abstract Create a new texture which shares the same storage as the source texture, but with a different (but compatible) pixel format, texture type, levels and slices.
 */
    newTextureViewWithPixelFormat_textureType_levels_slices_ :: (self: *MTLTexture, pixelFormat: MTLPixelFormat, textureType: MTLTextureType, levelRange: NSRange, sliceRange: NSRange) -> *MTLTexture {
        func: #type (obj: *void, selector: *void, pixelFormat: MTLPixelFormat, textureType: MTLTextureType, levelRange: NSRange, sliceRange: NSRange) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newTextureViewWithPixelFormat_textureType_levels_slices_, pixelFormat, textureType, levelRange, sliceRange);
    }

/*!
 @method newSharedTextureHandle
 @abstract Create a new texture handle, that can be shared across process addres space boundaries.
 */
    newSharedTextureHandle :: (self: *MTLTexture) -> *MTLSharedTextureHandle {
        func: #type (obj: *void, selector: *void) -> *MTLSharedTextureHandle #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newSharedTextureHandle);
    }

/*!
 @method newTextureViewWithDescriptor:
 @abstract Create a new texture which shares the same storage as the source texture, but with different (but compatible) properties specified by the descriptor
 */
    newTextureViewWithDescriptor_ :: (self: *MTLTexture, descriptor: *MTLTextureViewDescriptor) -> *MTLTexture {
        func: #type (obj: *void, selector: *void, descriptor: *MTLTextureViewDescriptor) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newTextureViewWithDescriptor_, descriptor);
    }

/*!
 @method newRemoteTextureViewForDevice:
 @abstract On Metal devices that support peer to peer transfers, this method is used to create a remote texture view on another device
 within the peer group.  The receiver must use MTLStorageModePrivate or be backed by an IOSurface.
 */
    newRemoteTextureViewForDevice_ :: (self: *MTLTexture, device: *MTLDevice) -> *MTLTexture {
        func: #type (obj: *void, selector: *void, device: *MTLDevice) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRemoteTextureViewForDevice_, device);
    }

/*!
 @method newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:
 @abstract Create a new texture which shares the same storage as the source texture, but with a different (but compatible) pixel format, texture type, levels, slices and swizzle. 
 */
    newTextureViewWithPixelFormat_textureType_levels_slices_swizzle_ :: (self: *MTLTexture, pixelFormat: MTLPixelFormat, textureType: MTLTextureType, levelRange: NSRange, sliceRange: NSRange, swizzle: MTLTextureSwizzleChannels) -> *MTLTexture {
        func: #type (obj: *void, selector: *void, pixelFormat: MTLPixelFormat, textureType: MTLTextureType, levelRange: NSRange, sliceRange: NSRange, swizzle: MTLTextureSwizzleChannels) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newTextureViewWithPixelFormat_textureType_levels_slices_swizzle_, pixelFormat, textureType, levelRange, sliceRange, swizzle);
    }

/*!
 @property rootResource
 @abstract The resource this texture was created from. It may be a texture or a buffer. If this texture is not reusing storage of another MTLResource, then nil is returned.
 */
    rootResource :: (self: *MTLTexture) -> *MTLResource {
        func: #type (obj: *void, selector: *void) -> *MTLResource #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.rootResource);
    }

/*!
 @property parentTexture
 @abstract The texture this texture view was created from, or nil if this is not a texture view or it was not created from a texture.
 */
    parentTexture :: (self: *MTLTexture) -> *MTLTexture {
        func: #type (obj: *void, selector: *void) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.parentTexture);
    }

/*!
 @property parentRelativeLevel
 @abstract The base level of the texture this texture view was created from, or 0 if this is not a texture view.
 */
    parentRelativeLevel :: (self: *MTLTexture) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.parentRelativeLevel);
    }

/*!
 @property parentRelativeSlice
 @abstract The base slice of the texture this texture view was created from, or 0 if this is not a texture view.
 */
    parentRelativeSlice :: (self: *MTLTexture) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.parentRelativeSlice);
    }

/*!
 @property buffer
 @abstract The buffer this texture view was created from, or nil if this is not a texture view or it was not created from a buffer.
 */
    buffer :: (self: *MTLTexture) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.buffer);
    }

/*!
 @property bufferOffset
 @abstract The offset of the buffer this texture view was created from, or 0 if this is not a texture view.
 */
    bufferOffset :: (self: *MTLTexture) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bufferOffset);
    }

/*!
 @property bufferBytesPerRow
 @abstract The bytesPerRow of the buffer this texture view was created from, or 0 if this is not a texture view.
 */
    bufferBytesPerRow :: (self: *MTLTexture) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bufferBytesPerRow);
    }

/*!
 @property iosurface
 @abstract If this texture was created from an IOSurface, this returns a reference to that IOSurface. iosurface is nil if this texture was not created from an IOSurface.
 */
    iosurface :: (self: *MTLTexture) -> IOSurfaceRef {
        func: #type (obj: *void, selector: *void) -> IOSurfaceRef #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.iosurface);
    }

/*!
 @property iosurfacePlane
 @abstract If this texture was created from an IOSurface, this returns the plane of the IOSurface from which the texture was created. iosurfacePlane is 0 if this texture was not created from an IOSurface.
 */
    iosurfacePlane :: (self: *MTLTexture) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.iosurfacePlane);
    }

/*!
 @property type
 @abstract The type of this texture.
 */
    textureType :: (self: *MTLTexture) -> MTLTextureType {
        func: #type (obj: *void, selector: *void) -> MTLTextureType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.textureType);
    }

/*!
 @property pixelFormat
 @abstract The MTLPixelFormat that is used to interpret this texture's contents.
 */
    pixelFormat :: (self: *MTLTexture) -> MTLPixelFormat {
        func: #type (obj: *void, selector: *void) -> MTLPixelFormat #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pixelFormat);
    }

/*!
 @property width
 @abstract The width of the MTLTexture instance in pixels.
 */
    width :: (self: *MTLTexture) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.width);
    }

/*!
 @property height
 @abstract The height of the MTLTexture instance in pixels.
 @discussion. height is 1 if the texture is 1D.
 */
    height :: (self: *MTLTexture) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.height);
    }

/*!
 @property depth
 @abstract The depth of this MTLTexture instance in pixels.
 @discussion If this MTLTexture is not a 3D texture, the depth is 1
 */
    depth :: (self: *MTLTexture) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.depth);
    }

/*!
 @property mipmapLevelCount
 @abstract The number of mipmap levels in each slice of this MTLTexture.
 */
    mipmapLevelCount :: (self: *MTLTexture) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.mipmapLevelCount);
    }

/*!
 @property sampleCount
 @abstract The number of samples in each pixel of this MTLTexture.
 @discussion If this texture is any type other than 2DMultisample, samples is 1.
 */
    sampleCount :: (self: *MTLTexture) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleCount);
    }

/*!
 @property arrayLength
 @abstract The number of array elements in this MTLTexture.
 @discussion For non-Array texture types, arrayLength is 1.
 */
    arrayLength :: (self: *MTLTexture) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.arrayLength);
    }

/*!
 @property usage
 @abstract Description of texture usage.
 */
    usage :: (self: *MTLTexture) -> MTLTextureUsage {
        func: #type (obj: *void, selector: *void) -> MTLTextureUsage #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.usage);
    }

/*!
 @property shareable
 @abstract If YES, this texture can be shared with other processes.
 @discussion Texture can be shared across process addres space boundaries through use of sharedTextureHandle and XPC.
 */
    isShareable :: (self: *MTLTexture) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isShareable);
    }

/*!
 @property framebufferOnly
 @abstract If YES, this texture can only be used with a MTLAttachmentDescriptor, and cannot be used as a texture argument for MTLRenderCommandEncoder, MTLBlitCommandEncoder, or MTLComputeCommandEncoder. Furthermore, when this property's value is YES, readPixels/writePixels may not be used with this texture.
 @discussion Textures obtained from CAMetalDrawables may have this property set to YES, depending on the value of frameBufferOnly passed to their parent CAMetalLayer. Textures created directly by the application will not have any restrictions.
 */
    isFramebufferOnly :: (self: *MTLTexture) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isFramebufferOnly);
    }

/*!
 @property firstMipmapInTail
 @abstract For sparse textures this property returns index of first mipmap that is packed in tail.
 Mapping this mipmap level will map all subsequent mipmap levels.
 */
    firstMipmapInTail :: (self: *MTLTexture) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.firstMipmapInTail);
    }

/*!
 @property tailSizeInBytes
 @abstract Amount of memory in bytes required to map sparse texture tail.
 */
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

/*!
 @property allowGPUOptimizedContents
 @abstract Allow GPU-optimization for the contents texture. The default value is true.
 @discussion Useful for opting-out of GPU-optimization when implicit optimization (e.g. RT writes) is regressing CPU-read-back performance. See the documentation for optimizeContentsForGPUAccess: and optimizeContentsForCPUAccess: APIs.
 */
    allowGPUOptimizedContents :: (self: *MTLTexture) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.allowGPUOptimizedContents);
    }

/*!
 @property compressionType
 @abstract Returns the compression type of the texture
 @discussion See the compressionType property on MTLTextureDescriptor
 */
    compressionType :: (self: *MTLTexture) -> MTLTextureCompressionType {
        func: #type (obj: *void, selector: *void) -> MTLTextureCompressionType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.compressionType);
    }

/*!
 @property gpuResourceID
 @abstract Handle of the GPU resource suitable for storing in an Argument Buffer
 */
    gpuResourceID :: (self: *MTLTexture) -> MTLResourceID {
        func: #type (obj: *void, selector: *void) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.gpuResourceID);
    }

/*!
 @property remoteStorageTexture
 @abstract For Metal texture objects that are remote views, this returns the texture associated with the storage on the originating device.
 */
    remoteStorageTexture :: (self: *MTLTexture) -> *MTLTexture {
        func: #type (obj: *void, selector: *void) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.remoteStorageTexture);
    }

/*!
 @property swizzle
 @abstract The channel swizzle used when reading or sampling from this texture
 */
    swizzle :: (self: *MTLTexture) -> MTLTextureSwizzleChannels {
        func: #type (obj: *void, selector: *void) -> MTLTextureSwizzleChannels #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.swizzle);
    }

/*!
 @property sparseTextureTier
 @abstract Query support tier for sparse textures.
 */
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
// min alignment of starting offset in the buffer
    bufferAlignment :: (self: *MTLBufferBinding) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bufferAlignment);
    }

// sizeof(T) for T *argName
    bufferDataSize :: (self: *MTLBufferBinding) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.bufferDataSize);
    }

// MTLDataTypeFloat, MTLDataTypeFloat4, MTLDataTypeStruct, ...
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

// sizeof(T) for T *argName
    threadgroupMemoryDataSize :: (self: *MTLThreadgroupBinding) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.threadgroupMemoryDataSize);
    }

}

MTLTextureBinding :: struct #type_info_no_size_complaint {
// texture1D, texture2D...
    textureType :: (self: *MTLTextureBinding) -> MTLTextureType {
        func: #type (obj: *void, selector: *void) -> MTLTextureType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.textureType);
    }

// half, float, int, or uint.
    textureDataType :: (self: *MTLTextureBinding) -> MTLDataType {
        func: #type (obj: *void, selector: *void) -> MTLDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.textureDataType);
    }

// true for depth textures
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
// min alignment of starting offset in the buffer
    objectPayloadAlignment :: (self: *MTLObjectPayloadBinding) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectPayloadAlignment);
    }

// sizeof(T) for T *argName
    objectPayloadDataSize :: (self: *MTLObjectPayloadBinding) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectPayloadDataSize);
    }

}

/// An object that represents a tensor bound to a graphics or compute function or a machine learning function.
MTLTensorBinding :: struct #type_info_no_size_complaint {
/// The underlying data format of this tensor.
    tensorDataType :: (self: *MTLTensorBinding) -> MTLTensorDataType {
        func: #type (obj: *void, selector: *void) -> MTLTensorDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tensorDataType);
    }

/// The data format you use for indexing into the tensor.
    indexType :: (self: *MTLTensorBinding) -> MTLDataType {
        func: #type (obj: *void, selector: *void) -> MTLDataType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.indexType);
    }

/// The array of sizes, in elements, one for each dimension of this tensor.
///
/// Because shader-bound tensors have dynamic extents, if this tensor is shader bound, the ``MTLTensorExtents/rank`` of `dimensions` corresponds to the rank the shader function specifies, and ``MTLTensorExtents/extentsAtDimensionIndex:`` always returns a value of -1.
/// In the case of functions used with machine learning pipelines, `dimensions` corresponds to the default shape, if you provide one. Otherwise, it's `nil` in the case of an undefined shape.
    dimensions :: (self: *MTLTensorBinding) -> *MTLTensorExtents {
        func: #type (obj: *void, selector: *void) -> *MTLTensorExtents #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dimensions);
    }

}

/*!
 @protocol MTLFunction
 @abstract A handle to intermediate code used as inputs for either a MTLComputePipelineState or a MTLRenderPipelineState.
 @discussion MTLFunction is a single vertex shader, fragment shader, or compute function.  A Function can only be used with the device that it was created against.
*/
MTLFunction :: struct #type_info_no_size_complaint {
/*!
 * @method newArgumentEncoderWithBufferIndex:
 * @abstract Creates an argument encoder which will encode arguments matching the layout of the argument buffer at the given bind point index.
 */
    newArgumentEncoderWithBufferIndex_ :: (self: *MTLFunction, bufferIndex: NSUInteger) -> *MTLArgumentEncoder {
        func: #type (obj: *void, selector: *void, bufferIndex: NSUInteger) -> *MTLArgumentEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newArgumentEncoderWithBufferIndex_, bufferIndex);
    }

/*!
 * @method newArgumentEncoderWithBufferIndex:
 * @abstract Creates an argument encoder which will encode arguments matching the layout of the argument buffer at the given bind point index.
 */
    newArgumentEncoderWithBufferIndex_reflection_ :: (self: *MTLFunction, bufferIndex: NSUInteger, reflection: **MTLArgument) -> *MTLArgumentEncoder {
        func: #type (obj: *void, selector: *void, bufferIndex: NSUInteger, reflection: **MTLArgument) -> *MTLArgumentEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newArgumentEncoderWithBufferIndex_reflection_, bufferIndex, reflection);
    }

/*!
 @property label
 @abstract A string to help identify this object.
 */
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

/*!
 @property device
 @abstract The device this resource was created against.  This resource can only be used with this device.
 */
    device :: (self: *MTLFunction) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

/*!
 @property functionType
 @abstract The overall kind of entry point: compute, vertex, or fragment.
 */
    functionType :: (self: *MTLFunction) -> MTLFunctionType {
        func: #type (obj: *void, selector: *void) -> MTLFunctionType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionType);
    }

/*!
 @property patchType
 @abstract Returns the patch type. MTLPatchTypeNone if it is not a post tessellation vertex shader.
 */
    patchType :: (self: *MTLFunction) -> MTLPatchType {
        func: #type (obj: *void, selector: *void) -> MTLPatchType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.patchType);
    }

/*!
 @property patchControlPointCount
 @abstract Returns the number of patch control points if it was specified in the shader. Returns -1 if it
 was not specified.
 */
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

/*!
 @property stageInputAttributes
 @abstract Returns an array describing the attributes
 */
    stageInputAttributes :: (self: *MTLFunction) -> *NSArray(*MTLAttribute) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLAttribute) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stageInputAttributes);
    }

/*!
 @property name
 @abstract The name of the function in the shading language.
 */
    name :: (self: *MTLFunction) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

/*!
 @property functionConstantsDictionary
 @abstract A dictionary containing information about all function contents, keyed by the constant names.
 */
    functionConstantsDictionary :: (self: *MTLFunction) -> *NSDictionary(*NSString, *MTLFunctionConstant) {
        func: #type (obj: *void, selector: *void) -> *NSDictionary(*NSString, *MTLFunctionConstant) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionConstantsDictionary);
    }

/*!
 @property options
 @abstract The options this function was created with.
 */
    options :: (self: *MTLFunction) -> MTLFunctionOptions {
        func: #type (obj: *void, selector: *void) -> MTLFunctionOptions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.options);
    }

}

MTLLibrary :: struct #type_info_no_size_complaint {
/*!
 @method newFunctionWithName
 @abstract Returns a pointer to a function object, return nil if the function is not found in the library.
 */
    newFunctionWithName_ :: (self: *MTLLibrary, functionName: *NSString) -> *MTLFunction {
        func: #type (obj: *void, selector: *void, functionName: *NSString) -> *MTLFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newFunctionWithName_, functionName);
    }

/*!
 @method newFunctionWithName:constantValues:error:
 @abstract Returns a pointer to a function object obtained by applying the constant values to the named function.
 @discussion This method will call the compiler. Use newFunctionWithName:constantValues:completionHandler: to
 avoid waiting on the compiler.
 */
    newFunctionWithName_constantValues_error_ :: (self: *MTLLibrary, name: *NSString, constantValues: *MTLFunctionConstantValues, error: **NSError) -> *MTLFunction {
        func: #type (obj: *void, selector: *void, name: *NSString, constantValues: *MTLFunctionConstantValues, error: **NSError) -> *MTLFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newFunctionWithName_constantValues_error_, name, constantValues, error);
    }

/*!
 @method newFunctionWithName:constantValues:completionHandler:
 @abstract Returns a pointer to a function object obtained by applying the constant values to the named function.
 @discussion This method is asynchronous since it is will call the compiler.
 */
    newFunctionWithName_constantValues_completionHandler_ :: (self: *MTLLibrary, name: *NSString, constantValues: *MTLFunctionConstantValues, completionHandler: #type (unknown_0: *MTLFunction, unknown_1: *NSError) -> void #c_call) -> void {
        func: #type (obj: *void, selector: *void, name: *NSString, constantValues: *MTLFunctionConstantValues, completionHandler: #type (unknown_0: *MTLFunction, unknown_1: *NSError) -> void #c_call) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newFunctionWithName_constantValues_completionHandler_, name, constantValues, completionHandler);
    }

/// Retrieves reflection information for a function in the library.
///
/// - Parameters:
///   - functionName: The name of a GPU function in the library.
///   The name needs to match one of the elements in the string array of library's ``functionNames`` property.
///
/// - Returns: An `MTLFunctionReflection` instance when the method succeeds; otherwise `nil`.
///
/// The reflection instance contains metadata information about a specific GPU function,
/// which can include:
/// * Function parameters
/// * Return types
/// * Bindings
/// * Annotations from a developer, if available
///
/// - Note: The Metal compiler generates the function's reflection information
/// when you or Xcode build the library.
///
/// The method only returns reflection information if all of the following conditions apply:
/// * The library has a function with a name that matches `functionName`.
/// * The deployment target is macOS 13.0 or later, or iOS 16.0 or later, or visionOS 2.0 or later.
    reflectionForFunctionWithName_ :: (self: *MTLLibrary, functionName: *NSString) -> *MTLFunctionReflection {
        func: #type (obj: *void, selector: *void, functionName: *NSString) -> *MTLFunctionReflection #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reflectionForFunctionWithName_, functionName);
    }

/*!
 @method newFunctionWithDescriptor:completionHandler:
 @abstract Create a new MTLFunction object asynchronously.
 */
    newFunctionWithDescriptor_completionHandler_ :: (self: *MTLLibrary, descriptor: *MTLFunctionDescriptor, completionHandler: #type (unknown_0: *MTLFunction, unknown_1: *NSError) -> void #c_call) -> void {
        func: #type (obj: *void, selector: *void, descriptor: *MTLFunctionDescriptor, completionHandler: #type (unknown_0: *MTLFunction, unknown_1: *NSError) -> void #c_call) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newFunctionWithDescriptor_completionHandler_, descriptor, completionHandler);
    }

/*!
 @method newFunctionWithDescriptor:error:
 @abstract Create  a new MTLFunction object synchronously.
 */
    newFunctionWithDescriptor_error_ :: (self: *MTLLibrary, descriptor: *MTLFunctionDescriptor, error: **NSError) -> *MTLFunction {
        func: #type (obj: *void, selector: *void, descriptor: *MTLFunctionDescriptor, error: **NSError) -> *MTLFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newFunctionWithDescriptor_error_, descriptor, error);
    }

/*!
 @method newIntersectionFunctionWithDescriptor:completionHandler:
 @abstract Create a new MTLFunction object asynchronously.
 */
    newIntersectionFunctionWithDescriptor_completionHandler_ :: (self: *MTLLibrary, descriptor: *MTLIntersectionFunctionDescriptor, completionHandler: #type (unknown_0: *MTLFunction, unknown_1: *NSError) -> void #c_call) -> void {
        func: #type (obj: *void, selector: *void, descriptor: *MTLIntersectionFunctionDescriptor, completionHandler: #type (unknown_0: *MTLFunction, unknown_1: *NSError) -> void #c_call) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newIntersectionFunctionWithDescriptor_completionHandler_, descriptor, completionHandler);
    }

/*!
 @method newIntersectionFunctionWithDescriptor:error:
 @abstract Create  a new MTLFunction object synchronously.
 */
    newIntersectionFunctionWithDescriptor_error_ :: (self: *MTLLibrary, descriptor: *MTLIntersectionFunctionDescriptor, error: **NSError) -> *MTLFunction {
        func: #type (obj: *void, selector: *void, descriptor: *MTLIntersectionFunctionDescriptor, error: **NSError) -> *MTLFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newIntersectionFunctionWithDescriptor_error_, descriptor, error);
    }

/*!
 @property label
 @abstract A string to help identify this object.
 */
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

/*!
 @property device
 @abstract The device this resource was created against.  This resource can only be used with this device.
 */
    device :: (self: *MTLLibrary) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

/*!
 @property functionNames
 @abstract The array contains NSString objects, with the name of each function in library.
 */
    functionNames :: (self: *MTLLibrary) -> *NSArray(*NSString) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*NSString) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionNames);
    }

/*!
 @property type
 @abstract The library type provided when this MTLLibrary was created.
 Libraries with MTLLibraryTypeExecutable can be used to obtain MTLFunction from.
 Libraries with MTLLibraryTypeDynamic can be used to resolve external references in other MTLLibrary from.
 @see MTLCompileOptions
 */
    type :: (self: *MTLLibrary) -> MTLLibraryType {
        func: #type (obj: *void, selector: *void) -> MTLLibraryType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.type);
    }

/*!
 @property installName
 @abstract The installName provided when this MTLLibrary was created.
 @discussion Always nil if the type of the library is not MTLLibraryTypeDynamic.
 @see MTLCompileOptions
 */
    installName :: (self: *MTLLibrary) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.installName);
    }

}

/*!
 @protocol MTLCounter
 @abstract A descriptor for a single counter.
 */
MTLCounter :: struct #type_info_no_size_complaint {
    name :: (self: *MTLCounter) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

}

/*!
 @protocol MTLCounterSet
 @abstract A collection of MTLCounters that the device can capture in
 a single pass.
 */
MTLCounterSet :: struct #type_info_no_size_complaint {
/*!
 @property name The name of the counter set.
 */
    name :: (self: *MTLCounterSet) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

/*!
 @property counters The set of counters captured by the counter set.
 @discussion The counters array contains all the counters that will be written
 when a counter sample is collected.  Counters that do not appear in this array
 will not be written to the resolved buffer when the samples are resolved, even if
 they appear in the corresponding resolved counter structure.  Instead
 MTLCounterErrorValue will be written in the resolved buffer.
 */
    counters :: (self: *MTLCounterSet) -> *NSArray(*MTLCounter) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLCounter) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.counters);
    }

}

/*!
 @protocol MTLCounterSampleBuffer
 @abstract The Counter Sample Buffer contains opaque counter samples as well
 as state needed to request a sample from the API.
 */
MTLCounterSampleBuffer :: struct #type_info_no_size_complaint {
/*!
 @method resolveCounterRange:
 @abstract Resolve the counters from the sample buffer to an NSData containing
 the counter values.  This may only be used with sample buffers that have
 MTLStorageModeShared.
 @param range The range of indices in the sample buffer to resolve.
 @return The resolved samples.
 @discussion Samples that encountered an error during resolve will be set to
 MTLCounterErrorValue.
 */
    resolveCounterRange_ :: (self: *MTLCounterSampleBuffer, range: NSRange) -> *NSData {
        func: #type (obj: *void, selector: *void, range: NSRange) -> *NSData #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resolveCounterRange_, range);
    }

/*!
 @property device The device that created the sample buffer.  It is only valid
 to use the sample buffer with this device.
 */
    device :: (self: *MTLCounterSampleBuffer) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

/*!
 @property label The label for the sample buffer.  This is set by the label
 property of the descriptor that is used to create the sample buffer.
 */
    label :: (self: *MTLCounterSampleBuffer) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

/*!
 @property sampleCount The number of samples that may be stored in this sample buffer.
 */
    sampleCount :: (self: *MTLCounterSampleBuffer) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleCount);
    }

}

/// A reference to an asynchronous compilation task that you initiate from a compiler instance.
MTL4CompilerTask :: struct #type_info_no_size_complaint {
/// Waits synchronously for this compile task to complete by blocking the calling thread.
    waitUntilCompleted :: (self: *MTL4CompilerTask) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.waitUntilCompleted);
    }

/// Returns the compiler instance that this asynchronous compiler task belongs to.
    compiler :: (self: *MTL4CompilerTask) -> *MTL4Compiler {
        func: #type (obj: *void, selector: *void) -> *MTL4Compiler #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.compiler);
    }

/// Returns the compiler task status.
///
/// The default is `MTL4CompilerStatusNone`.
    status :: (self: *MTL4CompilerTask) -> MTL4CompilerTaskStatus {
        func: #type (obj: *void, selector: *void) -> MTL4CompilerTaskStatus #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.status);
    }

}

/// A abstraction for a pipeline state and shader function compiler.
MTL4Compiler :: struct #type_info_no_size_complaint {
/// Creates a new Metal library synchronously.
///
/// - Parameters:
///   - descriptor: A description of the library to create.
///   - error: An optional parameter into which Metal stores information in case of an error.
///
/// - Returns: a Metal library instance upon success, `nil` otherwise.
    newLibraryWithDescriptor_error_ :: (self: *MTL4Compiler, descriptor: *MTL4LibraryDescriptor, error: **NSError) -> *MTLLibrary {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4LibraryDescriptor, error: **NSError) -> *MTLLibrary #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newLibraryWithDescriptor_error_, descriptor, error);
    }

/// Creates a new dynamic library from a library containing Metal IR code synchronously.
///
/// - Parameters:
///   - library: A library from which this compiler creates the new a dynamic library
///   - error: An optional parameter into which Metal stores information in case of an error.
///
/// - Returns: A new dynamic Metal library upon success, `nil` otherwise.
    newDynamicLibrary_error_ :: (self: *MTL4Compiler, library: *MTLLibrary, error: **NSError) -> *MTLDynamicLibrary {
        func: #type (obj: *void, selector: *void, library: *MTLLibrary, error: **NSError) -> *MTLDynamicLibrary #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newDynamicLibrary_error_, library, error);
    }

/// Creates a new dynamic library from the contents of a file at an URL location synchronously.
///
/// - Parameters:
///   - url: An URL referencing a file whose contents this compiler uses to build a dynamic library.
///   - error: An optional parameter into which Metal stores information in case of an error.
///
/// - Returns: A new dynamic Metal library upon success, `nil` otherwise.
    newDynamicLibraryWithURL_error_ :: (self: *MTL4Compiler, url: *NSURL, error: **NSError) -> *MTLDynamicLibrary {
        func: #type (obj: *void, selector: *void, url: *NSURL, error: **NSError) -> *MTLDynamicLibrary #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newDynamicLibraryWithURL_error_, url, error);
    }

/// Creates a new compute pipeline state object synchronously.
///
/// - Parameters:
///   - descriptor: A compute pipeline state descriptor describing the pipeline this compiler creates.
///   - compilerTaskOptions: A description of the compilation process itself, providing parameters that
///         influence execution of the compilation process.
///   - error: An optional parameter into which Metal stores information in case of an error.
///
/// - Returns: A new compute pipeline state object upon success, `nil` otherwise.
    newComputePipelineStateWithDescriptor_compilerTaskOptions_error_ :: (self: *MTL4Compiler, descriptor: *MTL4ComputePipelineDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTLComputePipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4ComputePipelineDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTLComputePipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newComputePipelineStateWithDescriptor_compilerTaskOptions_error_, descriptor, compilerTaskOptions, error);
    }

/// Creates a new compute pipeline state synchronously.
///
/// - Parameters:
///   - descriptor: A compute pipeline state descriptor describing the pipeline this compiler creates.
///   - dynamicLinkingDescriptor: An optional parameter that provides additional configuration for linking the pipeline state object.
///   - compilerTaskOptions: A description of the compilation process itself, providing parameters that
///         influence execution of the compilation process.
///   - error: An optional parameter into which Metal stores information in case of an error.
///
/// - Returns: A new compute pipeline state object upon success, `nil` otherwise.
    newComputePipelineStateWithDescriptor_dynamicLinkingDescriptor_compilerTaskOptions_error_ :: (self: *MTL4Compiler, descriptor: *MTL4ComputePipelineDescriptor, dynamicLinkingDescriptor: *MTL4PipelineStageDynamicLinkingDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTLComputePipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4ComputePipelineDescriptor, dynamicLinkingDescriptor: *MTL4PipelineStageDynamicLinkingDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTLComputePipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newComputePipelineStateWithDescriptor_dynamicLinkingDescriptor_compilerTaskOptions_error_, descriptor, dynamicLinkingDescriptor, compilerTaskOptions, error);
    }

/// Creates a new render pipeline state synchronously.
///
/// Use this method to build any render pipeline type, including render, tile, and mesh render pipeline states.
/// The type of the descriptor you pass indicates the pipeline type this method builds.
///
/// Passing in a compute pipeline descriptor to the `descriptor` parameter produces an error.
///
/// - Parameters:
///   - descriptor: A render, tile, or mesh pipeline state descriptor that describes the pipeline to create.
///   - compilerTaskOptions: A description of the compilation process itself, providing parameters that
///         influence execution of the compilation process.
///   - error: An optional parameter into which Metal stores information in case of an error.
///
/// - Returns: A new render pipeline state object upon success, `nil` otherwise.
    newRenderPipelineStateWithDescriptor_compilerTaskOptions_error_ :: (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTLRenderPipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4PipelineDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTLRenderPipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithDescriptor_compilerTaskOptions_error_, descriptor, compilerTaskOptions, error);
    }

/// Creates a new render pipeline state synchronously.
///
/// Use this method to build any render pipeline type, including render, tile, and mesh render pipeline states.
/// The type of the descriptor you pass indicates the pipeline type this method builds.
///
/// Passing in a compute pipeline descriptor to the `descriptor` parameter produces an error.
///
/// - Parameters:
///   - descriptor: A render, tile, or mesh pipeline state descriptor that describes the pipeline to create.
///   - dynamicLinkingDescriptor: An optional parameter that provides additional configuration for linking the pipeline state object.
///   - compilerTaskOptions: A description of the compilation process itself, providing parameters that
///         influence execution of the compilation process.
///   - error: An optional parameter into which Metal stores information in case of an error.
///
/// - Returns: A new render pipeline state object upon success, `nil` otherwise.
    newRenderPipelineStateWithDescriptor_dynamicLinkingDescriptor_compilerTaskOptions_error_ :: (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, dynamicLinkingDescriptor: *MTL4RenderPipelineDynamicLinkingDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTLRenderPipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4PipelineDescriptor, dynamicLinkingDescriptor: *MTL4RenderPipelineDynamicLinkingDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTLRenderPipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithDescriptor_dynamicLinkingDescriptor_compilerTaskOptions_error_, descriptor, dynamicLinkingDescriptor, compilerTaskOptions, error);
    }

/// Creates a new render pipeline state from another, previously unspecialized, pipeline state.
///
/// Metal specializes the pipeline state with new state values the descriptor provides, observing the following rules:
/// * The compiler only updates properties that were originally specified as *unspecialized*. It doesn't modify other
/// already-specialized properties
/// * The compiler sets to their default behavior any unspecialized properties that your passed-in descriptor doesn't specialize
///
/// Additionally, there are some cases where the Metal can't specialize a pipeline:
/// * If the original pipeline state object doesn't have any unspecialized properties
/// * You can't re-specialize a previously specialized pipeline state object
///
/// - Parameters:
///   - descriptor: A render pipeline state descriptor or any type: default, tile, or mesh render pipeline descriptor.
///   - pipeline: A render pipeline state containing unspecialized substate.
///   - error: An optional parameter into which Metal stores information in case of an error.
///
/// - Returns: a fully-specialized pipeline state object.
///
    newRenderPipelineStateBySpecializationWithDescriptor_pipeline_error_ :: (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, pipeline: *MTLRenderPipelineState, error: **NSError) -> *MTLRenderPipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4PipelineDescriptor, pipeline: *MTLRenderPipelineState, error: **NSError) -> *MTLRenderPipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateBySpecializationWithDescriptor_pipeline_error_, descriptor, pipeline, error);
    }

/// Creates a new binary visible or intersection function synchronously.
///
/// - Parameters:
///   - descriptor: A binary function descriptor to use for creating the binary function.
///   - compilerTaskOptions: A descriptor of the compilation itself, providing parameters that
///         influence execution of the compilation process.
///   - error: An optional parameter into which Metal stores information in case of an error.
///
/// - Returns: a new binary function upon success, `nil` otherwise.
    newBinaryFunctionWithDescriptor_compilerTaskOptions_error_ :: (self: *MTL4Compiler, descriptor: *MTL4BinaryFunctionDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTL4BinaryFunction {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4BinaryFunctionDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTL4BinaryFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newBinaryFunctionWithDescriptor_compilerTaskOptions_error_, descriptor, compilerTaskOptions, error);
    }

/// Creates a new Metal library instance asynchronously.
///
/// - Parameters:
///   - descriptor: A description of the library to create.
///   - completionHandler: A block Metal calls when it finishes the build task.
///
/// - Returns: a compiler task representing the asynchronous compilation task.
    newLibraryWithDescriptor_completionHandler_ :: (self: *MTL4Compiler, descriptor: *MTL4LibraryDescriptor, completionHandler: MTLNewLibraryCompletionHandler) -> *MTL4CompilerTask {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4LibraryDescriptor, completionHandler: MTLNewLibraryCompletionHandler) -> *MTL4CompilerTask #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newLibraryWithDescriptor_completionHandler_, descriptor, completionHandler);
    }

/// Creates a new dynamic Metal library instance asynchronously.
///
/// - Parameters:
///   - library: A library from which this compiler creates the new a dynamic library
///   - completionHandler: A block Metal calls when it finishes the build task.
///
/// - Returns: A compiler task representing the asynchronous compilation task.
    newDynamicLibrary_completionHandler_ :: (self: *MTL4Compiler, library: *MTLLibrary, completionHandler: MTLNewDynamicLibraryCompletionHandler) -> *MTL4CompilerTask {
        func: #type (obj: *void, selector: *void, library: *MTLLibrary, completionHandler: MTLNewDynamicLibraryCompletionHandler) -> *MTL4CompilerTask #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newDynamicLibrary_completionHandler_, library, completionHandler);
    }

/// Creates a new dynamic library from the contents of a file at an URL location synchronously.
///
/// - Parameters:
///   - url: An URL referencing a file whose contents this compiler uses to build a dynamic library.
///   - completionHandler: A block Metal calls when it finishes the build task.
///
/// - Returns: a compiler task representing the asynchronous compilation task.
    newDynamicLibraryWithURL_completionHandler_ :: (self: *MTL4Compiler, url: *NSURL, completionHandler: MTLNewDynamicLibraryCompletionHandler) -> *MTL4CompilerTask {
        func: #type (obj: *void, selector: *void, url: *NSURL, completionHandler: MTLNewDynamicLibraryCompletionHandler) -> *MTL4CompilerTask #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newDynamicLibraryWithURL_completionHandler_, url, completionHandler);
    }

/// Creates a new compute pipeline state asynchronously.
///
/// - Parameters:
///   - descriptor: A compute pipeline state descriptor, describing the compute pipeline to create.
///   - compilerTaskOptions: A descriptor of the compilation itself, providing parameters that
///         influence execution of the compilation process.
///   - completionHandler: A block Metal calls when it finishes the build task.
///
/// - Returns: a compiler task representing the asynchronous compilation task.
    newComputePipelineStateWithDescriptor_compilerTaskOptions_completionHandler_ :: (self: *MTL4Compiler, descriptor: *MTL4ComputePipelineDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTLNewComputePipelineStateCompletionHandler) -> *MTL4CompilerTask {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4ComputePipelineDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTLNewComputePipelineStateCompletionHandler) -> *MTL4CompilerTask #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newComputePipelineStateWithDescriptor_compilerTaskOptions_completionHandler_, descriptor, compilerTaskOptions, completionHandler);
    }

/// Creates a new compute pipeline state asynchronously.
///
/// - Parameters:
///   - descriptor: A compute pipeline state descriptor, describing the compute pipeline to create.
///   - dynamicLinkingDescriptor: An optional parameter that provides additional configuration for linking the pipeline state object.
///   - compilerTaskOptions: A description of the compilation process itself, providing parameters that
///         influence execution of the compilation process.
///   - completionHandler: A block Metal calls when it finishes the build task.
///
/// - Returns: a compiler task representing the asynchronous compilation task.
    newComputePipelineStateWithDescriptor_dynamicLinkingDescriptor_compilerTaskOptions_completionHandler_ :: (self: *MTL4Compiler, descriptor: *MTL4ComputePipelineDescriptor, dynamicLinkingDescriptor: *MTL4PipelineStageDynamicLinkingDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTLNewComputePipelineStateCompletionHandler) -> *MTL4CompilerTask {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4ComputePipelineDescriptor, dynamicLinkingDescriptor: *MTL4PipelineStageDynamicLinkingDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTLNewComputePipelineStateCompletionHandler) -> *MTL4CompilerTask #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newComputePipelineStateWithDescriptor_dynamicLinkingDescriptor_compilerTaskOptions_completionHandler_, descriptor, dynamicLinkingDescriptor, compilerTaskOptions, completionHandler);
    }

/// Creates a new render pipeline state asynchronously.
///
/// Use this method to build any render pipeline type, including render, tile, and mesh render pipeline states.
/// The type of the descriptor you pass indicates the pipeline type this method builds.
///
/// Passing in a compute pipeline descriptor to the `descriptor` parameter produces an error.
///
/// - Parameters:
///   - descriptor: A render, tile, or mesh pipeline state descriptor that describes the pipeline to create.
///   - compilerTaskOptions: A description of the compilation process itself, providing parameters that
///         influence execution of the compilation process.
///   - completionHandler: A block Metal calls when it finishes the build task.
///
/// - Returns: a compiler task representing the asynchronous compilation task.
    newRenderPipelineStateWithDescriptor_compilerTaskOptions_completionHandler_ :: (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTLNewRenderPipelineStateCompletionHandler) -> *MTL4CompilerTask {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4PipelineDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTLNewRenderPipelineStateCompletionHandler) -> *MTL4CompilerTask #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithDescriptor_compilerTaskOptions_completionHandler_, descriptor, compilerTaskOptions, completionHandler);
    }

/// Creates a new render pipeline state asynchronously.
///
/// Use this method to build any render pipeline type, including render, tile, and mesh render pipeline states.
/// The type of the descriptor you pass indicates the pipeline type this method builds.
///
/// Passing in a compute pipeline descriptor to the `descriptor` parameter produces an error.
///
/// - Parameters:
///   - descriptor: A render, tile, or mesh pipeline state descriptor that describes the pipeline to create.
///   - dynamicLinkingDescriptor: An optional parameter that provides additional configuration for linking the pipeline state object.
///   - compilerTaskOptions: A description of the compilation process itself, providing parameters that
///         influence execution of the compilation process.
///   - completionHandler: A block Metal calls when it finishes the build task.
///
/// - Returns: a compiler task representing the asynchronous compilation task.
    newRenderPipelineStateWithDescriptor_dynamicLinkingDescriptor_compilerTaskOptions_completionHandler_ :: (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, dynamicLinkingDescriptor: *MTL4RenderPipelineDynamicLinkingDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTLNewRenderPipelineStateCompletionHandler) -> *MTL4CompilerTask {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4PipelineDescriptor, dynamicLinkingDescriptor: *MTL4RenderPipelineDynamicLinkingDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTLNewRenderPipelineStateCompletionHandler) -> *MTL4CompilerTask #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithDescriptor_dynamicLinkingDescriptor_compilerTaskOptions_completionHandler_, descriptor, dynamicLinkingDescriptor, compilerTaskOptions, completionHandler);
    }

/// Creates a new render pipeline state from another, previously unspecialized, pipeline state
///
/// Metal specializes the pipeline state with new state values the descriptor provides, observing the following rules:
/// * The compiler only updates properties that were originally specified as *unspecialized*. It doesn't modify other
/// already-specialized properties
/// * The compiler sets to their default behavior any unspecialized properties that your passed-in descriptor doesn't specialize
///
/// Additionally, there are some cases where the Metal can't specialize a pipeline:
/// * If the original pipeline state object doesn't have any unspecialized properties
/// * You can't re-specialize a previously specialized pipeline state object
///
/// - Parameters:
///   - descriptor: A render pipeline state descriptor or any type: default, tile, or mesh render pipeline descriptor.
///   - pipeline: A render pipeline state containing unspecialized substate.
///   - completionHandler: A block Metal calls when it finishes the build task.
///
/// - Returns: a compiler task representing the asynchronous compilation task.
///
    newRenderPipelineStateBySpecializationWithDescriptor_pipeline_completionHandler_ :: (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, pipeline: *MTLRenderPipelineState, completionHandler: MTLNewRenderPipelineStateCompletionHandler) -> *MTL4CompilerTask {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4PipelineDescriptor, pipeline: *MTLRenderPipelineState, completionHandler: MTLNewRenderPipelineStateCompletionHandler) -> *MTL4CompilerTask #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateBySpecializationWithDescriptor_pipeline_completionHandler_, descriptor, pipeline, completionHandler);
    }

/// Returns a new compiler task that asyncrhonously creates a binary version
/// of a GPU visible function or GPU intersection function.
///
/// - Parameters:
///   - descriptor: A configuration that tells the method which GPU function to
///   make into a binary function and which options to apply when compiling it.
///   - compilerTaskOptions: A configuration for the compiler task.
///   - completionHandler: A completetion handler that you provide, which the task calls
///   when it finishes compiling the binary function.
    newBinaryFunctionWithDescriptor_compilerTaskOptions_completionHandler_ :: (self: *MTL4Compiler, descriptor: *MTL4BinaryFunctionDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTL4NewBinaryFunctionCompletionHandler) -> *MTL4CompilerTask {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4BinaryFunctionDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTL4NewBinaryFunctionCompletionHandler) -> *MTL4CompilerTask #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newBinaryFunctionWithDescriptor_compilerTaskOptions_completionHandler_, descriptor, compilerTaskOptions, completionHandler);
    }

/// Creates a new ML pipeline state with descriptor.
///
/// - Parameters:
///   - descriptor: A machine learning pipeline state descriptor to use for creating the new pipeline state.
///   - error: An optional parameter into which Metal stores information in case of an error.
///
/// - Returns: A machine learning pipeline state if operation is successful, otherwise `nil`.
    newMachineLearningPipelineStateWithDescriptor_error_ :: (self: *MTL4Compiler, descriptor: *MTL4MachineLearningPipelineDescriptor, error: **NSError) -> *MTL4MachineLearningPipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4MachineLearningPipelineDescriptor, error: **NSError) -> *MTL4MachineLearningPipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newMachineLearningPipelineStateWithDescriptor_error_, descriptor, error);
    }

/// Creates a new machine learning pipeline state asynchronously.
///
/// - Parameters:
///   - descriptor: A machine learning pipeline state descriptor to use for creating the new pipeline state.
///   - completionHandler: A block Metal calls when it finishes the build task.
///
/// - Returns: a compiler task representing the asynchronous compilation task.
    newMachineLearningPipelineStateWithDescriptor_completionHandler_ :: (self: *MTL4Compiler, descriptor: *MTL4MachineLearningPipelineDescriptor, completionHandler: MTL4NewMachineLearningPipelineStateCompletionHandler) -> *MTL4CompilerTask {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4MachineLearningPipelineDescriptor, completionHandler: MTL4NewMachineLearningPipelineStateCompletionHandler) -> *MTL4CompilerTask #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newMachineLearningPipelineStateWithDescriptor_completionHandler_, descriptor, completionHandler);
    }

/// Returns the device that this compiler belongs to.
    device :: (self: *MTL4Compiler) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

/// Returns the optional label you specify at creation time.
    label :: (self: *MTL4Compiler) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

/// Returns the pipeline data set serializer into which this compiler stores data for all pipelines it creates.
    pipelineDataSetSerializer :: (self: *MTL4Compiler) -> *MTL4PipelineDataSetSerializer {
        func: #type (obj: *void, selector: *void) -> *MTL4PipelineDataSetSerializer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pipelineDataSetSerializer);
    }

}

/// Represents an opaque, driver-controlled section of memory that can store GPU counter data.
///
/// The data instances that this type stores correspond to the ``MTL4CounterHeapType`` heap type that you assign at creation time.
MTL4CounterHeap :: struct #type_info_no_size_complaint {
/// Resolves heap data on the CPU timeline.
///
/// This method resolves heap data in the CPU timeline. Your app needs to ensure the GPU work has completed in order to
/// retrieve the data correctly. You can alternatively resolve the heap data in the GPU timeline by calling
/// ``MTL4CommandBuffer/resolveCounterHeap:withRange:intoBuffer:waitFence:updateFence:``.
///
/// - Note: When resolving counters in the CPU timeline, signaling an instance of ``MTLSharedEvent`` after any workloads
///  write counters (and waiting on that signal on the CPU) is sufficient to ensure synchronization.
///
/// - Parameter range: The range in the heap to resolve.
/// - Returns a newly allocated autoreleased NSData containing tightly packed resolved heap counter values.
    resolveCounterRange_ :: (self: *MTL4CounterHeap, range: NSRange) -> *NSData {
        func: #type (obj: *void, selector: *void, range: NSRange) -> *NSData #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resolveCounterRange_, range);
    }

/// Invalidates a range of entries in this counter heap.
///
/// The effect of this call is immediate on the CPU timeline. You are responsible for ensuring that this counter heap is not currently in use on the GPU.
///
/// - Note: Invalidated entries produce 0 when resolved.
///
/// - Parameters:
///   - range: A heap index range to invalidate.
    invalidateCounterRange_ :: (self: *MTL4CounterHeap, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.invalidateCounterRange_, range);
    }

/// Assigns a label for later inspection or visualization.
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

/// Queries the number of entries in the heap.
    count :: (self: *MTL4CounterHeap) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.count);
    }

/// Queries the type of the heap.
    type :: (self: *MTL4CounterHeap) -> MTL4CounterHeapType {
        func: #type (obj: *void, selector: *void) -> MTL4CounterHeapType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.type);
    }

}

/*!
 @protocol MTLDevice
 @abstract MTLDevice represents a processor capable of data parallel computations
 */
MTLDevice :: struct #type_info_no_size_complaint {
/*!
 @method newLogStateWithDescriptor
 @abstract This method will create a new MTLLogState.
 */
    newLogStateWithDescriptor_error_ :: (self: *MTLDevice, descriptor: *MTLLogStateDescriptor, error: **NSError) -> *MTLLogState {
        func: #type (obj: *void, selector: *void, descriptor: *MTLLogStateDescriptor, error: **NSError) -> *MTLLogState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newLogStateWithDescriptor_error_, descriptor, error);
    }

/*!
 @method newCommandQueue
 @brief Create and return a new command queue.   Command Queues created via this method will only allow up to 64 non-completed command buffers.
 @return The new command queue object
 */
    newCommandQueue :: (self: *MTLDevice) -> *MTLCommandQueue {
        func: #type (obj: *void, selector: *void) -> *MTLCommandQueue #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newCommandQueue);
    }

/*!
 @method newCommandQueueWithMaxCommandBufferCount
 @brief Create and return a new command queue with a given upper bound on non-completed command buffers.
 @return The new command queue object
 */
    newCommandQueueWithMaxCommandBufferCount_ :: (self: *MTLDevice, maxCommandBufferCount: NSUInteger) -> *MTLCommandQueue {
        func: #type (obj: *void, selector: *void, maxCommandBufferCount: NSUInteger) -> *MTLCommandQueue #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newCommandQueueWithMaxCommandBufferCount_, maxCommandBufferCount);
    }

/*!
 @method newCommandQueueWithDescriptor:
 @brief Create a MTLCommandQueue according to MTLCommandQueueDescriptor.
 */
    newCommandQueueWithDescriptor_ :: (self: *MTLDevice, descriptor: *MTLCommandQueueDescriptor) -> *MTLCommandQueue {
        func: #type (obj: *void, selector: *void, descriptor: *MTLCommandQueueDescriptor) -> *MTLCommandQueue #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newCommandQueueWithDescriptor_, descriptor);
    }

/*!
 @method heapTextureSizeAndAlignWithDescriptor:
 @abstract Determine the byte size of textures when sub-allocated from a heap.
 @discussion This method can be used to help determine the required heap size.
 */
    heapTextureSizeAndAlignWithDescriptor_ :: (self: *MTLDevice, desc: *MTLTextureDescriptor) -> MTLSizeAndAlign {
        func: #type (obj: *void, selector: *void, desc: *MTLTextureDescriptor) -> MTLSizeAndAlign #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.heapTextureSizeAndAlignWithDescriptor_, desc);
    }

/*!
 @method heapBufferSizeAndAlignWithLength:options:
 @abstract Determine the byte size of buffers when sub-allocated from a heap.
 @discussion This method can be used to help determine the required heap size.
 */
    heapBufferSizeAndAlignWithLength_options_ :: (self: *MTLDevice, length: NSUInteger, options: MTLResourceOptions) -> MTLSizeAndAlign {
        func: #type (obj: *void, selector: *void, length: NSUInteger, options: MTLResourceOptions) -> MTLSizeAndAlign #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.heapBufferSizeAndAlignWithLength_options_, length, options);
    }

/*!
 @method newHeapWithDescriptor:
 @abstract Create a new heap with the given descriptor.
 */
    newHeapWithDescriptor_ :: (self: *MTLDevice, descriptor: *MTLHeapDescriptor) -> *MTLHeap {
        func: #type (obj: *void, selector: *void, descriptor: *MTLHeapDescriptor) -> *MTLHeap #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newHeapWithDescriptor_, descriptor);
    }

/*!
 @method newBufferWithLength:options:
 @brief Create a buffer by allocating new memory.
 */
    newBufferWithLength_options_ :: (self: *MTLDevice, length: NSUInteger, options: MTLResourceOptions) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void, length: NSUInteger, options: MTLResourceOptions) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newBufferWithLength_options_, length, options);
    }

/*!
 @method newBufferWithBytes:length:options:
 @brief Create a buffer by allocating new memory and specifing the initial contents to be copied into it.
 */
    newBufferWithBytes_length_options_ :: (self: *MTLDevice, pointer: *void, length: NSUInteger, options: MTLResourceOptions) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void, pointer: *void, length: NSUInteger, options: MTLResourceOptions) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newBufferWithBytes_length_options_, pointer, length, options);
    }

/*!
 @method newBufferWithBytesNoCopy:length:options:deallocator:
 @brief Create a buffer by wrapping an existing part of the address space.
 */
    newBufferWithBytesNoCopy_length_options_deallocator_ :: (self: *MTLDevice, pointer: *void, length: NSUInteger, options: MTLResourceOptions, deallocator: #type (unknown_0: *void, unknown_1: NSUInteger) -> void #c_call) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void, pointer: *void, length: NSUInteger, options: MTLResourceOptions, deallocator: #type (unknown_0: *void, unknown_1: NSUInteger) -> void #c_call) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newBufferWithBytesNoCopy_length_options_deallocator_, pointer, length, options, deallocator);
    }

/*!
 @method newDepthStencilStateWithDescriptor:
 @brief Create a depth/stencil test state object.
 */
    newDepthStencilStateWithDescriptor_ :: (self: *MTLDevice, descriptor: *MTLDepthStencilDescriptor) -> *MTLDepthStencilState {
        func: #type (obj: *void, selector: *void, descriptor: *MTLDepthStencilDescriptor) -> *MTLDepthStencilState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newDepthStencilStateWithDescriptor_, descriptor);
    }

/*!
 @method newTextureWithDescriptor:
 @abstract Allocate a new texture with privately owned storage.
 */
    newTextureWithDescriptor_ :: (self: *MTLDevice, descriptor: *MTLTextureDescriptor) -> *MTLTexture {
        func: #type (obj: *void, selector: *void, descriptor: *MTLTextureDescriptor) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newTextureWithDescriptor_, descriptor);
    }

/*!
 @method newTextureWithDescriptor:iosurface:plane
 @abstract Create a new texture from an IOSurface.
 @param descriptor A description of the properties for the new texture.
 @param iosurface The IOSurface to use as storage for the new texture.
 @param plane The plane within the IOSurface to use.
 @return A new texture object.
 */
    newTextureWithDescriptor_iosurface_plane_ :: (self: *MTLDevice, descriptor: *MTLTextureDescriptor, iosurface: IOSurfaceRef, plane: NSUInteger) -> *MTLTexture {
        func: #type (obj: *void, selector: *void, descriptor: *MTLTextureDescriptor, iosurface: IOSurfaceRef, plane: NSUInteger) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newTextureWithDescriptor_iosurface_plane_, descriptor, iosurface, plane);
    }

/*!
 @method newSharedTextureWithDescriptor
 @abstract Create a new texture that can be shared across process boundaries.
 @discussion This texture can be shared between process boundaries
 but not between different GPUs, by passing its MTLSharedTextureHandle.
 @param descriptor A description of the properties for the new texture.
 @return A new texture object.
 */
    newSharedTextureWithDescriptor_ :: (self: *MTLDevice, descriptor: *MTLTextureDescriptor) -> *MTLTexture {
        func: #type (obj: *void, selector: *void, descriptor: *MTLTextureDescriptor) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newSharedTextureWithDescriptor_, descriptor);
    }

/*!
 @method newSharedTextureWithHandle
 @abstract Recreate shared texture from received texture handle.
 @discussion This texture was shared between process boundaries by other
 process using MTLSharedTextureHandle. Current process will now share
 it with other processes and will be able to interact with it (but still
 in scope of the same GPUs).
 @param sharedHandle Handle to shared texture in this process space.
 @return A new texture object.
 */
    newSharedTextureWithHandle_ :: (self: *MTLDevice, sharedHandle: *MTLSharedTextureHandle) -> *MTLTexture {
        func: #type (obj: *void, selector: *void, sharedHandle: *MTLSharedTextureHandle) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newSharedTextureWithHandle_, sharedHandle);
    }

/*!
 @method newSamplerStateWithDescriptor:
 @abstract Create a new sampler.
*/
    newSamplerStateWithDescriptor_ :: (self: *MTLDevice, descriptor: *MTLSamplerDescriptor) -> *MTLSamplerState {
        func: #type (obj: *void, selector: *void, descriptor: *MTLSamplerDescriptor) -> *MTLSamplerState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newSamplerStateWithDescriptor_, descriptor);
    }

/*!
 @method newDefaultLibrary
 @abstract Returns the default library for the main bundle.
 @discussion use newDefaultLibraryWithBundle:error: to get an NSError in case of failure.
 */
    newDefaultLibrary :: (self: *MTLDevice) -> *MTLLibrary {
        func: #type (obj: *void, selector: *void) -> *MTLLibrary #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newDefaultLibrary);
    }

/*
 @method newDefaultLibraryWithBundle:error:
 @abstract Returns the default library for a given bundle.
 @return A pointer to the library, nil if an error occurs.
*/
    newDefaultLibraryWithBundle_error_ :: (self: *MTLDevice, bundle: *NSBundle, error: **NSError) -> *MTLLibrary {
        func: #type (obj: *void, selector: *void, bundle: *NSBundle, error: **NSError) -> *MTLLibrary #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newDefaultLibraryWithBundle_error_, bundle, error);
    }

/*!
 @method newLibraryWithFile:
 @abstract Load a MTLLibrary from a metallib file.
 */
    newLibraryWithFile_error_ :: (self: *MTLDevice, filepath: *NSString, error: **NSError) -> *MTLLibrary {
        func: #type (obj: *void, selector: *void, filepath: *NSString, error: **NSError) -> *MTLLibrary #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newLibraryWithFile_error_, filepath, error);
    }

/*!
 @method newLibraryWithURL:
 @abstract Load a MTLLibrary from a metallib file.
 */
    newLibraryWithURL_error_ :: (self: *MTLDevice, url: *NSURL, error: **NSError) -> *MTLLibrary {
        func: #type (obj: *void, selector: *void, url: *NSURL, error: **NSError) -> *MTLLibrary #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newLibraryWithURL_error_, url, error);
    }

/*!
 @method newLibraryWithData:
 @abstract Load a MTLLibrary from a dispatch_data_t
 @param data A metallib file already loaded as data in the form of dispatch_data_t.
 @param error An error if we fail to open the metallib data.
 */
    newLibraryWithData_error_ :: (self: *MTLDevice, data: dispatch_data_t, error: **NSError) -> *MTLLibrary {
        func: #type (obj: *void, selector: *void, data: dispatch_data_t, error: **NSError) -> *MTLLibrary #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newLibraryWithData_error_, data, error);
    }

/*!
 @method newLibraryWithSource:options:error:
 @abstract Load a MTLLibrary from source.
 */
    newLibraryWithSource_options_error_ :: (self: *MTLDevice, source: *NSString, options: *MTLCompileOptions, error: **NSError) -> *MTLLibrary {
        func: #type (obj: *void, selector: *void, source: *NSString, options: *MTLCompileOptions, error: **NSError) -> *MTLLibrary #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newLibraryWithSource_options_error_, source, options, error);
    }

/*!
 @method newLibraryWithSource:options:completionHandler:
 @abstract Load a MTLLibrary from source.
 */
    newLibraryWithSource_options_completionHandler_ :: (self: *MTLDevice, source: *NSString, options: *MTLCompileOptions, completionHandler: MTLNewLibraryCompletionHandler) -> void {
        func: #type (obj: *void, selector: *void, source: *NSString, options: *MTLCompileOptions, completionHandler: MTLNewLibraryCompletionHandler) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newLibraryWithSource_options_completionHandler_, source, options, completionHandler);
    }

/*!
 @method newLibraryWithStitchedDescriptor:error:
 @abstract Returns a library generated using the graphs in the descriptor.
 */
    newLibraryWithStitchedDescriptor_error_ :: (self: *MTLDevice, descriptor: *MTLStitchedLibraryDescriptor, error: **NSError) -> *MTLLibrary {
        func: #type (obj: *void, selector: *void, descriptor: *MTLStitchedLibraryDescriptor, error: **NSError) -> *MTLLibrary #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newLibraryWithStitchedDescriptor_error_, descriptor, error);
    }

/*!
 @method newLibraryWithStitchedDescriptor:completionHandler:
 @abstract Generates a new library using the graphs in the descriptor.
 */
    newLibraryWithStitchedDescriptor_completionHandler_ :: (self: *MTLDevice, descriptor: *MTLStitchedLibraryDescriptor, completionHandler: MTLNewLibraryCompletionHandler) -> void {
        func: #type (obj: *void, selector: *void, descriptor: *MTLStitchedLibraryDescriptor, completionHandler: MTLNewLibraryCompletionHandler) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newLibraryWithStitchedDescriptor_completionHandler_, descriptor, completionHandler);
    }

/*!
 @method newRenderPipelineStateWithDescriptor:error:
 @abstract Create and compile a new MTLRenderPipelineState object synchronously.
 */
    newRenderPipelineStateWithDescriptor_error_ :: (self: *MTLDevice, descriptor: *MTLRenderPipelineDescriptor, error: **NSError) -> *MTLRenderPipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTLRenderPipelineDescriptor, error: **NSError) -> *MTLRenderPipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithDescriptor_error_, descriptor, error);
    }

/*!
 @method newRenderPipelineStateWithDescriptor:options:reflection:error:
 @abstract Create and compile a new MTLRenderPipelineState object synchronously and returns additional reflection information.
 */
    newRenderPipelineStateWithDescriptor_options_reflection_error_ :: (self: *MTLDevice, descriptor: *MTLRenderPipelineDescriptor, options: MTLPipelineOption, reflection: **MTLRenderPipelineReflection, error: **NSError) -> *MTLRenderPipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTLRenderPipelineDescriptor, options: MTLPipelineOption, reflection: **MTLRenderPipelineReflection, error: **NSError) -> *MTLRenderPipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithDescriptor_options_reflection_error_, descriptor, options, reflection, error);
    }

/*!
 @method newRenderPipelineState:completionHandler:
 @abstract Create and compile a new MTLRenderPipelineState object asynchronously.
 */
    newRenderPipelineStateWithDescriptor_completionHandler_ :: (self: *MTLDevice, descriptor: *MTLRenderPipelineDescriptor, completionHandler: MTLNewRenderPipelineStateCompletionHandler) -> void {
        func: #type (obj: *void, selector: *void, descriptor: *MTLRenderPipelineDescriptor, completionHandler: MTLNewRenderPipelineStateCompletionHandler) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithDescriptor_completionHandler_, descriptor, completionHandler);
    }

/*!
 @method newRenderPipelineState:options:completionHandler:
 @abstract Create and compile a new MTLRenderPipelineState object asynchronously and returns additional reflection information
 */
    newRenderPipelineStateWithDescriptor_options_completionHandler_ :: (self: *MTLDevice, descriptor: *MTLRenderPipelineDescriptor, options: MTLPipelineOption, completionHandler: MTLNewRenderPipelineStateWithReflectionCompletionHandler) -> void {
        func: #type (obj: *void, selector: *void, descriptor: *MTLRenderPipelineDescriptor, options: MTLPipelineOption, completionHandler: MTLNewRenderPipelineStateWithReflectionCompletionHandler) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithDescriptor_options_completionHandler_, descriptor, options, completionHandler);
    }

/*!
 @method newComputePipelineStateWithDescriptor:error:
 @abstract Create and compile a new MTLComputePipelineState object synchronously.
 */
    newComputePipelineStateWithFunction_error_ :: (self: *MTLDevice, computeFunction: *MTLFunction, error: **NSError) -> *MTLComputePipelineState {
        func: #type (obj: *void, selector: *void, computeFunction: *MTLFunction, error: **NSError) -> *MTLComputePipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newComputePipelineStateWithFunction_error_, computeFunction, error);
    }

/*!
 @method newComputePipelineStateWithDescriptor:options:reflection:error:
 @abstract Create and compile a new MTLComputePipelineState object synchronously.
 */
    newComputePipelineStateWithFunction_options_reflection_error_ :: (self: *MTLDevice, computeFunction: *MTLFunction, options: MTLPipelineOption, reflection: **MTLComputePipelineReflection, error: **NSError) -> *MTLComputePipelineState {
        func: #type (obj: *void, selector: *void, computeFunction: *MTLFunction, options: MTLPipelineOption, reflection: **MTLComputePipelineReflection, error: **NSError) -> *MTLComputePipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newComputePipelineStateWithFunction_options_reflection_error_, computeFunction, options, reflection, error);
    }

/*!
 @method newComputePipelineStateWithDescriptor:completionHandler:
 @abstract Create and compile a new MTLComputePipelineState object asynchronously.
 */
    newComputePipelineStateWithFunction_completionHandler_ :: (self: *MTLDevice, computeFunction: *MTLFunction, completionHandler: MTLNewComputePipelineStateCompletionHandler) -> void {
        func: #type (obj: *void, selector: *void, computeFunction: *MTLFunction, completionHandler: MTLNewComputePipelineStateCompletionHandler) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newComputePipelineStateWithFunction_completionHandler_, computeFunction, completionHandler);
    }

/*!
 @method newComputePipelineStateWithDescriptor:options:completionHandler:
 @abstract Create and compile a new MTLComputePipelineState object asynchronously.
 */
    newComputePipelineStateWithFunction_options_completionHandler_ :: (self: *MTLDevice, computeFunction: *MTLFunction, options: MTLPipelineOption, completionHandler: MTLNewComputePipelineStateWithReflectionCompletionHandler) -> void {
        func: #type (obj: *void, selector: *void, computeFunction: *MTLFunction, options: MTLPipelineOption, completionHandler: MTLNewComputePipelineStateWithReflectionCompletionHandler) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newComputePipelineStateWithFunction_options_completionHandler_, computeFunction, options, completionHandler);
    }

/*!
 @method newComputePipelineStateWithDescriptor:options:reflection:error:
 @abstract Create and compile a new MTLComputePipelineState object synchronously.
 */
    newComputePipelineStateWithDescriptor_options_reflection_error_ :: (self: *MTLDevice, descriptor: *MTLComputePipelineDescriptor, options: MTLPipelineOption, reflection: **MTLComputePipelineReflection, error: **NSError) -> *MTLComputePipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTLComputePipelineDescriptor, options: MTLPipelineOption, reflection: **MTLComputePipelineReflection, error: **NSError) -> *MTLComputePipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newComputePipelineStateWithDescriptor_options_reflection_error_, descriptor, options, reflection, error);
    }

/*!
 @method newComputePipelineStateWithDescriptor:options:completionHandler:
 @abstract Create and compile a new MTLComputePipelineState object asynchronously.
 */
    newComputePipelineStateWithDescriptor_options_completionHandler_ :: (self: *MTLDevice, descriptor: *MTLComputePipelineDescriptor, options: MTLPipelineOption, completionHandler: MTLNewComputePipelineStateWithReflectionCompletionHandler) -> void {
        func: #type (obj: *void, selector: *void, descriptor: *MTLComputePipelineDescriptor, options: MTLPipelineOption, completionHandler: MTLNewComputePipelineStateWithReflectionCompletionHandler) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newComputePipelineStateWithDescriptor_options_completionHandler_, descriptor, options, completionHandler);
    }

/*!
 @method newFence
 @abstract Create a new MTLFence object
 */
    newFence :: (self: *MTLDevice) -> *MTLFence {
        func: #type (obj: *void, selector: *void) -> *MTLFence #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newFence);
    }

/*!
 @method supportsFeatureSet:
 @abstract Returns TRUE if the feature set is supported by this MTLDevice.
 */
    supportsFeatureSet_ :: (self: *MTLDevice, featureSet: MTLFeatureSet) -> BOOL {
        func: #type (obj: *void, selector: *void, featureSet: MTLFeatureSet) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsFeatureSet_, featureSet);
    }

/*!
 @method supportsFamily:
 @abstract Returns TRUE if the GPU Family is supported by this MTLDevice.
 */
    supportsFamily_ :: (self: *MTLDevice, gpuFamily: MTLGPUFamily) -> BOOL {
        func: #type (obj: *void, selector: *void, gpuFamily: MTLGPUFamily) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsFamily_, gpuFamily);
    }

/*!
 @method supportsTextureSampleCount:
 @brief Query device if it support textures with a given sampleCount.
 @return BOOL value. If YES, device supports the given sampleCount for textures. If NO, device does not support the given sampleCount.
 */
    supportsTextureSampleCount_ :: (self: *MTLDevice, sampleCount: NSUInteger) -> BOOL {
        func: #type (obj: *void, selector: *void, sampleCount: NSUInteger) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsTextureSampleCount_, sampleCount);
    }

/*!
 @method minimumLinearTextureAlignmentForPixelFormat:
 @abstract Returns the minimum alignment required for offset and rowBytes when creating a linear texture. An error is thrown for queries with invalid pixel formats (depth, stencil, or compressed formats).
 */
    minimumLinearTextureAlignmentForPixelFormat_ :: (self: *MTLDevice, format: MTLPixelFormat) -> NSUInteger {
        func: #type (obj: *void, selector: *void, format: MTLPixelFormat) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.minimumLinearTextureAlignmentForPixelFormat_, format);
    }

/*!
 @method minimumTextureBufferAlignmentForPixelFormat:
 @abstract Returns the minimum alignment required for offset and rowBytes when creating a texture buffer from a buffer.
 */
    minimumTextureBufferAlignmentForPixelFormat_ :: (self: *MTLDevice, format: MTLPixelFormat) -> NSUInteger {
        func: #type (obj: *void, selector: *void, format: MTLPixelFormat) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.minimumTextureBufferAlignmentForPixelFormat_, format);
    }

/*!
 @method newRenderPipelineStateWithTileDescriptor:options:reflection:error:
 @abstract Create and compile a new MTLRenderPipelineState object synchronously given a MTLTileRenderPipelineDescriptor.
 */
    newRenderPipelineStateWithTileDescriptor_options_reflection_error_ :: (self: *MTLDevice, descriptor: *MTLTileRenderPipelineDescriptor, options: MTLPipelineOption, reflection: **MTLRenderPipelineReflection, error: **NSError) -> *MTLRenderPipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTLTileRenderPipelineDescriptor, options: MTLPipelineOption, reflection: **MTLRenderPipelineReflection, error: **NSError) -> *MTLRenderPipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithTileDescriptor_options_reflection_error_, descriptor, options, reflection, error);
    }

/*!
 @method newRenderPipelineStateWithTileDescriptor:options:completionHandler:
 @abstract Create and compile a new MTLRenderPipelineState object asynchronously given a MTLTileRenderPipelineDescriptor.
 */
    newRenderPipelineStateWithTileDescriptor_options_completionHandler_ :: (self: *MTLDevice, descriptor: *MTLTileRenderPipelineDescriptor, options: MTLPipelineOption, completionHandler: MTLNewRenderPipelineStateWithReflectionCompletionHandler) -> void {
        func: #type (obj: *void, selector: *void, descriptor: *MTLTileRenderPipelineDescriptor, options: MTLPipelineOption, completionHandler: MTLNewRenderPipelineStateWithReflectionCompletionHandler) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithTileDescriptor_options_completionHandler_, descriptor, options, completionHandler);
    }

/*!
 @method newRenderPipelineStateWithMeshDescriptor:options:reflection:error:
 @abstract Create and compile a new MTLRenderPipelineState object synchronously given a MTLMeshRenderPipelineDescriptor.
 */
    newRenderPipelineStateWithMeshDescriptor_options_reflection_error_ :: (self: *MTLDevice, descriptor: *MTLMeshRenderPipelineDescriptor, options: MTLPipelineOption, reflection: **MTLRenderPipelineReflection, error: **NSError) -> *MTLRenderPipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTLMeshRenderPipelineDescriptor, options: MTLPipelineOption, reflection: **MTLRenderPipelineReflection, error: **NSError) -> *MTLRenderPipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithMeshDescriptor_options_reflection_error_, descriptor, options, reflection, error);
    }

/*!
 @method newRenderPipelineStateWithMeshDescriptor:options:completionHandler:
 @abstract Create and compile a new MTLRenderPipelineState object asynchronously given a MTLMeshRenderPipelineDescriptor.
 */
    newRenderPipelineStateWithMeshDescriptor_options_completionHandler_ :: (self: *MTLDevice, descriptor: *MTLMeshRenderPipelineDescriptor, options: MTLPipelineOption, completionHandler: MTLNewRenderPipelineStateWithReflectionCompletionHandler) -> void {
        func: #type (obj: *void, selector: *void, descriptor: *MTLMeshRenderPipelineDescriptor, options: MTLPipelineOption, completionHandler: MTLNewRenderPipelineStateWithReflectionCompletionHandler) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithMeshDescriptor_options_completionHandler_, descriptor, options, completionHandler);
    }

/*!
 @method getDefaultSamplePositions:count:
 @abstract Retrieve the default sample positions.
 @param positions The destination array for default sample position data.
 @param count Specifies the sample count for which to retrieve the default positions, the length of the positions array, and must be set to a valid sample count.
 */
    getDefaultSamplePositions_count_ :: (self: *MTLDevice, positions: *MTLSamplePosition, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, positions: *MTLSamplePosition, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.getDefaultSamplePositions_count_, positions, count);
    }

/*!
 * @method newArgumentEncoderWithArguments:count:
 * @abstract Creates an argument encoder for an array of argument descriptors which will be encoded sequentially.
 */
    newArgumentEncoderWithArguments_ :: (self: *MTLDevice, arguments: *NSArray(*MTLArgumentDescriptor)) -> *MTLArgumentEncoder {
        func: #type (obj: *void, selector: *void, arguments: *NSArray(*MTLArgumentDescriptor)) -> *MTLArgumentEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newArgumentEncoderWithArguments_, arguments);
    }

/*!
 @method supportsRasterizationRateMapWithLayerCount:
 @abstract Query device for variable rasterization rate support with the given number of layers.
 @param layerCount The number of layers for which to query device support.
 @return YES if the device supports creation of rendering using a MTLRasterizationRateMap with the given number of layers.
 */
    supportsRasterizationRateMapWithLayerCount_ :: (self: *MTLDevice, layerCount: NSUInteger) -> BOOL {
        func: #type (obj: *void, selector: *void, layerCount: NSUInteger) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsRasterizationRateMapWithLayerCount_, layerCount);
    }

/*!
 @method newRasterizationRateMapWithDescriptor:
 @abstract Creates a new variable rasterization rate map with the given descriptor.
 @discussion If '[self supportsRasterizationRateMapWithLayerCount:descriptor.layerCount]' returns NO, or descriptor.screenSize describes an empty region, the result will always be nil.
 @return A MTLRasterizationRateMap instance that can be used for rendering on this MTLDevice, or nil if the device does not support the combination of parameters stored in the descriptor.
 */
    newRasterizationRateMapWithDescriptor_ :: (self: *MTLDevice, descriptor: *MTLRasterizationRateMapDescriptor) -> *MTLRasterizationRateMap {
        func: #type (obj: *void, selector: *void, descriptor: *MTLRasterizationRateMapDescriptor) -> *MTLRasterizationRateMap #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRasterizationRateMapWithDescriptor_, descriptor);
    }

/*!
 * @method newIndirectCommandBufferWithDescriptor:maxCommandCount:options
 * @abstract Creates a new indirect command buffer with the given descriptor and count.
 * @param descriptor The descriptor encodes the maximum logical stride of each command.
 * @param maxCount The maximum number of commands that this buffer can contain.
 * @param options The options for the indirect command buffer.
 * @discussion The returned buffer can be safely executed without first encoding into (but is wasteful).
 */
    newIndirectCommandBufferWithDescriptor_maxCommandCount_options_ :: (self: *MTLDevice, descriptor: *MTLIndirectCommandBufferDescriptor, maxCount: NSUInteger, options: MTLResourceOptions) -> *MTLIndirectCommandBuffer {
        func: #type (obj: *void, selector: *void, descriptor: *MTLIndirectCommandBufferDescriptor, maxCount: NSUInteger, options: MTLResourceOptions) -> *MTLIndirectCommandBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newIndirectCommandBufferWithDescriptor_maxCommandCount_options_, descriptor, maxCount, options);
    }

/*!
 @method newEvent
 @abstract Returns a new single-device non-shareable Metal event object
*/
    newEvent :: (self: *MTLDevice) -> *MTLEvent {
        func: #type (obj: *void, selector: *void) -> *MTLEvent #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newEvent);
    }

/*!
 @method newSharedEvent
 @abstract Returns a shareable multi-device event.
 */
    newSharedEvent :: (self: *MTLDevice) -> *MTLSharedEvent {
        func: #type (obj: *void, selector: *void) -> *MTLSharedEvent #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newSharedEvent);
    }

/*!
 @method newSharedEventWithHandle
 @abstract Creates a shareable multi-device event from an existing shared event handle.
*/
    newSharedEventWithHandle_ :: (self: *MTLDevice, sharedEventHandle: *MTLSharedEventHandle) -> *MTLSharedEvent {
        func: #type (obj: *void, selector: *void, sharedEventHandle: *MTLSharedEventHandle) -> *MTLSharedEvent #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newSharedEventWithHandle_, sharedEventHandle);
    }

/*!
 * @method newIOHandleWithURL:url:error:
 * @abstract Create and return a handle that points to a raw file on disk. This object can be used by
 * MTLIOCommandBuffer load commands to source data for MTLResources. If the creation
 * of the handle fails the return value will be nil and the optional error if passed in will be non-nil
 * with details of the error.
 */
    newIOHandleWithURL_error_ :: (self: *MTLDevice, url: *NSURL, error: **NSError) -> *MTLIOFileHandle {
        func: #type (obj: *void, selector: *void, url: *NSURL, error: **NSError) -> *MTLIOFileHandle #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newIOHandleWithURL_error_, url, error);
    }

/*!
 * @method newIOCommandQueueWithDescriptor:descriptor:error:
 * @abstract Create and return an IO queue. If the creation
 * of the queue fails the return value will be nil and the optional error if passed in will be non-nil
 * with details of the error.
 */
    newIOCommandQueueWithDescriptor_error_ :: (self: *MTLDevice, descriptor: *MTLIOCommandQueueDescriptor, error: **NSError) -> *MTLIOCommandQueue {
        func: #type (obj: *void, selector: *void, descriptor: *MTLIOCommandQueueDescriptor, error: **NSError) -> *MTLIOCommandQueue #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newIOCommandQueueWithDescriptor_error_, descriptor, error);
    }

/*!
 * @method newIOHandleWithURL:url:compressionMethod:error:
 * @abstract Create and return a handle that points to a compressed file on disk (a file that was
 * created with MTLIOCompressionContext). This object can be used by
 * MTLIOCommandBuffer load commands to source data for MTLResources. If the creation
 * of the handle fails the return value will be nil and the optional error if passed in will be non-nil
 * with details of the error.
 */
    newIOHandleWithURL_compressionMethod_error_ :: (self: *MTLDevice, url: *NSURL, compressionMethod: MTLIOCompressionMethod, error: **NSError) -> *MTLIOFileHandle {
        func: #type (obj: *void, selector: *void, url: *NSURL, compressionMethod: MTLIOCompressionMethod, error: **NSError) -> *MTLIOFileHandle #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newIOHandleWithURL_compressionMethod_error_, url, compressionMethod, error);
    }

/*!
 * @method newIOFileHandleWithURL:error:
 * @abstract Create and return a handle that points to a raw file on disk. This object can be used by
 * MTLIOCommandBuffer load commands to source data for MTLResources. If the creation
 * of the handle fails the return value will be nil and the optional error if passed in will be non-nil
 * with details of the error.
 */
    newIOFileHandleWithURL_error_ :: (self: *MTLDevice, url: *NSURL, error: **NSError) -> *MTLIOFileHandle {
        func: #type (obj: *void, selector: *void, url: *NSURL, error: **NSError) -> *MTLIOFileHandle #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newIOFileHandleWithURL_error_, url, error);
    }

/*!
 * @method newIOFileHandleWithURL:compressionMethod:error:
 * @abstract Create and return a handle that points to a compressed file on disk (a file that was
 * created with MTLIOCompressionContext). This object can be used by
 * MTLIOCommandBuffer load commands to source data for MTLResources. If the creation
 * of the handle fails the return value will be nil and the optional error if passed in will be non-nil
 * with details of the error.
 */
    newIOFileHandleWithURL_compressionMethod_error_ :: (self: *MTLDevice, url: *NSURL, compressionMethod: MTLIOCompressionMethod, error: **NSError) -> *MTLIOFileHandle {
        func: #type (obj: *void, selector: *void, url: *NSURL, compressionMethod: MTLIOCompressionMethod, error: **NSError) -> *MTLIOFileHandle #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newIOFileHandleWithURL_compressionMethod_error_, url, compressionMethod, error);
    }

/*!
 * @method sparseTileSizeWithTextureType:pixelFormat:sampleCount:
 * @abstract Returns tile size for sparse texture with given type, pixel format and sample count.
 */
    sparseTileSizeWithTextureType_pixelFormat_sampleCount_ :: (self: *MTLDevice, textureType: MTLTextureType, pixelFormat: MTLPixelFormat, sampleCount: NSUInteger) -> MTLSize {
        func: #type (obj: *void, selector: *void, textureType: MTLTextureType, pixelFormat: MTLPixelFormat, sampleCount: NSUInteger) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sparseTileSizeWithTextureType_pixelFormat_sampleCount_, textureType, pixelFormat, sampleCount);
    }

/*!
 * @method convertSparsePixelRegions:toTileRegions:withTileSize:alignmentMode:numRegions:
 * @abstract Converts regions in pixels to regions in sparse tiles using specified alignment mode.
   Tile size can be obtained from tileSizeWithTextureType:pixelFormat:sampleCount: method.
 */
    convertSparsePixelRegions_toTileRegions_withTileSize_alignmentMode_numRegions_ :: (self: *MTLDevice, pixelRegions: *MTLRegion, tileRegions: *MTLRegion, tileSize: MTLSize, mode: MTLSparseTextureRegionAlignmentMode, numRegions: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, pixelRegions: *MTLRegion, tileRegions: *MTLRegion, tileSize: MTLSize, mode: MTLSparseTextureRegionAlignmentMode, numRegions: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.convertSparsePixelRegions_toTileRegions_withTileSize_alignmentMode_numRegions_, pixelRegions, tileRegions, tileSize, mode, numRegions);
    }

/*!
 * @method convertSparseTileRegions:toPixelRegions:withTileSize:numRegions:
 * @abstract Convertes region in sparse tiles to region in pixels
   Tile size can be obtained from tileSizeWithTextureType:pixelFormat:sampleCount: method.
 */
    convertSparseTileRegions_toPixelRegions_withTileSize_numRegions_ :: (self: *MTLDevice, tileRegions: *MTLRegion, pixelRegions: *MTLRegion, tileSize: MTLSize, numRegions: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, tileRegions: *MTLRegion, pixelRegions: *MTLRegion, tileSize: MTLSize, numRegions: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.convertSparseTileRegions_toPixelRegions_withTileSize_numRegions_, tileRegions, pixelRegions, tileSize, numRegions);
    }

/*!
 @property sparseTileSizeInBytesForSparsePageSize
 @abstract Returns the number of bytes required to map one sparse texture tile for a given MTLSparsePageSize
 */
    sparseTileSizeInBytesForSparsePageSize_ :: (self: *MTLDevice, sparsePageSize: MTLSparsePageSize) -> NSUInteger {
        func: #type (obj: *void, selector: *void, sparsePageSize: MTLSparsePageSize) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sparseTileSizeInBytesForSparsePageSize_, sparsePageSize);
    }

/*!
 * @method sparseTileSizeWithTextureType:pixelFormat:sampleCount:sparsePageSize
 * @abstract Returns tile size for sparse texture with given type, pixel format and sample count.
 */
    sparseTileSizeWithTextureType_pixelFormat_sampleCount_sparsePageSize_ :: (self: *MTLDevice, textureType: MTLTextureType, pixelFormat: MTLPixelFormat, sampleCount: NSUInteger, sparsePageSize: MTLSparsePageSize) -> MTLSize {
        func: #type (obj: *void, selector: *void, textureType: MTLTextureType, pixelFormat: MTLPixelFormat, sampleCount: NSUInteger, sparsePageSize: MTLSparsePageSize) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sparseTileSizeWithTextureType_pixelFormat_sampleCount_sparsePageSize_, textureType, pixelFormat, sampleCount, sparsePageSize);
    }

/*!
 @method newCounterSampleBufferWithDescriptor:error:
 @abstract Given a counter sample buffer descriptor, allocate a new counter
 sample buffer.
 This may return nil if the counters may not all be collected simultaneously.
 @param descriptor The descriptor to create a sample buffer for
 @param error An error return on failure.
 */
    newCounterSampleBufferWithDescriptor_error_ :: (self: *MTLDevice, descriptor: *MTLCounterSampleBufferDescriptor, error: **NSError) -> *MTLCounterSampleBuffer {
        func: #type (obj: *void, selector: *void, descriptor: *MTLCounterSampleBufferDescriptor, error: **NSError) -> *MTLCounterSampleBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newCounterSampleBufferWithDescriptor_error_, descriptor, error);
    }

/*!
 @method sampleTimestamps:gpuTimestamp:
 @abstract Sample the CPU and GPU timestamps as closely as possible.
 @param cpuTimestamp The timestamp on the CPU
 @param gpuTimestamp The timestamp on the GPU
 */
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

/*!
 @method supportsCounterSampling:
 @abstract Query device for counter sampling points support.
 @param samplingPoint Query index
 @return BOOL value. If YES, the device supports counter sampling at given point.
*/
    supportsCounterSampling_ :: (self: *MTLDevice, samplingPoint: MTLCounterSamplingPoint) -> BOOL {
        func: #type (obj: *void, selector: *void, samplingPoint: MTLCounterSamplingPoint) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsCounterSampling_, samplingPoint);
    }

/*!
 @property supportsVertexAmplificationCount:
 @abstract Query device for vertex amplification support.
 @param count The amplification count to check
 @return BOOL value. If YES, the device supports vertex amplification with the given count. If NO, the device does not.
 */
    supportsVertexAmplificationCount_ :: (self: *MTLDevice, count: NSUInteger) -> BOOL {
        func: #type (obj: *void, selector: *void, count: NSUInteger) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsVertexAmplificationCount_, count);
    }

/*!
 @method newDynamicLibrary:error:
 @abstract Creates a MTLDynamicLibrary by compiling the code in a MTLLibrary.
 @see MTLDynamicLibrary
 @param library The MTLLibrary from which to compile code. This library must have .type set to MTLLibraryTypeDynamic.
 @param error If an error occurs during creation, this parameter is updated to describe the failure.
 @return On success, the MTLDynamicLibrary containing compiled code. On failure, nil.
 */
    newDynamicLibrary_error_ :: (self: *MTLDevice, library: *MTLLibrary, error: **NSError) -> *MTLDynamicLibrary {
        func: #type (obj: *void, selector: *void, library: *MTLLibrary, error: **NSError) -> *MTLDynamicLibrary #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newDynamicLibrary_error_, library, error);
    }

/*!
 @method newDynamicLibraryWithURL:error:
 @abstract Creates a MTLDynamicLibrary by loading compiled code from a file.
 @see MTLDynamicLibrary
 @param url The file URL from which to load. If the file contains no compiled code for this device, compilation is attempted as with newDynamicLibrary:error:
 @param error If an error occurs during creation, this parameter is updated to describe the failure.
 @return On success, the MTLDynamicLibrary containing compiled code (either loaded or compiled). On failure, nil.
 */
    newDynamicLibraryWithURL_error_ :: (self: *MTLDevice, url: *NSURL, error: **NSError) -> *MTLDynamicLibrary {
        func: #type (obj: *void, selector: *void, url: *NSURL, error: **NSError) -> *MTLDynamicLibrary #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newDynamicLibraryWithURL_error_, url, error);
    }

/*!
 @method newBinaryArchiveWithDescriptor:error:
 @abstract Creates a MTLBinaryArchive using the configuration in the descriptor.
 @see MTLBinaryArchive
 @param descriptor The descriptor for the configuration of the binary archive to create.
 @param error If an error occurs during creation, this parameter is updated to describe the failure.
 @return On success, the created MTLBinaryArchive. On failure, nil.
 */
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

/*!
 @method heapAccelerationStructureSizeAndAlignWithSize:
 @abstract Determine the byte size of acceleration structures when sub-allocated from a heap.
 @discussion This method can be used to help determine the required heap size.
 */
    heapAccelerationStructureSizeAndAlignWithSize_ :: (self: *MTLDevice, size: NSUInteger) -> MTLSizeAndAlign {
        func: #type (obj: *void, selector: *void, size: NSUInteger) -> MTLSizeAndAlign #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.heapAccelerationStructureSizeAndAlignWithSize_, size);
    }

/*!
 @method heapAccelerationStructureSizeAndAlignWithDescriptor:
 @abstract Determine the byte size of acceleration structures when sub-allocated from a heap. This is a convenience method which computes the acceleration structure size based on the descriptor.
 @discussion This method can be used to help determine the required heap size.
 */
    heapAccelerationStructureSizeAndAlignWithDescriptor_ :: (self: *MTLDevice, descriptor: *MTLAccelerationStructureDescriptor) -> MTLSizeAndAlign {
        func: #type (obj: *void, selector: *void, descriptor: *MTLAccelerationStructureDescriptor) -> MTLSizeAndAlign #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.heapAccelerationStructureSizeAndAlignWithDescriptor_, descriptor);
    }

/*!
 @method newResidencySetWithDescriptor
 @abstract Creates a new residency set with a descriptor.
 */
    newResidencySetWithDescriptor_error_ :: (self: *MTLDevice, desc: *MTLResidencySetDescriptor, error: **NSError) -> *MTLResidencySet {
        func: #type (obj: *void, selector: *void, desc: *MTLResidencySetDescriptor, error: **NSError) -> *MTLResidencySet #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newResidencySetWithDescriptor_error_, desc, error);
    }

/// Determines the size and alignment required to hold the data of a tensor you create with a descriptor in a buffer.
///
/// - Parameters:
///    - descriptor: A description of the properties for the new tensor.
/// - Returns: The size and alignment required to hold the data of a tensor you create with `descriptor` in a buffer.
    tensorSizeAndAlignWithDescriptor_ :: (self: *MTLDevice, descriptor: *MTLTensorDescriptor) -> MTLSizeAndAlign {
        func: #type (obj: *void, selector: *void, descriptor: *MTLTensorDescriptor) -> MTLSizeAndAlign #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tensorSizeAndAlignWithDescriptor_, descriptor);
    }

/// Creates a tensor by allocating new memory.
///
/// - Parameters:
///   - descriptor: A description of the properties for the new tensor.
///   - error: Metal populates this parameter with information in case an error occurs.
/// - Returns: A new tensor instance that Metal configures using `descriptor` or `nil` if an error occurred.
    newTensorWithDescriptor_error_ :: (self: *MTLDevice, descriptor: *MTLTensorDescriptor, error: **NSError) -> *MTLTensor {
        func: #type (obj: *void, selector: *void, descriptor: *MTLTensorDescriptor, error: **NSError) -> *MTLTensor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newTensorWithDescriptor_error_, descriptor, error);
    }

/*!
 @method functionHandleWithFunction:
 @abstract Returns the function handle for a function that was compiled with MTLFunctionOptionPipelineIndependent and MTLFunctionOptionCompileToBinary.
 */
    functionHandleWithFunction_ :: (self: *MTLDevice, function: *MTLFunction) -> *MTLFunctionHandle {
        func: #type (obj: *void, selector: *void, function: *MTLFunction) -> *MTLFunctionHandle #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionHandleWithFunction_, function);
    }

/// Creates a new command allocator.
///
/// - Returns: A ``MTL4CommandAllocator`` instance, or `nil` if the function failed.
    newCommandAllocator :: (self: *MTLDevice) -> *MTL4CommandAllocator {
        func: #type (obj: *void, selector: *void) -> *MTL4CommandAllocator #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newCommandAllocator);
    }

/// Creates a new command allocator from a command allocator descriptor.
///
/// - Parameters:
///   - descriptor: A ``MTL4CommandAllocatorDescriptor`` instance that configures the
///                 ``MTL4CommandAllocator`` instance.
///   - error:      Optional pointer to a `NSError` instance that Metal uses to describe the failure
///                 if this function fails.
///
/// - Returns: A ``MTL4CommandAllocator`` instance, or `nil` if the function failed.
    newCommandAllocatorWithDescriptor_error_ :: (self: *MTLDevice, descriptor: *MTL4CommandAllocatorDescriptor, error: **NSError) -> *MTL4CommandAllocator {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4CommandAllocatorDescriptor, error: **NSError) -> *MTL4CommandAllocator #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newCommandAllocatorWithDescriptor_error_, descriptor, error);
    }

/// Creates a new command queue.
///
/// - Returns: A ``MTL4CommandQueue`` instance, or `nil` if the function failed.
    newMTL4CommandQueue :: (self: *MTLDevice) -> *MTL4CommandQueue {
        func: #type (obj: *void, selector: *void) -> *MTL4CommandQueue #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newMTL4CommandQueue);
    }

/// Creates a new command queue from a queue descriptor.
///
/// - Parameters:
///   - descriptor: A ``MTL4CommandQueueDescriptor`` instance that configures the
///                 ``MTL4CommandQueue`` instance.
///   - error:      Optional pointer to a `NSError` instance that Metal uses to describe the failure
///                 if this function fails.
///
/// - Returns: A ``MTL4CommandQueue`` instance, or `nil` if the function failed.
    newMTL4CommandQueueWithDescriptor_error_ :: (self: *MTLDevice, descriptor: *MTL4CommandQueueDescriptor, error: **NSError) -> *MTL4CommandQueue {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4CommandQueueDescriptor, error: **NSError) -> *MTL4CommandQueue #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newMTL4CommandQueueWithDescriptor_error_, descriptor, error);
    }

/// Creates a new command buffer.
///
/// - Returns: A ``MTL4CommandBuffer`` instance, or `nil` if the function failed.
    newCommandBuffer :: (self: *MTLDevice) -> *MTL4CommandBuffer {
        func: #type (obj: *void, selector: *void) -> *MTL4CommandBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newCommandBuffer);
    }

/// Creates a new argument table from an argument table descriptor.
///
/// - Parameters:
///   - descriptor: A ``MTL4ArgumentTableDescriptor`` instance that configures the
///                 ``MTL4ArgumentTable`` instance.
///   - error:      Optional pointer to a `NSError` instance that Metal uses to describe the failure
///                 if this function fails.
///
/// - Returns: A ``MTL4ArgumentTable`` instance, or `nil` if the function failed.
    newArgumentTableWithDescriptor_error_ :: (self: *MTLDevice, descriptor: *MTL4ArgumentTableDescriptor, error: **NSError) -> *MTL4ArgumentTable {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4ArgumentTableDescriptor, error: **NSError) -> *MTL4ArgumentTable #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newArgumentTableWithDescriptor_error_, descriptor, error);
    }

/// Creates a new texture view pool from a resource view pool descriptor.
///
/// - Parameters:
///   - descriptor: A ``MTLResourceViewPoolDescriptor`` instance that configures the
///                 ``MTLTextureViewPool`` instance.
///   - error:      Optional pointer to a `NSError` instance that Metal uses to describe the failure
///                 if this function fails.
///
/// - Returns: A ``MTLTextureViewPool`` instance, or `nil` if the function failed.
    newTextureViewPoolWithDescriptor_error_ :: (self: *MTLDevice, descriptor: *MTLResourceViewPoolDescriptor, error: **NSError) -> *MTLTextureViewPool {
        func: #type (obj: *void, selector: *void, descriptor: *MTLResourceViewPoolDescriptor, error: **NSError) -> *MTLTextureViewPool #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newTextureViewPoolWithDescriptor_error_, descriptor, error);
    }

/// Creates a new compiler from a compiler descriptor.
///
/// - Parameters:
///   - descriptor: A ``MTL4CompilerDescriptor`` instance that configures the
///                 ``MTL4Compiler`` instance.
///   - error:      Optional pointer to a `NSError` instance that Metal uses to describe the failure
///                 if this function fails.
///
/// - Returns: A ``MTL4Compiler`` instance, or `nil` if the function failed.
    newCompilerWithDescriptor_error_ :: (self: *MTLDevice, descriptor: *MTL4CompilerDescriptor, error: **NSError) -> *MTL4Compiler {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4CompilerDescriptor, error: **NSError) -> *MTL4Compiler #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newCompilerWithDescriptor_error_, descriptor, error);
    }

/// Creates a new archive from data available at an `NSURL` address.
///
/// - Parameters:
///   - url:   An `NSURL` instance that represents the path from which the device loads the ``MTL4Archive``.
///   - error:      Optional pointer to a `NSError` instance that Metal uses to describe the failure
///                 if this function fails.
///
/// - Returns: A ``MTL4Archive`` instance, or `nil` if the function failed.
    newArchiveWithURL_error_ :: (self: *MTLDevice, url: *NSURL, error: **NSError) -> *MTL4Archive {
        func: #type (obj: *void, selector: *void, url: *NSURL, error: **NSError) -> *MTL4Archive #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newArchiveWithURL_error_, url, error);
    }

/// Creates a new pipeline data set serializer instance from a descriptor.
///
/// - Parameter descriptor: A ``MTL4PipelineDataSetSerializerDescriptor`` instance that configures
///                         the new ``MTL4PipelineDataSetSerializer`` instance.
///
/// - Returns: A ``MTL4PipelineDataSetSerializer`` instance, or `nil` if the function failed.
    newPipelineDataSetSerializerWithDescriptor_ :: (self: *MTLDevice, descriptor: *MTL4PipelineDataSetSerializerDescriptor) -> *MTL4PipelineDataSetSerializer {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4PipelineDataSetSerializerDescriptor) -> *MTL4PipelineDataSetSerializer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newPipelineDataSetSerializerWithDescriptor_, descriptor);
    }

/// Creates a new placement sparse buffer of a specific length.
///
/// This method creates a new placement sparse ``MTLBuffer`` of a specific length. You assign memory to
/// placement sparse buffers using a ``MTLHeap`` of type ``MTLHeapType/MTLHeapTypePlacement``.
///
/// - Parameters:
///   - length:                  The size of the ``MTLBuffer``, in bytes.
///   - options:                 A ``MTLResourceOptions`` instance that establishes the buffer’s storage modes.
///   - placementSparsePageSize: ``MTLSparsePageSize`` to use for the placement sparse buffer.
///
/// - Returns: A ``MTLBuffer`` instance, or `nil` if the function failed.
    newBufferWithLength_options_placementSparsePageSize_ :: (self: *MTLDevice, length: NSUInteger, options: MTLResourceOptions, placementSparsePageSize: MTLSparsePageSize) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void, length: NSUInteger, options: MTLResourceOptions, placementSparsePageSize: MTLSparsePageSize) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newBufferWithLength_options_placementSparsePageSize_, length, options, placementSparsePageSize);
    }

/// Creates a new counter heap configured from a counter heap descriptor.
///
/// - Parameters:
///   - descriptor: ``MTL4CounterHeapDescriptor`` instance that configures the ``MTL4CounterHeap`` instance.
///   - error:      Optional pointer to a `NSError` instance that Metal uses to describe the failure
///                 if this function fails.
///
/// - Returns: A ``MTL4CounterHeap`` instance, or `nil` if the function failed.
    newCounterHeapWithDescriptor_error_ :: (self: *MTLDevice, descriptor: *MTL4CounterHeapDescriptor, error: **NSError) -> *MTL4CounterHeap {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4CounterHeapDescriptor, error: **NSError) -> *MTL4CounterHeap #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newCounterHeapWithDescriptor_error_, descriptor, error);
    }

/// Returns the size, in bytes, of each entry in a counter heap of a specific counter heap type when
/// your app resolves it into a usable format.
///
/// In order to use the data available in a ``MTL4CounterHeap``, your app first resolves it either in the CPU timeline
/// or in the GPU timeline. When your app calls ``MTL4CommandBuffer/resolveCounterHeap:withRange:intoBuffer:waitFence:updateFence:``
/// to resolve counter data in the GPU timeline, Metal writes the data into a ``MTLBuffer``.
///
/// During this process, Metal transform the data in the heap into a format consisting of entries of the size
/// that this method advertises, based on the ``MTL4CounterHeapType``.
///
/// - Parameters:
///   - type: ``MTL4CounterHeapType`` value that represents the type of the ``MTL4CounterHeap`` to resolve.
///
/// - Returns: The size of the post-transformation entry from a ``MTL4CounterHeap`` of type ``MTL4CounterHeapType``.
    sizeOfCounterHeapEntry_ :: (self: *MTLDevice, type: MTL4CounterHeapType) -> NSUInteger {
        func: #type (obj: *void, selector: *void, type: MTL4CounterHeapType) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sizeOfCounterHeapEntry_, type);
    }

/// Queries the frequency of the GPU timestamp in ticks per second.
///
/// - Returns: The frequency of the GPU timestamp in ticks per second.
    queryTimestampFrequency :: (self: *MTLDevice) -> u64 {
        func: #type (obj: *void, selector: *void) -> u64 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.queryTimestampFrequency);
    }

/// Get the function handle for the specified binary-linked function from the pipeline state.
///
/// - Parameters:
///   - function: A ``MTL4BinaryFunction`` instance representing the function binary.
///
/// - Returns: A ``MTLFunctionHandle`` instance  for a binary function that was compiled with ``MTLFunctionOptionPipelineIndependent``, otherwise `nil`.
    functionHandleWithBinaryFunction_ :: (self: *MTLDevice, function: *MTL4BinaryFunction) -> *MTLFunctionHandle {
        func: #type (obj: *void, selector: *void, function: *MTL4BinaryFunction) -> *MTLFunctionHandle #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionHandleWithBinaryFunction_, function);
    }

/*!
 @property name
 @abstract The full name of the vendor device.
 */
    name :: (self: *MTLDevice) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

/*!
 @property registryID
 @abstract Returns the IORegistry ID for the Metal device
 @discussion The registryID value for a Metal device is global to all tasks, and may be used
 to identify the GPU across task boundaries.
*/
    registryID :: (self: *MTLDevice) -> u64 {
        func: #type (obj: *void, selector: *void) -> u64 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.registryID);
    }

/*!
 @property architecture
 @abstract Returns the device's architecture information.
 */
    architecture :: (self: *MTLDevice) -> *MTLArchitecture {
        func: #type (obj: *void, selector: *void) -> *MTLArchitecture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.architecture);
    }

/*!
 @property maxThreadsPerThreadgroup
 @abstract The maximum number of threads along each dimension.
 */
    maxThreadsPerThreadgroup :: (self: *MTLDevice) -> MTLSize {
        func: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxThreadsPerThreadgroup);
    }

/*!
 @property lowPower
 @abstract On systems that support automatic graphics switching, this will return YES for the the low power device.
 */
    isLowPower :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isLowPower);
    }

/*!
 @property headless
 @abstract On systems that include more that one GPU, this will return YES for any device that does not support any displays.  Only available on Mac OS X.
 */
    isHeadless :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isHeadless);
    }

/*!
 @property removable
 @abstract If this GPU is removable, this property will return YES.  
 @discussion If a GPU is is removed without warning, APIs may fail even with good input, even before a notification can get posted informing
 the application that the device has been removed.
 */
    isRemovable :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isRemovable);
    }

/*!
 @property hasUnifiedMemory
 @abstract Returns YES if this GPU shares its memory with the rest of the machine (CPU, etc.)
 @discussion Some GPU architectures do not have dedicated local memory and instead only use the same memory shared with the rest
 of the machine.  This property will return YES for GPUs that fall into that category.
*/
    hasUnifiedMemory :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.hasUnifiedMemory);
    }

/*!
 @property recommendedMaxWorkingSetSize
 @abstract Returns an approximation of how much memory this device can use with good performance.
 @discussion Performance may be improved by keeping the total size of all resources (texture and buffers)
 and heaps less than this threshold, beyond which the device is likely to be overcommitted and incur a
 performance penalty. */
    recommendedMaxWorkingSetSize :: (self: *MTLDevice) -> u64 {
        func: #type (obj: *void, selector: *void) -> u64 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.recommendedMaxWorkingSetSize);
    }

/*!
 @property location
 @abstract Returns an enum that indicates where the GPU is located relative to the host computer.
 @discussion The returned value indicates if the GPU is built into the computer, inserted into
 a slot internal to the computer, or external to the computer. Otherwise it is Unspecified */
    location :: (self: *MTLDevice) -> MTLDeviceLocation {
        func: #type (obj: *void, selector: *void) -> MTLDeviceLocation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.location);
    }

/*!
 @property locationNumber
 @abstract Returns a value that further specifies the GPU's location
 @discussion The returned value indicates which slot or Thunderbolt port the GPU is attached
 to. For Built-in GPUs, if LowPower this value is 0, otherwise it is 1.  It is possible for multiple GPUs to have
 the same location and locationNumber; e.g.: A PCI card with multiple GPUs, or an eGPU
 daisy-chained off of another eGPU attached to a host Thunderbolt port. */
    locationNumber :: (self: *MTLDevice) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.locationNumber);
    }

/*!
 @property maxTransferRate
 @abstract Upper bound of System RAM <=> VRAM transfer rate in bytes/sec
 @discussion The returned value indicates the theoretical maximum data rate in bytes/second
 from host memory to the GPU's VRAM. This is derived from the raw data clock rate and as
 such may not be reachable under real-world conditions. For Built-in GPUs this value is 0. */
    maxTransferRate :: (self: *MTLDevice) -> u64 {
        func: #type (obj: *void, selector: *void) -> u64 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTransferRate);
    }

/*!
 @property depth24Stencil8PixelFormatSupported
 @abstract If YES, device supports MTLPixelFormatDepth24Unorm_Stencil8.
 */
    isDepth24Stencil8PixelFormatSupported :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.isDepth24Stencil8PixelFormatSupported);
    }

/*!
 @property readWriteTextureSupport
 @abstract Query support tier for read-write texture formats.
 @return MTLReadWriteTextureTier enum value.
 */
    readWriteTextureSupport :: (self: *MTLDevice) -> MTLReadWriteTextureTier {
        func: #type (obj: *void, selector: *void) -> MTLReadWriteTextureTier #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.readWriteTextureSupport);
    }

/*!
 @property argumentBuffersSupport
 @abstract Query support tier for Argument Buffers.
 @return MTLArgumentBuffersTier enum value.
 */
    argumentBuffersSupport :: (self: *MTLDevice) -> MTLArgumentBuffersTier {
        func: #type (obj: *void, selector: *void) -> MTLArgumentBuffersTier #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.argumentBuffersSupport);
    }

/*!
 @property rasterOrderGroupsSupported
 @abstract Query device for raster order groups support.
 @return BOOL value. If YES, the device supports raster order groups. If NO, the device does not.
 */
    areRasterOrderGroupsSupported :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.areRasterOrderGroupsSupported);
    }

/*!
 @property supports32BitFloatFiltering
 @abstract Query device for 32-bit Float texture filtering support. Specifically, R32Float, RG32Float, and RGBA32Float.
 @return BOOL value. If YES, the device supports filtering 32-bit Float textures. If NO, the device does not.
 */
    supports32BitFloatFiltering :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supports32BitFloatFiltering);
    }

/*!
 @property supports32BitMSAA
 @abstract Query device for 32-bit MSAA texture support. Specifically, added support for allocating 32-bit Integer format textures (R32Uint, R32Sint, RG32Uint, RG32Sint, RGBA32Uint, and RGBA32Sint) and resolving 32-bit Float format textures (R32Float, RG32Float, and RGBA32Float).
 @return BOOL value. If YES, the device supports these additional 32-bit MSAA texture capabilities. If NO, the devices does not.
 */
    supports32BitMSAA :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supports32BitMSAA);
    }

/*!
@property supportsQueryTextureLOD
@abstract Query device for whether it supports the `calculate_clampled_lod` and `calculate_unclamped_lod` Metal shading language functionality.
@return BOOL value. If YES, the device supports the calculate LOD functionality. If NO, the device does not.
*/
    supportsQueryTextureLOD :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsQueryTextureLOD);
    }

/*!
 @property supportsBCTextureCompression
 @abstract Query device for BC Texture format support
 @return BOOL value. If YES, the device supports compressed BC Texture formats. If NO, the device does not.
 */
    supportsBCTextureCompression :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsBCTextureCompression);
    }

/*!
 @property supportsPullModelInterpolation
 @abstract Query device for pull model interpolation support which allows a fragment shader to compute multiple interpolations (at center, at centroid, at offset, at sample) of a fragment input.
 @return BOOL value. If YES, the device supports pull model interpolation. If NO, the device does not.
 */
    supportsPullModelInterpolation :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsPullModelInterpolation);
    }

/*!
 @property barycentricsSupported
 @abstract Query device for Barycentric coordinates support; deprecated, use supportsShaderBarycentricCoordinates
 @return BOOL value. If YES, the device barycentric coordinates
 */
    areBarycentricCoordsSupported :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.areBarycentricCoordsSupported);
    }

/*!
 @property supportsShaderBarycentricCoordinates
 @abstract Query device for Barycentric Coordinates support.
 @return BOOL value. If YES, the device supports barycentric coordinates. If NO, the device does not.
 */
    supportsShaderBarycentricCoordinates :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsShaderBarycentricCoordinates);
    }

/*!
 @property currentAllocatedSize
 @abstract The current size in bytes of all resources allocated by this device
 */
    currentAllocatedSize :: (self: *MTLDevice) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.currentAllocatedSize);
    }

/*!
 @property maxThreadgroupMemoryLength
 @abstract The maximum threadgroup memory available, in bytes.
 */
    maxThreadgroupMemoryLength :: (self: *MTLDevice) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxThreadgroupMemoryLength);
    }

/*!
 @property maxArgumentBufferSamplerCount
 @abstract The maximum number of unique argument buffer samplers per app.
 @discussion This limit is only applicable to samplers that have their supportArgumentBuffers property set to true. A MTLSamplerState object is considered unique if the configuration of its originating MTLSamplerDescriptor properties is unique. For example, two samplers with equal minFilter values but different magFilter values are considered unique.
 */
    maxArgumentBufferSamplerCount :: (self: *MTLDevice) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxArgumentBufferSamplerCount);
    }

/*!
 @property programmableSaplePositionsSupported
 @abstract Query device for programmable sample position support.
 @return BOOL value. If YES, the device supports programmable sample positions. If NO, the device does not.
 */
    areProgrammableSamplePositionsSupported :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.areProgrammableSamplePositionsSupported);
    }

/*!
 @property peerGroupID
 @abstract If a device supports peer to peer transfers with another device (or devices), this property will return
 a unique 64-bit identifier associated with all devices in the same peer group.
 */
    peerGroupID :: (self: *MTLDevice) -> u64 {
        func: #type (obj: *void, selector: *void) -> u64 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.peerGroupID);
    }

/*!
 @property peerIndex
 @abstract All Metal devices that are part of the same peer group will have a unique index value within the group in
 the range from 0 to peerCount - 1.
 */
    peerIndex :: (self: *MTLDevice) -> u32 {
        func: #type (obj: *void, selector: *void) -> u32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.peerIndex);
    }

/*!
 @property peerCount
 @abstract For Metal devices that are part of a peer group, this property returns the total number of devices in that group.
 */
    peerCount :: (self: *MTLDevice) -> u32 {
        func: #type (obj: *void, selector: *void) -> u32 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.peerCount);
    }

/*!
 @property sparseTileSizeInBytes
 @abstract Returns the number of bytes required to map one sparse texture tile.
 */
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

/*!
 @property counterSets
 @abstract Returns the set of Counter Sets exposed by the device.
 */
    counterSets :: (self: *MTLDevice) -> *NSArray(*MTLCounterSet) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLCounterSet) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.counterSets);
    }

/*!
 @property supportsDynamicLibraries
 @abstract Query device support for creating and using dynamic libraries in a compute pipeline.
 @return BOOL value. If YES, the device supports creating and using dynamic libraries in a compute pipeline. If NO, the device does not.
 */
    supportsDynamicLibraries :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsDynamicLibraries);
    }

/*!
 @property supportsRenderDynamicLibraries
 @abstract Query device support for creating and using dynamic libraries in render pipeline stages.
 @return BOOL value. If YES, the device supports creating and using dynamic libraries in render pipeline stages. If NO, the device does not.
 */
    supportsRenderDynamicLibraries :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsRenderDynamicLibraries);
    }

/// A Boolean value that indicates whether the device supports placement sparse resources.
    supportsPlacementSparse :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsPlacementSparse);
    }

/*!
@property supportsRaytracing
@abstract Query device support for using ray tracing from compute pipelines.
@return BOOL value. If YES, the device supports ray tracing from compute pipelines. If NO, the device does not.
*/
    supportsRaytracing :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsRaytracing);
    }

/*!
 @property supportsFunctionPointers
 @abstract Query device support for using function pointers from compute pipelines.
 @return BOOL value. If YES, the device supports function pointers from compute pipelines. If NO, the device does not.
 */
    supportsFunctionPointers :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsFunctionPointers);
    }

/*!
 @property supportsFunctionPointersFromRender
 @abstract Query device support for using function pointers from render pipeline stages.
 @return BOOL value. If YES, the device supports function pointers from render pipeline stages. If NO, the device does not.
 */
    supportsFunctionPointersFromRender :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsFunctionPointersFromRender);
    }

/*!
 @property supportsRaytracingFromRender
 @abstract Query device support for using ray tracing from render pipeline stages.
 @return BOOL value. If YES, the device supports ray tracing from render pipeline stages. If NO, the device does not.
 */
    supportsRaytracingFromRender :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsRaytracingFromRender);
    }

/*!
 @property supportsPrimitiveMotionBlur
 @abstract Query device support for using ray tracing primitive motion blur.
 @return BOOL value. If YES, the device supports the primitive motion blur api. If NO, the device does not.
 */
    supportsPrimitiveMotionBlur :: (self: *MTLDevice) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportsPrimitiveMotionBlur);
    }

/*!
 @property shouldMaximizeConcurrentCompilation
 @abstract Allow this device to use additional CPU threads (scaled automatically to the host machine) to be used for compilation tasks. Default is `NO`.
 @discussion Use the `maximumConcurrentCompilationTaskCount` property to determine the current number of concurrent CPU threads that this device is using.
 */
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

/*!
 @property maximumConcurrentCompilationTaskCount
 @abstract Returns the maximum count of concurrent executing compilation tasks.
 @discussion The property returns a different value depending on the value of the property `shouldMaximizeConcurrentCompilation`.
 */
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

/*!
 @property label
 @abstract A string to help identify this object.
 */
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
/*!
 @method updateTextureMappings:regions:mipLevels:slices:numRegions:mode:
 @abstract Updates multiple regions within a sparse texture.
 */
    updateTextureMappings_mode_regions_mipLevels_slices_numRegions_ :: (self: *MTLResourceStateCommandEncoder, texture: *MTLTexture, mode: MTLSparseTextureMappingMode, regions: *MTLRegion, mipLevels: *NSUInteger, slices: *NSUInteger, numRegions: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, mode: MTLSparseTextureMappingMode, regions: *MTLRegion, mipLevels: *NSUInteger, slices: *NSUInteger, numRegions: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.updateTextureMappings_mode_regions_mipLevels_slices_numRegions_, texture, mode, regions, mipLevels, slices, numRegions);
    }

/*!
 @method updateTextureMapping:region:mipLevel:slice:mode:
 @abstract Updates mapping for given sparse texture
 */
    updateTextureMapping_mode_region_mipLevel_slice_ :: (self: *MTLResourceStateCommandEncoder, texture: *MTLTexture, mode: MTLSparseTextureMappingMode, region: MTLRegion, mipLevel: NSUInteger, slice: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, mode: MTLSparseTextureMappingMode, region: MTLRegion, mipLevel: NSUInteger, slice: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.updateTextureMapping_mode_region_mipLevel_slice_, texture, mode, region, mipLevel, slice);
    }

/*!
 @method updateTextureMapping:indirectBuffer:indirectBufferOffset:
 @abstract Updates mapping for given sparse texture. Updates are driven via a MTLBuffer with the structure format defined by MTLMapIndirectBufferFormat.
 
  struct MTLMapIndirectBufferFormat{
      uint32_t numMappings;
      MTLMapIndirectArguments mappings[numMappings]; 
  }
 */
    updateTextureMapping_mode_indirectBuffer_indirectBufferOffset_ :: (self: *MTLResourceStateCommandEncoder, texture: *MTLTexture, mode: MTLSparseTextureMappingMode, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, mode: MTLSparseTextureMappingMode, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.updateTextureMapping_mode_indirectBuffer_indirectBufferOffset_, texture, mode, indirectBuffer, indirectBufferOffset);
    }

/*!
 @method updateFence:
 @abstract Update the fence to capture all GPU work so far enqueued by this encoder.
 @discussion The fence is updated at kernel submission to maintain global order and prevent deadlock.
 Drivers may delay fence updates until the end of the encoder. Drivers may also wait on fences at the beginning of an encoder. It is therefore illegal to wait on a fence after it has been updated in the same encoder.
 */
    updateFence_ :: (self: *MTLResourceStateCommandEncoder, fence: *MTLFence) -> void {
        func: #type (obj: *void, selector: *void, fence: *MTLFence) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.updateFence_, fence);
    }

/*!
 @method waitForFence:
 @abstract Prevent further GPU work until the fence is reached.
 @discussion The fence is evaluated at kernel submission to maintain global order and prevent deadlock.
 Drivers may delay fence updates until the end of the encoder. Drivers may also wait on fences at the beginning of an encoder. It is therefore illegal to wait on a fence after it has been updated in the same encoder.
 */
    waitForFence_ :: (self: *MTLResourceStateCommandEncoder, fence: *MTLFence) -> void {
        func: #type (obj: *void, selector: *void, fence: *MTLFence) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.waitForFence_, fence);
    }

/*!
 @method moveTextureMappingsFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:
 @abstract Move sparse page mappings from one sparse texture to another from the same heap.
 @discussion The tile mapping is moved from the source texture only if the destination texture tile is unmapped. The textures must also have matching a texture format,
 texture type, sample count, usage and resource options.
 */
    moveTextureMappingsFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_ :: (self: *MTLResourceStateCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> void {
        func: #type (obj: *void, selector: *void, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.moveTextureMappingsFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_, sourceTexture, sourceSlice, sourceLevel, sourceOrigin, sourceSize, destinationTexture, destinationSlice, destinationLevel, destinationOrigin);
    }

}

/*!
 @protocol MTLBlitCommandEncoder
 @abstract A command encoder that performs basic copies and blits between buffers and textures.
 */
MTLBlitCommandEncoder :: struct #type_info_no_size_complaint {
/*!
 @method synchronizeResource:
 @abstract Flush any copy of this resource from the device's caches, and invalidate any CPU caches if needed.
 @param resource The resource to page off.
 @discussion When the device writes to a resource with a storage mode of MTLResourceStorageModeManaged, those writes may be cached (for example, in VRAM or on chip renderer cache),
 making any CPU access (either MTLBuffer.contents or -[MTLTexture getBytes:...] and -[MTLTexture replaceRegion:]) produce undefined results.  To allow the CPU to see what the device
 has written, a CommandBuffer containing this synchronization must be executed.  After completion of the CommandBuffer, the CPU can access the contents of the resource safely.
 */
    synchronizeResource_ :: (self: *MTLBlitCommandEncoder, resource: *MTLResource) -> void {
        func: #type (obj: *void, selector: *void, resource: *MTLResource) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.synchronizeResource_, resource);
    }

/*!
 @method synchronizeTexture:slice:mipmapLevel:
 @abstract Flush any copy of this image from the device's caches, and invalidate CPU caches if needed.
 @param texture The texture to page off.
 @param slice The slice of the texture to page off.
 @param level The mipmap level of the texture to flush.
 @discussion
 See the discussion of -synchronizeResource.   -synchronizeTexture:slice:mipmapLevel performs the same role, except it may flush only a subset of the texture storage, rather than the entire texture.
 */
    synchronizeTexture_slice_level_ :: (self: *MTLBlitCommandEncoder, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.synchronizeTexture_slice_level_, texture, slice, level);
    }

/*!
 @method copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:
 @abstract Copy a rectangle of pixels between textures.
 */
    copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_ :: (self: *MTLBlitCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> void {
        func: #type (obj: *void, selector: *void, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_, sourceTexture, sourceSlice, sourceLevel, sourceOrigin, sourceSize, destinationTexture, destinationSlice, destinationLevel, destinationOrigin);
    }

/*!
 @method copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:
 @abstract Copy an image from a buffer into a texture.
 */
    copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_ :: (self: *MTLBlitCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> void {
        func: #type (obj: *void, selector: *void, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_, sourceBuffer, sourceOffset, sourceBytesPerRow, sourceBytesPerImage, sourceSize, destinationTexture, destinationSlice, destinationLevel, destinationOrigin);
    }

/*!
 @method copyFromBuffer:sourceOffset:sourceBytesPerRow:sourceBytesPerImage:sourceSize:toTexture:destinationSlice:destinationLevel:destinationOrigin:options:
 @abstract Copy an image from a buffer into a texture.
 */
    copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_options_ :: (self: *MTLBlitCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin, options: MTLBlitOption) -> void {
        func: #type (obj: *void, selector: *void, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin, options: MTLBlitOption) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_options_, sourceBuffer, sourceOffset, sourceBytesPerRow, sourceBytesPerImage, sourceSize, destinationTexture, destinationSlice, destinationLevel, destinationOrigin, options);
    }

/*!
 @method copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:
 @abstract Copy an image from a texture into a buffer.
 */
    copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_ :: (self: *MTLBlitCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, destinationBytesPerRow: NSUInteger, destinationBytesPerImage: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, destinationBytesPerRow: NSUInteger, destinationBytesPerImage: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_, sourceTexture, sourceSlice, sourceLevel, sourceOrigin, sourceSize, destinationBuffer, destinationOffset, destinationBytesPerRow, destinationBytesPerImage);
    }

/*!
 @method copyFromTexture:sourceSlice:sourceLevel:sourceOrigin:sourceSize:sourceOptions:toBuffer:destinationOffset:destinationBytesPerRow:destinationBytesPerImage:options:
 @abstract Copy an image from a texture into a buffer.
 */
    copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_options_ :: (self: *MTLBlitCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, destinationBytesPerRow: NSUInteger, destinationBytesPerImage: NSUInteger, options: MTLBlitOption) -> void {
        func: #type (obj: *void, selector: *void, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, destinationBytesPerRow: NSUInteger, destinationBytesPerImage: NSUInteger, options: MTLBlitOption) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_options_, sourceTexture, sourceSlice, sourceLevel, sourceOrigin, sourceSize, destinationBuffer, destinationOffset, destinationBytesPerRow, destinationBytesPerImage, options);
    }

/*!
 @method generateMipmapsForTexture:
 @abstract Generate mipmaps for a texture from the base level up to the max level.
 */
    generateMipmapsForTexture_ :: (self: *MTLBlitCommandEncoder, texture: *MTLTexture) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.generateMipmapsForTexture_, texture);
    }

/*!
 @method fillBuffer:range:value:
 @abstract Fill a buffer with a fixed value in each byte.
 */
    fillBuffer_range_value_ :: (self: *MTLBlitCommandEncoder, buffer: *MTLBuffer, range: NSRange, value: u8) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, range: NSRange, value: u8) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fillBuffer_range_value_, buffer, range, value);
    }

/*!
 @method copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:
 @abstract Copy whole surfaces between textures.
 @discussion Convenience function to copy sliceCount * levelCount whole surfaces between textures
 The source and destination pixel format must be identical.
 The source and destination sample count must be identical.
 The sourceLevel mip in sourceTexture must have the same dimension as the destinationLevel mip in destinationTexture.
 The sourceTexture must have at least sourceLevel + levelCount mips
 The destinationTexture must have at least destinationLevel + levelCount mips
 The sourceTexture must have at least sourceSlice + sliceCount array slices
 The destinationTexture must have at least destinationSlice + sliceCount array slices
 */
    copyFromTexture_sourceSlice_sourceLevel_toTexture_destinationSlice_destinationLevel_sliceCount_levelCount_ :: (self: *MTLBlitCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, sliceCount: NSUInteger, levelCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, sliceCount: NSUInteger, levelCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromTexture_sourceSlice_sourceLevel_toTexture_destinationSlice_destinationLevel_sliceCount_levelCount_, sourceTexture, sourceSlice, sourceLevel, destinationTexture, destinationSlice, destinationLevel, sliceCount, levelCount);
    }

/*!
 @method copyFromTexture:toTexture:
 @abstract Copy as many whole surfaces as possible between textures.
 @discussion Convenience function that calls copyFromTexture:sourceSlice:sourceLevel:toTexture:destinationSlice:destinationLevel:sliceCount:levelCount:
 The source and destination pixel format must be identical.
 The source and destination sample count must be identical.
 Either:
 - sourceTexture must have a mip M with identical dimensions as the first mip of destinationTexture: sourceLevel = M, destinationLevel = 0
 - destinationTexture must have a mip M with identical dimensions as the first mip of sourceTexture: sourceLevel = 0, destinationLevel = M
 Computes: levelCount = min(sourceTexture.mipmapLevelCount - sourceLevel, destinationTexture.mipmapLevelCount - destinationLevel)
           sliceCount = min(sourceTexture.arrayLength, destinationTexture.arrayLength)
 Then invokes the method above using the computed parameters.
 */
    copyFromTexture_toTexture_ :: (self: *MTLBlitCommandEncoder, sourceTexture: *MTLTexture, destinationTexture: *MTLTexture) -> void {
        func: #type (obj: *void, selector: *void, sourceTexture: *MTLTexture, destinationTexture: *MTLTexture) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromTexture_toTexture_, sourceTexture, destinationTexture);
    }

/*!
 @method copyFromBuffer:sourceOffset:toBuffer:destinationOffset:size:
 @abstract Basic memory copy between buffers.
 */
    copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_ :: (self: *MTLBlitCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, size: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, size: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_, sourceBuffer, sourceOffset, destinationBuffer, destinationOffset, size);
    }

/*!
 @method updateFence:
 @abstract Update the fence to capture all GPU work so far enqueued by this encoder.
 @discussion The fence is updated at kernel submission to maintain global order and prevent deadlock.
 Drivers may delay fence updates until the end of the encoder. Drivers may also wait on fences at the beginning of an encoder. It is therefore illegal to wait on a fence after it has been updated in the same encoder.
 */
    updateFence_ :: (self: *MTLBlitCommandEncoder, fence: *MTLFence) -> void {
        func: #type (obj: *void, selector: *void, fence: *MTLFence) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.updateFence_, fence);
    }

/*!
 @method waitForFence:
 @abstract Prevent further GPU work until the fence is reached.
 @discussion The fence is evaluated at kernel submission to maintain global order and prevent deadlock.
 Drivers may delay fence updates until the end of the encoder. Drivers may also wait on fences at the beginning of an encoder. It is therefore illegal to wait on a fence after it has been updated in the same encoder.
 */
    waitForFence_ :: (self: *MTLBlitCommandEncoder, fence: *MTLFence) -> void {
        func: #type (obj: *void, selector: *void, fence: *MTLFence) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.waitForFence_, fence);
    }

/*!
     @method getTextureAccessCounters:region:mipLevel:slice:type:resetCounters:countersBuffer:countersBufferOffset
     @abstract Copies tile access counters within specified region into provided buffer
     */
    getTextureAccessCounters_region_mipLevel_slice_resetCounters_countersBuffer_countersBufferOffset_ :: (self: *MTLBlitCommandEncoder, texture: *MTLTexture, region: MTLRegion, mipLevel: NSUInteger, slice: NSUInteger, resetCounters: BOOL, countersBuffer: *MTLBuffer, countersBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, region: MTLRegion, mipLevel: NSUInteger, slice: NSUInteger, resetCounters: BOOL, countersBuffer: *MTLBuffer, countersBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.getTextureAccessCounters_region_mipLevel_slice_resetCounters_countersBuffer_countersBufferOffset_, texture, region, mipLevel, slice, resetCounters, countersBuffer, countersBufferOffset);
    }

/*!
     @method resetTextureAccessCounters:region:mipLevel:slice:type:
     @abstract Resets tile access counters within specified region
     */
    resetTextureAccessCounters_region_mipLevel_slice_ :: (self: *MTLBlitCommandEncoder, texture: *MTLTexture, region: MTLRegion, mipLevel: NSUInteger, slice: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, region: MTLRegion, mipLevel: NSUInteger, slice: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resetTextureAccessCounters_region_mipLevel_slice_, texture, region, mipLevel, slice);
    }

/*!
 @method optimizeContentsForGPUAccess:
 @abstract Optimizes the texture data to ensure the best possible performance when accessing content on the GPU at the expense of CPU-access performance.
 */
    optimizeContentsForGPUAccess_ :: (self: *MTLBlitCommandEncoder, texture: *MTLTexture) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.optimizeContentsForGPUAccess_, texture);
    }

/*!
 @method optimizeContentsForGPUAccess:slice:level:
 @abstract Optimizes a subset of the texture data to ensure the best possible performance when accessing content on the GPU at the expense of CPU-access performance.
 */
    optimizeContentsForGPUAccess_slice_level_ :: (self: *MTLBlitCommandEncoder, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.optimizeContentsForGPUAccess_slice_level_, texture, slice, level);
    }

/*!
 @method optimizeContentsForCPUAccess:
 @abstract Optimizes the texture data to ensure the best possible performance when accessing content on the CPU at the expense of GPU-access performance.
 */
    optimizeContentsForCPUAccess_ :: (self: *MTLBlitCommandEncoder, texture: *MTLTexture) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.optimizeContentsForCPUAccess_, texture);
    }

/*!
 @method optimizeContentsForCPUAccess:slice:level:
 @abstract Optimizes a subset of the texture data to ensure the best possible performance when accessing content on the CPU at the expense of GPU-access performance.
 */
    optimizeContentsForCPUAccess_slice_level_ :: (self: *MTLBlitCommandEncoder, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.optimizeContentsForCPUAccess_slice_level_, texture, slice, level);
    }

/*!
 @method resetCommandsInBuffer:withRange:
 @abstract reset commands in a indirect command buffer using the GPU
 */
    resetCommandsInBuffer_withRange_ :: (self: *MTLBlitCommandEncoder, buffer: *MTLIndirectCommandBuffer, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLIndirectCommandBuffer, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resetCommandsInBuffer_withRange_, buffer, range);
    }

/*!
 @method copyIndirectCommandBuffer:source:sourceRange:destination:destinationIndex
 @abstract copy a region of a buffer into a destination buffer starting at destinationIndex using the GPU
 */
    copyIndirectCommandBuffer_sourceRange_destination_destinationIndex_ :: (self: *MTLBlitCommandEncoder, source: *MTLIndirectCommandBuffer, sourceRange: NSRange, destination: *MTLIndirectCommandBuffer, destinationIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, source: *MTLIndirectCommandBuffer, sourceRange: NSRange, destination: *MTLIndirectCommandBuffer, destinationIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyIndirectCommandBuffer_sourceRange_destination_destinationIndex_, source, sourceRange, destination, destinationIndex);
    }

/*!
 @method optimizeIndirectCommandBuffer:withRange:
 @abstract Encodes a command that can improve the performance of a range of commands within an indirect command buffer.
 */
    optimizeIndirectCommandBuffer_withRange_ :: (self: *MTLBlitCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, indirectCommandBuffer: *MTLIndirectCommandBuffer, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.optimizeIndirectCommandBuffer_withRange_, indirectCommandBuffer, range);
    }

/*!
 @method sampleCountersInBuffer:atSampleIndex:withBarrier:
 @abstract Sample hardware counters at this point in the blit encoder and
 store the counter sample into the sample buffer at the specified index.
 @param sampleBuffer The sample buffer to sample into
 @param sampleIndex The index into the counter buffer to write the sample.
 @param barrier Insert a barrier before taking the sample.  Passing
 YES will ensure that all work encoded before this operation in the encoder is
 complete but does not isolate the work with respect to other encoders.  Passing
 NO will allow the sample to be taken concurrently with other operations in this
 encoder.
 In general, passing YES will lead to more repeatable counter results but
 may negatively impact performance.  Passing NO will generally be higher performance
 but counter results may not be repeatable.
 @discussion On devices where MTLCounterSamplingPointAtBlitBoundary is unsupported,
 this method is not available and will generate an error if called.
 */
    sampleCountersInBuffer_atSampleIndex_withBarrier_ :: (self: *MTLBlitCommandEncoder, sampleBuffer: *MTLCounterSampleBuffer, sampleIndex: NSUInteger, barrier: BOOL) -> void {
        func: #type (obj: *void, selector: *void, sampleBuffer: *MTLCounterSampleBuffer, sampleIndex: NSUInteger, barrier: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleCountersInBuffer_atSampleIndex_withBarrier_, sampleBuffer, sampleIndex, barrier);
    }

/*!
 @method resolveCounters:inRange:destinationBuffer:destinationOffset:
 @param sampleBuffer The sample buffer to resolve.
 @param range The range of indices to resolve.
 @param destinationBuffer The buffer to resolve values into.
 @param destinationOffset The offset to begin writing values out to.  This must be a multiple of
 the minimum constant buffer alignment.
 @abstract Resolve the counters from the raw buffer to a processed buffer.
 @discussion Samples that encountered an error during resolve will be set to
 MTLCounterErrorValue.
 */
    resolveCounters_inRange_destinationBuffer_destinationOffset_ :: (self: *MTLBlitCommandEncoder, sampleBuffer: *MTLCounterSampleBuffer, range: NSRange, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampleBuffer: *MTLCounterSampleBuffer, range: NSRange, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resolveCounters_inRange_destinationBuffer_destinationOffset_, sampleBuffer, range, destinationBuffer, destinationOffset);
    }

/// Encodes a command to copy data from a slice of one tensor into a slice of another tensor.
///
/// This command applies reshapes if `sourceTensor` and `destinationTensor` are not aliasable.
/// - Parameters:
///    - sourceTensor: A tensor instance that this command copies data from.
///    - sourceOrigin: An array of offsets, in elements, to the first element of the slice of `sourceTensor` that this command copies data from.
///    - sourceDimensions: An array of sizes, in elements, of the slice `sourceTensor` that this command copies data from.
///    - destinationTensor: A tensor instance that this command copies data to.
///    - destinationOrigin: An array of offsets, in elements, to the first element of the slice of `destinationTensor` that this command copies data to.
///    - destinationDimensions: An array of sizes, in elements, of the slice of `destinationTensor` that this command copies data to.
    copyFromTensor_sourceOrigin_sourceDimensions_toTensor_destinationOrigin_destinationDimensions_ :: (self: *MTLBlitCommandEncoder, sourceTensor: *MTLTensor, sourceOrigin: *MTLTensorExtents, sourceDimensions: *MTLTensorExtents, destinationTensor: *MTLTensor, destinationOrigin: *MTLTensorExtents, destinationDimensions: *MTLTensorExtents) -> void {
        func: #type (obj: *void, selector: *void, sourceTensor: *MTLTensor, sourceOrigin: *MTLTensorExtents, sourceDimensions: *MTLTensorExtents, destinationTensor: *MTLTensor, destinationOrigin: *MTLTensorExtents, destinationDimensions: *MTLTensorExtents) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromTensor_sourceOrigin_sourceDimensions_toTensor_destinationOrigin_destinationDimensions_, sourceTensor, sourceOrigin, sourceDimensions, destinationTensor, destinationOrigin, destinationDimensions);
    }

}

/*!
 @abstract Provides execution status information for a Metal command encoder.
 */
MTLCommandBufferEncoderInfo :: struct #type_info_no_size_complaint {
/*!
 @abstract The debug label given to the associated Metal command encoder at command buffer submission.
*/
    label :: (self: *MTLCommandBufferEncoderInfo) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

/*!
 @abstract The debug signposts inserted into the associated Metal command encoder.
*/
    debugSignposts :: (self: *MTLCommandBufferEncoderInfo) -> *NSArray(*NSString) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*NSString) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.debugSignposts);
    }

/*!
 @abstract The error state of the associated Metal command encoder.
*/
    errorState :: (self: *MTLCommandBufferEncoderInfo) -> MTLCommandEncoderErrorState {
        func: #type (obj: *void, selector: *void) -> MTLCommandEncoderErrorState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.errorState);
    }

}

/*!
 @protocol MTLCommandBuffer
 @abstract A serial list of commands for the device to execute.
 */
MTLCommandBuffer :: struct #type_info_no_size_complaint {
/*!
 @method enqueue
 @abstract Append this command buffer to the end of its MTLCommandQueue.
*/
    enqueue :: (self: *MTLCommandBuffer) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.enqueue);
    }

/*!
 @method commit
 @abstract Commit a command buffer so it can be executed as soon as possible.
 */
    commit :: (self: *MTLCommandBuffer) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.commit);
    }

/*!
 @method addScheduledHandler:block:
 @abstract Adds a block to be called when this command buffer has been scheduled for execution.
 */
    addScheduledHandler_ :: (self: *MTLCommandBuffer, block: MTLCommandBufferHandler) -> void {
        func: #type (obj: *void, selector: *void, block: MTLCommandBufferHandler) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addScheduledHandler_, block);
    }

/*!
 @method presentDrawable:
 @abstract Add a drawable present that will be invoked when this command buffer has been scheduled for execution.
 @discussion The submission thread will be lock stepped with present call been serviced by window server
 */
    presentDrawable_ :: (self: *MTLCommandBuffer, drawable: *MTLDrawable) -> void {
        func: #type (obj: *void, selector: *void, drawable: *MTLDrawable) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.presentDrawable_, drawable);
    }

/*!
 @method presentDrawable:atTime:
 @abstract Add a drawable present for a specific host time that will be invoked when this command buffer has been scheduled for execution.
 @discussion The submission thread will be lock stepped with present call been serviced by window server
*/
    presentDrawable_atTime_ :: (self: *MTLCommandBuffer, drawable: *MTLDrawable, presentationTime: CFTimeInterval) -> void {
        func: #type (obj: *void, selector: *void, drawable: *MTLDrawable, presentationTime: CFTimeInterval) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.presentDrawable_atTime_, drawable, presentationTime);
    }

/*!
 @method presentDrawable:afterMinimumDuration:
 @abstract Add a drawable present for a specific host time that allows previous frame to be on screen for at least duration time.
 @param drawable The drawable to be presented
 @param duration The minimum time that previous frame should be displayed. The time is double preceision floating point in the unit of seconds.
 @discussion The difference of this API versus presentDrawable:atTime is that this API defers calculation of the presentation time until the previous frame's actual presentation time is known, thus to be able to maintain a more consistent and stable frame time. This also provides an easy way to set frame rate.
    The submission thread will be lock stepped with present call been serviced by window server 
 */
    presentDrawable_afterMinimumDuration_ :: (self: *MTLCommandBuffer, drawable: *MTLDrawable, duration: CFTimeInterval) -> void {
        func: #type (obj: *void, selector: *void, drawable: *MTLDrawable, duration: CFTimeInterval) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.presentDrawable_afterMinimumDuration_, drawable, duration);
    }

/*!
 @method waitUntilScheduled
 @abstract Synchronously wait for this command buffer to be scheduled.
 */
    waitUntilScheduled :: (self: *MTLCommandBuffer) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.waitUntilScheduled);
    }

/*!
 @method addCompletedHandler:block:
 @abstract Add a block to be called when this command buffer has completed execution.
 */
    addCompletedHandler_ :: (self: *MTLCommandBuffer, block: MTLCommandBufferHandler) -> void {
        func: #type (obj: *void, selector: *void, block: MTLCommandBufferHandler) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addCompletedHandler_, block);
    }

/*!
 @method waitUntilCompleted
 @abstract Synchronously wait for this command buffer to complete.
 */
    waitUntilCompleted :: (self: *MTLCommandBuffer) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.waitUntilCompleted);
    }

/*!
 @method blitCommandEncoder
 @abstract returns a blit command encoder to encode into this command buffer.
 */
    blitCommandEncoder :: (self: *MTLCommandBuffer) -> *MTLBlitCommandEncoder {
        func: #type (obj: *void, selector: *void) -> *MTLBlitCommandEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.blitCommandEncoder);
    }

/*!
 @method renderCommandEncoderWithDescriptor:
 @abstract returns a render command endcoder to encode into this command buffer.
 */
    renderCommandEncoderWithDescriptor_ :: (self: *MTLCommandBuffer, renderPassDescriptor: *MTLRenderPassDescriptor) -> *MTLRenderCommandEncoder {
        func: #type (obj: *void, selector: *void, renderPassDescriptor: *MTLRenderPassDescriptor) -> *MTLRenderCommandEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.renderCommandEncoderWithDescriptor_, renderPassDescriptor);
    }

/*!
 @method computeCommandEncoderWithDescriptor:
 @abstract returns a compute command endcoder to encode into this command buffer.
 */
    computeCommandEncoderWithDescriptor_ :: (self: *MTLCommandBuffer, computePassDescriptor: *MTLComputePassDescriptor) -> *MTLComputeCommandEncoder {
        func: #type (obj: *void, selector: *void, computePassDescriptor: *MTLComputePassDescriptor) -> *MTLComputeCommandEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.computeCommandEncoderWithDescriptor_, computePassDescriptor);
    }

/*!
 @method blitCommandEncoderWithDescriptor:
 @abstract returns a blit command endcoder to encode into this command buffer.
 */
    blitCommandEncoderWithDescriptor_ :: (self: *MTLCommandBuffer, blitPassDescriptor: *MTLBlitPassDescriptor) -> *MTLBlitCommandEncoder {
        func: #type (obj: *void, selector: *void, blitPassDescriptor: *MTLBlitPassDescriptor) -> *MTLBlitCommandEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.blitCommandEncoderWithDescriptor_, blitPassDescriptor);
    }

/*!
 @method computeCommandEncoder
 @abstract returns a compute command encoder to encode into this command buffer.
 */
    computeCommandEncoder :: (self: *MTLCommandBuffer) -> *MTLComputeCommandEncoder {
        func: #type (obj: *void, selector: *void) -> *MTLComputeCommandEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.computeCommandEncoder);
    }

/*! 
 @method computeCommandEncoderWithDispatchType
 @abstract returns a compute command encoder to encode into this command buffer. Optionally allow this command encoder to execute dispatches concurrently.
 @discussion On devices that do not support concurrent command encoders, this call is equivalent to computeCommandEncoder
 */
    computeCommandEncoderWithDispatchType_ :: (self: *MTLCommandBuffer, dispatchType: MTLDispatchType) -> *MTLComputeCommandEncoder {
        func: #type (obj: *void, selector: *void, dispatchType: MTLDispatchType) -> *MTLComputeCommandEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.computeCommandEncoderWithDispatchType_, dispatchType);
    }

/*!
 @method encodeWaitForEvent:value:
 @abstract Encodes a command that pauses execution of this command buffer until the specified event reaches a given value.
 @discussion This method may only be called if there is no current command encoder on the receiver.
*/
    encodeWaitForEvent_value_ :: (self: *MTLCommandBuffer, event: *MTLEvent, value: u64) -> void {
        func: #type (obj: *void, selector: *void, event: *MTLEvent, value: u64) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.encodeWaitForEvent_value_, event, value);
    }

/*!
 @method encodeSignalEvent:value:
 @abstract Encodes a command that signals an event with a given value.
 @discussion This method may only be called if there is no current command encoder on the receiver.
 */
    encodeSignalEvent_value_ :: (self: *MTLCommandBuffer, event: *MTLEvent, value: u64) -> void {
        func: #type (obj: *void, selector: *void, event: *MTLEvent, value: u64) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.encodeSignalEvent_value_, event, value);
    }

/*!
 @method parallelRenderCommandEncoderWithDescriptor:
 @abstract returns a parallel render pass encoder to encode into this command buffer.
 */
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

/*!
 @method pushDebugGroup:
 @abstract Push a new named string onto a stack of string labels.
 */
    pushDebugGroup_ :: (self: *MTLCommandBuffer, str: *NSString) -> void {
        func: #type (obj: *void, selector: *void, str: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pushDebugGroup_, str);
    }

/*!
 @method popDebugGroup
 @abstract Pop the latest named string off of the stack.
 */
    popDebugGroup :: (self: *MTLCommandBuffer) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.popDebugGroup);
    }

/*!
  @method useResidencySet
  @abstract Marks the residency set as part of the current command buffer execution. This ensures that the residency set is resident during execution of the command buffer.
 */
    useResidencySet_ :: (self: *MTLCommandBuffer, residencySet: *MTLResidencySet) -> void {
        func: #type (obj: *void, selector: *void, residencySet: *MTLResidencySet) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useResidencySet_, residencySet);
    }

/*!
  @method useResidencySets
  @abstract Marks the residency sets as part of the current command buffer execution. This ensures that the residency sets are resident during execution of the command buffer.
 */
    useResidencySets_count_ :: (self: *MTLCommandBuffer, residencySets: **MTLResidencySet, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, residencySets: **MTLResidencySet, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useResidencySets_count_, residencySets, count);
    }

/*!
 @property device
 @abstract The device this resource was created against.
 */
    device :: (self: *MTLCommandBuffer) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

/*!
 @property commandQueue
 @abstract The command queue this command buffer was created from.
 */
    commandQueue :: (self: *MTLCommandBuffer) -> *MTLCommandQueue {
        func: #type (obj: *void, selector: *void) -> *MTLCommandQueue #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.commandQueue);
    }

/*!
 @property retainedReferences
 @abstract If YES, this command buffer holds strong references to objects needed to execute this command buffer.
 */
    retainedReferences :: (self: *MTLCommandBuffer) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.retainedReferences);
    }

/*!
 @abstract The set of options configuring the error reporting of the created command buffer.
*/
    errorOptions :: (self: *MTLCommandBuffer) -> MTLCommandBufferErrorOption {
        func: #type (obj: *void, selector: *void) -> MTLCommandBufferErrorOption #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.errorOptions);
    }

/*!
 @property label
 @abstract A string to help identify this object.
 */
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

/*!
@property logs
@abstract Logs generated by the command buffer during execution of the GPU commands. Valid after GPU execution is completed
*/
    logs :: (self: *MTLCommandBuffer) -> *MTLLogContainer {
        func: #type (obj: *void, selector: *void) -> *MTLLogContainer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.logs);
    }

/*!
 @property GPUStartTime
 @abstract The host time in seconds that GPU starts executing this command buffer. Returns zero if it has not started. This usually can be called in command buffer completion handler.
 */
    GPUStartTime :: (self: *MTLCommandBuffer) -> CFTimeInterval {
        func: #type (obj: *void, selector: *void) -> CFTimeInterval #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.GPUStartTime);
    }

/*!
 @property GPUEndTime
 @abstract The host time in seconds that GPU finishes executing this command buffer. Returns zero if CPU has not received completion notification. This usually can be called in command buffer completion handler.
 */
    GPUEndTime :: (self: *MTLCommandBuffer) -> CFTimeInterval {
        func: #type (obj: *void, selector: *void) -> CFTimeInterval #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.GPUEndTime);
    }

/*!
 @property status
 @abstract status reports the current stage in the lifetime of MTLCommandBuffer, as it proceeds to enqueued, committed, scheduled, and completed.
 */
    status :: (self: *MTLCommandBuffer) -> MTLCommandBufferStatus {
        func: #type (obj: *void, selector: *void) -> MTLCommandBufferStatus #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.status);
    }

/*!
 @property error
 @abstract If an error occurred during execution, the NSError may contain more details about the problem.
 */
    error :: (self: *MTLCommandBuffer) -> *NSError {
        func: #type (obj: *void, selector: *void) -> *NSError #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.error);
    }

}

/*!
 @protocol MTLComputeCommandEncoder
 @abstract A command encoder that writes data parallel compute commands.
 */
MTLComputeCommandEncoder :: struct #type_info_no_size_complaint {
/*!
 @method setComputePipelineState:
 @abstract Set the compute pipeline state that will be used.
 */
    setComputePipelineState_ :: (self: *MTLComputeCommandEncoder, state: *MTLComputePipelineState) -> void {
        func: #type (obj: *void, selector: *void, state: *MTLComputePipelineState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setComputePipelineState_, state);
    }

/*!
 @method setBytes:length:atIndex:
 @brief Set the data (by copy) for a given buffer binding point.  This will remove any existing MTLBuffer from the binding point.
 */
    setBytes_length_atIndex_ :: (self: *MTLComputeCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, bytes: *void, length: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBytes_length_atIndex_, bytes, length, index);
    }

/*!
 @method setBuffer:offset:atIndex:
 @brief Set a global buffer for all compute kernels at the given bind point index.
 */
    setBuffer_offset_atIndex_ :: (self: *MTLComputeCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBuffer_offset_atIndex_, buffer, offset, index);
    }

/*!
 @method setBufferOffset:atIndex:
 @brief Set the offset within the current global buffer for all compute kernels at the given bind point index.
 */
    setBufferOffset_atIndex_ :: (self: *MTLComputeCommandEncoder, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBufferOffset_atIndex_, offset, index);
    }

/*!
 @method setBuffers:offsets:withRange:
 @brief Set an array of global buffers for all compute kernels with the given bind point range.
 */
    setBuffers_offsets_withRange_ :: (self: *MTLComputeCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBuffers_offsets_withRange_, buffers, offsets, range);
    }

/*!
  @brief
    sets kernel buffer at specified index with provided offset and stride.
    only call this when the kernel-buffer is part of the stageInputDescriptor
    and has set its stride to `MTLBufferLayoutStrideDynamic`
*/
    setBuffer_offset_attributeStride_atIndex_ :: (self: *MTLComputeCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBuffer_offset_attributeStride_atIndex_, buffer, offset, stride, index);
    }

/*!
  @brief
    sets an array of kernel buffers with provided offsets and strides with the
    given bind point range. Only call this when at least one buffer is part of
    the vertexDescriptor, other buffers must set `MTLAttributeStrideStatic`
*/
    setBuffers_offsets_attributeStrides_withRange_ :: (self: *MTLComputeCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, strides: *NSUInteger, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, buffers: **MTLBuffer, offsets: *NSUInteger, strides: *NSUInteger, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBuffers_offsets_attributeStrides_withRange_, buffers, offsets, strides, range);
    }

/*!
  @brief
    only call this when the buffer-index is part of the stageInputDescriptor
    and has set its stride to `MTLBufferLayoutStrideDynamic`
*/
    setBufferOffset_attributeStride_atIndex_ :: (self: *MTLComputeCommandEncoder, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBufferOffset_attributeStride_atIndex_, offset, stride, index);
    }

/*!
  @brief
    only call this when the buffer-index is part of the stageInputDescriptor
    and has set its stride to `MTLBufferLayoutStrideDynamic`
*/
    setBytes_length_attributeStride_atIndex_ :: (self: *MTLComputeCommandEncoder, bytes: *void, length: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, bytes: *void, length: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBytes_length_attributeStride_atIndex_, bytes, length, stride, index);
    }

/*!
 * @method setVisibleFunctionTable:atBufferIndex:
 * @brief Set a visible function table at the given buffer index
 */
    setVisibleFunctionTable_atBufferIndex_ :: (self: *MTLComputeCommandEncoder, visibleFunctionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, visibleFunctionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVisibleFunctionTable_atBufferIndex_, visibleFunctionTable, bufferIndex);
    }

/*!
 * @method setVisibleFunctionTables:withBufferRange:
 * @brief Set visible function tables at the given buffer index range
 */
    setVisibleFunctionTables_withBufferRange_ :: (self: *MTLComputeCommandEncoder, visibleFunctionTables: **MTLVisibleFunctionTable, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, visibleFunctionTables: **MTLVisibleFunctionTable, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVisibleFunctionTables_withBufferRange_, visibleFunctionTables, range);
    }

/*!
 * @method setIntersectionFunctionTable:atBufferIndex:
 * @brief Set a visible function table at the given buffer index
 */
    setIntersectionFunctionTable_atBufferIndex_ :: (self: *MTLComputeCommandEncoder, intersectionFunctionTable: *MTLIntersectionFunctionTable, bufferIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, intersectionFunctionTable: *MTLIntersectionFunctionTable, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIntersectionFunctionTable_atBufferIndex_, intersectionFunctionTable, bufferIndex);
    }

/*!
 * @method setIntersectionFunctionTables:withBufferRange:
 * @brief Set visible function tables at the given buffer index range
 */
    setIntersectionFunctionTables_withBufferRange_ :: (self: *MTLComputeCommandEncoder, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIntersectionFunctionTables_withBufferRange_, intersectionFunctionTables, range);
    }

/*!
 @method setAccelerationStructure:atBufferIndex:
 @brief Set a global raytracing acceleration structure for all compute kernels at the given buffer bind point index.
 */
    setAccelerationStructure_atBufferIndex_ :: (self: *MTLComputeCommandEncoder, accelerationStructure: *MTLAccelerationStructure, bufferIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, accelerationStructure: *MTLAccelerationStructure, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAccelerationStructure_atBufferIndex_, accelerationStructure, bufferIndex);
    }

/*!
 @method setTexture:atIndex:
 @brief Set a global texture for all compute kernels at the given bind point index.
 */
    setTexture_atIndex_ :: (self: *MTLComputeCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTexture_atIndex_, texture, index);
    }

/*!
 @method setTextures:withRange:
 @brief Set an array of global textures for all compute kernels with the given bind point range.
 */
    setTextures_withRange_ :: (self: *MTLComputeCommandEncoder, textures: **MTLTexture, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, textures: **MTLTexture, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTextures_withRange_, textures, range);
    }

/*!
 @method setSamplerState:atIndex:
 @brief Set a global sampler for all compute kernels at the given bind point index.
 */
    setSamplerState_atIndex_ :: (self: *MTLComputeCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampler: *MTLSamplerState, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSamplerState_atIndex_, sampler, index);
    }

/*!
 @method setSamplers:withRange:
 @brief Set an array of global samplers for all compute kernels with the given bind point range.
 */
    setSamplerStates_withRange_ :: (self: *MTLComputeCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, samplers: **MTLSamplerState, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSamplerStates_withRange_, samplers, range);
    }

/*!
 @method setSamplerState:lodMinClamp:lodMaxClamp:atIndex:
 @brief Set a global sampler for all compute kernels at the given bind point index.
 */
    setSamplerState_lodMinClamp_lodMaxClamp_atIndex_ :: (self: *MTLComputeCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float32, lodMaxClamp: float32, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampler: *MTLSamplerState, lodMinClamp: float32, lodMaxClamp: float32, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSamplerState_lodMinClamp_lodMaxClamp_atIndex_, sampler, lodMinClamp, lodMaxClamp, index);
    }

/*!
 @method setSamplers:lodMinClamps:lodMaxClamps:withRange:
 @brief Set an array of global samplers for all compute kernels with the given bind point range.
 */
    setSamplerStates_lodMinClamps_lodMaxClamps_withRange_ :: (self: *MTLComputeCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float32, lodMaxClamps: *float32, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, samplers: **MTLSamplerState, lodMinClamps: *float32, lodMaxClamps: *float32, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSamplerStates_lodMinClamps_lodMaxClamps_withRange_, samplers, lodMinClamps, lodMaxClamps, range);
    }

/*!
 @method setThreadgroupMemoryLength:atIndex:
 @brief Set the threadgroup memory byte length at the binding point specified by the index. This applies to all compute kernels.
 */
    setThreadgroupMemoryLength_atIndex_ :: (self: *MTLComputeCommandEncoder, length: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, length: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setThreadgroupMemoryLength_atIndex_, length, index);
    }

/*!
 @method setImageblockWidth:height:
 @brief Set imageblock sizes.
 */
    setImageblockWidth_height_ :: (self: *MTLComputeCommandEncoder, width: NSUInteger, height: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, width: NSUInteger, height: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setImageblockWidth_height_, width, height);
    }

/*
 @method setStageInRegion:region:
 @brief Set the region of the stage_in attributes to apply the compute kernel.
*/
    setStageInRegion_ :: (self: *MTLComputeCommandEncoder, region: MTLRegion) -> void {
        func: #type (obj: *void, selector: *void, region: MTLRegion) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStageInRegion_, region);
    }

/*
 @method setStageInRegionWithIndirectBuffer:indirectBufferOffset:
 @abstract sets the stage in region indirectly for the following indirect dispatch calls.
 @param indirectBuffer A buffer object that the device will read the stageIn region arguments from, see MTLStageInRegionIndirectArguments.
 @param indirectBufferOffset Byte offset within indirectBuffer to read arguments from. indirectBufferOffset must be a multiple of 4.
 */
    setStageInRegionWithIndirectBuffer_indirectBufferOffset_ :: (self: *MTLComputeCommandEncoder, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStageInRegionWithIndirectBuffer_indirectBufferOffset_, indirectBuffer, indirectBufferOffset);
    }

/*
 @method dispatchThreadgroups:threadsPerThreadgroup:
 @abstract Enqueue a compute function dispatch as a multiple of the threadgroup size.
 */
    dispatchThreadgroups_threadsPerThreadgroup_ :: (self: *MTLComputeCommandEncoder, threadgroupsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, threadgroupsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dispatchThreadgroups_threadsPerThreadgroup_, threadgroupsPerGrid, threadsPerThreadgroup);
    }

/*
 @method dispatchThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerThreadgroup:
 @abstract Enqueue a compute function dispatch using an indirect buffer for threadgroupsPerGrid see MTLDispatchThreadgroupsIndirectArguments.
 @param indirectBuffer A buffer object that the device will read dispatchThreadgroups arguments from, see MTLDispatchThreadgroupsIndirectArguments.
 @param indirectBufferOffset Byte offset within @a indirectBuffer to read arguments from.  @a indirectBufferOffset must be a multiple of 4.
 */
    dispatchThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerThreadgroup_ :: (self: *MTLComputeCommandEncoder, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger, threadsPerThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger, threadsPerThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dispatchThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerThreadgroup_, indirectBuffer, indirectBufferOffset, threadsPerThreadgroup);
    }

/*
 @method dispatchThreads:threadsPerThreadgroup:
 @abstract Enqueue a compute function dispatch using an arbitrarily-sized grid.
 @discussion threadsPerGrid does not have to be a multiple of the  threadGroup size
 */
    dispatchThreads_threadsPerThreadgroup_ :: (self: *MTLComputeCommandEncoder, threadsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, threadsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dispatchThreads_threadsPerThreadgroup_, threadsPerGrid, threadsPerThreadgroup);
    }

/*!
 @method updateFence:
 @abstract Update the fence to capture all GPU work so far enqueued by this encoder.
 @discussion The fence is updated at kernel submission to maintain global order and prevent deadlock.
 Drivers may delay fence updates until the end of the encoder. Drivers may also wait on fences at the beginning of an encoder. It is therefore illegal to wait on a fence after it has been updated in the same encoder.
 */
    updateFence_ :: (self: *MTLComputeCommandEncoder, fence: *MTLFence) -> void {
        func: #type (obj: *void, selector: *void, fence: *MTLFence) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.updateFence_, fence);
    }

/*!
 @method waitForFence:
 @abstract Prevent further GPU work until the fence is reached.
 @discussion The fence is evaluated at kernel submission to maintain global order and prevent deadlock.
 Drivers may delay fence updates until the end of the encoder. Drivers may also wait on fences at the beginning of an encoder. It is therefore illegal to wait on a fence after it has been updated in the same encoder.
 */
    waitForFence_ :: (self: *MTLComputeCommandEncoder, fence: *MTLFence) -> void {
        func: #type (obj: *void, selector: *void, fence: *MTLFence) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.waitForFence_, fence);
    }

/*!
 * @method useResource:usage:
 * @abstract Declare that a resource may be accessed by the command encoder through an argument buffer
 * 
 * @discussion For tracked MTLResources, this method protects against data hazards. This method must be called before encoding any dispatch commands which may access the resource through an argument buffer.
 * @warning Prior to iOS 13, macOS 10.15, this method does not protect against data hazards. If you are deploying to older versions of macOS or iOS, use fences to ensure data hazards are resolved.
 */
    useResource_usage_ :: (self: *MTLComputeCommandEncoder, resource: *MTLResource, usage: MTLResourceUsage) -> void {
        func: #type (obj: *void, selector: *void, resource: *MTLResource, usage: MTLResourceUsage) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useResource_usage_, resource, usage);
    }

/*!
 * @method useResources:count:usage:
 * @abstract Declare that an array of resources may be accessed through an argument buffer by the command encoder
 * @discussion For tracked MTL Resources, this method protects against data hazards. This method must be called before encoding any dispatch commands which may access the resources through an argument buffer.
 * @warning Prior to iOS 13, macOS 10.15, this method does not protect against data hazards. If you are deploying to older versions of macOS or iOS, use fences to ensure data hazards are resolved.
 */
    useResources_count_usage_ :: (self: *MTLComputeCommandEncoder, resources: **MTLResource, count: NSUInteger, usage: MTLResourceUsage) -> void {
        func: #type (obj: *void, selector: *void, resources: **MTLResource, count: NSUInteger, usage: MTLResourceUsage) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useResources_count_usage_, resources, count, usage);
    }

/*!
 * @method useHeap:
 * @abstract Declare that the resources allocated from a heap may be accessed as readonly by the render pass through an argument buffer
 * @discussion For tracked MTLHeaps, this method protects against data hazards. This method must be called before encoding any dispatch commands which may access the resources allocated from the heap through an argument buffer. This method may cause all of the color attachments allocated from the heap to become decompressed. Therefore, it is recommended that the useResource:usage: or useResources:count:usage: methods be used for color attachments instead, with a minimal (i.e. read-only) usage.
 * @warning Prior to iOS 13, macOS 10.15, this method does not protect against data hazards. If you are deploying to older versions of macOS or iOS, use fences to ensure data hazards are resolved.
 */
    useHeap_ :: (self: *MTLComputeCommandEncoder, heap: *MTLHeap) -> void {
        func: #type (obj: *void, selector: *void, heap: *MTLHeap) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useHeap_, heap);
    }

/*!
 * @method useHeaps:count:
 * @abstract Declare that the resources allocated from an array of heaps may be accessed as readonly by the render pass through an argument buffer
 * @discussion For tracked MTLHeaps, this method protects against data hazards. This method must be called before encoding any dispatch commands which may access the resources allocated from the heaps through an argument buffer. This method may cause all of the color attachments allocated from the heaps to become decompressed. Therefore, it is recommended that the useResource:usage: or useResources:count:usage: methods be used for color attachments instead, with a minimal (i.e. read-only) usage.
 * @warning Prior to iOS 13, macOS 10.15, this method does not protect against data hazards. If you are deploying to older versions of macOS or iOS, use fences to ensure data hazards are resolved.
 */
    useHeaps_count_ :: (self: *MTLComputeCommandEncoder, heaps: **MTLHeap, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, heaps: **MTLHeap, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useHeaps_count_, heaps, count);
    }

/*!
 * @method executeCommandsInBuffer:withRange:
 * @abstract Execute commands in the buffer within the range specified.
 * @discussion The same indirect command buffer may be executed any number of times within the same encoder.
 */
    executeCommandsInBuffer_withRange_ :: (self: *MTLComputeCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, executionRange: NSRange) -> void {
        func: #type (obj: *void, selector: *void, indirectCommandBuffer: *MTLIndirectCommandBuffer, executionRange: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.executeCommandsInBuffer_withRange_, indirectCommandBuffer, executionRange);
    }

/*!
 * @method executeCommandsInBuffer:indirectBuffer:indirectBufferOffset:
 * @abstract Execute commands in the buffer within the range specified by the indirect range buffer.
 * @param indirectRangeBuffer An indirect buffer from which the device reads the execution range parameter, as laid out in the MTLIndirectCommandBufferExecutionRange structure.
 * @param indirectBufferOffset The byte offset within indirectBuffer where the execution range parameter is located. Must be a multiple of 4 bytes.
 * @discussion The same indirect command buffer may be executed any number of times within the same encoder.
 */
    executeCommandsInBuffer_indirectBuffer_indirectBufferOffset_ :: (self: *MTLComputeCommandEncoder, indirectCommandbuffer: *MTLIndirectCommandBuffer, indirectRangeBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, indirectCommandbuffer: *MTLIndirectCommandBuffer, indirectRangeBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.executeCommandsInBuffer_indirectBuffer_indirectBufferOffset_, indirectCommandbuffer, indirectRangeBuffer, indirectBufferOffset);
    }

/*!
 *@method memoryBarrierWithScope
 *@abstract Encodes a barrier between currently dispatched kernels in a concurrent compute command encoder and any subsequent ones on a specified resource group
 *@discussion  This API ensures that all dispatches in the encoder have completed execution and their side effects are visible to subsequent dispatches in that encoder. Calling barrier on a serial encoder is allowed, but ignored.
 */
    memoryBarrierWithScope_ :: (self: *MTLComputeCommandEncoder, scope: MTLBarrierScope) -> void {
        func: #type (obj: *void, selector: *void, scope: MTLBarrierScope) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.memoryBarrierWithScope_, scope);
    }

/*!
 *@method memoryBarrierWithResources
 *@abstract Encodes a barrier between currently dispatched kernels in a concurrent compute command encoder and any subsequent ones on an array of resources.
 *@discussion  This API ensures that all dispatches in the encoder have completed execution and side effects on the specified resources are visible to subsequent dispatches in that encoder. Calling barrier on a serial encoder is allowed, but ignored.
 */
    memoryBarrierWithResources_count_ :: (self: *MTLComputeCommandEncoder, resources: **MTLResource, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, resources: **MTLResource, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.memoryBarrierWithResources_count_, resources, count);
    }

/*!
 @method sampleCountersInBuffer:atSampleIndex:withBarrier:
 @abstract Sample hardware counters at this point in the compute encoder and
 store the counter sample into the sample buffer at the specified index.
 @param sampleBuffer The sample buffer to sample into
 @param sampleIndex The index into the counter buffer to write the sample
 @param barrier Insert a barrier before taking the sample.  Passing
 YES will ensure that all work encoded before this operation in the encoder is
 complete but does not isolate the work with respect to other encoders.  Passing
 NO will allow the sample to be taken concurrently with other operations in this
 encoder.
 In general, passing YES will lead to more repeatable counter results but
 may negatively impact performance.  Passing NO will generally be higher performance
 but counter results may not be repeatable.
 @discussion On devices where MTLCounterSamplingPointAtDispatchBoundary is unsupported,
 this method is not available and will generate an error if called.
 */
    sampleCountersInBuffer_atSampleIndex_withBarrier_ :: (self: *MTLComputeCommandEncoder, sampleBuffer: *MTLCounterSampleBuffer, sampleIndex: NSUInteger, barrier: BOOL) -> void {
        func: #type (obj: *void, selector: *void, sampleBuffer: *MTLCounterSampleBuffer, sampleIndex: NSUInteger, barrier: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleCountersInBuffer_atSampleIndex_withBarrier_, sampleBuffer, sampleIndex, barrier);
    }

/*!
 @property dispatchType
 @abstract The dispatch type of the compute command encoder.
 */
    dispatchType :: (self: *MTLComputeCommandEncoder) -> MTLDispatchType {
        func: #type (obj: *void, selector: *void) -> MTLDispatchType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dispatchType);
    }

}

/*!
 @protocol MTLCommandQueue
 @brief A serial queue of command buffers to be executed by the device.
 */
MTLCommandQueue :: struct #type_info_no_size_complaint {
/*! 
 @method commandBuffer
 @abstract Returns a new autoreleased command buffer used to encode work into this queue that 
 maintains strong references to resources used within the command buffer.
*/
    commandBuffer :: (self: *MTLCommandQueue) -> *MTLCommandBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLCommandBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.commandBuffer);
    }

/*!
 @method commandBufferWithDescriptor
 @param descriptor The requested properties of the command buffer.
 @abstract Returns a new autoreleased command buffer used to encode work into this queue.
*/
    commandBufferWithDescriptor_ :: (self: *MTLCommandQueue, descriptor: *MTLCommandBufferDescriptor) -> *MTLCommandBuffer {
        func: #type (obj: *void, selector: *void, descriptor: *MTLCommandBufferDescriptor) -> *MTLCommandBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.commandBufferWithDescriptor_, descriptor);
    }

/*!
 @method commandBufferWithUnretainedReferences
 @abstract Returns a new autoreleased command buffer used to encode work into this queue that 
 does not maintain strong references to resources used within the command buffer.
*/
    commandBufferWithUnretainedReferences :: (self: *MTLCommandQueue) -> *MTLCommandBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLCommandBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.commandBufferWithUnretainedReferences);
    }

/*!
 @method insertDebugCaptureBoundary
 @abstract Inform Xcode about when debug capture should start and stop.
 */
    insertDebugCaptureBoundary :: (self: *MTLCommandQueue) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.insertDebugCaptureBoundary);
    }

/*!
  @method addResidencySet
  @abstract Marks the residency set as part of the command queue execution. This ensures that the residency set is resident during execution of all the command buffers within the queue.
 */
    addResidencySet_ :: (self: *MTLCommandQueue, residencySet: *MTLResidencySet) -> void {
        func: #type (obj: *void, selector: *void, residencySet: *MTLResidencySet) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addResidencySet_, residencySet);
    }

/*!
  @method addResidencySets
  @abstract Marks the residency sets as part of the command queue execution. This ensures that the residency sets are resident during execution of all the command buffers within the queue.
 */
    addResidencySets_count_ :: (self: *MTLCommandQueue, residencySets: **MTLResidencySet, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, residencySets: **MTLResidencySet, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addResidencySets_count_, residencySets, count);
    }

/*!
  @method removeResidencySet
  @abstract Removes the residency set from the command queue execution. This ensures that only the remaining residency sets are resident during execution of all the command buffers within the queue.
 */
    removeResidencySet_ :: (self: *MTLCommandQueue, residencySet: *MTLResidencySet) -> void {
        func: #type (obj: *void, selector: *void, residencySet: *MTLResidencySet) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.removeResidencySet_, residencySet);
    }

/*!
  @method removeResidencySets
  @abstract Removes the residency sets from the command queue execution. This ensures that only the remaining residency sets are resident during execution of all the command buffers within the queue.
 */
    removeResidencySets_count_ :: (self: *MTLCommandQueue, residencySets: **MTLResidencySet, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, residencySets: **MTLResidencySet, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.removeResidencySets_count_, residencySets, count);
    }

/*! @brief A string to help identify this object */
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

/*! @brief The device this queue will submit to */
    device :: (self: *MTLCommandQueue) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

}

/* Device-specific compiled depth/stencil state object */
MTLDepthStencilState :: struct #type_info_no_size_complaint {
/*!
 @property label
 @abstract A string to help identify this object.
 */
    label :: (self: *MTLDepthStencilState) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

/*!
 @property device
 @abstract The device this resource was created against.  This resource can only be used with this device.
 */
    device :: (self: *MTLDepthStencilState) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

/*!
 @property gpuResourceID
 @abstract Handle of the GPU resource suitable for storing in an Argument Buffer
 */
    gpuResourceID :: (self: *MTLDepthStencilState) -> MTLResourceID {
        func: #type (obj: *void, selector: *void) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.gpuResourceID);
    }

}

/*!
 @protocol MTLDrawable
 @abstract All "drawable" objects (such as those coming from CAMetalLayer) are expected to conform to this protocol
 */
MTLDrawable :: struct #type_info_no_size_complaint {
/* Present this drawable as soon as possible */
    present :: (self: *MTLDrawable) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.present);
    }

/* Present this drawable at the given host time */
    presentAtTime_ :: (self: *MTLDrawable, presentationTime: CFTimeInterval) -> void {
        func: #type (obj: *void, selector: *void, presentationTime: CFTimeInterval) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.presentAtTime_, presentationTime);
    }

/*!
 @method presentAfterMinimumDuration
 @abstract Present this drawable while setting a minimum duration in seconds before allowing this drawable to appear on the display.
 @param duration Duration in seconds before this drawable is allowed to appear on the display
 */
    presentAfterMinimumDuration_ :: (self: *MTLDrawable, duration: CFTimeInterval) -> void {
        func: #type (obj: *void, selector: *void, duration: CFTimeInterval) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.presentAfterMinimumDuration_, duration);
    }

/*!
 @method addPresentedHandler
 @abstract Add a block to be called when this drawable is presented on screen.
 */
    addPresentedHandler_ :: (self: *MTLDrawable, block: MTLDrawablePresentedHandler) -> void {
        func: #type (obj: *void, selector: *void, block: MTLDrawablePresentedHandler) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addPresentedHandler_, block);
    }

/*!
 @property presentedTime
 @abstract The host time that this drawable was presented on screen.
 @discussion Returns 0 if a frame has not been presented or has been skipped.
 */
    presentedTime :: (self: *MTLDrawable) -> CFTimeInterval {
        func: #type (obj: *void, selector: *void) -> CFTimeInterval #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.presentedTime);
    }

/*!
 @property drawableID
 @abstract The monotonically incremented ID for all MTLDrawable objects created from the same CAMetalLayer object.
  @discussion The value starts from 0.
*/
    drawableID :: (self: *MTLDrawable) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawableID);
    }

}

/*!
 @protocol MTLComputePipelineState
 @abstract A handle to compiled code for a compute function.
 @discussion MTLComputePipelineState is a single compute function.  It can only be used with the device that it was created against.
*/
MTLComputePipelineState :: struct #type_info_no_size_complaint {
/// Gets the function handle for a function this pipeline links at the Metal IR level by name.
///
/// - Parameters:
///   - name: A string representing the name of the function.
///
/// - Returns: A function handle corresponding to the function if the name matches a function in this pipeline state,
/// otherwise `nil`.
    functionHandleWithName_ :: (self: *MTLComputePipelineState, name: *NSString) -> *MTLFunctionHandle {
        func: #type (obj: *void, selector: *void, name: *NSString) -> *MTLFunctionHandle #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionHandleWithName_, name);
    }

/// Gets the function handle for a function this pipeline links at the binary level.
///
/// - Parameters:
///   - function: A binary function object representing the function binary to find.
///
/// - Returns: A function handle corresponding to the function if the binary function matches a function in this
///            pipeline state, otherwise `nil`.
    functionHandleWithBinaryFunction_ :: (self: *MTLComputePipelineState, function: *MTL4BinaryFunction) -> *MTLFunctionHandle {
        func: #type (obj: *void, selector: *void, function: *MTL4BinaryFunction) -> *MTLFunctionHandle #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionHandleWithBinaryFunction_, function);
    }

/// Allocates a new compute pipeline state by adding binary functions to this pipeline state.
///
/// - Parameters:
///   - additionalBinaryFunctions: A non-`nil` array containing binary functions to add to this pipeline.
///   - error: An optional parameter into which Metal stores information in case of an error.
///
/// - Returns: A new compute pipeline state upon success, otherwise `nil`.
    newComputePipelineStateWithBinaryFunctions_error_ :: (self: *MTLComputePipelineState, additionalBinaryFunctions: *NSArray(*MTL4BinaryFunction), error: **NSError) -> *MTLComputePipelineState {
        func: #type (obj: *void, selector: *void, additionalBinaryFunctions: *NSArray(*MTL4BinaryFunction), error: **NSError) -> *MTLComputePipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newComputePipelineStateWithBinaryFunctions_error_, additionalBinaryFunctions, error);
    }

/*!
 @method imageblockMemoryLengthForDimensions:
 @brief Returns imageblock memory length for given image block dimensions.
 */
    imageblockMemoryLengthForDimensions_ :: (self: *MTLComputePipelineState, imageblockDimensions: MTLSize) -> NSUInteger {
        func: #type (obj: *void, selector: *void, imageblockDimensions: MTLSize) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.imageblockMemoryLengthForDimensions_, imageblockDimensions);
    }

/*!
 @method functionHandleWithFunction:
 @brief Get the function handle for the specified function from the pipeline state.
 */
    functionHandleWithFunction_ :: (self: *MTLComputePipelineState, function: *MTLFunction) -> *MTLFunctionHandle {
        func: #type (obj: *void, selector: *void, function: *MTLFunction) -> *MTLFunctionHandle #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionHandleWithFunction_, function);
    }

/*!
 @method newRenderPipelineStateWithAdditionalBinaryFunctions:stage:
 @brief Allocate a new compute pipeline state by adding binary functions to this pipeline state.
 */
    newComputePipelineStateWithAdditionalBinaryFunctions_error_ :: (self: *MTLComputePipelineState, functions: *NSArray(*MTLFunction), error: **NSError) -> *MTLComputePipelineState {
        func: #type (obj: *void, selector: *void, functions: *NSArray(*MTLFunction), error: **NSError) -> *MTLComputePipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newComputePipelineStateWithAdditionalBinaryFunctions_error_, functions, error);
    }

/*!
 @method newVisibleFunctionTableWithDescriptor:
 @brief Allocate a visible function table for the pipeline with the provided descriptor.
 */
    newVisibleFunctionTableWithDescriptor_ :: (self: *MTLComputePipelineState, descriptor: *MTLVisibleFunctionTableDescriptor) -> *MTLVisibleFunctionTable {
        func: #type (obj: *void, selector: *void, descriptor: *MTLVisibleFunctionTableDescriptor) -> *MTLVisibleFunctionTable #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newVisibleFunctionTableWithDescriptor_, descriptor);
    }

/*!
 @method newIntersectionFunctionTableWithDescriptor:
 @brief Allocate an intersection function table for the pipeline with the provided descriptor.
 */
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

///
/// > Tip:
/// Verify the apps that need reflection information in production by testing them
/// without a frame capture, Metal API validation layer, or shader validation layer.
///
/// The property is `nil` when you create a pipeline state from an``MTLDevice`` instance,
/// such as with its ``MTLDevice/newComputePipelineStateWithDescriptor:options:completionHandler:`` method.
    reflection :: (self: *MTLComputePipelineState) -> *MTLComputePipelineReflection {
        func: #type (obj: *void, selector: *void) -> *MTLComputePipelineReflection #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reflection);
    }

/*!
 @property device
 @abstract The device this resource was created against.  This resource can only be used with this device.
 */
    device :: (self: *MTLComputePipelineState) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

/*!
 @property maxTotalThreadsPerThreadgroup
 @abstract The maximum total number of threads that can be in a single compute threadgroup.
 */
    maxTotalThreadsPerThreadgroup :: (self: *MTLComputePipelineState) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadsPerThreadgroup);
    }

/*!
 @property threadExecutionWidth
 @abstract For most efficient execution, the threadgroup size should be a multiple of this when executing the kernel.
 */
    threadExecutionWidth :: (self: *MTLComputePipelineState) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.threadExecutionWidth);
    }

/*!
 @property staticThreadgroupMemoryLength
 @abstract The length in bytes of threadgroup memory that is statically allocated.
 */
    staticThreadgroupMemoryLength :: (self: *MTLComputePipelineState) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.staticThreadgroupMemoryLength);
    }

/*!
 @property supportIndirectCommandBuffers
 @abstract Tells whether this pipeline state is usable through an Indirect Command Buffer.
 */
    supportIndirectCommandBuffers :: (self: *MTLComputePipelineState) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.supportIndirectCommandBuffers);
    }

/*!
 @property gpuResourceID
 @abstract Handle of the GPU resource suitable for storing in an Argument Buffer
 */
    gpuResourceID :: (self: *MTLComputePipelineState) -> MTLResourceID {
        func: #type (obj: *void, selector: *void) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.gpuResourceID);
    }

/*!
 @property shaderValidation
 @abstract Current state of Shader Validation for the pipeline.
 */
    shaderValidation :: (self: *MTLComputePipelineState) -> MTLShaderValidation {
        func: #type (obj: *void, selector: *void) -> MTLShaderValidation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.shaderValidation);
    }

/*!
 @property requiredThreadsPerThreadgroup
 @abstract The required size of every compute threadgroup.
*/
    requiredThreadsPerThreadgroup :: (self: *MTLComputePipelineState) -> MTLSize {
        func: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.requiredThreadsPerThreadgroup);
    }

}

/*!
 @protocol MTLRenderCommandEncoder
 @discussion MTLRenderCommandEncoder is a container for graphics rendering state and the code to translate the state into a command format that the device can execute. 
 */
MTLRenderCommandEncoder :: struct #type_info_no_size_complaint {
/*!
 @method setRenderPipelineState
 @brief Sets the current render pipeline state object.
 */
    setRenderPipelineState_ :: (self: *MTLRenderCommandEncoder, pipelineState: *MTLRenderPipelineState) -> void {
        func: #type (obj: *void, selector: *void, pipelineState: *MTLRenderPipelineState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRenderPipelineState_, pipelineState);
    }

/*!
 @method setVertexBytes:length:atIndex:
 @brief Set the data (by copy) for a given vertex buffer binding point.  This will remove any existing MTLBuffer from the binding point.
 */
    setVertexBytes_length_atIndex_ :: (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, bytes: *void, length: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexBytes_length_atIndex_, bytes, length, index);
    }

/*!
 @method setVertexBuffer:offset:atIndex:
 @brief Set a global buffer for all vertex shaders at the given bind point index.
 */
    setVertexBuffer_offset_atIndex_ :: (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexBuffer_offset_atIndex_, buffer, offset, index);
    }

/*!
 @method setVertexBufferOffset:atIndex:
 @brief Set the offset within the current global buffer for all vertex shaders at the given bind point index.
 */
    setVertexBufferOffset_atIndex_ :: (self: *MTLRenderCommandEncoder, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexBufferOffset_atIndex_, offset, index);
    }

/*!
 @method setVertexBuffers:offsets:withRange:
 @brief Set an array of global buffers for all vertex shaders with the given bind point range.
 */
    setVertexBuffers_offsets_withRange_ :: (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexBuffers_offsets_withRange_, buffers, offsets, range);
    }

/*!
  @brief
    sets vertex buffer at specified index with provided offset and stride. Only
    call this when the buffer-index is part of the vertexDescriptor and has set
    its stride to `MTLBufferLayoutStrideDynamic`
*/
    setVertexBuffer_offset_attributeStride_atIndex_ :: (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexBuffer_offset_attributeStride_atIndex_, buffer, offset, stride, index);
    }

/*!
  @brief
    sets an array of vertex buffers with provided offsets and strides with the
    given bind point range.
    only call this when at least one buffer is part of the
    vertexDescriptor, other buffers must set their value relative to the
    `attributeStrides` array to `MTLAttributeStrideStatic`
*/
    setVertexBuffers_offsets_attributeStrides_withRange_ :: (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, strides: *NSUInteger, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, buffers: **MTLBuffer, offsets: *NSUInteger, strides: *NSUInteger, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexBuffers_offsets_attributeStrides_withRange_, buffers, offsets, strides, range);
    }

/*!
  @brief
    only call this when the buffer-index is part of the vertexDescriptor and
    has set its stride to `MTLBufferLayoutStrideDynamic`
*/
    setVertexBufferOffset_attributeStride_atIndex_ :: (self: *MTLRenderCommandEncoder, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexBufferOffset_attributeStride_atIndex_, offset, stride, index);
    }

/*!
  @brief
    only call this when the buffer-index is part of the vertexDescriptor and
    has set its stride to `MTLBufferLayoutStrideDynamic`
*/
    setVertexBytes_length_attributeStride_atIndex_ :: (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, bytes: *void, length: NSUInteger, stride: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexBytes_length_attributeStride_atIndex_, bytes, length, stride, index);
    }

/*!
 @method setVertexTexture:atIndex:
 @brief Set a global texture for all vertex shaders at the given bind point index.
 */
    setVertexTexture_atIndex_ :: (self: *MTLRenderCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexTexture_atIndex_, texture, index);
    }

/*!
 @method setVertexTextures:withRange:
 @brief Set an array of global textures for all vertex shaders with the given bind point range.
 */
    setVertexTextures_withRange_ :: (self: *MTLRenderCommandEncoder, textures: **MTLTexture, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, textures: **MTLTexture, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexTextures_withRange_, textures, range);
    }

/*!
 @method setVertexSamplerState:atIndex:
 @brief Set a global sampler for all vertex shaders at the given bind point index.
 */
    setVertexSamplerState_atIndex_ :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampler: *MTLSamplerState, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexSamplerState_atIndex_, sampler, index);
    }

/*!
 @method setVertexSamplerStates:withRange:
 @brief Set an array of global samplers for all vertex shaders with the given bind point range.
 */
    setVertexSamplerStates_withRange_ :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, samplers: **MTLSamplerState, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexSamplerStates_withRange_, samplers, range);
    }

/*!
 @method setVertexSamplerState:lodMinClamp:lodMaxClamp:atIndex:
 @brief Set a global sampler for all vertex shaders at the given bind point index.
 */
    setVertexSamplerState_lodMinClamp_lodMaxClamp_atIndex_ :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float32, lodMaxClamp: float32, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampler: *MTLSamplerState, lodMinClamp: float32, lodMaxClamp: float32, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexSamplerState_lodMinClamp_lodMaxClamp_atIndex_, sampler, lodMinClamp, lodMaxClamp, index);
    }

/*!
 @method setVertexSamplerStates:lodMinClamps:lodMaxClamps:withRange:
 @brief Set an array of global samplers for all vertex shaders with the given bind point range.
 */
    setVertexSamplerStates_lodMinClamps_lodMaxClamps_withRange_ :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float32, lodMaxClamps: *float32, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, samplers: **MTLSamplerState, lodMinClamps: *float32, lodMaxClamps: *float32, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexSamplerStates_lodMinClamps_lodMaxClamps_withRange_, samplers, lodMinClamps, lodMaxClamps, range);
    }

/*!
 @method setVertexVisibleFunctionTable:atBufferIndex:
 @brief Set a global visible function table for all vertex shaders at the given buffer bind point index.
 */
    setVertexVisibleFunctionTable_atBufferIndex_ :: (self: *MTLRenderCommandEncoder, functionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, functionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexVisibleFunctionTable_atBufferIndex_, functionTable, bufferIndex);
    }

/*!
 @method setVertexVisibleFunctionTables:withBufferRange:
 @brief Set an array of global visible function tables for all vertex shaders with the given buffer bind point range.
 */
    setVertexVisibleFunctionTables_withBufferRange_ :: (self: *MTLRenderCommandEncoder, functionTables: **MTLVisibleFunctionTable, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, functionTables: **MTLVisibleFunctionTable, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexVisibleFunctionTables_withBufferRange_, functionTables, range);
    }

/*!
 @method setVertexIntersectionFunctionTable:atBufferIndex:
 @brief Set a global intersection function table for all vertex shaders at the given buffer bind point index.
 */
    setVertexIntersectionFunctionTable_atBufferIndex_ :: (self: *MTLRenderCommandEncoder, intersectionFunctionTable: *MTLIntersectionFunctionTable, bufferIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, intersectionFunctionTable: *MTLIntersectionFunctionTable, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexIntersectionFunctionTable_atBufferIndex_, intersectionFunctionTable, bufferIndex);
    }

/*!
 @method setVertexIntersectionFunctionTables:withBufferRange:
 @brief Set an array of global intersection function tables for all vertex shaders with the given buffer bind point range.
 */
    setVertexIntersectionFunctionTables_withBufferRange_ :: (self: *MTLRenderCommandEncoder, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexIntersectionFunctionTables_withBufferRange_, intersectionFunctionTables, range);
    }

/*!
 @method setVertexAccelerationStructure:atBufferIndex:
 @brief Set a global acceleration structure for all vertex shaders at the given buffer bind point index.
 */
    setVertexAccelerationStructure_atBufferIndex_ :: (self: *MTLRenderCommandEncoder, accelerationStructure: *MTLAccelerationStructure, bufferIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, accelerationStructure: *MTLAccelerationStructure, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexAccelerationStructure_atBufferIndex_, accelerationStructure, bufferIndex);
    }

/*!
 @method setViewport:
 @brief Set the viewport, which is used to transform vertexes from normalized device coordinates to window coordinates.  Fragments that lie outside of the viewport are clipped, and optionally clamped for fragments outside of znear/zfar.
 */
    setViewport_ :: (self: *MTLRenderCommandEncoder, viewport: MTLViewport) -> void {
        func: #type (obj: *void, selector: *void, viewport: MTLViewport) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setViewport_, viewport);
    }

/*!
 @method setViewports:
 @brief Specifies an array of viewports, which are used to transform vertices from normalized device coordinates to window coordinates based on [[ viewport_array_index ]] value specified in the vertex shader.
 */
    setViewports_count_ :: (self: *MTLRenderCommandEncoder, viewports: *MTLViewport, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, viewports: *MTLViewport, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setViewports_count_, viewports, count);
    }

/*!
 @method setFrontFacingWinding:
 @brief The winding order of front-facing primitives.
 */
    setFrontFacingWinding_ :: (self: *MTLRenderCommandEncoder, frontFacingWinding: MTLWinding) -> void {
        func: #type (obj: *void, selector: *void, frontFacingWinding: MTLWinding) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFrontFacingWinding_, frontFacingWinding);
    }

/*!
 @method setVertexAmplificationCount:
 @brief Specifies the vertex amplification count and associated view mappings for each amplification ID.
 @param count the amplification count. The maximum value is currently 2.
 @param viewMappings an array of mapping elements.
 @discussion Each mapping element describes how to route the corresponding amplification ID to a specific viewport and render target array index by using offsets from the base array index provided by the [[render_target_array_index]] and/or [[viewport_array_index]] output attributes in the vertex shader. This allows a modicum of programmability for each amplified vertex to be routed to a different [[render_target_array_index]] and [[viewport_array_index]] even though these attribytes cannot be amplified themselves.
 */
    setVertexAmplificationCount_viewMappings_ :: (self: *MTLRenderCommandEncoder, count: NSUInteger, viewMappings: *MTLVertexAmplificationViewMapping) -> void {
        func: #type (obj: *void, selector: *void, count: NSUInteger, viewMappings: *MTLVertexAmplificationViewMapping) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexAmplificationCount_viewMappings_, count, viewMappings);
    }

/*!
 @method setCullMode:
 @brief Controls if primitives are culled when front facing, back facing, or not culled at all.
 */
    setCullMode_ :: (self: *MTLRenderCommandEncoder, cullMode: MTLCullMode) -> void {
        func: #type (obj: *void, selector: *void, cullMode: MTLCullMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCullMode_, cullMode);
    }

/*!
@method setDepthClipMode:
@brief Controls what is done with fragments outside of the near or far planes.
*/
    setDepthClipMode_ :: (self: *MTLRenderCommandEncoder, depthClipMode: MTLDepthClipMode) -> void {
        func: #type (obj: *void, selector: *void, depthClipMode: MTLDepthClipMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthClipMode_, depthClipMode);
    }

/*!
 @method setDepthBias:slopeScale:clamp:
 @brief Depth Bias.
 */
    setDepthBias_slopeScale_clamp_ :: (self: *MTLRenderCommandEncoder, depthBias: float32, slopeScale: float32, clamp: float32) -> void {
        func: #type (obj: *void, selector: *void, depthBias: float32, slopeScale: float32, clamp: float32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthBias_slopeScale_clamp_, depthBias, slopeScale, clamp);
    }

/// Configures the minimum and maximum bounds for depth bounds testing.
///
/// The render command encoder disables depth bounds testing by default.
/// The render command encoder also disables depth bounds testing when all of the following properties equal a specific value:
/// - The `minBound` property is equal to `0.0f`.
/// - The `maxBound` property is equal to `1.0f`.
/// Both `minBound` and `maxBound` need to be within `[0.0f, 1.0f]`, and `minBound` needs to be less than or equal to `maxBound`.
/// - Parameters:
///   - minBound: A minimum bound for depth testing, which discards fragments with a stored depth that is less than `minBound`.
///   - maxBound: A maximum bound for depth testing, which discards fragments with a stored depth that is greater than `maxBound`.
    setDepthTestMinBound_maxBound_ :: (self: *MTLRenderCommandEncoder, minBound: float32, maxBound: float32) -> void {
        func: #type (obj: *void, selector: *void, minBound: float32, maxBound: float32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthTestMinBound_maxBound_, minBound, maxBound);
    }

/*!
 @method setScissorRect:
 @brief Specifies a rectangle for a fragment scissor test.  All fragments outside of this rectangle are discarded.
 */
    setScissorRect_ :: (self: *MTLRenderCommandEncoder, rect: MTLScissorRect) -> void {
        func: #type (obj: *void, selector: *void, rect: MTLScissorRect) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setScissorRect_, rect);
    }

/*!
 @method setScissorRects:
 @brief Specifies an array of rectangles for a fragment scissor test. The specific rectangle used is based on the [[ viewport_array_index ]] value output by the vertex shader. Fragments that lie outside the scissor rectangle are discarded.
 */
    setScissorRects_count_ :: (self: *MTLRenderCommandEncoder, scissorRects: *MTLScissorRect, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, scissorRects: *MTLScissorRect, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setScissorRects_count_, scissorRects, count);
    }

/*!
 @method setTriangleFillMode:
 @brief Set how to rasterize triangle and triangle strip primitives.
 */
    setTriangleFillMode_ :: (self: *MTLRenderCommandEncoder, fillMode: MTLTriangleFillMode) -> void {
        func: #type (obj: *void, selector: *void, fillMode: MTLTriangleFillMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTriangleFillMode_, fillMode);
    }

/*!
 @method setFragmentBytes:length:atIndex:
 @brief Set the data (by copy) for a given fragment buffer binding point.  This will remove any existing MTLBuffer from the binding point.
 */
    setFragmentBytes_length_atIndex_ :: (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, bytes: *void, length: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentBytes_length_atIndex_, bytes, length, index);
    }

/*!
 @method setFragmentBuffer:offset:atIndex:
 @brief Set a global buffer for all fragment shaders at the given bind point index.
 */
    setFragmentBuffer_offset_atIndex_ :: (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentBuffer_offset_atIndex_, buffer, offset, index);
    }

/*!
 @method setFragmentBufferOffset:atIndex:
 @brief Set the offset within the current global buffer for all fragment shaders at the given bind point index.
 */
    setFragmentBufferOffset_atIndex_ :: (self: *MTLRenderCommandEncoder, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentBufferOffset_atIndex_, offset, index);
    }

/*!
 @method setFragmentBuffers:offsets:withRange:
 @brief Set an array of global buffers for all fragment shaders with the given bind point range.
 */
    setFragmentBuffers_offsets_withRange_ :: (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentBuffers_offsets_withRange_, buffers, offsets, range);
    }

/*!
 @method setFragmentTexture:atIndex:
 @brief Set a global texture for all fragment shaders at the given bind point index.
 */
    setFragmentTexture_atIndex_ :: (self: *MTLRenderCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentTexture_atIndex_, texture, index);
    }

/*!
 @method setFragmentTextures:withRange:
 @brief Set an array of global textures for all fragment shaders with the given bind point range.
 */
    setFragmentTextures_withRange_ :: (self: *MTLRenderCommandEncoder, textures: **MTLTexture, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, textures: **MTLTexture, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentTextures_withRange_, textures, range);
    }

/*!
 @method setFragmentSamplerState:atIndex:
 @brief Set a global sampler for all fragment shaders at the given bind point index.
 */
    setFragmentSamplerState_atIndex_ :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampler: *MTLSamplerState, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentSamplerState_atIndex_, sampler, index);
    }

/*!
 @method setFragmentSamplerStates:withRange:
 @brief Set an array of global samplers for all fragment shaders with the given bind point range.
 */
    setFragmentSamplerStates_withRange_ :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, samplers: **MTLSamplerState, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentSamplerStates_withRange_, samplers, range);
    }

/*!
 @method setFragmentSamplerState:lodMinClamp:lodMaxClamp:atIndex:
 @brief Set a global sampler for all fragment shaders at the given bind point index.
 */
    setFragmentSamplerState_lodMinClamp_lodMaxClamp_atIndex_ :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float32, lodMaxClamp: float32, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampler: *MTLSamplerState, lodMinClamp: float32, lodMaxClamp: float32, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentSamplerState_lodMinClamp_lodMaxClamp_atIndex_, sampler, lodMinClamp, lodMaxClamp, index);
    }

/*!
 @method setFragmentSamplerStates:lodMinClamps:lodMaxClamps:withRange:
 @brief Set an array of global samplers for all fragment shaders with the given bind point range.
 */
    setFragmentSamplerStates_lodMinClamps_lodMaxClamps_withRange_ :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float32, lodMaxClamps: *float32, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, samplers: **MTLSamplerState, lodMinClamps: *float32, lodMaxClamps: *float32, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentSamplerStates_lodMinClamps_lodMaxClamps_withRange_, samplers, lodMinClamps, lodMaxClamps, range);
    }

/*!
 @method setFragmentVisibleFunctionTable:atBufferIndex:
 @brief Set a global visible function table for all fragment shaders at the given buffer bind point index.
 */
    setFragmentVisibleFunctionTable_atBufferIndex_ :: (self: *MTLRenderCommandEncoder, functionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, functionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentVisibleFunctionTable_atBufferIndex_, functionTable, bufferIndex);
    }

/*!
 @method setFragmentVisibleFunctionTables:withBufferRange:
 @brief Set an array of global visible function tables for all fragment shaders with the given buffer bind point range.
 */
    setFragmentVisibleFunctionTables_withBufferRange_ :: (self: *MTLRenderCommandEncoder, functionTables: **MTLVisibleFunctionTable, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, functionTables: **MTLVisibleFunctionTable, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentVisibleFunctionTables_withBufferRange_, functionTables, range);
    }

/*!
 @method setFragmentIntersectionFunctionTable:atBufferIndex:
 @brief Set a global intersection function table for all fragment shaders at the given buffer bind point index.
 */
    setFragmentIntersectionFunctionTable_atBufferIndex_ :: (self: *MTLRenderCommandEncoder, intersectionFunctionTable: *MTLIntersectionFunctionTable, bufferIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, intersectionFunctionTable: *MTLIntersectionFunctionTable, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentIntersectionFunctionTable_atBufferIndex_, intersectionFunctionTable, bufferIndex);
    }

/*!
 @method setFragmentIntersectionFunctionTables:withBufferRange:
 @brief Set an array of global intersection function tables for all fragment shaders with the given buffer bind point range.
 */
    setFragmentIntersectionFunctionTables_withBufferRange_ :: (self: *MTLRenderCommandEncoder, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentIntersectionFunctionTables_withBufferRange_, intersectionFunctionTables, range);
    }

/*!
 @method setFragmentAccelerationStructure:atBufferIndex:
 @brief Set a global acceleration structure for all fragment shaders at the given buffer bind point index.
 */
    setFragmentAccelerationStructure_atBufferIndex_ :: (self: *MTLRenderCommandEncoder, accelerationStructure: *MTLAccelerationStructure, bufferIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, accelerationStructure: *MTLAccelerationStructure, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFragmentAccelerationStructure_atBufferIndex_, accelerationStructure, bufferIndex);
    }

/* Constant Blend Color */
/*!
 @method setBlendColorRed:green:blue:alpha:
 @brief Set the constant blend color used across all blending on all render targets
 */
    setBlendColorRed_green_blue_alpha_ :: (self: *MTLRenderCommandEncoder, red: float32, green: float32, blue: float32, alpha: float32) -> void {
        func: #type (obj: *void, selector: *void, red: float32, green: float32, blue: float32, alpha: float32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBlendColorRed_green_blue_alpha_, red, green, blue, alpha);
    }

/*! 
 @method setDepthStencilState:
 @brief Set the DepthStencil state object.
 */
    setDepthStencilState_ :: (self: *MTLRenderCommandEncoder, depthStencilState: *MTLDepthStencilState) -> void {
        func: #type (obj: *void, selector: *void, depthStencilState: *MTLDepthStencilState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthStencilState_, depthStencilState);
    }

/*! 
 @method setStencilReferenceValue:
 @brief Set the stencil reference value for both the back and front stencil buffers.
 */
    setStencilReferenceValue_ :: (self: *MTLRenderCommandEncoder, referenceValue: u32) -> void {
        func: #type (obj: *void, selector: *void, referenceValue: u32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilReferenceValue_, referenceValue);
    }

/*!
 @method setStencilFrontReferenceValue:backReferenceValue:
 @brief Set the stencil reference value for the back and front stencil buffers independently.
 */
    setStencilFrontReferenceValue_backReferenceValue_ :: (self: *MTLRenderCommandEncoder, frontReferenceValue: u32, backReferenceValue: u32) -> void {
        func: #type (obj: *void, selector: *void, frontReferenceValue: u32, backReferenceValue: u32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilFrontReferenceValue_backReferenceValue_, frontReferenceValue, backReferenceValue);
    }

/*!
 @method setVisibilityResultMode:offset:
 @abstract Monitor if samples pass the depth and stencil tests.
 @param mode Controls if the counter is disabled or moniters passing samples.
 @param offset The offset relative to the occlusion query buffer provided when the command encoder was created.  offset must be a multiple of 8.
 */
    setVisibilityResultMode_offset_ :: (self: *MTLRenderCommandEncoder, mode: MTLVisibilityResultMode, offset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, mode: MTLVisibilityResultMode, offset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVisibilityResultMode_offset_, mode, offset);
    }

/*!
 @method setColorStoreAction:atIndex:
 @brief If the the store action for a given color attachment was set to MTLStoreActionUnknown when the render command encoder was created,
 setColorStoreAction:atIndex: must be used to finalize the store action before endEncoding is called.
 @param storeAction The desired store action for the given color attachment.  This may be set to any value other than MTLStoreActionUnknown.
 @param colorAttachmentIndex The index of the color attachment
*/
    setColorStoreAction_atIndex_ :: (self: *MTLRenderCommandEncoder, storeAction: MTLStoreAction, colorAttachmentIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, storeAction: MTLStoreAction, colorAttachmentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setColorStoreAction_atIndex_, storeAction, colorAttachmentIndex);
    }

/*!
 @method setDepthStoreAction:
 @brief If the the store action for the depth attachment was set to MTLStoreActionUnknown when the render command encoder was created,
 setDepthStoreAction: must be used to finalize the store action before endEncoding is called.
*/
    setDepthStoreAction_ :: (self: *MTLRenderCommandEncoder, storeAction: MTLStoreAction) -> void {
        func: #type (obj: *void, selector: *void, storeAction: MTLStoreAction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthStoreAction_, storeAction);
    }

/*!
 @method setStencilStoreAction:
 @brief If the the store action for the stencil attachment was set to MTLStoreActionUnknown when the render command encoder was created,
 setStencilStoreAction: must be used to finalize the store action before endEncoding is called.
*/
    setStencilStoreAction_ :: (self: *MTLRenderCommandEncoder, storeAction: MTLStoreAction) -> void {
        func: #type (obj: *void, selector: *void, storeAction: MTLStoreAction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilStoreAction_, storeAction);
    }

/*!
 @method setColorStoreActionOptions:atIndex:
 @brief If the the store action for a given color attachment was set to MTLStoreActionUnknown when the render command encoder was created,
 setColorStoreActionOptions:atIndex: may be used to finalize the store action options before endEncoding is called.
 @param storeActionOptions The desired store action options for the given color attachment.
 @param colorAttachmentIndex The index of the color attachment
 */
    setColorStoreActionOptions_atIndex_ :: (self: *MTLRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions, colorAttachmentIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, storeActionOptions: MTLStoreActionOptions, colorAttachmentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setColorStoreActionOptions_atIndex_, storeActionOptions, colorAttachmentIndex);
    }

/*!
 @method setDepthStoreActionOptions:
 @brief If the the store action for the depth attachment was set to MTLStoreActionUnknown when the render command encoder was created,
 setDepthStoreActionOptions: may be used to finalize the store action options before endEncoding is called.
 */
    setDepthStoreActionOptions_ :: (self: *MTLRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions) -> void {
        func: #type (obj: *void, selector: *void, storeActionOptions: MTLStoreActionOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthStoreActionOptions_, storeActionOptions);
    }

/*!
 @method setStencilStoreActionOptions:
 @brief If the the store action for the stencil attachment was set to MTLStoreActionUnknown when the render command encoder was created,
 setStencilStoreActionOptions: may be used to finalize the store action options before endEncoding is called.
 */
    setStencilStoreActionOptions_ :: (self: *MTLRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions) -> void {
        func: #type (obj: *void, selector: *void, storeActionOptions: MTLStoreActionOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilStoreActionOptions_, storeActionOptions);
    }

/*!
 @method setObjectBytes:length:atIndex:
 @brief Set the data (by copy) for a given object shader buffer binding point.  This will remove any existing MTLBuffer from the binding point.
 */
    setObjectBytes_length_atIndex_ :: (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, bytes: *void, length: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectBytes_length_atIndex_, bytes, length, index);
    }

/*!
 @method setObjectBuffer:offset:atIndex:
 @brief Set a global buffer for all object shaders at the given bind point index.
 */
    setObjectBuffer_offset_atIndex_ :: (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectBuffer_offset_atIndex_, buffer, offset, index);
    }

/*!
 @method setObjectBufferOffset:atIndex:
 @brief Set the offset within the current global buffer for all object shaders at the given bind point index.
 */
    setObjectBufferOffset_atIndex_ :: (self: *MTLRenderCommandEncoder, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectBufferOffset_atIndex_, offset, index);
    }

/*!
 @method setObjectBuffers:offsets:withRange:
 @brief Set an array of global buffers for all object shaders with the given bind point range.
 */
    setObjectBuffers_offsets_withRange_ :: (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectBuffers_offsets_withRange_, buffers, offsets, range);
    }

/*!
 @method setObjectTexture:atIndex:
 @brief Set a global texture for all object shaders at the given bind point index.
 */
    setObjectTexture_atIndex_ :: (self: *MTLRenderCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectTexture_atIndex_, texture, index);
    }

/*!
 @method setObjectTextures:withRange:
 @brief Set an array of global textures for all object shaders with the given bind point range.
 */
    setObjectTextures_withRange_ :: (self: *MTLRenderCommandEncoder, textures: **MTLTexture, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, textures: **MTLTexture, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectTextures_withRange_, textures, range);
    }

/*!
 @method setObjectSamplerState:atIndex:
 @brief Set a global sampler for all object shaders at the given bind point index.
 */
    setObjectSamplerState_atIndex_ :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampler: *MTLSamplerState, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectSamplerState_atIndex_, sampler, index);
    }

/*!
 @method setObjectSamplerStates:withRange:
 @brief Set an array of global samplers for all object shaders with the given bind point range.
 */
    setObjectSamplerStates_withRange_ :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, samplers: **MTLSamplerState, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectSamplerStates_withRange_, samplers, range);
    }

/*!
 @method setObjectSamplerState:lodMinClamp:lodMaxClamp:atIndex:
 @brief Set a global sampler for all object shaders at the given bind point index.
 */
    setObjectSamplerState_lodMinClamp_lodMaxClamp_atIndex_ :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float32, lodMaxClamp: float32, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampler: *MTLSamplerState, lodMinClamp: float32, lodMaxClamp: float32, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectSamplerState_lodMinClamp_lodMaxClamp_atIndex_, sampler, lodMinClamp, lodMaxClamp, index);
    }

/*!
 @method setObjectSamplerStates:lodMinClamps:lodMaxClamps:withRange:
 @brief Set an array of global samplers for all object shaders with the given bind point range.
 */
    setObjectSamplerStates_lodMinClamps_lodMaxClamps_withRange_ :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float32, lodMaxClamps: *float32, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, samplers: **MTLSamplerState, lodMinClamps: *float32, lodMaxClamps: *float32, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectSamplerStates_lodMinClamps_lodMaxClamps_withRange_, samplers, lodMinClamps, lodMaxClamps, range);
    }

/*!
 @method setObjectThreadgroupMemoryLength:atIndex:
 @brief Set the threadgroup memory byte length at the binding point specified by the index for all object shaders.
 */
    setObjectThreadgroupMemoryLength_atIndex_ :: (self: *MTLRenderCommandEncoder, length: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, length: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectThreadgroupMemoryLength_atIndex_, length, index);
    }

/*!
 @method setMeshBytes:length:atIndex:
 @brief Set the data (by copy) for a given mesh shader buffer binding point.  This will remove any existing MTLBuffer from the binding point.
 */
    setMeshBytes_length_atIndex_ :: (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, bytes: *void, length: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshBytes_length_atIndex_, bytes, length, index);
    }

/*!
 @method setMeshBuffer:offset:atIndex:
 @brief Set a global buffer for all mesh shaders at the given bind point index.
 */
    setMeshBuffer_offset_atIndex_ :: (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshBuffer_offset_atIndex_, buffer, offset, index);
    }

/*!
 @method setMeshBufferOffset:atIndex:
 @brief Set the offset within the current global buffer for all mesh shaders at the given bind point index.
 */
    setMeshBufferOffset_atIndex_ :: (self: *MTLRenderCommandEncoder, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshBufferOffset_atIndex_, offset, index);
    }

/*!
 @method setMeshBuffers:offsets:withRange:
 @brief Set an array of global buffers for all mesh shaders with the given bind point range.
 */
    setMeshBuffers_offsets_withRange_ :: (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshBuffers_offsets_withRange_, buffers, offsets, range);
    }

/*!
 @method setMeshTexture:atIndex:
 @brief Set a global texture for all mesh shaders at the given bind point index.
 */
    setMeshTexture_atIndex_ :: (self: *MTLRenderCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshTexture_atIndex_, texture, index);
    }

/*!
 @method setMeshTextures:withRange:
 @brief Set an array of global textures for all mesh shaders with the given bind point range.
 */
    setMeshTextures_withRange_ :: (self: *MTLRenderCommandEncoder, textures: **MTLTexture, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, textures: **MTLTexture, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshTextures_withRange_, textures, range);
    }

/*!
 @method setMeshSamplerState:atIndex:
 @brief Set a global sampler for all mesh shaders at the given bind point index.
 */
    setMeshSamplerState_atIndex_ :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampler: *MTLSamplerState, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshSamplerState_atIndex_, sampler, index);
    }

/*!
 @method setMeshSamplerStates:withRange:
 @brief Set an array of global samplers for all mesh shaders with the given bind point range.
 */
    setMeshSamplerStates_withRange_ :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, samplers: **MTLSamplerState, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshSamplerStates_withRange_, samplers, range);
    }

/*!
 @method setMeshSamplerState:lodMinClamp:lodMaxClamp:atIndex:
 @brief Set a global sampler for all mesh shaders at the given bind point index.
 */
    setMeshSamplerState_lodMinClamp_lodMaxClamp_atIndex_ :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float32, lodMaxClamp: float32, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampler: *MTLSamplerState, lodMinClamp: float32, lodMaxClamp: float32, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshSamplerState_lodMinClamp_lodMaxClamp_atIndex_, sampler, lodMinClamp, lodMaxClamp, index);
    }

/*!
 @method setMeshSamplerStates:lodMinClamps:lodMaxClamps:withRange:
 @brief Set an array of global samplers for all mesh shaders with the given bind point range.
 */
    setMeshSamplerStates_lodMinClamps_lodMaxClamps_withRange_ :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float32, lodMaxClamps: *float32, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, samplers: **MTLSamplerState, lodMinClamps: *float32, lodMaxClamps: *float32, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setMeshSamplerStates_lodMinClamps_lodMaxClamps_withRange_, samplers, lodMinClamps, lodMaxClamps, range);
    }

/*!
 @method drawMeshThreadgroups:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:
 @abstract Enqueue a grid of object (if present) or mesh shader threadgroups.
 @discussion The dimensions of the threadgroups and the grid are specified directly.
 @param threadgroupsPerGrid The number of threadgroups in the object (if present) or mesh shader grid.
 @param threadsPerObjectThreadgroup The number of threads in one object shader threadgroup. Ignored if object shader is not present.
 @param threadsPerMeshThreadgroup The number of threads in one mesh shader threadgroup.
*/
    drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_ :: (self: *MTLRenderCommandEncoder, threadgroupsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, threadgroupsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_, threadgroupsPerGrid, threadsPerObjectThreadgroup, threadsPerMeshThreadgroup);
    }

/*!
 @method drawMeshThreads:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:
 @abstract Enqueue a grid of object (if present) of mesh shader threadgroups.
 @discussion The dimensions of the threadgroups and the grid are specified directly.
 The dimensions of threadsPerGrid does not have to be a multiple of threadsPerThreadgroup for object shaders.
 For mesh shaders, threadsPerGrid is rounded down to the neareset multiple of threadsPerMeshThreadgroup (in each dimension).
 @param threadsPerGrid The number of threads in the object (if present) or mesh shader grid
 @param threadsPerObjectThreadgroup The number of threads in one object shader threadgroup. Ignored if object shader is not present.
 @param threadsPerMeshThreadgroup The number of threads in one mesh shader threadgroup.
*/
    drawMeshThreads_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_ :: (self: *MTLRenderCommandEncoder, threadsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, threadsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawMeshThreads_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_, threadsPerGrid, threadsPerObjectThreadgroup, threadsPerMeshThreadgroup);
    }

/*!
 @method drawMeshThreadgroupsWithIndirectBuffer:indirectBufferOffset:threadsPerObjectThreadgroup:threadsPerMeshThreadgroup:
 @abstract Enqueue a grid of object (if present) or mesh shader threadgroups.
 @discussion The dimensions of the threadgroups are specified directly, the dimensions of the grid, in threadgroups, are read from a buffer by the GPU.
 @param indirectBuffer A buffer object that the device will read the grid size from, see MTLDispatchThreadgroupsIndirectArguments.
 @param indirectBufferOffset Byte offset within @a indirectBuffer to read arguments from.  @a indirectBufferOffset must be a multiple of 4.
 @param threadsPerObjectThreadgroup The number of threads in one object shader threadgroup. Ignored if object shader is not present.
 @param threadsPerMeshThreadgroup The number of threads in one mesh shader threadgroup.
*/
    drawMeshThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_ :: (self: *MTLRenderCommandEncoder, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawMeshThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_, indirectBuffer, indirectBufferOffset, threadsPerObjectThreadgroup, threadsPerMeshThreadgroup);
    }

/*!
 @method drawPrimitives:vertexStart:vertexCount:instanceCount:
 @brief Draw primitives without an index list.
 @param primitiveType The type of primitives that elements are assembled into.
 @param vertexStart For each instance, the first index to draw
 @param vertexCount For each instance, the number of indexes to draw
 @param instanceCount The number of instances drawn.
 */
    drawPrimitives_vertexStart_vertexCount_instanceCount_ :: (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawPrimitives_vertexStart_vertexCount_instanceCount_, primitiveType, vertexStart, vertexCount, instanceCount);
    }

/*!
 @method drawPrimitives:vertexStart:vertexCount:
 @brief Draw primitives without an index list.
 @param primitiveType The type of primitives that elements are assembled into.
 @param vertexStart For each instance, the first index to draw
 @param vertexCount For each instance, the number of indexes to draw
 */
    drawPrimitives_vertexStart_vertexCount_ :: (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawPrimitives_vertexStart_vertexCount_, primitiveType, vertexStart, vertexCount);
    }

/*!
 @method drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:
 @brief Draw primitives with an index list.
 @param primitiveType The type of primitives that elements are assembled into.
 @param indexCount The number of indexes to read from the index buffer for each instance.
 @param indexType The type if indexes, either 16 bit integer or 32 bit integer.
 @param indexBuffer A buffer object that the device will read indexes from.
 @param indexBufferOffset Byte offset within @a indexBuffer to start reading indexes from.  @a indexBufferOffset must be a multiple of the index size.
 @param instanceCount The number of instances drawn.
 */
    drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_ :: (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger, instanceCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger, instanceCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_, primitiveType, indexCount, indexType, indexBuffer, indexBufferOffset, instanceCount);
    }

/*!
 @method drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:
 @brief Draw primitives with an index list.
 @param primitiveType The type of primitives that elements are assembled into.
 @param indexCount The number of indexes to read from the index buffer for each instance.
 @param indexType The type if indexes, either 16 bit integer or 32 bit integer.
 @param indexBuffer A buffer object that the device will read indexes from.
 @param indexBufferOffset Byte offset within @a indexBuffer to start reading indexes from.  @a indexBufferOffset must be a multiple of the index size.
 */
    drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_ :: (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_, primitiveType, indexCount, indexType, indexBuffer, indexBufferOffset);
    }

/*!
 @method drawPrimitives:vertexStart:vertexCount:instanceCount:baseInstance:
 @brief Draw primitives without an index list.
 @param primitiveType The type of primitives that elements are assembled into.
 @param vertexStart For each instance, the first index to draw
 @param vertexCount For each instance, the number of indexes to draw
 @param instanceCount The number of instances drawn.
 @param baseInstance Offset for instance_id.
 */
    drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance_ :: (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance_, primitiveType, vertexStart, vertexCount, instanceCount, baseInstance);
    }

/*!
 @method drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferOffset:instanceCount:baseVertex:baseInstance:
 @brief Draw primitives with an index list.
 @param primitiveType The type of primitives that elements are assembled into.
 @param indexCount The number of indexes to read from the index buffer for each instance.
 @param indexType The type if indexes, either 16 bit integer or 32 bit integer.
 @param indexBuffer A buffer object that the device will read indexes from.
 @param indexBufferOffset Byte offset within @a indexBuffer to start reading indexes from.  @a indexBufferOffset must be a multiple of the index size.
 @param instanceCount The number of instances drawn.
 @param baseVertex Offset for vertex_id. NOTE: this can be negative
 @param baseInstance Offset for instance_id.
 */
    drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_baseVertex_baseInstance_ :: (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseVertex: NSInteger, baseInstance: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseVertex: NSInteger, baseInstance: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_baseVertex_baseInstance_, primitiveType, indexCount, indexType, indexBuffer, indexBufferOffset, instanceCount, baseVertex, baseInstance);
    }

/*!
 @method drawPrimitives:indirectBuffer:indirectBufferOffset:
 @brief Draw primitives without an index list using an indirect buffer see MTLDrawPrimitivesIndirectArguments.
 @param primitiveType The type of primitives that elements are assembled into.
 @param indirectBuffer A buffer object that the device will read drawPrimitives arguments from, see MTLDrawPrimitivesIndirectArguments.
 @param indirectBufferOffset Byte offset within @a indirectBuffer to start reading indexes from.  @a indirectBufferOffset must be a multiple of 4.
 */
    drawPrimitives_indirectBuffer_indirectBufferOffset_ :: (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawPrimitives_indirectBuffer_indirectBufferOffset_, primitiveType, indirectBuffer, indirectBufferOffset);
    }

/*!
 @method drawIndexedPrimitives:indexType:indexBuffer:indexBufferOffset:indirectBuffer:indirectBufferOffset:
 @brief Draw primitives with an index list using an indirect buffer see MTLDrawIndexedPrimitivesIndirectArguments.
 @param primitiveType The type of primitives that elements are assembled into.
 @param indexType The type if indexes, either 16 bit integer or 32 bit integer.
 @param indexBuffer A buffer object that the device will read indexes from.
 @param indexBufferOffset Byte offset within @a indexBuffer to start reading indexes from.  @a indexBufferOffset must be a multiple of the index size.
 @param indirectBuffer A buffer object that the device will read drawIndexedPrimitives arguments from, see MTLDrawIndexedPrimitivesIndirectArguments.
 @param indirectBufferOffset Byte offset within @a indirectBuffer to start reading indexes from.  @a indirectBufferOffset must be a multiple of 4.
 */
    drawIndexedPrimitives_indexType_indexBuffer_indexBufferOffset_indirectBuffer_indirectBufferOffset_ :: (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawIndexedPrimitives_indexType_indexBuffer_indexBufferOffset_indirectBuffer_indirectBufferOffset_, primitiveType, indexType, indexBuffer, indexBufferOffset, indirectBuffer, indirectBufferOffset);
    }

/*!
 @method textureBarrier
 @brief Ensure that following fragment shaders can read textures written by previous draw calls (in particular the framebuffer)
 */
    textureBarrier :: (self: *MTLRenderCommandEncoder) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.textureBarrier);
    }

/*!
 @method updateFence:afterStages:
 @abstract Update the fence to capture all GPU work so far enqueued by this encoder for the given stages.
 @discussion Unlike <st>updateFence:</st>, this method will update the fence when the given stage(s) complete, allowing for commands to overlap in execution.
 On iOS, render command encoder fence updates are always delayed until the end of the encoder.
 */
    updateFence_afterStages_ :: (self: *MTLRenderCommandEncoder, fence: *MTLFence, stages: MTLRenderStages) -> void {
        func: #type (obj: *void, selector: *void, fence: *MTLFence, stages: MTLRenderStages) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.updateFence_afterStages_, fence, stages);
    }

/*!
 @method waitForFence:beforeStages:
 @abstract Prevent further GPU work until the fence is reached for the given stages.
 @discussion Unlike <st>waitForFence:</st>, this method will only block commands assoicated with the given stage(s), allowing for commands to overlap in execution.
 On iOS, render command encoder fence waits always occur the beginning of the encoder.
 */
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

/*!
 @method setTileBytes:length:atIndex:
 @brief Set the data (by copy) for a given tile buffer binding point.  This will remove any existing MTLBuffer from the binding point.
 */
    setTileBytes_length_atIndex_ :: (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, bytes: *void, length: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileBytes_length_atIndex_, bytes, length, index);
    }

/*!
 @method setTileBuffer:offset:atIndex:
 @brief Set a global buffer for all tile shaders at the given bind point index.
 */
    setTileBuffer_offset_atIndex_ :: (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileBuffer_offset_atIndex_, buffer, offset, index);
    }

/*!
 @method setTileBufferOffset:atIndex:
 @brief Set the offset within the current global buffer for all tile shaders at the given bind point index.
 */
    setTileBufferOffset_atIndex_ :: (self: *MTLRenderCommandEncoder, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileBufferOffset_atIndex_, offset, index);
    }

/*!
 @method setTileBuffers:offsets:withRange:
 @brief Set an array of global buffers for all tile shaders with the given bind point range.
 */
    setTileBuffers_offsets_withRange_ :: (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileBuffers_offsets_withRange_, buffers, offsets, range);
    }

/*!
 @method setTileTexture:atIndex:
 @brief Set a global texture for all tile shaders at the given bind point index.
 */
    setTileTexture_atIndex_ :: (self: *MTLRenderCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileTexture_atIndex_, texture, index);
    }

/*!
 @method setTileTextures:withRange:
 @brief Set an array of global textures for all tile shaders with the given bind point range.
 */
    setTileTextures_withRange_ :: (self: *MTLRenderCommandEncoder, textures: **MTLTexture, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, textures: **MTLTexture, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileTextures_withRange_, textures, range);
    }

/*!
 @method setTileSamplerState:atIndex:
 @brief Set a global sampler for all tile shaders at the given bind point index.
 */
    setTileSamplerState_atIndex_ :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampler: *MTLSamplerState, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileSamplerState_atIndex_, sampler, index);
    }

/*!
 @method setTileSamplerStates:withRange:
 @brief Set an array of global samplers for all fragment shaders with the given bind point range.
 */
    setTileSamplerStates_withRange_ :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, samplers: **MTLSamplerState, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileSamplerStates_withRange_, samplers, range);
    }

/*!
 @method setTileSamplerState:lodMinClamp:lodMaxClamp:atIndex:
 @brief Set a global sampler for all tile shaders at the given bind point index.
 */
    setTileSamplerState_lodMinClamp_lodMaxClamp_atIndex_ :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float32, lodMaxClamp: float32, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampler: *MTLSamplerState, lodMinClamp: float32, lodMaxClamp: float32, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileSamplerState_lodMinClamp_lodMaxClamp_atIndex_, sampler, lodMinClamp, lodMaxClamp, index);
    }

/*!
 @method setTileSamplerStates:lodMinClamps:lodMaxClamps:withRange:
 @brief Set an array of global samplers for all tile shaders with the given bind point range.
 */
    setTileSamplerStates_lodMinClamps_lodMaxClamps_withRange_ :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float32, lodMaxClamps: *float32, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, samplers: **MTLSamplerState, lodMinClamps: *float32, lodMaxClamps: *float32, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileSamplerStates_lodMinClamps_lodMaxClamps_withRange_, samplers, lodMinClamps, lodMaxClamps, range);
    }

/*!
 @method setTileVisibleFunctionTable:atBufferIndex:
 @brief Set a global visible function table for all tile shaders at the given buffer bind point index.
 */
    setTileVisibleFunctionTable_atBufferIndex_ :: (self: *MTLRenderCommandEncoder, functionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, functionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileVisibleFunctionTable_atBufferIndex_, functionTable, bufferIndex);
    }

/*!
 @method setTileVisibleFunctionTables:withBufferRange:
 @brief Set an array of global visible function tables for all tile shaders with the given buffer bind point range.
 */
    setTileVisibleFunctionTables_withBufferRange_ :: (self: *MTLRenderCommandEncoder, functionTables: **MTLVisibleFunctionTable, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, functionTables: **MTLVisibleFunctionTable, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileVisibleFunctionTables_withBufferRange_, functionTables, range);
    }

/*!
 @method setTileIntersectionFunctionTable:atBufferIndex:
 @brief Set a global intersection function table for all tile shaders at the given buffer bind point index.
 */
    setTileIntersectionFunctionTable_atBufferIndex_ :: (self: *MTLRenderCommandEncoder, intersectionFunctionTable: *MTLIntersectionFunctionTable, bufferIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, intersectionFunctionTable: *MTLIntersectionFunctionTable, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileIntersectionFunctionTable_atBufferIndex_, intersectionFunctionTable, bufferIndex);
    }

/*!
 @method setTileIntersectionFunctionTables:withBufferRange:
 @brief Set an array of global intersection function tables for all tile shaders with the given buffer bind point range.
 */
    setTileIntersectionFunctionTables_withBufferRange_ :: (self: *MTLRenderCommandEncoder, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileIntersectionFunctionTables_withBufferRange_, intersectionFunctionTables, range);
    }

/*!
 @method setTileAccelerationStructure:atBufferIndex:
 @brief Set a global acceleration structure for all tile shaders at the given buffer bind point index.
 */
    setTileAccelerationStructure_atBufferIndex_ :: (self: *MTLRenderCommandEncoder, accelerationStructure: *MTLAccelerationStructure, bufferIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, accelerationStructure: *MTLAccelerationStructure, bufferIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTileAccelerationStructure_atBufferIndex_, accelerationStructure, bufferIndex);
    }

/*!
 @method dispatchThreadsPerTile:
 @brief dispatch threads to perform a mid-render compute operation.
 */
    dispatchThreadsPerTile_ :: (self: *MTLRenderCommandEncoder, threadsPerTile: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, threadsPerTile: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dispatchThreadsPerTile_, threadsPerTile);
    }

/*!
 @method setThreadgroupMemoryLength:offset:atIndex:
 @brief Set the size of the threadgroup memory argument at the given bind point index and offset.
 */
    setThreadgroupMemoryLength_offset_atIndex_ :: (self: *MTLRenderCommandEncoder, length: NSUInteger, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, length: NSUInteger, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setThreadgroupMemoryLength_offset_atIndex_, length, offset, index);
    }

/*!
 * @method useResource:usage:
 * @abstract Declare that a resource may be accessed by the render pass through an argument buffer
 * @discussion This method does not protect against data hazards; these hazards must be addressed using an MTLFence. This method must be called before encoding any draw commands which may access the resource through an argument buffer. However, this method may cause color attachments to become decompressed. Therefore, this method should be called until as late as possible within a render command encoder. Declaring a minimal usage (i.e. read-only) may prevent color attachments from becoming decompressed on some devices.
 
     Note that calling useResource does not retain the resource. It is the responsiblity of the user to retain the resource until
     the command buffer has been executed.
 */
    useResource_usage_ :: (self: *MTLRenderCommandEncoder, resource: *MTLResource, usage: MTLResourceUsage) -> void {
        func: #type (obj: *void, selector: *void, resource: *MTLResource, usage: MTLResourceUsage) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useResource_usage_, resource, usage);
    }

/*!
 * @method useResources:count:usage:
 * @abstract Declare that an array of resources may be accessed through an argument buffer by the render pass
 * @discussion This method does not protect against data hazards; these hazards must be addressed using an MTLFence. This method must be called before encoding any draw commands which may access the resources through an argument buffer. However, this method may cause color attachments to become decompressed. Therefore, this method should be called until as late as possible within a render command encoder. Declaring a minimal usage (i.e. read-only) may prevent color attachments from becoming decompressed on some devices.
 
   Note that calling useResources does not retain the resources. It is the responsiblity of the user to retain the resources until
   the command buffer has been executed.
*/
    useResources_count_usage_ :: (self: *MTLRenderCommandEncoder, resources: **MTLResource, count: NSUInteger, usage: MTLResourceUsage) -> void {
        func: #type (obj: *void, selector: *void, resources: **MTLResource, count: NSUInteger, usage: MTLResourceUsage) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useResources_count_usage_, resources, count, usage);
    }

/*!
 * @method useResources:usage:stage
 * @abstract Declare that a resource may be accessed by the render pass through an argument buffer
 * @discussion For hazard tracked resources, this method protects against data hazards. This method must be called before encoding any draw commands which may access the resource through an argument buffer. However, this method may cause color attachments to become decompressed. Therefore, this method should be called until as late as possible within a render command encoder. Declaring a minimal usage (i.e. read-only) may prevent color attachments from becoming decompressed on some devices.
 
    Note that calling useResource does not retain the resource. It is the responsiblity of the user to retain the resource until
    the command buffer has been executed.
*/
    useResource_usage_stages_ :: (self: *MTLRenderCommandEncoder, resource: *MTLResource, usage: MTLResourceUsage, stages: MTLRenderStages) -> void {
        func: #type (obj: *void, selector: *void, resource: *MTLResource, usage: MTLResourceUsage, stages: MTLRenderStages) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useResource_usage_stages_, resource, usage, stages);
    }

/*!
 * @method useResources:count:usage:stages
 * @abstract Declare that an array of resources may be accessed through an argument buffer by the render pass
 * @discussion For hazard tracked resources, this method protects against data hazards.  This method must be called before encoding any draw commands which may access the resources through an argument buffer. However, this method may cause color attachments to become decompressed. Therefore, this method should be called until as late as possible within a render command encoder. Declaring a minimal usage (i.e. read-only) may prevent color attachments from becoming decompressed on some devices.
 
   Note that calling useResources does not retain the resources. It is the responsiblity of the user to retain the resources until
   the command buffer has been executed.
*/
    useResources_count_usage_stages_ :: (self: *MTLRenderCommandEncoder, resources: **MTLResource, count: NSUInteger, usage: MTLResourceUsage, stages: MTLRenderStages) -> void {
        func: #type (obj: *void, selector: *void, resources: **MTLResource, count: NSUInteger, usage: MTLResourceUsage, stages: MTLRenderStages) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useResources_count_usage_stages_, resources, count, usage, stages);
    }

/*!
 * @method useHeap:
 * @abstract Declare that the resources allocated from a heap may be accessed by the render pass through an argument buffer
 * @discussion This method does not protect against data hazards; these hazards must be addressed using an MTLFence. This method must be called before encoding any draw commands which may access the resources allocated from the heap through an argument buffer. This method may cause all of the color attachments allocated from the heap to become decompressed. Therefore, it is recommended that the useResource:usage: or useResources:count:usage: methods be used for color attachments instead, with a minimal (i.e. read-only) usage.
 */
    useHeap_ :: (self: *MTLRenderCommandEncoder, heap: *MTLHeap) -> void {
        func: #type (obj: *void, selector: *void, heap: *MTLHeap) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useHeap_, heap);
    }

/*!
 * @method useHeaps:count:
 * @abstract Declare that the resources allocated from an array of heaps may be accessed by the render pass through an argument buffer
 * @discussion This method does not protect against data hazards; these hazards must be addressed using an MTLFence. This method must be called before encoding any draw commands which may access the resources allocated from the heaps through an argument buffer. This method may cause all of the color attachments allocated from the heaps to become decompressed. Therefore, it is recommended that the useResource:usage: or useResources:count:usage: methods be used for color attachments instead, with a minimal (i.e. read-only) usage.
 */
    useHeaps_count_ :: (self: *MTLRenderCommandEncoder, heaps: **MTLHeap, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, heaps: **MTLHeap, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useHeaps_count_, heaps, count);
    }

/*!
 * @method useHeap:stages:
 * @abstract Declare that the resources allocated from a heap may be accessed by the render pass through an argument buffer
 * @discussion If the heap is tracked, this method protects against hazard tracking; these hazards must be addressed using an MTLFence. This method must be called before encoding any draw commands which may access the resources allocated from the heap through an argument buffer. This method may cause all of the color attachments allocated from the heap to become decompressed. Therefore, it is recommended that the useResource:usage: or useResources:count:usage: methods be used for color attachments instead, with a minimal (i.e. read-only) usage.
 */
    useHeap_stages_ :: (self: *MTLRenderCommandEncoder, heap: *MTLHeap, stages: MTLRenderStages) -> void {
        func: #type (obj: *void, selector: *void, heap: *MTLHeap, stages: MTLRenderStages) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useHeap_stages_, heap, stages);
    }

/*!
 * @method useHeaps:count:stages:
 * @abstract Declare that the resources allocated from an array of heaps may be accessed by the render pass through an argument buffer
 * @discussion This method does not protect against data hazards; these hazards must be addressed using an MTLFence. This method must be called before encoding any draw commands which may access the resources allocated from the heaps through an argument buffer. This method may cause all of the color attachments allocated from the heaps to become decompressed. Therefore, it is recommended that the useResource:usage: or useResources:count:usage: methods be used for color attachments instead, with a minimal (i.e. read-only) usage.
 */
    useHeaps_count_stages_ :: (self: *MTLRenderCommandEncoder, heaps: **MTLHeap, count: NSUInteger, stages: MTLRenderStages) -> void {
        func: #type (obj: *void, selector: *void, heaps: **MTLHeap, count: NSUInteger, stages: MTLRenderStages) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useHeaps_count_stages_, heaps, count, stages);
    }

/*!
 * @method executeCommandsInBuffer:withRange:
 * @abstract Execute commands in the buffer within the range specified.
 * @discussion The same indirect command buffer may be executed any number of times within the same encoder.
 */
    executeCommandsInBuffer_withRange_ :: (self: *MTLRenderCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, executionRange: NSRange) -> void {
        func: #type (obj: *void, selector: *void, indirectCommandBuffer: *MTLIndirectCommandBuffer, executionRange: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.executeCommandsInBuffer_withRange_, indirectCommandBuffer, executionRange);
    }

/*!
 * @method executeCommandsInBuffer:indirectBuffer:indirectBufferOffset:
 * @abstract Execute commands in the buffer within the range specified by the indirect range buffer.
 * @param indirectRangeBuffer An indirect buffer from which the device reads the execution range parameter, as laid out in the MTLIndirectCommandBufferExecutionRange structure.
 * @param indirectBufferOffset The byte offset within indirectBuffer where the execution range parameter is located. Must be a multiple of 4 bytes.
 * @discussion The same indirect command buffer may be executed any number of times within the same encoder.
 */
    executeCommandsInBuffer_indirectBuffer_indirectBufferOffset_ :: (self: *MTLRenderCommandEncoder, indirectCommandbuffer: *MTLIndirectCommandBuffer, indirectRangeBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, indirectCommandbuffer: *MTLIndirectCommandBuffer, indirectRangeBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.executeCommandsInBuffer_indirectBuffer_indirectBufferOffset_, indirectCommandbuffer, indirectRangeBuffer, indirectBufferOffset);
    }

/*!
 * @method memoryBarrierWithScope:afterStages:beforeStages:
 * @abstract Make stores to memory encoded before the barrier coherent with loads from memory encoded after the barrier.
 * @discussion The barrier makes stores coherent that 1) are to a resource with a type in the given scope, and 2) happen at (or before) the stage given by afterStages. Only affects loads that happen at (or after) the stage given by beforeStages.
 */
    memoryBarrierWithScope_afterStages_beforeStages_ :: (self: *MTLRenderCommandEncoder, scope: MTLBarrierScope, after: MTLRenderStages, before: MTLRenderStages) -> void {
        func: #type (obj: *void, selector: *void, scope: MTLBarrierScope, after: MTLRenderStages, before: MTLRenderStages) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.memoryBarrierWithScope_afterStages_beforeStages_, scope, after, before);
    }

/*!
 * @method memoryBarrierWithResources:count:afterStages:beforeStages:
 * @abstract Make stores to memory encoded before the barrier coherent with loads from memory encoded after the barrier.
 * @discussion The barrier makes stores coherent that 1) are to resources in given array, and 2) happen at (or before) the stage given by afterStages. Only affects loads that happen at (or after) the stage give by beforeStages.
 */
    memoryBarrierWithResources_count_afterStages_beforeStages_ :: (self: *MTLRenderCommandEncoder, resources: **MTLResource, count: NSUInteger, after: MTLRenderStages, before: MTLRenderStages) -> void {
        func: #type (obj: *void, selector: *void, resources: **MTLResource, count: NSUInteger, after: MTLRenderStages, before: MTLRenderStages) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.memoryBarrierWithResources_count_afterStages_beforeStages_, resources, count, after, before);
    }

/*!
 @method sampleCountersInBuffer:atSampleIndex:withBarrier:
 @abstract Sample hardware counters at this point in the render encoder and
 store the counter sample into the sample buffer at the specified index.
 @param sampleBuffer The sample buffer to sample into
 @param sampleIndex The index into the counter buffer to write the sample.
 @param barrier Insert a barrier before taking the sample.  Passing
 YES will ensure that all work encoded before this operation in the encoder is
 complete but does not isolate the work with respect to other encoders.  Passing
 NO will allow the sample to be taken concurrently with other operations in this
 encoder.
 In general, passing YES will lead to more repeatable counter results but
 may negatively impact performance.  Passing NO will generally be higher performance
 but counter results may not be repeatable.
 */
    sampleCountersInBuffer_atSampleIndex_withBarrier_ :: (self: *MTLRenderCommandEncoder, sampleBuffer: *MTLCounterSampleBuffer, sampleIndex: NSUInteger, barrier: BOOL) -> void {
        func: #type (obj: *void, selector: *void, sampleBuffer: *MTLCounterSampleBuffer, sampleIndex: NSUInteger, barrier: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleCountersInBuffer_atSampleIndex_withBarrier_, sampleBuffer, sampleIndex, barrier);
    }

/// Sets the mapping from logical shader color output to physical render pass color attachments.
///
/// Use this method to define how the physical color attachments you specify via ``MTLRenderPassDescriptor/colorAttachments``
/// map to the logical color output the fragment shader writes to.
///
/// To use this feature, make sure to set ``MTLRenderPassDescriptor/supportColorAttachmentMapping`` to
/// <doc://com.apple.documentation/documentation/swift/true>.
///
/// - Parameter mapping: Mapping from logical shader outputs to physical outputs.
    setColorAttachmentMap_ :: (self: *MTLRenderCommandEncoder, mapping: *MTLLogicalToPhysicalColorAttachmentMap) -> void {
        func: #type (obj: *void, selector: *void, mapping: *MTLLogicalToPhysicalColorAttachmentMap) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setColorAttachmentMap_, mapping);
    }

/*!
 @property tileWidth:
 @abstract The width of the tile for this render pass.
 */
    tileWidth :: (self: *MTLRenderCommandEncoder) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileWidth);
    }

/*!
 @property tileHeight:
 @abstract The height of the tile for this render pass.
 */
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

/*!
 @property gpuResourceID
 @abstract Handle of the GPU resource suitable for storing in an Intersection Function Buffer.
 @discussion The handle must have been created from an intersection function annotated with the `intersection_function_buffer` tag.
 */
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

/*!
 @property gpuResourceID
 @abstract Handle of the GPU resource suitable for storing in an Argument Buffer
 */
    gpuResourceID :: (self: *MTLVisibleFunctionTable) -> MTLResourceID {
        func: #type (obj: *void, selector: *void) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.gpuResourceID);
    }

}

/*!
 @protocol MTLRenderPipelineState
 @abstract MTLRenderPipelineState represents a compiled render pipeline
 
 @discussion MTLRenderPipelineState is a compiled render pipeline and can be set on a MTLRenderCommandEncoder.
 */
MTLRenderPipelineState :: struct #type_info_no_size_complaint {
/// Obtains a function handle for the a specific function this pipeline links at the Metal IR level.
///
/// - Parameters:
///   - name: A string containing the name of the function.
///   - stage: The shader stage that uses the function.
///
/// - Returns: a function handle representing the function if present, otherwise `nil`.
    functionHandleWithName_stage_ :: (self: *MTLRenderPipelineState, name: *NSString, stage: MTLRenderStages) -> *MTLFunctionHandle {
        func: #type (obj: *void, selector: *void, name: *NSString, stage: MTLRenderStages) -> *MTLFunctionHandle #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionHandleWithName_stage_, name, stage);
    }

/// Obtains the function handle for a specific function this pipeline state links at the binary level.
///
/// - Parameters:
///   - function: a binary function to retrieve the handle.
///   - stage: The shader stage that uses the function.
///
/// - Returns: a function handle representing the function if present, otherwise `nil`.
    functionHandleWithBinaryFunction_stage_ :: (self: *MTLRenderPipelineState, function: *MTL4BinaryFunction, stage: MTLRenderStages) -> *MTLFunctionHandle {
        func: #type (obj: *void, selector: *void, function: *MTL4BinaryFunction, stage: MTLRenderStages) -> *MTLFunctionHandle #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionHandleWithBinaryFunction_stage_, function, stage);
    }

/// Creates a new render pipeline state by adding binary functions to each stage of this pipeline
/// state.
///
/// - Parameters:
///   - binaryFunctionsDescriptor: A non-`nil` dynamic linking descriptor.
///   - error: An optional pointer that Metal populates with information in case of an error.
///
/// - Returns: A new render pipeline state upon success, otherwise `nil`.
///
    newRenderPipelineStateWithBinaryFunctions_error_ :: (self: *MTLRenderPipelineState, binaryFunctionsDescriptor: *MTL4RenderPipelineBinaryFunctionsDescriptor, error: **NSError) -> *MTLRenderPipelineState {
        func: #type (obj: *void, selector: *void, binaryFunctionsDescriptor: *MTL4RenderPipelineBinaryFunctionsDescriptor, error: **NSError) -> *MTLRenderPipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithBinaryFunctions_error_, binaryFunctionsDescriptor, error);
    }

/// Creates a render pipeline descriptor from this pipeline that you can use for pipeline specialization.
///
/// Use this method to obtain a new ``MTL4PipelineDescriptor`` instance that you can use to specialize any unspecialized
/// properties in this pipeline state object.
///
/// The returned descriptor contains every unspecialized field in the current pipeline state object, set to unspecialized.
/// It may, however, not contain valid or accurate properties in any other field.
///
/// This descriptor is only valid for the purpose of calling specialization functions on the ``MTL4Compiler`` to
/// specialize this pipeline, for example: ``MTL4Compiler/newRenderPipelineStateBySpecializationWithDescriptor:pipeline:error:``.
///
/// Although this method returns the ``MTL4PipelineDescriptor`` base class, the concrete instance this method returns
/// corresponds to the specific descriptor type for the creation of this pipeline state, for example if a ``MTL4Compiler``
/// instance creates this current pipeline form a ``MTLTileRenderPipelineDescriptor``, this method returns a concrete
/// ``MTLTileRenderPipelineDescriptor`` instance.
///
/// - Returns: a new pipeline descriptor that you use for pipeline state specialization.
///
    newRenderPipelineDescriptorForSpecialization :: (self: *MTLRenderPipelineState) -> *MTL4PipelineDescriptor {
        func: #type (obj: *void, selector: *void) -> *MTL4PipelineDescriptor #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineDescriptorForSpecialization);
    }

/*!
 @method imageblockMemoryLengthForDimensions:sampleCount:
 @brief Returns imageblock memory length for given image block dimensions. Dimensions must be valid tile dimensions.
 */
    imageblockMemoryLengthForDimensions_ :: (self: *MTLRenderPipelineState, imageblockDimensions: MTLSize) -> NSUInteger {
        func: #type (obj: *void, selector: *void, imageblockDimensions: MTLSize) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.imageblockMemoryLengthForDimensions_, imageblockDimensions);
    }

/*!
 @method functionHandleWithFunction:stage:
 @brief Gets the function handle for the specified function on the specified stage of the pipeline.
 */
    functionHandleWithFunction_stage_ :: (self: *MTLRenderPipelineState, function: *MTLFunction, stage: MTLRenderStages) -> *MTLFunctionHandle {
        func: #type (obj: *void, selector: *void, function: *MTLFunction, stage: MTLRenderStages) -> *MTLFunctionHandle #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionHandleWithFunction_stage_, function, stage);
    }

/*!
 @method newVisibleFunctionTableWithDescriptor:stage:
 @brief Allocate a visible function table for the specified stage of the pipeline with the provided descriptor.
 */
    newVisibleFunctionTableWithDescriptor_stage_ :: (self: *MTLRenderPipelineState, descriptor: *MTLVisibleFunctionTableDescriptor, stage: MTLRenderStages) -> *MTLVisibleFunctionTable {
        func: #type (obj: *void, selector: *void, descriptor: *MTLVisibleFunctionTableDescriptor, stage: MTLRenderStages) -> *MTLVisibleFunctionTable #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newVisibleFunctionTableWithDescriptor_stage_, descriptor, stage);
    }

/*!
 @method newIntersectionFunctionTableWithDescriptor:stage:
 @brief Allocate an intersection function table for the specified stage of the pipeline with the provided descriptor.
 */
    newIntersectionFunctionTableWithDescriptor_stage_ :: (self: *MTLRenderPipelineState, descriptor: *MTLIntersectionFunctionTableDescriptor, stage: MTLRenderStages) -> *MTLIntersectionFunctionTable {
        func: #type (obj: *void, selector: *void, descriptor: *MTLIntersectionFunctionTableDescriptor, stage: MTLRenderStages) -> *MTLIntersectionFunctionTable #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newIntersectionFunctionTableWithDescriptor_stage_, descriptor, stage);
    }

/*!
 @method newRenderPipelineStateWithAdditionalBinaryFunctions:error:
 @brief Allocate a new render pipeline state by adding binary functions for each stage of this pipeline state.
 */
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

///
/// > Tip:
/// Verify the apps that need reflection information in production by testing them
/// without a frame capture, Metal API validation layer, or shader validation layer.
///
/// The property is `nil` when you create a pipeline state from an``MTLDevice`` instance,
/// such as with its ``MTLDevice/newRenderPipelineStateWithDescriptor:error:`` method.
    reflection :: (self: *MTLRenderPipelineState) -> *MTLRenderPipelineReflection {
        func: #type (obj: *void, selector: *void) -> *MTLRenderPipelineReflection #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reflection);
    }

/*!
 @property maxTotalThreadsPerThreadgroup
 @abstract The maximum total number of threads that can be in a single tile shader threadgroup.
 */
    maxTotalThreadsPerThreadgroup :: (self: *MTLRenderPipelineState) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadsPerThreadgroup);
    }

/*!
 @property threadgroupSizeMatchesTileSize
 @abstract Returns true when the pipeline state requires a tile shader threadgroup size equal to the tile size
 */
    threadgroupSizeMatchesTileSize :: (self: *MTLRenderPipelineState) -> BOOL {
        func: #type (obj: *void, selector: *void) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.threadgroupSizeMatchesTileSize);
    }

/*!
 @property imageblockSampleLength
 @brief Returns imageblock memory length used by a single sample when rendered using this pipeline.
 */
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

/*!
 @property maxTotalThreadsPerObjectThreadgroup
 @abstract The maximum total number of threads that can be in a single object shader threadgroup.
 @discussion This value is set in MTLMeshRenderPipelineDescriptor.
 */
    maxTotalThreadsPerObjectThreadgroup :: (self: *MTLRenderPipelineState) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadsPerObjectThreadgroup);
    }

/*!
 @property maxTotalThreadsPerMeshThreadgroup
 @abstract The maximum total number of threads that can be in a single mesh shader threadgroup.
 @discussion This value is set in MTLMeshRenderPipelineDescriptor.
 */
    maxTotalThreadsPerMeshThreadgroup :: (self: *MTLRenderPipelineState) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadsPerMeshThreadgroup);
    }

/*!
 @property objectThreadExecutionWidth
 @abstract The number of threads in a SIMD group of the object shader.
 @discussion This value is also available in the shader with the [[threads_per_simdgroup]] attribute.
 */
    objectThreadExecutionWidth :: (self: *MTLRenderPipelineState) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.objectThreadExecutionWidth);
    }

/*!
 @property meshThreadExecutionWidth
 @abstract The number of threads in a SIMD group of the mesh shader.
 @discussion This value is also available in the shader with the [[threads_per_simdgroup]] attribute.
 */
    meshThreadExecutionWidth :: (self: *MTLRenderPipelineState) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.meshThreadExecutionWidth);
    }

/*!
 @property maxTotalThreadgroupsPerMeshGrid
 @abstract The maximum total number of threadgroups that can be in a single mesh shader grid.
 @discussion This value is set in MTLMeshRenderPipelineDescriptor.
 */
    maxTotalThreadgroupsPerMeshGrid :: (self: *MTLRenderPipelineState) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxTotalThreadgroupsPerMeshGrid);
    }

/*!
 @property gpuResourceID
 @abstract Handle of the GPU resource suitable for storing in an Argument Buffer
 */
    gpuResourceID :: (self: *MTLRenderPipelineState) -> MTLResourceID {
        func: #type (obj: *void, selector: *void) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.gpuResourceID);
    }

/*!
 @property shaderValidation
 @abstract Current state of Shader Validation for the pipeline.
 */
    shaderValidation :: (self: *MTLRenderPipelineState) -> MTLShaderValidation {
        func: #type (obj: *void, selector: *void) -> MTLShaderValidation #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.shaderValidation);
    }

/*!
 @property requiredThreadsPerTileThreadgroup
 @abstract The required size of every tile shader threadgroup.
*/
    requiredThreadsPerTileThreadgroup :: (self: *MTLRenderPipelineState) -> MTLSize {
        func: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.requiredThreadsPerTileThreadgroup);
    }

/*!
 @property requiredThreadsPerObjectThreadgroup
 @abstract The required size of every object shader threadgroup.
 @discussion This value is set in MTLMeshRenderPipelineDescriptor.
*/
    requiredThreadsPerObjectThreadgroup :: (self: *MTLRenderPipelineState) -> MTLSize {
        func: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.requiredThreadsPerObjectThreadgroup);
    }

/*!
 @property requiredThreadsPerMeshThreadgroup
 @abstract The required size of every mesh shader threadgroup.
 @discussion This value is set in MTLMeshRenderPipelineDescriptor.
*/
    requiredThreadsPerMeshThreadgroup :: (self: *MTLRenderPipelineState) -> MTLSize {
        func: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.requiredThreadsPerMeshThreadgroup);
    }

}

/*!
 @protocol MTLParallelRenderCommandEncoder
 @discussion The MTLParallelRenderCommandEncoder protocol is designed to allow a single render to texture operation to be efficiently (and safely) broken up across multiple threads.
 */
MTLParallelRenderCommandEncoder :: struct #type_info_no_size_complaint {
/*!
 @method renderCommandEncoder
 @abstract Return a new autoreleased object that conforms to <MTLRenderCommandEncoder> that may be used to encode on a different thread.
 */
    renderCommandEncoder :: (self: *MTLParallelRenderCommandEncoder) -> *MTLRenderCommandEncoder {
        func: #type (obj: *void, selector: *void) -> *MTLRenderCommandEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.renderCommandEncoder);
    }

/*!
 @method setColorStoreAction:atIndex:
 @brief If the the store action for a given color attachment was set to MTLStoreActionUnknown when the render command encoder was created,
 setColorStoreAction:atIndex: must be used to finalize the store action before endEncoding is called.
 @param storeAction The desired store action for the given color attachment.  This may be set to any value other than MTLStoreActionUnknown.
 @param colorAttachmentIndex The index of the color attachment
*/
    setColorStoreAction_atIndex_ :: (self: *MTLParallelRenderCommandEncoder, storeAction: MTLStoreAction, colorAttachmentIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, storeAction: MTLStoreAction, colorAttachmentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setColorStoreAction_atIndex_, storeAction, colorAttachmentIndex);
    }

/*!
 @method setDepthStoreAction:
 @brief If the the store action for the depth attachment was set to MTLStoreActionUnknown when the render command encoder was created,
 setDepthStoreAction: must be used to finalize the store action before endEncoding is called.
*/
    setDepthStoreAction_ :: (self: *MTLParallelRenderCommandEncoder, storeAction: MTLStoreAction) -> void {
        func: #type (obj: *void, selector: *void, storeAction: MTLStoreAction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthStoreAction_, storeAction);
    }

/*!
 @method setStencilStoreAction:
 @brief If the the store action for the stencil attachment was set to MTLStoreActionUnknown when the render command encoder was created,
 setStencilStoreAction: must be used to finalize the store action before endEncoding is called.
*/
    setStencilStoreAction_ :: (self: *MTLParallelRenderCommandEncoder, storeAction: MTLStoreAction) -> void {
        func: #type (obj: *void, selector: *void, storeAction: MTLStoreAction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilStoreAction_, storeAction);
    }

/*!
 @method setColorStoreActionOptions:atIndex:
 @brief If the the store action for a given color attachment was set to MTLStoreActionUnknown when the render command encoder was created,
 setColorStoreActionOptions:atIndex: may be used to finalize the store action options before endEncoding is called.
 @param storeActionOptions The desired store action options for the given color attachment.
 @param colorAttachmentIndex The index of the color attachment
 */
    setColorStoreActionOptions_atIndex_ :: (self: *MTLParallelRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions, colorAttachmentIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, storeActionOptions: MTLStoreActionOptions, colorAttachmentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setColorStoreActionOptions_atIndex_, storeActionOptions, colorAttachmentIndex);
    }

/*!
 @method setDepthStoreActionOptions:
 @brief If the the store action for the depth attachment was set to MTLStoreActionUnknown when the render command encoder was created,
 setDepthStoreActionOptions: may be used to finalize the store action options before endEncoding is called.
 */
    setDepthStoreActionOptions_ :: (self: *MTLParallelRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions) -> void {
        func: #type (obj: *void, selector: *void, storeActionOptions: MTLStoreActionOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthStoreActionOptions_, storeActionOptions);
    }

/*!
 @method setStencilStoreActionOptions:
 @brief If the the store action for the stencil attachment was set to MTLStoreActionUnknown when the render command encoder was created,
 setStencilStoreActionOptions: may be used to finalize the store action options before endEncoding is called.
 */
    setStencilStoreActionOptions_ :: (self: *MTLParallelRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions) -> void {
        func: #type (obj: *void, selector: *void, storeActionOptions: MTLStoreActionOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilStoreActionOptions_, storeActionOptions);
    }

}

/*!
 @protocol MTLSamplerState
 @abstract An immutable collection of sampler state compiled for a single device.
 */
MTLSamplerState :: struct #type_info_no_size_complaint {
/*!
 @property label
 @abstract A string to help identify this object.
 */
    label :: (self: *MTLSamplerState) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

/*!
 @property device
 @abstract The device this resource was created against.  This resource can only be used with this device.
 */
    device :: (self: *MTLSamplerState) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

/*!
 @property gpuResourceID
 @abstract Handle of the GPU resource suitable for storing in an Argument Buffer
 */
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

/*!
 @property gpuResourceID
 @abstract Handle of the GPU resource suitable for storing in an Argument Buffer
 */
    gpuResourceID :: (self: *MTLAccelerationStructure) -> MTLResourceID {
        func: #type (obj: *void, selector: *void) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.gpuResourceID);
    }

}

/*!
 @protocol MTLHeap
 */
MTLHeap :: struct #type_info_no_size_complaint {
/*!
 @method maxAvailableSizeWithAlignment:
 @abstract The maximum size that can be successfully allocated from the heap in bytes, taking into notice given alignment. Alignment needs to be zero, or power of two.
 @discussion Provides a measure of fragmentation within the heap.
 */
    maxAvailableSizeWithAlignment_ :: (self: *MTLHeap, alignment: NSUInteger) -> NSUInteger {
        func: #type (obj: *void, selector: *void, alignment: NSUInteger) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.maxAvailableSizeWithAlignment_, alignment);
    }

/*!
 @method newBufferWithLength:options:
 @abstract Create a new buffer backed by heap memory.
 @discussion The requested storage and CPU cache modes must match the storage and CPU cache modes of the heap.
 @return The buffer or nil if heap is full.
 */
    newBufferWithLength_options_ :: (self: *MTLHeap, length: NSUInteger, options: MTLResourceOptions) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void, length: NSUInteger, options: MTLResourceOptions) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newBufferWithLength_options_, length, options);
    }

/*!
 @method newTextureWithDescriptor:
 @abstract Create a new texture backed by heap memory.
 @discussion The requested storage and CPU cache modes must match the storage and CPU cache modes of the heap, with the exception that the requested storage mode can be MTLStorageModeMemoryless. 
 @return The texture or nil if heap is full.
 */
    newTextureWithDescriptor_ :: (self: *MTLHeap, descriptor: *MTLTextureDescriptor) -> *MTLTexture {
        func: #type (obj: *void, selector: *void, descriptor: *MTLTextureDescriptor) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newTextureWithDescriptor_, descriptor);
    }

/*!
 @method setPurgeabilityState:
 @abstract Set or query the purgeability state of the heap.
 */
    setPurgeableState_ :: (self: *MTLHeap, state: MTLPurgeableState) -> MTLPurgeableState {
        func: #type (obj: *void, selector: *void, state: MTLPurgeableState) -> MTLPurgeableState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPurgeableState_, state);
    }

/*!
 @method newBufferWithLength:options:offset:
 @abstract Create a new buffer backed by heap memory at the specified placement offset.
 @discussion This method can only be used when heapType is set to MTLHeapTypePlacement.
 Use "MTLDevice heapBufferSizeAndAlignWithLength:options:" to determine requiredSize and requiredAlignment.
 Any resources that exist in this heap at overlapping half-open range [offset, offset + requiredSize) are implicitly aliased with the new resource.
 @param length The requested size of the buffer, in bytes.
 @param options The requested options of the buffer, of which the storage and CPU cache mode must match these of the heap.
 @param offset The requested offset of the buffer inside the heap, in bytes. Behavior is undefined if "offset + requiredSize > heap.size" or "offset % requiredAlignment != 0".
 @return The buffer, or nil if the heap is not a placement heap
 */
    newBufferWithLength_options_offset_ :: (self: *MTLHeap, length: NSUInteger, options: MTLResourceOptions, offset: NSUInteger) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void, length: NSUInteger, options: MTLResourceOptions, offset: NSUInteger) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newBufferWithLength_options_offset_, length, options, offset);
    }

/*!
 @method newTextureWithDescriptor:offset:
 @abstract Create a new texture backed by heap memory at the specified placement offset.
 @discussion This method can only be used when heapType is set to MTLHeapTypePlacement.
 Use "MTLDevice heapTextureSizeAndAlignWithDescriptor:" to determine requiredSize and requiredAlignment.
 Any resources that exist in this heap at overlapping half-open range [offset, offset + requiredSize) are implicitly aliased with the new resource.
 @param descriptor The requested properties of the texture, of which the storage and CPU cache mode must match those of the heap.
 @param offset The requested offset of the texture inside the heap, in bytes. Behavior is undefined if "offset + requiredSize > heap.size" and "offset % requiredAlignment != 0".
 @return The texture, or nil if the heap is not a placement heap.
 */
    newTextureWithDescriptor_offset_ :: (self: *MTLHeap, descriptor: *MTLTextureDescriptor, offset: NSUInteger) -> *MTLTexture {
        func: #type (obj: *void, selector: *void, descriptor: *MTLTextureDescriptor, offset: NSUInteger) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newTextureWithDescriptor_offset_, descriptor, offset);
    }

/*!
 @method newAccelerationStructureWithSize:
 @abstract Create a new acceleration structure backed by heap memory.
 @return The acceleration structure or nil if heap is full. Note that the MTLAccelerationStructure merely represents storage for an acceleration structure. It will still need to be populated via a build, copy, refit, etc.
 */
    newAccelerationStructureWithSize_ :: (self: *MTLHeap, size: NSUInteger) -> *MTLAccelerationStructure {
        func: #type (obj: *void, selector: *void, size: NSUInteger) -> *MTLAccelerationStructure #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newAccelerationStructureWithSize_, size);
    }

/*!
 @method newAccelerationStructureWithDescriptor:
 @abstract Create a new acceleration structure backed by heap memory.
 @discussion This is a convenience method which creates the acceleration structure backed by heap memory. The acceleration structure size is inferred based on the descriptor.
 @return The acceleration structure or nil if heap is full. Note that the MTLAccelerationStructure merely represents storage for an acceleration structure. It will still need to be populated via a build, copy, refit, etc.
 */
    newAccelerationStructureWithDescriptor_ :: (self: *MTLHeap, descriptor: *MTLAccelerationStructureDescriptor) -> *MTLAccelerationStructure {
        func: #type (obj: *void, selector: *void, descriptor: *MTLAccelerationStructureDescriptor) -> *MTLAccelerationStructure #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newAccelerationStructureWithDescriptor_, descriptor);
    }

/*!
 @method newAccelerationStructureWithSize:offset:
 @abstract Create a new acceleration structure backed by heap memory at the specified placement offset.
 @discussion This method can only be used when heapType is set to MTLHeapTypePlacement.
 Use "MTLDevice heapAccelerationStructureSizeAndAlignWithSize:" or "MTLDevice heapAccelerationStructureSizeAndAlignWithDescriptor:" to determine requiredSize and requiredAlignment.
 Any resources that exist in this heap at overlapping half-open range [offset, offset + requiredSize) are implicitly aliased with the new resource.
 @param size The requested size of the acceleration structure, in bytes.
 @param offset The requested offset of the acceleration structure inside the heap, in bytes. Behavior is undefined if "offset + requiredSize > heap.size" or "offset % requiredAlignment != 0".
 @return The acceleration structure, or nil if the heap is not a placement heap
 */
    newAccelerationStructureWithSize_offset_ :: (self: *MTLHeap, size: NSUInteger, offset: NSUInteger) -> *MTLAccelerationStructure {
        func: #type (obj: *void, selector: *void, size: NSUInteger, offset: NSUInteger) -> *MTLAccelerationStructure #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newAccelerationStructureWithSize_offset_, size, offset);
    }

/*!
 @method newAccelerationStructureWithDescriptor:offset:
 @abstract Create a new acceleration structure backed by heap memory at the specified placement offset.
 @discussion This is a convenience method which computes the acceleration structure size based on the descriptor.
 This method can only be used when heapType is set to MTLHeapTypePlacement.
 Use "MTLDevice heapAccelerationStructureSizeAndAlignWithSize:" or "MTLDevice heapAccelerationStructureSizeAndAlignWithDescriptor:" to determine requiredSize and requiredAlignment.
 Any resources that exist in this heap at overlapping half-open range [offset, offset + requiredSize) are implicitly aliased with the new resource.
 @param descriptor The acceleration structure descriptor
 @param offset The requested offset of the acceleration structure inside the heap, in bytes. Behavior is undefined if "offset + requiredSize > heap.size" or "offset % requiredAlignment != 0".
 @return The acceleration structure, or nil if the heap is not a placement heap
 */
    newAccelerationStructureWithDescriptor_offset_ :: (self: *MTLHeap, descriptor: *MTLAccelerationStructureDescriptor, offset: NSUInteger) -> *MTLAccelerationStructure {
        func: #type (obj: *void, selector: *void, descriptor: *MTLAccelerationStructureDescriptor, offset: NSUInteger) -> *MTLAccelerationStructure #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newAccelerationStructureWithDescriptor_offset_, descriptor, offset);
    }

/*!
 @property label
 @abstract A string to help identify this heap.
 */
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

/*!
 @property device
 @abstract The device this heap was created against. This heap can only be used with this device.
 */
    device :: (self: *MTLHeap) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

/*!
 @property storageMode
 @abstract Current heap storage mode, default is MTLStorageModePrivate.
 @discussion All resources created from this heap share the same storage mode.
 */
    storageMode :: (self: *MTLHeap) -> MTLStorageMode {
        func: #type (obj: *void, selector: *void) -> MTLStorageMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.storageMode);
    }

/*!
 @property cpuCacheMode
 @abstract CPU cache mode for the heap. Default is MTLCPUCacheModeDefaultCache.
 @discussion All resources created from this heap share the same cache mode.
 */
    cpuCacheMode :: (self: *MTLHeap) -> MTLCPUCacheMode {
        func: #type (obj: *void, selector: *void) -> MTLCPUCacheMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.cpuCacheMode);
    }

/*!
 @property hazardTrackingMode
 @abstract Whether or not the heap is hazard tracked.
 @discussion
 When a resource on a hazard tracked heap is modified, reads and writes from any other resource on that heap will be delayed until the modification is complete.
 Similarly, modifying heap resources will be delayed until all in-flight reads and writes from resources suballocated on that heap have completed.
 For optimal performance, perform hazard tracking manually through MTLFence or MTLEvent instead.
 Resources on the heap may opt-out of hazard tracking individually when the heap is hazard tracked,
 however resources cannot opt-in to hazard tracking when the heap is not hazard tracked.
 */
    hazardTrackingMode :: (self: *MTLHeap) -> MTLHazardTrackingMode {
        func: #type (obj: *void, selector: *void) -> MTLHazardTrackingMode #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.hazardTrackingMode);
    }

/*!
 @property resourceOptions
 @abstract A packed tuple of the storageMode, cpuCacheMode and hazardTrackingMode properties.
 */
    resourceOptions :: (self: *MTLHeap) -> MTLResourceOptions {
        func: #type (obj: *void, selector: *void) -> MTLResourceOptions #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resourceOptions);
    }

/*!
 @property size
 @abstract Heap size in bytes, specified at creation time and rounded up to device specific alignment.
 */
    size :: (self: *MTLHeap) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.size);
    }

/*!
 @property usedSize
 @abstract The size in bytes, of all resources allocated from the heap.
 */
    usedSize :: (self: *MTLHeap) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.usedSize);
    }

/*!
 @property currentAllocatedSize
 @abstract The size in bytes of the current heap allocation.
 */
    currentAllocatedSize :: (self: *MTLHeap) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.currentAllocatedSize);
    }

/*!
 @property type
 @abstract The type of the heap. The default value is MTLHeapTypeAutomatic.
 @discussion This constrains the resource creation functions that are available on the heap.
 */
    type :: (self: *MTLHeap) -> MTLHeapType {
        func: #type (obj: *void, selector: *void) -> MTLHeapType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.type);
    }

}

/*!
 * @protocol MTLArgumentEncoder
 * @discussion MTLArgumentEncoder encodes buffer, texture, sampler, and constant data into a buffer.
 */
MTLArgumentEncoder :: struct #type_info_no_size_complaint {
/*!
 * @method setArgumentBuffer:offset:
 * @brief Sets the destination buffer and offset at which the arguments will be encoded.
 */
    setArgumentBuffer_offset_ :: (self: *MTLArgumentEncoder, argumentBuffer: *MTLBuffer, offset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, argumentBuffer: *MTLBuffer, offset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setArgumentBuffer_offset_, argumentBuffer, offset);
    }

/*!
 * @method setArgumentBuffer:offset:arrayElement:
 * @brief Sets the destination buffer, starting offset and specific array element arguments will be encoded into. arrayElement represents
          the desired element of IAB array targetted by encoding
 */
    setArgumentBuffer_startOffset_arrayElement_ :: (self: *MTLArgumentEncoder, argumentBuffer: *MTLBuffer, startOffset: NSUInteger, arrayElement: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, argumentBuffer: *MTLBuffer, startOffset: NSUInteger, arrayElement: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setArgumentBuffer_startOffset_arrayElement_, argumentBuffer, startOffset, arrayElement);
    }

/*!
 * @method setBuffer:offset:atIndex:
 * @brief Set a buffer at the given bind point index.
 */
    setBuffer_offset_atIndex_ :: (self: *MTLArgumentEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBuffer_offset_atIndex_, buffer, offset, index);
    }

/*!
 * @method setBuffers:offsets:withRange:
 * @brief Set an array of buffers at the given bind point index range.
 */
    setBuffers_offsets_withRange_ :: (self: *MTLArgumentEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBuffers_offsets_withRange_, buffers, offsets, range);
    }

/*!
 * @method setTexture:atIndex:
 * @brief Set a texture at the given bind point index.
 */
    setTexture_atIndex_ :: (self: *MTLArgumentEncoder, texture: *MTLTexture, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTexture_atIndex_, texture, index);
    }

/*!
 * @method setTextures:withRange:
 * @brief Set an array of textures at the given bind point index range.
 */
    setTextures_withRange_ :: (self: *MTLArgumentEncoder, textures: **MTLTexture, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, textures: **MTLTexture, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTextures_withRange_, textures, range);
    }

/*!
 * @method setSamplerState:atIndex:
 * @brief Set a sampler at the given bind point index.
 */
    setSamplerState_atIndex_ :: (self: *MTLArgumentEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sampler: *MTLSamplerState, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSamplerState_atIndex_, sampler, index);
    }

/*!
 * @method setSamplerStates:withRange:
 * @brief Set an array of samplers at the given bind point index range.
 */
    setSamplerStates_withRange_ :: (self: *MTLArgumentEncoder, samplers: **MTLSamplerState, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, samplers: **MTLSamplerState, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSamplerStates_withRange_, samplers, range);
    }

/*!
 * @method constantDataAtIndex:
 * @brief Returns a pointer to the constant data at the given bind point index.
 */
    constantDataAtIndex_ :: (self: *MTLArgumentEncoder, index: NSUInteger) -> *void {
        func: #type (obj: *void, selector: *void, index: NSUInteger) -> *void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.constantDataAtIndex_, index);
    }

/*!
 * @method setRenderPipelineState:atIndex
 * @brief Sets a render pipeline state at a given bind point index
 */
    setRenderPipelineState_atIndex_ :: (self: *MTLArgumentEncoder, pipeline: *MTLRenderPipelineState, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, pipeline: *MTLRenderPipelineState, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRenderPipelineState_atIndex_, pipeline, index);
    }

/*!
 * @method setRenderPipelineStates:withRange
 * @brief Set an array of render pipeline states at a given bind point index range
 */
    setRenderPipelineStates_withRange_ :: (self: *MTLArgumentEncoder, pipelines: **MTLRenderPipelineState, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, pipelines: **MTLRenderPipelineState, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRenderPipelineStates_withRange_, pipelines, range);
    }

/*!
 * @method setComputePipelineState:atIndex
 * @brief Sets a compute pipeline state at a given bind point index
 */
    setComputePipelineState_atIndex_ :: (self: *MTLArgumentEncoder, pipeline: *MTLComputePipelineState, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, pipeline: *MTLComputePipelineState, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setComputePipelineState_atIndex_, pipeline, index);
    }

/*!
 * @method setComputePipelineStates:withRange
 * @brief Set an array of compute pipeline states at a given bind point index range
 */
    setComputePipelineStates_withRange_ :: (self: *MTLArgumentEncoder, pipelines: **MTLComputePipelineState, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, pipelines: **MTLComputePipelineState, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setComputePipelineStates_withRange_, pipelines, range);
    }

/*!
 * @method setIndirectCommandBuffer:atIndex
 * @brief Sets an indirect command buffer at a given bind point index
 */
    setIndirectCommandBuffer_atIndex_ :: (self: *MTLArgumentEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, indirectCommandBuffer: *MTLIndirectCommandBuffer, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIndirectCommandBuffer_atIndex_, indirectCommandBuffer, index);
    }

/*!
 * @method setIndirectCommandBuffers:withRange:
 * @brief Set an array of indirect command buffers at the given bind point index range.
 */
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

/*!
 * @method newArgumentEncoderForBufferAtIndex:
 * @brief Returns a pointer to a new MTLArgumentEncoder that can be used to encode the an argument buffer
 * in the buffer associated with a given index.
 * Returns nil if the resource at the given index is not an argument buffer.
 */
    newArgumentEncoderForBufferAtIndex_ :: (self: *MTLArgumentEncoder, index: NSUInteger) -> *MTLArgumentEncoder {
        func: #type (obj: *void, selector: *void, index: NSUInteger) -> *MTLArgumentEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newArgumentEncoderForBufferAtIndex_, index);
    }

/*!
 * @method setVisibleFunctionTable:atIndex:
 * @brief Set a visible function table at the given buffer index
 */
    setVisibleFunctionTable_atIndex_ :: (self: *MTLArgumentEncoder, visibleFunctionTable: *MTLVisibleFunctionTable, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, visibleFunctionTable: *MTLVisibleFunctionTable, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVisibleFunctionTable_atIndex_, visibleFunctionTable, index);
    }

/*!
 * @method setVisibleFunctionTables:withRange:
 * @brief Set visible function tables at the given buffer index range
 */
    setVisibleFunctionTables_withRange_ :: (self: *MTLArgumentEncoder, visibleFunctionTables: **MTLVisibleFunctionTable, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, visibleFunctionTables: **MTLVisibleFunctionTable, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVisibleFunctionTables_withRange_, visibleFunctionTables, range);
    }

/*!
 * @method setIntersectionFunctionTable:atIndex:
 * @brief Set an intersection function table at the given buffer index
 */
    setIntersectionFunctionTable_atIndex_ :: (self: *MTLArgumentEncoder, intersectionFunctionTable: *MTLIntersectionFunctionTable, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, intersectionFunctionTable: *MTLIntersectionFunctionTable, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIntersectionFunctionTable_atIndex_, intersectionFunctionTable, index);
    }

/*!
 * @method setIntersectionFunctionTables:withRange:
 * @brief Set intersection function tables at the given buffer index range
 */
    setIntersectionFunctionTables_withRange_ :: (self: *MTLArgumentEncoder, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setIntersectionFunctionTables_withRange_, intersectionFunctionTables, range);
    }

/*!
 * @method setDepthStencilState:atIndex
 * @brief Sets a depth stencil state at a given bind point index
 */
    setDepthStencilState_atIndex_ :: (self: *MTLArgumentEncoder, depthStencilState: *MTLDepthStencilState, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, depthStencilState: *MTLDepthStencilState, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthStencilState_atIndex_, depthStencilState, index);
    }

/*!
 * @method setDepthStencilStates:withRange:
 * @brief Sets an array of depth stencil states at a given buffer index range
 */
    setDepthStencilStates_withRange_ :: (self: *MTLArgumentEncoder, depthStencilStates: **MTLDepthStencilState, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, depthStencilStates: **MTLDepthStencilState, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthStencilStates_withRange_, depthStencilStates, range);
    }

/*!
 @property device
 @abstract The device this argument encoder was created against.
 */
    device :: (self: *MTLArgumentEncoder) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

/*!
 @property label
 @abstract A string to help identify this object.
 */
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

/*!
 * @property encodedLength
 * @abstract The number of bytes required to store the encoded resource bindings.
 */
    encodedLength :: (self: *MTLArgumentEncoder) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.encodedLength);
    }

/*!
 * @property alignment
 * @abstract The alignment in bytes required to store the encoded resource bindings.
 */
    alignment :: (self: *MTLArgumentEncoder) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.alignment);
    }

}

/// An encoder that writes GPU commands into a command buffer.
MTL4CommandEncoder :: struct #type_info_no_size_complaint {
/// Encodes a consumer barrier on work you commit to the same command queue.
///
/// Encode a barrier that guarantees that any subsequent work you encode in the current command encoder that corresponds
/// to the `beforeStages` stages doesn't proceed until Metal completes all work prior to the current command encoder
/// corresponding to the `afterQueueStages` stages, completes.
///
/// Metal can reorder the exact point where it applies the barrier, so encode the barrier as close to the command that
/// consumes the resource as possible. Don't use this method for synchronizing resource access within the same pass.
///
/// If you need to synchronize work within a pass that you encode with an instance of a subclass of ``MTLCommandEncoder``,
/// use memory barriers instead. For subclasses of ``MTL4CommandEncoder``, use encoder barriers.
///
/// You can specify `afterQueueStages` and `beforeStages` that contain ``MTLStages`` unrelated to the current command
/// encoder.
///
/// - Parameters:
///   - afterQueueStages: ``MTLStages`` mask that represents the stages of work to wait for.
///                        This argument applies to work corresponding to these stages you
///                        encode in prior command encoders, and not for the current encoder.
///   - beforeStages:     ``MTLStages`` mask that represents the stages of work that wait.
///                        This argument applies to work you encode in the current command encoder.
///   - visibilityOptions: ``MTL4VisibilityOptions`` of the barrier.
    barrierAfterQueueStages_beforeStages_visibilityOptions_ :: (self: *MTL4CommandEncoder, afterQueueStages: MTLStages, beforeStages: MTLStages, visibilityOptions: MTL4VisibilityOptions) -> void {
        func: #type (obj: *void, selector: *void, afterQueueStages: MTLStages, beforeStages: MTLStages, visibilityOptions: MTL4VisibilityOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.barrierAfterQueueStages_beforeStages_visibilityOptions_, afterQueueStages, beforeStages, visibilityOptions);
    }

/// Encodes a producer barrier on work committed to the same command queue.
///
/// This method encodes a barrier that guarantees that any work you encode using *subsequent command encoders*,
/// corresponding to `beforeQueueStages`, don't begin until all commands you previously encode in the current
/// encoder (and prior encoders), corresponding to `afterStages`, complete.
///
/// When calling this method, you can pass any ``MTLStages`` to parameters `afterStages` and `beforeQueueStages`,
/// even stages that don't relate to the current or prior command encoders.
///
/// - Parameters:
///   - afterStages:       ``MTLStages`` mask that represents the stages of work to wait for.
///                         This argument applies to work corresponding to these stages you encode in
///                         the current command encoder prior to this barrier command.
///   - beforeQueueStages: ``MTLStages`` mask that represents the stages of work that need to wait.
///                         This argument applies to subsequent encoders and not to work in the current
///                         command encoder.
///   - visibilityOptions: ``MTL4VisibilityOptions`` of the barrier, controlling cache flush behavior.
    barrierAfterStages_beforeQueueStages_visibilityOptions_ :: (self: *MTL4CommandEncoder, afterStages: MTLStages, beforeQueueStages: MTLStages, visibilityOptions: MTL4VisibilityOptions) -> void {
        func: #type (obj: *void, selector: *void, afterStages: MTLStages, beforeQueueStages: MTLStages, visibilityOptions: MTL4VisibilityOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.barrierAfterStages_beforeQueueStages_visibilityOptions_, afterStages, beforeQueueStages, visibilityOptions);
    }

/// Encodes an intra-pass barrier.
///
/// Encode a barrier that guarantees that any subsequent work you encode in the *current command encoder*,
/// corresponding to `beforeEncoderStages`, doesn't begin until all prior commands in this command encoder,
/// corresponding to `afterEncoderStages`, completes.
///
/// When calling this method, it's your responsibility to ensure parameters `afterEncoderStages` and `beforeEncoderStages`
/// contain a combination of ``MTLStages`` for which this encoder can encode commands. For example, for a
/// ``MTL4ComputeCommandEncoder`` instance, you can provide any combination of ``MTLStages/MTLStageDispatch``,
/// ``MTLStages/MTLStageBlit`` and ``MTLStages/MTLStageAccelerationStructure``.
///
/// - Parameters:
///   - afterEncoderStages:  ``MTLStages`` mask that represents the stages of work to wait for.
///                          This argument only applies to subsequent work you encode in the current command encoder.
///   - beforeEncoderStages: ``MTLStages`` mask that represents the stages of work that wait.
///                          This argument only applies to work you encode in the current command encoder prior to
///                          this barrier.
///   - visibilityOptions: ``MTL4VisibilityOptions`` of the barrier, controlling cache flush behavior.
    barrierAfterEncoderStages_beforeEncoderStages_visibilityOptions_ :: (self: *MTL4CommandEncoder, afterEncoderStages: MTLStages, beforeEncoderStages: MTLStages, visibilityOptions: MTL4VisibilityOptions) -> void {
        func: #type (obj: *void, selector: *void, afterEncoderStages: MTLStages, beforeEncoderStages: MTLStages, visibilityOptions: MTL4VisibilityOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.barrierAfterEncoderStages_beforeEncoderStages_visibilityOptions_, afterEncoderStages, beforeEncoderStages, visibilityOptions);
    }

/// Encodes a command to update a GPU fence.
///
/// This method encodes a command that updates a ``MTLFence`` instance after all previously-encoded commands in the
/// current command encoder, corresponding to `afterEncoderStages`, complete.
///
/// Use parameter `afterEncoderStages` to pass in a combination of ``MTLStages`` for which this encoder can encode work.
/// For example, for a ``MTL4ComputeCommandEncoder`` you can provide any combination of ``MTLStages/MTLStageDispatch``,
/// ``MTLStages/MTLStageBlit`` and ``MTLStages/MTLStageAccelerationStructure``.
///
/// - Parameters:
///   - fence:              ``MTLFence`` instance to update.
///   - afterEncoderStages: ``MTLStages`` value that represents the stages of work to wait for.
///                          This argument only applies to work encoded in the current command encoder.
    updateFence_afterEncoderStages_ :: (self: *MTL4CommandEncoder, fence: *MTLFence, afterEncoderStages: MTLStages) -> void {
        func: #type (obj: *void, selector: *void, fence: *MTLFence, afterEncoderStages: MTLStages) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.updateFence_afterEncoderStages_, fence, afterEncoderStages);
    }

/// Encodes a command to wait on a GPU fence.
///
/// Encode a command that guarantees that any subsequent work you encode via this current command encoder,
/// corresponding to `beforeEncoderStages`, doesn't begin until all prior updates to the fence is complete.
///
/// To successfully wait for a fence update, schedule update and wait operations on the same command queue.
///
/// Use parameter `beforeEncoderStages` to pass in a combination of ``MTLStages`` for which this encoder can encode
/// work. For example, for a ``MTL4ComputeCommandEncoder`` you can provide any combination of
/// ``MTLStages/MTLStageDispatch``, ``MTLStages/MTLStageBlit`` and ``MTLStages/MTLStageAccelerationStructure``.
///
/// - Parameters:
///   - fence:              ``MTLFence`` instance to wait for.
///   - beforeEncoderStages:``MTLStages`` value that represents the stages of work that wait.
///                         This argument only applies to work you encode in the current command encoder.
    waitForFence_beforeEncoderStages_ :: (self: *MTL4CommandEncoder, fence: *MTLFence, beforeEncoderStages: MTLStages) -> void {
        func: #type (obj: *void, selector: *void, fence: *MTLFence, beforeEncoderStages: MTLStages) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.waitForFence_beforeEncoderStages_, fence, beforeEncoderStages);
    }

/// Inserts a debug string into the frame data to aid debugging.
///
/// Calling this method doesn't change any behaviors, but can be useful for debugging purposes.
///
/// - Parameter string: The debug string to insert as a signpost.
    insertDebugSignpost_ :: (self: *MTL4CommandEncoder, str: *NSString) -> void {
        func: #type (obj: *void, selector: *void, str: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.insertDebugSignpost_, str);
    }

/// Pushes a string onto this encoder's stack of debug groups.
///
/// - Parameter string: The debug string to push.
    pushDebugGroup_ :: (self: *MTL4CommandEncoder, str: *NSString) -> void {
        func: #type (obj: *void, selector: *void, str: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pushDebugGroup_, str);
    }

/// Pops the latest debug group string from this encoder's stack of debug groups.
    popDebugGroup :: (self: *MTL4CommandEncoder) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.popDebugGroup);
    }

/// Declares that all command generation from this encoder is complete.
    endEncoding :: (self: *MTL4CommandEncoder) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.endEncoding);
    }

/// Provides an optional label to assign to the command encoder for debug purposes.
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

/// Returns the command buffer that is currently encoding commands.
///
/// This property may return undefined results if you call it after calling ``endEncoding``.
    commandBuffer :: (self: *MTL4CommandEncoder) -> *MTL4CommandBuffer {
        func: #type (obj: *void, selector: *void) -> *MTL4CommandBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.commandBuffer);
    }

}

/// Encodes a render pass into a command buffer, including all its draw calls and configuration.
MTL4RenderCommandEncoder :: struct #type_info_no_size_complaint {
/// Sets the mapping from logical shader color output to physical render pass color attachments.
///
/// Use this method to define how the physical color attachments you specify via ``MTL4RenderPassDescriptor/colorAttachments``
/// map to the logical color output the fragment shader writes to.
///
/// To use this feature, make sure to set ``MTL4RenderPassDescriptor/supportColorAttachmentMapping`` to
/// <doc://com.apple.documentation/documentation/swift/true>.
///
/// - Parameter mapping: Mapping from logical shader outputs to physical outputs.
    setColorAttachmentMap_ :: (self: *MTL4RenderCommandEncoder, mapping: *MTLLogicalToPhysicalColorAttachmentMap) -> void {
        func: #type (obj: *void, selector: *void, mapping: *MTLLogicalToPhysicalColorAttachmentMap) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setColorAttachmentMap_, mapping);
    }

/// Configures this encoder with a render pipeline state that applies to your subsequent draw commands.
///
/// - Parameter pipelineState: a non-`nil` ``MTLRenderPipelineState`` instance.
    setRenderPipelineState_ :: (self: *MTL4RenderCommandEncoder, pipelineState: *MTLRenderPipelineState) -> void {
        func: #type (obj: *void, selector: *void, pipelineState: *MTLRenderPipelineState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setRenderPipelineState_, pipelineState);
    }

/// Sets the viewport which that transforms vertices from normalized device coordinates to window coordinates.
///
/// Metal clips fragments that lie outside this viewport, and optionally clamps fragments outside of z-near/z-far range
/// depending on the value you assign to ``setDepthClipMode:``.
///
/// - Parameter viewport: ``MTLViewport`` to set.
    setViewport_ :: (self: *MTL4RenderCommandEncoder, viewport: MTLViewport) -> void {
        func: #type (obj: *void, selector: *void, viewport: MTLViewport) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setViewport_, viewport);
    }

/// Sets an array of viewports to transform vertices from normalized device coordinates to window coordinates.
///
/// Metal clips fragments that lie outside of the viewport, and optionally clamps fragments outside of z-near/z-far range,
/// depending on the value you assign to ``setDepthClipMode:``.
///
/// Metal selects the viewport to use from the `[[ viewport_array_index ]]` attribute you specify in the pipeline
/// state's vertex shader function in the Metal Shading Language.
///
/// - Parameters:
///   - viewports: Array of ``MTLViewport`` instances.
///   - count: Number of ``MTLViewport`` instances in the array.
    setViewports_count_ :: (self: *MTL4RenderCommandEncoder, viewports: *MTLViewport, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, viewports: *MTLViewport, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setViewports_count_, viewports, count);
    }

/// Sets the vertex amplification count and its view mapping for each amplification ID.
///
/// Each view mapping element describes how to route the corresponding amplification ID to a specific viewport and
/// render target array index by using offsets from the base array index provided by the `[[ render_target_array_index ]]`
/// and/or `[[ viewport_array_index ]]` output attributes in the vertex shader. This allows Metal to route each amplified
///  vertex to a different `[[ render_target_array_index ]]` and `[[ viewport_array_index ]]`, even though you can't
///  directly amplify these attributes.
///
/// - Parameters:
///   - count: The number of outputs to create. The maximum value is `2`.
///   - viewMappings: Array of ``MTLVertexAmplificationViewMapping`` instances. Each instance provides
///                   per-output offsets to a specific render target and viewport.
    setVertexAmplificationCount_viewMappings_ :: (self: *MTL4RenderCommandEncoder, count: NSUInteger, viewMappings: *MTLVertexAmplificationViewMapping) -> void {
        func: #type (obj: *void, selector: *void, count: NSUInteger, viewMappings: *MTLVertexAmplificationViewMapping) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVertexAmplificationCount_viewMappings_, count, viewMappings);
    }

/// Controls whether Metal culls front facing primitives, back facing primitives, or culls no primitives at all.
///
/// - Parameter cullMode: ``MTLCullMode`` to set.
    setCullMode_ :: (self: *MTL4RenderCommandEncoder, cullMode: MTLCullMode) -> void {
        func: #type (obj: *void, selector: *void, cullMode: MTLCullMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setCullMode_, cullMode);
    }

/// Controls the behavior for fragments outside of the near or far planes.
///
/// - Parameter depthClipMode: ``MTLDepthClipMode`` to set.
    setDepthClipMode_ :: (self: *MTL4RenderCommandEncoder, depthClipMode: MTLDepthClipMode) -> void {
        func: #type (obj: *void, selector: *void, depthClipMode: MTLDepthClipMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthClipMode_, depthClipMode);
    }

/// Configures the adjustments a render pass applies to depth values from fragment shader functions
/// by a scaling factor and bias.
///
/// - Parameters:
///   - depthBias: A constant bias the render pipeline applies to all fragments.
///   - slopeScale: A bias coefficient that scales with the depth of the primitive relative to the camera.
///   - clamp: A value that limits the bias value the render pipeline can apply to a fragment.
///            Pass a positive or negative value to limit the largest magnitude of a positive
///            or negative bias, respectively. Set this value to `0` to disable bias clamping.
    setDepthBias_slopeScale_clamp_ :: (self: *MTL4RenderCommandEncoder, depthBias: float32, slopeScale: float32, clamp: float32) -> void {
        func: #type (obj: *void, selector: *void, depthBias: float32, slopeScale: float32, clamp: float32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthBias_slopeScale_clamp_, depthBias, slopeScale, clamp);
    }

/// Configures the minimum and maximum bounds for depth bounds testing.
///
/// The render command encoder disables depth bounds testing by default.
/// The render command encoder also disables depth bounds testing when all of the following properties equal a specific value:
/// - The `minBound` property is equal to `0.0f`.
/// - The `maxBound` property is equal to `1.0f`.
/// Both `minBound` and `maxBound` need to be within `[0.0f, 1.0f]`, and `minBound` needs to be less than or equal to `maxBound`.
/// - Parameters:
///   - minBound: A minimum bound for depth testing, which discards fragments with a stored depth that is less than `minBound`.
///   - maxBound: A maximum bound for depth testing, which discards fragments with a stored depth that is greater than `maxBound`.
    setDepthTestMinBound_maxBound_ :: (self: *MTL4RenderCommandEncoder, minBound: float32, maxBound: float32) -> void {
        func: #type (obj: *void, selector: *void, minBound: float32, maxBound: float32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthTestMinBound_maxBound_, minBound, maxBound);
    }

/// Sets a scissor rectangle to discard fragments outside a specific area.
///
/// Metal performs a scissor test and discards all fragments outside of the scissor rect.
///
/// - Parameter rect: ``MTLScissorRect`` rectangle to specify. This rectangle needs to lie completely
///                   within the current render attachment.
    setScissorRect_ :: (self: *MTL4RenderCommandEncoder, rect: MTLScissorRect) -> void {
        func: #type (obj: *void, selector: *void, rect: MTLScissorRect) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setScissorRect_, rect);
    }

/// Sets an array of scissor rectangles for a fragment scissor test.
///
/// Metal uses the specific scissor rectangle corresponding to the index you specify via the `[[ viewport_array_index ]]`
/// output attribute of the vertex shader function in the Metal Shading Language, discarding all fragments outside of
/// the scissor rect.
///
/// - Parameters:
///   - scissorRects: Array of ``MTLScissorRect`` structures.
///   - count: Number of ``MTLScissorRect`` structures in the array.
    setScissorRects_count_ :: (self: *MTL4RenderCommandEncoder, scissorRects: *MTLScissorRect, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, scissorRects: *MTLScissorRect, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setScissorRects_count_, scissorRects, count);
    }

/// Configures how subsequent draw commands rasterize triangle and triangle strip primitives.
///
/// - Parameter fillMode:``MTLTriangleFillMode`` the render pass applies to draw commands that
///                       rasterize triangles or triangle strips.
    setTriangleFillMode_ :: (self: *MTL4RenderCommandEncoder, fillMode: MTLTriangleFillMode) -> void {
        func: #type (obj: *void, selector: *void, fillMode: MTLTriangleFillMode) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTriangleFillMode_, fillMode);
    }

/// Configures each pixel component value, including alpha, for the render pipeline’s constant blend color.
///
/// - Parameters:
///   - red: A value for the red component for the blend color constant.
///   - green: A value for the green component for the blend color constant.
///   - blue: A value for the blue component for the blend color constant.
///   - alpha: A value for the alpha component for the blend color constant.
    setBlendColorRed_green_blue_alpha_ :: (self: *MTL4RenderCommandEncoder, red: float32, green: float32, blue: float32, alpha: float32) -> void {
        func: #type (obj: *void, selector: *void, red: float32, green: float32, blue: float32, alpha: float32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setBlendColorRed_green_blue_alpha_, red, green, blue, alpha);
    }

/// Configures this encoder with a depth stencil state that applies to your subsequent draw commands.
///
/// - Parameter depthStencilState: the ``MTLDepthStencilState`` instance to set.
    setDepthStencilState_ :: (self: *MTL4RenderCommandEncoder, depthStencilState: *MTLDepthStencilState) -> void {
        func: #type (obj: *void, selector: *void, depthStencilState: *MTLDepthStencilState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthStencilState_, depthStencilState);
    }

/// Configures this encoder with a reference value for stencil testing.
///
/// The render pipeline applies this reference value to both front-facing and back-facing primitives.
///
/// - Parameter referenceValue: A stencil test comparison value.
    setStencilReferenceValue_ :: (self: *MTL4RenderCommandEncoder, referenceValue: u32) -> void {
        func: #type (obj: *void, selector: *void, referenceValue: u32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilReferenceValue_, referenceValue);
    }

/// Configures the encoder with different stencil test reference values for front-facing and back-facing primitives.
///
/// The render pipeline applies `frontReferenceValue` to front-facing primitives and `backReferenceValue` to
/// back-facing primitives.
///
/// - Parameters:
///   - frontReferenceValue: A stencil test comparison value the render pipeline applies
///                          to front-facing primitives.
///   - backReferenceValue: A stencil test comparison value the render pipeline applies
///                         to back-facing primitives.
    setStencilFrontReferenceValue_backReferenceValue_ :: (self: *MTL4RenderCommandEncoder, frontReferenceValue: u32, backReferenceValue: u32) -> void {
        func: #type (obj: *void, selector: *void, frontReferenceValue: u32, backReferenceValue: u32) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilFrontReferenceValue_backReferenceValue_, frontReferenceValue, backReferenceValue);
    }

/// Configures a visibility test for Metal to run, and the destination for any results it generates.
///
/// You use the `mode` parameter to enable or disable the visibility test, and determine if it produces a boolean
/// response for passing fragments, or if it counts the number of fragments.
///
/// - Parameters:
///   - mode: A ``MTLVisibilityResultMode`` that configures which visibility test results
///           the render pass saves to a buffer, or disables visibility testing.
///   - offset: A location, in bytes, relative to the start of
///             ``MTL4RenderPassDescriptor/visibilityResultBuffer`` The GPU stores
///             the result of a visibility test at `offset`, which needs to be a multiple of `8`.
    setVisibilityResultMode_offset_ :: (self: *MTL4RenderCommandEncoder, mode: MTLVisibilityResultMode, offset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, mode: MTLVisibilityResultMode, offset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setVisibilityResultMode_offset_, mode, offset);
    }

/// Configures the store action for a color attachment.
///
/// - Parameters:
///   - storeAction: A store action for the color attachment that
///                  can’t be ``MTLStoreAction/MTLStoreActionUnknown``.
///   - colorAttachmentIndex: The index of a color attachment.
    setColorStoreAction_atIndex_ :: (self: *MTL4RenderCommandEncoder, storeAction: MTLStoreAction, colorAttachmentIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, storeAction: MTLStoreAction, colorAttachmentIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setColorStoreAction_atIndex_, storeAction, colorAttachmentIndex);
    }

/// Configures the store action for the depth attachment.
///
/// - Parameter storeAction: A store action for the depth attachment that
///                          can’t be ``MTLStoreAction/MTLStoreActionUnknown``.
    setDepthStoreAction_ :: (self: *MTL4RenderCommandEncoder, storeAction: MTLStoreAction) -> void {
        func: #type (obj: *void, selector: *void, storeAction: MTLStoreAction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setDepthStoreAction_, storeAction);
    }

/// Configures the store action for the stencil attachment.
///
/// - Parameter storeAction: A store action for the stencil attachment that
///                          can’t be ``MTLStoreAction/MTLStoreActionUnknown``.
    setStencilStoreAction_ :: (self: *MTL4RenderCommandEncoder, storeAction: MTLStoreAction) -> void {
        func: #type (obj: *void, selector: *void, storeAction: MTLStoreAction) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setStencilStoreAction_, storeAction);
    }

/// Encodes a draw command that renders an instance of a geometric primitive.
///
/// This command assigns each vertex a unique `vertex_id` value that increases from `vertexStart` through
/// `(vertexStart + vertexCount - 1)`.
///
/// Your vertex shader function can use this value to uniquely identify each vertex.
///
/// - Parameters:
///   - primitiveType: A ``MTLPrimitiveType`` representing how the command interprets vertex argument data.
///   - vertexStart: The lowest value the command passes to your vertex shader function’s parameter with the
///                  `[[vertex_id]]` attribute.
///   - vertexCount: An integer that represents the number of vertices of `primitiveType` the command draws.
    drawPrimitives_vertexStart_vertexCount_ :: (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawPrimitives_vertexStart_vertexCount_, primitiveType, vertexStart, vertexCount);
    }

/// Encodes a draw command that renders multiple instances of a geometric primitive.
///
/// The command assigns each vertex a unique `vertex_id` value within its drawing instance
/// that increases from `vertexStart` through `(vertexStart + vertexCount - 1)`.
///
/// Additionally, the command assigns each drawing instance a unique `instance_id` value that increases
/// from `0` through `(instanceCount - 1)`.
///
/// Your vertex shader can use the `vertex_id` value to uniquely identify each vertex in each drawing instance, and the
/// `instance_id` value to identify which instance that vertex belongs to.
///
/// - Parameters:
///   - primitiveType: A ``MTLPrimitiveType`` represents how the command interprets vertex argument data.
///   - vertexStart: The lowest value the command passes to your vertex shader function’s parameter with
///                  the `vertex_id` attribute.
///   - vertexCount: An integer that represents the number of vertices of `primitiveType` the command draws.
///   - instanceCount: An integer that represents the number of times the command draws `primitiveType` primitives
///                    with `vertexCount` vertices.
    drawPrimitives_vertexStart_vertexCount_instanceCount_ :: (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawPrimitives_vertexStart_vertexCount_instanceCount_, primitiveType, vertexStart, vertexCount, instanceCount);
    }

/// Encodes a draw command that renders multiple instances of a geometric primitive,
/// starting with a custom instance identification number.
///
/// The command assigns each vertex a unique `vertex_id` value within its drawing instance
/// that increases from `vertexStart` through `(vertexStart + vertexCount - 1)`.
///
/// Additionally, the command assigns each drawing instance a unique `instance_id` value that increases
/// from `baseInstance` through `(baseInstance + instanceCount - 1)`.
///
/// Your vertex shader can use the `vertex_id` value to uniquely identify each vertex in each drawing instance, and the
/// `instance_id` value to identify which instance that vertex belongs to.
///
/// - Parameters:
///   - primitiveType: A ``MTLPrimitiveType``  representing how the command interprets vertex argument data.
///   - vertexStart: The lowest value the command passes to your vertex shader function’s parameter with
///                  the `vertex_id` attribute.
///   - vertexCount: An integer that represents the number of vertices of `primitiveType` the command draws.
///   - instanceCount: An integer that represents the number of times the command draws `primitiveType`
///                    with `vertexCount` vertices.
///   - baseInstance: The lowest value the command passes to your vertex shader function’s parameter with
///                   the `instance_id` attribute.
    drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance_ :: (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance_, primitiveType, vertexStart, vertexCount, instanceCount, baseInstance);
    }

/// Encodes a draw command that renders an instance of a geometric primitive with indexed vertices.
///
/// Use this method to perform indexed drawing, where an index buffer determines how Metal assembles primitives.
///
/// Metal imposes some restrictions on the index buffer's address, which needs to be 2- or 4-byte aligned, and its length
/// in bytes, which needs to be a multiple of 2 or 4, depending on whether the format of the index is
/// ``MTLIndexType/MTLIndexTypeUInt16`` or ``MTLIndexType/MTLIndexTypeUInt32``.
///
/// Use an instance of ``MTLResidencySet`` to mark residency of the index buffer the `indexBuffer` parameter references.
///
/// - Parameters:
///   - primitiveType: A ``MTLPrimitiveType`` representing how the command interprets vertex argument data.
///   - indexCount: An integer that represents the number of vertices the command reads from `indexBuffer`.
///   - indexType: A ``MTLIndexType`` instance that represents the index format.
///   - indexBuffer: GPUAddress of a ``MTLBuffer`` instance that contains `indexCount` indices of `indexType` format.
///                  You are responsible for ensuring this address is aligned to 2 bytes if the `indexType` format is
///                  ``MTLIndexType/MTLIndexTypeUInt16``, and aligned to 4 bytes if the format is
///                  ``MTLIndexType/MTLIndexTypeUInt32``.
///   - indexBufferLength: An integer that represents the length of `indexBuffer`, in bytes. You are responsible for
///                     ensuring this this size is a multiple of 2 if the `indexType` format is ``MTLIndexType/MTLIndexTypeUInt16``,
///                     and a multiple of 4 if the format is ``MTLIndexType/MTLIndexTypeUInt32``.
///                     If this draw call causes Metal to read indices at or beyond the `indexBufferLength`, Metal
///                     continues to execute them assigning a value of `0` to the `vertex_id` attribute.
    drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferLength_ :: (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: MTLGPUAddress, indexBufferLength: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: MTLGPUAddress, indexBufferLength: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferLength_, primitiveType, indexCount, indexType, indexBuffer, indexBufferLength);
    }

/// Encodes a draw command that renders multiple instances of a geometric primitive with indexed vertices.
///
/// Use this method to perform instanced indexed drawing, where an index buffer determines how Metal assembles primitives.
///
/// The command assigns each drawing instance a unique `instance_id` value that increases
/// from `0` through `(instanceCount - 1)`. Your shader can use this value to identify which
/// instance the vertex belongs to.
///
/// Metal imposes some restrictions on the index buffer's address, which needs to be 2- or 4-byte aligned, and its length
/// in bytes, which needs to be a multiple of 2 or 4, depending on whether the format of the index is
/// ``MTLIndexType/MTLIndexTypeUInt16`` or ``MTLIndexType/MTLIndexTypeUInt32``.
///
/// Use an instance of ``MTLResidencySet`` to mark residency of the index buffer the `indexBuffer` parameter references.
///
/// - Parameters:
///   - primitiveType: A ``MTLPrimitiveType`` representing how the command interprets vertex argument data.
///   - indexCount: An integer that represents the number of vertices the command reads from `indexBuffer`.
///   - indexType: A ``MTLIndexType`` instance that represents the index format.
///   - indexBuffer: GPUAddress of a ``MTLBuffer`` instance that contains `indexCount` indices of `indexType` format.
///                  You are responsible for ensuring this address is aligned to 2 bytes if the `indexType` format is
///                  ``MTLIndexType/MTLIndexTypeUInt16``, and aligned to 4 bytes if the format is
///                  ``MTLIndexType/MTLIndexTypeUInt32``.
///   - indexBufferLength: An integer that represents the length of `indexBuffer`, in bytes. You are responsible for
///                     ensuring this this size is a multiple of 2 if the `indexType` format is ``MTLIndexType/MTLIndexTypeUInt16``,
///                     and a multiple of 4 if the format is ``MTLIndexType/MTLIndexTypeUInt32``.
///                     Metal disregards this value and assigns `0` to the `vertex_id` attribute for all primitives that
///                     require loading indices at a byte offset of `indexBufferLength` or greater.
///   - instanceCount: An integer that represents the number of times the command draws `primitiveType` with `indexCount`
///                    vertices.
    drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferLength_instanceCount_ :: (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: MTLGPUAddress, indexBufferLength: NSUInteger, instanceCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: MTLGPUAddress, indexBufferLength: NSUInteger, instanceCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferLength_instanceCount_, primitiveType, indexCount, indexType, indexBuffer, indexBufferLength, instanceCount);
    }

/// Encodes a draw command that renders multiple instances of a geometric primitive with indexed vertices,
/// starting with a custom vertex and instance.
///
/// Use this method to perform instanced indexed drawing, where an index buffer determines how Metal assembles primitives
/// whilst customizing the base vertex and base instance value Metal passes to the vertex shader function.
///
/// The command assigns each drawing instance a unique `instance_id` value that increases
/// from `baseInstance` through `(baseInstance + instanceCount - 1)`. Your shader can use this value
/// to identify which instance the vertex belongs to.
///
/// Metal imposes some restrictions on the index buffer's address, which needs to be 2- or 4-byte aligned, and its length
/// in bytes, which needs to be a multiple of 2 or 4, depending on whether the format of the index is
/// ``MTLIndexType/MTLIndexTypeUInt16`` or ``MTLIndexType/MTLIndexTypeUInt32``.
///
/// Use an instance of ``MTLResidencySet`` to mark residency of the index buffer the `indexBuffer` parameter references.
///
/// - Parameters:
///   - primitiveType: A ``MTLPrimitiveType`` representing how the command interprets vertex argument data.
///   - indexCount: An integer that represents the number of vertices the command reads from `indexBuffer`.
///   - indexType: A ``MTLIndexType`` instance that represents the index format.
///   - indexBuffer: GPUAddress of a ``MTLBuffer`` instance that contains `indexCount` indices of `indexType` format.
///                  You are responsible for ensuring this address is aligned to 2 bytes if the `indexType` format is
///                  ``MTLIndexType/MTLIndexTypeUInt16``, and aligned to 4 bytes if the format is
///                  ``MTLIndexType/MTLIndexTypeUInt32``.
///   - indexBufferLength: An integer that represents the length of `indexBuffer`, in bytes. You are responsible for
///                     ensuring this this size is a multiple of 2 if the `indexType` format is ``MTLIndexType/MTLIndexTypeUInt16``,
///                     and a multiple of 4 if the format is ``MTLIndexType/MTLIndexTypeUInt32``.
///                     If this draw call causes Metal to read indices at or beyond the `indexBufferLength`, Metal
///                     continues to execute them assigning a value of `0` to the `vertex_id` attribute.
///   - instanceCount: An integer that represents the number of times the command draws `primitiveType` with `indexCount`
///                    vertices.
///   - baseVertex: The lowest value the command passes to your vertex shader functions’s parameter with the `vertex_id`
///                 attribute. Metal disregards this value and assigns `0` to the `vertex_id` attribute for all
///                 primitives that require loading indices at a byte offset of `indexBufferLength` or greater.
///   - baseInstance: The lowest value the command passes to your vertex shader’s parameter with the `instance_id` attribute.
    drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferLength_instanceCount_baseVertex_baseInstance_ :: (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: MTLGPUAddress, indexBufferLength: NSUInteger, instanceCount: NSUInteger, baseVertex: NSInteger, baseInstance: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: MTLGPUAddress, indexBufferLength: NSUInteger, instanceCount: NSUInteger, baseVertex: NSInteger, baseInstance: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferLength_instanceCount_baseVertex_baseInstance_, primitiveType, indexCount, indexType, indexBuffer, indexBufferLength, instanceCount, baseVertex, baseInstance);
    }

/// Encodes a draw command that renders multiple instances of a geometric primitive with indirect arguments.
///
/// When you use this function, Metal reads the parameters to the draw command from an ``MTLBuffer`` instance,
/// allowing you to implement a GPU-driven workflow where a compute pipeline state determines the draw arguments.
///
/// You are responsible for ensuring that the address of the indirect buffer you provide to this method has 4-byte
/// alignment.
///
/// Because this is a non-indexed draw call, Metal interprets the contents of the indirect buffer to match the
/// layout of struct ``MTLDrawPrimitivesIndirectArguments``.
///
/// Use an instance of ``MTLResidencySet`` to mark residency of the indirect buffer that the `indirectBuffer` parameter
/// references.
///
/// - Parameters:
///   - primitiveType: A ``MTLPrimitiveType`` representing how the command interprets vertex argument data.
///   - indirectBuffer: GPUAddress of a ``MTLBuffer`` instance with data that matches the layout of the
///                     ``MTLDrawPrimitivesIndirectArguments`` structure. You are responsible for ensuring that the
///                     alignment of this address is 4 bytes.
    drawPrimitives_indirectBuffer_ :: (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, indirectBuffer: MTLGPUAddress) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, indirectBuffer: MTLGPUAddress) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawPrimitives_indirectBuffer_, primitiveType, indirectBuffer);
    }

/// Encodes a draw command that renders multiple instances of a geometric primitive with indexed vertices
/// and indirect arguments.
///
/// When you use this function, Metal reads the parameters to the draw command from an ``MTLBuffer`` instance,
/// allowing you to implement a GPU-driven workflow where a compute pipeline state determines the draw arguments.
///
/// Because this is an indexed draw call, Metal interprets the contents of the indirect buffer to match the
/// layout of struct ``MTLDrawIndexedPrimitivesIndirectArguments``, which includes `indexStart` and `indexCount`
/// members, denoting a range within the index buffer you provide in the `indexBuffer` parameter.
///
/// The range of indices within the `indexBuffer` form the primitives Metal draws.
///
/// Metal imposes some restrictions on the index buffer's address, which needs to be 2- or 4-byte aligned, and its length
/// in bytes, which needs to be a multiple of 2 or 4, depending on whether the format of the index is
/// ``MTLIndexType/MTLIndexTypeUInt16`` or ``MTLIndexType/MTLIndexTypeUInt32``.
///
/// Similarly, you are responsible for ensuring the indirect buffer's address has 4-byte alignment.
///
/// Use an instance of ``MTLResidencySet`` to mark residency of the indirect buffer that the `indirectBuffer` parameter
/// references, and of the index buffer the `indexBuffer` parameter references.
///
/// - Parameters:
///   - primitiveType: A ``MTLPrimitiveType`` representing how the command interprets vertex argument data.
///   - indexType: A ``MTLIndexType`` instance that represents the index format.
///   - indexBuffer: GPUAddress of a ``MTLBuffer`` instance that contains `indexCount` indices of `indexType` format.
///                  You are responsible for ensuring this address is aligned to 2 bytes if the `indexType` format is
///                  ``MTLIndexType/MTLIndexTypeUInt16``, and aligned to 4 bytes if the format is
///                  ``MTLIndexType/MTLIndexTypeUInt32``.
///   - indexBufferLength: An integer that represents the length of `indexBuffer`, in bytes. You are responsible for
///                     ensuring this this size is a multiple of 2 if the `indexType` format is ``MTLIndexType/MTLIndexTypeUInt16``,
///                     and a multiple of 4 if the format is ``MTLIndexType/MTLIndexTypeUInt32``.
///                     If this draw call causes Metal to read indices at or beyond the `indexBufferLength`, Metal
///                     continues to execute them assigning a value of `0` to the `vertex_id` attribute.
///   - indirectBuffer: GPUAddress of an ``MTLBuffer`` instance with data that matches the layout of the
///                     ``MTLDrawIndexedPrimitivesIndirectArguments`` structure. This address requires 4-byte alignment.
    drawIndexedPrimitives_indexType_indexBuffer_indexBufferLength_indirectBuffer_ :: (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, indexType: MTLIndexType, indexBuffer: MTLGPUAddress, indexBufferLength: NSUInteger, indirectBuffer: MTLGPUAddress) -> void {
        func: #type (obj: *void, selector: *void, primitiveType: MTLPrimitiveType, indexType: MTLIndexType, indexBuffer: MTLGPUAddress, indexBufferLength: NSUInteger, indirectBuffer: MTLGPUAddress) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawIndexedPrimitives_indexType_indexBuffer_indexBufferLength_indirectBuffer_, primitiveType, indexType, indexBuffer, indexBufferLength, indirectBuffer);
    }

/// Encodes a command that runs a range of commands from an indirect command buffer.
///
/// - Parameters:
///   - indirectCommandBuffer: A ``MTLIndirectCommandBuffer`` instance containing other commands that the current command runs.
///   - executionRange: A span of integers that represent the command entries in the buffer that the current command runs.
    executeCommandsInBuffer_withRange_ :: (self: *MTL4RenderCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, executionRange: NSRange) -> void {
        func: #type (obj: *void, selector: *void, indirectCommandBuffer: *MTLIndirectCommandBuffer, executionRange: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.executeCommandsInBuffer_withRange_, indirectCommandBuffer, executionRange);
    }

/// Encodes a command that runs an indirect range of commands from an indirect command buffer.
///
/// Use this method to indicate to Metal the span of indices in the command buffer to execute indirectly via an
/// ``MTLBuffer`` instance you provide in the `indirectRangeBuffer` parameter. This allows you to calculate the
/// span of commands Metal executes in the GPU timeline, enabling GPU-driven workflows.
///
/// Metal requires that the contents of this buffer match the layout of struct ``MTLIndirectCommandBufferExecutionRange``,
/// which specifies a location and a length within the indirect command buffer. You are responsible for ensuring the
/// address of this buffer has 4-byte alignment.
///
/// Use an instance of ``MTLResidencySet`` to mark residency of the indirect buffer that the `indirectRangeBuffer`
/// parameter references.
///
/// - Parameters:
///   - indirectCommandBuffer: A ``MTLIndirectCommandBuffer`` instance that contains other commands
///                            the current command runs.
///   - indirectRangeBuffer: GPUAddress of a ``MTLBuffer`` instance with data that matches the layout of the
///                          ``MTLIndirectCommandBufferExecutionRange`` structure. This address requires 4-byte alignment.
    executeCommandsInBuffer_indirectBuffer_ :: (self: *MTL4RenderCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, indirectRangeBuffer: MTLGPUAddress) -> void {
        func: #type (obj: *void, selector: *void, indirectCommandBuffer: *MTLIndirectCommandBuffer, indirectRangeBuffer: MTLGPUAddress) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.executeCommandsInBuffer_indirectBuffer_, indirectCommandBuffer, indirectRangeBuffer);
    }

/// Configures the size of a threadgroup memory buffer for a threadgroup argument in the object shader function.
///
/// - Parameters:
///   - length: The size of the threadgroup memory, in bytes.
///   - index: An integer that corresponds to the index of the argument you annotate with attribute `[[threadgroup(index)]]`
///   in the shader function.
    setObjectThreadgroupMemoryLength_atIndex_ :: (self: *MTL4RenderCommandEncoder, length: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, length: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setObjectThreadgroupMemoryLength_atIndex_, length, index);
    }

/// Encodes a draw command that invokes a mesh shader and, optionally, an object shader with a grid of threadgroups.
///
/// - Parameters:
///   - threadgroupsPerGrid: A ``MTLSize`` instance that represents the number of threadgroups for each grid dimension.
///   - threadsPerObjectThreadgroup: A ``MTLSize`` instance that represents the number of threads in an object
///                                  shader threadgroup, if applicable.
///   - threadsPerMeshThreadgroup: A ``MTLSize`` instance that represents the number of threads in a mesh shader
///                                threadgroup.
    drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_ :: (self: *MTL4RenderCommandEncoder, threadgroupsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, threadgroupsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_, threadgroupsPerGrid, threadsPerObjectThreadgroup, threadsPerMeshThreadgroup);
    }

/// Encodes a draw command that invokes a mesh shader and, optionally, an object shader with a grid of threads.
///
/// - Parameters:
///   - threadsPerGrid: A ``MTLSize`` instance that represents the number of threads for each grid dimension.
///                     For mesh shaders, the command rounds the value down to the nearest multiple of
///                     `threadsPerMeshThreadgroup` for each dimension. For object shaders, the value doesn’t
///                     need to be a multiple of `threadsPerObjectThreadgroup`.
///   - threadsPerObjectThreadgroup: A ``MTLSize`` instance that represents the number of threads in an object
///                                  shader threadgroup, if applicable.
///   - threadsPerMeshThreadgroup: A ``MTLSize`` instance that represents the number of threads in a mesh shader
///                                threadgroup.
    drawMeshThreads_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_ :: (self: *MTL4RenderCommandEncoder, threadsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, threadsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawMeshThreads_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_, threadsPerGrid, threadsPerObjectThreadgroup, threadsPerMeshThreadgroup);
    }

/// Encodes a draw command that invokes a mesh shader and, optionally, an object shader with indirect arguments.
///
/// This method enables you to determine the number of threadgroups per grid indirectly, in the GPU timeline.
/// Metal expects this buffer's contents to match the layout of structure ``MTLDispatchThreadgroupsIndirectArguments``.
/// You are responsible for ensuring the address of this buffer has 4-byte alignment.
///
/// Use an instance of ``MTLResidencySet`` to mark residency of the indirect buffer that the `indirectBuffer` parameter
/// references.
///
/// - Parameters:
///   - indirectBuffer: GPUAddress of an ``MTLBuffer`` instance with data that matches the layout of the
///                     ``MTLDispatchThreadgroupsIndirectArguments`` structure. This address requires 4-byte alignment.
///   - threadsPerObjectThreadgroup: A ``MTLSize`` instance that represents the number of threads in an object
///                                  shader threadgroup, if applicable.
///   - threadsPerMeshThreadgroup: A ``MTLSize`` instance that represents the number of threads in a mesh shader
///                                threadgroup.
    drawMeshThreadgroupsWithIndirectBuffer_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_ :: (self: *MTL4RenderCommandEncoder, indirectBuffer: MTLGPUAddress, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, indirectBuffer: MTLGPUAddress, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawMeshThreadgroupsWithIndirectBuffer_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_, indirectBuffer, threadsPerObjectThreadgroup, threadsPerMeshThreadgroup);
    }

/// Encodes a command that invokes a tile shader function from the encoder’s current tile render pipeline state.
///
/// - Parameter threadsPerTile: A ``MTLSize`` instance that represents the number of threads the render pass uses per tile.
///                             Set the size’s ``MTLSize/width`` and ``MTLSize/height`` properties to values that are less
///                             than or equal to ``tileWidth`` and ``tileHeight``, respectively. Some GPU families
///                             only support square tile dispatches and require the same value for width and height.
///                             Set ``MTLSize/depth`` to `1`.
    dispatchThreadsPerTile_ :: (self: *MTL4RenderCommandEncoder, threadsPerTile: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, threadsPerTile: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dispatchThreadsPerTile_, threadsPerTile);
    }

/// Configures the size of a threadgroup memory buffer for a threadgroup argument in the fragment and tile shader functions.
///
/// - Parameters:
///   - length: The size of the threadgroup memory, in bytes.
///   - offset: An integer that represents the location, in bytes, from the start of the threadgroup memory buffer
///             at `index` where the threadgroup memory begins.
///   - index: An integer that corresponds to the index of the argument you annotate with attribute `[[threadgroup(index)]]`
///   in the shader function.
    setThreadgroupMemoryLength_offset_atIndex_ :: (self: *MTL4RenderCommandEncoder, length: NSUInteger, offset: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, length: NSUInteger, offset: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setThreadgroupMemoryLength_offset_atIndex_, length, offset, index);
    }

/// Associates an argument table with a set of render stages.
///
/// Metal takes a snapshot of the resources in the argument table when you encode a draw, dispatch, or execute command.
/// This snapshot becomes available to the `stages` you specify to this method.
///
/// - Parameters:
///   - argumentTable: ``MTL4ArgumentTable`` to set.
///   - stages: A ``MTLRenderStages`` bitmask that specifies the shader stages with visibility over the table.
    setArgumentTable_atStages_ :: (self: *MTL4RenderCommandEncoder, argumentTable: *MTL4ArgumentTable, stages: MTLRenderStages) -> void {
        func: #type (obj: *void, selector: *void, argumentTable: *MTL4ArgumentTable, stages: MTLRenderStages) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setArgumentTable_atStages_, argumentTable, stages);
    }

/// Configures the vertex winding order that determines which face of a geometric primitive is the front one.
///
/// - Parameter frontFacingWinding: A ``MTLWinding`` value that determines which side of a primitive the render pipeline
///                                 interprets as front facing.
    setFrontFacingWinding_ :: (self: *MTL4RenderCommandEncoder, frontFacingWinding: MTLWinding) -> void {
        func: #type (obj: *void, selector: *void, frontFacingWinding: MTLWinding) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setFrontFacingWinding_, frontFacingWinding);
    }

/// Writes a GPU timestamp into the given ``MTL4CounterHeap`` at `index` after `stage` completes.
///
/// This command only guarantees all draws prior to this command are complete when Metal writes the timestamp into
/// the counter heap you provide in the `counterHeap` parameter. The timestamp may also include subsequent operations.
///
/// If you call this method before any draw calls, Metal writes a timestamp before the stage you specify in the
///  `stage` parameter begins.
///
/// - Parameters:
///   - granularity: a ``MTL4TimestampGranularity`` hint.
///   - stage: ``MTLRenderStages`` that need to complete before Metal writes the timestamp. This may also include later
///                 stages that are related, for example ``MTLRenderStages/MTLRenderStageMesh`` may include
///                 ``MTLRenderStages/MTLRenderStageVertex``.
///   - counterHeap: ``MTL4CounterHeap`` into which Metal writes timestamps.
///   - index: The index value into which Metal writes this timestamp.
    writeTimestampWithGranularity_afterStage_intoHeap_atIndex_ :: (self: *MTL4RenderCommandEncoder, granularity: MTL4TimestampGranularity, stage: MTLRenderStages, counterHeap: *MTL4CounterHeap, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, granularity: MTL4TimestampGranularity, stage: MTLRenderStages, counterHeap: *MTL4CounterHeap, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.writeTimestampWithGranularity_afterStage_intoHeap_atIndex_, granularity, stage, counterHeap, index);
    }

/// Sets the width of a tile for this render pass.
    tileWidth :: (self: *MTL4RenderCommandEncoder) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileWidth);
    }

/// Sets the height of a tile for this render pass.
    tileHeight :: (self: *MTL4RenderCommandEncoder) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tileHeight);
    }

}

/// Records a sequence of GPU commands.
MTL4CommandBuffer :: struct #type_info_no_size_complaint {
/// Prepares a command buffer for encoding.
///
/// Attaches the command buffer to the specified ``MTL4CommandAllocator`` and declares that the
/// application is ready to encode commands into the command buffer.
///
/// Command allocators only service a single command buffer at a time. If you need to issue multiple
/// calls to this method simultaneously, for example, in a multi-threaded command encoding scenario,
/// create multiple instances of ``MTLCommandAllocator`` and use one for each call.
///
/// You can safely reuse command allocators after ending the command buffer using it by calling
/// ``endCommandBuffer``.
///
/// After calling this method, any prior calls to ``useResidencySet:`` and ``useResidencySets:count:``
/// on this command buffer instance no longer apply. Make sure to call these methods again to signal
/// your residency requirements to Metal.
///
/// - Parameter allocator: ``MTL4CommandAllocator`` to attach to.
    beginCommandBufferWithAllocator_ :: (self: *MTL4CommandBuffer, allocator: *MTL4CommandAllocator) -> void {
        func: #type (obj: *void, selector: *void, allocator: *MTL4CommandAllocator) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.beginCommandBufferWithAllocator_, allocator);
    }

/// Prepares a command buffer for encoding with additional options.
///
/// Attaches the command buffer to the specified ``MTL4CommandAllocator`` and declares that the
/// application is ready to encode commands into the command buffer.
///
/// Command allocators only service a single command buffer at a time. If you need to issue multiple
/// calls to this method simultaneously, for example, in a multi-threaded command encoding scenario,
/// create multiple instances of ``MTLCommandAllocator`` and use one for each call.
///
/// You can safely reuse command allocators after ending the command buffer using it by calling
/// ``endCommandBuffer``.
///
/// After calling this method, any prior calls to ``useResidencySet:`` and ``useResidencySets:count:``
/// on this command buffer instance no longer apply. Make sure to call these methods again to signal
/// your residency requirements to Metal.
///
/// The options you provide configure the command buffer only until the command buffer ends, in the
/// next call to ``endCommandBuffer``.
///
/// - Parameters:
///   - allocator: ``MTL4CommandAllocator`` to attach to.
///   - options: ``MTL4CommandBufferOptions`` to configure the command buffer.
    beginCommandBufferWithAllocator_options_ :: (self: *MTL4CommandBuffer, allocator: *MTL4CommandAllocator, options: *MTL4CommandBufferOptions) -> void {
        func: #type (obj: *void, selector: *void, allocator: *MTL4CommandAllocator, options: *MTL4CommandBufferOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.beginCommandBufferWithAllocator_options_, allocator, options);
    }

/// Closes a command buffer to prepare it for submission to a command queue.
///
/// Explicitly ending the command buffer allows you to reuse the ``MTL4CommandAllocator`` to start servicing other
/// command buffers. It is an error to call ``commit`` on a command buffer previously recording before calling this
/// method.
    endCommandBuffer :: (self: *MTL4CommandBuffer) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.endCommandBuffer);
    }

/// Creates a render command encoder from a render pass descriptor.
///
/// - Parameters:
///   - descriptor: Descriptor for the render pass.
/// - Returns: The created ``MTL4RenderCommandEncoder`` instance, or `nil` if the function failed.
    renderCommandEncoderWithDescriptor_ :: (self: *MTL4CommandBuffer, descriptor: *MTL4RenderPassDescriptor) -> *MTL4RenderCommandEncoder {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4RenderPassDescriptor) -> *MTL4RenderCommandEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.renderCommandEncoderWithDescriptor_, descriptor);
    }

/// Creates a render command encoder from a render pass descriptor with additional options.
///
/// This method creates a render command encoder to encode a render pass, whilst providing you the option to define
/// some render pass characteristics via an instance of ``MTL4RenderEncoderOptions``.
///
/// Use these options to configure suspending/resuming render command encoders, which allow you to encode render passes
/// from multiple threads simultaneously.
///
/// - Parameters:
///   - descriptor: Descriptor for the render pass.
///   - options: ``MTL4RenderEncoderOptions`` instance that provide render pass options.
/// - Returns: The created ``MTL4RenderCommandEncoder`` instance, or `nil` if the function fails.
    renderCommandEncoderWithDescriptor_options_ :: (self: *MTL4CommandBuffer, descriptor: *MTL4RenderPassDescriptor, options: MTL4RenderEncoderOptions) -> *MTL4RenderCommandEncoder {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4RenderPassDescriptor, options: MTL4RenderEncoderOptions) -> *MTL4RenderCommandEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.renderCommandEncoderWithDescriptor_options_, descriptor, options);
    }

/// Creates a compute command encoder.
///
/// - Returns: The created ``MTL4ComputeCommandEncoder`` instance, or `nil` if the function fails.
    computeCommandEncoder :: (self: *MTL4CommandBuffer) -> *MTL4ComputeCommandEncoder {
        func: #type (obj: *void, selector: *void) -> *MTL4ComputeCommandEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.computeCommandEncoder);
    }

/// Creates a machine learning command encoder.
///
/// - Returns: The created ``MTL4MachineLearningCommandEncoder`` instance , or `nil` if the function fails.
    machineLearningCommandEncoder :: (self: *MTL4CommandBuffer) -> *MTL4MachineLearningCommandEncoder {
        func: #type (obj: *void, selector: *void) -> *MTL4MachineLearningCommandEncoder #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.machineLearningCommandEncoder);
    }

/// Marks a residency set as part of the command buffer's execution.
///
/// Ensures that Metal makes resident the resources that residency set contains during execution of this command buffer.
///
/// - Parameter residencySet: ``MTLResidencySet`` instance to mark resident.
    useResidencySet_ :: (self: *MTL4CommandBuffer, residencySet: *MTLResidencySet) -> void {
        func: #type (obj: *void, selector: *void, residencySet: *MTLResidencySet) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useResidencySet_, residencySet);
    }

/// Marks an array of residency sets as part of the command buffer's execution.
///
/// Ensures that Metal makes resident the resources that residency sets contain during execution of this command buffer.
///
/// - Parameters:
///   - residencySets: Array of ``MTLResidencySet`` instances to mark resident.
///   - count: Number of ``MTLResidencySet`` instances in the array.
    useResidencySets_count_ :: (self: *MTL4CommandBuffer, residencySets: **MTLResidencySet, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, residencySets: **MTLResidencySet, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useResidencySets_count_, residencySets, count);
    }

/// Pushes a string onto a stack of debug groups for this command buffer.
///
/// - Parameter string: The string to push.
    pushDebugGroup_ :: (self: *MTL4CommandBuffer, str: *NSString) -> void {
        func: #type (obj: *void, selector: *void, str: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pushDebugGroup_, str);
    }

/// Pops the latest string from the stack of debug groups for this command buffer.
    popDebugGroup :: (self: *MTL4CommandBuffer) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.popDebugGroup);
    }

/// Writes a GPU timestamp into the given counter heap.
///
/// This method captures a timestamp after work prior to this command in the command buffer is complete.
/// Work after this call may or may not have started.
///
/// You are responsible for ensuring the `counterHeap` is of type ``MTL4CounterHeapType/MTL4CounterHeapTypeTimestamp``.
///
/// - Parameters:
///   - counterHeap: ``MTL4CounterHeap`` to write the timestamp into.
///   - index: The index within the ``MTL4CounterHeap`` that Metal writes the timestamp to.
    writeTimestampIntoHeap_atIndex_ :: (self: *MTL4CommandBuffer, counterHeap: *MTL4CounterHeap, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, counterHeap: *MTL4CounterHeap, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.writeTimestampIntoHeap_atIndex_, counterHeap, index);
    }

/// Encodes a command that resolves an opaque counter heap into a buffer.
///
/// The command this method encodes converts the data within `counterHeap` into a common format
/// and stores it into the `bufferRange` parameter.
///
/// The command places each entry in the counter heap within `range` sequentially, starting at `alignedOffset`.
/// Each entry needs to be a fixed size that you can query by calling the
/// ``MTLDevice/sizeOfCounterHeapEntry:`` method.
///
/// This command runs during the `MTLStageBlit` stage of the GPU timeline. Barrier against this stage
/// to ensure the data is present in the resolve buffer parameter before you access it.
///
/// - Note: Your app needs ensure the GPU places data in the heap before you resolve it by
/// synchronizing this stage with other GPU operations.
///
/// Similarly, your app needs to synchronize any GPU accesses to `bufferRange` after
/// the command completes with barrier.
///
/// If your app needs to access `bufferRange` from the CPU, signal an ``MTLSharedEvent``
/// to notify the CPU when it's ready.
/// Alternatively, you can resolve the heap's data from the CPU by calling
/// the heap's ``MTL4CounterHeap/resolveCounterRange:`` method.
///
/// - Parameters:
///   - counterHeap: A heap the command resolves.
///   - range: A range of index values within the heap the command resolves.
///   - bufferRange: The buffer the command saves the data it resolves into.
///   - fenceToWait: A fence the GPU waits for before starting, if applicable; otherwise `nil`.
///   - fenceToUpdate: A fence the system updates after the command finishes resolving the data; otherwise `nil`.
    resolveCounterHeap_withRange_intoBuffer_waitFence_updateFence_ :: (self: *MTL4CommandBuffer, counterHeap: *MTL4CounterHeap, range: NSRange, bufferRange: MTL4BufferRange, fenceToWait: *MTLFence, fenceToUpdate: *MTLFence) -> void {
        func: #type (obj: *void, selector: *void, counterHeap: *MTL4CounterHeap, range: NSRange, bufferRange: MTL4BufferRange, fenceToWait: *MTLFence, fenceToUpdate: *MTLFence) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resolveCounterHeap_withRange_intoBuffer_waitFence_updateFence_, counterHeap, range, bufferRange, fenceToWait, fenceToUpdate);
    }

/// Returns the GPU device that this command buffer belongs to.
    device :: (self: *MTL4CommandBuffer) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

/// Assigns an optional label with this command buffer.
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
/*!
 @property device
 @abstract The device this event can be used with. Will be nil when the event is shared across devices (i.e. MTLSharedEvent).
 */
    device :: (self: *MTLEvent) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

/*!
 @property label
 @abstract A string to help identify this object.
 */
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
// When the event's signaled value reaches value or higher, invoke the block on the dispatch queue owned by the listener.
    notifyListener_atValue_block_ :: (self: *MTLSharedEvent, listener: *MTLSharedEventListener, value: u64, block: MTLSharedEventNotificationBlock) -> void {
        func: #type (obj: *void, selector: *void, listener: *MTLSharedEventListener, value: u64, block: MTLSharedEventNotificationBlock) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.notifyListener_atValue_block_, listener, value, block);
    }

// Convenience method for creating a shared event handle that may be passed to other processes via XPC.
    newSharedEventHandle :: (self: *MTLSharedEvent) -> *MTLSharedEventHandle {
        func: #type (obj: *void, selector: *void) -> *MTLSharedEventHandle #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newSharedEventHandle);
    }

// Synchronously wait for the signaledValue to be greater than or equal to 'value', with a timeout
// specified in milliseconds.   Returns YES if the value was signaled before the timeout, otherwise NO.
    waitUntilSignaledValue_timeoutMS_ :: (self: *MTLSharedEvent, value: u64, milliseconds: u64) -> BOOL {
        func: #type (obj: *void, selector: *void, value: u64, milliseconds: u64) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.waitUntilSignaledValue_timeoutMS_, value, milliseconds);
    }

// Read or set signaled value
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

/// Describes an object containing debug information from Metal to your app after completing a workload.
MTL4CommitFeedback :: struct #type_info_no_size_complaint {
/// A description of an error when the GPU encounters an issue as it runs the committed command buffers.
    error :: (self: *MTL4CommitFeedback) -> *NSError {
        func: #type (obj: *void, selector: *void) -> *NSError #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.error);
    }

/// The host time, in seconds, when the GPU starts execution of the committed command buffers.
    GPUStartTime :: (self: *MTL4CommitFeedback) -> CFTimeInterval {
        func: #type (obj: *void, selector: *void) -> CFTimeInterval #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.GPUStartTime);
    }

/// The host time, in seconds, when the GPU finishes execution of the committed command buffers.
    GPUEndTime :: (self: *MTL4CommitFeedback) -> CFTimeInterval {
        func: #type (obj: *void, selector: *void) -> CFTimeInterval #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.GPUEndTime);
    }

}

/// An abstraction representing a command queue that you use commit and synchronize command buffers and to
/// perform other GPU operations.
MTL4CommandQueue :: struct #type_info_no_size_complaint {
/// Enqueues an array of command buffers for execution.
///
/// The order in which you sort the command buffers in the array is meaningful, especially when it contains suspending/resuming
/// render passes. A suspending/resuming render pass is a render pass you create by calling
/// ``MTL4CommandBuffer/renderCommandEncoderWithDescriptor:options:``,
/// and provide `MTL4RenderEncoderOptionSuspending` or `MTL4RenderEncoderOptionResuming` for the `options` parameter.
///
/// If your command buffers contain suspend/resume render passes, ensure that the first command buffer only suspends,
/// and the last one only resumes. Additionally, make sure that all intermediate command buffers are both suspending
/// and resuming.
///
/// - Parameters:
///   - commandBuffers: an array of ``MTL4CommandBuffer``.
///   - count: the number of ``MTL4CommandBuffer`` instances in the `commandBuffers` array.
    commit_count_ :: (self: *MTL4CommandQueue, commandBuffers: **MTL4CommandBuffer, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, commandBuffers: **MTL4CommandBuffer, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.commit_count_, commandBuffers, count);
    }

/// Enqueues an array of command buffer instances for execution with a set of options.
///
/// Provide an ``MTL4CommitOptions`` instance to configure the commit operation.
///
/// The order in which you sort the command buffers in the array is meaningful, especially when it contains suspending/resuming
/// render passes. A suspending/resuming render pass is a render pass you create by calling
/// ``MTL4CommandBuffer/renderCommandEncoderWithDescriptor:options:``,
/// and provide `MTL4RenderEncoderOptionSuspending` or `MTL4RenderEncoderOptionResuming` for the `options` parameter.
///
/// If your command buffers contain suspend/resume render passes, ensure that the first command buffer only suspends,
/// and the last one only resumes. Additionally, make sure that all intermediate command buffers are both suspending
/// and resuming.
///
/// When you commit work from multiple threads, modifying and reusing the same options instance,
/// you are responsible for externally synchronizing access to it.
///
/// - Parameters:
///   - commandBuffers: an array of ``MTL4CommandBuffer``.
///   - count: the number of ``MTL4CommandBuffer`` instances in the `commandBuffers` array.
///   - options: an instance of ``MTL4CommitOptions`` that configures the commit operation.
    commit_count_options_ :: (self: *MTL4CommandQueue, commandBuffers: **MTL4CommandBuffer, count: NSUInteger, options: *MTL4CommitOptions) -> void {
        func: #type (obj: *void, selector: *void, commandBuffers: **MTL4CommandBuffer, count: NSUInteger, options: *MTL4CommitOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.commit_count_options_, commandBuffers, count, options);
    }

/// Schedules an operation to signal a GPU event with a specific value after all GPU work prior to this point is complete.
///
/// - Parameters:
///   - event: ``MTLEvent`` to signal.
///   - value: the value to signal the ``MTLEvent`` with.
    signalEvent_value_ :: (self: *MTL4CommandQueue, event: *MTLEvent, value: u64) -> void {
        func: #type (obj: *void, selector: *void, event: *MTLEvent, value: u64) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.signalEvent_value_, event, value);
    }

/// Schedules an operation to wait for a GPU event of a specific value before continuing to execute any future GPU work.
///
/// - Parameters:
///   - event: ``MTLEvent`` to wait on.
///   - value: the specific value to wait for.
    waitForEvent_value_ :: (self: *MTL4CommandQueue, event: *MTLEvent, value: u64) -> void {
        func: #type (obj: *void, selector: *void, event: *MTLEvent, value: u64) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.waitForEvent_value_, event, value);
    }

/// Schedules a signal operation on the command queue to indicate when rendering to a Metal drawable is complete.
///
/// Signaling when rendering to a ``MTLDrawable`` instance is complete indicates that it's safe to present it to the
/// display.
///
/// You are responsible for calling this method after committing all command buffers that contain commands targeting
/// this drawable, and before calling ``MTLDrawable/present``, ``MTLDrawable/presentAtTime:``, or
/// ``MTLDrawable/presentAfterMinimumDuration:``.
///
/// - Note: This method doesn't trigger the presentation of the drawable, and fails if you call it after any of the
/// present methods, or if you call it multiple times.
///
/// Metal doesn't guarantee that command buffers you commit to the command queue after calling this method execute
/// before presentation.
///
/// - Parameters:
///   - drawable: ``MTLDrawable`` instance to signal.
    signalDrawable_ :: (self: *MTL4CommandQueue, drawable: *MTLDrawable) -> void {
        func: #type (obj: *void, selector: *void, drawable: *MTLDrawable) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.signalDrawable_, drawable);
    }

/// Schedules a wait operation on the command queue to ensure the display is no longer using a specific Metal drawable.
///
/// Use this method to ensure the display is no longer using a ``MTLDrawable`` instance before executing any subsequent
/// commands.
///
/// This method returns immediately and doesn't perform any synchronization on the current thread. You are responsible
/// for calling this method before committing any command buffers containing commands that target this drawable.
///
/// Call this method multiple times if you commit your command buffers to multiple command queues.
///
/// - Parameters:
///   - drawable: ``MTLDrawable`` instance to signal.
    waitForDrawable_ :: (self: *MTL4CommandQueue, drawable: *MTLDrawable) -> void {
        func: #type (obj: *void, selector: *void, drawable: *MTLDrawable) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.waitForDrawable_, drawable);
    }

/// Marks a residency set as part of this command queue.
///
/// Ensures that Metal makes the residency set resident during the execution of all command buffers you commit to this
/// command queue.
///
/// Each command queue supports up to 32 unique residency set instances.
///
/// - Parameter residencySet: ``MTLResidencySet`` to add to the command queue.
    addResidencySet_ :: (self: *MTL4CommandQueue, residencySet: *MTLResidencySet) -> void {
        func: #type (obj: *void, selector: *void, residencySet: *MTLResidencySet) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addResidencySet_, residencySet);
    }

/// Marks an array of residency sets as part of this command queue.
///
/// Ensures that Metal makes the residency set resident during the execution of all command buffers you commit to this
/// command queue.
///
/// Each command queue supports up to 32 unique residency set instances.
///
/// - Parameters:
///   - residencySets: Array of ``MTLResidencySet`` instances to add to the command queue.
///   - count: Number of ``MTLResidencySet`` instances in the array.
    addResidencySets_count_ :: (self: *MTL4CommandQueue, residencySets: **MTLResidencySet, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, residencySets: **MTLResidencySet, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addResidencySets_count_, residencySets, count);
    }

/// Removes a residency set from the command queue.
///
/// After calling this method ensures only the remaining residency sets remain resident during the execution of the
/// command buffers you commit this command queue.
///
/// - Parameter residencySet: ``MTLResidencySet`` instance to remove from the command queue.
    removeResidencySet_ :: (self: *MTL4CommandQueue, residencySet: *MTLResidencySet) -> void {
        func: #type (obj: *void, selector: *void, residencySet: *MTLResidencySet) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.removeResidencySet_, residencySet);
    }

/// Removes multiple residency sets from the command queue.
///
/// After calling this method ensures only the remaining residency sets remain resident during the execution of the
/// command buffers you commit this command queue.
///
/// - Parameters:
///   - residencySets: Array of ``MTLResidencySet`` instances to remove from the command queue.
///   - count: Number of ``MTLResidencySet`` instances in the array.
    removeResidencySets_count_ :: (self: *MTL4CommandQueue, residencySets: **MTLResidencySet, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, residencySets: **MTLResidencySet, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.removeResidencySets_count_, residencySets, count);
    }

/// Updates multiple regions within a placement sparse texture to alias specific tiles of a Metal heap.
///
/// You can provide a `nil` parameter to the `heap` argument only if when you perform unmap operations. Otherwise, you are
/// responsible for ensuring the heap is non-nil and has a
/// ``MTLHeapDescriptor/maxCompatiblePlacementSparsePageSize`` of at least the texture's
/// ``MTLTextureDescriptor/placementSparsePageSize``.
///
/// When performing a sparse mapping update, you are responsible for issuing a barrier against stage `MTLStageResourceState`.
///
/// You can determine the sparse texture tier by calling `MTLTexture/sparseTextureTier`.
///
/// - Parameters:
///   - texture: A placement sparse ``MTLTexture``.
///   - heap: ``MTLHeap`` you allocate with type ``MTLHeapType/MTLHeapTypePlacement``.
///   - operations: An array of ``MTL4UpdateSparseTextureMappingOperation`` instances to perform.
///   - count: Number of operations to perform.
    updateTextureMappings_heap_operations_count_ :: (self: *MTL4CommandQueue, texture: *MTLTexture, heap: *MTLHeap, operations: *MTL4UpdateSparseTextureMappingOperation, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, heap: *MTLHeap, operations: *MTL4UpdateSparseTextureMappingOperation, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.updateTextureMappings_heap_operations_count_, texture, heap, operations, count);
    }

/// Copies multiple regions within a source placement sparse texture to a destination placement sparse texture.
///
/// You are responsible for ensuring the source and destination textures have the same
/// ``MTLTextureDescriptor/placementSparsePageSize``.
///
/// Additionally, you are responsible for ensuring that the source and destination textures don't use the same aliased tiles
/// at the same time.
///
/// - Note: If a sparse texture and a sparse buffer share the same backing tiles, these don't provide you
/// you with meaningful views of the other resource’s data.
///
/// - Parameters:
///   - sourceTexture: The source placement sparse ``MTLTexture``.
///   - destinationTexture: The destination placement sparse ``MTLTexture``.
///   - operations: An array of ``MTL4CopySparseTextureMappingOperation`` instances to perform.
///   - count: Number of operations to perform.
    copyTextureMappingsFromTexture_toTexture_operations_count_ :: (self: *MTL4CommandQueue, sourceTexture: *MTLTexture, destinationTexture: *MTLTexture, operations: *MTL4CopySparseTextureMappingOperation, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sourceTexture: *MTLTexture, destinationTexture: *MTLTexture, operations: *MTL4CopySparseTextureMappingOperation, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyTextureMappingsFromTexture_toTexture_operations_count_, sourceTexture, destinationTexture, operations, count);
    }

/// Updates multiple regions within a placement sparse buffer to alias specific tiles from a Metal heap.
///
/// You can provide a `nil` parameter to the `heap` argument only when you perform unmap operations. Otherwise, you are
/// responsible for ensuring parameter `heap` references an ``MTLHeap`` that has a ``MTLHeapDescriptor/maxCompatiblePlacementSparsePageSize``
/// of at least the buffer's `placementSparsePageSize` you assign when creating the sparse buffer via
/// ``MTLDevice/newBufferWithLength:options:placementSparsePageSize:``.
///
/// - Parameters:
///   - buffer: A placement sparse ``MTLBuffer``.
///   - heap: An ``MTLHeap`` you allocate with type ``MTLHeapType/MTLHeapTypePlacement``.
///   - operations: An array of ``MTL4UpdateSparseBufferMappingOperation`` instances to perform.
///   - count: Number of operations to perform.
    updateBufferMappings_heap_operations_count_ :: (self: *MTL4CommandQueue, buffer: *MTLBuffer, heap: *MTLHeap, operations: *MTL4UpdateSparseBufferMappingOperation, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, heap: *MTLHeap, operations: *MTL4UpdateSparseBufferMappingOperation, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.updateBufferMappings_heap_operations_count_, buffer, heap, operations, count);
    }

/// Copies multiple offsets within a source placement sparse buffer to a destination placement sparse buffer.
///
/// You are responsible for ensuring the source destination sparse buffers have the same `placementSparsePageSize` when
/// you create them via ``MTLDevice/newBufferWithLength:options:placementSparsePageSize:``.
///
/// Additionally, you are responsible for ensuring both the source and destination sparse buffers don't use the same aliased
/// tiles at the same time.
///
/// - Note: If a sparse texture and a sparse buffer share the same backing tiles, these don't provide you
///         with meaningful views of the other resource’s data.
///
/// - Parameters:
///   - sourceBuffer: The source placement sparse ``MTLBuffer``.
///   - destinationBuffer: The destination placement sparse ``MTLBuffer``.
///   - operations: An array of ``MTL4CopySparseBufferMappingOperation`` instances to perform.
///   - count: Number of operations to perform.
    copyBufferMappingsFromBuffer_toBuffer_operations_count_ :: (self: *MTL4CommandQueue, sourceBuffer: *MTLBuffer, destinationBuffer: *MTLBuffer, operations: *MTL4CopySparseBufferMappingOperation, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sourceBuffer: *MTLBuffer, destinationBuffer: *MTLBuffer, operations: *MTL4CopySparseBufferMappingOperation, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyBufferMappingsFromBuffer_toBuffer_operations_count_, sourceBuffer, destinationBuffer, operations, count);
    }

/// Returns the GPU device that the command queue belongs to.
    device :: (self: *MTL4CommandQueue) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

/// Obtains this queue's optional label for debugging purposes.
    label :: (self: *MTL4CommandQueue) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

}

MTLCaptureScope :: struct #type_info_no_size_complaint {
// Marks the begin of the capture scope. Note: This method should be invoked repeatedly per frame.
    beginScope :: (self: *MTLCaptureScope) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.beginScope);
    }

// Marks the end of the capture scope. Note: This method should be invoked repeatedly per frame.
    endScope :: (self: *MTLCaptureScope) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.endScope);
    }

/** Scope label
    @remarks Created capture scopes are listed in Xcode when long-pressing the capture button, performing the capture over the selected scope
  */
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

// Associated device: this scope will capture Metal commands from the associated device
    device :: (self: *MTLCaptureScope) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

/** If set, this scope will only capture Metal commands from the associated command queue. Defaults to nil (all command queues from the associated device are captured).
 */
    commandQueue :: (self: *MTLCaptureScope) -> *MTLCommandQueue {
        func: #type (obj: *void, selector: *void) -> *MTLCommandQueue #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.commandQueue);
    }

/** If set, this scope will only capture Metal commands from the associated Metal 4 command queue. Defaults to nil (all command queues from the associated device are captured).
 */
    mtl4CommandQueue :: (self: *MTLCaptureScope) -> *MTL4CommandQueue {
        func: #type (obj: *void, selector: *void) -> *MTL4CommandQueue #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.mtl4CommandQueue);
    }

}

/*
 @abstract
 Describes a CPU-recorded indirect render command
 */
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

/*!
  @brief
    sets vertex buffer at specified index with provided offset and stride.
    only call this when the buffer-index is part of the vertexDescriptor and
    has set its stride to `MTLBufferLayoutStrideDynamic`
*/
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

// MTLIndirectCommandTypeDrawMeshThreadgroups
    drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_ :: (self: *MTLIndirectRenderCommand, threadgroupsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, threadgroupsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_, threadgroupsPerGrid, threadsPerObjectThreadgroup, threadsPerMeshThreadgroup);
    }

// MTLIndirectCommandTypeDrawMeshThreads
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

/*!
  @brief
    sets kernel buffer at specified index with provided offset and stride.
    only call this when the buffer-index is part of the stageInputDescriptor
    and has set its stride to `MTLBufferLayoutStrideDynamic`
*/
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

/*!
 @property gpuResourceID
 @abstract Handle of the GPU resource suitable for storing in an Argument Buffer
 */
    gpuResourceID :: (self: *MTLIndirectCommandBuffer) -> MTLResourceID {
        func: #type (obj: *void, selector: *void) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.gpuResourceID);
    }

}

MTLLogContainer :: struct #type_info_no_size_complaint {
}

MTLFunctionLogDebugLocation :: struct #type_info_no_size_complaint {
// faulting function
    functionName :: (self: *MTLFunctionLogDebugLocation) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionName);
    }

// source location
    URL :: (self: *MTLFunctionLogDebugLocation) -> *NSURL {
        func: #type (obj: *void, selector: *void) -> *NSURL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.URL);
    }

// line number
    line :: (self: *MTLFunctionLogDebugLocation) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.line);
    }

// column in line
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
/*!
 * @brief Encode an acceleration structure build into the command buffer. All bottom-level acceleration
 * structure builds must have completed before a top-level acceleration structure build may begin. The
 * resulting acceleration structure will not retain any references to the input vertex buffer, instance buffer, etc.
 *
 * The acceleration structure build will not be completed until the command buffer has been committed
 * and finished executing. However, it is safe to encode ray tracing work against the acceleration
 * structure as long as the command buffers are scheduled and synchronized such that the command buffer
 * will have completed by the time the ray tracing starts.
 *
 * The acceleration structure and scratch buffer must be at least the size returned by the
 * [MTLDevice accelerationStructureSizesWithDescriptor:] query.
 *
 * @param accelerationStructure Acceleration structure storage to build into
 * @param descriptor            Object describing the acceleration structure to build
 * @param scratchBuffer         Scratch buffer to use while building the acceleration structure. The
 *                              contents may be overwritten and are undefined after the build has
 *                              started/completed.
 * @param scratchBufferOffset   Offset into the scratch buffer
 */
    buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset_ :: (self: *MTLAccelerationStructureCommandEncoder, accelerationStructure: *MTLAccelerationStructure, descriptor: *MTLAccelerationStructureDescriptor, scratchBuffer: *MTLBuffer, scratchBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, accelerationStructure: *MTLAccelerationStructure, descriptor: *MTLAccelerationStructureDescriptor, scratchBuffer: *MTLBuffer, scratchBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset_, accelerationStructure, descriptor, scratchBuffer, scratchBufferOffset);
    }

/*!
 * @brief Encode an acceleration structure refit into the command buffer. Refitting can be used to
 * update the acceleration structure when geometry changes and is much faster than rebuilding from
 * scratch. However, the quality of the acceleration structure and the subsequent ray tracing
 * performance will degrade depending on how much the geometry changes.
 * 
 * Refitting can not be used after certain changes, such as adding or removing geometry. Acceleration
 * structures can be refit in place by specifying the same source and destination acceleration structures
 * or by providing a nil destination acceleration structure. If the source and destination acceleration
 * structures are not the same, they must not overlap in memory.
 *
 * The destination acceleration structure must be at least as large as the source acceleration structure,
 * unless the source acceleration structure has been compacted, in which case the destination acceleration
 * structure must be at least as large as the compacted size of the source acceleration structure.
 *
 * The scratch buffer must be at least the size returned by the accelerationStructureSizesWithDescriptor
 * method of the MTLDevice.
 *
 * @param descriptor                       Object describing the acceleration structure to build
 * @param sourceAccelerationStructure      Acceleration structure to copy from
 * @param destinationAccelerationStructure Acceleration structure to copy to
 * @param scratchBuffer                    Scratch buffer to use while refitting the acceleration
 *                                         structure. The contents may be overwritten and are undefined
 *                                         after the refit has started/completed.
 * @param scratchBufferOffset              Offset into the scratch buffer.
 */
    refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_ :: (self: *MTLAccelerationStructureCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, descriptor: *MTLAccelerationStructureDescriptor, destinationAccelerationStructure: *MTLAccelerationStructure, scratchBuffer: *MTLBuffer, scratchBufferOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sourceAccelerationStructure: *MTLAccelerationStructure, descriptor: *MTLAccelerationStructureDescriptor, destinationAccelerationStructure: *MTLAccelerationStructure, scratchBuffer: *MTLBuffer, scratchBufferOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_, sourceAccelerationStructure, descriptor, destinationAccelerationStructure, scratchBuffer, scratchBufferOffset);
    }

/*!
 * @brief Encode an acceleration structure refit into the command buffer. Refitting can be used to
 * update the acceleration structure when geometry changes and is much faster than rebuilding from
 * scratch. However, the quality of the acceleration structure and the subsequent ray tracing
 * performance will degrade depending on how much the geometry changes.
 *
 * Refitting can not be used after certain changes, such as adding or removing geometry. Acceleration
 * structures can be refit in place by specifying the same source and destination acceleration structures
 * or by providing a nil destination acceleration structure. If the source and destination acceleration
 * structures are not the same, they must not overlap in memory.
 *
 * The destination acceleration structure must be at least as large as the source acceleration structure,
 * unless the source acceleration structure has been compacted, in which case the destination acceleration
 * structure must be at least as large as the compacted size of the source acceleration structure.
 *
 * The scratch buffer must be at least the size returned by the accelerationStructureSizesWithDescriptor
 * method of the MTLDevice.
 *
 * @param descriptor                       Object describing the acceleration structure to build
 * @param sourceAccelerationStructure      Acceleration structure to copy from
 * @param destinationAccelerationStructure Acceleration structure to copy to
 * @param scratchBuffer                    Scratch buffer to use while refitting the acceleration
 *                                         structure. The contents may be overwritten and are undefined
 *                                         after the refit has started/completed.
 * @param scratchBufferOffset              Offset into the scratch buffer.
 * @param options                          Options specifying the elements of the acceleration structure to refit.
 */
    refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options_ :: (self: *MTLAccelerationStructureCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, descriptor: *MTLAccelerationStructureDescriptor, destinationAccelerationStructure: *MTLAccelerationStructure, scratchBuffer: *MTLBuffer, scratchBufferOffset: NSUInteger, options: MTLAccelerationStructureRefitOptions) -> void {
        func: #type (obj: *void, selector: *void, sourceAccelerationStructure: *MTLAccelerationStructure, descriptor: *MTLAccelerationStructureDescriptor, destinationAccelerationStructure: *MTLAccelerationStructure, scratchBuffer: *MTLBuffer, scratchBufferOffset: NSUInteger, options: MTLAccelerationStructureRefitOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options_, sourceAccelerationStructure, descriptor, destinationAccelerationStructure, scratchBuffer, scratchBufferOffset, options);
    }

/*!
 * @brief Copy an acceleration structure. The source and destination acceleration structures must not
 * overlap in memory. If this is a top level acceleration structure, references to bottom level
 * acceleration structures will be preserved.
 *
 * The destination acceleration structure must be at least as large as the source acceleration structure,
 * unless the source acceleration structure has been compacted, in which case the destination acceleration
 * structure must be at least as large as the compacted size of the source acceleration structure.
 *
 * @param sourceAccelerationStructure      Acceleration structure to copy from
 * @param destinationAccelerationStructure Acceleration structure to copy to
 */
    copyAccelerationStructure_toAccelerationStructure_ :: (self: *MTLAccelerationStructureCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, destinationAccelerationStructure: *MTLAccelerationStructure) -> void {
        func: #type (obj: *void, selector: *void, sourceAccelerationStructure: *MTLAccelerationStructure, destinationAccelerationStructure: *MTLAccelerationStructure) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyAccelerationStructure_toAccelerationStructure_, sourceAccelerationStructure, destinationAccelerationStructure);
    }

/*!
 * @brief Compute the compacted size for an acceleration structure and write it into a buffer.
 *
 * This size is potentially smaller than the source acceleration structure. To perform compaction,
 * read this size from the buffer once the command buffer has completed and use it to allocate a
 * smaller acceleration structure. Then create another encoder and call the 
 * copyAndCompactAccelerationStructure method.
 *
 * @param accelerationStructure Source acceleration structure
 * @param buffer                Destination size buffer. The compacted size will be written as a 32 bit
 *                              unsigned integer representing the compacted size in bytes.
 * @param offset                Offset into the size buffer
 */
    writeCompactedAccelerationStructureSize_toBuffer_offset_ :: (self: *MTLAccelerationStructureCommandEncoder, accelerationStructure: *MTLAccelerationStructure, buffer: *MTLBuffer, offset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, accelerationStructure: *MTLAccelerationStructure, buffer: *MTLBuffer, offset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.writeCompactedAccelerationStructureSize_toBuffer_offset_, accelerationStructure, buffer, offset);
    }

/*!
 * @brief Compute the compacted size for an acceleration structure and write it into a buffer.
 *
 * This size is potentially smaller than the source acceleration structure. To perform compaction,
 * read this size from the buffer once the command buffer has completed and use it to allocate a
 * smaller acceleration structure. Then create another encoder and call the 
 * copyAndCompactAccelerationStructure method.
 *
 * @param accelerationStructure Source acceleration structure
 * @param buffer                Destination size buffer. The compacted size will be written as either
 *                              a 32 bit or 64 bit value depending on the sizeDataType argument
 *                              unsigned integer representing the compacted size in bytes.
 * @param offset                Offset into the size buffer
 * @param sizeDataType          Data type of the size to write into the buffer. Must be either
 *                              MTLDataTypeUInt (32 bit) or MTLDataTypeULong (64 bit)
 */
    writeCompactedAccelerationStructureSize_toBuffer_offset_sizeDataType_ :: (self: *MTLAccelerationStructureCommandEncoder, accelerationStructure: *MTLAccelerationStructure, buffer: *MTLBuffer, offset: NSUInteger, sizeDataType: MTLDataType) -> void {
        func: #type (obj: *void, selector: *void, accelerationStructure: *MTLAccelerationStructure, buffer: *MTLBuffer, offset: NSUInteger, sizeDataType: MTLDataType) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.writeCompactedAccelerationStructureSize_toBuffer_offset_sizeDataType_, accelerationStructure, buffer, offset, sizeDataType);
    }

/*!
 * @brief Copy and compact an acceleration structure. The source and destination acceleration structures
 * must not overlap in memory. If this is a top level acceleration structure, references to bottom level
 * acceleration structures will be preserved.
 *
 * The destination acceleration structure must be at least as large as the compacted size of the source
 * acceleration structure, which is computed by the writeCompactedAccelerationStructureSize method.
 *
 * @param sourceAccelerationStructure      Acceleration structure to copy and compact
 * @param destinationAccelerationStructure Acceleration structure to copy to
 */
    copyAndCompactAccelerationStructure_toAccelerationStructure_ :: (self: *MTLAccelerationStructureCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, destinationAccelerationStructure: *MTLAccelerationStructure) -> void {
        func: #type (obj: *void, selector: *void, sourceAccelerationStructure: *MTLAccelerationStructure, destinationAccelerationStructure: *MTLAccelerationStructure) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyAndCompactAccelerationStructure_toAccelerationStructure_, sourceAccelerationStructure, destinationAccelerationStructure);
    }

/*!
 @method updateFence:
 @abstract Update the fence to capture all GPU work so far enqueued by this encoder.
 @discussion The fence is updated at build submission to maintain global order and prevent deadlock.
 Drivers may delay fence updates until the end of the encoder. Drivers may also wait on fences at the beginning of an encoder. It is therefore illegal to wait on a fence after it has been updated in the same encoder.
 */
    updateFence_ :: (self: *MTLAccelerationStructureCommandEncoder, fence: *MTLFence) -> void {
        func: #type (obj: *void, selector: *void, fence: *MTLFence) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.updateFence_, fence);
    }

/*!
 @method waitForFence:
 @abstract Prevent further GPU work until the fence is reached.
 @discussion The fence is evaluated at build submission to maintain global order and prevent deadlock.
 Drivers may delay fence updates until the end of the encoder. Drivers may also wait on fences at the beginning of an encoder. It is therefore illegal to wait on a fence after it has been updated in the same encoder.
 */
    waitForFence_ :: (self: *MTLAccelerationStructureCommandEncoder, fence: *MTLFence) -> void {
        func: #type (obj: *void, selector: *void, fence: *MTLFence) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.waitForFence_, fence);
    }

/*!
 * @method useResource:usage:
 * @abstract Declare that a resource may be accessed by the command encoder through an argument buffer
 * 
 * @discussion For tracked MTLResources, this method protects against data hazards. This method must be called before encoding any acceleration structure commands which may access the resource through an argument buffer.
 * @warning Prior to iOS 13, macOS 10.15, this method does not protect against data hazards. If you are deploying to older versions of macOS or iOS, use fences to ensure data hazards are resolved.
 */
    useResource_usage_ :: (self: *MTLAccelerationStructureCommandEncoder, resource: *MTLResource, usage: MTLResourceUsage) -> void {
        func: #type (obj: *void, selector: *void, resource: *MTLResource, usage: MTLResourceUsage) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useResource_usage_, resource, usage);
    }

/*!
 * @method useResources:count:usage:
 * @abstract Declare that an array of resources may be accessed through an argument buffer by the command encoder
 * @discussion For tracked MTL Resources, this method protects against data hazards. This method must be called before encoding any acceleration structure commands which may access the resources through an argument buffer.
 * @warning Prior to iOS 13, macOS 10.15, this method does not protect against data hazards. If you are deploying to older versions of macOS or iOS, use fences to ensure data hazards are resolved.
 */
    useResources_count_usage_ :: (self: *MTLAccelerationStructureCommandEncoder, resources: **MTLResource, count: NSUInteger, usage: MTLResourceUsage) -> void {
        func: #type (obj: *void, selector: *void, resources: **MTLResource, count: NSUInteger, usage: MTLResourceUsage) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useResources_count_usage_, resources, count, usage);
    }

/*!
 * @method useHeap:
 * @abstract Declare that the resources allocated from a heap may be accessed as readonly by the encoder through an argument buffer
 * @discussion For tracked MTLHeaps, this method protects against data hazards. This method must be called before encoding any acceleration structure commands which may access the resources allocated from the heap through an argument buffer. This method may cause all of the color attachments allocated from the heap to become decompressed. Therefore, it is recommended that the useResource:usage: or useResources:count:usage: methods be used for color attachments instead, with a minimal (i.e. read-only) usage.
 * @warning Prior to iOS 13, macOS 10.15, this method does not protect against data hazards. If you are deploying to older versions of macOS or iOS, use fences to ensure data hazards are resolved.
 */
    useHeap_ :: (self: *MTLAccelerationStructureCommandEncoder, heap: *MTLHeap) -> void {
        func: #type (obj: *void, selector: *void, heap: *MTLHeap) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useHeap_, heap);
    }

/*!
 * @method useHeaps:count:
 * @abstract Declare that the resources allocated from an array of heaps may be accessed as readonly by the encoder through an argument buffer
 * @discussion For tracked MTLHeaps, this method protects against data hazards. This method must be called before encoding any acceleration structure commands which may access the resources allocated from the heaps through an argument buffer. This method may cause all of the color attachments allocated from the heaps to become decompressed. Therefore, it is recommended that the useResource:usage: or useResources:count:usage: methods be used for color attachments instead, with a minimal (i.e. read-only) usage.
 * @warning Prior to iOS 13, macOS 10.15, this method does not protect against data hazards. If you are deploying to older versions of macOS or iOS, use fences to ensure data hazards are resolved.
 */
    useHeaps_count_ :: (self: *MTLAccelerationStructureCommandEncoder, heaps: **MTLHeap, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, heaps: **MTLHeap, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.useHeaps_count_, heaps, count);
    }

/*!
 @method sampleCountersInBuffer:atSampleIndex:withBarrier:
 @abstract Sample hardware counters at this point in the acceleration structure
 encoder and store the counter sample into the sample buffer at the specified index.
 @param sampleBuffer The sample buffer to sample into
 @param sampleIndex The index into the counter buffer to write the sample
 @param barrier Insert a barrier before taking the sample.  Passing
 YES will ensure that all work encoded before this operation in the encoder is
 complete but does not isolate the work with respect to other encoders.  Passing
 NO will allow the sample to be taken concurrently with other operations in this
 encoder.
 In general, passing YES will lead to more repeatable counter results but
 may negatively impact performance.  Passing NO will generally be higher performance
 but counter results may not be repeatable.
 */
    sampleCountersInBuffer_atSampleIndex_withBarrier_ :: (self: *MTLAccelerationStructureCommandEncoder, sampleBuffer: *MTLCounterSampleBuffer, sampleIndex: NSUInteger, barrier: BOOL) -> void {
        func: #type (obj: *void, selector: *void, sampleBuffer: *MTLCounterSampleBuffer, sampleIndex: NSUInteger, barrier: BOOL) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.sampleCountersInBuffer_atSampleIndex_withBarrier_, sampleBuffer, sampleIndex, barrier);
    }

}

/*!
 @protocol MTLRasterizationRateMap
 @abstract Compiled read-only object that determines how variable rasterization rate is applied when rendering.
 @discussion A variable rasterization rate map is compiled by MTLDevice from a MTLRasterizationRateMapDescriptor containing one or more MTLRasterizationRateLayerDescriptor.
 During compilation, the quality samples provided in the MTLRasterizationRateLayerDescriptor may be rounded up to the nearest supported value or granularity, depending on hardware support.
 However, the compilation will never round values down, so the actual rasterization will always happen at a quality level matching or exceeding the provided quality samples.
 During rasterization using the MTLRasterizationRateMap the screen space rendering is stored in a smaller area of the framebuffer, such that lower quality regions will not occupy as many texels as higher quality regions.
 The quality will never exceed 1:1 in any region of screen space.
 Because a smaller area of the framebuffer is populated, less fragment shader invocations are required to render content, and less bandwidth is consumed to store the shaded values.
 Use a rasterization rate map to reduce rendering quality in less-important or less-sampled regions of the framebuffer, such as the periphery of a VR/AR display or a far-away cascade of a shadow map.
 */
MTLRasterizationRateMap :: struct #type_info_no_size_complaint {
/*!
 @method copyParameterDataToBuffer:offset:
 @abstract Copy the parameter data into the provided buffer at the provided offset.
 @discussion The buffer must have storageMode MTLStorageModeShared, and a size of at least parameterBufferSizeAndAlign.size + offset.
 The specified offset must be a multiple of parameterBufferSize.align.
 The buffer can be bound to a shader stage to map screen space to physical fragment space, or vice versa.
 */
    copyParameterDataToBuffer_offset_ :: (self: *MTLRasterizationRateMap, buffer: *MTLBuffer, offset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyParameterDataToBuffer_offset_, buffer, offset);
    }

/*!
 @method getPhysicalSizeForLayer:
 @abstract The dimensions, in physical fragments, of the area in the render target where variable rasterization is applied
 @discussion Different configured layers may have a different rasterization rate and may have different size after rendering.
 The rasterization rate layer for a primitive is selected on the [[render_target_layer_index]].
 */
    physicalSizeForLayer_ :: (self: *MTLRasterizationRateMap, layerIndex: NSUInteger) -> MTLSize {
        func: #type (obj: *void, selector: *void, layerIndex: NSUInteger) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.physicalSizeForLayer_, layerIndex);
    }

/*!
 @method mapScreenToPhysicalCoordinates:forLayer:
 @abstract Computes where an offset relative to the top-left of screen space, in screen space pixels, would end up in the framebuffer, in physical fragments.
 The returned value is less-or-equal the input value because the rasterization quality never exceeds 1:1 in any region.
 */
    mapScreenToPhysicalCoordinates_forLayer_ :: (self: *MTLRasterizationRateMap, screenCoordinates: MTLCoordinate2D, layerIndex: NSUInteger) -> MTLCoordinate2D {
        func: #type (obj: *void, selector: *void, screenCoordinates: MTLCoordinate2D, layerIndex: NSUInteger) -> MTLCoordinate2D #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.mapScreenToPhysicalCoordinates_forLayer_, screenCoordinates, layerIndex);
    }

/*!
 @method mapPhysicalToScreenCoordinates:forLayer:
 @abstract Computes where an offset relative to the top-left of the framebuffer, in physical pixels, would end up in screen space, in screen space pixels.
 The returned value is greater-or-equal the input value because the rasterization quality never exceeds 1:1 in any region.
 */
    mapPhysicalToScreenCoordinates_forLayer_ :: (self: *MTLRasterizationRateMap, physicalCoordinates: MTLCoordinate2D, layerIndex: NSUInteger) -> MTLCoordinate2D {
        func: #type (obj: *void, selector: *void, physicalCoordinates: MTLCoordinate2D, layerIndex: NSUInteger) -> MTLCoordinate2D #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.mapPhysicalToScreenCoordinates_forLayer_, physicalCoordinates, layerIndex);
    }

/*!
 @property device
 @return The device on which the rasterization rate map was created
 */
    device :: (self: *MTLRasterizationRateMap) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

/*!
 @property label
 @abstract A string to help identify this object.
 */
    label :: (self: *MTLRasterizationRateMap) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

/*!
 @property screenSize
 @return The dimensions, in screen space pixels, of the region where variable rasterization is applied.
 @discussion The region always has its origin at [0, 0].
 The depth component of the returned MTLSize is always 0.
 */
    screenSize :: (self: *MTLRasterizationRateMap) -> MTLSize {
        func: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.screenSize);
    }

/*!
 @property physicalGranularity
 @return The granularity, in physical pixels, at which variable rasterization rate varies.
 @discussion Rendering algorithms that use binning or tiling in screen space may want to determine the screen space bin size using this value.
 The depth component of the returned MTLSize is always 0.
 */
    physicalGranularity :: (self: *MTLRasterizationRateMap) -> MTLSize {
        func: #type (obj: *void, selector: *void) -> MTLSize #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.physicalGranularity);
    }

/*!
 @property layerCount
 @return The number of different configured layers in the rasterization map.
 @discussion Different render-target layers may target different variable rasterization configurations.
 The rasterization rate layer for a primitive is selected on the [[render_target_layer_index]].
 */
    layerCount :: (self: *MTLRasterizationRateMap) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.layerCount);
    }

/*!
 @property parameterBufferSizeAndAlign
 @abstract Returns the size and alignment requirements of the parameter buffer for this rate map.
 @discussion The parameter data can be copied into a buffer with this size and alignment using copyParameterDataToBuffer:offset:
 */
    parameterBufferSizeAndAlign :: (self: *MTLRasterizationRateMap) -> MTLSizeAndAlign {
        func: #type (obj: *void, selector: *void) -> MTLSizeAndAlign #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.parameterBufferSizeAndAlign);
    }

}

/*!
 @protocol MTLDynamicLibrary
 @abstract A container for the binary representation of code compiled for a MTLDevice.
 @discussion MTLDynamicLibrary can be created in two ways:
 1) MTLDevice newDynamicLibrary:error:
 This method takes an MTLLibrary (which has .type set to MTLLibraryTypeDynamic) and then compiles the code in the MTLLibrary for the current device.
 2) MTLDevice newDynamicLibraryWithURL:error
 This method loads from a file a previously serialized MTLDynamicLibrary. If the dynamic library containg compiled code for the current device, that code is loaded.
 Otherwise, as a fallback, the MTLLibrary contents used to create the MTLDynamicLibrary are compiled for the current device similar to path #1 above.
 This path may also be taken if the driver for the current device has been updated or has otherwise become incompatible with the compiled code.
 Either way, if a MTLDynamicLibrary is successfully created, it contains compiled code for the current device.
 That code may be used via MTLComputePipelineDescriptor .preloadedLibraries to allow the code to be loaded into a MTLComputePipelineState
 It may also be used as an argument to MTLCompileOptions .libraries so that another MTLLibrary is linked against the code in this MTLDynamicLibrary.
 Such library dependencies are encoded into the resulting MTLLibrary by embedding the install name of the MTLDynamicLibrary.
 When creating a MTLComputePipelineState from a function in that MTLLibrary, the embedded install names are used to load MTLDynamicLibrary instances via path #2 (possibly falling back to #1 as well).
 If an embedded install name could not be used to load a MTLDynamicLibrary from the path indicated by the install name, the creation of the MTLComputePipelineState fails.
 The set of both the implictly loaded MTLDynamicLibrary and the MTLDynamicLibrary specified with .preloadedLibraries are used to resolve any unresolved symbols in the source MTLLibrary (or in other MTLDynamicLibrary).
 If any unresolved symbols remain after searching the set, the creation of the MTLComputePipelineState fails.
 Otherwise, the MTLComputePipelineState creation succeeds, and the set of MTLDynamicLibraries used are retained by the MTLComputePipelineState.
 */
MTLDynamicLibrary :: struct #type_info_no_size_complaint {
/*!
 @method serializeToURL:error:
 @abstract Writes the contents of the MTLDynamicLibrary to a file.
 @discussion On success, the file will contain a representation of the MTLLibrary from which the MTLDynamicLibrary was originally created, as well as the compiled code for the current device.
 Such files may be combined with offline tools to contain the compiled code for multiple devices.
 If this MTLDynamicLibrary was created from a file that contained compiled code for multiple devices, the compiled code for all other devices is not written (since only compiled code for the current device was loaded).
 @param url The file URL to which to write the content of the dynamic library. It the URL does not refer to a file, the function fails.
 @param error If the function fails, this will be set to describe the failure. This can be (but is not required to be) an error from the MTLDynamicLibraryDomain domain. Other possible errors can be file access or I/O related.
 @return Whether or not the writing the file succeeded.
 */
    serializeToURL_error_ :: (self: *MTLDynamicLibrary, url: *NSURL, error: **NSError) -> BOOL {
        func: #type (obj: *void, selector: *void, url: *NSURL, error: **NSError) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.serializeToURL_error_, url, error);
    }

/*!
 @property label
 @abstract A string to help identify this object.
 */
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

/*!
 @property device
 @abstract The device this resource was created against.  This resource can only be used with this device.
 */
    device :: (self: *MTLDynamicLibrary) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

/*!
 @property installName
 @abstract The installName of this dynamic library. Can not be nil.
 */
    installName :: (self: *MTLDynamicLibrary) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.installName);
    }

}

MTLLogState :: struct #type_info_no_size_complaint {
/*!
@method addLogHandler
@abstract Add a function block to handle log message output.
In the absence of any handlers, log messages go through the default handler.
*/
    addLogHandler_ :: (self: *MTLLogState, block: #type (unknown_0: *NSString, unknown_1: *NSString, unknown_2: MTLLogLevel, unknown_3: *NSString) -> void #c_call) -> void {
        func: #type (obj: *void, selector: *void, block: #type (unknown_0: *NSString, unknown_1: *NSString, unknown_2: MTLLogLevel, unknown_3: *NSString) -> void #c_call) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addLogHandler_, block);
    }

}

/*!
 @protocol MTLBinaryArchive
 @abstract A container of pipeline state descriptors and their associated compiled code.
 @discussion A MTLBinaryArchive allows to persist compiled pipeline state objects for a device, which can be used to skip recompilation on a subsequent run of the app.
 One or more archives may be supplied in the descriptor of a pipeline state, allowing the device to attempt to look up compiled code in them before performing compilation.
 If no archives are provided, or no archives contain the requested content, the pipeline state is created by compiling the code as usual.
 Note that software updates of the OS or device drivers may cause the archive to become outdated, causing the lookup to fail and the usual path performing on-demand compilation is taken.
 A MTLBinaryArchive is populated by adding functions from pipeline state descriptors to it, indicating which compiled code should be persisted in the archive.
 Once all desired pipeline state descriptors have been added, use serializeToURL:error: to write the contents for the current device to disk.
 MTLBinaryArchive files generated for multiple different devices can be combined using the "lipo" tool into a single archive, which can then be shipped with the application.
 It is possible to maintain different archive files for different contexts; for example each level in a game may use a different cache object.
 Note: Metal maintains a separate cache of pipeline states on behalf of each app that contains all compiled code; this cache is populated as compilation occurs.
 This cache will automatically accelerate pipeline state creation after a pipeline is created for the first time.
 Use MTLBinaryArchive to augment that cache by accelerating pipeline state creation even on the first run of an app.
 Updating a MTLBinaryArchive at runtime in a shipping app configuration is not recommended; such a scenario requires corruption resiliency, careful storage space management and may cache hard-to-reproduce errors.
 These kind of issues are handled transparently by the Metal maintained cache, therefore we recommend that MTLBinaryArchive is populated during development time and shipped as an asset.
 */
MTLBinaryArchive :: struct #type_info_no_size_complaint {
/*!
 @method addComputePipelineFunctionsWithDescriptor:error:
 @abstract Add the function(s) from a compute pipeline state to the archive.
 @param descriptor The descriptor from which function(s) will be added.
 @param error If the function fails, this will be set to describe the failure. This can be (but is not required to be) an error from the MTLBinaryArchiveDomain domain.
 @return Whether or not the addition succeeded. Functions referenced multiple times are silently accepted.
 */
    addComputePipelineFunctionsWithDescriptor_error_ :: (self: *MTLBinaryArchive, descriptor: *MTLComputePipelineDescriptor, error: **NSError) -> BOOL {
        func: #type (obj: *void, selector: *void, descriptor: *MTLComputePipelineDescriptor, error: **NSError) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addComputePipelineFunctionsWithDescriptor_error_, descriptor, error);
    }

/*!
 @method addRenderPipelineFunctionsWithDescriptor:error:
 @abstract Add the function(s) from a render pipeline state to the archive.
 @param descriptor The descriptor from which function(s) will be added.
 @param error If the function fails, this will be set to describe the failure. This can be (but is not required to be) an error from the MTLBinaryArchiveDomain domain.
 @return Whether or not the addition succeeded. Functions referenced multiple times are silently accepted.
 */
    addRenderPipelineFunctionsWithDescriptor_error_ :: (self: *MTLBinaryArchive, descriptor: *MTLRenderPipelineDescriptor, error: **NSError) -> BOOL {
        func: #type (obj: *void, selector: *void, descriptor: *MTLRenderPipelineDescriptor, error: **NSError) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addRenderPipelineFunctionsWithDescriptor_error_, descriptor, error);
    }

/*!
 @method addTileRenderPipelineFunctionsWithDescriptor:error:
 @abstract Add the function(s) from a tile render pipeline state to the archive.
 @param descriptor The descriptor from which function(s) will be added.
 @param error If the function fails, this will be set to describe the failure. This can be (but is not required to be) an error from the MTLBinaryArchiveDomain domain.
 @return Whether or not the addition succeeded. Functions referenced multiple times are silently accepted.
 */
    addTileRenderPipelineFunctionsWithDescriptor_error_ :: (self: *MTLBinaryArchive, descriptor: *MTLTileRenderPipelineDescriptor, error: **NSError) -> BOOL {
        func: #type (obj: *void, selector: *void, descriptor: *MTLTileRenderPipelineDescriptor, error: **NSError) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addTileRenderPipelineFunctionsWithDescriptor_error_, descriptor, error);
    }

/*!
 @method addMeshRenderPipelineFunctionsWithDescriptor:error:
 @abstract Add the function(s) from a mesh render pipeline state to the archive.
 @param descriptor The descriptor from which function(s) will be added.
 @param error If the function fails, this will be set to describe the failure. This can be (but is not required to be) an error from the MTLBinaryArchiveDomain domain.
 @return Whether or not the addition succeeded. Functions referenced multiple times are silently accepted.
 */
    addMeshRenderPipelineFunctionsWithDescriptor_error_ :: (self: *MTLBinaryArchive, descriptor: *MTLMeshRenderPipelineDescriptor, error: **NSError) -> BOOL {
        func: #type (obj: *void, selector: *void, descriptor: *MTLMeshRenderPipelineDescriptor, error: **NSError) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addMeshRenderPipelineFunctionsWithDescriptor_error_, descriptor, error);
    }

/*!
 @method addLibraryWithDescriptor:error:
 @abstract Add the function(s) from a stitched library to the archive.
 @param descriptor The stitched library descriptor from which function(s) will be added.
 @param error If the function fails, this will be set to describe the failure. This can be (but is not required to be) an error from the MTLBinaryArchiveDomain domain.
 @return Whether or not the addition succeeded. Functions referenced multiple times are silently accepted.
 */
    addLibraryWithDescriptor_error_ :: (self: *MTLBinaryArchive, descriptor: *MTLStitchedLibraryDescriptor, error: **NSError) -> BOOL {
        func: #type (obj: *void, selector: *void, descriptor: *MTLStitchedLibraryDescriptor, error: **NSError) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addLibraryWithDescriptor_error_, descriptor, error);
    }

/*!
 @method serializeToURL:error:
 @abstract Write the contents of a MTLBinaryArchive to a file.
 @discussion Persisting the archive to a file allows opening the archive on a subsequent instance of the app, making available the contents without recompiling.
 @param url The file URL to which to write the file
 @param error If the function fails, this will be set to describe the failure. This can be (but is not required to be) an error from the MTLBinaryArchiveDomain domain. Other possible errors can be file access or I/O related.
 @return Whether or not the writing the file succeeded.
 */
    serializeToURL_error_ :: (self: *MTLBinaryArchive, url: *NSURL, error: **NSError) -> BOOL {
        func: #type (obj: *void, selector: *void, url: *NSURL, error: **NSError) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.serializeToURL_error_, url, error);
    }

/*!
 @method addFunctionWithDescriptor:library:error:
 @abstract Add a `visible` or `intersection` function to the archive.
 @param descriptor The descriptor from which the function will be added.
 @param library Library of functions to add the function from.
 @param error If the function fails, this will be set to describe the failure. This can be (but is not required to be) an error from the MTLBinaryArchiveDomain domain. Other possible errors can be file access or I/O related.
 @return Whether or not the addition succeeded. Functions referenced multiple times are silently accepted.
 */
    addFunctionWithDescriptor_library_error_ :: (self: *MTLBinaryArchive, descriptor: *MTLFunctionDescriptor, library: *MTLLibrary, error: **NSError) -> BOOL {
        func: #type (obj: *void, selector: *void, descriptor: *MTLFunctionDescriptor, library: *MTLLibrary, error: **NSError) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addFunctionWithDescriptor_library_error_, descriptor, library, error);
    }

/*!
 @property label
 @abstract A string to help identify this object.
 */
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

/*!
 @property device
 @abstract The device this resource was created against.  This resource can only be used with this device.
 */
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

/*
 * @brief Initialize the function at the given index with a triangle intersection function
 * with the given signature which always accepts ray/triangle intersections. If this method is
 * not called and an intersection function is not otherwise set at the given index,
 * ray/triangle intersections will be ignored if a call to the function at the given index
 * would be required. Ray/triangle intersections are always accepted if an intersection
 * function table is not provided.
 */
    setOpaqueTriangleIntersectionFunctionWithSignature_atIndex_ :: (self: *MTLIntersectionFunctionTable, signature: MTLIntersectionFunctionSignature, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, signature: MTLIntersectionFunctionSignature, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOpaqueTriangleIntersectionFunctionWithSignature_atIndex_, signature, index);
    }

/*
 * @brief Initialize the function at the given range with a triangle intersection function
 * with the given signature which always accepts ray/triangle intersections. If this method is
 * not called and an intersection function is not otherwise set at an index in the given range,
 * ray/triangle intersections will be ignored if a call to the function at that index
 * would be required. Ray/triangle intersections are always accepted if an intersection
 * function table is not provided.
 */
    setOpaqueTriangleIntersectionFunctionWithSignature_withRange_ :: (self: *MTLIntersectionFunctionTable, signature: MTLIntersectionFunctionSignature, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, signature: MTLIntersectionFunctionSignature, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOpaqueTriangleIntersectionFunctionWithSignature_withRange_, signature, range);
    }

/*
 * @brief Initialize the function at the given index with a curve intersection function
 * with the given signature which always accepts ray/curve intersections. If this method is
 * not called and an intersection function is not otherwise set at the given index,
 * ray/curve intersections will be ignored if a call to the function at the given index
 * would be required. Ray/curve intersections are always accepted if an intersection
 * function table is not provided.
 */
    setOpaqueCurveIntersectionFunctionWithSignature_atIndex_ :: (self: *MTLIntersectionFunctionTable, signature: MTLIntersectionFunctionSignature, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, signature: MTLIntersectionFunctionSignature, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setOpaqueCurveIntersectionFunctionWithSignature_atIndex_, signature, index);
    }

/*
 * @brief Initialize the function at the given range with a curve intersection function
 * with the given signature which always accepts ray/curve intersections. If this method is
 * not called and an intersection function is not otherwise set at an index in the given range,
 * ray/curve intersections will be ignored if a call to the function at that index
 * would be required. Ray/curve intersections are always accepted if an intersection
 * function table is not provided.
 */
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

/*!
 @property gpuResourceID
 @abstract Handle of the GPU resource suitable for storing in an Argument Buffer
 */
    gpuResourceID :: (self: *MTLIntersectionFunctionTable) -> MTLResourceID {
        func: #type (obj: *void, selector: *void) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.gpuResourceID);
    }

}

/*!
 @protocol MTLFunctionStitchingAttribute
 @abstract An attribute to be applied to the produced stitched function.
*/
MTLFunctionStitchingAttribute :: struct #type_info_no_size_complaint {
}

/*!
 @protocol MTLFunctionStitchingNode
 @abstract A node used in a graph for stitching.
*/
MTLFunctionStitchingNode :: struct #type_info_no_size_complaint {
}

/*!
 @protocol MTLIOCommandQueue
 @abstract Represents a queue that schedules command buffers containing command that
 read from handle objects and write to MTLResource objects.
 */
MTLIOCommandQueue :: struct #type_info_no_size_complaint {
/*!
 @method enqueueBarrier
 @abstract Inserts a barrier that ensures that all commandBuffers commited
 prior are completed before any commandBuffers after start execution.
 @discussion A serial commandQueue has implicit barriers between
 each commandBuffer.
 */
    enqueueBarrier :: (self: *MTLIOCommandQueue) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.enqueueBarrier);
    }

/*!
 @method commandBuffer
 @abstract Vends an autoreleased commandBuffer that can be used to
 encode  commands that read from handle objects and write to MTLResource objects.
 */
    commandBuffer :: (self: *MTLIOCommandQueue) -> *MTLIOCommandBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLIOCommandBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.commandBuffer);
    }

/*!
 @method commandBufferWithUnretainedReferences
 @abstract Vends an autoreleased commandBuffer that can be used to
 encode  commands that read from handle objects and write to MTLResource objects.
 This commandBuffer does not retain objects referenced by the commandBuffer
 as an optimization.
 @discussion For correct execution its the application's responsibility to retain
 objects referenced by commands within the commandBuffer.
 */
    commandBufferWithUnretainedReferences :: (self: *MTLIOCommandQueue) -> *MTLIOCommandBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLIOCommandBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.commandBufferWithUnretainedReferences);
    }

/*!
 @property label
 @abstract An optional label for this handle.
*/
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

/*!
 @protocol MTLIOScratchBuffer
 @abstract An extendible protocol that can be used to wrap the buffers vended by
 a custom allocator. The underlying buffer is used as scratch space for IO commands
 that need it.
 */
MTLIOScratchBuffer :: struct #type_info_no_size_complaint {
    buffer :: (self: *MTLIOScratchBuffer) -> *MTLBuffer {
        func: #type (obj: *void, selector: *void) -> *MTLBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.buffer);
    }

}

/*!
 @protocol MTLIOScratchBufferAllocator
 @abstract An extendible protocol that can implement a custom allocator passed
 to the queue descriptor.
 @discussion If provided, the queue will call newScratchBufferWithMinimumSize
 when it needs scratch storage for IO commands. When the commands that use the memory
 complete they return the storage by dealloc'ing the MTLIOScratchBuffer objects (where
 the application can optionally pool the memory for use by future commands.
 */
MTLIOScratchBufferAllocator :: struct #type_info_no_size_complaint {
/*!
 @method newScratchBufferWithMinimumSize:minimumSize
 @abstract This method is called when additional scratch memory is required by a load command.
 The scratch buffer returned should NOT be an autoreleased object.
 @discussion  Scratch memory is needed for cases where a texture is being copied to. minimumSize
 is the smallest buffer that will allow the command to execute, however a larger buffer can be provided and
 susequent commands will be able to use it, thus avoiding the need for an additional callback. Returning nil
 from the function will result in the load command being skipped and the commandBuffer getting cancelled.
 */
    newScratchBufferWithMinimumSize_ :: (self: *MTLIOScratchBufferAllocator, minimumSize: NSUInteger) -> *MTLIOScratchBuffer {
        func: #type (obj: *void, selector: *void, minimumSize: NSUInteger) -> *MTLIOScratchBuffer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newScratchBufferWithMinimumSize_, minimumSize);
    }

}

/*!
 @protocol MTLIOFileHandle
 @abstract Represents a  file (raw or compressed) that can be used as a source
 for load commands encoded in a MTLIOCommandBuffer.
 */
MTLIOFileHandle :: struct #type_info_no_size_complaint {
/*!
 @property label
 @abstract An optional label for this handle.
*/
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

/*!
 @protocol MTLIOCommandBuffer
 @abstract represents a list of IO commands for a queue to execute
*/
MTLIOCommandBuffer :: struct #type_info_no_size_complaint {
/*!
 @method addCompletedHandler:block:
 @abstract Add a block to be called when this command buffer has completed execution.
 */
    addCompletedHandler_ :: (self: *MTLIOCommandBuffer, block: MTLIOCommandBufferHandler) -> void {
        func: #type (obj: *void, selector: *void, block: MTLIOCommandBufferHandler) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addCompletedHandler_, block);
    }

/*!
 @method loadBytes:size:sourceHandle:sourceHandleOffset
 @abstract Encodes a command that loads from a handle
 and offset into a memory location.
 */
    loadBytes_size_sourceHandle_sourceHandleOffset_ :: (self: *MTLIOCommandBuffer, pointer: *void, size: NSUInteger, sourceHandle: *MTLIOFileHandle, sourceHandleOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, pointer: *void, size: NSUInteger, sourceHandle: *MTLIOFileHandle, sourceHandleOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.loadBytes_size_sourceHandle_sourceHandleOffset_, pointer, size, sourceHandle, sourceHandleOffset);
    }

/*!
 @method loadBuffer:offset:size:sourceHandle:sourceHandleOffset
 @abstract Encodes a command that loads from a handle
 and offset into a buffer and an offset.
 */
    loadBuffer_offset_size_sourceHandle_sourceHandleOffset_ :: (self: *MTLIOCommandBuffer, buffer: *MTLBuffer, offset: NSUInteger, size: NSUInteger, sourceHandle: *MTLIOFileHandle, sourceHandleOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger, size: NSUInteger, sourceHandle: *MTLIOFileHandle, sourceHandleOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.loadBuffer_offset_size_sourceHandle_sourceHandleOffset_, buffer, offset, size, sourceHandle, sourceHandleOffset);
    }

/*!
 @method loadTexture:texture:slice:level:size:sourceBytesPerRow:sourceBytesPerImage:destinationOrigin:sourceHandle:sourceHandleOffset:
 @abstract Encodes a command that loads a region from a handle
 and offset into a texture at a given slice, level and origin.
 */
    loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset_ :: (self: *MTLIOCommandBuffer, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger, size: MTLSize, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, destinationOrigin: MTLOrigin, sourceHandle: *MTLIOFileHandle, sourceHandleOffset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger, size: MTLSize, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, destinationOrigin: MTLOrigin, sourceHandle: *MTLIOFileHandle, sourceHandleOffset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset_, texture, slice, level, size, sourceBytesPerRow, sourceBytesPerImage, destinationOrigin, sourceHandle, sourceHandleOffset);
    }

/*!
 @method copyStatusToBuffer:buffer:offset
 @abstract Encodes a command that writes the status of this commandBuffer upon completion
 to a buffer at a given offset
 */
    copyStatusToBuffer_offset_ :: (self: *MTLIOCommandBuffer, buffer: *MTLBuffer, offset: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, offset: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyStatusToBuffer_offset_, buffer, offset);
    }

/*!
 @method commit
 @abstract Commit a command buffer so it can be executed as soon as possible.
 */
    commit :: (self: *MTLIOCommandBuffer) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.commit);
    }

/*!
 @method waitUntilCompleted
 @abstract Synchronously wait for this command buffer to complete.
 */
    waitUntilCompleted :: (self: *MTLIOCommandBuffer) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.waitUntilCompleted);
    }

/*!
 @method tryCancel
 @abstract request a cancellation of an in-flight command buffer.
 */
    tryCancel :: (self: *MTLIOCommandBuffer) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.tryCancel);
    }

/*!
 @method addBarrier
 @abstract add a barrier that starts subsequent commands after all
 the previously encoded commands have completed.
 */
    addBarrier :: (self: *MTLIOCommandBuffer) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addBarrier);
    }

/*!
 @method pushDebugGroup:
 @abstract Push a new named string onto a stack of string labels.
 */
    pushDebugGroup_ :: (self: *MTLIOCommandBuffer, str: *NSString) -> void {
        func: #type (obj: *void, selector: *void, str: *NSString) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.pushDebugGroup_, str);
    }

/*!
 @method popDebugGroup
 @abstract Pop the latest named string off of the stack.
 */
    popDebugGroup :: (self: *MTLIOCommandBuffer) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.popDebugGroup);
    }

/*!
 @method enqueue
 @abstract Append this command buffer to the end of its MTLCommandQueue.
*/
    enqueue :: (self: *MTLIOCommandBuffer) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.enqueue);
    }

/*!
@method waitForEvent:value:
@abstract Encodes a command that pauses execution of this command buffer until the specified event reaches a given value.
*/
    waitForEvent_value_ :: (self: *MTLIOCommandBuffer, event: *MTLSharedEvent, value: u64) -> void {
        func: #type (obj: *void, selector: *void, event: *MTLSharedEvent, value: u64) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.waitForEvent_value_, event, value);
    }

/*!
 @method signalEvent:value:
 @abstract Encodes a command that signals an event with a given value.
 */
    signalEvent_value_ :: (self: *MTLIOCommandBuffer, event: *MTLSharedEvent, value: u64) -> void {
        func: #type (obj: *void, selector: *void, event: *MTLSharedEvent, value: u64) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.signalEvent_value_, event, value);
    }

/*!
 @property label
 @abstract An optional label for this handle.
*/
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

/*!
 @property status
 @abstract status reports the completion status of the MTLIOCommandBuffer, pending, cancelled, error or complete.
 */
    status :: (self: *MTLIOCommandBuffer) -> MTLIOStatus {
        func: #type (obj: *void, selector: *void) -> MTLIOStatus #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.status);
    }

/*!
 @property error
 @abstract If an error occurred during execution, the NSError may contain more details about the problem.
 */
    error :: (self: *MTLIOCommandBuffer) -> *NSError {
        func: #type (obj: *void, selector: *void) -> *NSError #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.error);
    }

}

/*!
 @protocol MTLResidencySet
 @abstract A residency set is responsible for managing resource and heap residency and is referenced
 by a command buffer or command queue in order to ensure that resources and heaps are resident.
 Resources and heaps are added and removed uncommitted and a subsequent commit call applies all
 of the changes in bulk.
 */
MTLResidencySet :: struct #type_info_no_size_complaint {
/*!
  @method requestResidency
  @abstract Requests that the set and all the committed resources and heaps are made resident.
 */
    requestResidency :: (self: *MTLResidencySet) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.requestResidency);
    }

/*!
  @method endResidency
  @abstract Requests that the set and all the committed resources and heaps are made non-resident.
*/
    endResidency :: (self: *MTLResidencySet) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.endResidency);
    }

/*!
 @method addAllocation
 @abstract Adds one allocation to the set, leaving it uncommitted until commit is called.
 */
    addAllocation_ :: (self: *MTLResidencySet, allocation: *MTLAllocation) -> void {
        func: #type (obj: *void, selector: *void, allocation: *MTLAllocation) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addAllocation_, allocation);
    }

/*!
 @method addAllocations
 @abstract Adds allocations to the set, leaving them uncommitted until commit is called.
 */
    addAllocations_count_ :: (self: *MTLResidencySet, allocations: **MTLAllocation, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, allocations: **MTLAllocation, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.addAllocations_count_, allocations, count);
    }

/*!
 @method removeAllocation
 @abstract Marks an allocation to be removed from the set on the next commit call.
 */
    removeAllocation_ :: (self: *MTLResidencySet, allocation: *MTLAllocation) -> void {
        func: #type (obj: *void, selector: *void, allocation: *MTLAllocation) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.removeAllocation_, allocation);
    }

/*!
 @method removeAllocations
 @abstract Marks allocations to be removed from the set on the next commit call.
 */
    removeAllocations_count_ :: (self: *MTLResidencySet, allocations: **MTLAllocation, count: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, allocations: **MTLAllocation, count: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.removeAllocations_count_, allocations, count);
    }

/*!
 @method removeAllAllocations
 @abstract Marks all allocations to be removed from the set on the next commit call.
 */
    removeAllAllocations :: (self: *MTLResidencySet) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.removeAllAllocations);
    }

/*!
  @method containsAllocation
  @abstract Returns a boolean indicating whether the allocation is present in the set or not.
  @discussion This check includes non-committed allocations in the set.
  */
    containsAllocation_ :: (self: *MTLResidencySet, anAllocation: *MTLAllocation) -> BOOL {
        func: #type (obj: *void, selector: *void, anAllocation: *MTLAllocation) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.containsAllocation_, anAllocation);
    }

/*!
 @method commit
 @abstract Commits any pending adds/removes.
 @discussion If the residency set is resident, this will try to make added resources and heaps resident instantly, and make removed resources and heaps non-resident.
 */
    commit :: (self: *MTLResidencySet) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.commit);
    }

/*!
 @property device
 @abstract The device that created the residency set
 */
    device :: (self: *MTLResidencySet) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

/*!
 @property label
 @abstract The label specified at creation.
 */
    label :: (self: *MTLResidencySet) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

/*!
 @property allocatedSize
 @abstract The memory footprint of the set in bytes at the last commit operation. This may include internal allocations as well.
 */
    allocatedSize :: (self: *MTLResidencySet) -> u64 {
        func: #type (obj: *void, selector: *void) -> u64 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.allocatedSize);
    }

/*!
 @property allAllocations
 @abstract Array of all allocations associated with the set.
 @discussion This property includes non-committed allocations in the set.
 */
    allAllocations :: (self: *MTLResidencySet) -> *NSArray(*MTLAllocation) {
        func: #type (obj: *void, selector: *void) -> *NSArray(*MTLAllocation) #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.allAllocations);
    }

/*!
 @property allocationCount
 @abstract Returns the current number of unique allocations present in the set.
 @discussion This property includes non-committed allocations in the set.
 */
    allocationCount :: (self: *MTLResidencySet) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.allocationCount);
    }

}

/// Contains views over resources of a specific type, and allows you to manage those views.
MTLResourceViewPool :: struct #type_info_no_size_complaint {
/// Copies a range of resource views from a source view pool to a destination location in this view pool.
///
/// - Parameters:
///   - sourcePool: resource view pool from which to copy resource views.
///   - sourceRange: The range in the source resource view pool to copy.
///   - destinationIndex: The starting index in this destination view pool into which to copy the source range of resource views.
///
/// - Returns: The ``MTLResourceID`` of the resource view corresponding to `destinationIndex` of the copy in this resource view pool.
    copyResourceViewsFromPool_sourceRange_destinationIndex_ :: (self: *MTLResourceViewPool, sourcePool: *MTLResourceViewPool, sourceRange: NSRange, destinationIndex: NSUInteger) -> MTLResourceID {
        func: #type (obj: *void, selector: *void, sourcePool: *MTLResourceViewPool, sourceRange: NSRange, destinationIndex: NSUInteger) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyResourceViewsFromPool_sourceRange_destinationIndex_, sourcePool, sourceRange, destinationIndex);
    }

/// Obtains the resource ID corresponding to the resource view at index 0 in this resource view pool.
    baseResourceID :: (self: *MTLResourceViewPool) -> MTLResourceID {
        func: #type (obj: *void, selector: *void) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.baseResourceID);
    }

/// Queries the number of resource views that this pool contains.
    resourceViewCount :: (self: *MTLResourceViewPool) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resourceViewCount);
    }

/// Obtains a reference to the GPU device this pool belongs to.
    device :: (self: *MTLResourceViewPool) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

/// Queries the optional debug label of this resource view pool.
    label :: (self: *MTLResourceViewPool) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

}

/// A pool of lightweight texture views.
///
/// Use texture view pools to create lightweight texture view objects of ``MTLTexture``
/// and ``MTLBuffer`` instances.
MTLTextureViewPool :: struct #type_info_no_size_complaint {
/// Copies a default texture view to a slot in this texture view pool at an index provided.
///
/// - Parameters:
///   - texture: An ``MTLTexture`` instance for which to copy its texture view.
///   - index: An index of a slot in this texture pool into which this method copies the texture view.
/// - Returns: The ``MTLResourceID`` of a newly created texture view in this pool.
    setTextureView_atIndex_ :: (self: *MTLTextureViewPool, texture: *MTLTexture, index: NSUInteger) -> MTLResourceID {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, index: NSUInteger) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTextureView_atIndex_, texture, index);
    }

/// Creates a new lightweight texture view.
///
/// This method creates a lightweight texture view over a texture according to
/// a descriptor you provide. It then associates the texture view with a slot
/// in this texture view pool at the index you specify.
///
/// - Parameters:
///   - texture: An ``MTLTexture`` instance for which to create a new lightweight texture view.
///   - descriptor: A descriptor specifying properties of the texture view to create.
///   - index: An index of a slot in the texture pool into which this method writes the new texture view.
/// - Returns: The ``MTLResourceID`` of a newly created texture view in this pool.
    setTextureView_descriptor_atIndex_ :: (self: *MTLTextureViewPool, texture: *MTLTexture, descriptor: *MTLTextureViewDescriptor, index: NSUInteger) -> MTLResourceID {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, descriptor: *MTLTextureViewDescriptor, index: NSUInteger) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTextureView_descriptor_atIndex_, texture, descriptor, index);
    }

/// Creates a new lightweight texture view of a buffer.
///
/// This method creates a lightweight texture view over a buffer, according to
/// a descriptor you provide. It then associates the texture view with a slot
/// in this texture view pool at the index you specify.
///
/// - Parameters:
///   - buffer: An ``MTLBuffer`` instance for which to create a new texture view.
///   - descriptor: A descriptor specifying properties of the texture view to create.
///   - offset: A byte offset, within the `buffer` parameter, at which the data for the texture view starts.
///   - bytesPerRow: The number of bytes between adjacent rows of pixels in the source buffer’s memory.
///   - index: An index of a slot in the table into which this method writes the new texture view.
/// - Returns: The ``MTLResourceID`` of a new buffer view in this pool.
    setTextureViewFromBuffer_descriptor_offset_bytesPerRow_atIndex_ :: (self: *MTLTextureViewPool, buffer: *MTLBuffer, descriptor: *MTLTextureDescriptor, offset: NSUInteger, bytesPerRow: NSUInteger, index: NSUInteger) -> MTLResourceID {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, descriptor: *MTLTextureDescriptor, offset: NSUInteger, bytesPerRow: NSUInteger, index: NSUInteger) -> MTLResourceID #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTextureViewFromBuffer_descriptor_offset_bytesPerRow_atIndex_, buffer, descriptor, offset, bytesPerRow, index);
    }

}

/// Provides a mechanism to manage and provide resource bindings for buffers, textures, sampler states and other Metal resources.
MTL4ArgumentTable :: struct #type_info_no_size_complaint {
/// Binds a GPU address to a buffer binding slot.
///
/// - Parameters:
///   - gpuAddress: The GPU address of a ``MTLBuffer`` to set.
///   - bindingIndex: a valid binding index in the buffer binding range.
///   It is an error for this value to match or exceed the value of property
///   ``MTL4ArgumentTableDescriptor/maxBufferBindCount`` on the descriptor
///   from which you created this argument table.
    setAddress_atIndex_ :: (self: *MTL4ArgumentTable, gpuAddress: MTLGPUAddress, bindingIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, gpuAddress: MTLGPUAddress, bindingIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAddress_atIndex_, gpuAddress, bindingIndex);
    }

/// Binds a GPU address to a buffer binding slot, providing a dynamic vertex stride.
///
/// This method requires that the value of property ``MTL4ArgumentTableDescriptor/supportAttributeStrides`` on the
/// descriptor from which you created this argument table is true.
///
/// - Parameters:
///   - gpuAddress: The GPU address of a ``MTLBuffer`` to set.
///   - stride: The stride between attributes in the buffer.
///   - bindingIndex: a valid binding index in the buffer binding range.
///   It is an error for this value to match or exceed the value of property
///   ``MTL4ArgumentTableDescriptor/maxBufferBindCount`` on the descriptor
///   from which you created this argument table.
    setAddress_attributeStride_atIndex_ :: (self: *MTL4ArgumentTable, gpuAddress: MTLGPUAddress, stride: NSUInteger, bindingIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, gpuAddress: MTLGPUAddress, stride: NSUInteger, bindingIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setAddress_attributeStride_atIndex_, gpuAddress, stride, bindingIndex);
    }

/// Binds a resource to a buffer binding slot.
///
/// - Parameters:
///   - resourceID: The ``MTLResourceID`` of the Metal resource to bind.
///   - bindingIndex: a valid binding index in the buffer binding range.
///   It is an error for this value to match or exceed the value of property
///   ``MTL4ArgumentTableDescriptor/maxBufferBindCount`` on the descriptor
///   from which you created this argument table.
    setResource_atBufferIndex_ :: (self: *MTL4ArgumentTable, resourceID: MTLResourceID, bindingIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, resourceID: MTLResourceID, bindingIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setResource_atBufferIndex_, resourceID, bindingIndex);
    }

/// Binds a texture to a texture binding slot.
///
/// - Parameters:
///   - resourceID: The ``MTLResourceID`` of the ``MTLTexture`` instance to bind.
///   - bindingIndex: a valid binding index in the texture binding range.
///   It is an error for this value to match or exceed the value of property
///   ``MTL4ArgumentTableDescriptor/maxTextureBindCount`` on the descriptor
///   from which you created this argument table.
    setTexture_atIndex_ :: (self: *MTL4ArgumentTable, resourceID: MTLResourceID, bindingIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, resourceID: MTLResourceID, bindingIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setTexture_atIndex_, resourceID, bindingIndex);
    }

/// Binds a sampler state to a sampler state binding slot.
///
/// - Parameters:
///   - resourceID: The ``MTLResourceID`` of the ``MTLSamplerState`` instance to bind.
///   - bindingIndex: a valid binding index in the sampler binding range.
///   It is an error for this value to match or exceed the value of property
///   ``MTL4ArgumentTableDescriptor/maxSamplerStateBindCount`` on the descriptor
///   from which you created this argument table.
    setSamplerState_atIndex_ :: (self: *MTL4ArgumentTable, resourceID: MTLResourceID, bindingIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, resourceID: MTLResourceID, bindingIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setSamplerState_atIndex_, resourceID, bindingIndex);
    }

/// The device from which you created this argument table.
    device :: (self: *MTL4ArgumentTable) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

/// Assigns an optional label with this argument table for debugging purposes.
///
/// You set this label by setting property ``MTL4ArgumentTableDescriptor/label`` on the descriptor object, prior to
/// creating this table instance.
    label :: (self: *MTL4ArgumentTable) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

}

/// Represents a binary function.
///
/// A binary function is a shader that you precompile from Metal IR to GPU machine code.
MTL4BinaryFunction :: struct #type_info_no_size_complaint {
/// Obtains the optional name of this binary function.
    name :: (self: *MTL4BinaryFunction) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.name);
    }

/// Describes the type of this binary function.
    functionType :: (self: *MTL4BinaryFunction) -> MTLFunctionType {
        func: #type (obj: *void, selector: *void) -> MTLFunctionType #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.functionType);
    }

}

/// Manages the memory backing the encoding of GPU commands into command buffers.
MTL4CommandAllocator :: struct #type_info_no_size_complaint {
/// Queries the size of the internal memory heaps of this command allocator that support encoding
/// commands into command buffers.
///
/// - Returns: a size in bytes.
    allocatedSize :: (self: *MTL4CommandAllocator) -> u64 {
        func: #type (obj: *void, selector: *void) -> u64 #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.allocatedSize);
    }

/// Marks the command allocator's heaps for reuse.
///
/// Calling this method allows new ``MTL4CommandBuffer`` to reuse its existing internal
/// memory heaps to encode new GPU commands.
///
/// You are responsible to ensure that all command buffers with memory originating
/// from this allocator instance are complete before calling resetting it.
    reset :: (self: *MTL4CommandAllocator) -> void {
        func: #type (obj: *void, selector: *void) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reset);
    }

/// Returns the GPU device that this command allocator belongs to.
    device :: (self: *MTL4CommandAllocator) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

/// Provides the optional label you specify at creation time for debug purposes.
    label :: (self: *MTL4CommandAllocator) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

}

/// Encodes a compute pass and other memory operations into a command buffer.
///
/// Use instances of this abstraction to encode a compute pass into ``MTL4CommandBuffer`` instances, as well as commands
/// that copy and modify the underlying memory of various Metal resources, and commands that build or refit acceleration
/// structures.
MTL4ComputeCommandEncoder :: struct #type_info_no_size_complaint {
/// Queries a bitmask representing the shader stages on which commands currently present in this command encoder
/// operate.
///
/// Metal dynamically updates this property based on the commands you encode into the command encoder, for example,
/// it sets the bit ``MTLStages/MTLStageDispatch`` if this encoder contains any commands that dispatch a compute kernel.
///
/// Similarly, it sets the bit ``MTLStages/MTLStageBlit`` if this encoder contains any commands to copy or modify buffers,
/// textures, or indirect command buffers.
///
/// Finally, Metal sets the bit ``MTLStages/MTLStageAccelerationStructure`` if this encoder contains any commands that
/// build, copy, or refit acceleration structures.
///
///- Returns: a bitmask representing shader stages that commands currently present in this command encoder operate on.
    stages :: (self: *MTL4ComputeCommandEncoder) -> MTLStages {
        func: #type (obj: *void, selector: *void) -> MTLStages #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.stages);
    }

/// Configures this encoder with a compute pipeline state that applies to your subsequent dispatch commands.
///
/// - Parameter state: a non-`nil` ``MTLComputePipelineState``.
    setComputePipelineState_ :: (self: *MTL4ComputeCommandEncoder, state: *MTLComputePipelineState) -> void {
        func: #type (obj: *void, selector: *void, state: *MTLComputePipelineState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setComputePipelineState_, state);
    }

/// Configures the size of a threadgroup memory buffer for a threadgroup argument in the compute shader function.
///
/// - Parameters:
///   - length: The size of the threadgroup memory, in bytes. Use a multiple of `16` bytes.
///   - index: An integer that corresponds to the index of the argument you annotate with attribute `[[threadgroup(index)]]`
///   in the shader function.
    setThreadgroupMemoryLength_atIndex_ :: (self: *MTL4ComputeCommandEncoder, length: NSUInteger, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, length: NSUInteger, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setThreadgroupMemoryLength_atIndex_, length, index);
    }

/// Specifies the size, in pixels, of imageblock data in tile memory.
///
/// - Parameters:
///   - width:  The width of the imageblock, in pixels.
///   - height: The height of the imageblock, in pixels.
    setImageblockWidth_height_ :: (self: *MTL4ComputeCommandEncoder, width: NSUInteger, height: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, width: NSUInteger, height: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setImageblockWidth_height_, width, height);
    }

/// Encodes a compute dispatch command using an arbitrarily-sized grid.
///
/// - Parameters:
///   - threadsPerGrid:        An ``MTLSize`` instance that represents the number of threads in the grid,
///                            in each dimension.
///   - threadsPerThreadgroup: An ``MTLSize`` instance that represents the number of threads in one
///                            threadgroup, in each dimension.
    dispatchThreads_threadsPerThreadgroup_ :: (self: *MTL4ComputeCommandEncoder, threadsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, threadsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dispatchThreads_threadsPerThreadgroup_, threadsPerGrid, threadsPerThreadgroup);
    }

/// Encodes a compute dispatch command with a grid that aligns to threadgroup boundaries.
///
/// - Parameters:
///   - threadgroupsPerGrid:   An ``MTLSize`` instance that represents the number of threadgroups in the grid,
///                            in each dimension.
///   - threadsPerThreadgroup: An ``MTLSize`` instance that represents the number of threads in one
///                            threadgroup, in each dimension.
    dispatchThreadgroups_threadsPerThreadgroup_ :: (self: *MTL4ComputeCommandEncoder, threadgroupsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, threadgroupsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dispatchThreadgroups_threadsPerThreadgroup_, threadgroupsPerGrid, threadsPerThreadgroup);
    }

/// Encodes a compute dispatch command with a grid that aligns to threadgroup boundaries, using an indirect buffer
/// for arguments.
///
/// This method allows you to supply the threadgroups-per-grid counts indirectly via an ``MTLBuffer`` index. This
/// enables you to calculate this value in the GPU timeline from a shader function, enabling GPU-driven workflows.
///
/// Metal assumes that the buffer contents correspond to the layout of struct ``MTLDispatchThreadgroupsIndirectArguments``.
/// You are responsible for ensuring this address aligns to 4-bytes.
///
/// Use an instance of ``MTLResidencySet`` to mark residency of the indirect buffer that the `indirectBuffer`
/// parameter references.
///
/// - Parameters:
///   - indirectBuffer:        GPUAddress of a ``MTLBuffer`` instance providing compute parameters.
///                            Lay out the data in this buffer as described in the
///                            ``MTLDispatchThreadgroupsIndirectArguments`` structure. This address
///                            requires 4-byte alignment.
///   - threadsPerThreadgroup: A ``MTLSize`` instance that represents the number of threads in one
///                            threadgroup, in each dimension.
    dispatchThreadgroupsWithIndirectBuffer_threadsPerThreadgroup_ :: (self: *MTL4ComputeCommandEncoder, indirectBuffer: MTLGPUAddress, threadsPerThreadgroup: MTLSize) -> void {
        func: #type (obj: *void, selector: *void, indirectBuffer: MTLGPUAddress, threadsPerThreadgroup: MTLSize) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dispatchThreadgroupsWithIndirectBuffer_threadsPerThreadgroup_, indirectBuffer, threadsPerThreadgroup);
    }

/// Encodes a compute dispatch command with an arbitrarily sized grid, using an indirect buffer for arguments.
///
/// - Parameters:
///   - indirectBuffer: GPUAddress of a ``MTLBuffer`` instance providing arguments. Lay out the data
///                     in this buffer as described in the ``MTLDispatchThreadsIndirectArguments``
///                     structure. This address requires 4-byte alignment.
    dispatchThreadsWithIndirectBuffer_ :: (self: *MTL4ComputeCommandEncoder, indirectBuffer: MTLGPUAddress) -> void {
        func: #type (obj: *void, selector: *void, indirectBuffer: MTLGPUAddress) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dispatchThreadsWithIndirectBuffer_, indirectBuffer);
    }

/// Encodes a command to execute a series of commands from an indirect command buffer.
///
/// - Parameters:
///   - indirectCommandBuffer: ``MTLIndirectCommandBuffer`` instance containing the commands to execute.
///   - executionRange:        The range of commands to execute.
    executeCommandsInBuffer_withRange_ :: (self: *MTL4ComputeCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, executionRange: NSRange) -> void {
        func: #type (obj: *void, selector: *void, indirectCommandBuffer: *MTLIndirectCommandBuffer, executionRange: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.executeCommandsInBuffer_withRange_, indirectCommandBuffer, executionRange);
    }

/// Encodes an instruction to execute commands from an indirect command buffer, using an indirect buffer for
/// arguments.
///
/// Use an instance of ``MTLResidencySet`` to mark residency of the indirect buffer that the `indirectRangeBuffer`
/// parameter references.
///
/// - Parameters:
///   - indirectCommandbuffer: ``MTLIndirectCommandBuffer`` instance containing the commands to execute.
///   - indirectRangeBuffer:   GPUAddress of a ``MTLBuffer`` containing the execution range. Lay out the data
///                            in this buffer as described in the ``MTLIndirectCommandBufferExecutionRange``
///                            structure. This address requires 4-byte alignment.
    executeCommandsInBuffer_indirectBuffer_ :: (self: *MTL4ComputeCommandEncoder, indirectCommandbuffer: *MTLIndirectCommandBuffer, indirectRangeBuffer: MTLGPUAddress) -> void {
        func: #type (obj: *void, selector: *void, indirectCommandbuffer: *MTLIndirectCommandBuffer, indirectRangeBuffer: MTLGPUAddress) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.executeCommandsInBuffer_indirectBuffer_, indirectCommandbuffer, indirectRangeBuffer);
    }

/// Encodes a command that copies data from a texture to another.
///
/// - Parameters:
///   - sourceTexture:      An ``MTLTexture`` instance the command copies data from.
///   - destinationTexture: Another ``MTLTexture`` instance the command copies the data into that has the same
///                         ``MTLTexture/pixelFormat`` and ``MTLTexture/sampleCount`` as `sourceTexture`.
    copyFromTexture_toTexture_ :: (self: *MTL4ComputeCommandEncoder, sourceTexture: *MTLTexture, destinationTexture: *MTLTexture) -> void {
        func: #type (obj: *void, selector: *void, sourceTexture: *MTLTexture, destinationTexture: *MTLTexture) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromTexture_toTexture_, sourceTexture, destinationTexture);
    }

/// Encodes a command that copies slices of a texture to slices of another texture.
///
/// - Parameters:
///   - sourceTexture:      A ``MTLTexture`` texture that the command copies data from. To read the source
///                         texture contents, you need to set its ``MTLTexture/framebufferOnly`` property
///                         to <doc://com.apple.documentation/documentation/swift/false> prior to drawing into it.
///   - sourceSlice:        A slice within `sourceTexture` the command uses as a starting point to copy
///                         data from. Set this to `0` if `sourceTexture` isn’t a texture array or a
///                         cube texture.
///   - sourceLevel:        A mipmap level within `sourceTexture`.
///   - destinationTexture: Another ``MTLTexture`` the command copies the data to that has the same
///                         ``MTLTexture/pixelFormat`` and ``MTLTexture/sampleCount`` as `sourceTexture`.
///                         To write the contents into this texture, you need to set its ``MTLTexture/framebufferOnly``
///                         property to <doc://com.apple.documentation/documentation/swift/false>.
///   - destinationSlice:   A slice within `destinationTexture` the command uses as its starting point
///                         for copying data to. Set this to `0` if `destinationTexture` isn’t a texture
///                         array or a cube texture.
///   - destinationLevel:   A mipmap level within `destinationTexture`. The mipmap level you reference needs to
///                         have the same size as the `sourceTexture` slice's mipmap at `sourceLevel`.
///   - sliceCount:         The number of slices the command copies so that it satisfies the conditions
///                         that the sum of `sourceSlice` and `sliceCount` doesn’t exceed the number of
///                         slices in `sourceTexture` and the sum of `destinationSlice` and `sliceCount`
///                         doesn’t exceed the number of slices in `destinationTexture`.
///   - levelCount:         The number of mipmap levels the command copies so that it satisfies the
///                         conditions that the sum of `sourceLevel` and `levelCount` doesn’t exceed the
///                         number of mipmap levels in `sourceTexture` and the sum of `destinationLevel`
///                         and `levelCount` doesn’t exceed the number of mipmap levels in `destinationTexture`.
    copyFromTexture_sourceSlice_sourceLevel_toTexture_destinationSlice_destinationLevel_sliceCount_levelCount_ :: (self: *MTL4ComputeCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, sliceCount: NSUInteger, levelCount: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, sliceCount: NSUInteger, levelCount: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromTexture_sourceSlice_sourceLevel_toTexture_destinationSlice_destinationLevel_sliceCount_levelCount_, sourceTexture, sourceSlice, sourceLevel, destinationTexture, destinationSlice, destinationLevel, sliceCount, levelCount);
    }

/// Encodes a command that copies image data from a slice of a texture into a slice of another texture.
///
/// - Parameters:
///   - sourceTexture:      An ``MTLTexture`` texture that the command copies data from. To read the source
///                         texture contents, you need to set its ``MTLTexture/framebufferOnly`` property
///                         to <doc://com.apple.documentation/documentation/swift/false> prior to drawing into it.
///   - sourceSlice:        A slice within `sourceTexture` the command uses as a starting point to copy
///                         data from. Set this to `0` if `sourceTexture` isn’t a texture array or a
///                         cube texture.
///   - sourceLevel:        A mipmap level within `sourceTexture`.
///   - sourceOrigin:       An ``MTLOrigin`` instance that represents a location within `sourceTexture`
///                         that the command begins copying data from. Assign `0` to each dimension
///                         that’s not relevant to `sourceTexture`.
///   - sourceSize:         An ``MTLSize`` instance that represents the size of the region, in pixels,
///                         that the command copies from `sourceTexture`, starting at `sourceOrigin`.
///                         Assign `1` to each dimension that’s not relevant to `sourceTexture`. If
///                         sourceTexture uses a compressed pixel format, set `sourceSize` to a multiple
///                         of the pixel format’s block size. If the block extends outside the bounds of
///                         the texture, clamp `sourceSize` to the edge of the texture.
///   - destinationTexture: Another ``MTLTexture`` the command copies the data to that has the same
///                         ``MTLTexture/pixelFormat`` and ``MTLTexture/sampleCount`` as `sourceTexture`.
///                         To write the contents into this texture, you need to set its ``MTLTexture/framebufferOnly``
///                         property to <doc://com.apple.documentation/documentation/swift/false>.
///   - destinationSlice:   A slice within `destinationTexture` the command uses as its starting point
///                         for copying data to. Set this to `0` if `destinationTexture` isn’t a texture
///                         array or a cube texture.
///   - destinationLevel:   A mipmap level within `destinationTexture`. The mipmap level you reference needs to
///                         have the same size as the `sourceTexture` slice's mipmap at `sourceLevel`.
///   - destinationOrigin:  An ``MTLOrigin`` instance that represents a location within `destinationTexture`
///                         that the command begins copying data to. Assign `0` to each dimension that’s
///                         not relevant to `destinationTexture`.
    copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_ :: (self: *MTL4ComputeCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> void {
        func: #type (obj: *void, selector: *void, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_, sourceTexture, sourceSlice, sourceLevel, sourceOrigin, sourceSize, destinationTexture, destinationSlice, destinationLevel, destinationOrigin);
    }

/// Encodes a command that copies image data from a slice of an ``MTLTexture`` instance to an ``MTLBuffer`` instance.
///
/// - Parameters:
///   - sourceTexture:            An ``MTLTexture`` texture that the command copies data from. To read the source
///                               texture contents, you need to set its ``MTLTexture/framebufferOnly`` property
///                               to <doc://com.apple.documentation/documentation/swift/false> prior to drawing into it.
///   - sourceSlice:              A slice within `sourceTexture` the command uses as a starting point to copy
///                               data from. Set this to `0` if `sourceTexture` isn’t a texture array or a
///                               cube texture.
///   - sourceLevel:              A mipmap level within `sourceTexture`.
///   - sourceOrigin:             An ``MTLOrigin`` instance that represents a location within `sourceTexture`
///                               that the command begins copying data from. Assign `0` to each dimension
///                               that’s not relevant to `sourceTexture`.
///   - sourceSize:               An ``MTLSize`` instance that represents the size of the region, in pixels,
///                               that the command copies from `sourceTexture`, starting at `sourceOrigin`.
///                               Assign `1` to each dimension that’s not relevant to `sourceTexture`.
///                               If `sourceTexture` uses a compressed pixel format, set `sourceSize` to a
///                               multiple of the `sourceTexture's` ``MTLTexture/pixelFormat`` block size.
///                               If the block extends outside the bounds of the texture, clamp `sourceSize`
///                               to the edge of the texture.
///   - destinationBuffer:        An ``MTLBuffer`` instance the command copies data to.
///   - destinationOffset:        A byte offset within `destinationBuffer` the command copies to. The value
///                               you provide as this argument needs to be a multiple of `sourceTexture's` pixel size,
///                               in bytes.
///   - destinationBytesPerRow:   The number of bytes between adjacent rows of pixels in `destinationBuffer`.
///                               This value must be a multiple of `sourceTexture's` pixel size, in bytes,
///                               and less than or equal to the product of `sourceTexture's` pixel size,
///                               in bytes, and the largest pixel width `sourceTexture’s` type allows. If
///                               `sourceTexture` uses a compressed pixel format, set `destinationBytesPerRow`
///                               to the number of bytes between the starts of two row blocks.
///   - destinationBytesPerImage: The number of bytes between each 2D image of a 3D texture. This value must
///                               be a multiple of `sourceTexture's` pixel size, in bytes. Set this value to
///                               `0` if `sourceSize's` ``MTLSize/depth`` value is `1`.
    copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_ :: (self: *MTL4ComputeCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, destinationBytesPerRow: NSUInteger, destinationBytesPerImage: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, destinationBytesPerRow: NSUInteger, destinationBytesPerImage: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_, sourceTexture, sourceSlice, sourceLevel, sourceOrigin, sourceSize, destinationBuffer, destinationOffset, destinationBytesPerRow, destinationBytesPerImage);
    }

/// Encodes a command that copies image data from a slice of a texture instance to a buffer, with
/// options for special texture formats.
///
/// - Parameters:
///   - sourceTexture:            An ``MTLTexture`` texture that the command copies data from. To read the source
///                               texture contents, you need to set its ``MTLTexture/framebufferOnly`` property
///                               to <doc://com.apple.documentation/documentation/swift/false> prior to drawing into it.
///   - sourceSlice:              A slice within `sourceTexture` the command uses as a starting point to copy
///                               data from. Set this to `0` if `sourceTexture` isn’t a texture array or a
///                               cube texture.
///   - sourceLevel:              A mipmap level within `sourceTexture`.
///   - sourceOrigin:             An ``MTLOrigin`` instance that represents a location within `sourceTexture`
///                               that the command begins copying data from. Assign `0` to each dimension
///                               that’s not relevant to `sourceTexture`.
///   - sourceSize:               An ``MTLSize`` instance that represents the size of the region, in pixels,
///                               that the command copies from `sourceTexture`, starting at `sourceOrigin`.
///                               Assign `1` to each dimension that’s not relevant to `sourceTexture`.
///                               If `sourceTexture` uses a compressed pixel format, set `sourceSize` to a
///                               multiple of the `sourceTexture's` ``MTLTexture/pixelFormat`` block size.
///                               If the block extends outside the bounds of the texture, clamp `sourceSize`
///                               to the edge of the texture.
///   - destinationBuffer:        An ``MTLBuffer`` instance the command copies data to.
///   - destinationOffset:        A byte offset within `destinationBuffer` the command copies to. The value
///                               you provide as this argument needs to be a multiple of `sourceTexture's` pixel size,
///                               in bytes.
///   - destinationBytesPerRow:   The number of bytes between adjacent rows of pixels in `destinationBuffer`.
///                               This value must be a multiple of `sourceTexture's` pixel size, in bytes,
///                               and less than or equal to the product of `sourceTexture's` pixel size,
///                               in bytes, and the largest pixel width `sourceTexture’s` type allows. If
///                               `sourceTexture` uses a compressed pixel format, set `destinationBytesPerRow`
///                               to the number of bytes between the starts of two row blocks.
///   - destinationBytesPerImage: The number of bytes between each 2D image of a 3D texture. This value must
///                               be a multiple of `sourceTexture's` pixel size, in bytes. Set this value to
///                               `0` if `sourceSize's` ``MTLSize/depth`` value is `1`.
///   - options:                  A ``MTLBlitOption`` value that applies to textures with applicable pixel
///                               formats, such as combined depth/stencil or PVRTC formats. If `sourceTexture's`
///                               ``MTLTexture/pixelFormat`` is a combined depth/stencil format, set `options`
///                               to either ``MTLBlitOption/MTLBlitOptionDepthFromDepthStencil`` or
///                               ``MTLBlitOption/MTLBlitOptionStencilFromDepthStencil``, but not both.
///                               If `sourceTexture's` ``MTLTexture/pixelFormat`` is a PVRTC format, set
///                               `options` to ``MTLBlitOption/MTLBlitOptionRowLinearPVRTC``.
    copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_options_ :: (self: *MTL4ComputeCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, destinationBytesPerRow: NSUInteger, destinationBytesPerImage: NSUInteger, options: MTLBlitOption) -> void {
        func: #type (obj: *void, selector: *void, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, destinationBytesPerRow: NSUInteger, destinationBytesPerImage: NSUInteger, options: MTLBlitOption) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_options_, sourceTexture, sourceSlice, sourceLevel, sourceOrigin, sourceSize, destinationBuffer, destinationOffset, destinationBytesPerRow, destinationBytesPerImage, options);
    }

/// Encodes a command that copies data from a buffer instance into another.
///
/// - Parameters:
///   - sourceBuffer:      An ``MTLBuffer`` instance the command copies data from.
///   - sourceOffset:      A byte offset within `sourceBuffer` the command copies from.
///   - destinationBuffer: An ``MTLBuffer`` instance the command copies data to.
///   - destinationOffset: A byte offset within `destinationBuffer` the command copies to.
///   - size:              The number of bytes the command copies from `sourceBuffer` to `destinationBuffer`.
    copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_ :: (self: *MTL4ComputeCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, size: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, size: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_, sourceBuffer, sourceOffset, destinationBuffer, destinationOffset, size);
    }

/// Encodes a command to copy image data from a buffer instance into a texture.
///
/// - Parameters:
///   - sourceBuffer:        A ``MTLBuffer`` instance the command copies data from.
///   - sourceOffset:        A byte offset within `sourceBuffer` the command copies from. Set this value to
///                          a multiple of `destinationTexture's` pixel size, in bytes.
///   - sourceBytesPerRow:   The number of bytes between adjacent rows of pixels in `sourceBuffer`. Set this value to
///                          a multiple of `destinationTexture's` pixel size, in bytes, and less than or equal to
///                          the product of `destinationTexture's` pixel size, in bytes, and the largest pixel width
///                          `destinationTexture's` type allows. If `destinationTexture` uses a compressed pixel format,
///                          set `sourceBytesPerRow` to the number of bytes between the starts of two row blocks.
///   - sourceBytesPerImage: The number of bytes between each 2D image of a 3D texture. Set this value to a
///                          multiple of `destinationTexture's` pixel size, in bytes, or `0`
///                          if `sourceSize's` ``MTLSize/depth`` value is `1`.
///   - sourceSize:          A ``MTLSize`` instance that represents the size of the region in
///                          `destinationTexture`, in pixels, that the command copies data to, starting at
///                          `destinationOrigin`. Assign `1` to each dimension that’s not relevant to
///                          `destinationTexture`. If `destinationTexture` uses a compressed pixel format,
///                          set `sourceSize` to a multiple of `destinationTexture's` ``MTLTexture/pixelFormat``
///                          block size. If the block extends outside the bounds of the texture, clamp
///                          `sourceSize` to the edge of the texture.
///   - destinationTexture:  An ``MTLTexture`` instance the command copies data to. In order to copy the contents into
///                          the destination texture, set its ``MTLTexture/framebufferOnly`` property to
///                          <doc://com.apple.documentation/documentation/swift/false> and don't
///                          use a combined depth/stencil ``MTLTexture/pixelFormat``.
///   - destinationSlice:    A slice within `destinationTexture` the command uses as its starting point for
///                          copying data to. Set this to `0` if `destinationTexture` isn’t a texture array
///                          or a cube texture.
///   - destinationLevel:    A mipmap level within `destinationTexture` the command copies data to.
///   - destinationOrigin:   An ``MTLOrigin`` instance that represents a location within `destinationTexture`
///                          that the command begins copying data to. Assign `0` to each dimension that’s not
///                          relevant to `destinationTexture`.
    copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_ :: (self: *MTL4ComputeCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> void {
        func: #type (obj: *void, selector: *void, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_, sourceBuffer, sourceOffset, sourceBytesPerRow, sourceBytesPerImage, sourceSize, destinationTexture, destinationSlice, destinationLevel, destinationOrigin);
    }

/// Encodes a command to copy image data from a buffer into a texture with options for special texture formats.
///
/// - Parameters:
///   - sourceBuffer:        An ``MTLBuffer`` instance the command copies data from.
///   - sourceOffset:        A byte offset within `sourceBuffer` the command copies from. Set this value to
///                          a multiple of `destinationTexture's` pixel size, in bytes.
///   - sourceBytesPerRow:   The number of bytes between adjacent rows of pixels in `sourceBuffer`. Set this value to
///                          a multiple of `destinationTexture's` pixel size, in bytes, and less than or equal to
///                          the product of `destinationTexture's` pixel size, in bytes, and the largest pixel width
///                          `destinationTexture's` type allows. If `destinationTexture` uses a compressed pixel format,
///                          set `sourceBytesPerRow` to the number of bytes between the starts of two row blocks.
///   - sourceBytesPerImage: The number of bytes between each 2D image of a 3D texture. Set this value to a
///                          multiple of `destinationTexture's` pixel size, in bytes, or `0`
///                          if `sourceSize's` ``MTLSize/depth`` value is `1`.
///   - sourceSize:          An ``MTLSize`` instance that represents the size of the region in
///                          `destinationTexture`, in pixels, that the command copies data to, starting at
///                          `destinationOrigin`. Assign `1` to each dimension that’s not relevant to
///                          `destinationTexture`. If `destinationTexture` uses a compressed pixel format,
///                          set `sourceSize` to a multiple of `destinationTexture's` ``MTLTexture/pixelFormat``
///                          block size. If the block extends outside the bounds of the texture, clamp
///                          `sourceSize` to the edge of the texture.
///   - destinationTexture:  An ``MTLTexture`` instance the command copies data to. In order to copy the contents into
///                          the destination texture, set its ``MTLTexture/framebufferOnly`` property to
///                          <doc://com.apple.documentation/documentation/swift/false> and don't
///                          use a combined depth/stencil ``MTLTexture/pixelFormat``.
///   - destinationSlice:    A slice within `destinationTexture` the command uses as its starting point for
///                          copying data to. Set this to `0` if `destinationTexture` isn’t a texture array
///                          or a cube texture.
///   - destinationLevel:    A mipmap level within `destinationTexture` the command copies data to.
///   - destinationOrigin:   An ``MTLOrigin`` instance that represents a location within `destinationTexture`
///                          that the command begins copying data to. Assign `0` to each dimension that’s not
///                          relevant to `destinationTexture`.
///   - options:             An ``MTLBlitOption`` value that applies to textures with applicable pixel formats,
///                          such as combined depth/stencil or PVRTC formats. If `destinationTexture's`
///                          ``MTLTexture/pixelFormat`` is a combined depth/stencil format, set `options` to
///                          either ``MTLBlitOption/MTLBlitOptionDepthFromDepthStencil`` or
///                          ``MTLBlitOption/MTLBlitOptionStencilFromDepthStencil``, but not both.
///                          If `destinationTexture's` ``MTLTexture/pixelFormat`` is a PVRTC format, set
///                          `options` to ``MTLBlitOption/MTLBlitOptionRowLinearPVRTC``.
    copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_options_ :: (self: *MTL4ComputeCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin, options: MTLBlitOption) -> void {
        func: #type (obj: *void, selector: *void, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin, options: MTLBlitOption) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_options_, sourceBuffer, sourceOffset, sourceBytesPerRow, sourceBytesPerImage, sourceSize, destinationTexture, destinationSlice, destinationLevel, destinationOrigin, options);
    }

/// Encodes a command to copy data from a tensor instance into another.
///
/// If the `sourceTensor` and `destinationTensor` instances are not aliasable, this command applies the correct reshapes
/// to enable this operation.
///
/// - Parameters:
///    - sourceTensor:      An ``MTLTensor`` instance the command copies data from.
///    - sourceSlice:       The slice of `sourceTensor` from which Metal copies data.
///    - destinationTensor: An ``MTLTensor`` instance the command copies data to.
///    - destinationSlice:  The slice of `destinationTensor` to which Metal copies data.
    copyFromTensor_sourceOrigin_sourceDimensions_toTensor_destinationOrigin_destinationDimensions_ :: (self: *MTL4ComputeCommandEncoder, sourceTensor: *MTLTensor, sourceOrigin: *MTLTensorExtents, sourceDimensions: *MTLTensorExtents, destinationTensor: *MTLTensor, destinationOrigin: *MTLTensorExtents, destinationDimensions: *MTLTensorExtents) -> void {
        func: #type (obj: *void, selector: *void, sourceTensor: *MTLTensor, sourceOrigin: *MTLTensorExtents, sourceDimensions: *MTLTensorExtents, destinationTensor: *MTLTensor, destinationOrigin: *MTLTensorExtents, destinationDimensions: *MTLTensorExtents) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyFromTensor_sourceOrigin_sourceDimensions_toTensor_destinationOrigin_destinationDimensions_, sourceTensor, sourceOrigin, sourceDimensions, destinationTensor, destinationOrigin, destinationDimensions);
    }

/// Encodes a command that generates mipmaps for a texture instance from the base mipmap level up to the highest
/// mipmap level.
///
/// This method generates mipmaps for a mipmapped texture. The texture you provide needs to have a
/// ``MTLTexture/mipmapLevelCount`` greater than `1`, and a color-renderable or color-filterable
/// ``MTLTexture/pixelFormat``.
///
/// - Parameter texture: A mipmapped, color-renderable or color-filterable ``MTLTexture`` instance the command generates mipmaps for.
    generateMipmapsForTexture_ :: (self: *MTL4ComputeCommandEncoder, texture: *MTLTexture) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.generateMipmapsForTexture_, texture);
    }

/// Encodes a command that fills a buffer with a constant value for each byte.
///
/// - Parameters:
///   - buffer: A ``MTLBuffer`` instance for which this command assigns each byte in a range to a value.
///   - range:  A range of bytes within `buffer` the command assigns value to. When calling this method, pass in a
///             range with a length greater than `0`.
///   - value:  The value to write to each byte.
    fillBuffer_range_value_ :: (self: *MTL4ComputeCommandEncoder, buffer: *MTLBuffer, range: NSRange, value: u8) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLBuffer, range: NSRange, value: u8) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.fillBuffer_range_value_, buffer, range, value);
    }

/// Encodes a command that modifies the contents of a texture to improve the performance of GPU accesses
/// to its contents.
///
/// Optimizing a texture for GPU access may affect the performance of CPU accesses, however, the data the CPU
/// retrieves from the texture remains consistent.
///
/// You typically run this command for:
/// * Textures the GPU accesses for an extended period of time.
/// * Textures with a ``MTLTextureDescriptor/storageMode`` property that's ``MTLStorageMode/MTLStorageModeShared`` or
///   ``MTLStorageMode/MTLStorageModeManaged``.
///
/// - Parameter texture: A ``MTLTexture`` instance the command optimizes for GPU access.
    optimizeContentsForGPUAccess_ :: (self: *MTL4ComputeCommandEncoder, texture: *MTLTexture) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.optimizeContentsForGPUAccess_, texture);
    }

/// Encodes a command that modifies the contents of a texture instance to improve the performance of GPU accesses
/// to its contents in a specific region.
///
/// Optimizing a texture for GPU access may affect the performance of CPU accesses, however, the data the CPU
/// retrieves from the texture remains consistent.
///
/// You typically run this command for:
/// * Textures the GPU accesses for an extended period of time.
/// * Textures with a ``MTLTextureDescriptor/storageMode`` property that's ``MTLStorageMode/MTLStorageModeShared`` or
///   ``MTLStorageMode/MTLStorageModeManaged``.
///
/// - Parameters:
///   - texture: A ``MTLTexture`` the command optimizes for GPU access.
///   - slice:   A slice within `texture`.
///   - level:   A mipmap level within `texture`.
    optimizeContentsForGPUAccess_slice_level_ :: (self: *MTL4ComputeCommandEncoder, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.optimizeContentsForGPUAccess_slice_level_, texture, slice, level);
    }

/// Encodes a command that modifies the contents of a texture to improve the performance of CPU accesses to
/// its contents.
///
/// Optimizing a texture for CPU access may affect the performance of GPU accesses, however, the data the GPU
/// retrieves from the texture remains consistent.
///
/// You typically use this command for:
/// * Textures the CPU accesses for an extended period of time.
/// * Textures with a ``MTLTextureDescriptor/storageMode`` property that's ``MTLStorageMode/MTLStorageModeShared`` or
///   ``MTLStorageMode/MTLStorageModeManaged``.
///
/// - Parameter texture: A ``MTLTexture`` instance the command optimizes for CPU access.
    optimizeContentsForCPUAccess_ :: (self: *MTL4ComputeCommandEncoder, texture: *MTLTexture) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.optimizeContentsForCPUAccess_, texture);
    }

/// Encodes a command that modifies the contents of a texture to improve the performance of CPU accesses
/// to its contents in a specific region.
///
/// Optimizing a texture for CPU access may affect the performance of GPU accesses, however, the data the GPU
/// retrieves from the texture remains consistent.
///
/// You typically use this command for:
/// * Textures the CPU accesses for an extended period of time.
/// * Textures with a ``MTLTextureDescriptor/storageMode`` property that's ``MTLStorageMode/MTLStorageModeShared`` or
///   ``MTLStorageMode/MTLStorageModeManaged``.
///
/// - Parameters:
///   - texture: A ``MTLTexture`` the command optimizes for CPU access.
///   - slice:   A slice within `texture`.
///   - level:   A mipmap level within `texture`.
    optimizeContentsForCPUAccess_slice_level_ :: (self: *MTL4ComputeCommandEncoder, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.optimizeContentsForCPUAccess_slice_level_, texture, slice, level);
    }

/// Encodes a command that resets a range of commands in an indirect command buffer.
///
/// - Parameters:
///   - buffer: An ``MTLIndirectCommandBuffer`` the command resets.
///   - range: A range of commands within `buffer`.
    resetCommandsInBuffer_withRange_ :: (self: *MTL4ComputeCommandEncoder, buffer: *MTLIndirectCommandBuffer, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, buffer: *MTLIndirectCommandBuffer, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.resetCommandsInBuffer_withRange_, buffer, range);
    }

/// Encodes a command that copies commands from an indirect command buffer into another.
///
/// - Parameters:
///   - source:           An ``MTLIndirectCommandBuffer`` instance from where the command copies.
///   - sourceRange:      The range of commands in `source` to copy.
///                       The copy operation requires that the source range starts at a valid execution point.
///   - destination:      Another ``MTLIndirectCommandBuffer`` instance into which the command copies.
///   - destinationIndex: An index in `destination` into where the command copies content to. The copy operation requires
///                       that the destination index is a valid execution point with enough space left in `destination`
///                       to accommodate `sourceRange.count` commands.
    copyIndirectCommandBuffer_sourceRange_destination_destinationIndex_ :: (self: *MTL4ComputeCommandEncoder, source: *MTLIndirectCommandBuffer, sourceRange: NSRange, destination: *MTLIndirectCommandBuffer, destinationIndex: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, source: *MTLIndirectCommandBuffer, sourceRange: NSRange, destination: *MTLIndirectCommandBuffer, destinationIndex: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyIndirectCommandBuffer_sourceRange_destination_destinationIndex_, source, sourceRange, destination, destinationIndex);
    }

/// Encode a command to attempt to improve the performance of a range of commands within an indirect command buffer.
///
/// - Parameters:
///   - indirectCommandBuffer: An ``MTLIndirectCommandBuffer`` instance that this command optimizes.
///   - range:                 A range of commands within `indirectCommandBuffer`.
    optimizeIndirectCommandBuffer_withRange_ :: (self: *MTL4ComputeCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, range: NSRange) -> void {
        func: #type (obj: *void, selector: *void, indirectCommandBuffer: *MTLIndirectCommandBuffer, range: NSRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.optimizeIndirectCommandBuffer_withRange_, indirectCommandBuffer, range);
    }

/// Sets an argument table for the compute shader stage of this pipeline.
///
/// Metal takes a snapshot of the resources in the argument table when you make dispatch or execute calls on
/// this encoder instance. Metal makes the snapshot contents available to the compute shader function of the
/// current pipeline state.
///
/// - Parameters:
///   - argumentTable: A ``MTL4ArgumentTable`` to set on the command encoder.
    setArgumentTable_ :: (self: *MTL4ComputeCommandEncoder, argumentTable: *MTL4ArgumentTable) -> void {
        func: #type (obj: *void, selector: *void, argumentTable: *MTL4ArgumentTable) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setArgumentTable_, argumentTable);
    }

/// Encodes an acceleration structure build into the command buffer.
///
/// Before you build an instance acceleration structure, you are responsible for ensuring the build operations for all
/// primitive acceleration structures is complete. The built acceleration structure doesn't retain any references to
/// the input buffers of the descriptor, such as the vertex buffer or instance buffer, among others.
///
/// The acceleration structure build process may continue as long as the command buffer is not completed. However,
/// you can safely encode ray tracing work against the acceleration structure if you schedule and synchronize the
/// command buffers that contain this ray tracing work such that the command buffer with the build command is complete
/// by the time ray tracing starts.
///
/// You are responsible for ensuring that the acceleration structure and scratch buffer are at least the size
/// that the query ``MTLDevice/accelerationStructureSizesWithDescriptor:`` returns.
///
/// Use an instance of ``MTLResidencySet`` to mark residency of the scratch buffer the `scratchBuffer` parameter references,
/// as well as for all the primitive acceleration structures you directly and indirectly reference.
///
/// - Parameters:
///   - accelerationStructure: Acceleration structure storage to build into.
///   - descriptor:            A descriptor for the acceleration structure Metal builds.
///   - scratchBuffer:         Scratch buffer Metal can use while building the acceleration structure.
///                            Metal may overwrite the contents of this buffer, and you should consider
///                            them "undefined" after the refit operation starts and completes.
    buildAccelerationStructure_descriptor_scratchBuffer_ :: (self: *MTL4ComputeCommandEncoder, accelerationStructure: *MTLAccelerationStructure, descriptor: *MTL4AccelerationStructureDescriptor, scratchBuffer: MTL4BufferRange) -> void {
        func: #type (obj: *void, selector: *void, accelerationStructure: *MTLAccelerationStructure, descriptor: *MTL4AccelerationStructureDescriptor, scratchBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.buildAccelerationStructure_descriptor_scratchBuffer_, accelerationStructure, descriptor, scratchBuffer);
    }

/// Encodes an acceleration structure refit into the command buffer.
///
/// You refit an acceleration structure to update it when the geometry it references changes. This operation is typically
/// much faster than rebuilding the acceleration structure from scratch. The trade off is that after you refit the
/// acceleration structure, its quality, as well as the performance of any subsequent ray tracing operation degrades,
/// depending on how much the geometry changes.
///
/// After certain operations, refitting an acceleration structure may not be possible, for example, after adding or
/// removing geometry.
///
/// When you refit an acceleration structure, you can do so in place, by specifying the same source and destination
/// acceleration structures, or by providing a `nil` destination acceleration structure. If the source and destination
/// acceleration structures aren't the same, then you are responsible for ensuring they don't overlap in memory.
///
/// Typically, the destination acceleration structure is at least as large as the source acceleration structure,
/// except in cases where you compact the source acceleration structure. In this case, you need to allocate the
/// destination acceleration to be at least as large as the compacted size of the source acceleration structure.
///
/// The scratch buffer you provide for the refit operation needs to be at least as large as the size that the query
/// ``MTLDevice/accelerationStructureSizesWithDescriptor:`` returns. If the size this query returns is zero, you
/// can omit providing a scratch buffer by passing `0` as the address to the `scratchBuffer` parameter.
///
/// Use an instance of ``MTLResidencySet`` to mark residency of the scratch buffer the `scratchBuffer` parameter references,
/// as well as for all the instance and primitive acceleration structures you directly and indirectly reference.
///
/// - Parameters:
///   - sourceAccelerationStructure:      Acceleration structure to refit.
///   - descriptor:                       A descriptor for the acceleration structure to refit.
///   - destinationAccelerationStructure: Acceleration structure to store the refit result into.
///                                       If `destinationAccelerationStructure` is `nil`, Metal performs an in-place
///                                       refit operation of the `sourceAccelerationStructure`.
///   - scratchBuffer:                    Scratch buffer Metal can use while refitting the acceleration structure.
///                                       Metal may overwrite the contents of this buffer, and you should consider
///                                       them "undefined" after the refit operation starts and completes.
    refitAccelerationStructure_descriptor_destination_scratchBuffer_ :: (self: *MTL4ComputeCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, descriptor: *MTL4AccelerationStructureDescriptor, destinationAccelerationStructure: *MTLAccelerationStructure, scratchBuffer: MTL4BufferRange) -> void {
        func: #type (obj: *void, selector: *void, sourceAccelerationStructure: *MTLAccelerationStructure, descriptor: *MTL4AccelerationStructureDescriptor, destinationAccelerationStructure: *MTLAccelerationStructure, scratchBuffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.refitAccelerationStructure_descriptor_destination_scratchBuffer_, sourceAccelerationStructure, descriptor, destinationAccelerationStructure, scratchBuffer);
    }

/// Encodes an acceleration structure refit operation into the command buffer, providing additional options.
///
/// You refit an acceleration structure to update it when the geometry it references changes. This operation is typically
/// much faster than rebuilding the acceleration structure from scratch. The trade off is that after you refit the
/// acceleration structure, its quality, as well as the performance of any subsequent ray tracing operation degrades,
/// depending on how much the geometry changes.
///
/// After certain operations, refitting an acceleration structure may not be possible, for example, after adding or
/// removing geometry.
///
/// When you refit an acceleration structure, you can do so in place, by specifying the same source and destination
/// acceleration structures, or by providing a `nil` destination acceleration structure. If the source and destination
/// acceleration structures aren't the same, then you are responsible for ensuring they don't overlap in memory.
///
/// Typically, the destination acceleration structure is at least as large as the source acceleration structure,
/// except in cases where you compact the source acceleration structure. In this case, you need to allocate the
/// destination acceleration to be at least as large as the compacted size of the source acceleration structure.
///
/// The scratch buffer you provide for the refit operation needs to be at least as large as the size that the query
/// ``MTLDevice/accelerationStructureSizesWithDescriptor:`` returns. If the size this query returns is zero, you
/// can omit providing a scratch buffer by passing `0` as the address to the `scratchBuffer` parameter.
///
/// Use an instance of ``MTLResidencySet`` to mark residency of the scratch buffer the `scratchBuffer` parameter references,
/// as well as for all the instance and primitive acceleration structures you directly and indirectly reference.
///
/// - Parameters:
///   - sourceAccelerationStructure:      Acceleration structure to refit.
///   - descriptor:                       A descriptor for the acceleration structure to refit.
///   - destinationAccelerationStructure: Acceleration structure to store the refit result into.
///                                       If `destinationAccelerationStructure` is `nil`, Metal performs an in-place
///                                       refit operation of the `sourceAccelerationStructure`.
///   - scratchBuffer:                    Scratch buffer Metal can use while refitting the acceleration structure.
///                                       Metal may overwrite the contents of this buffer, and you should consider
///                                       them "undefined" after the refit operation starts and completes.
///   - options:                          Options specifying the elements of the acceleration structure to refit.
    refitAccelerationStructure_descriptor_destination_scratchBuffer_options_ :: (self: *MTL4ComputeCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, descriptor: *MTL4AccelerationStructureDescriptor, destinationAccelerationStructure: *MTLAccelerationStructure, scratchBuffer: MTL4BufferRange, options: MTLAccelerationStructureRefitOptions) -> void {
        func: #type (obj: *void, selector: *void, sourceAccelerationStructure: *MTLAccelerationStructure, descriptor: *MTL4AccelerationStructureDescriptor, destinationAccelerationStructure: *MTLAccelerationStructure, scratchBuffer: MTL4BufferRange, options: MTLAccelerationStructureRefitOptions) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.refitAccelerationStructure_descriptor_destination_scratchBuffer_options_, sourceAccelerationStructure, descriptor, destinationAccelerationStructure, scratchBuffer, options);
    }

/// Encodes an acceleration structure copy operation into the command buffer.
///
/// You are responsible for ensuring the source and destination acceleration structures don't overlap in memory.
/// If this is an instance acceleration structure, Metal preserves references to the primitive acceleration structures
/// it references.
///
/// Typically, the destination acceleration structure is at least as large as the source acceleration structure,
/// except in cases where you compact the source acceleration structure. In this case, you need to allocate the
/// destination acceleration to be at least as large as the compacted size of the source acceleration structure.
///
/// - Parameters:
///   - sourceAccelerationStructure:      Acceleration structure to copy from.
///   - destinationAccelerationStructure: Acceleration structure to copy to.
    copyAccelerationStructure_toAccelerationStructure_ :: (self: *MTL4ComputeCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, destinationAccelerationStructure: *MTLAccelerationStructure) -> void {
        func: #type (obj: *void, selector: *void, sourceAccelerationStructure: *MTLAccelerationStructure, destinationAccelerationStructure: *MTLAccelerationStructure) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyAccelerationStructure_toAccelerationStructure_, sourceAccelerationStructure, destinationAccelerationStructure);
    }

/// Encodes a command to compute the size an acceleration structure can compact into, writing the result
/// into a buffer.
///
/// This size is potentially smaller than the acceleration structure. To perform compaction, you typically read
/// this size from the buffer once the command buffer completes. You then use it to allocate a new, potentially
/// smaller acceleration structure. Finally, you call the ``copyAndCompactAccelerationStructure:toAccelerationStructure:``
/// method to perform the copy.
///
/// - Parameters:
///   - accelerationStructure: Source acceleration structure.
///   - buffer:                Destination size buffer. Metal writes the compacted size as a 64-bit unsigned integer
///                            value, representing the compacted size in bytes.
    writeCompactedAccelerationStructureSize_toBuffer_ :: (self: *MTL4ComputeCommandEncoder, accelerationStructure: *MTLAccelerationStructure, buffer: MTL4BufferRange) -> void {
        func: #type (obj: *void, selector: *void, accelerationStructure: *MTLAccelerationStructure, buffer: MTL4BufferRange) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.writeCompactedAccelerationStructureSize_toBuffer_, accelerationStructure, buffer);
    }

/// Encodes a command to copy and compact an acceleration structure.
///
/// You are responsible for ensuring that the source and destination acceleration structures don't overlap in memory.
/// If this is an instance acceleration structure, Metal preserves references to primitive acceleration structures it
/// references.
///
/// This operation requires that the destination acceleration structure is at least as large as the compacted size of
/// the source acceleration structure. You can compute this size by calling the
/// ``writeCompactedAccelerationStructureSize:toBuffer:`` method.
///
/// - Parameters:
///   - sourceAccelerationStructure:      Acceleration structure to copy and compact.
///   - destinationAccelerationStructure: Acceleration structure to copy to.
    copyAndCompactAccelerationStructure_toAccelerationStructure_ :: (self: *MTL4ComputeCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, destinationAccelerationStructure: *MTLAccelerationStructure) -> void {
        func: #type (obj: *void, selector: *void, sourceAccelerationStructure: *MTLAccelerationStructure, destinationAccelerationStructure: *MTLAccelerationStructure) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.copyAndCompactAccelerationStructure_toAccelerationStructure_, sourceAccelerationStructure, destinationAccelerationStructure);
    }

/// Writes a GPU timestamp into a heap.
///
/// The method ensures that any prior work finishes, but doesn't delay any subsequent work.
///
/// You can alter this command's behavior through the `granularity` parameter.
/// - Pass ``MTL4TimestampGranularity/MTL4TimestampGranularityRelaxed`` to allow Metal to provide timestamps with
/// minimal impact to runtime performance, but with less detail. For example, the command may group all timestamps for
/// a pass together.
/// - Pass ``MTL4TimestampGranularity/MTL4TimestampGranularityPrecise`` to request that Metal provides timestamps
/// with the most detail. This can affect runtime performance.
///
/// - Parameters:
///   - granularity: ``MTL4TimestampGranularity`` hint to Metal about acceptable the level of precision.
///   - counterHeap: ``MTL4CounterHeap`` to write timestamps into.
///   - index:       The index value into which Metal writes the timestamp.
    writeTimestampWithGranularity_intoHeap_atIndex_ :: (self: *MTL4ComputeCommandEncoder, granularity: MTL4TimestampGranularity, counterHeap: *MTL4CounterHeap, index: NSUInteger) -> void {
        func: #type (obj: *void, selector: *void, granularity: MTL4TimestampGranularity, counterHeap: *MTL4CounterHeap, index: NSUInteger) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.writeTimestampWithGranularity_intoHeap_atIndex_, granularity, counterHeap, index);
    }

}

/// Encodes commands for dispatching machine learning networks on Apple silicon.
MTL4MachineLearningCommandEncoder :: struct #type_info_no_size_complaint {
/// Configures the encoder with a machine learning pipeline state instance.
///
/// The pipeline state instance affects all subsequent Machine Learning commands.
///
/// - Parameters:
///   - pipelineState: A Machine Learning pipeline state instance.
    setPipelineState_ :: (self: *MTL4MachineLearningCommandEncoder, pipelineState: *MTL4MachineLearningPipelineState) -> void {
        func: #type (obj: *void, selector: *void, pipelineState: *MTL4MachineLearningPipelineState) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setPipelineState_, pipelineState);
    }

/// Sets an argument table for the command encoder's machine learning shader stage.
///
/// The argument table provides inputs to all subsequent Machine Learning dispatches.
/// - Parameters:
///   - argumentTable: An argument table to set on the command encoder's Machine Learning stage.
    setArgumentTable_ :: (self: *MTL4MachineLearningCommandEncoder, argumentTable: *MTL4ArgumentTable) -> void {
        func: #type (obj: *void, selector: *void, argumentTable: *MTL4ArgumentTable) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.setArgumentTable_, argumentTable);
    }

/// Dispatches a machine learning network using the current pipeline state and argument table.
///
/// This method takes a parameter consisting of a `MTLHeap` that Metal can use to allocate intermediate tensors.
/// You can query the minimum size Metal requires for this heap by calling
/// ``MTL4MachineLearningPipelineState/intermediatesHeapSize``.
///
/// - Parameters:
///   - heap: a heap that Metal can use to allocate intermediate tensors.
    dispatchNetworkWithIntermediatesHeap_ :: (self: *MTL4MachineLearningCommandEncoder, heap: *MTLHeap) -> void {
        func: #type (obj: *void, selector: *void, heap: *MTLHeap) -> void #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.dispatchNetworkWithIntermediatesHeap_, heap);
    }

}

/// A pipeline state that you can use with machine-learning encoder instances.
///
/// See ``MTL4MachineLearningCommandEncoder`` for more information.
MTL4MachineLearningPipelineState :: struct #type_info_no_size_complaint {
/// Queries the string that helps identify this object.
    label :: (self: *MTL4MachineLearningPipelineState) -> *NSString {
        func: #type (obj: *void, selector: *void) -> *NSString #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.label);
    }

/// Returns the device the pipeline state belongs to.
    device :: (self: *MTL4MachineLearningPipelineState) -> *MTLDevice {
        func: #type (obj: *void, selector: *void) -> *MTLDevice #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.device);
    }

/// Returns reflection information for this machine learning pipeline state.
    reflection :: (self: *MTL4MachineLearningPipelineState) -> *MTL4MachineLearningPipelineReflection {
        func: #type (obj: *void, selector: *void) -> *MTL4MachineLearningPipelineReflection #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.reflection);
    }

/// Obtain the size of the heap, in bytes, this pipeline requires during the execution.
///
/// Use this value to allocate a ``MTLHeap`` instance of sufficient size that you can then provide to
/// ``MTL4MachineLearningCommandEncoder/dispatchNetworkWithIntermediatesHeap:``.
///
/// Metal uses this heap to store intermediate data as it executes the pipeline. It is your responsibility to provide
/// a heap at least as large as this property requests.
    intermediatesHeapSize :: (self: *MTL4MachineLearningPipelineState) -> NSUInteger {
        func: #type (obj: *void, selector: *void) -> NSUInteger #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.intermediatesHeapSize);
    }

}

/// A fast-addition container for collecting data during pipeline state creation.
///
/// Pipeline data serializer instances allow you to create binary archives and serialize pipeline scripts to use with
/// the offline Metal binary generator (`metal-tt`) <doc:compiling-binary-archives-from-a-custom-configuration-script.md>.
///
/// You capture and retain all relevant data for all pipelines a compiler instance creates by providing an instance of
/// this object to its ``MTL4CompilerDescriptor``.
///
/// After capturing data, you can serialize it to a binary archive to persist its contents offline by calling
/// ``serializeAsArchiveAndFlushToURL:error:``. You can also serialize a pipeline script suitable for the offline binary
/// generator (`metal-tt`) by calling ``serializeAsPipelinesScriptWithError:``
///
/// - Note: The objects ``MTL4PipelineDataSetSerializer`` contains are opaque and can't accelerate compilation for
/// compilers they are not attached to. Additionally, your program can't read data out of data set serializer instances.
MTL4PipelineDataSetSerializer :: struct #type_info_no_size_complaint {
/// Serializes a pipeline data set to an archive.
///
/// - Parameters:
///   - url: the URL used to serialize the serializer data set as an archive to.
///   - error: an optional parameter to store information in case of an error.
/// - Returns: a boolean indicating whether the operation was successful.
    serializeAsArchiveAndFlushToURL_error_ :: (self: *MTL4PipelineDataSetSerializer, url: *NSURL, error: **NSError) -> BOOL {
        func: #type (obj: *void, selector: *void, url: *NSURL, error: **NSError) -> BOOL #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.serializeAsArchiveAndFlushToURL_error_, url, error);
    }

/// Serializes a serializer data set to a pipeline script as raw data.
///
/// - Parameters:
///   - error: an optional parameter to store information in case of an error.
/// - Returns: an `NSData` instance containing the pipeline script.
    serializeAsPipelinesScriptWithError_ :: (self: *MTL4PipelineDataSetSerializer, error: **NSError) -> *NSData {
        func: #type (obj: *void, selector: *void, error: **NSError) -> *NSData #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.serializeAsPipelinesScriptWithError_, error);
    }

}

/// A read-only container that stores pipeline states from a shader compiler.
///
/// The pipeline states can have intermediate representation (IR) binaries,
/// GPU- and system-specific binaries, or a combination.
///
/// ## Topics
///
/// ### Identifying the archive
/// - ``label``
///
/// ### Creating compute pipeline states
///
/// - ``newComputePipelineStateWithDescriptor:dynamicLinkingDescriptor:error:``
/// - ``newComputePipelineStateWithDescriptor:error:``
/// - ``newComputePipelineStateWithName:dynamicLinkingDescriptor:error:``
/// - ``newComputePipelineStateWithName:error:``
///
/// ### Creating render pipeline states
///
/// - ``newRenderPipelineStateWithDescriptor:dynamicLinkingDescriptor:error:``
/// - ``newRenderPipelineStateWithDescriptor:error:``
/// - ``newRenderPipelineStateWithName:dynamicLinkingDescriptor:error:``
/// - ``newRenderPipelineStateWithName:error:``
///
/// ### Creating binary functions
///
/// - ``newBinaryFunctionWithDescriptor:functionType:error:``
MTL4Archive :: struct #type_info_no_size_complaint {
/// Creates a compute pipeline state from the archive with a descriptor.
///
/// - Parameters:
///   - descriptor: A compute pipeline descriptor.
///   - error: On return, if the method fails, a pointer to an error information instance; otherwise `nil`.
///
/// - Returns: A compute pipeline state if the method succeeds, otherwise `nil`.
    newComputePipelineStateWithDescriptor_error_ :: (self: *MTL4Archive, descriptor: *MTL4ComputePipelineDescriptor, error: **NSError) -> *MTLComputePipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4ComputePipelineDescriptor, error: **NSError) -> *MTLComputePipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newComputePipelineStateWithDescriptor_error_, descriptor, error);
    }

/// Creates a compute pipeline state from the archive with a compute descriptor and a dynamic linking descriptor.
///
/// - Parameters:
///   - descriptor: A compute pipeline descriptor.
///   - dynamicLinkingDescriptor: A descriptor that provides additional properties
///   to link other functions with the pipeline.
///   - error: On return, if the method fails, a pointer to an error information instance; otherwise `nil`.
///
/// - Returns: A compute pipeline state if the method succeeds, otherwise `nil`.
    newComputePipelineStateWithDescriptor_dynamicLinkingDescriptor_error_ :: (self: *MTL4Archive, descriptor: *MTL4ComputePipelineDescriptor, dynamicLinkingDescriptor: *MTL4PipelineStageDynamicLinkingDescriptor, error: **NSError) -> *MTLComputePipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4ComputePipelineDescriptor, dynamicLinkingDescriptor: *MTL4PipelineStageDynamicLinkingDescriptor, error: **NSError) -> *MTLComputePipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newComputePipelineStateWithDescriptor_dynamicLinkingDescriptor_error_, descriptor, dynamicLinkingDescriptor, error);
    }

/// Creates a render pipeline state from the archive with a descriptor.
///
/// You create any kind of render pipeline states with this method, including:
/// - Traditional render pipelines
/// - Mesh render pipelines
/// - Tile render pipelines
///
/// - Parameters:
///   - descriptor: A render pipeline descriptor.
///   - error: On return, if the method fails, a pointer to an error information instance; otherwise `nil`.
///
/// - Returns: A render pipeline state if the method succeeds, otherwise `nil`.
    newRenderPipelineStateWithDescriptor_error_ :: (self: *MTL4Archive, descriptor: *MTL4PipelineDescriptor, error: **NSError) -> *MTLRenderPipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4PipelineDescriptor, error: **NSError) -> *MTLRenderPipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithDescriptor_error_, descriptor, error);
    }

/// Creates a render pipeline state from the archive with a render descriptor and a dynamic linking descriptor.
///
/// You create any kind of render pipeline states with this method, including:
/// - Traditional render pipelines
/// - Mesh render pipelines
/// - Tile render pipelines
///
/// - Parameters:
///   - descriptor: A render pipeline descriptor.
///   - dynamicLinkingDescriptor: A descriptor that provides additional properties
///   to link other functions with the pipeline.
///   - error: On return, if the method fails, a pointer to an error information instance; otherwise `nil`.
///
/// - Returns: A render pipeline state if the method succeeds, otherwise `nil`.
    newRenderPipelineStateWithDescriptor_dynamicLinkingDescriptor_error_ :: (self: *MTL4Archive, descriptor: *MTL4PipelineDescriptor, dynamicLinkingDescriptor: *MTL4RenderPipelineDynamicLinkingDescriptor, error: **NSError) -> *MTLRenderPipelineState {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4PipelineDescriptor, dynamicLinkingDescriptor: *MTL4RenderPipelineDynamicLinkingDescriptor, error: **NSError) -> *MTLRenderPipelineState #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newRenderPipelineStateWithDescriptor_dynamicLinkingDescriptor_error_, descriptor, dynamicLinkingDescriptor, error);
    }

/// Synchronously creates a binary version of a GPU visible function or GPU intersection function.
///
/// - Parameters:
///   - descriptor: A configuration that tells the method which GPU function to
///   make into a binary function and which options to apply when compiling it.
///   - error: An optional pointer to an error pointer where the method returns
///   the problem details when it can't create a binary GPU function.
///
/// - Returns: A new GPU binary function instance if the method succeeds; otherwise `nil`.
    newBinaryFunctionWithDescriptor_error_ :: (self: *MTL4Archive, descriptor: *MTL4BinaryFunctionDescriptor, error: **NSError) -> *MTL4BinaryFunction {
        func: #type (obj: *void, selector: *void, descriptor: *MTL4BinaryFunctionDescriptor, error: **NSError) -> *MTL4BinaryFunction #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.newBinaryFunctionWithDescriptor_error_, descriptor, error);
    }

/// A label that you can associate with this archive.
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

/* CAMetalDrawable represents a displayable buffer that vends an object
 * that conforms to the MTLTexture protocol that may be used to create
 * a render target for Metal.
 *
 * Note: CAMetalLayer maintains an internal pool of textures used for
 * display. In order for a texture to be re-used for a new CAMetalDrawable,
 * any prior CAMetalDrawable must have been deallocated and another
 * CAMetalDrawable presented. */
CAMetalDrawable :: struct #type_info_no_size_complaint {
/* This is an object that conforms to the MTLTexture protocol and will
 * typically be used to create an MTLRenderTargetDescriptor. */
    texture :: (self: *CAMetalDrawable) -> *MTLTexture {
        func: #type (obj: *void, selector: *void) -> *MTLTexture #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.texture);
    }

/* This is the CAMetalLayer responsible for displaying the drawable */
    layer :: (self: *CAMetalDrawable) -> *CAMetalLayer {
        func: #type (obj: *void, selector: *void) -> *CAMetalLayer #c_call;
        func = xx objc_msgSend;
        return func(self, __sel.layer);
    }

}

