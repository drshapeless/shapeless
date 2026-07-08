#module_parameters(STB_TRUETYPE := false, HARFBUZZ := false);
Signed_Distance :: struct {
    dist: float;
    d:    float;
}

Edge_Segment :: struct {
    Color :: enum s32 {
        BLACK   :: 0;
        RED     :: 1;
        GREEN   :: 2;
        YELLOW  :: 3;
        BLUE    :: 4;
        MAGENTA :: 5;
        CYAN    :: 6;
        WHITE   :: 7;
    }

    Edge_Type :: enum u32 {
        vmove  :: 1;
        vline  :: 2;
        vcurve :: 3;
        vcubic :: 4;
    }

    type:      Edge_Type;
    color:     Color;
    // The original code uses an array to store all the point without
    // specifying what they are. What a mess.
    // vline:  p[0] is start, p[1] is end
    // vcurve: p[0] is start, p[1] is control, p[2] is end
    // vcubic: p[0] is start, p[1] is control, p[2] is control1, p[3] is end
    start:     Vector2;
    end:       Vector2;
    control:   Vector2;
    control1:  Vector2;
}

// We can make Contour just be an array of Edge_Segment, but that is confusing in code.
Contour :: struct {
    edges: []Edge_Segment;
};

Multi_Distance :: struct {
    r, g, b: float;
    med:     float;
}

Edge_Point :: struct {
    min_distance: Signed_Distance;
    near_edge:    *Edge_Segment;
    near_param:   float;
}

Clashes :: struct {
    x, y: s64;
}

Metrics :: struct {
    scale:       float;
    xoff:        float;
    yoff:        float;
    translate_x: float;
    translate_y: float;
    y_flip:      bool;
}

Shape :: struct {
    contours: [..]Contour;
}

prepare_shape :: (shape: *Shape) -> windings:[]s32 {
    color_edges(shape);

    return get_windings(shape);
}

shape_free :: (using shape: Shape) {
    for contour: contours {
        array_free(contour.edges);
    }
    array_free(contours);
}

// These are bad names, but whatever
Block_Shape :: struct {
    first_contour_offset: u32;
    contour_count:        u32;
}

Block_Contour :: struct {
    first_edge_offset: u32;
    edge_count:        u32;
}

// make a shape store in a continuous block of memory for uploading it to the GPU
get_shape_memory_size :: (shape: Shape) -> s64 {
    // calculate how many memory do we need
    shape_size := size_of(Block_Contour) * shape.contours.count;

    total_edge_size: s64;
    for contour: shape.contours {
        total_edge_size += size_of(Edge_Segment) * contour.edges.count;
    }

    return size_of(Block_Shape) + shape_size + total_edge_size;
}

// Assume that the memory is big enough, no check here
shape_to_block_memory :: (shape: Shape, memory: *void) {
    block_shape := cast(*Block_Shape) memory;

    block_shape.first_contour_offset = xx size_of(Block_Shape);
    block_shape.contour_count = xx shape.contours.count;

    current_edge_offset := size_of(Block_Shape) + size_of(Block_Contour) * shape.contours.count;

    for contour, contour_index: shape.contours {
        block_contour := cast(*Block_Contour) (memory.(*u8) + size_of(Block_Shape) + size_of(Block_Contour) * contour_index);
        block_contour.first_edge_offset = xx current_edge_offset;
        block_contour.edge_count = xx contour.edges.count;

        for edge, edge_index: contour.edges {
            edge_ptr := cast(*Edge_Segment) (memory.(*u8) + block_contour.first_edge_offset.(s64) + size_of(Edge_Segment) * edge_index);

            memcpy(edge_ptr, *edge, size_of(Edge_Segment));
            current_edge_offset += size_of(Edge_Segment);
        }
    }
}

// This function generate msdf with CPU only.
generate_msdf :: (using shape: Shape, windings: []s32, using metrics: Metrics, w: s64, h: s64) -> bitmap:[]float {
    bitmap := NewArray(3*w*h, float);

    contour_sd := NewArray(contours.count, Multi_Distance);
    defer array_free(contour_sd);

    for y: 0..h - 1 {
        row := ifx y_flip then y else h-y-1;
        for x: 0..w - 1 {
            p := Vector2.{
                (x+xoff-translate_x)/(scale*64.0),
                (y+yoff-translate_y)/(scale*64.0)
            };

            sr, sg, sb: Edge_Point;
            sr.min_distance = .{INF, 1};
            sg.min_distance = .{INF, 1};
            sb.min_distance = .{INF, 1};

            d := abs(INF);
            neg_dist := -INF;
            pos_dist :=  INF;
            winding  := 0;

            for contour, j: contours {
                r, g, b: Edge_Point;
                r.min_distance = .{INF, 1};
                g.min_distance = .{INF, 1};
                b.min_distance = .{INF, 1};


                for * edge: contour.edges {
                    param: float;
                    distance := Signed_Distance.{
                        INF, 1
                    };

                    // calcuate signed distance
                    if edge.type == {
                    case .vline;
                        distance, param = linear_dist(edge.*, p);
                    case .vcurve;
                        distance, param = quadratic_dist(edge.*, p);
                    case .vcubic;
                        distance, param = cubic_dist(edge.*, p);
                    }

                    if edge.color&.RED && signed_compare(distance, r.min_distance) {
                        r.min_distance = distance;
                        r.near_edge    = edge;
                        r.near_param   = param;
                    }
                    if edge.color&.GREEN && signed_compare(distance, g.min_distance) {
                        g.min_distance = distance;
                        g.near_edge    = edge;
                        g.near_param   = param;
                    }
                    if edge.color&.BLUE && signed_compare(distance, b.min_distance) {
                        b.min_distance = distance;
                        b.near_edge    = edge;
                        b.near_param   = param;
                    }
                }

                if signed_compare(r.min_distance, sr.min_distance) {
                    sr = r;
                }
                if signed_compare(g.min_distance, sg.min_distance) {
                    sg = g;
                }
                if signed_compare(b.min_distance, sb.min_distance) {
                    sb = b;
                }

                med_min_dist := abs(median(r.min_distance.dist, g.min_distance.dist, b.min_distance.dist));

                if med_min_dist < d {
                    d = med_min_dist;
                    winding = -windings[j];
                }

                dist_to_pseudo(*r.min_distance, p, r.near_param, r.near_edge);
                dist_to_pseudo(*g.min_distance, p, g.near_param, g.near_edge);
                dist_to_pseudo(*b.min_distance, p, b.near_param, b.near_edge);

                med_min_dist = median(r.min_distance.dist, g.min_distance.dist, b.min_distance.dist);
                contour_sd[j].r = r.min_distance.dist;
                contour_sd[j].g = g.min_distance.dist;
                contour_sd[j].b = b.min_distance.dist;
                contour_sd[j].med = med_min_dist;

                if windings[j] > 0 && med_min_dist >= 0 && abs(med_min_dist) < abs(pos_dist) {
                    pos_dist = med_min_dist;
                }
                if windings[j] < 0 && med_min_dist <= 0 && abs(med_min_dist) < abs(neg_dist) {
                    neg_dist = med_min_dist;
                }
            }

            dist_to_pseudo(*sr.min_distance, p, sr.near_param, sr.near_edge);
            dist_to_pseudo(*sg.min_distance, p, sg.near_param, sg.near_edge);
            dist_to_pseudo(*sb.min_distance, p, sb.near_param, sb.near_edge);

            msd := Multi_Distance.{
                r = INF,
                g = INF,
                b = INF,
                med = INF
            };
            if pos_dist >= 0 && abs(pos_dist) <= abs(neg_dist) {
                msd.med = INF;
                winding = 1;
                for i: 0..contours.count - 1 {
                    if windings[i] > 0 && contour_sd[i].med > msd.med && abs(contour_sd[i].med) < abs(neg_dist) {
                        msd = contour_sd[i];
                    }
                }
            } else if neg_dist <= 0 && abs(neg_dist) <= abs(pos_dist) {
                msd.med = -INF;
                winding = -1;
                for i: 0..contours.count - 1 {
                    if windings[i] < 0 && contour_sd[i].med < msd.med && abs(contour_sd[i].med) < abs(pos_dist) {
                        msd = contour_sd[i];
                    }
                }
            }

            for i: 0..contours.count - 1 {
                if windings[i] != winding && abs(contour_sd[i].med) < abs(msd.med) {
                    msd = contour_sd[i];
                }
            }

            if median(sr.min_distance.dist, sg.min_distance.dist, sb.min_distance.dist) == msd.med {
                msd.r = sr.min_distance.dist;
                msd.g = sg.min_distance.dist;
                msd.b = sb.min_distance.dist;
            }

            index := 3*((row*w)+x);
            bitmap[index  ] = msd.r/RANGE+0.5;
            bitmap[index+1] = msd.g/RANGE+0.5;
            bitmap[index+2] = msd.b/RANGE+0.5;
        }
    }

    // msdf error correction
    clashes: [..]Clashes;
    defer array_free(clashes);
    tx := EDGE_THRESHOLD/(scale*RANGE);
    ty := EDGE_THRESHOLD/(scale*RANGE);

    for y: 0..h - 1 {
        for x: 0..w - 1 {
            p := pixel_at(x, y, w, bitmap);
            if (x > 0   && pixel_clash(p, pixel_at(max(x-1, 0), y, w, bitmap), tx)) ||
               (x < w-1 && pixel_clash(p, pixel_at(min(x+1, w-1), y, w, bitmap), tx)) ||
               (y > 0   && pixel_clash(p, pixel_at(x, max(y-1, 0), w, bitmap), ty)) ||
               (y < h-1 && pixel_clash(p, pixel_at(x, min(y+1, h-1), w, bitmap), ty)) {
                c := Clashes.{x = x};
                array_add(*clashes, Clashes.{x = x});
                array_add(*clashes, Clashes.{y = y});
            }
        }
    }

    for clash: clashes {
        index := 3*((clash.y*w)+clash.x);
        med := median(bitmap[index], bitmap[index+1], bitmap[index+2]);
        bitmap[index  ] = med;
        bitmap[index+1] = med;
        bitmap[index+2] = med;
    }

    return bitmap;
}

#if STB_TRUETYPE {
    #load "stbtt_shape.jai";
}

#if HARFBUZZ {
    #load "hb_shape.jai";
}

#load "bitmap.jai";

#scope_file
INF :: -1.0e24;
RANGE :: 1.0;
EDGE_THRESHOLD :: 0.02;

median :: (a: float, b: float, c: float) -> float {
    return max(min(a, b), min(max(a, b), c));
}

nonzero_sign :: (n: float) -> s32 {
    return 2 * cast(s32) (n > 0) - 1;
}

cross :: (a: Vector2, b: Vector2) -> float {
    return a.x*b.y - a.y*b.x;
}

scale :: (v: Vector2, s: float) -> Vector2 {
    return .{v.x * s, v.y * s};
}

// mul_inner is the dot product, use dot instead

// leng is provided by length in built-in Math module
// norm is provided by normalize in built-in Math module

// sub, Jai supports vector subtraction by default.
// Use a - b is enough

solve_quadratic :: (a: float, b: float, c: float) -> solution_count:int, solutions:[2]float {
    // This is called x because the original code is x
    x: [2]float;

    if abs(a) < 1.0e-14 {
        if abs(b) < 1.0e-14 {
            if c == 0 {
                return -1, x;
            }
        }
        x[0] = -c/b;
        return 1, x;
    }

    dscr := b*b-4*a*c;
    if dscr > 0 {
        dscr = sqrt(dscr);
        x[0] = (-b+dscr)/(2*a);
        x[1] = (-b-dscr)/(2*a);
        return 2, x;
    } else if dscr == 0 {
        x[0] = -b/(2*a);
        return 1, x;
    } else {
        return 0, x;
    }
}

solve_cubic_normed :: (a: float, b: float, c: float) -> solution_count:int, solutions:[3]float {
    x: [3]float;

    a2 := a*a;
    q  := (a2 - 3*b)/9;
    r  := (a*(2*a2-9*b) + 27*c)/54;
    r2 := r*r;
    q3 := q*q*q;
    A, B: float;
    if r2 < q3 {
        t := r/sqrt(q3);
        if t < -1 t = -1;
        if t >  1 t =  1;
        t = acos(t);
        a /= 3;
        q = -2*sqrt(q);
        x[0] = q*cos(t/3)-a;
        x[1] = q*cos((t+2*PI)/3)-a;
        x[2] = q*cos((t-2*PI)/3)-a;
        return 3, x;
    } else {
        A = -pow(abs(r)+sqrt(r2-q3), 1.0/3.0);
        if r < 0 A = -A;
        B = ifx A == 0 then 0 else q/A;
        a /= 3;
        x[0] = (A+B)-a;
        x[1] = -0.5*(A+B)-a;
        x[2] = 0.5*sqrt(3.0)*(A-B);
        if abs(x[2]) < 1.0e-14
            return 2, x;
        return 1, x;
    }
}

solve_cubic :: (a: float, b: float, c: float, d: float) -> solution_count:int, solutions:[3]float {
    if abs(a) < 1.0e-14 {
        solution_count, solutions := solve_quadratic(b, c, d);
        x: [3]float;
        x[0] = solutions[0];
        x[1] = solutions[1];
        return solution_count, x;
    }
    solution_count, solutions := solve_cubic_normed(b/a, c/a, d/a);
    return solution_count, solutions;
}

getortho :: (v: Vector2, polarity: bool, allow_zero: bool) -> Vector2 {
    r: Vector2;

    len := length(v);
    if len == 0 {
        if polarity {
            r.x = 0;
            r.y = cast(float) (!allow_zero);
        } else {
            r.x = 0;
            r.y = - cast(float) (!allow_zero);
        }
        return r;
    }

    if polarity {
        r.x = -v.y / len;
        r.y =  v.x / len;
    } else {
        r.x =  v.y / len;
        r.y = -v.x / len;
    }

    return r;
}

pixel_clash :: (a: Vector3, b: Vector3, threshold: float) -> bool {
    // I intentionally keep the camal case
    aIn :bool = (cast(int)(a.x > 0.5) + cast(int)(a.y > 0.5) + cast(int)(a.z > 0.5)) >= 2;
    bIn :bool = (cast(int)(b.x > 0.5) + cast(int)(b.y > 0.5) + cast(int)(b.z > 0.5)) >= 2;
    if aIn != bIn return false;

    components_smaller_than :: (v: Vector3, i: float) -> bool {
        return v.x > i && v.y > i && v.z > i;
    }

    components_larger_than  :: (v: Vector3, i: float) -> bool {
        return v.x < i && v.y < i && v.z < i;
    }

    if components_larger_than(a, 0.5) || components_smaller_than(a, 0.5) || components_larger_than(b, 0.5) || components_smaller_than(b, 0.5) {
        return false;
    }

    aa, ab, ba, bb, ac, bc: float;
    if (a.x > 0.5) != (b.x > 0.5) && (a.x < 0.5) != (b.x < 0.5) {
        aa = a.x;
        ba = b.x;
        if (a.y > 0.5) != (b.y > 0.5) && (a.y < 0.5) != (b.y < 0.5) {
            ab = a.y;
            bb = b.y;
            ac = a.z;
            bc = b.z;
        } else if (a.z > 0.5) != (b.z > 0.5) && (a.z < 0.5) != (b.z < 0.5) {
            ab = a.z;
            bb = b.z;
            ac = a.y;
            bc = b.y;
        } else {
            return false;
        }
    } else if (a.y > 0.5) != (b.y > 0.5) && (a.y < 0.5) != (b.y < 0.5) && (a.z > 0.5) != (b.z > 0.5) && (a.z < 0.5) != (b.z < 0.5) {
        aa = a.y;
        ba = b.y;
        ab = a.z;
        bb = b.z;
        ac = a.x;
        bc = b.x;
    } else {
        return false;
    }

    return (abs(aa-ba) >= threshold) && (abs(ab-bb) >= threshold) && (abs(ac-0.5) >= abs(bc-0.5));
}

mix :: (a: Vector2, b: Vector2, weight: float) -> Vector2 {
    r: Vector2;
    r.x = (1-weight)*a.x + weight*b.x;
    r.y = (1-weight)*a.y + weight*b.y;
    return r;
}

linear_direction :: (e: Edge_Segment, param: float) -> Vector2 {
    r: Vector2;
    r.x = e.end.x - e.start.x;
    r.y = e.end.y - e.start.y;

    return r;
}

quadratic_direction :: (e: Edge_Segment, param: float) -> Vector2 {
    a := e.control - e.start;
    b := e.end     - e.control;
    return mix(a, b, param);
}

// TODO: This function is messy
cubic_direction :: (e: Edge_Segment, param: float) -> Vector2 {
    r: Vector2;
    a := e.control  - e.start;
    b := e.control1 - e.control;
    c := mix(a, b, param);

    a  = e.end - e.control1;
    d := mix(b, a, param);
    t := mix(c, d, param);

    // if (!t[0] && !t[1])
    // I made it cleaner to read
    if t.x == 0 && t.y == 0 {
        if param == 0 {
            // r.x = e.control1.x - e.start.x;
            // r.y = e.control1.y - e.start.y;
            r = e.control1 - e.start;
            return r;
        }
        if param == 1 {
            r = e.end - e.control;
            return r;
        }
    }
    r = t;

    return r;
}

direction :: (e: Edge_Segment, param: float) -> Vector2 {
    if e.type == {
    case .vline;
        return linear_direction(e, param);
    case .vcurve;
        return quadratic_direction(e, param);
    case .vcubic;
        return cubic_direction(e, param);
    case;
        assert(false);
    }
    return .{};
}

linear_point :: (e: Edge_Segment, param: float) -> Vector2 {
    return mix(e.start, e.end, param);
}

quadratic_point :: (e: Edge_Segment, param: float) -> Vector2 {
    a := mix(e.start, e.control, param);
    b := mix(e.control, e.end, param);
    return mix(a, b, param);
}

cubic_point :: (e: Edge_Segment, param: float) -> Vector2 {
    p12 := mix(e.control, e.control1, param);
    a   := mix(e.start, e.control, param);
    b   := mix(a, p12, param);
    c   := mix(e.control1, e.end, param);
    d   := mix(p12, c, param);
    return mix(b, d, param);
}

point :: (e: Edge_Segment, param: float) -> Vector2 {
    if e.type == {
    case .vline;
        return linear_point(e, param);
    case .vcurve;
        return quadratic_point(e, param);
    case .vcubic;
        return cubic_point(e, param);
    case;
        assert(false);
    }
    return .{};
}

// linear edge signed distance
linear_dist :: (e: Edge_Segment, origin: Vector2) -> Signed_Distance, param:float {
    aq, ab, eq: Vector2;
    param: float;
    aq = origin - e.start;
    ab = e.end - e.start;
    param = dot(aq, ab) / dot(ab, ab);
    if param > 0.5 {
        eq = e.end - origin;
    } else {
        eq = e.start - origin;
    }

    endpoint_distance := length(eq);
    if param > 0 && param < 1 {
        ab_ortho := getortho(ab, false, false);
        ortho_dist := dot(ab_ortho, aq);
        if abs(ortho_dist) < endpoint_distance {
            return .{ortho_dist, 0}, param;
        }
    }

    ab = normalize(ab);
    eq = normalize(eq);
    dist := xx nonzero_sign(cross(aq, ab)) * endpoint_distance;
    d    := abs(dot(ab, eq));
    return .{dist, d}, param;
}

// quadratic edge signed distance
quadratic_dist :: (e: Edge_Segment, origin: Vector2) -> Signed_Distance, param:float {
    qa, ab, br: Vector2;
    qa = e.start - origin;
    ab = e.control - e.start;
    // br.x = e.start.x + e.end.x - e.control.x - e.control.x;
    // br.y = e.start.y + e.end.y - e.control.y - e.control.y;
    br = e.start + e.end - e.control - e.control;

    a := dot(br, br);
    b := 3*dot(ab, br);
    c := 2*dot(ab, ab) + dot(qa, br);
    d := dot(qa, ab);

    solution_count, solutions := solve_cubic(a, b, c, d);

    // distance from a
    min_distance := xx nonzero_sign(cross(ab, qa)) * length(qa);
    param := -dot(qa, ab) / dot(ab, ab);
    {
        a := e.end - e.control;
        b := e.end - origin;

        // distance from b
        distance := xx nonzero_sign(cross(a, b))*length(b);
        if abs(distance) < abs(min_distance) {
            min_distance = distance;

            a = origin - e.control;
            b = e.end - e.control;
            param = dot(a, b) / dot(b, b);
        }
    }

    for i: 0..solution_count - 1 {
        t := solutions[i];
        if t > 0 && t < 1 {
            // end_point = p[0]+2*t[i]*ab+t[i]*t[i]*br;
            end_point, a, b: Vector2;
            end_point.x = e.start.x + 2*t*ab.x + t*t*br.x;
            end_point.y = e.start.y + 2*t*ab.y + t*t*br.y;

            a = e.end - e.start;
            b = end_point - origin;
            distance := xx nonzero_sign(cross(a, b))*length(b);
            if abs(distance) <= abs(min_distance) {
                min_distance = distance;
                param = t;
            }
        }
    }

    if param >= 0 && param <= 1 {
        return .{min_distance, 0}, param;
    }

    ab = normalize(ab);
    qa = normalize(qa);
    aa := e.end - e.control;
    aa = normalize(aa);
    bb := e.end - origin;
    bb = normalize(bb);

    if param < 0.5 {
        return .{min_distance, abs(dot(ab, qa))}, param;
    } else {
        return .{min_distance, abs(dot(aa, bb))}, param;
    }
}

// cubic edge signed distance
cubic_dist :: (e: Edge_Segment, origin: Vector2) -> Signed_Distance, param:float {
    qa, ab, br, as: Vector2;
    qa = e.start - origin;
    ab = e.control - e.start;
    // br.x = e.control1.x - e.control.x - ab.x;
    // br.y = e.control1.y - e.control.y - ab.y;
    br = e.control1 - e.control - ab;
    // as.x = (e.end.x - e.control1.x) - (e.control1.x - e.control.x) - br.x;
    // as.y = (e.end.y - e.control1.y) - (e.control1.y - e.control.y) - br.y;
    as = (e.end - e.control1) - (e.control1 - e.control) - br;

    ep_dir := direction(e, 0);

    // distance from a
    min_distance := xx nonzero_sign(cross(ep_dir, qa))*length(qa);
    param := -dot(qa, ep_dir) / dot(ep_dir, ep_dir);
    {
        a := e.end - origin;
        ep_dir = direction(e, 1);
        // distance from b
        distance := xx nonzero_sign(cross(ep_dir, a))*length(a);
        if abs(distance) < abs(min_distance) {
            min_distance = distance;

            a = origin + ep_dir - e.end;
            param = dot(a, ep_dir) / dot(ep_dir, ep_dir);
        }
    }

    SEARCH_STARTS :: 4;
    for i: 0..SEARCH_STARTS - 1 {
        t :float = cast(float)i / cast(float)SEARCH_STARTS;
        step := 0;
        while 1 {
            defer step += 1;
            qpt := point(e, t);
            qpt = qpt - origin;
            d := direction(e, t);
            distance := xx nonzero_sign(cross(d, qpt))*length(qpt);
            if abs(distance) < abs(min_distance) {
                min_distance = distance;
                param = t;
            }
            if step == SEARCH_STARTS break;

            d1, d2: Vector2;
            d1.x = 3*as.x*t*t + 6*br.x*t + 3*ab.x;
            d1.y = 3*as.y*t*t + 6*br.y*t + 3*ab.y;
            d2.x = 6*as.x*t + 6*br.x;
            d2.y = 6*as.y*t + 6*br.y;

            t -= dot(qpt, d1) / (dot(d1, d1) + dot(qpt, d2));
            if t < 0 || t > 1 break;
        }
    }

    if param >= 0 && param <= 1 {
        return .{min_distance, 0}, param;
    }

    d0 := direction(e, 0);
    d1 := direction(e, 1);
    d0 = normalize(d0);
    d1 = normalize(d1);
    qa = normalize(qa);
    a := e.end - origin;
    a = normalize(a);

    if param < 0.5 {
        return .{min_distance, abs(dot(d0, qa))}, param;
    } else {
        return .{min_distance, abs(dot(d1, a))}, param;
    }
}

dist_to_pseudo :: (distance: *Signed_Distance, origin: Vector2, param: float, e: Edge_Segment) {
    if param < 0 {
        dir := direction(e, 0);
        dir  = normalize(dir);
        p   := point(e, 0);
        aq  := origin - p;
        ts  := dot(aq, dir);
        if ts < 0 {
            pseudo_dist := cross(aq, dir);
            if abs(pseudo_dist) <= abs(distance.dist) {
                distance.dist = pseudo_dist;
                distance.d    = 0;
            }
        }
    } else if param > 1 {
        dir := direction(e, 1);
        dir  = normalize(dir);
        p   := point(e, 1);
        bq  := origin - p;
        ts  := dot(bq, dir);
        if ts > 0 {
            pseudo_dist := cross(bq, dir);
            if abs(pseudo_dist) <= abs(distance.dist) {
                distance.dist = pseudo_dist;
                distance.d    = 0;
            }
        }
    }
}

signed_compare :: (a: Signed_Distance, b: Signed_Distance) -> bool {
    return abs(a.dist) < abs(b.dist) || (abs(a.dist) == abs(b.dist) && a.d < b.d);
}

// I am not sure whether this version is better than dealing with a lot of pointers
linear_split :: (e: Edge_Segment) -> p1:Edge_Segment, p2:Edge_Segment, p3:Edge_Segment {
    p1, p2, p3: Edge_Segment;

    // TODO: The type of Edge_Segment is not set here, I am not sure
    // whether that is intended.
    p: Vector2;

    p = point(e, 1.0/3.0);
    p1.start = e.start;
    p1.end = p;
    p1.color = e.color;

    // This is repeated
    // p = point(e, 1.0/3.0);
    p2.start = p;
    p = point(e, 2.0/3.0);
    p2.end = p;
    p2.color = e.color;

    p3.start = p;
    p3.end = e.end;
    p3.color = e.color;

    return p1, p2, p3;
}

quadratic_split :: (e: Edge_Segment) -> p1:Edge_Segment, p2:Edge_Segment, p3:Edge_Segment {
    p1, p2, p3: Edge_Segment;

    p, a, b: Vector2;

    p1.start = e.start;
    p = mix(e.start, e.control, 1.0/3.0);
    p1.control = p;
    p = point(e, 1.0/3.0);
    p1.end = p;
    p1.color = e.color;

    p2.start = p;
    a = mix(e.start, e.control, 5.0/9.0);
    b = mix(e.control, e.end, 4.0/9.0);
    p = mix(a, b, 0.5);
    p2.control = p;
    p = point(e, 2.0/3.0);
    p2.end = p;
    p2.color = e.color;

    p3.start = p;
    p = mix(e.control, e.end, 2.0/3.0);
    p3.control = p;
    p3.end = e.end;
    p3.color = e.color;

    return p1, p2, p3;
}

cubic_split :: (e: Edge_Segment) -> p1:Edge_Segment, p2:Edge_Segment, p3:Edge_Segment {
    p1, p2, p3: Edge_Segment;

    p, a, b, c, d: Vector2;

    p1.start = e.start;
    if e.start == e.control {
        p1.control = e.start;
    } else {
        p = mix(e.start, e.control, 1.0/3.0);
        p1.control = p;
    }
    a = mix(e.start, e.control, 1.0/3.0);
    b = mix(e.control, e.control1, 1.0/3.0);
    p = mix(a, b, 1.0/3.0);
    p1.control1 = p;
    p = point(e, 1.0/3.0);
    p1.end = p;
    p1.color = e.color;

    p2.start = p;
    a = mix(e.start,   e.control,  1.0/3.0);
    b = mix(e.control, e.control1, 1.0/3.0);
    c = mix(a, b, 1.0/3.0);
    // a = mix(e.control, e.control1, 1.0/3.0);
    a = b;
    b = mix(e.control1, e.end, 1.0/3.0);
    d = mix(a, b, 1.0/3.0);
    p = mix(c, d, 2.0/3.0);
    p2.control = p;
    a = mix(e.start, e.control, 2.0/3.0);
    b = mix(e.control, e.control1, 2.0/3.0);
    c = mix(a, b, 2.0/3.0);
    // a = mix(e.control, e.control1, 2.0/3.0);
    a = b;
    b = mix(e.control1, e.end, 2.0/3.0);
    d = mix(a, b, 2.0/3.0);
    p = mix(c, d, 1.0/3.0);
    p2.control1 = p;
    p = point(e, 2.0/3.0);
    p2.end = p;
    p2.color = e.color;

    p3.start = p;
    a = mix(e.control, e.control1, 2.0/3.0);
    b = mix(e.control1, e.end, 2.0/3.0);
    p = mix(a, b, 2.0/3.0);
    p3.control = p;

    if e.control1 == e.end {
        p3.control1 = e.end;
    } else {
        // p = mix(e.control1, e.end, 2.0/3.0); // This is b
        p = b;
        p3.control1 = p;
    }

    p3.end = e.end;

    return p1, p2, p3;
}

edge_split :: (e: Edge_Segment) -> p1:Edge_Segment, p2:Edge_Segment, p3:Edge_Segment {
    p1, p2, p3: Edge_Segment;
    if e.type == {
    case .vline;
        p1, p2, p3 = linear_split(e);
    case .vcurve;
        p1, p2, p3 = quadratic_split(e);
    case .vcubic;
        p1, p2, p3 = cubic_split(e);
    }

    return p1, p2, p3;
}

shoelace :: (a: Vector2, b: Vector2) -> float {
    return (b.x-a.x)*(a.y+b.y);
}

pixel_at :: (x: s64, y: s64, w: s64, bitmap: []float) -> Vector3 {
    return Vector3.{bitmap[3*((y*w)+x)], bitmap[3*((y*w)+x)+1], bitmap[3*((y*w)+x)+2]};
}

color_edges :: (shape: *Shape) {
    using shape;
    is_corner :: (a: Vector2, b: Vector2, cross_threshold: float) -> bool {
        return dot(a, b) <= 0 || abs(cross(a, b)) > cross_threshold;
    }

    symmetrical_trichotomy :: (position: s64, n: s64) -> s64 {
        return cast(s64) (3.0+2.875*cast(float)position/cast(float)(n-1)-1.4375+0.5) - 3;
    }

    // After a very long investigation, if we are using zero as the seed,
    // there is no effect on whether we provide seed or not, the seed
    // would always be zero.
    switch_color :: (color: *Edge_Segment.Color, banned: Edge_Segment.Color) {
        combined := color.* & banned;
        if combined == .RED || combined == .GREEN || combined == .BLUE {
            color.* = combined ^ .WHITE;
            return;
        }

        if color.* == .BLACK || color.* == .WHITE {
            color.* = .CYAN;
            return;
        }

        shifted := color.* << 1;
        color.* = (shifted | (shifted >> 3)) & .WHITE;
    }

    angle_threshold := 3.0;
    cross_threshold := sin(angle_threshold);
    corners: [..]s64;
    defer array_free(corners);

    for * contour: contours {
        if contour.edges.count > 0 {
            prev_dir, dir: Vector2;
            prev_dir = direction(contour.edges[contour.edges.count - 1], 1);

            index := 0;
            for edge: contour.edges {
                dir = direction(edge, 0);
                dir = normalize(dir);
                prev_dir = normalize(prev_dir);
                if is_corner(prev_dir, dir, cross_threshold) {
                    array_add(*corners, it_index);
                }
                prev_dir = direction(edge, 1);
            }
        }

        if corners.count == 0 {
            // Smooth
            for * edge: contour.edges {
                edge.color = .WHITE;
            }
        } else if corners.count == 1 {
            // Teardrop
            colors: [3]Edge_Segment.Color;
            colors[0] = .WHITE;
            colors[1] = .WHITE;
            switch_color(*colors[0], .BLACK);
            colors[2] = colors[0];
            switch_color(*colors[2], .BLACK);

            corner := corners[0];
            if contour.edges.count >= 3 {
                m := contour.edges.count;
                for i: 0..m - 1 {
                    // Here is a bug in msdf-c, it uses the wrong
                    // iterative number
                    contour.edges[(corner + i) % m].color = colors[1+symmetrical_trichotomy(i, m)];
                }
            } else if contour.edges.count >= 1 {
                parts: [6]Edge_Segment;
                parts[0 + 3 * corner], parts[1 + 3 * corner], parts[2 + 3 * corner] = edge_split(contour.edges[0]);
                if contour.edges.count >= 2 {
                    parts[3 - 3 * corner], parts[4 - 3 * corner], parts[5 - 3 * corner] = edge_split(contour.edges[1]);
                    parts[0].color = colors[0];
                    parts[1].color = colors[0];
                    parts[2].color = colors[1];
                    parts[3].color = colors[1];
                    parts[4].color = colors[2];
                    parts[5].color = colors[2];
                    array_free(contour.edges);
                    contour.edges = array_copy(array_view(parts, 0, 6));
                } else {
                    parts[0].color = colors[0];
                    parts[1].color = colors[1];
                    parts[2].color = colors[2];
                    array_free(contour.edges);
                    contour.edges = array_copy(array_view(parts, 0, 3));
                }
            }
        } else {
            // Multi-corners
            spline := 0;
            start := corners[0];
            m := contour.edges.count;
            color := Edge_Segment.Color.WHITE;
            switch_color(*color, .BLACK);
            initial_color := color;
            // In the msdf-c code, corner_count is equal to all the
            // edge count combined, with is not the original msdfgen
            // intended way, here we are using an dynamic array, and
            // the color we get is a bit different from what the
            // msdf-c generated. That is a bug in msdf-c.
            for j: 0..m - 1 {
                index := (start + j) % m;
                if spline + 1 < corners.count && corners[spline + 1] == index {
                    spline += 1;
                    s := cast(Edge_Segment.Color)(spline == corners.count - 1) * initial_color;
                    switch_color(*color, s);
                }
                contour.edges[index].color = color;
            }
        }
    }
}

get_windings :: (using shape: Shape) -> []s32 {
    windings := NewArray(contours.count, s32);
    for contour: contours {
        if contour.edges.count == 0 {
            windings[it_index] = 0;
            continue;
        }

        total: float;

        if contour.edges.count == 1 {
            a := point(contour.edges[0], 0);
            b := point(contour.edges[0], 1.0/3.0);
            c := point(contour.edges[0], 2.0/3.0);
            total += shoelace(a, b);
            total += shoelace(b, c);
            total += shoelace(c, a);
        } else if contour.edges.count == 2 {
            a := point(contour.edges[0], 0);
            b := point(contour.edges[0], 0.5);
            c := point(contour.edges[1], 0);
            d := point(contour.edges[1], 0.5);
            total += shoelace(a, b);
            total += shoelace(b, c);
            total += shoelace(c, d);
            total += shoelace(d, a);
        } else {
            prev := point(peek(contour.edges), 0);
            for edge: contour.edges {
                cur := point(edge, 0);
                total += shoelace(prev, cur);
                prev = cur;
            }
        }
        windings[it_index] = (cast(s32)(0 < total) - cast(s32)(total < 0));
    }

    return windings;
}

#import "Math";
#import "Basic";
