# SingleCycle_RISC-V
The CPU that is RISC-V instruction RV32I is implemented by single cycle.

In this project, build test environment by asm,gnu gcc,RISC-V simulator.

Done:
  - Test environment (testbench,each instruction test asm,asm & c compiler gnu tool chain, memory module&map,EDA tool Makefile)
  - implement single cycle version 
  
To do:
  - UART communication
  - Benchmark
  - FPGA testing(altera de2-115,Xilinx)
  - ASIC (will only commit tcl,script,makefile)
    - lint check
    - Synthesis
    - static timing analysis (STA)
    - logic equivalence check (LEC)
    - APR
    - DRC & LVS
  - 3 or 5 pipeline version 
  - AMBA & wishbone bus
  - extension instruction for AI accelerate(tensorflow for microcontroller lib)
  
# reference

arch: https://passlab.github.io/CSCE513/notes/lecture07_RISCV_Impl.pdf

imperas-riscv-tests: https://github.com/riscv-ovpsim/imperas-riscv-tests

