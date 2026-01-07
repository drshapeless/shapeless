run_after_load :: (app: *App) -> void #c_call {
    push_context app.ctx {
        log("This is from bb0");
    }
}

#import "Shapeless_Core";
#import "Basic";
