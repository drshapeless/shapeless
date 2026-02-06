Shapeless_Func :: #type (app: *App, user_data: *void) -> *void;
Run_After_Load_Func :: #type (app: *App) -> void #c_call;

Mode :: struct {
    name: string;
    after_hooks: []Shapeless_Func;
}

Buffer :: struct {
    name: string;
    mode: string;
    file_path: string; // Absolute path
    data: []u8;
}

#load "app.jai";
#load "window.jai";
#load "frame.jai";
#load "font.jai";
#load "simple.jai";

#scope_file
#import "Hash_Table";
#import "Renderer";
#import "SDL3";
#import "String";
#import "Basic";
#import "Vulkan";
#import "Vulkan_Memory_Allocator";
#import "Json";
#import "Math";
#import "HarfBuzz";
// This is the stock freetype, not the latest version, but should be ok.
#import "freetype";
#import "ICU";
