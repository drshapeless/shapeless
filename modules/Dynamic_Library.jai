open_dynamic_library :: (name: string) -> *void {
    handle :*void = null;
    #if OS == .WINDOWS {
        handle = GetModuleHandleA(to_c_string(sprint("%%", name, DLL_EXTENSION)));
    } else #if OS == .LINUX || OS == .MACOS {
        handle = dlopen(to_c_string(sprint("%%", name, DLL_EXTENSION)), RTLD_LAZY);
    } else {
        assert(false);
    }

    return handle;
}

get_dynamic_function :: (handle: *void, name: string) -> *void {
    func: *void = null;
    #if OS == .WINDOWS {
        func = GetProcAddress(handle, to_c_string(name));
    } else #if OS == .LINUX || OS == .MACOS {
        func = dlsym(handle, to_c_string(name));
    } else {
        assert(false);
    }
    return func;
}

close_dynamic_library :: (handle: *void) {
    #if OS == .WINDOWS {
        FreeLibrary(handle);
    } else #if OS == .LINUX || OS == .MACOS {
        dlclose(handle);
    } else {
        assert(false);
    }
}

#scope_file
#import "Basic";
#import "String";
#if OS == .WINDOWS {
    // HMODULE is still *void
    #import "Windows";
    DLL_EXTENSION :: ".dll";
} else #if OS == .LINUX {
    #import "POSIX";
    DLL_EXTENSION :: ".so";
} else #if OS == .MACOS {
    #import "POSIX";
    DLL_EXTENSION :: ".dylib";
}
