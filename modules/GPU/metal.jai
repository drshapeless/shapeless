// This implementation is based on Metal 4, some of the older things
// suggested by No Graphics API that based on Metal is no longer
// valid, for example a command buffer based on a queue, now Metal 4
// mimics that behaviour of Vulkan, I don't really know whether this
// is a good idea or not.

GPU_Context :: struct {
    device:                  *MTLDevice;
    sdl_window:              *SDL_Window;
    view:                    SDL_MetalView;
    layer:                   *CAMetalLayer;
    compiler:                *MTL4Compiler;

    spirv_cross_context:     spvc_context;

    // Useful for checking size and alignment.
    temp_texture_descriptor: *MTLTextureDescriptor;
}

Allocation :: struct {
    cpu:    *void;
    gpu:    u64;
    buffer: *MTLBuffer;
    offset: u64;
}

Texture :: *MTLTexture;
Pipeline :: struct {
    render: *MTLRenderPipelineState;
    compute: *MTLComputePipelineState;
    is_compute: bool = false;
}

Depth_Stencil_State :: *MTLDepthStencilState;

Queue :: struct {
    #as mtl: *MTL4CommandQueue;
}
Command_Buffer :: struct {
    #as mtl: *MTL4CommandBuffer;
}

Semaphore :: *MTLSharedEvent;

init :: (window: *SDL_Window = null) {
    init_objective_c();
    init_metal();
    context.gpu_context = Basic.alloc(size_of(GPU_Context));
    using context.gpu_context;

    device = MTLCreateSystemDefaultDevice();
    temp_texture_descriptor = objc_new(MTLTextureDescriptor);

    error: *NSError;

    compiler_desc := objc_new(MTL4CompilerDescriptor);
    defer release(compiler_desc);
    compiler = MTLDevice.newCompilerWithDescriptor_error_(device, compiler_desc, *error);
    Basic.assert(error == null, "Error creating compiler: %", to_string(NSError.localizedDescription(error)));

    spv_result := spvc_context_create(*spirv_cross_context);
    assert_spvc(spv_result == .SUCCESS);

    if window {
        sdl_window = window;
        view = SDL_Metal_CreateView(window);
        layer = SDL_Metal_GetLayer(view);
    }
}

deinit :: () {
    using context.gpu_context;
    SDL_Metal_DestroyView(view);
    release(compiler);
    release(temp_texture_descriptor);
    release(device);
    Basic.free(context.gpu_context);
}

// // Allocating arbitary memory in Metal is just allocating a buffer
// alloc :: (bytes: u64) -> Allocation {
//     using context.gpu_context;

//     buffer := MTLDevice.newBufferWithLength_options_(device, bytes, .StorageModeShared);
//     allocation: Allocation;
//     allocation.cpu = MTLBuffer.contents(buffer);
//     allocation.gpu = MTLBuffer.gpuAddress(buffer);
//     allocation.buffer = buffer;

//     return allocation;
// }

// // Since all buffer are aligned in the strictest alignment requirement
// // to my knowledge, we just ignore the alignment.
// alloc :: (bytes: u64, align: u64) -> Allocation {
//     return alloc(bytes);
// }

// free :: (allocation: Allocation) {
//     // We should do something like this
//     // [buffer setPurgeableState:MTLPurgeableStateEmpty]
//     // But it is a thing of MTLHeap, I am lazy to cast.
//     release(allocation.buffer);
// }

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

create_compute_pipeline_with_filename :: (shader_path: string, function_name: string = "compute_main") -> Pipeline {
    using context.gpu_context;
    error: *NSError;
    shader_string := File.read_entire_file(shader_path);
    defer Basic.free(shader_string);

    library_desc := objc_new(MTL4LibraryDescriptor);
    defer release(library_desc);
    MTL4LibraryDescriptor.setSource_(library_desc, NSString.getTempString(shader_string));

    library := MTL4Compiler.newLibraryWithDescriptor_error_(compiler, *error);
    assert(error == null, "Error creating library: %", to_string(NSError.localizedDescription(error)));

    function_desc := objc_new(MTL4LibraryFunctionDescriptor);
    defer release(function_desc);
    MTL4LibraryFunctionDescriptor.setLibrary_(function_desc, library);
    MTL4LibraryFunctionDescriptor.setName_(function_desc, NSString.getTempString(function_name));

    compute_pipeline_desc := objc_new(MTL4ComputePipelineDescriptor);
    defer release(compute_pipeline_desc);

    MTL4ComputePipelineDescriptor.setComputeFunctionDescriptor_(compute_pipeline_desc, function_desc);
    pipeline_state := MTL4Compiler.newComputePipelineStateWithDescriptor_compilerTaskOptions_error_(compiler, compute_pipeline_desc, null, *error);
    assert(error == null, "Error creating compute PSO: %", to_string(NSError.localizedDescription(error)));

    return .{compute = pipeline_state, is_compute = true};
}

// The IR passed here is spirv, we use spirv cross to turn spirv into metal shader
create_compute_pipeline :: (compute_ir: string, entry_point: string = "compute_main") -> Pipeline {
    using context.gpu_context;

    ir: spvc_parsed_ir;
    result := spvc_context_parse_spirv(spirv_cross_context, xx compute_ir.data, xx compute_ir.count, *ir);
    assert_spvc(result);

    my_compiler: spvc_compiler;
    result = spvc_context_create_compiler(spirv_cross_context, .MSL, ir, .TAKE_OWNERSHIP, *my_compiler);
    assert_spvc(result);

    my_options: spvc_compiler_options;
    result = spvc_compiler_create_compiler_options(my_compiler, *my_options);
    assert_spvc(result);
    result = spvc_compiler_options_set_uint(my_options, .MSL_VERSION, SPVC_MAKE_MSL_VERSION(4, 0, 0));
    assert_spvc(result);
    result = spvc_compiler_options_set_bool(my_options, .MSL_ARGUMENT_BUFFERS, SPVC_TRUE);
    assert_spvc(result);

    msl_source: *u8;
    result = spvc_compiler_compile(my_compiler, *msl_source);
    assert_spvc(result);

    shader_string := to_string(msl_source);

    mtl_options: *MTLCompileOptions = objc_new(MTLCompileOptions);
    mtl_options.setLanguageVersion_(mtl_options, MTLLanguageVersion.e4_0);

    error: *NSError;
    library_desc := objc_new(MTL4LibraryDescriptor);
    defer release(library_desc);
    MTL4LibraryDescriptor.setSource_(library_desc, NSString.getTempString(shader_string));
    MTL4LibraryDescriptor.setOptions_(library_desc, mtl_options);

    library := MTL4Compiler.newLibraryWithDescriptor_error_(compiler, *error);
    Basic.assert(error == null, "Error creating library: %", to_string(NSError.localizedDescription(error)));

    function_desc := objc_new(MTL4LibraryFunctionDescriptor);
    defer release(function_desc);
    MTL4LibraryFunctionDescriptor.setLibrary_(function_desc, library);
    MTL4LibraryFunctionDescriptor.setName_(function_desc, NSString.getTempString(entry_point));

    compute_pipeline_desc := objc_new(MTL4ComputePipelineDescriptor);
    defer release(compute_pipeline_desc);

    MTL4ComputePipelineDescriptor.setComputeFunctionDescriptor_(compute_pipeline_desc, function_desc);
    pipeline_state := MTL4Compiler.newComputePipelineStateWithDescriptor_compilerTaskOptions_error_(compiler, compute_pipeline_desc, null, *error);

    Basic.assert(error == null, "Error creating compute PSO: %", to_string(NSError.localizedDescription(error)));

    return .{compute = pipeline_state, is_compute = true};
}

create_graphics_pipeline_with_filename :: (shader_path: string, desc: Raster_Desc, vertex_function_name: string = "vertex_main", fragment_function_main: string = "fragment_main") -> Pipeline {
    using context.gpu_context;
    shader_string := read_entire_file(shader_path);
    defer Basic.free(shader_string);

    error: *NSError;
    library_desc := objc_new(MTL4LibraryDescriptor);
    defer release(library_desc);
    MTL4LibraryDescriptor.setSource_(library_desc, NSString.getTempString(shader_string));

    library := MTL4Compiler.newLibraryWithDescriptor_error_(compiler, *error);
    assert(error == null, "Error creating library: %", to_string(NSError.localizedDescription(error)));

    vert_func_desc := objc_new(MTL4LibraryFunctionDescriptor);
    defer release(vert_func_desc);
    frag_func_desc := objc_new(MTL4LibraryFunctionDescriptor);
    defer release(frag_func_desc);

    MTL4LibraryFunctionDescriptor.setLibrary_(vert_func_desc, library);
    MTL4LibraryFunctionDescriptor.setName_(vert_func_desc, NSString.getTempString(vertex_function_name));

    MTL4LibraryFunctionDescriptor.setLibrary_(frag_func_desc, library);
    MTL4LibraryFunctionDescriptor.setName_(frag_func_desc, NSString.getTempString(fragment_function_name));

    render_pipeline_desc := objc_new(MTL4RenderPipelineDescriptor);
    defer release(render_pipeline_desc);

    MTL4RenderPipelineDescriptor.setVertexFunctionDescriptor_(render_pipeline_desc, vert_func_desc);
    MTL4RenderPipelineDescriptor.setFragmentFunctionDescriptor_(render_pipeline_desc, frag_func_desc);

    MTL4RenderPipelineDescriptor.setRasterSampleCount_(render_pipeline_desc, xx desc.sample_count);
    MTL4RenderPipelineDescriptor.setAlphaToCoverageState_(render_pipeline_desc, ifx desc.alpha_to_coverage then .Enabled else .Disabled);


    color_attachments := MTL4RenderPipelineDescriptor.colorAttachments(render_pipeline_desc);
    for target: desc.color_targets {
        attachment := objc_new(MTL4RenderPipelineColorAttachmentDescriptor);
        MTL4RenderPipelineColorAttachmentDescriptor.setPixelFormat_(attachment, to_metal_format(target.format));
        // There are two write mask, one in color target, one in
        // blendstate, the current logic is that if the blendstate is
        // present, the color mask for all targets would be the mask
        // specified in blend desc

        MTL4RenderPipelineColorAttachmentDescriptor.setWriteMask_(attachment, to_metal_write_mask(target.write_mask));
        if desc.blendstate {
            MTL4RenderPipelineColorAttachmentDescriptor.setSourceRGBBlendFactor_(attachment, to_metal_blend_factor(desc.blendstate.src_color_factor));
            MTL4RenderPipelineColorAttachmentDescriptor.setSourceAlphaBlendFactor_(attachment, to_metal_blend_factor(desc.blendstate.src_alpha_factor));
            MTL4RenderPipelineColorAttachmentDescriptor.setDestinationRGBBlendFactor_(attachment, to_metal_blend_factor(desc.blendstate.dst_color_factor));
            MTL4RenderPipelineColorAttachmentDescriptor.setDestinationAlphaBlendFactor_(attachment, to_metal_blend_factor(desc.blendstate.dst_alpha_factor));
            MTL4RenderPipelineColorAttachmentDescriptor.setRgbBlendOperation_(attachment, to_metal_blend_operation(desc.blendstate.color_op));
            MTL4RenderPipelineColorAttachmentDescriptor.setAlphaBlendOperation_(attachment, to_metal_blend_operation(desc.blendstate.alpha_op));
        }

        MTL4RenderPipelineColorAttachmentDescriptorArray.setObject_atIndexedSubscript_(color_attachments, attachment, xx it_index);
    }


    pipeline_state := MTL4Compiler.newRenderPipelineStateWithDescriptor_compilerTaskOptions_error_(compiler, render_pipeline_desc, null, *error);
    assert(error == null, "Error creating render PSO: %", to_string(NSError.localizedDescription(error)));

    return .{render = pipeline_state};
}

create_graphics_pipeline :: (vertex_ir: string, pixel_ir: string, desc: Raster_Desc) -> Pipeline {
    return .{};
}

free_pipeline :: (pipeline: Pipeline) {
    if pipeline.is_compute {
        release(pipeline.compute);
    } else {
        release(pipeline.render);
    }
}

// State objects
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

free_depth_stencil_state :: (state: Depth_Stencil_State) {
    release(state);
}

create_queue :: () -> Queue {
    using context.gpu_context;
    // Currently, a simple queue is created
    queue := MTLDevice.newMTL4CommandQueue(device);
    return queue;
}

start_command_recording :: (queue: Queue) -> Command_Buffer {
    using context.gpu_context;
    cmd := MTLDevice.newCommandBuffer(device);

    // TODO: Here we should set up the argument buffer, just like the
    // push constant in Vulkan
    return .{mtl = cmd};
}

// This function looks weird, what the hell, queue is not used at all in metal.
submit :: (queue: Queue, command_buffers: []Command_Buffer, wait: []Semaphore_Pair = .[], signal: []Semaphore_Pair = .[]) {
    for cmd: command_buffers {
        MTLCommandBuffer.commit(cmd);
    }
}

create_semaphore :: (init_value: u64) -> Semaphore {
    using context.gpu_context;
    event := MTLDevice.newSharedEvent(device);
    event.setSignaledValue_(event, init_value);
    return event;
}

wait_semaphore :: (sema: Semaphore, value: u64, timeout: u64 = 0) {
    // The current timeout is 0, which is infinite
    success := sema.waitUntilSignaledValue_timeoutMS_(sema, value, timeout);
    if !success {
        log("Timeout waiting semaphore, value: %, timeout: %", value, timeout);
    }
}

destroy_semaphore :: (sema: Semaphore) {
    release(sema);
}

// Holy shit, really?
memcpy :: (cb: Command_Buffer, dest: Allocation, src: Allocation, size: u64) {
    blit := cb.blitCommandEncoder(cb);
    blit.copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_(blit, src.buffer, src.offset, dest.buffer, dest.offset, size);
    blit.(*MTLCommandEncoder).endEncoding(blit);
}

copy_to_texture :: (cb: Command_Buffer, src: Allocation, texture: Texture) {
    blit := cb.blitCommandEncoder(cb);
    bytes_per_row := texture.bufferBytesPerRow(texture);
    width := texture.width(texture);
    height := texture.height(texture);
    depth := texture.depth(texture);
    blit.copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_(blit, src.buffer, src.offset, bytes_per_row, 0, .{width = width, height = height, depth = depth}, texture, 0, 0, .{});
    blit.(*MTLCommandEncoder).endEncoding(blit);
}

copy_from_texture :: (cb: Command_Buffer, dest: Allocation, texture: Texture) {
    blit := cb.blitCommandEncoder(cb);
    bytes_per_row := texture.bufferBytesPerRow(texture);
    width := texture.width(texture);
    height := texture.height(texture);
    depth := texture.depth(texture);
    blit.copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_(blit, texture, 0, 0, .{}, .{width, height, depth}, dest.buffer, dest.offset, bytes_per_row, 0);
    blit.(*MTLCommandEncoder).endEncoding(blit);
}

set_active_texture_heap_ptr :: (cb: Command_Buffer, allocation: Allocation) {

}

set_pipeline :: (cb: Command_Buffer, pipeline: Pipeline) {
    if pipeline.is_compute {
        encoder := cb.computeCommandEncoder(cb);
        encoder.setComputePipelineState_(encoder, pipeline.compute);
        encoder.(*MTLCommandEncoder).endEncoding(encoder);
    }
}

dispatch :: (cb: Command_Buffer, data: Allocation, count: u32) {
    encoder := cb.computeCommandEncoder(cb);
    encoder.setBytes_length_atIndex_(encoder, *data.gpu, size_of(u64), 0);
    encoder.useResource_usage_(encoder, data.buffer, .Read);
    encoder.dispatchThreadgroups_threadsPerThreadgroup_(encoder, .{1, 1, 1}, .{256, 1, 1});
    encoder.(*MTLCommandEncoder).endEncoding(encoder);
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
        assert(false, "Invalid op when translating to MTLCompareFunction: %", op);
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
        assert(false, "Invalid op when translating to MTLStencilOperation: %", op);
    }
    return func;
}

assert_spvc :: (result: spvc_result) #expand {
    `Basic.assert(result == .SUCCESS);
}

#import "Metal";
Basic :: #import "Basic";
#import "SDL3";
#import "macOS";
#import "Objective_C";
File :: #import "File";
String :: #import "String";
#import "spirv_cross";
