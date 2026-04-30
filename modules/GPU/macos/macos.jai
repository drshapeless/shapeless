#add_context gpu_context: *void;

init :: () {
    context_size := get_gpu_context_size();
    context.gpu_context = alloc(xx context_size);
    gpu_init(context.gpu_context);
}

deinit :: () {
    gpu_deinit(context.gpu_context);
}

#scope_file
#import,file "binding.jai";

Foundation :: #library,system,link_always "Foundation";
Metal :: #library,system,link_always "Metal";
#import "Basic";
