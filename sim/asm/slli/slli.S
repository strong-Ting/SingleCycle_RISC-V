la s0, _test_start
########################
li t0, 0x0000000a  #
slli t0, t0, 2     # t0 = 0x00000028
slli t0, t0, 5     # t0 = 0x00000500
slli t0, t0, 7     # t0 = 0x00028000
slli t0, t0, 10    # t0 = 0x0a000000
slli t0, t0, 6     # t0 = 0x80000000
li t1, 0x1ab23cd4  #
slli t2, t1, 15    # t2 = 0x1e6a0000
slli t3, t1, 6     # t3 = 0xac8f3500
slli t4, t1, 28    # t4 = 0x40000000
sw t0, 0(s0)
sw t2, 4(s0)
sw t3, 8(s0)
sw t4, 12(s0)
la s0,_test_end #end_program