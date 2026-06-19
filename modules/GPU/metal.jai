// This implementation is based on Metal 4, some of the older things
// suggested by No Graphics API that based on Metal is no longer
// valid, for example a command buffer based on a queue, now Metal 4
// mimics that behaviour of Vulkan, I don't really know whether this
// is a good idea or not.

DEFAULT_COMMAND_BUFFER_COUNT :: 5;

GPU_Context :: struct {
    device:          *MTLDevice;
    sdl_window:      *SDL_Window;
    view:            SDL_MetalView;
    layer:           *CAMetalLayer;
    compiler:        *MTL4Compiler;
    command_buffers: [DEFAULT_COMMAND_BUFFER_COUNT] Command_Buffer;

    current_command_buffer_index:= 0;

    spirv_cross_context:    spvc_context;

    // Useful for checking size and alignment.
    temp_texture_descriptor: *MTLTextureDescriptor;
    cpu_pointer_table:       Table(*void, Allocation);
    gpu_pointer_table:       Table(u64, Allocation);

    argument_table_descriptor: *MTL4ArgumentTableDescriptor;
    argument_table:            *MTL4ArgumentTable;
}

#add_context gpu_context: GPU_Context;

Allocation :: struct {
    cpu:    *void;
    gpu:    u64;
    size:   u64;
    buffer: *MTLBuffer;
}

Texture :: struct {
    #as mtl: *MTLTexture;
};

Pipeline :: struct {
    render:     *MTLRenderPipelineState;
    compute:    *MTLComputePipelineState;
    is_compute: bool = false;
}

Depth_Stencil_State :: struct {
    #as mtl: *MTLDepthStencilState;
};

Queue :: struct {
    #as mtl: *MTL4CommandQueue;
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
    is_recording:           bool;

    render_pass_descriptor: *MTL4RenderPassDescriptor;
}

Semaphore :: struct {
    #as shared_event: *MTLSharedEvent;
};

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
    assert_metal(error);

    spv_result := spvc_context_create(*spirv_cross_context);
    assert_spvc(spv_result);

    if window {
        sdl_window = window;
        view = SDL_Metal_CreateView(window);
        layer = SDL_Metal_GetLayer(view);
    }
}

deinit :: () {
    using context.gpu_context;
    for command_buffers {
        release(it.cmd);
        release(it.command_allocator);
        release(it.render_pass_descriptor);
    }

    if spirv_cross_context {
        spvc_context_destroy(spirv_cross_context);
    }
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
        table_add(*cpu_pointer_table, allocation.cpu, allocation);
        table_add(*gpu_pointer_table, allocation.gpu, allocation);
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

    return allocation;
}

metal_deallocate :: (allocation: Allocation) {
    release(allocation.buffer);
}

texture_size_align :: (desc: Texture_Desc) -> Texture_Size_Align {
    using context.gpu_context;
    to_metal_texture_descriptor(temp_texture_descriptor, desc);
    metal_size_align := MTLDevice.heapTextureSizeAndAlignWithDescriptor_(device, temp_texture_descriptor);

    return .{size = metal_size_align.size, align = metal_size_align.align};
}

// I am not sure if I should reuse the temp descriptor, or create a
// one-time descriptor every time when I call this function. But real
// life use case, we should not be creating a lot of texture, right?
create_texture :: (desc: Texture_Desc, allocation: Allocation) -> Texture {
    using context.gpu_context;
    metal_desc := objc_new(MTLTextureDescriptor);
    defer release(metal_desc);

    to_metal_texture_descriptor(metal_desc, desc);
    return MTLDevice.newTextureWithDescriptor_(device, metal_desc);
}

texture_view_descriptor :: (texture: Texture, desc: View_Desc) -> Texture_Descriptor {
    // This is so weird, view desc does not state the type
    type := MTLTexture.textureType(texture);
    view := MTLTexture.newTextureViewWithPixelFormat_textureType_levels_slices_(texture, to_metal_format(desc.format), type, .{desc.base_mip, desc.mip_count}, .{desc.base_layer, desc.layer_count});

    gpu_handle := MTLTexture.gpuResourceID(view);
    descriptor: Texture_Descriptor;
    memcpy(*descriptor, *gpu_handle, size_of(gpu_handle));

    return descriptor;
}

// TODO: WTF is this, I have no idea why we need to have a rw version,
// now it just call the same thing.
rw_texture_view_descriptor :: (texture: Texture, desc: View_Desc) -> Texture_Descriptor {
    return texture_view_descriptor(texture, desc);
}

create_compute_pipeline_msl :: (compute_shader_msl: string, entry_point: string = "compute_main") -> Pipeline {
    using context.gpu_context;

    mtl_options: *MTLCompileOptions = objc_new(MTLCompileOptions);
    mtl_options.setLanguageVersion_(mtl_options, MTLLanguageVersion.e4_0);

    error: *NSError;
    library_desc := objc_new(MTL4LibraryDescriptor);
    defer release(library_desc);
    MTL4LibraryDescriptor.setSource_(library_desc, NSString.getTempString(compute_shader_msl));
    MTL4LibraryDescriptor.setOptions_(library_desc, mtl_options);

    library := MTL4Compiler.newLibraryWithDescriptor_error_(compiler, library_desc, *error);
    assert_metal(error);

    function_desc := objc_new(MTL4LibraryFunctionDescriptor);
    defer release(function_desc);
    MTL4LibraryFunctionDescriptor.setLibrary_(function_desc, library);
    MTL4LibraryFunctionDescriptor.setName_(function_desc, NSString.getTempString(entry_point));

    compute_pipeline_desc := objc_new(MTL4ComputePipelineDescriptor);
    defer release(compute_pipeline_desc);

    MTL4ComputePipelineDescriptor.setComputeFunctionDescriptor_(compute_pipeline_desc, xx function_desc);
    pipeline_state := MTL4Compiler.newComputePipelineStateWithDescriptor_compilerTaskOptions_error_(compiler, compute_pipeline_desc, null, *error);
    assert_metal(error);

    return .{compute = pipeline_state, is_compute = true};
}

// The IR passed here is spirv, we use spirv cross to turn spirv into metal shader
create_compute_pipeline :: (compute_ir: string, entry_point: string = "compute_main") -> Pipeline {
    using context.gpu_context;

    shader_string := spirv_to_metal_shader(compute_ir);
    defer spvc_context_release_allocations(spirv_cross_context);

    return create_compute_pipeline_msl(shader_string, entry_point);
}

// create_graphics_pipeline_with_filename :: (shader_path: string, desc: Raster_Desc, vertex_function_name: string = "vertex_main", fragment_function_main: string = "fragment_main") -> Pipeline {
//     using context.gpu_context;
//     shader_string := read_entire_file(shader_path);
//     defer Basic.free(shader_string);

//     error: *NSError;
//     library_desc := objc_new(MTL4LibraryDescriptor);
//     defer release(library_desc);
//     MTL4LibraryDescriptor.setSource_(library_desc, NSString.getTempString(shader_string));

//     library := MTL4Compiler.newLibraryWithDescriptor_error_(compiler, *error);
//     assert(error == null, "Error creating library: %", to_string(NSError.localizedDescription(error)));

//     vert_func_desc := objc_new(MTL4LibraryFunctionDescriptor);
//     defer release(vert_func_desc);
//     frag_func_desc := objc_new(MTL4LibraryFunctionDescriptor);
//     defer release(frag_func_desc);

//     MTL4LibraryFunctionDescriptor.setLibrary_(vert_func_desc, library);
//     MTL4LibraryFunctionDescriptor.setName_(vert_func_desc, NSString.getTempString(vertex_function_name));

//     MTL4LibraryFunctionDescriptor.setLibrary_(frag_func_desc, library);
//     MTL4LibraryFunctionDescriptor.setName_(frag_func_desc, NSString.getTempString(fragment_function_name));

//     render_pipeline_desc := objc_new(MTL4RenderPipelineDescriptor);
//     defer release(render_pipeline_desc);

//     MTL4RenderPipelineDescriptor.setVertexFunctionDescriptor_(render_pipeline_desc, vert_func_desc);
//     MTL4RenderPipelineDescriptor.setFragmentFunctionDescriptor_(render_pipeline_desc, frag_func_desc);

//     MTL4RenderPipelineDescriptor.setRasterSampleCount_(render_pipeline_desc, xx desc.sample_count);
//     MTL4RenderPipelineDescriptor.setAlphaToCoverageState_(render_pipeline_desc, ifx desc.alpha_to_coverage then .Enabled else .Disabled);


//     color_attachments := MTL4RenderPipelineDescriptor.colorAttachments(render_pipeline_desc);
//     for target: desc.color_targets {
//         attachment := objc_new(MTL4RenderPipelineColorAttachmentDescriptor);
//         MTL4RenderPipelineColorAttachmentDescriptor.setPixelFormat_(attachment, to_metal_format(target.format));
//         // There are two write mask, one in color target, one in
//         // blendstate, the current logic is that if the blendstate is
//         // present, the color mask for all targets would be the mask
//         // specified in blend desc

//         MTL4RenderPipelineColorAttachmentDescriptor.setWriteMask_(attachment, to_metal_write_mask(target.write_mask));
//         if desc.blendstate {
//             MTL4RenderPipelineColorAttachmentDescriptor.setSourceRGBBlendFactor_(attachment, to_metal_blend_factor(desc.blendstate.src_color_factor));
//             MTL4RenderPipelineColorAttachmentDescriptor.setSourceAlphaBlendFactor_(attachment, to_metal_blend_factor(desc.blendstate.src_alpha_factor));
//             MTL4RenderPipelineColorAttachmentDescriptor.setDestinationRGBBlendFactor_(attachment, to_metal_blend_factor(desc.blendstate.dst_color_factor));
//             MTL4RenderPipelineColorAttachmentDescriptor.setDestinationAlphaBlendFactor_(attachment, to_metal_blend_factor(desc.blendstate.dst_alpha_factor));
//             MTL4RenderPipelineColorAttachmentDescriptor.setRgbBlendOperation_(attachment, to_metal_blend_operation(desc.blendstate.color_op));
//             MTL4RenderPipelineColorAttachmentDescriptor.setAlphaBlendOperation_(attachment, to_metal_blend_operation(desc.blendstate.alpha_op));
//         }

//         MTL4RenderPipelineColorAttachmentDescriptorArray.setObject_atIndexedSubscript_(color_attachments, attachment, xx it_index);
//     }


//     pipeline_state := MTL4Compiler.newRenderPipelineStateWithDescriptor_compilerTaskOptions_error_(compiler, render_pipeline_desc, null, *error);
//     assert(error == null, "Error creating render PSO: %", to_string(NSError.localizedDescription(error)));

//     return .{render = pipeline_state};
// }

free_pipeline :: (pipeline: Pipeline) {
    if pipeline.is_compute {
        release(pipeline.compute);
    } else {
        release(pipeline.render);
    }
}

// State objects
// create_depth_stencil_state :: (desc: Depth_Stencil_Desc) -> Depth_Stencil_State {
//     using context.gpu_context;

//     depth_stencil_desc := objc_new(MTLDepthStencilDescriptor);
//     defer release(depth_stencil_desc);

//     if desc.depth_mode & .READ {
//         MTLDepthStencilDescriptor.setDepthCompareFunction_(depth_stencil_desc, to_metal_compare_function(desc.depth_test));
//     }

//     MTLDepthStencilDescriptor.setDepthWriteEnabled_(depth_stencil_desc, ifx desc.depth_mode & .WRITE then YES else NO);

//     front_stencil := objc_new(MTLStencilDescriptor);
//     defer release(front_stencil);
//     MTLStencilDescriptor.setStencilCompareFunction_(front_stencil, to_metal_compare_function(desc.stencil_front.test));
//     MTLStencilDescriptor.setStencilFailureOperation_(front_stencil, to_metal_stencil_operation(desc.stencil_front.fail_op));
//     MTLStencilDescriptor.setDepthStencilPassOperation_(front_stencil, nto_metal_stencil_operation(desc.stencil_front.pass_op));
//     MTLStencilDescriptor.setDepthFailureOperation_(front_stencil, to_metal_stencil_operation(desc.stencil_front.depth_fail_op));

//     MTLDepthStencilDescriptor.setFrontFaceStencil_(depth_stencil_desc, front_stencil);

//     back_stencil := objc_new(MTLStencilDescriptor);
//     defer release(back_stencil);
//     MTLStencilDescriptor.setStencilCompareFunction_(back_stencil, to_metal_compare_function(desc.stencil_back.test));
//     MTLStencilDescriptor.setStencilFailureOperation_(back_stencil, to_metal_stencil_operation(desc.stencil_back.fail_op));
//     MTLStencilDescriptor.setDepthStencilPassOperation_(back_stencil, nto_metal_stencil_operation(desc.stencil_back.pass_op));
//     MTLStencilDescriptor.setDepthFailureOperation_(back_stencil, to_metal_stencil_operation(desc.stencil_back.depth_fail_op));

//     MTLDepthStencilDescriptor.setBackFaceStencil_(depth_stencil_desc, back_stencil);

//     state := MTLDevice.newDepthStencilStateWithDescriptor_(device, depth_stencil_desc);

//     return state;
// }

// free_depth_stencil_state :: (state: Depth_Stencil_State) {
//     release(state);
// }

// We are only supporting one main queue, in modern hardwares, we
// should submit everything to the main queue.
create_queue :: () -> Queue {
    using context.gpu_context;
    // Currently, a simple queue is created
    queue := MTLDevice.newMTL4CommandQueue(device);
    return .{queue};
}

// Since we have one type of queue, we have no way to know what type
// of command we are using, we cannot create an encoder in this
// function. So we should defer the creation of the encoder to every
// compute action and perform a single if check. Not sure if that
// would affect performance.
start_command_recording :: () -> *Command_Buffer {
    using context.gpu_context;
    command_buffer := aquire_next_command_buffer();
    {
        using command_buffer;
        command_allocator.reset(command_allocator);
        cmd.beginCommandBufferWithAllocator_(cmd, command_allocator);
        is_recording = false;
        compute_encoder = null;
        render_encoder = null;
    }

    return command_buffer;
}

// This function looks weird, what the hell, queue is not used at all in metal.
submit :: (queue: Queue, command_buffers: []*Command_Buffer, wait: []Semaphore_Pair = .[], signal: []Semaphore_Pair = .[]) {
    Basic.auto_release_temp();
    for wait {
        MTL4CommandQueue.waitForEvent_value_(queue, xx it.semaphore.shared_event, it.value);
    }

    buffers := Basic.NewArray(command_buffers.count, *MTL4CommandBuffer,, Basic.temp);
    for cb: command_buffers {
        buffers[it_index] = cb.cmd;
        if cb.is_recording {
            if cb.compute_encoder {
                MTLCommandEncoder.endEncoding(xx cb.compute_encoder);
                release(cb.compute_encoder);
            } else {
                MTLCommandEncoder.endEncoding(xx cb.render_encoder);
                release(cb.render_encoder);
            }
        }
        MTL4CommandBuffer.endCommandBuffer(cb.cmd);
    }

    MTL4CommandQueue.commit_count_(queue, buffers.data, xx command_buffers.count);

    for signal {
        MTL4CommandQueue.signalEvent_value_(queue, xx it.semaphore.shared_event, it.value);
    }
}

create_semaphore :: (init_value: u64) -> Semaphore {
    using context.gpu_context;
    event := MTLDevice.newSharedEvent(device);
    event.setSignaledValue_(event, init_value);
    return .{event};
}

wait_semaphore :: (sema: Semaphore, value: u64, timeout: u64 = 0) {
    // The current timeout is 0, which is infinite
    success := MTLSharedEvent.waitUntilSignaledValue_timeoutMS_(sema, value, timeout);
    if !success {
        Basic.log("Timeout waiting semaphore, value: %, timeout: %", value, timeout);
    }
}

destroy_semaphore :: (sema: Semaphore) {
    release(sema.event);
}

memcpy :: (cb: *Command_Buffer, dest: u64, src: u64, size: s64) {
    using context.gpu_context;

    create_compute_encoder_and_maybe_end_render_encoder(cb);

    dest_allocation := gpu_pointer_to_allocation(dest);
    src_allocation  := gpu_pointer_to_allocation(src);

    cb.compute_encoder.copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_(cb.compute_encoder, src_allocation.buffer, src - src_allocation.gpu, dest_allocation.buffer, dest - dest_allocation.gpu, xx size);
}

set_pipeline :: (cb: *Command_Buffer, pipeline: Pipeline) {
    if pipeline.is_compute {
        create_compute_encoder_and_maybe_end_render_encoder(cb);
        e := cb.compute_encoder;
        e.setComputePipelineState_(e, pipeline.compute);
    } else {
        create_render_encoder_and_maybe_end_compute_encoder(cb);
        e := cb.render_encoder;
        e.setRenderPipelineState_(e, pipeline.render);
    }
}

dispatch :: (cb: *Command_Buffer, data_gpu: u64, count: u32) {
    using context.gpu_context;

    MTL4ArgumentTable.setAddress_atIndex_(argument_table, data_gpu, 0);

    create_compute_encoder_and_maybe_end_render_encoder(cb);

    cb.compute_encoder.setArgumentTable_(cb.compute_encoder, argument_table);

    dispatch_threads := MTLSize.{count, 1, 1};

    // 256 is hardcoded, always use 256 in the slang shader
    //
    // Caution!!!
    // dispatchThreads_threadsPerThreadgroup_ and
    // dispatchThreadgroups_threadsPerThreadgroup_ is completely
    // different thing, the latter one is what we want.
    cb.compute_encoder.dispatchThreadgroups_threadsPerThreadgroup_(cb.compute_encoder, dispatch_threads, .{256, 1, 1});
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

to_metal_format :: (format: Format) -> MTLPixelFormat {
    metal_format: MTLPixelFormat = .Invalid;
    if format == {
    case .RGBA8_UNORM;
        metal_format = .RGBA8Unorm;
    case .D32_FLOAT;
        metal_format = .Depth32Float;
    case .D24_UNORM_S8;
        metal_format = .Depth24Unorm_Stencil8;
    }

    return metal_format;
}

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
    case .e2D_ARRAY;
        metal_texture_type = .e2DArray;
    case .CUBE_ARRAY;
        metal_texture_type = .CubeArray;
    }

    return metal_texture_type;
}

to_metal_texture_usage :: (texture_usage: Texture_Usage) -> MTLTextureUsage {
    // They are exactly the same
    return cast(MTLTextureUsage)texture_usage;
}

to_metal_blend_factor :: (factor: Factor) -> MTLBlendFactor {
    metal_factor: MTLBlendFactor = .Unspecialized;
    if factor == {
    case .ZERO;
        metal_factor = .Zero;
    case .ONE;
        metal_factor = .One;
    case .SRC_COLOR;
        metal_factor = .SourceColor;
    case .DST_COLOR;
        metal_factor = .DestinationColor;
    case .SRC_ALPHA;
        metal_factor = .SourceAlpha;
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

    metal_mask = cast(MTLColorWriteMask) mask;

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
    case .LESS_EQUAL;
        func = .LessEqual;
    case .GREATER;
        func = .Greater;
    case .NOT_EQUAL;
        func = .NotEqual;
    case .GREATER_EQUAL;
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

to_metal_render_pass_descriptor :: (desc: Render_Pass_Desc) -> *MTLRenderPassDescriptor {

}

assert_spvc :: (result: spvc_result) #expand {
    using context.gpu_context;
    `Basic.assert(result == .SUCCESS, "spvc result %, reason %", result, to_string(spvc_context_get_last_error_string(spirv_cross_context)));
}

assert_metal :: (error: *NSError) #expand {
    `Basic.assert(error == null, "%", to_string(NSError.localizedDescription(error)));
}

// The return string's memory is managed by spvc context, no need to free.
spirv_to_metal_shader :: (spirv: string) -> string {
    using context.gpu_context;

    ir: spvc_parsed_ir;
    // In spirv, a word is 32bits, and the count is word count
    result := spvc_context_parse_spirv(spirv_cross_context, xx spirv.data, xx (spirv.count / 4), *ir);
    assert_spvc(result);

    my_compiler: spvc_compiler;
    result = spvc_context_create_compiler(spirv_cross_context, .MSL, ir, .TAKE_OWNERSHIP, *my_compiler);
    assert_spvc(result);

    my_options: spvc_compiler_options;
    result = spvc_compiler_create_compiler_options(my_compiler, *my_options);
    assert_spvc(result);
    result = spvc_compiler_options_set_uint(my_options, .MSL_VERSION, SPVC_MAKE_MSL_VERSION(4, 0, 0));
    assert_spvc(result);
    // result = spvc_compiler_options_set_bool(my_options, .MSL_ARGUMENT_BUFFERS, SPVC_TRUE);
    // assert_spvc(result);

    spvc_compiler_install_compiler_options(my_compiler, my_options);

    msl_source: *u8;
    result = spvc_compiler_compile(my_compiler, *msl_source);
    assert_spvc(result);

    return to_string(msl_source);
}

aquire_next_command_buffer :: () -> *Command_Buffer {
    using context.gpu_context;

    a := *command_buffers[current_command_buffer_index];

    if current_command_buffer_index >= DEFAULT_COMMAND_BUFFER_COUNT {
        current_command_buffer_index = 0;
    } else {
        current_command_buffer_index += 1;
    }

    return a;
}

create_compute_encoder_and_maybe_end_render_encoder :: (cb: *Command_Buffer) {
    if cb.is_recording {
        if cb.render_encoder != null {
            cb.render_encoder.(*MTLCommandEncoder).endEncoding(xx cb.render_encoder);
            release(cb.render_encoder);
            cb.render_encoder = null;
        }
    } else {
        cb.is_recording = true;
    }

    if cb.compute_encoder == null {
        cb.compute_encoder = cb.cmd.computeCommandEncoder(cb.cmd);
    }

}

create_render_encoder_and_maybe_end_compute_encoder :: (cb: *Command_Buffer) {
    if cb.is_recording {
        if cb.compute_encoder != null {
            cb.compute_encoder.(*MTLCommandEncoder).endEncoding(xx cb.compute_encoder);
            release(cb.compute_encoder);
            cb.compute_encoder = null;
        }
    } else {
        cb.is_recording = true;
    }

    if cb.render_encoder == null {
        cb.render_encoder = cb.cmd.renderCommandEncoderWithDescriptor_(cb.cmd, cb.render_pass_descriptor);
    }
}

get_optimal_1D_threadgroup_size :: (pipeline_state: *MTLComputePipelineState) -> NSUInteger {
    execution_width := pipeline_state.threadExecutionWidth(pipeline_state);
    max_threads     := pipeline_state.maxTotalThreadsPerThreadgroup(pipeline_state);

    threadgroup_size := (max_threads / execution_width) * execution_width;

    return threadgroup_size;
}

#import "Metal";
Basic :: #import "Basic";
#import "SDL3";
#import "macOS";
#import "Objective_C";
File :: #import "File";
String :: #import "String";
#import "spirv_cross";
#import "Hash_Table";
