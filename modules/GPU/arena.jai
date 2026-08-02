Arena :: struct {
    alignment:     s32 = 256; // 256 bytes is a very common alignment for texture in Metal

    current_point: *u8;
    memory_base:   *u8;
    address_limit: *u8;
    allocator:     Allocator;
}

init :: (using arena: *Arena, reserve: s64 = 256 * 1024 * 1024) {
    allocator = context.gpu_allocator;
    memory_base = alloc(reserve);
    current_point = memory_base;
    address_limit = memory_base + reserve;
}

fini :: (arena: *Arena) {
    if !arena.memory_base return;
    if !arena.allocator.proc return;
    a := arena.allocator;
    a.proc(.FREE, 0, 0, arena.memory_base, a.data);
}

get :: (using arena: *Arena, size: s64, requested_alignment := -1) -> *void {
    // if !memory_base init(arena);

    result: *u8;

    if requested_alignment >= 0 {
        result = Align(current_point, requested_alignment);
    } else {
        result = Align(current_point, alignment);
    }

    end := size + result;

    Basic.assert(end <= address_limit, "Arena % is full! (Allocation size %; alignment %; address space size %; already allocated %.)\n", arena, size, alignment, address_limit - memory_base, current_point - memory_base);

    current_point = end;

    return result;
}

reset :: (using arena: *Arena) {
    if !memory_base return;

    current_point = memory_base;
}

arena_allocator_proc :: (mode: Allocator_Mode, requested_size: s64, old_size: s64, old_memory: *void, allocator_data: *void) -> *void {
    if mode == {
    case .ALLOCATE;
        arena := cast(*Arena) allocator_data;
        Basic.assert(arena != null);
        result := get(arena, requested_size);
        return result;
    case .FREE; return null;
    case;
        Basic.assert(false, "Arena does not support %", mode);
    }

    return null;
}

#scope_file
Align :: inline (n: $T, $$ PAGE_SIZE: s64) -> T {
    return (n + PAGE_SIZE-1) & ~(PAGE_SIZE-1);
}

Basic :: #import "Basic";
