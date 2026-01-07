#program_export
run_after_load :: (app: *App) #c_call {
    push_context app.ctx {
        log("Greeting from Jacky");
    }
}

#import "Shapeless_Core";

#import "Basic";
