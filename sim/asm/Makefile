
instr := add
ELF_NAME := $(instr)/$(instr)

export CROSS_PREFIX ?= riscv64-unknown-elf-
export RISCV_GCC ?= $(CROSS_PREFIX)gcc
export RISCV_OBJDUMP ?= $(CROSS_PREFIX)objdump -xsd
export RISCV_OBJCOPY ?= $(CROSS_PREFIX)objcopy -O ihex
export ELF2HEX ?= ./elf2hex
export OVPSIM ?= ../../tools/riscv-ovpsim/riscvOVPsim.exe

LDFILE := instr.ld
CFLAGS := -march=rv32im -mabi=ilp32
LDFLAGS := -static -nostdlib -nostartfiles -march=rv32i -mabi=ilp32 -T $(LDFILE) -lgcc

OVPSIM_FLAGS := --program $(ELF_NAME) \
    --variant RV32IM \
    --signaturedump \
    --override riscvOVPsim/cpu/sigdump/SignatureFile=$(instr)/$(instr).sig.dat.hex \
    --override riscvOVPsim/cpu/sigdump/StartAddress=0x100 \
    --override riscvOVPsim/cpu/sigdump/SignatureGranularity=4 \
    --override riscvOVPsim/cpu/sigdump/ByteCount=16 \
    --override riscvOVPsim/cpu/sigdump/SignatureAtEnd=T \
    --logfile $(instr)/$(instr).sig.run.log \
	--finishonopcode 0x20000413 #la _test_end
	#--finishafter 30
	#--finishonaddress 0x54
	
	

SRC_C := $(wildcard ./$(instr)/*.c)
OBJ_C := $(patsubst %.c,%.o,$(SRC_C))
SRC_S := $(wildcard ./$(instr)/*.S)
OBJ_S := $(patsubst %.S,%.o,$(SRC_S))
SRC := $(SRC_C) $(SRC_S)
OBJ := $(OBJ_C) $(OBJ_S)

.SUFFIXES: .o .S .c

.PHONY: all enter_dir build_sig

build: build_elf build_log build_hex build_sig
	
build_sig: #$(instr)/$(instr).sig.dat.hex
	$(OVPSIM) $(OVPSIM_FLAGS)

build_elf: $(OBJ) | $(LDFILE)
	$(RISCV_GCC) $^ $(LDFLAGS) -o $(ELF_NAME)

build_log: $(ELF_NAME)
	$(RISCV_OBJDUMP) $< > $(ELF_NAME).log

build_hex: $(ELF_NAME)
	$(ELF2HEX) --bit-width 32 --input $< > $(ELF_NAME).hex

%.o: %.S
	$(RISCV_GCC) -c $(CFLAGS) $^ -o $(ELF_NAME).o

%.o: %.c
	$(RISCV_GCC) -c $(CFLAGS) $^ -o $(ELF_NAME).o

.PHONY: clean 

clean:
	rm -rf $(ELF_NAME) $(ELF_NAME).log $(ELF_NAME)*.hex $(ELF_NAME)*.o $(ELF_NAME).sig.dat.hex $(ELF_NAME).sig.run.log
