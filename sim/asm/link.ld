OUTPUT_ARCH( "riscv" )

/* _STACK_SIZE = DEFINED(_STACK_SIZE) ? _STACK_SIZE : 0x1000; */
/* _TEST_SIZE = DEFINED(_TEST_SIZE) ? _TEST_SIZE : 0x100; */

/*****************************************************************************
 * Define memory layout
 ****************************************************************************/
MEMORY {
  imem : ORIGIN = 0x00000000, LENGTH = 0x00008000
  dmem : ORIGIN = 0x00008000, LENGTH = 0x00008000
}

/* Specify the default entry point to the program */

/*****************************************************************************
 * Define the sections, and where they are mapped in memory 
 ****************************************************************************/
 
SECTIONS {
  .text : {
    *(.text);
    *(.text.*);
  } > imem
}
