struct In_Out {
    float* in_pointer;
    float* out_pointer;
};

struct Push_Constants {
    In_Out* in_out;
    uint64_t textures;
};

[shader("compute")]
[numthreads(256, 1, 1)]
void compute_main(uint thread_id: SV_DispatchThreadID, uniform Push_Constants pc) {
    var i = thread_id;
    var original = pc.in_out.in_pointer[i];
    pc.in_out.out_pointer[i] = original * 2;
}
