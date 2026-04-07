run: shaders
	jai build.jai
	RADV_PERFTEST=hic ./shapeless

run_test: shaders
	jai test_build.jai
	RADV_PERFTEST=hic ./test

run_test1: shaders
	jai test_build1.jai
	RADV_PERFTEST=hic ./test1

shaders:
	make -C shaders

.PHONY: shaders
