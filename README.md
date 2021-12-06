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

# Running simulation
Support simulator: Irun,VCS,Icarus Verilog,Modelsim
    
Irun(ncverilog):
    
    cd ./sim
    make irun instr=add
    
VCS:

    cd ./sim
    make vcs instr=add
    
Icarus Verilog:

    cd ./sim
    make iverilog instr=add
    
Modelsim:

    cd ./sim
    make modelsim instr=add


If you modify the assembly code and want to compile it(ensure your enviorment install risc-gcc): 

    cd ./sim
    make modelsim instr=add build=true
    
# Assembly code for test each instruction  

    cd ./sim
    tree -L 2
    ├── asm
       ├── add
       ├── addi
       ├── and
       ├── andi
       ├── auipc
       ├── beq
       ├── bge
       ├── bgeu
       ├── blt
       ├── bltu
       ├── bne
       ├── jal
       ├── jalr
       ├── lb
       ├── lbu
       ├── lh
       ├── lhu
       ├── lui
       ├── lw
       ├── mul
       ├── mulh
       ├── mulhu
       ├── or
       ├── ori
       ├── sb
       ├── sh
       ├── sll
       ├── slli
       ├── slt
       ├── slti
       ├── sltiu
       ├── sltu
       ├── sra
       ├── srai
       ├── srl
       ├── srli
       ├── sub
       ├── sw
       ├── xor
       └── xori
    
# reference

arch: https://passlab.github.io/CSCE513/notes/lecture07_RISCV_Impl.pdf

imperas-riscv-tests: https://github.com/riscv-ovpsim/imperas-riscv-tests

