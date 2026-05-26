/// An error domain for errors that pertain to creating a tensor.
MTLTensorDomain: NSErrorDomain #elsewhere Metal;
/*!
 @constant MTLLibraryErrorDomain
 @abstract NSErrors raised when creating a library.
 */
MTLLibraryErrorDomain: NSErrorDomain #elsewhere Metal;
MTLCommonCounterTimestamp: *NSString #elsewhere Metal;
MTLCommonCounterTessellationInputPatches: *NSString #elsewhere Metal;
MTLCommonCounterVertexInvocations: *NSString #elsewhere Metal;
MTLCommonCounterPostTessellationVertexInvocations: *NSString #elsewhere Metal;
MTLCommonCounterClipperInvocations: *NSString #elsewhere Metal;
MTLCommonCounterClipperPrimitivesOut: *NSString #elsewhere Metal;
MTLCommonCounterFragmentInvocations: *NSString #elsewhere Metal;
MTLCommonCounterFragmentsPassed: *NSString #elsewhere Metal;
MTLCommonCounterComputeKernelInvocations: *NSString #elsewhere Metal;
MTLCommonCounterTotalCycles: *NSString #elsewhere Metal;
MTLCommonCounterVertexCycles: *NSString #elsewhere Metal;
MTLCommonCounterTessellationCycles: *NSString #elsewhere Metal;
MTLCommonCounterPostTessellationVertexCycles: *NSString #elsewhere Metal;
MTLCommonCounterFragmentCycles: *NSString #elsewhere Metal;
MTLCommonCounterRenderTargetWriteCycles: *NSString #elsewhere Metal;
MTLCommonCounterSetTimestamp: *NSString #elsewhere Metal;
MTLCommonCounterSetStageUtilization: *NSString #elsewhere Metal;
MTLCommonCounterSetStatistic: *NSString #elsewhere Metal;
/*!
 @constant MTLCounterErrorDomain
 @abstract NSErrors raised when creating a counter sample buffer.
 */
MTLCounterErrorDomain: NSErrorDomain #elsewhere Metal;
/*!
 @brief This notification is posted when a new Metal device is added to the system
*/
MTLDeviceWasAddedNotification: MTLDeviceNotificationName #elsewhere Metal;
/*!
 @brief This notification is posted when the user has requested that applications cease using a particular device.  Applications
 should assume that the device will be removed (terminated) imminently.  Additionally, the device will be removed from the internal
 device array prior to this notification being posted.  Applications should immediately begin the process of releasing all resources
 created on the given device, as well as any references to the device itself.
*/
MTLDeviceRemovalRequestedNotification: MTLDeviceNotificationName #elsewhere Metal;
/*!
 @brief This notification is posted if the device is removed while there are still outstanding references to it, due to either a surprise
  or forced disconnect by the user.  Applications must expect that any attempt to use the device after this point will fail.
*/
MTLDeviceWasRemovedNotification: MTLDeviceNotificationName #elsewhere Metal;
MTLDeviceErrorDomain: NSErrorDomain #elsewhere Metal;
/*!
 @constant MTLCommandBufferErrorDomain
 @abstract An error domain for NSError objects produced by MTLCommandBuffer
 */
MTLCommandBufferErrorDomain: NSErrorDomain #elsewhere Metal;
/*!
 @abstract Key in the userInfo for MTLCommandBufferError NSErrors. Value is an NSArray of MTLCommandBufferEncoderInfo objects in recorded order if an appropriate MTLCommandBufferErrorOption was set, otherwise the key will not exist in the userInfo dictionary.
 */
MTLCommandBufferEncoderInfoErrorKey: NSErrorUserInfoKey #elsewhere Metal;
/*!
  @brief
    when a MTLVertexBufferLayoutDescriptor has its stride set to this value,
    the stride will be dynamic and must be set explicitly when binding a buffer
    to a render command encoder.
*/
MTLBufferLayoutStrideDynamic: NSUInteger : 18446744073709551615;
/*
 @brief
     When calling functions with an `attributeStrides:` parameter on a render
     or compute command encoder, this value must be provided for the binding
     points that are either not part of the set of MTLBufferLayoutDescriptor,
     or whose stride values in the descriptor is not set to
     `MTLBufferLayoutStrideDynamic`
*/
MTLAttributeStrideStatic: NSUInteger : 18446744073709551615;
MTL4CommandQueueErrorDomain: NSErrorDomain #elsewhere Metal;
MTLCaptureErrorDomain: NSErrorDomain #elsewhere Metal;
MTLDynamicLibraryDomain: NSErrorDomain #elsewhere Metal;
MTLLogStateErrorDomain: NSErrorDomain #elsewhere Metal;
MTLBinaryArchiveDomain: NSErrorDomain #elsewhere Metal;
MTLIOErrorDomain: NSErrorDomain #elsewhere Metal;
