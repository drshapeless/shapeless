Shapeless_Func :: #type (app: *App, user_data: *void) -> *void;
Run_After_Load_Func :: #type (app: *App) -> void #c_call;

App :: struct {
    ctx: #Context;
    functions: Table(string, Shapeless_Func);
    variables: Table(string, Any);
    modes: Table(string, Mode);
    keybinds: Table(string, Shapeless_Func);

    buffers: [..] Buffer;
    current_buffer_index: s64;
}

Mode :: struct {
    name: string;
    after_hooks: []Shapeless_Func;
}

Buffer :: struct {
    name: string;
    mode: string;
    file_path: string; // Absolute path
    data: []u8;
    cursor: s64;
}

init :: (app: *App) {
    app.ctx = context;
}



#scope_file
#import "Hash_Table";
