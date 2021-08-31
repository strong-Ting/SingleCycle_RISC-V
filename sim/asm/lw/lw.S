la s0, _test_start
########################
li t0,0x111
li t1,0x222
li t2,0x333
li t3,0x444
sw t0, 0(s0)
sw t1, 4(s0)
sw t2, 8(s0)
sw t3, 12(s0)
lw t0, 12(s0)
lw t1, 8(s0)
sw t0, 8(s0)
sw t1, 12(s0)
li t0,0
li t1,0
lw t0, 4(s0)
lw t1, 0(s0)
sw t0, 0(s0)
sw t1, 4(s0)
li t0,0
li t1,0
la s0,_test_end #end_program