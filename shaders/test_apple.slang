struct Params {
    float *input;
    float *output;
};

[shader("compute")]
[numthreads(256, 1, 1)]
void compute_main(uint thread_id: SV_DispatchThreadID, ParameterBlock<Params> p) {
    var i = thread_id;
    if (i >= 256) {
        return;
    }
    p.output[i] = p.input[i] * 3.0;
}
