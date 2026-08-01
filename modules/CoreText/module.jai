#load "bindings.jai";

init_coretext :: () {
    init_objective_c_selector_struct(*__sel);
}

CoreText :: #library,system,link_always "CoreText";
FourCharCode :: u32;
ATSFontRef :: u32;
#scope_file
#import "Objective_C";
#import "macOS";
#import "CoreGraphics";
