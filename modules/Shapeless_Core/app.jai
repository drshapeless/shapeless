App :: struct {
    ctx: #Context;
    win: *SDL_Window;
    renderer: Renderer;

    functions: Table(string, Shapeless_Func);
    variables: Table(string, Any);
    modes: Table(string, Mode);
    keybinds: Table(string, Shapeless_Func);

    buffers: [..] Buffer;
    current_buffer_index: s64;
    frames: [..] Frame;

    font_atlas: Font_Atlas;
    simple_system: Simple_System;
    font_system: Font_System;

    monkey_texture: Renderer.Texture;
    square_mesh: Renderer.Mesh;

}

appinit :: (appstate: **void, argc: s32, argv: **u8) -> SDL_AppResult {
    app := New(App);
    appstate.* = app;
    ok := SDL_Init(.VIDEO);
    assert(ok, "Cannot init SDL %", to_string(SDL_GetError()));

    msdf := load_msdf("assets/font/hack/hack.json");

    log("loaded % glyphs", msdf.glyphs.count);

    using app;
    font_atlas = msdf_to_font_atlas(msdf);

    win = SDL_CreateWindow("Shapeless", 800, 600, .RESIZABLE | .VULKAN);
    assert(win != null, "Cannot create window %", to_string(SDL_GetError()));

    ok = init(*renderer, win);
    if !ok return .FAILURE;

    set_clear_color(*renderer, .[0.1, 0.2, 0.3, 1.0]);

    simple_system = make_simple_system(*renderer);
    font_system = make_font_system(*renderer);

    result: VkResult;
    result, square_mesh = make_mesh(*renderer, Simple_System.SQUARE_VERTICES, Simple_System.SQUARE_INDICES);
    if result return .FAILURE;

    monkey_surface := IMG_Load("assets/longhairmonkey.jpg");
    assert(monkey_surface != null);
    defer SDL_DestroySurface(monkey_surface);
    converted_surface := SDL_ConvertSurface(monkey_surface, .RGBA32);
    assert(converted_surface != null);
    defer SDL_DestroySurface(converted_surface);

    result, monkey_texture = make_texture(*renderer, converted_surface.pixels, .{xx converted_surface.w, xx converted_surface.h});
    assert(result == .SUCCESS);

    writer: Descriptor_Writer;
    init(*writer);
    write_image(*writer, 0, monkey_texture.image_view, renderer.texture_sampler, .SHADER_READ_ONLY_OPTIMAL, .COMBINED_IMAGE_SAMPLER);
    update_set(*writer, renderer.device, simple_system.descriptor_set);

    return .CONTINUE;
}

appevent :: (appstate: *void, event: *SDL_Event) -> SDL_AppResult {
    app := cast(*App)appstate;
    if event.type == {
    case .QUIT;
        #through;
    case .WINDOW_CLOSE_REQUESTED;
        return .SUCCESS;
    case .KEY_DOWN;
        if event.key.key == {
        case SDLK_ESCAPE;
            return .SUCCESS;
        }
    case .WINDOW_RESIZED;
        app.renderer.resize_requested = true;
    }

    return .CONTINUE;
}

appiter :: (appstate: *void) -> SDL_AppResult {
    app := cast(*App)appstate;
    using app;

    if renderer.resize_requested {
        width: s32;
        height: s32;
        SDL_GetWindowSize(app.win, *width , *height);
        resize_callback(*renderer, .{xx width ,xx height});
    }

    if begin_draw(*renderer) {
        ok, pipeline := table_find(*renderer.pipelines, simple_system.pipeline_id);
        assert(ok);
        vkCmdBindPipeline(renderer.cmd, .GRAPHICS, pipeline.vk);
        vkCmdBindDescriptorSets(renderer.cmd, .GRAPHICS, pipeline.layout, 0, 1, *simple_system.descriptor_set, 0, null);
        draw_mesh(renderer.cmd, square_mesh);

        end_draw(*renderer);
    }
    return .CONTINUE;
}

appquit :: (appstate: *void, result: SDL_AppResult) {
    app := cast(*App)appstate;

    vkDeviceWaitIdle(app.renderer.device);
    destroy_mesh(*app.renderer, app.square_mesh);
    destroy_texture(*app.renderer, app.monkey_texture);
    deinit(*app.renderer);
    SDL_Quit();
}
