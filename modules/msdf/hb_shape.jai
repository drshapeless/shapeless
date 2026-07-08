make_shape :: (font: *hb_font_t, glyph_index: hb_codepoint_t, w: s64, h: s64, draw_funcs: *hb_draw_funcs_t, upem: u32, set_scale := false) -> Shape, Metrics {
    // In HarfBuzz, we don't have to keep track of scale manually,
    // after we set the scale, every other functions return would be
    // in that scale. Also, because of it, we may not want to set the
    // scale every time.
    scale := cast(float)(h) / cast(float)(upem);

    if set_scale {
        hb_font_set_scale(font, xx (w * 64), xx (h * 64));
    }

    extents: hb_glyph_extents_t;
    hb_font_get_glyph_extents(font, glyph_index, *extents);

    translate_x := w.(float)/2.0 - extents.width.(float)*scale/2.0 - extents.x_bearing.(float)*scale;
    translate_y := h.(float)/2.0 - extents.height.(float)*scale/2.0 - extents.y_bearing.(float)*scale;

    xoff := 0.5;
    yoff := 0.5;

    metrics := Metrics.{
        scale = scale,
        xoff  = xoff,
        yoff  = yoff,
        translate_x = translate_x,
        translate_y = translate_y,
        y_flip = extents.height > 0
    };

    vertices: [..]Vertex;
    defer array_free(vertices);
    success: hb_bool_t;
    success = hb_font_draw_glyph_or_fail(font, glyph_index, draw_funcs, *vertices);
    assert(xx success);

    vertices_to_shape :: (vertices: []Vertex) -> Shape {
        using shape: Shape;

        CSCALE :: 64.0; // Where does this number come from?

        initial: Vector2; // Assume the first vertex is vmove, I don't check here
        edges: [..]Edge_Segment;
        for v: vertices {
            e := Edge_Segment.{color = .WHITE};
            if v.type == {
            case .vmove;
                if edges.count > 0 {
                    new_contour := Contour.{
                        edges = array_copy(edges)
                    };
                    array_add(*contours, new_contour);
                    array_reset_keeping_memory(*edges);
                }
                initial = .{xx v.x, xx v.y};
                initial /= CSCALE;

            case .vline;
                e.type = .vline;
                e.start = initial;
                e.end = .{xx v.x, xx v.y};
                e.end /= CSCALE;

                initial = e.end;
                array_add(*edges, e);

            case .vcurve;
                e.type = .vcurve;
                e.start = initial;
                e.control = .{xx v.cx, xx v.cy};
                e.control /= CSCALE;
                e.end = .{xx v.x, xx v.y};
                e.end /= CSCALE;

                if (e.start == e.control) || (e.control == e.end) {
                    e.control = 0.5*(e.start + e.end);
                }

                initial = e.end;
                array_add(*edges, e);

            case .vcubic;
                e.type = .vcubic;
                e.start = initial;
                e.control = .{xx v.cx, xx v.cy};
                e.control /= CSCALE;
                e.control1 = .{xx v.cx1, xx v.cy1};
                e.control1 /= CSCALE;
                e.end = .{xx v.x, xx v.y};
                e.end /= CSCALE;

                initial = e.end;
                array_add(*edges, e);
            }
        }

        // Here we add the last contour
        if edges.count > 0 {
            new_contour := Contour.{
                edges = array_copy(edges)
            };
            array_add(*contours, new_contour);
        }

        array_free(edges);

        return shape;
    }

    shape := vertices_to_shape(vertices);

    return shape, metrics;
}

make_draw_funcs :: () -> *hb_draw_funcs_t {
    move_to :: (dfuncs: *hb_draw_funcs_t, draw_data: *void, st: *hb_draw_state_t, to_x: float, to_y: float, user_data: *void) -> void #c_call {
        shape := cast(*[..]Vertex)draw_data;
        push_context {
            vertex := Vertex.{
                type = .vmove,
                x = to_x,
                y = to_y
            };
            array_add(shape, vertex);
        }
    }

    line_to :: (dfuncs: *hb_draw_funcs_t, draw_data: *void, st: *hb_draw_state_t, to_x: float, to_y: float, user_data: *void) -> void #c_call {
        shape := cast(*[..]Vertex)draw_data;
        push_context {
            vertex := Vertex.{
                type = .vline,
                x = to_x,
                y = to_y
            };
            array_add(shape, vertex);
        }
    }

    quad_to :: (dfuncs: *hb_draw_funcs_t, draw_data: *void, st: *hb_draw_state_t, control_x: float, control_y: float, to_x: float, to_y: float, user_data: *void) -> void #c_call {
        shape := cast(*[..]Vertex)draw_data;
        push_context {
            vertex := Vertex.{
                type = .vcurve,
                x = to_x,
                y = to_y,
                cx = control_x,
                cy = control_y
            };
            array_add(shape, vertex);
        }
    }

    cubic_to :: (dfuncs: *hb_draw_funcs_t, draw_data: *void, st: *hb_draw_state_t, control1_x: float, control1_y: float, control2_x: float, control2_y: float, to_x: float, to_y: float, user_data: *void) -> void #c_call {
        shape := cast(*[..]Vertex)draw_data;
        push_context {
            vertex := Vertex.{
                type = .vcubic,
                x = to_x,
                y = to_y,
                cx = control1_x,
                cy = control1_y,
                cx1 = control2_x,
                cy1 = control2_y
            };
            array_add(shape, vertex);
        }
    }

    draw_funcs := hb_draw_funcs_create();
    vertices: [..]Vertex;
    hb_draw_funcs_set_move_to_func(draw_funcs, move_to, null, null);
    hb_draw_funcs_set_line_to_func(draw_funcs, line_to, null, null);
    hb_draw_funcs_set_quadratic_to_func(draw_funcs, quad_to, null, null);
    hb_draw_funcs_set_cubic_to_func(draw_funcs, cubic_to, null, null);

    return draw_funcs;
}

#scope_file
Vertex :: struct {
    type: Edge_Segment.Edge_Type;
    x:   float;
    y:   float;
    cx:  float;
    cy:  float;
    cx1: float;
    cy1: float;
}
#import "HarfBuzz";
#import "Basic";
