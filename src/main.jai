main :: () {
    handle := open_dynamic_library("jacky");
    assert(handle != null);
    defer close_dynamic_library(handle);

    fn: Run_After_Load_Func = get_dynamic_function(handle, "run_after_load");
    assert(fn != null);

    app: App;
    init(*app);

    fn(*app);
}

#import "Basic";
#import "POSIX";
#import "Shapeless_Core";
#import "Dynamic_Library";
