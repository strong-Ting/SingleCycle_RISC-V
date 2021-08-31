la s0, _test_start
########################
li t0, 0xffffffff  # -1
addi t0, t0, -1    # t0 = -2
addi t0, t0, 1893  # t0 = 0x00000763
addi t0, t0, -1912 # t0 = 0xffffffeb
addi t0, t0, 1074  # t0 = 0x0000041d
addi t0, t0, -1348 # t0 = 0xfffffed9
li t1, 0x00000521  # t1 = 1313
addi t2, t1, -798  # t2 = 515
addi t3, t1, 315   # t3 = 1628
addi t4, t1, 1177  # t4 = 2490
addi t5, t1, -2047 # t5 = -734
addi t6, t1, -1432 # t6 = -119
add t2, t2, t3     # t2 = 2143
add t4, t4, t5     # t4 = 1756
add t0, t0, t6     # t0 = -414
add t2, t2, t4     # t2 = 3899
add t0, t0, t2     # t0 = 0x00000d9d
sw t0, 0(s0)
sw zero, 4(s0)
sw zero, 8(s0)
sw zero, 12(s0)
la s0,_test_end #end_program