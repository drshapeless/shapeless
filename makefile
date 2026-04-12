include .env
run: shaders
	jai build.jai
	./shapeless

run_test: shaders
	jai test_build.jai
	./test

run_test1: shaders
	jai test_build1.jai
	./test1

shaders:
	make -C shaders

.PHONY: shaders
