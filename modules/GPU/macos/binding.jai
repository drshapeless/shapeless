//
// This file was auto-generated using the following command:
//
// jai generate.jai
//



get_gpu_context_size :: () -> u64 #foreign libmetal;

gpu_init :: (ctx: *void) -> void #foreign libmetal;
gpu_deinit :: (ctx: *void) -> void #foreign libmetal;

#scope_file

libmetal :: #library "./libmetal";
