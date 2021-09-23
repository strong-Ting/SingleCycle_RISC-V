
instr =add
rtlFile = ../rtl/*.v

build_hex:
	$(MAKE) -C asm/ build instr=$(instr)

irun: #./asm/$(instr)/$(instr).hex
	make build_hex
	irun -sv tb.sv $(rtlFile) +access+r +define+instr='"$(instr)"'

vcs: #./asm/$(instr)/$(instr).hex
	make build_hex
	vcs -R -sverilog tb.sv $(rtlFile) +vcs+fsdbon +define+instr='"$(instr)"'

#./asm/$(instr)/$(instr).hex:
#	$(MAKE) -C asm/ build instr=$(instr)
iverilog:
	make build_hex 
	iverilog -g2012 tb.sv $(rtlFile) -Diverilog -Dinstr='"$(instr)"' -o vvp.o
	vvp vvp.o

modelsim:
	make build_hex 
	vlib work/
	vlog -sv tb.sv $(rtlFile) +access+r +define+instr='"$(instr)"'
	vsim -c work.test -do "run -all" 

clean:
	rm -rf INCA_libs/
	rm -f irun.*
	rm -rf csrc/
	rm -f simv
	rm -rf simv.daidir/
	rm -f ucli.key
	rm -rf verdiLog
	rm -f novas.conf
	rm -f novas_dump.log
	rm -f *.vcd
	rm -f vvp.o
	rm -rf work/

.PHONY: clean vcs irun build_hex

	