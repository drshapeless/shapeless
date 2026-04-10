static const float INF = -1.0e24;
static const float RANGE = 1.0;
static const float PI = 3.1415927;

func nonzero_sign(n: float) -> int32_t {
    return 2 * (int32_t)(n > 0) - 1;
}

func cross(a: float2, b: float2) -> float {
    return a.x*b.y - a.y*b.x;
}

func getortho(v: float2, polarity: bool, allow_zero: bool) -> float2 {
    float2 r;
    float len = length(v);
    if (len == 0) {
        if (polarity) {
            r.x = 0;
            r.y = (float) (!allow_zero);
        } else {
            r.x = 0;
            r.y = - (float) (!allow_zero);
        }
        return r;
    }

    if (polarity) {
        r.x = -v.y / len;
        r.y =  v.x / len;
    } else {
        r.x =  v.y / len;
        r.y = -v.x / len;
    }

    return r;
}

func solve_quadratic(a: float, b: float, c: float, out solution_count: int32_t, out solutions: float2) {
    solutions = {};
    if (abs(a) < 1.0e-14) {
        if (abs(b) < 1.0e-14) {
            if (c == 0) {
                solution_count = -1;
                return;
            }
        }
        solutions[0] = -c/b;
        solution_count = 1;
        return;
    }

    float dscr = b*b-4*a*c;
    if (dscr > 0) {
        dscr = sqrt(dscr);
        solutions[0] = (-b+dscr)/(2*a);
        solutions[1] = (-b-dscr)/(2*a);
        solution_count = 2;
        return;
    } else if (dscr == 0) {
        solutions[0] = -b/(2*a);
        solution_count = 1;
        return;
    } else {
        solution_count = 0;
        return;
    }
}

func solve_cubic_normed(a: float, b: float, c: float, out solution_count: int32_t, out solutions: float3) {
    var a2 = a*a;
    var q  = (a2 - 3*b)/9;
    var r  = (a*(2*a2-9*b) + 27*c)/54;
    var r2 = r*r;
    var q3 = q*q*q;
    float A, B;
    if (r2 < q3) {
        var t = r/sqrt(q3);
        if (t < -1) {
            t = -1;
        }
        if (t > 1) {
            t = 1;
        }
        t = acos(t);
        var a_3 = a/3;
        q = -2*sqrt(q);
        solutions[0] = q*cos(t/3)-a_3;
        solutions[1] = q*cos((t+2*PI)/3)-a_3;
        solutions[2] = q*cos((t-2*PI)/3)-a_3;
        solution_count = 3;
        return;
    } else {
        A = -pow(abs(r)+sqrt(r2-q3), 1.0/3.0);
        if (r < 0) {
            A = -A;
        }
        B = A == 0 ? 0 : q/A;
        var a_3 = a/3;
        solutions[0] = (A+B)-a;
        solutions[1] = -0.5*(A+B)-a;
        solutions[2] = 0.5*sqrt(3.0)*(A-B);
        if (abs(solutions[2]) < 1.0e-14) {
            solution_count = 2;
            return;
        }

        solution_count = 1;
    }
}

func solve_cubic(a: float, b: float, c: float, d: float, out solution_count:uint32_t, out solutions: float3) {
    if (abs(a) < 1.0e-14) {
        uint32_t cnt;
        float2 ss;
        solve_quadratic(b, c, d, cnt, ss);
        solutions[0] = ss[0];
        solutions[1] = ss[1];
        solution_count = cnt;
        return;
    }

    uint32_t cnt;
    float3 ss;
    solve_cubic_normed(b/a, c/a, d/a, cnt, ss);
    solution_count = cnt;
    solutions = ss;
}

struct Metrics {
    float32_t scale;
    float32_t xoff;
    float32_t yoff;
    float32_t translate_x;
    float32_t translate_y;
    bool      y_flip;
};

struct Push_Constant {
    uint64_t block_memory;
    uint64_t output_memory;
    uint64_t windings;
    Metrics metrics;
    int64_t size_sdf;
};

struct Multi_Distance {
    float32_t r, g, b;
    float32_t med;
};

enum Edge_Color {
    BLACK   = 0,
    RED     = 1,
    GREEN   = 2,
    YELLOW  = 3,
    BLUE    = 4,
    MAGENTA = 5,
    CYAN    = 6,
    WHITE   = 7
};

struct Edge_Segment {
    uint32_t type;
    int32_t  color;
    float2   start;
    float2   end;
    float2   control;
    float2   control1;
};

struct Signed_Distance {
    float32_t dist;
    float32_t d;
};

struct Edge_Point {
    Signed_Distance min_distance;
    Edge_Segment    *near_edge;
    float32_t       near_param;
};

struct Block_Shape {
    uint32_t first_contour_offset;
    uint32_t contour_count;
};

struct Block_Contour {
    uint32_t first_edge_offset;
    uint32_t edge_count;
};

[vk::push_constant]
uniform Push_Constant pc;

[[numthreads(8, 8, 1)]]
[shader("compute")]
void main(uint3 dtid: SV_DispatchThreadID) {
    uint2 pixel = dtid.xy;

    // Hardcode as 32 for now
    if (pixel.x >= pc.size_sdf || pixel.y >= pc.size_sdf) {
        return;
    }

    generate_msdf(pixel);
}

func generate_msdf(pixel: uint2) {
    int y = pixel.y;
    int x = pixel.x;
    int64_t row = pc.metrics.y_flip ? pixel.y : pc.size_sdf - pixel.y - 1;

    Multi_Distance contour_sd[30];

    Block_Shape *block_shape = (Block_Shape*)pc.block_memory;

    int32_t *windings = (int32_t*)pc.windings;

    if (block_shape.contour_count >= 30) {
        return;
    }

    float2 p = {
        ((float)x+pc.metrics.xoff - pc.metrics.translate_x)/(pc.metrics.scale*64.0),
        ((float)y+pc.metrics.yoff - pc.metrics.translate_y)/(pc.metrics.scale*64.0),
    };

    Edge_Point sr, sg, sb;
    sr.min_distance = {INF, 1};
    sg.min_distance = {INF, 1};
    sb.min_distance = {INF, 1};

    float d = abs(INF);
    float neg_dist = -INF;
    float pos_dist =  INF;
    int32_t winding = 0;

    for (int j = 0; j < block_shape.contour_count; j += 1) {
        Block_Contour *contour = (Block_Contour*) (pc.block_memory + block_shape.first_contour_offset + sizeof(Block_Contour) * j);
        Edge_Point r, g, b;
        r = {};
        g = {};
        b = {};
        r.min_distance = {INF, 1};
        g.min_distance = {INF, 1};
        b.min_distance = {INF, 1};

        for (int i = 0; i < contour.edge_count; i += 1) {
            Edge_Segment *edge = (Edge_Segment*) (pc.block_memory + contour.first_edge_offset + sizeof(Edge_Segment) * i);

            float pa;
            Signed_Distance distance = {INF, 1};

            switch (edge.type) {
            case 2: // vline
                linear_dist(*edge, p, distance, pa);
            case 3: // vcurve
                quadratic_dist(*edge, p, distance, pa);
            case 4: // vcubic
                cubic_dist(*edge, p, distance, pa);
            }

            if ((bool)(edge.color&Edge_Color.RED) && signed_compare(distance, r.min_distance)) {
                r.min_distance = distance;
                r.near_edge    = edge;
                r.near_param   = pa;
            }
            if ((bool)(edge.color&Edge_Color.GREEN) && signed_compare(distance, g.min_distance)) {
                g.min_distance = distance;
                g.near_edge    = edge;
                g.near_param   = pa;
            }
            if ((bool)(edge.color&Edge_Color.BLUE) && signed_compare(distance, b.min_distance)) {
                b.min_distance = distance;
                b.near_edge    = edge;
                b.near_param   = pa;
            }
        }

        if (signed_compare(r.min_distance, sr.min_distance)) {
            sr = r;
        }
        if (signed_compare(g.min_distance, sg.min_distance)) {
            sg = g;
        }
        if (signed_compare(b.min_distance, sb.min_distance)) {
            sb = b;
        }

        var med_min_dist = abs(median3(r.min_distance.dist, g.min_distance.dist, b.min_distance.dist));

        if (med_min_dist < d) {
            d = med_min_dist;
            winding = -windings[j];
        }

        dist_to_pseudo(r.min_distance, p, r.near_param, *r.near_edge);
        dist_to_pseudo(g.min_distance, p, g.near_param, *g.near_edge);
        dist_to_pseudo(b.min_distance, p, b.near_param, *b.near_edge);

        med_min_dist = median3(r.min_distance.dist, g.min_distance.dist, b.min_distance.dist);
        contour_sd[j].r = r.min_distance.dist;
        contour_sd[j].g = g.min_distance.dist;
        contour_sd[j].b = b.min_distance.dist;
        contour_sd[j].med = med_min_dist;

        if (windings[j] > 0 && med_min_dist >= 0 && abs(med_min_dist) < abs(pos_dist)) {
            pos_dist = med_min_dist;
        }
        if (windings[j] < 0 && med_min_dist <= 0 && abs(med_min_dist) < abs(neg_dist)) {
            neg_dist = med_min_dist;
        }
    }

    dist_to_pseudo(sr.min_distance, p, sr.near_param, *sr.near_edge);
    dist_to_pseudo(sg.min_distance, p, sg.near_param, *sg.near_edge);
    dist_to_pseudo(sb.min_distance, p, sb.near_param, *sb.near_edge);

    Multi_Distance msd = {INF, INF, INF, INF};

    if (pos_dist >= 0 && abs(pos_dist) <= abs(neg_dist)) {
        msd.med = INF;
        winding = 1;
        for (int i = 0; i < block_shape.contour_count; i += 1) {
            if (windings[i] > 0 && contour_sd[i].med > msd.med && abs(contour_sd[i].med) < abs(neg_dist)) {
                msd = contour_sd[i];
            }
        }
    } else if (neg_dist <= 0 && abs(neg_dist) <= abs(pos_dist)) {
        msd.med = -INF;
        winding = -1;
        for (int i = 0; i < block_shape.contour_count; i += 1) {
            if (windings[i] < 0 && contour_sd[i].med < msd.med && abs(contour_sd[i].med) < abs(pos_dist)) {
                msd = contour_sd[i];
            }
        }
    }

    for (int i = 0; i < block_shape.contour_count; i += 1) {
        if (windings[i] != winding && abs(contour_sd[i].med) < abs(msd.med)) {
            msd = contour_sd[i];
        }
    }

    if (median3(sr.min_distance.dist, sg.min_distance.dist, sb.min_distance.dist) == msd.med) {
        msd.r = sr.min_distance.dist;
        msd.g = sg.min_distance.dist;
        msd.b = sb.min_distance.dist;
    }

    var index = 3*((row*pc.size_sdf)+x);

    float *bitmap = (float*) pc.output_memory;
    bitmap[index+0] = msd.r/RANGE+0.5;
    bitmap[index+1] = msd.g/RANGE+0.5;
    bitmap[index+2] = msd.b/RANGE+0.5;
}

// Weird, I cannot use param as argument name
func linear_dist(e: Edge_Segment, origin: float2, out signed_distance: Signed_Distance, out p: float) {
    float2 aq, ab, eq;
    aq = origin - e.start;
    ab = e.end - e.start;
    p = dot(aq, ab) / dot(ab, ab);
    if (p > 0.5) {
        eq = e.end - origin;
    } else {
        eq = e.start - origin;
    }

    float endpoint_distance = length(eq);
    if (p > 0 && p < 1) {
        float2 ab_ortho = getortho(ab, false, false);
        float ortho_dist = dot(ab_ortho, aq);
        if (abs(ortho_dist) < endpoint_distance) {
            signed_distance = {ortho_dist, 0};
            return;
        }
    }

    ab = normalize(ab);
    eq = normalize(eq);
    float dist = (float)nonzero_sign(cross(aq, ab)) * endpoint_distance;
    float d = abs(dot(ab, eq));
    signed_distance = {dist, d};
}

func quadratic_dist(e: Edge_Segment, origin: float2, out signed_distance: Signed_Distance, out p: float) {
    float2 qa, ab, br;
    qa = e.start - origin;
    ab = e.control - e.start;
    br = e.start + e.end - e.control - e.control;

    float a, b, c, d;
    a = dot(br, br);
    b = 3*dot(ab, br);
    c = 2*dot(ab, ab) + dot(qa, br);
    d = dot(qa, ab);

    int32_t solution_count;
    float3 solutions;
    solve_cubic(a, b, c, d, solution_count, solutions);

    // distance from a
    float min_distance = (float)nonzero_sign(cross(ab, qa)) * length(qa);
    p = -dot(qa, ab) / dot(ab, ab);
    {
        float2 a, b;
        a = e.end - e.control;
        b = e.end - origin;

        // distance from b
        float distance = (float)nonzero_sign(cross(a, b))*length(b);
        if (abs(distance) < abs(min_distance)) {
            min_distance = distance;
            a = origin - e.control;
            b = e.end - e.control;
            p = dot(a, b) / dot(b, b);
        }
    }

    for (int i = 0; i < solution_count; i += 1) {
        float t = solutions[i];
        if (t > 0 && t < 1) {
            float2 end_point, a, b;
            end_point.x = e.start.x + 2*t*ab.x + t*t*br.x;
            end_point.y = e.start.y + 2*t*ab.y + t*t*br.y;

            a = e.end - e.start;
            b = end_point - origin;
            float distance = (float)nonzero_sign(cross(a, b))*length(b);
            if (abs(distance) <= abs(min_distance)) {
                min_distance = distance;
                p = t;
            }
        }
    }

    if (p >= 0 && p <= 1) {
        signed_distance = {min_distance, 0};
    }

    ab = normalize(ab);
    qa = normalize(qa);
    var aa = e.end - e.control;
    aa = normalize(aa);
    var bb = e.end - origin;
    bb = normalize(bb);

    if (p < 0.5) {
        signed_distance = {min_distance, abs(dot(ab, qa))};
    } else {
        signed_distance = {min_distance, abs(dot(aa, bb))};
    }
}

func cubic_dist(e: Edge_Segment, origin: float2, out signed_distance: Signed_Distance, out p: float) {
    float2 qa, ab, br, ass;
    qa = e.start - origin;
    ab = e.control - e.start;
    br = e.control1 - e.control - ab;
    ass = (e.end - e.control1) - (e.control1 - e.control) - br;

    float2 ep_dir = direction(e, 0);
    // distance from a
    float min_distance = (float)nonzero_sign(cross(ep_dir, qa))*length(qa);
    p = -dot(qa, ep_dir) / dot(ep_dir, ep_dir);
    {
        var a = e.end - origin;
        ep_dir = direction(e, 1);
        // distance from b
        var distance = (float)nonzero_sign(cross(ep_dir, a))*length(a);
        if (abs(distance) < abs(min_distance)) {
            min_distance = distance;

            a = origin + ep_dir - e.end;
            p = dot(a, ep_dir) / dot(ep_dir, ep_dir);
        }
    }

    let SEARCH_STARTS = 4;
    for (int i = 0; i < SEARCH_STARTS; i += 1) {
        var t = (float)i / (float)SEARCH_STARTS;
        var step = 0;
        while (true) {
            defer step += 1;
            var qpt = point(e, t);
            qpt = qpt - origin;
            var d = direction(e, t);
            var distance = (float)nonzero_sign(cross(d, qpt))*length(qpt);
            if (abs(distance) < abs(min_distance)) {
                min_distance = distance;
                p = t;
            }
            if (step == SEARCH_STARTS) {
                break;
            }

            float2 d1, d2;
            d1.x = 3*ass.x*t*t + 6*br.x*t + 3*ab.x;
            d1.y = 3*ass.y*t*t + 6*br.y*t + 3*ab.y;
            d2.x = 6*ass.x*t + 6*br.x;
            d2.y = 6*ass.y*t + 6*br.y;

            t -= dot(qpt, d1) / (dot(d1, d1) + dot(qpt, d2));
            if (t < 0 || t > 1) {
                break;
            }
        }
    }

    if (p >= 0 && p <= 1) {
        signed_distance = {min_distance, 0};
        return;
    }

    var d0 = direction(e, 0);
    var d1 = direction(e, 1);
    d0 = normalize(d0);
    d1 = normalize(d1);
    qa = normalize(qa);
    var a = e.end - origin;
    a = normalize(a);

    if (p < 0.5) {
        signed_distance = {min_distance, abs(dot(d0, qa))};
        return;
    } else {
        signed_distance = {min_distance, abs(dot(d1, a))};
        return;
    }
}

func dist_to_pseudo(inout distance: Signed_Distance, origin: float2, p: float, e: Edge_Segment) {
    if (p < 0) {
        var dir = direction(e, 0);
        dir = normalize(dir);
        var p = point(e, 0);
        var aq = origin - p;
        var ts = dot(aq, dir);
        if (ts < 0) {
            var pseudo_dist = cross(aq, dir);
            if (abs(pseudo_dist) <= abs(distance.dist)) {
                distance.dist = pseudo_dist;
                distance.d    = 0;
            }
        }
    } else if (p > 1) {
        var dir = direction(e, 1);
        dir = normalize(dir);
        var pt = point(e, 1);
        var bq = origin - pt;
        var ts = dot(bq, dir);
        if (ts > 0) {
            var pseudo_dist = cross(bq, dir);
            if (abs(pseudo_dist) <= abs(distance.dist)) {
                distance.dist = pseudo_dist;
                distance.d    = 0;
            }
        }
    }
}

func signed_compare(a: Signed_Distance, b: Signed_Distance) -> bool {
    return abs(a.dist) < abs(b.dist) || (abs(a.dist) == abs(b.dist) && a.d < b.d);
}

func mix(a: float2, b: float2, weight: float) -> float2 {
    float2 r;
    r.x = (1.0-weight)*a.x + weight*b.x;
    r.y = (1.0-weight)*a.y + weight*b.y;
    return r;
}

func linear_direction(e: Edge_Segment, p: float) -> float2 {
    return e.end - e.start;
}

func quadratic_direction(e: Edge_Segment, p: float) -> float2 {
    var a = e.control - e.start;
    var b = e.end     - e.control;
    return mix(a, b, p);
}

func cubic_direction(e: Edge_Segment, p: float) -> float2 {
    float2 r;
    float2 a, b, c, d, t;
    a = e.control  - e.start;
    b = e.control1 - e.control;
    c = mix(a, b, p);

    a = e.end - e.control1;
    d = mix(b, a, p);
    t = mix(c, d, p);

    if (t.x == 0 && t.y == 0) {
        if (p == 0) {
            r = e.control1 - e.start;
            return r;
        }

        if (p == 1) {
            r = e.end - e.control;
            return r;
        }
    }

    r = t;

    return r;
}

func direction(e: Edge_Segment, p: float) -> float2 {
    switch (e.type) {
    case 2: // vline
        return linear_direction(e, p);
    case 3: // vcurve
        return quadratic_direction(e, p);
    case 4: //vcubic
        return cubic_direction(e, p);
    }

    return {};
}

func linear_point(e: Edge_Segment, p: float) -> float2 {
    return mix(e.start, e.end, p);
}

func quadratic_point(e: Edge_Segment, p: float) -> float2 {
    var a = mix(e.start, e.control, p);
    var b = mix(e.control, e.end, p);
    return mix(a, b, p);
}

func cubic_point(e: Edge_Segment, p: float) -> float2 {
    var p12 = mix(e.control, e.control1, p);
    var a   = mix(e.start, e.control, p);
    var b   = mix(a, p12, p);
    var c   = mix(e.control1, e.end, p);
    var d   = mix(p12, c, p);
    return mix(b, d, p);
}

func point(e: Edge_Segment, p: float) -> float2 {
    switch (e.type) {
    case 2:
        return linear_point(e, p);
    case 3:
        return quadratic_point(e, p);
    case 4:
        return cubic_point(e, p);
    }

    return {};
}
