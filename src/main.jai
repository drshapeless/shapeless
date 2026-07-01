// Don't use SDL_EnterAppMainCallbacks, it crashes when resizing the
// window for unknown reason. I think I have to report this bug to the
// SDL3 issues.
//     --drshapeless Jun 29, 2026
main :: () {
    appstate: *void;

    app_init(*appstate, xx __command_line_arguments.count, __command_line_arguments.data);

    result: SDL_AppResult;
    while true {
        event: SDL_Event;
        while SDL_PollEvent(*event) {
            result = app_event(appstate, *event);
            if result != .CONTINUE {
                app_quit(appstate, result);
            }
        }

        result = app_iter(appstate);
        if result != .CONTINUE {
            app_quit(appstate, result);
        }

    }

    app_quit(appstate, result);

    // SDL_EnterAppMainCallbacks(app_init, app_iter, app_event, app_quit);
}

#load "app.jai";
#import "Basic";
