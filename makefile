run: shaders
	jai build.jai
	RADV_PERFTEST=hic ./shapeless

run_test: shaders
	jai test_build.jai
	RADV_PERFTEST=hic ./test

shaders:
	make -C shaders

.PHONY: shaders
