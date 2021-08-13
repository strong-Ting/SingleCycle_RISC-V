
instr =add

irun: ./asm/$(instr)/$(instr).hex
	irun -sv test.sv ../rtl/ram.sv +access+r +define+instr='"$(instr)"'

vcs: ./asm/$(instr)/$(instr).hex
	vcs -R -sverilog test.sv ../rtl/ram.sv +vcs+fsdbon +define+instr='"$(instr)"'

./asm/$(instr)/$(instr).hex:
	$(MAKE) -C asm/ build instr=$(instr)

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

.PHONY: clean

	