#if OS == .MACOS {
// The return string's memory is managed by spvc context, no need to free.
spirv_to_metal :: (spirv: string, spirv_cross_context: spvc_context) -> string {
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

    spvc_compiler_install_compiler_options(my_compiler, my_options);

    msl_source: *u8;
    result = spvc_compiler_compile(my_compiler, *msl_source);
    assert_spvc(result);

    return to_string(msl_source);
}
}

slang_to_metal :: (shader: string, entry_points: [] string, global_session: *slang.IGlobalSession) -> string {
    options: [..] slang.CompilerOptionEntry;
    options.allocator = Basic.temp;
    Basic.array_add(*options, .{
        name = .Language,
        value = .{
            kind = .String,
            stringValue0 = "slang",
        },
    });
    Basic.array_add(*options, .{
        name = .GLSLForceScalarLayout,
        value = .{
            kind = .Int,
            intValue0 = 1,
        },
    });

    target_desc := slang.TargetDesc.{
        format = .METAL,
        profile = slang.IGlobalSession_findProfile(global_session, "metal_4_0"),
        forceGLSLScalarBufferLayout = true,
        // flags = slang.SLANG_TARGET_FLAG,
        compilerOptionEntries = options.data,
        compilerOptionEntryCount = xx options.count,
    };

    source_dir := String.path_strip_filename(shader);
    search_paths := Basic.temp_c_string(source_dir);
    session_desc := slang.SessionDesc.{
        targets                  = *target_desc,
        targetCount              = 1,
        defaultMatrixLayoutMode  = .ROW_MAJOR,
        searchPaths              = *search_paths,
        searchPathCount          = 1,
        compilerOptionEntries    = options.data,
        compilerOptionEntryCount = xx options.count,
        fileSystem               = null,
    };

    session: *slang.ISession;
    slang.IGlobalSession_createSession(global_session, *session_desc, *session);
    Basic.assert(session != null);
    defer slang.ISlangUnknown_release(session);

    diagnostic_blob: *slang.ISlangBlob;

    slang_module := slang.ISession_loadModuleFromSourceString(session, "my_shader", null, Basic.temp_c_string(shader), *diagnostic_blob);
    if diagnostic_blob log_diagnostic_blob(diagnostic_blob);
    Basic.assert(slang_module != null);

    slang_entry_points: [..] *slang.IEntryPoint;
    slang_entry_points.allocator = Basic.temp;
    for e: entry_points {
        main := Basic.array_add(*slang_entry_points);
        slang.IModule_findEntryPointByName(slang_module, Basic.temp_c_string(e), main);
    }

    components: [..] *slang.IComponentType;
    components.allocator = Basic.temp;
    Basic.array_add(*components, slang_module);
    for slang_entry_points {
        Basic.array_add(*components, it);
    }

    composed_program: *slang.IComponentType;
    slang.ISession_createCompositeComponentType(session, components.data, components.count, *composed_program, *diagnostic_blob);
    if diagnostic_blob log_diagnostic_blob(diagnostic_blob);
    Basic.assert(composed_program != null);
    defer slang.ISlangUnknown_release(composed_program);

    linked_program: *slang.IComponentType;
    slang.IComponentType_link(composed_program, *linked_program);
    if diagnostic_blob then log_diagnostic_blob(diagnostic_blob);
    Basic.assert(linked_program != null);

    metal_code: *slang.IBlob;

    // Since there may be multiple entry points, we use getTargetCode instead.
    slang.IComponentType_getTargetCode(linked_program, 0, *metal_code, *diagnostic_blob);
    if diagnostic_blob then log_diagnostic_blob(diagnostic_blob);

    metal_code_raw := Basic.alloc_string(xx slang.ISlangBlob_getBufferSize(metal_code));

    memcpy(metal_code_raw.data, slang.ISlangBlob_getBufferPointer(metal_code), metal_code_raw.count);
    slang.ISlangUnknown_release(metal_code);

    return metal_code_raw;
}

slang_to_spirv :: (shader: string, entry_points: [] string) -> string {
    options: [..] slang.CompilerOptionEntry;
    options.allocator = Basic.temp;
    Basic.array_add(*options, .{
        name = .Language,
        value = .{
            kind = .String,
            stringValue0 = "slang",
        },
    });
    Basic.array_add(*options, .{
        name = .GLSLForceScalarLayout,
        value = .{
            kind = .Int,
            intValue0 = 1,
        },
    });

    target_desc := slang.TargetDesc.{
        format = .METAL,
        profile = slang.IGlobalSession_findProfile(global_session, "spirv_1_6"),
        forceGLSLScalarBufferLayout = true,
        flags = slang.SLANG_TARGET_FLAG.GENERATE_SPIRV_DIRECTLY,
        compilerOptionEntries = options.data,
        compilerOptionEntryCount = xx options.count,
    };

    source_dir := String.path_strip_filename(shader);
    search_paths := Basic.temp_c_string(source_dir);
    session_desc := slang.SessionDesc.{
        targets                  = *target_desc,
        targetCount              = 1,
        defaultMatrixLayoutMode  = .ROW_MAJOR,
        searchPaths              = *search_paths,
        searchPathCount          = 1,
        compilerOptionEntries    = options.data,
        compilerOptionEntryCount = xx options.count,
        fileSystem               = null,
    };

    session: *slang.ISession;
    slang.IGlobalSession_createSession(global_session, *session_desc, *session);
    Basic.assert(session != null);
    defer slang.ISlangUnknown_release(session);

    diagnostic_blob: *slang.ISlangBlob;

    slang_module := slang.ISession_loadModuleFromSourceString(session, "my_shader", null, Basic.temp_c_string(shader), *diagnostic_blob);
    if diagnostic_blob log_diagnostic_blob(diagnostic_blob);
    Basic.assert(slang_module != null);

    slang_entry_points: [..] *slang.IEntryPoint;
    slang_entry_points.allocator = Basic.temp;
    for e: entry_points {
        main := Basic.array_add(*slang_entry_points);
        slang.IModule_findEntryPointByName(slang_module, Basic.temp_c_string(e), main);
    }

    components: [..] *slang.IComponentType;
    components.allocator = Basic.temp;
    Basic.array_add(*components, slang_module);
    for slang_entry_points {
        Basic.array_add(*components, it);
    }

    composed_program: *slang.IComponentType;
    slang.ISession_createCompositeComponentType(session, components.data, components.count, *composed_program, *diagnostic_blob);
    if diagnostic_blob log_diagnostic_blob(diagnostic_blob);
    Basic.assert(composed_program != null);
    defer slang.ISlangUnknown_release(composed_program);

    linked_program: *slang.IComponentType;
    slang.IComponentType_link(composed_program, *linked_program);
    if diagnostic_blob then log_diagnostic_blob(diagnostic_blob);
    Basic.assert(linked_program != null);

    spirv_code: *slang.IBlob;

    // Since there may be multiple entry points, we use getTargetCode instead.
    slang.IComponentType_getTargetCode(linked_program, 0, *spirv_code, *diagnostic_blob);
    if diagnostic_blob then log_diagnostic_blob(diagnostic_blob);

    spirv_code_raw := Basic.alloc_string(xx slang.ISlangBlob_getBufferSize(spirv_code));

    memcpy(spirv_code_raw.data, slang.ISlangBlob_getBufferPointer(spirv_code), spirv_code_raw.count);
    slang.ISlangUnknown_release(spirv_code);

    return spirv_code_raw;
}

#scope_file
log_diagnostic_blob :: (blob: *slang.IBlob) {
    diagnostic_string := string.{
        data = slang.ISlangBlob_getBufferPointer(blob),
        count = xx slang.ISlangBlob_getBufferSize(blob),
    };

    Basic.log("%", diagnostic_string);
    slang.ISlangUnknown_release(blob);
}

#if OS == .MACOS {
    #import "spirv_cross";
}

slang :: #import "slang";
Basic :: #import "Basic";
String :: #import "String";
