run:
	make -C shaders
	jai build.jai
	RADV_PERFTEST=hic ./shapeless
