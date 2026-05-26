/*!
 @typedef MTLCoordinate2D
 @abstract A floating point coordinate in an abstract 2D space.
 Refer to location of use for concrete information on the space in which the coordinate exists.
 */
MTLCoordinate2D :: MTLSamplePosition;
/// A 64-bit unsigned integer type appropriate for storing GPU addresses.
MTLGPUAddress :: u64;
MTLArgumentAccess :: MTLBindingAccess;
/* Convenience typedefs that make it easy to declare storage for certain return types. */
MTLAutoreleasedRenderPipelineReflection :: *MTLRenderPipelineReflection;
MTLAutoreleasedComputePipelineReflection :: *MTLComputePipelineReflection;
MTLNewLibraryCompletionHandler :: #type (library: *MTLLibrary, error: *NSError) -> void #c_call;
MTLNewRenderPipelineStateCompletionHandler :: #type (renderPipelineState: *MTLRenderPipelineState, error: *NSError) -> void #c_call;
MTLNewRenderPipelineStateWithReflectionCompletionHandler :: #type (renderPipelineState: *MTLRenderPipelineState, reflection: *MTLRenderPipelineReflection, error: *NSError) -> void #c_call;
MTLNewComputePipelineStateCompletionHandler :: #type (computePipelineState: *MTLComputePipelineState, error: *NSError) -> void #c_call;
MTLNewComputePipelineStateWithReflectionCompletionHandler :: #type (computePipelineState: *MTLComputePipelineState, reflection: *MTLComputePipelineReflection, error: *NSError) -> void #c_call;
MTLNewDynamicLibraryCompletionHandler :: #type (library: *MTLDynamicLibrary, error: *NSError) -> void #c_call;
MTLAutoreleasedArgument :: *MTLArgument;
/*!
 @enum MTLCommonCounter
 @abstract Common counters that, when present, are expected to have similar meanings across
 different implementations.
 @constant MTLCommonCounterTimestamp The GPU time when the sample is taken.
 @constant MTLCommonCounterTessellationInputPatches The number of patches input to the tessellator.
 @constant MTLCommonCounterVertexInvocations The number of times the vertex shader was invoked.
 @constant MTLCommonCounterPostTessellationVertexInvocations The number of times the post tessellation vertex shader was invoked.
 @constant MTLCommonCounterClipperInvocations The number of primitives passed to the clipper.
 @constant MTLCommonCounterClipperPrimitivesOut The number of primitives output from the clipper.
 @constant MTLCommonCounterFragmentInvocations The number of times the fragment shader was invoked.
 @constant MTLCommonCounterFragmentsPassed The number of fragments that passed Depth, Stencil, and Scissor tests.
 @constant MTLCommonCounterComputeKernelInvocations The number of times the computer kernel was invoked.
 @constant MTLCommonCounterTotalCycles The total number of cycles.
 @constant MTLCommonCounterVertexCycles The amount of cycles the vertex shader was running.
 @constant MTLCommonCounterTessellationCycles The amount of cycles spent in the tessellator.
 @constant MTLCommonCounterPostTessellationVertexCycles The amount of cycles the post tessellation vertex shader was running.
 @constant MTLCommonCounterFragmentCycles The amount of cycles the fragment shader was running.
 @constant MTLCommonCounterRenderTargetWriteCycles The amount of cycles spent writing to the render targets.
 */
MTLCommonCounter :: *NSString;
/*!
 @enum MTLCommonCounterSet
 @abstract Common counter set names.
 @discussion Each of these common counter sets has a defined structure type.  Implementations
 may omit some of the counters from these sets.
 @constant MTLCommonCounterSetTimestamp A counter set containing only the timestamp.
 @constant MTLCommonCounterSetStageUtilization A counter set containing utilization per stage.
 @constant MTLCommonCounterSetStatistic A counter set containing various statistics.
 */
MTLCommonCounterSet :: *NSString;
/// Provides a signature for a callback block that Metal calls when the compiler finishes a build task for a binary function.
MTL4NewBinaryFunctionCompletionHandler :: #type (function: *MTL4BinaryFunction, error: *NSError) -> void #c_call;
/// Provides a signature for a callback block that Metal calls when the compiler finishes a build task for a machine learning pipeline state.
MTL4NewMachineLearningPipelineStateCompletionHandler :: #type (mlPipelineState: *MTL4MachineLearningPipelineState, error: *NSError) -> void #c_call;
/*!
 @brief Type for device notifications
*/
MTLDeviceNotificationName :: *NSString;
/*!
 @brief Block signature for device notifications
 */
MTLDeviceNotificationHandler :: #type (device: *MTLDevice, notifyName: MTLDeviceNotificationName) -> void #c_call;
MTLTimestamp :: u64;
MTLCommandBufferHandler :: #type (unknown_0: *MTLCommandBuffer) -> void #c_call;
/*!
 @typedef MTLDrawablePresentedHandler
 @abstract The presented callback function protocol
 @discussion Be careful when you use delta between this presentedTime and previous frame's presentedTime to animate next frame. If the frame was presented using presentAfterMinimumDuration or presentAtTime, the presentedTime might includes delays to meet your specified present time. If you want to measure how much frame you can achieve, use GPUStartTime in the first command buffer of your frame rendering and GPUEndTime of your last frame rendering to calculate the frame interval.
*/
MTLDrawablePresentedHandler :: #type (unknown_0: *MTLDrawable) -> void #c_call;
MTLSharedEventNotificationBlock :: #type (unknown_0: *MTLSharedEvent, value: u64) -> void #c_call;
/// Defines the block signature for a callback Metal invokes to provide your app feedback after completing a workload.
///
/// You register a commit feedback block with Metal by providing an instance of ``MTL4CommitOptions`` to
/// the command queue's commit method, ``MTL4CommandQueue/commit:count:options:``. The commit options instance
/// references your commit feedback handler after you add it via its ``MTL4CommitOptions/addFeedbackHandler:``
/// method.
///
/// - Parameter commitFeedback: a commit feedback instance containing information about the workload.
MTL4CommitFeedbackHandler :: #type (commitFeedback: *MTL4CommitFeedback) -> void #c_call;
MTLIOCommandBufferHandler :: #type (unknown_0: *MTLIOCommandBuffer) -> void #c_call;
MTLIOCompressionContext :: *void;
