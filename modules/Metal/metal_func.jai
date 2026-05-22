MTLCreateSystemDefaultDevice :: () -> *MTLDevice #foreign Metal;
MTLCopyAllDevices :: () -> *NSArray(*MTLDevice) #foreign Metal;
MTLCopyAllDevicesWithObserver :: (observer: **NSObject, handler: MTLDeviceNotificationHandler) -> *NSArray(*MTLDevice) #foreign Metal;
MTLRemoveDeviceObserver :: (observer: *NSObject) -> void #foreign Metal;
MTLIOCompressionContextDefaultChunkSize :: () -> u64 #foreign Metal;
MTLIOCreateCompressionContext :: (path: *s8, type: MTLIOCompressionMethod, chunkSize: u64) -> MTLIOCompressionContext #foreign Metal;
MTLIOCompressionContextAppendData :: (ctx: MTLIOCompressionContext, data: *void, size: u64) -> void #foreign Metal;
MTLIOFlushAndDestroyCompressionContext :: (ctx: MTLIOCompressionContext) -> MTLIOCompressionStatus #foreign Metal;
