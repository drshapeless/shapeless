// This implementation is based on Metal 4, some of the older things
// suggested by No Graphics API that based on Metal is no longer
// valid, for example a command buffer based on a queue, now Metal 4
// mimics that behaviour of Vulkan, I don't really know whether this
// is a good idea or not.

// About residency set, Metal 4 gives us very fine control of what
// resources we want to use in shaders, but in this implementation,
// all the queue created will be added a default residency set managed
// by GPU_Context, when a new allocation is called via GPU.alloc(),
// the residency set will be updated and committed
// immediately. Therefore, to avoid confusion and unknown behaviour,
// queue should always be created after any resource allocations. In
// frame allocations should use arena instead.

DEFAULT_COMMAND_BUFFER_COUNT :: 3;

Format :: Vulkan.VkFormat;

GPU_Context :: struct {
    device:          *MTLDevice;
    sdl_window:      *SDL_Window;
    view:            SDL_MetalView;
    layer:           *CAMetalLayer;
    compiler:        *MTL4Compiler;
    command_buffers: [DEFAULT_COMMAND_BUFFER_COUNT] Command_Buffer;

    command_buffer_index:= 0;

    // Useful for checking size and alignment.
    temp_texture_descriptor: *MTLTextureDescriptor;
    cpu_pointer_table:       Table(*void, Allocation);
    gpu_pointer_table:       Table(Ptr, Allocation);

    argument_table_descriptor: *MTL4ArgumentTableDescriptor;
    argument_table:            *MTL4ArgumentTable;

    #overlay (argument_table) vertex_argument_table: *MTL4ArgumentTable;
    fragment_argument_table: *MTL4ArgumentTable;

    residency_set: *MTLResidencySet;

    descriptor_heap_pool: Flat_Pool;
}

#add_context gpu_context: GPU_Context;

Allocation :: struct {
    cpu:    *void;
    gpu:    Ptr;
    size:   u64;
    buffer: *MTLBuffer;
}

Texture :: struct {
    mtl: *MTLTexture;
    drawable: *MTLDrawable;
    cpu: *void;
    gpu: Ptr;
    resource_id: MTLResourceID;
    dimensions: u32x3;
};

Pipeline :: struct {
    render:     *MTLRenderPipelineState;
    compute:    *MTLComputePipelineState;
    is_compute: bool = false;
}

Depth_Stencil_State :: struct {
    mtl: *MTLDepthStencilState;
};

// This does nothing
Blend_State :: struct {

}

Queue :: struct {
    mtl: *MTL4CommandQueue;
}

// Since we have to modify the internal when passing, and we don't
// want to pass a pointer everytime.
Command_Buffer :: struct {
    // No Graphics API suggest a single use command buffer, but newer
    // Metal 4 API evolves into Vulkan like and recommend reuse of
    // command buffer. Older Metal API does suggest single use command
    // buffer. I tried to do the same in Metal 4, but releasing
    // command buffer becomes a pain in the ass, it either involves
    // some semaphore magic, or optimistic cycles of a freeable list
    // of command buffer.
    //
    // No Graphics API's discouragement about reusable command buffer
    // is not followed in this implementation.

    cmd:                    *MTL4CommandBuffer;
    command_allocator:      *MTL4CommandAllocator;
    compute_encoder:        *MTL4ComputeCommandEncoder;
    render_encoder:         *MTL4RenderCommandEncoder;

    render_pass_descriptor: *MTL4RenderPassDescriptor;

    // The reason why topology is here is because the setting of
    // topology in Metal is not in a separate function, but as an
    // argument in the draw call. To maintain consistency between
    // Vulkan and Metal, topology is temporarily cached here.
    topology:               Topology;

    texture_heap:           [] Texture_Descriptor;
    sampler_heap:           [] Sampler_Descriptor;
}

Semaphore :: struct {
    shared_event: *MTLSharedEvent;
};

IR :: struct {
    library_function_descriptor: *MTL4LibraryFunctionDescriptor;
}

init :: (window: *SDL_Window = null) {
    init_objective_c();
    init_metal();
    using context.gpu_context;

    device = MTLCreateSystemDefaultDevice();
    temp_texture_descriptor = objc_new(MTLTextureDescriptor);

    error: *NSError;

    compiler_desc := objc_new(MTL4CompilerDescriptor);
    defer release(compiler_desc);
    compiler = MTLDevice.newCompilerWithDescriptor_error_(device, compiler_desc, *error);
    assert_metal(error);

    for * cb: command_buffers {
        cb.cmd = MTLDevice.newCommandBuffer(device);
        cb.command_allocator = MTLDevice.newCommandAllocator(device);
        cb.render_pass_descriptor = objc_new(MTL4RenderPassDescriptor);
    }

    argument_table_descriptor = objc_new(MTL4ArgumentTableDescriptor);
    MTL4ArgumentTableDescriptor.setMaxBufferBindCount_(argument_table_descriptor, 1);
    argument_table = MTLDevice.newArgumentTableWithDescriptor_error_(device, argument_table_descriptor, *error);
    fragment_argument_table = MTLDevice.newArgumentTableWithDescriptor_error_(device, argument_table_descriptor, *error);
    assert_metal(error);

    residency_set_descriptor :*MTLResidencySetDescriptor = objc_new(MTLResidencySetDescriptor);

    residency_set = MTLDevice.newResidencySetWithDescriptor_error_(device, residency_set_descriptor, *error);
    assert_metal(error);

    if window {
        sdl_window = window;
        view = SDL_Metal_CreateView(window);
        layer = SDL_Metal_GetLayer(view);
        layer.setDevice_(layer, device);
        // Metal only support MTLPixelFormatBGRA8Unorm and MTLPixelFormatBGRA8Unorm_sRGB
        layer.setPixelFormat_(layer, .BGRA8Unorm);
        // This can let us copy to the drawable texture
        layer.setFramebufferOnly_(layer, 0);
    }
}

deinit :: () {
    using context.gpu_context;
    for command_buffers {
        release(it.cmd);
        release(it.command_allocator);
        release(it.render_pass_descriptor);
    }

    release(argument_table);
    release(fragment_argument_table);
    SDL_Metal_DestroyView(view);
    release(compiler);
    release(temp_texture_descriptor);
    release(device);
}

#add_context gpu_allocator: Allocator = metal_allocator;
metal_allocator :: Allocator.{metal_allocator_proc, null};

metal_allocator_proc :: (mode: Allocator_Mode, requested_size: s64, old_size: s64, old_memory: *void, allocator_data: *void) -> *void {
    using context.gpu_context;
    if mode == {
    case .ALLOCATE;
        allocation := metal_allocate(xx requested_size);
        return allocation.cpu;
    case .FREE;
        found, allocation := table_find(*cpu_pointer_table, old_memory);
        if found metal_deallocate(allocation);
    case;
        Basic.assert(false, "% mode is not supported in Metal allocator", mode);
    }

    return null;
}

metal_allocate :: (bytes: u64) -> Allocation {
    using context.gpu_context;
    buffer := MTLDevice.newBufferWithLength_options_(device, bytes, .StorageModeShared);
    allocation := Allocation.{
        cpu = buffer.contents(buffer),
        gpu = buffer.gpuAddress(buffer),
        size = bytes,
        buffer = buffer,
    };

    table_add(*cpu_pointer_table, allocation.cpu, allocation);
    table_add(*gpu_pointer_table, allocation.gpu, allocation);

    MTLResidencySet.addAllocation_(residency_set, xx allocation.buffer);
    MTLResidencySet.commit(residency_set);

    return allocation;
}

metal_deallocate :: (allocation: Allocation) {
    using context.gpu_context;
    release(allocation.buffer);
    table_remove(*cpu_pointer_table, allocation.cpu);
    table_remove(*gpu_pointer_table, allocation.gpu);
}

texture_size_align :: (desc: Texture_Desc) -> Texture_Size_Align {
    using context.gpu_context;
    to_metal_texture_descriptor(temp_texture_descriptor, desc);
    metal_size_align := MTLDevice.heapTextureSizeAndAlignWithDescriptor_(device, temp_texture_descriptor);

    return .{size = metal_size_align.size, align = metal_size_align.align};
}

create_texture :: (desc: Texture_Desc, ptr_gpu: Ptr) -> Texture {
    using context.gpu_context;
    metal_desc := to_metal_texture_descriptor(desc);
    defer release(metal_desc);

    allocation := gpu_pointer_to_allocation(ptr_gpu);

    texture: Texture;

    bytes_per_row := Basic.align_forward(cast(s64) (bytes_per_pixel(to_metal_format(desc.format)) * desc.dimensions.x), 16);
    texture.mtl = MTLBuffer.newTextureWithDescriptor_offset_bytesPerRow_(allocation.buffer, metal_desc, ptr_gpu - allocation.gpu, xx bytes_per_row);
    texture.gpu = ptr_gpu;
    texture.cpu = allocation.cpu + (ptr_gpu - allocation.gpu);

    texture.resource_id = MTLTexture.gpuResourceID(texture.mtl);
    texture.dimensions = desc.dimensions;

    return texture;
}

destroy_texture :: (texture: Texture) {
    release(texture.mtl);
}

// TODO: We don't care about the View_Desc for now.
texture_view_descriptor :: (texture: Texture, desc: View_Desc) -> Texture_Descriptor {
    descriptor: Texture_Descriptor;
    descriptor[0] = texture.resource_id._impl;
    return descriptor;
}

// In Metal, sampler is an object that has to be released, but in this
// implementation, we don't release the sampler at all, because the
// Vulkan implementation does not have a sampler object.
sampler_descriptor :: (desc: Sampler_Desc) -> Sampler_Descriptor {
    using context.gpu_context;
    mtl_descriptor := to_metal_sampler_descriptor(desc);

    state := MTLDevice.newSamplerStateWithDescriptor_(device, mtl_descriptor);

    sampler_descriptor: Sampler_Descriptor;
    sampler_descriptor[0] = xx state;
    sampler_descriptor[1] = state.gpuResourceID(state)._impl;

    Basic.log("%", sampler_descriptor[1]);

    return sampler_descriptor;
}

texture_handle :: inline (cb: *Command_Buffer, index: u64) -> u64 {
    descriptor := cb.texture_heap[index];
    return descriptor[0];
}

sampler_handle :: inline (cb: *Command_Buffer, index: u64) -> u64 {
    descriptor := cb.sampler_heap[index];
    return descriptor[1];
}

load_msl :: (msl: string, entry_points: []string) -> []IR {
    using context.gpu_context;
    compile_options: *MTLCompileOptions = objc_new(MTLCompileOptions);
    defer release(compile_options);
    compile_options.setLanguageVersion_(compile_options, MTLLanguageVersion.e4_0);

    error: *NSError;
    library_desc := objc_new(MTL4LibraryDescriptor);
    defer release(library_desc);
    MTL4LibraryDescriptor.setSource_(library_desc, NSString.getTempString(msl));
    MTL4LibraryDescriptor.setOptions_(library_desc, compile_options);

    library := MTL4Compiler.newLibraryWithDescriptor_error_(compiler, library_desc, *error);
    assert_metal(error);

    irs := Basic.NewArray(entry_points.count, IR);
    for entry_point: entry_points {
        function_desc := objc_new(MTL4LibraryFunctionDescriptor);
        MTL4LibraryFunctionDescriptor.setLibrary_(function_desc, library);
        MTL4LibraryFunctionDescriptor.setName_(function_desc, NSString.getTempString(entry_point));

        irs[it_index].library_function_descriptor = function_desc;
    }

    return irs;
}

// This function expects the content of the shader file, not the name nor the path.
// load_slang :: (shader: string, entry_points: []string) -> []IR {
//     metal_code := slang_to_metal(shader, entry_points, context.gpu_context.slang_global_session);

//     return load_msl(metal_code, entry_points);
// }

load_ir :: (shader_name: string, entry_points: []string) -> []IR {
    shader_path := Basic.tprint("%%.metal", SHADER_BASE_DIRECTORY, shader_name);

    shader_data, ok := File.read_entire_file(shader_path);
    Basic.assert(ok);
    return load_msl(shader_data, entry_points);
}

destroy_ir :: (ir: IR) {
    release(ir.library_function_descriptor);
}

create_compute_pipeline :: (compute_ir: IR) -> Pipeline {
    using context.gpu_context;

    error: *NSError;
    compute_pipeline_desc := objc_new(MTL4ComputePipelineDescriptor);
    defer release(compute_pipeline_desc);

    MTL4ComputePipelineDescriptor.setComputeFunctionDescriptor_(compute_pipeline_desc, xx compute_ir.library_function_descriptor);
    pipeline_state := MTL4Compiler.newComputePipelineStateWithDescriptor_compilerTaskOptions_error_(compiler, compute_pipeline_desc, null, *error);
    assert_metal(error);

    return .{compute = pipeline_state, is_compute = true};
}

create_graphics_pipeline :: (vertex_ir: IR, fragment_ir: IR, desc: Raster_Desc) -> Pipeline {
    using context.gpu_context;

    error: *NSError;
    render_pipeline_desc := objc_new(MTL4RenderPipelineDescriptor);
    defer release(render_pipeline_desc);
    MTL4RenderPipelineDescriptor.setVertexFunctionDescriptor_(render_pipeline_desc, xx vertex_ir.library_function_descriptor);
    MTL4RenderPipelineDescriptor.setFragmentFunctionDescriptor_(render_pipeline_desc, xx fragment_ir.library_function_descriptor);

    // More settings here
    MTL4RenderPipelineDescriptor.setRasterSampleCount_(render_pipeline_desc, xx desc.sample_count);
    MTL4RenderPipelineDescriptor.setAlphaToCoverageState_(render_pipeline_desc, xx desc.alpha_to_coverage); // 0 is Disabled, 1 is Enabled

    color_attachments := MTL4RenderPipelineDescriptor.colorAttachments(render_pipeline_desc);
    for target: desc.color_targets {
        attachment: *MTL4RenderPipelineColorAttachmentDescriptor = objc_new(MTL4RenderPipelineColorAttachmentDescriptor);
        attachment.setPixelFormat_(attachment, to_metal_format(target.format));
        attachment.setWriteMask_(attachment, to_metal_write_mask(target.write_mask));

        // There is no dynamic blend state in Metal, all blend state
        // must be embedded in the PSO, maybe we should immitate it by
        // creating a brand new pipeline, but currently only embedded
        // one takes effects.
        if desc.blendstate {
            MTL4RenderPipelineColorAttachmentDescriptor.setBlendingState_(attachment, .Enabled);
            MTL4RenderPipelineColorAttachmentDescriptor.setSourceRGBBlendFactor_(attachment, to_metal_blend_factor(desc.blendstate.src_color_factor));
            MTL4RenderPipelineColorAttachmentDescriptor.setDestinationRGBBlendFactor_(attachment, to_metal_blend_factor(desc.blendstate.dst_color_factor));
            MTL4RenderPipelineColorAttachmentDescriptor.setRgbBlendOperation_(attachment, to_metal_blend_operation(desc.blendstate.color_op));
            MTL4RenderPipelineColorAttachmentDescriptor.setSourceAlphaBlendFactor_(attachment, to_metal_blend_factor(desc.blendstate.src_alpha_factor));
            MTL4RenderPipelineColorAttachmentDescriptor.setDestinationAlphaBlendFactor_(attachment, to_metal_blend_factor(desc.blendstate.dst_alpha_factor));
            MTL4RenderPipelineColorAttachmentDescriptor.setAlphaBlendOperation_(attachment, to_metal_blend_operation(desc.blendstate.alpha_op));
            MTL4RenderPipelineColorAttachmentDescriptor.setWriteMask_(attachment, to_metal_write_mask(desc.blendstate.color_write_mask));
        }

        color_attachments.setObject_atIndexedSubscript_(color_attachments, attachment, xx it_index);
    }

    pipeline_state := MTL4Compiler.newRenderPipelineStateWithDescriptor_compilerTaskOptions_error_(compiler, xx render_pipeline_desc, null, *error);
    assert_metal(error);
    return .{render = pipeline_state, is_compute = false};
}

destroy_pipeline :: (pipeline: Pipeline) {
    if pipeline.is_compute {
        release(pipeline.compute);
    } else {
        release(pipeline.render);
    }
}

//// State objects
create_depth_stencil_state :: (desc: Depth_Stencil_Desc) -> Depth_Stencil_State {
    using context.gpu_context;

    depth_stencil_desc := objc_new(MTLDepthStencilDescriptor);
    defer release(depth_stencil_desc);

    if desc.depth_mode & .READ {
        MTLDepthStencilDescriptor.setDepthCompareFunction_(depth_stencil_desc, to_metal_compare_function(desc.depth_test));
    }

    MTLDepthStencilDescriptor.setDepthWriteEnabled_(depth_stencil_desc, ifx desc.depth_mode & .WRITE then YES else NO);

    front_stencil := objc_new(MTLStencilDescriptor);
    defer release(front_stencil);
    MTLStencilDescriptor.setStencilCompareFunction_(front_stencil, to_metal_compare_function(desc.stencil_front.test));
    MTLStencilDescriptor.setStencilFailureOperation_(front_stencil, to_metal_stencil_operation(desc.stencil_front.fail_op));
    MTLStencilDescriptor.setDepthStencilPassOperation_(front_stencil, nto_metal_stencil_operation(desc.stencil_front.pass_op));
    MTLStencilDescriptor.setDepthFailureOperation_(front_stencil, to_metal_stencil_operation(desc.stencil_front.depth_fail_op));

    MTLDepthStencilDescriptor.setFrontFaceStencil_(depth_stencil_desc, front_stencil);

    back_stencil := objc_new(MTLStencilDescriptor);
    defer release(back_stencil);
    MTLStencilDescriptor.setStencilCompareFunction_(back_stencil, to_metal_compare_function(desc.stencil_back.test));
    MTLStencilDescriptor.setStencilFailureOperation_(back_stencil, to_metal_stencil_operation(desc.stencil_back.fail_op));
    MTLStencilDescriptor.setDepthStencilPassOperation_(back_stencil, nto_metal_stencil_operation(desc.stencil_back.pass_op));
    MTLStencilDescriptor.setDepthFailureOperation_(back_stencil, to_metal_stencil_operation(desc.stencil_back.depth_fail_op));

    MTLDepthStencilDescriptor.setBackFaceStencil_(depth_stencil_desc, back_stencil);

    state := MTLDevice.newDepthStencilStateWithDescriptor_(device, depth_stencil_desc);

    return state;
}

destroy_depth_stencil_state :: (state: Depth_Stencil_State) {
    release(state);
}

// We are only supporting one main queue, in modern hardwares, we
// should submit everything to the main queue.
create_queue :: () -> Queue {
    using context.gpu_context;
    queue := MTLDevice.newMTL4CommandQueue(device);
    MTL4CommandQueue.addResidencySet_(queue, residency_set);
    if sdl_window {
        // Who would have thought CAMetalLayer have a residency set...
        MTL4CommandQueue.addResidencySet_(queue, layer.residencySet(layer));
    }
    return .{queue};
}

// Since we have one type of queue, we have no way to know what type
// of command we are using, we cannot create an encoder in this
// function. So we should defer the creation of the encoder to every
// compute action and perform a single if check. Not sure if that
// would affect performance.
start_command_recording :: () -> *Command_Buffer {
    using context.gpu_context;
    command_buffer := *command_buffers[command_buffer_index];
    {
        using command_buffer;
        command_allocator.reset(command_allocator);
        cmd.beginCommandBufferWithAllocator_(cmd, command_allocator);
        compute_encoder = null;
        render_encoder = null;
    }

    return command_buffer;
}

// In Metal, signal and wait is decoupled from commit, but that is not
// the case in Vulkan. In Vulkan the wait and signal semaphores are
// grouped together in a single submit info, otherwise, it might have
// a significant performance impact(?)
submit :: (queue: Queue, command_buffer: *Command_Buffer, wait: []Semaphore_Pair = .[], signal: []Semaphore_Pair = .[]) {
    Basic.auto_release_temp();
    for wait {
        MTL4CommandQueue.waitForEvent_value_(queue.mtl, xx it.semaphore.shared_event, it.value);
    }

    maybe_end_compute_encoder(command_buffer);
    MTL4CommandBuffer.endCommandBuffer(command_buffer.cmd);

    MTL4CommandQueue.commit_count_(queue.mtl, *command_buffer.cmd, 1);

    for signal {
        MTL4CommandQueue.signalEvent_value_(queue.mtl, xx it.semaphore.shared_event, it.value);
    }

    command_buffer.texture_heap = .[];

    command_buffer_index = (command_buffer_index + 1) % xx command_buffers.count;
}

// I can't think of a way to correctly decouple present from submit.
submit_and_present :: (queue: Queue, swapchain_texture: Texture, command_buffer: *Command_Buffer, wait: []Semaphore_Pair = .[], signal: []Semaphore_Pair = .[]) {
    using context.gpu_context;
    drawable := swapchain_texture.drawable;

    Basic.auto_release_temp();
    for wait {
        MTL4CommandQueue.waitForEvent_value_(queue.mtl, xx it.semaphore.shared_event, it.value);
    }

    MTL4CommandQueue.waitForDrawable_(queue.mtl, drawable);

    maybe_end_compute_encoder(command_buffer);
    MTL4CommandBuffer.endCommandBuffer(command_buffer.cmd);

    MTL4CommandQueue.commit_count_(queue.mtl, *command_buffer.cmd, 1);

    for signal {
        MTL4CommandQueue.signalEvent_value_(queue.mtl, xx it.semaphore.shared_event, it.value);
    }

    MTL4CommandQueue.signalDrawable_(queue.mtl, drawable);

    MTLDrawable.present(drawable);

    command_buffer.texture_heap = .[];

    command_buffer_index = (command_buffer_index + 1) % xx command_buffers.count;
}

create_semaphore :: (init_value: u64) -> Semaphore {
    using context.gpu_context;
    event := MTLDevice.newSharedEvent(device);
    event.setSignaledValue_(event, init_value);
    return .{event};
}

wait_semaphore :: (sema: Semaphore, value: u64, timeout: u64 = 10000) {
    success := MTLSharedEvent.waitUntilSignaledValue_timeoutMS_(sema.shared_event, value, timeout);
    if !success {
        Basic.log("Timeout waiting semaphore, value: %, timeout: %", value, timeout);
    }
}

destroy_semaphore :: (sema: Semaphore) {
    release(sema.shared_event);
}

signal_semaphore :: (sema: Semaphore, value: u64) {
    MTLSharedEvent.setSignaledValue_(sema.shared_event, value);
}

memcpy :: (cb: *Command_Buffer, dest: Ptr, src: Ptr, size: s64) {
    using context.gpu_context;

    create_compute_encoder_and_maybe_end_render_encoder(cb);

    dest_allocation := gpu_pointer_to_allocation(dest);
    src_allocation  := gpu_pointer_to_allocation(src);

    cb.compute_encoder.copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_(cb.compute_encoder, src_allocation.buffer, src - src_allocation.gpu, dest_allocation.buffer, dest - dest_allocation.gpu, xx size);
}

// Assume that the texture has 4 channels
host_copy_to_texture :: (dst: Texture, src: *void) {
    region := MTLRegionMake2D(0, 0, dst.dimensions.x, dst.dimensions.y);
    MTLTexture.replaceRegion_mipmapLevel_withBytes_bytesPerRow_(dst.mtl, region, 0, src, 4 * dst.dimensions.x);
}

// The original API is
// void gpuCopyToTexture(GpuCommandBuffer cb, void* destGpu, void* srcGpu, GpuTexture texture);
// But I scratch my head to find the value of the bytes_per_row and source size, maybe those thing can be calculated from the texture...
copy_to_texture :: (cb: *Command_Buffer, dest: Texture, src: Ptr) {
    maybe_create_compute_encoder(cb);
    src_allocation := gpu_pointer_to_allocation(src);

    src_size := MTLSize.{
        width = MTLTexture.width(dest.mtl),
        height = MTLTexture.height(dest.mtl),
        depth = MTLTexture.depth(dest.mtl),
    };

    bytes_per_row := MTLTexture.bufferBytesPerRow(dest.mtl);
    MTL4ComputeCommandEncoder.copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_(cb.compute_encoder, src_allocation.buffer, src - src_allocation.gpu, bytes_per_row, 0, src_size, dest.mtl, 0, 1, .{0, 0, 0});
}

copy_to_texture :: (cb: *Command_Buffer, dst: Texture, src: Ptr, image_offset: s32x3, image_extent: u32x3) {
    maybe_create_compute_encoder(cb);

    // The input data must be tightly packed.

    src_allocation := gpu_pointer_to_allocation(src);
    src_size := MTLSize.{
        width  = xx image_extent.x,
        height = xx image_extent.y,
        depth  = xx image_extent.z,
    };

    bytes_per_row: NSUInteger = image_extent.y;

    dst_origin := MTLOrigin.{
        x = xx image_offset.x,
        y = xx image_offset.y,
        z = xx image_offset.z,
    };
    MTL4ComputeCommandEncoder.copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_(cb.compute_encoder, src_allocation.buffer, src - src_allocation.gpu, bytes_per_row, 0, src_size, dst.mtl, 0, 1, dst_origin);
}

copy_from_texture :: (cb: *Command_Buffer, dest: Ptr, src: Texture) {
    maybe_create_compute_encoder(cb);

    src_size := MTLSize.{
        width = MTLTexture.width(src.mtl),
        height = MTLTexture.height(src.mtl),
        depth = MTLTexture.depth(src.mtl),
    };

    dest_allocation := gpu_pointer_to_allocation(dest);

    bytes_per_row := MTLTexture.bufferBytesPerRow(src.mtl);
    MTL4ComputeCommandEncoder.copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_(cb.compute_encoder, src.mtl, 0, 1, .{0, 0, 0}, src_size, dest_allocation.buffer, dest - dest_allocation.gpu, bytes_per_row, 0);
}

// In Metal, the src and dest texture must of the same format and size.
copy_texture :: (cb: *Command_Buffer, dest: Texture, src: Texture, $IDENTICAL := false) {
    src_size := metal_texture_size(src.mtl);
    dest_size := metal_texture_size(dest.mtl);

    #if IDENTICAL {
        is_the_same := memcmp(*src_size, *dest_size, size_of(MTLSize));
        if is_the_same != 0 {
            return;
        }
        maybe_create_compute_encoder(cb);

        MTL4ComputeCommandEncoder.copyFromTexture_toTexture_(cb.compute_encoder, src.mtl, dest.mtl);
    } else {
        maybe_create_compute_encoder(cb);
        MTL4ComputeCommandEncoder.copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_(cb.compute_encoder, src.mtl, 0, 0, .{0, 0, 0}, src_size, dest.mtl, 0, 0, .{0, 0, 0});
    }
}

set_pipeline :: (cb: *Command_Buffer, pipeline: Pipeline) {
    if pipeline.is_compute {
        maybe_create_compute_encoder(cb);
        e := cb.compute_encoder;
        e.setComputePipelineState_(e, pipeline.compute);
    } else {
        // We should not create a render encoder here
        Basic.assert(cb.render_encoder != null, "The render encoder is not yet started, maybe you forget to call GPU.begin_render_pass()");
        e := cb.render_encoder;
        e.setRenderPipelineState_(e, pipeline.render);
    }
}

dispatch :: (cb: *Command_Buffer, data_gpu: Ptr, groups: u32x3, threads: u32x3) {
    using context.gpu_context;

    MTL4ArgumentTable.setAddress_atIndex_(argument_table, data_gpu, 0);

    maybe_create_compute_encoder(cb);

    cb.compute_encoder.setArgumentTable_(cb.compute_encoder, argument_table);

    mtl_thread_groups := MTLSize.{groups.x, groups.y, groups.z};

    mtl_threads := MTLSize.{threads.x, threads.y, threads.z};

    // Caution!!!
    // dispatchThreads_threadsPerThreadgroup_ and
    // dispatchThreadgroups_threadsPerThreadgroup_ is completely
    // different thing, the latter one is what we want.
    MTL4ComputeCommandEncoder.dispatchThreadgroups_threadsPerThreadgroup_(cb.compute_encoder, mtl_thread_groups, mtl_threads);
}

// This is a handy function for dispatching 1D array of 256 threads
// per group
dispatch :: (cb: *Command_Buffer, data_gpu: Ptr, count: u32) {
    // 256 is hardcoded.
    dispatch(cb, data_gpu, .{count, 1, 1}, .{256, 1, 1});
}

begin_render_pass :: (cb: *Command_Buffer, desc: Render_Pass_Desc) {
    using context.gpu_context;

    set_metal_render_pass_descriptor(cb.render_pass_descriptor, desc);

    maybe_end_compute_encoder(cb);
    create_render_encoder(cb);
}

end_render_pass :: (cb: *Command_Buffer) {
    end_render_encoder(cb);
}

set_viewport :: (cb: *Command_Buffer, viewport: Viewport) {
    mtl: MTLViewport;
    mtl.originX = viewport.x;
    mtl.width   = viewport.width;
    #if Y_AXIS_DOWN {
        mtl.height  = -viewport.height;
        mtl.originY = viewport.y + viewport.height;
    } else {
        mtl.height  = viewport.height;
        mtl.originY = viewport.y;
    }
    mtl.znear   = viewport.min_depth;
    mtl.zfar    = viewport.max_depth;
    MTL4RenderCommandEncoder.setViewport_(cb.render_encoder, mtl);
}

set_scissor :: (cb: *Command_Buffer, scissor: Rect) {
    mtl: MTLScissorRect;
    mtl.x      = xx scissor.x;
    mtl.y      = xx scissor.y;
    mtl.width  = xx scissor.w;
    mtl.height = xx scissor.h;
    MTL4RenderCommandEncoder.setScissorRect_(cb.render_encoder, mtl);
}

set_topology :: (cb: *Command_Buffer, topology: Topology) {
    cb.topology = topology;
}

draw_indexed_instanced :: (cb: *Command_Buffer, vertex_data_gpu: Ptr, fragment_data_gpu: Ptr, indices: Array, instance_count: u32) {
    using context.gpu_context;

    MTL4ArgumentTable.setAddress_atIndex_(vertex_argument_table, vertex_data_gpu, 0);
    MTL4RenderCommandEncoder.setArgumentTable_atStages_(cb.render_encoder, vertex_argument_table, .Vertex);

    MTL4ArgumentTable.setAddress_atIndex_(fragment_argument_table, fragment_data_gpu, 0);
    MTL4RenderCommandEncoder.setArgumentTable_atStages_(cb.render_encoder, fragment_argument_table, .Fragment);
    MTL4RenderCommandEncoder.drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferLength_instanceCount_(cb.render_encoder, to_metal_primitive_type(cb.topology), xx indices.count, .UInt32, indices.gpu_ptr, size_of(u32).(u32) *  xx indices.count, instance_count);
}

draw :: (cb: *Command_Buffer, vertex_data_gpu: Ptr, fragment_data_gpu: Ptr, vertex_count: u32, instance_count: u32) {
    using context.gpu_context;

    MTL4ArgumentTable.setAddress_atIndex_(vertex_argument_table, vertex_data_gpu, 0);
    MTL4RenderCommandEncoder.setArgumentTable_atStages_(cb.render_encoder, vertex_argument_table, .Vertex);

    MTL4ArgumentTable.setAddress_atIndex_(fragment_argument_table, fragment_data_gpu, 0);
    MTL4RenderCommandEncoder.setArgumentTable_atStages_(cb.render_encoder, fragment_argument_table, .Fragment);
    MTL4RenderCommandEncoder.drawPrimitives_vertexStart_vertexCount_instanceCount_(cb.render_encoder, to_metal_primitive_type(cb.topology), 0, xx vertex_count, xx instance_count);
}

acquire_swapchain_texture :: () -> bool, Texture {
    using context.gpu_context;

    drawable :*CAMetalDrawable = layer.nextDrawable(layer);
    if drawable == null {
        Basic.log("Cannot acquire drawable");
        return false, .{};
    }

    texture: Texture;
    texture.mtl = drawable.texture(drawable);
    texture.drawable = xx drawable;
    texture.resource_id = MTLTexture.gpuResourceID(texture.mtl);

    return true, texture;
}

// Metal does not care about hazards
barrier :: (cb: *Command_Buffer, before: Stage, after: Stage, hazards: Hazard = 0) {
    encoder: *MTL4CommandEncoder;
    if cb.render_encoder {
        encoder = xx cb.render_encoder;
    } else if cb.compute_encoder {
        encoder = xx cb.compute_encoder;
    } else {
        // If there is no active encoder, ignore this barrier
        return;
    }
    MTL4CommandEncoder.barrierAfterEncoderStages_beforeEncoderStages_visibilityOptions_(encoder, to_metal_stages(after), to_metal_stages(before), .Device);
}

resize_callback :: (width: float64, height: float64) {
    using context.gpu_context;

    CAMetalLayer.setDrawableSize_(layer, .{width, height});
}

// Yes, although this is call frame count, what we care about it the
// command buffer count.
frame_count :: () -> s64 {
    using context.gpu_context;
    return command_buffers.count;
}

frame_index :: () -> s64 {
    using context.gpu_context;
    return command_buffer_index;
}

set_active_texture_heap :: (cb: *Command_Buffer, texture_heap: [] Texture_Descriptor) {
    cb.texture_heap = texture_heap;
}

set_active_sampler_heap :: (cb: *Command_Buffer, sampler_heap: [] Sampler_Descriptor) {
    cb.sampler_heap = sampler_heap;
}

// I used to ignore descriptor heap in Metal, but managing a separate
// thing along side with a pure index is a pain in the ass. Texture
// heap in Metal is CPU memory, we imitate the behaviour on host side.
create_texture_heap :: (count: s64) -> [] Texture_Descriptor {
    using context.gpu_context;
    Basic.push_allocator(flat_pool_allocator_proc, *descriptor_heap_pool);
    return Basic.NewArray(count, Texture_Descriptor);
}

create_sampler_heap :: (count: s64) -> [] Sampler_Descriptor {
    using context.gpu_context;
    Basic.push_allocator(flat_pool_allocator_proc, *descriptor_heap_pool);
    return Basic.NewArray(count, Sampler_Descriptor);
}

reset_descriptor_heap :: () {
    using context.gpu_context;
    reset(*descriptor_heap_pool);
}

// This is a dumb function.
create_blend_state :: (desc: Blend_Desc) -> Blend_State {
    return .{};
}

// Also a dumb function.
set_blend_state :: (cb: *Command_Buffer, state: Blend_State) {
    Basic.log("Metal does not support dynamic blend state yet");
}

// Currently, we cannot do wait device idle in Metal API.
wait_device_idle :: () {
}

#scope_file
to_metal_texture_descriptor :: (metal_descriptor: *MTLTextureDescriptor, desc: Texture_Desc) {
    // WTF is this ugly shit.
    MTLTextureDescriptor.setTextureType_(metal_descriptor, to_metal_texture_type(desc.type));
    MTLTextureDescriptor.setWidth_(metal_descriptor, desc.dimensions.x);
    MTLTextureDescriptor.setHeight_(metal_descriptor, desc.dimensions.y);
    MTLTextureDescriptor.setDepth_(metal_descriptor, desc.dimensions.z);
    MTLTextureDescriptor.setMipmapLevelCount_(metal_descriptor, desc.layer_count);
    MTLTextureDescriptor.setSampleCount_(metal_descriptor, desc.sample_count);
    MTLTextureDescriptor.setPixelFormat_(metal_descriptor, to_metal_format(desc.format));
    MTLTextureDescriptor.setUsage_(metal_descriptor, to_metal_texture_usage(desc.usage));

    // M-series chip, always shared mode
    // Maybe for swapchain texture, we may need private, but whatever.
    MTLTextureDescriptor.setStorageMode_(metal_descriptor, .Shared);
}

to_metal_texture_descriptor :: (desc: Texture_Desc) -> *MTLTextureDescriptor {
    metal_desc: *MTLTextureDescriptor;
    if desc.type == .e2D {
        metal_desc = MTLTextureDescriptor.texture2DDescriptorWithPixelFormat_width_height_mipmapped_(to_metal_format(desc.format), desc.dimensions.x, desc.dimensions.y, xx (desc.mip_count > 1));
        metal_desc.setResourceOptions_(metal_desc, .StorageModeShared);
        metal_desc.setUsage_(metal_desc, to_metal_texture_usage(desc.usage));
    } else {
        metal_desc: *MTLTextureDescriptor = objc_new(MTLTextureDescriptor);
        to_metal_texture_descriptor(metal_desc, desc);
    }

    return metal_desc;
}

to_metal_format :: vulkan_format_to_metal_format;

to_metal_texture_type :: (texture_type: Texture_Type) -> MTLTextureType {
    metal_texture_type: MTLTextureType;
    if texture_type == {
    case .e1D;
        metal_texture_type = .e1D;
    case .e2D;
        metal_texture_type = .e2D;
    case .e3D;
        metal_texture_type = .e3D;
    case .CUBE;
        metal_texture_type = .Cube;
    case .e1D_ARRAY;
        metal_texture_type = .e1DArray;
    case .e2D_ARRAY;
        metal_texture_type = .e2DArray;
    case .CUBE_ARRAY;
        metal_texture_type = .CubeArray;
    }

    return metal_texture_type;
}

to_metal_texture_usage :: (texture_usage: Texture_Usage) -> MTLTextureUsage {
    mtl_usage: MTLTextureUsage;
    if texture_usage & .STORAGE {
        mtl_usage |= .ShaderRead | .ShaderWrite;
    }
    if texture_usage & .COLOR_ATTACHMENT || texture_usage & .DEPTH_STENCIL_ATTACHMENT {
        mtl_usage |= .RenderTarget;
    }

    return mtl_usage;
}

to_metal_blend_factor :: (factor: Factor) -> MTLBlendFactor {
    metal_factor: MTLBlendFactor = .Unspecialized;
    // The order is by MTLBlendFactor
    if factor == {
    case .ZERO;
        metal_factor = .Zero;
    case .ONE;
        metal_factor = .One;
    case .SRC_COLOR;
        metal_factor = .SourceColor;
    case .ONE_MINUS_SRC_COLOR;
        metal_factor = .OneMinusSourceColor;
    case .SRC_ALPHA;
        metal_factor = .SourceAlpha;
    case .ONE_MINUS_SRC_ALPHA;
        metal_factor = .OneMinusSourceAlpha;
    case .DST_COLOR;
        metal_factor = .DestinationColor;
    case .ONE_MINUS_DST_COLOR;
        metal_factor = .OneMinusDestinationColor;
    case .DST_ALPHA;
        metal_factor = .DestinationAlpha;
    case .ONE_MINUS_DST_ALPHA;
        metal_factor = .OneMinusDestinationAlpha;
    case .SRC_ALPHA_SATURATE;
        metal_factor = .SourceAlphaSaturated;
    case .CONSTANT_COLOR;
        metal_factor = .BlendColor;
    case .ONE_MINUS_CONSTANT_COLOR;
        metal_factor = .OneMinusBlendColor;
    case .CONSTANT_ALPHA;
        metal_factor = .BlendAlpha;
    case .ONE_MINUS_CONSTANT_ALPHA;
        metal_factor = .OneMinusBlendAlpha;
    case .SRC1_COLOR;
        metal_factor = .Source1Color;
    case .ONE_MINUS_SRC1_COLOR;
        metal_factor = .OneMinusSource1Color;
    case .SRC1_ALPHA;
        metal_factor = .Source1Alpha;
    case .ONE_MINUS_SRC1_ALPHA;
        metal_factor = .OneMinusSource1Alpha;
    case;
        Basic.assert(false, "unknown blend factor in metal");
    }

    return metal_factor;
}

to_metal_blend_operation :: (op: Blend) -> MTLBlendOperation {
    metal_op: MTLBlendOperation = .Unspecialized;
    if op == {
    case .ADD;
        metal_op = .Add;
    case .SUBTRACT;
        metal_op = .Subtract;
    case .REV_SUBTRACT;
        metal_op = .ReverseSubtract;
    case .MIN;
        metal_op = .Min;
    case .MAX;
        metal_op = .Max;
    }
    return metal_op;
}

to_metal_write_mask :: (mask: u8) -> MTLColorWriteMask {
    metal_mask: MTLColorWriteMask = .Unspecialized;

    // We have to cast the mask in reverse. This function sucks.
    metal_mask |= xx ((mask & 0x1) << 3); // R
    metal_mask |= xx ((mask & 0x2) << 2); // G
    metal_mask |= xx ((mask & 0x4) << 1); // B
    metal_mask |= xx ((mask & 0x8) << 0); // A

    return metal_mask;
}

to_metal_compare_function :: (op: OP) -> MTLCompareFunction {
    func: MTLCompareFunction = .Always;
    if op == {
    case .NEVER;
        func = .Never;
    case .LESS;
        func = .Less;
    case .EQUAL;
        func = .Equal;
    case .LESS_OR_EQUAL;
        func = .LessEqual;
    case .GREATER;
        func = .Greater;
    case .NOT_EQUAL;
        func = .NotEqual;
    case .GREATER_OR_EQUAL;
        func = .GreaterEqual;
    case .ALWAYS;
        func = .Always;
    case;
        Basic.assert(false, "Invalid op when translating to MTLCompareFunction: %", op);
    }

    return func;
}

to_metal_stencil_operation :: (op: OP) -> MTLStencilOperation {
    func: MTLStencilOperation = .Keep;
    if op == {
    case .KEEP;
        func = .Keep;
    case .REPLACE;
        func = .Replace;
    case .INCREMENT_CLAMP;
        func = .IncrementClamp;
    case .DECREMENT_CLAMP;
        func = .DecrementClamp;
    case .INVERT;
        func = .Invert;
    case .INCREMENT_WRAP;
        func = .IncrementWrap;
    case .DECREMENT_WRAP;
        func = .DecrementWrap;
    case;
        Basic.assert(false, "Invalid op when translating to MTLStencilOperation: %", op);
    }
    return func;
}

to_metal_load_action :: (op: Load_OP) -> MTLLoadAction {
    if #complete op == {
    case .DONT_CARE;
        return .DontCare;
    case .LOAD;
        return .Load;
    case .CLEAR;
        return .Clear;
    }
}

to_metal_store_action :: (op: Store_OP) -> MTLStoreAction {
    if #complete op == {
    case .DONT_CARE;
        return .DontCare;
    case .STORE;
        return .Store;
    }
}

// This allocate an objc object
to_metal_color_attachment :: (target: Render_Pass_Attachment_Desc) -> *MTLRenderPassColorAttachmentDescriptor {
    desc :*MTLRenderPassColorAttachmentDescriptor = objc_new(MTLRenderPassColorAttachmentDescriptor);

    MTLRenderPassAttachmentDescriptor.setTexture_(xx desc, target.texture.mtl);
    MTLRenderPassAttachmentDescriptor.setLoadAction_(xx desc, to_metal_load_action(target.load_op));
    MTLRenderPassAttachmentDescriptor.setStoreAction_(xx desc, to_metal_store_action(target.store_op));

    c := target.clear_color;
    desc.setClearColor_(desc, .{c.x, c.y, c.z, c.w});

    return desc;
}

to_metal_depth_attachment :: (target: Render_Pass_Attachment_Desc) -> *MTLRenderPassDepthAttachmentDescriptor {
    desc :*MTLRenderPassDepthAttachmentDescriptor = objc_new(MTLRenderPassDepthAttachmentDescriptor);

    MTLRenderPassAttachmentDescriptor.setTexture_(xx desc, target.texture.mtl);
    MTLRenderPassAttachmentDescriptor.setLoadAction_(xx desc, to_metal_load_action(target.load_op));
    MTLRenderPassAttachmentDescriptor.setStoreAction_(xx desc, to_metal_store_action(target.store_op));

    desc.setClearDepth_(desc, xx target.clear_value.depth);

    return desc;
}

to_metal_stencil_attachment :: (target: Render_Pass_Attachment_Desc) -> *MTLRenderPassStencilAttachmentDescriptor {
    desc: *MTLRenderPassStencilAttachmentDescriptor = objc_new(MTLRenderPassStencilAttachmentDescriptor);

    MTLRenderPassAttachmentDescriptor.setTexture_(xx desc, target.texture.mtl);
    MTLRenderPassAttachmentDescriptor.setLoadAction_(xx desc, to_metal_load_action(target.load_op));
    MTLRenderPassAttachmentDescriptor.setStoreAction_(xx desc, to_metal_store_action(target.store_op));

    desc.setClearStencil_(desc, target.clear_value.stencil);
    return desc;
}

set_metal_render_pass_descriptor :: (descriptor: *MTL4RenderPassDescriptor, desc: Render_Pass_Desc) {
    color_attachment_array := descriptor.colorAttachments(descriptor);

    // Since Metal only supports up to 8 attachments, we set all of
    // them back to nil before doing anything else.
    for 0..7 {
        color_attachment_array.setObject_atIndexedSubscript_(color_attachment_array, null, xx it);
    }

    // This is not ideal, maybe we should create a persistent color
    // attachment, but in most case, there is only only color target.
    for color_target: desc.color_targets {
        color_attachment := to_metal_color_attachment(color_target);
        defer release(color_attachment);

        // It should be safe to instantly release the attachment,
        // since Metal uses copy when setting.
        color_attachment_array.setObject_atIndexedSubscript_(color_attachment_array, color_attachment, xx it_index);
    }

    if desc.depth_target.texture.mtl == null {
        descriptor.setDepthAttachment_(descriptor, null);
    } else {
        depth_attachment := to_metal_depth_attachment(desc.depth_target);
        defer release(depth_attachment);

        descriptor.setDepthAttachment_(descriptor, depth_attachment);
    }

    if desc.stencil_target.texture.mtl == null {
        descriptor.setStencilAttachment_(descriptor, null);
    } else {
        stencil_attachment := to_metal_stencil_attachment(desc.stencil_target);
        defer release(stencil_attachment);
        descriptor.setStencilAttachment_(descriptor, stencil_attachment);
    }
}

// assert_spvc :: (result: spvc_result) #expand {
//     using context.gpu_context;
//     `Basic.assert(result == .SUCCESS, "spvc result %, reason %", result, to_string(spvc_context_get_last_error_string(spirv_cross_context)));
// }

assert_metal :: (error: *NSError) #expand {
    `Basic.assert(error == null, "%", to_string(NSError.localizedDescription(error)));
}


aquire_next_command_buffer :: () -> *Command_Buffer {
    using context.gpu_context;

    a := *command_buffers[command_buffer_index];

    if command_buffer_index >= DEFAULT_COMMAND_BUFFER_COUNT - 1 {
        command_buffer_index = 0;
    } else {
        command_buffer_index += 1;
    }

    return a;
}

create_render_encoder :: (cb: *Command_Buffer) {
    Basic.assert(cb.render_encoder == null, "There is already a render encoder");

    cb.render_encoder = cb.cmd.renderCommandEncoderWithDescriptor_(cb.cmd, cb.render_pass_descriptor);
}

end_render_encoder :: (cb: *Command_Buffer) {
    Basic.assert(cb.render_encoder != null, "There is not recording render encoder");
    MTLCommandEncoder.endEncoding(xx cb.render_encoder);
    release(cb.render_encoder);
    cb.render_encoder = null;
}

maybe_create_compute_encoder :: (cb: *Command_Buffer) {
    Basic.assert(cb.render_encoder == null, "Trying to create a compute encoder but the current command buffer is recording render commands");
    if cb.compute_encoder == null {
        cb.compute_encoder = cb.cmd.computeCommandEncoder(cb.cmd);
    }
}

maybe_end_compute_encoder :: (cb: *Command_Buffer) {
    Basic.assert(cb.render_encoder == null, "A render encoder is still recording");

    if cb.compute_encoder {
        MTLCommandEncoder.endEncoding(xx cb.compute_encoder);
        release(cb.compute_encoder);
        cb.compute_encoder = null;
    }
}

get_optimal_1D_threadgroup_size :: (pipeline_state: *MTLComputePipelineState) -> NSUInteger {
    execution_width := pipeline_state.threadExecutionWidth(pipeline_state);
    max_threads     := pipeline_state.maxTotalThreadsPerThreadgroup(pipeline_state);

    threadgroup_size := (max_threads / execution_width) * execution_width;

    return threadgroup_size;
}

// This thing is generated by grok, maybe broken.
bytes_per_pixel :: (format: MTLPixelFormat) -> u64 {
    if format == {
    // 1 byte formats
    case .A8Unorm;
        #through;
    case .R8Unorm;
        #through;
    case .R8Unorm_sRGB;
        #through;
    case .R8Snorm;
        #through;
    case .R8Uint;
        #through;
    case .R8Sint;
        return 1;

    // 2 byte formats
    case .R16Unorm;
        #through;
    case .R16Snorm;
        #through;
    case .R16Uint;
        #through;
    case .R16Sint;
        #through;
    case .R16Float;
        #through;
    case .RG8Unorm;
        #through;
    case .RG8Unorm_sRGB;
        #through;
    case .RG8Snorm;
        #through;
    case .RG8Uint;
        #through;
    case .RG8Sint;
        #through;
    case .B5G6R5Unorm;
        #through;
    case .A1BGR5Unorm;
        #through;
    case .ABGR4Unorm;
        #through;
    case .BGR5A1Unorm;
        return 2;

    // 4 byte formats
    case .R32Uint;
        #through;
    case .R32Sint;
        #through;
    case .R32Float;
        #through;
    case .RG16Unorm;
        #through;
    case .RG16Snorm;
        #through;
    case .RG16Uint;
        #through;
    case .RG16Sint;
        #through;
    case .RG16Float;
        #through;
    case .RGBA8Unorm;
        #through;
    case .RGBA8Unorm_sRGB;
        #through;
    case .RGBA8Snorm;
        #through;
    case .RGBA8Uint;
        #through;
    case .RGBA8Sint;
        #through;
    case .BGRA8Unorm;
        #through;
    case .BGRA8Unorm_sRGB;
        #through;
    case .RGB10A2Unorm;
        #through;
    case .RGB10A2Uint;
        #through;
    case .BGR10A2Unorm;
        #through;
    case .RG11B10Float;
        #through;
    case .RGB9E5Float;
        return 4;

    // 8 byte formats
    case .RG32Uint;
        #through;
    case .RG32Sint;
        #through;
    case .RG32Float;
        #through;
    case .RGBA16Unorm;
        #through;
    case .RGBA16Snorm;
        #through;
    case .RGBA16Uint;
        #through;
    case .RGBA16Sint;
        #through;
    case .RGBA16Float;
        return 8;

    // 16 byte formats
    case .RGBA32Uint;
        #through;
    case .RGBA32Sint;
        #through;
    case .RGBA32Float;
        return 16;

    // Compressed / depth / stencil / unsupported
    case;
        return 0;
    }
}

to_metal_stages :: (stage: Stage) -> MTLStages {
    s: MTLStages;
    if stage & .COMPUTE {
        s |= .Dispatch;
    }
    if stage & .VERTEX {
        s |= .Vertex;
    }
    if stage & .FRAGMENT {
        s |= .Fragment;
    }
    if stage & .COPY || stage & .BLIT {
        s |= .Blit;
    }
    if stage & .ALL {
        s |= .All;
    }

    return s;
}

to_metal_topology_class :: (topology: Topology) -> MTLPrimitiveTopologyClass {
    m: MTLPrimitiveTopologyClass;
    if #complete topology == {
    case .POINT_LIST;
        m = .Point;
    case .LINE_LIST;
        m = .Line;
    case .LINE_STRIP;
        m = .Line;
    case .TRIANGLE_LIST;
        m = .Triangle;
    case .TRIANGLE_STRIP;
        m = .Triangle;
    case .TRIANGLE_FAN;
        m = .Triangle;
    }

    return m;
}

to_metal_primitive_type :: (topology: Topology) -> MTLPrimitiveType {
    m: MTLPrimitiveType;
    if #complete topology == {
    case .POINT_LIST;
        m = .Point;
    case .LINE_LIST;
        m = .Line;
    case .LINE_STRIP;
        m = .LineStrip;
    case .TRIANGLE_LIST;
        m = .Triangle;
    case .TRIANGLE_STRIP;
        m = .TriangleStrip;
    case .TRIANGLE_FAN;
        Basic.log("There is no triangle fan in Metal you know?");
        m = .TriangleStrip;
    }

    return m;
}

metal_texture_size :: (metal_texture: *MTLTexture) -> MTLSize {
    return .{
        width = MTLTexture.width(metal_texture),
        height = MTLTexture.height(metal_texture),
        depth = MTLTexture.depth(metal_texture),
    };
}

to_metal_sampler_min_mag_filter :: (filter: Sampler_Min_Mag_Filter) -> MTLSamplerMinMagFilter {
    mtl: MTLSamplerMinMagFilter;
    if #complete filter == {
    case .NEAREST;
        mtl = .Nearest;
    case .LINEAR;
        mtl = .Linear;
    }

    return mtl;
}

to_metal_sampler_mip_filter :: (filter: Sampler_Mip_Filter) -> MTLSamplerMipFilter {
    mtl: MTLSamplerMipFilter;
    if #complete filter == {
    case .NONE;
        mtl = .NotMipmapped;
    case .NEAREST;
        mtl = .Nearest;
    case .LINEAR;
        mtl = .Linear;
    }
    return mtl;
}

to_metal_sampler_address_mode :: (mode: Sampler_Address_Mode) -> MTLSamplerAddressMode {
    mtl: MTLSamplerAddressMode;
    if #complete mode == {
    case .CLAMP_TO_EDGE;
        mtl = .ClampToEdge;
    case .MIRROR_CLAMP_TO_EDGE;
        mtl = .MirrorClampToEdge;
    case .REPEAT;
        mtl = .Repeat;
    case .MIRROR_REPEAT;
        mtl = .MirrorRepeat;
    case .CLAMP_TO_ZERO;
        mtl = .ClampToZero;
    case .CLAMP_TO_BORDER_COLOR;
        mtl = .ClampToBorderColor;
    }

    return mtl;
}

to_metal_sampler_border_color :: (color: Sampler_Border_Color) -> MTLSamplerBorderColor {
    mtl: MTLSamplerBorderColor;
    if #complete color == {
    case .TRANSPARENT_BLACK;
        mtl = .TransparentBlack;
    case .OPAQUE_BLACK;
        mtl = .OpaqueBlack;
    case .OPAQUE_WHITE;
        mtl = .OpaqueWhite;
    }
    return mtl;
}

to_metal_sampler_reduction_mode :: (mode: Sampler_Reduction_Mode) -> MTLSamplerReductionMode {
    mtl: MTLSamplerReductionMode;
    if #complete mode == {
    case .WEIGHTED_AVERAGE;
        mtl = .WeightedAverage;
    case .MINIMUM;
        mtl = .Minimum;
    case .MAXIMUM;
        mtl = .Maximum;
    }

    return mtl;
}

to_metal_sampler_descriptor :: (desc: Sampler_Desc) -> *MTLSamplerDescriptor {
    mtl := objc_new(MTLSamplerDescriptor);
    MTLSamplerDescriptor.setMinFilter_(mtl, to_metal_sampler_min_mag_filter(desc.min_filter));
    MTLSamplerDescriptor.setMagFilter_(mtl, to_metal_sampler_min_mag_filter(desc.mag_filter));
    MTLSamplerDescriptor.setMipFilter_(mtl, to_metal_sampler_mip_filter(desc.mip_filter));
    MTLSamplerDescriptor.setMaxAnisotropy_(mtl, xx desc.max_anisotropy);
    MTLSamplerDescriptor.setSAddressMode_(mtl, to_metal_sampler_address_mode(desc.s_address_mode));
    MTLSamplerDescriptor.setTAddressMode_(mtl, to_metal_sampler_address_mode(desc.t_address_mode));
    MTLSamplerDescriptor.setRAddressMode_(mtl, to_metal_sampler_address_mode(desc.r_address_mode));
    MTLSamplerDescriptor.setBorderColor_(mtl, to_metal_sampler_border_color(desc.border_color));
    MTLSamplerDescriptor.setReductionMode_(mtl, to_metal_sampler_reduction_mode(desc.reduction_mode));
    MTLSamplerDescriptor.setNormalizedCoordinates_(mtl, ifx desc.normalized_coordinates then YES else NO);
    MTLSamplerDescriptor.setLodMinClamp_(mtl, desc.lod_min_clamp);
    MTLSamplerDescriptor.setLodMaxClamp_(mtl, desc.lod_max_clamp);
    MTLSamplerDescriptor.setLodBias_(mtl, desc.lod_bias);
    MTLSamplerDescriptor.setCompareFunction_(mtl, to_metal_compare_function(desc.compare_op));

    // lodAverage??

    // This line is a necessary. In this implementation, sampler is
    // passed as a resouce id to the shader, without this line, the
    // sampler is not valid in the shader, resulting in a black image.
    MTLSamplerDescriptor.setSupportArgumentBuffers_(mtl, YES);

    return mtl;
}

#import "Metal";
Basic :: #import "Basic";
#import "SDL3";
#import "macOS";
#import "Objective_C";
File :: #import "File";
String :: #import "String";
#import "Hash_Table";
Vulkan :: #import "Vulkan";
#load "format.jai";
#import "Flat_Pool";
