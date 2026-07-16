#load "bindings.jai";

init_coretext :: () {
    init_objective_c_selector_struct(*__sel);
}

#scope_file
CoreText :: #library,system,link_always "CoreText";
#import "Objective_C";
#import "macOS";
