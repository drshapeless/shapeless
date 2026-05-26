/*!
 @brief Returns a reference to the preferred system default Metal device.
 @discussion On Mac OS X systems that support automatic graphics switching, calling
 this API to get a Metal device will cause the system to switch to the high power
 GPU.  On other systems that support more than one GPU it will return the GPU that
 is associated with the main display.
 */
MTLCreateSystemDefaultDevice :: () -> *MTLDevice #foreign Metal;
/*!
 @brief Returns all Metal devices in the system.
 @discussion On macOS and macCatalyst, this API will not cause the system to switch devices and leaves the decision about which GPU to use up to the application based on whatever criteria it deems appropriate.
 On iOS, tvOS and visionOS, this API returns an array containing the same device that MTLCreateSystemDefaultDevice would have returned, or an empty array if it would have failed.
*/
MTLCopyAllDevices :: () -> *NSArray(*MTLDevice) #foreign Metal;
/*!
 @brief Returns an NSArray of the current set of available Metal devices and installs a notification handler
 to be notified of any further changes (additions, removals, etc.).  The observer return value is retained by Metal and may be
 passed to MTLRemoveDeviceObserver() if the application no longer wishes to receive notifications.
 @note The observer out parameter is returned with a +1 retain count in addition to the retain mentioned above.
*/
MTLCopyAllDevicesWithObserver :: (observer: **NSObject, handler: MTLDeviceNotificationHandler) -> *NSArray(*MTLDevice) #foreign Metal;
/*!
 @brief Removes a previously installed observer for device change notifications.
*/
MTLRemoveDeviceObserver :: (observer: *NSObject) -> void #foreign Metal;
/*
 @function MTLIOCompressionContextDefaultChunkSize
 @abstract The default chunk size to use for a compression context.
 */
MTLIOCompressionContextDefaultChunkSize :: () -> u64 #foreign Metal;
/*
 @function MTLIOCreateCompressionContext
 @abstract used to create a context that writes a stream of data to
 a path using a given codec and chunk size.
 @discussion An invalid type will cause a nil to be returned. If path is
 invalid or fails to open a nil will be returned and errno will be set.
 */
MTLIOCreateCompressionContext :: (path: *s8, type: MTLIOCompressionMethod, chunkSize: u64) -> MTLIOCompressionContext #foreign Metal;
/*
 @function MTLIOCompressionContextAppendData
 @abstract append data to a compression context.
 */
MTLIOCompressionContextAppendData :: (ctx: MTLIOCompressionContext, data: *void, size: u64) -> void #foreign Metal;
/*
 @function MTLIOFlushAndDestroyCompressionContext
 @abstract close the compression context and write the pack file.
 */
MTLIOFlushAndDestroyCompressionContext :: (ctx: MTLIOCompressionContext) -> MTLIOCompressionStatus #foreign Metal;
