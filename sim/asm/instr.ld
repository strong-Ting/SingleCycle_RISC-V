OUTPUT_ARCH( "riscv" )

/*****************************************************************************
 * Define memory layout
 ****************************************************************************/
MEMORY {
  imem : ORIGIN = 0x00000000, LENGTH = 0x00000100
  dmem : ORIGIN = 0x00000100, LENGTH = 0x00000100
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

  _test : {
    . = ALIGN(4);
    _test_start = .;
    . += 0x100;
    _test_end = .;
  } > dmem
}
