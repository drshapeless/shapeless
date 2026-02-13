SLANG_SRC = $(wildcard *.slang)
SLANG_OBJ = $(SLANG_SRC:.slang=.slang.spv)
SLANG_FLAGS = -target spirv -profile spirv_1_6 -emit-spirv-directly -fvk-use-entrypoint-name -fvk-use-scalar-layout -std 2026
OBJ = $(SLANG_OBJ)

all: $(OBJ)

%.spv: %
	slangc $(SLANG_FLAGS) -o $@ $<

clean:
	rm -f $(OBJ)

.PHONY: clean
