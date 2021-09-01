la s0, _test_start
########################
li t0, 0xa1b2c3d4  #
srli t0, t0, 3     # t0 = 0x1436587a
srli t0, t0, 4     # t0 = 0x01436587
srli t0, t0, 6     # t0 = 0x00050d96
srli t0, t0, 11    # t0 = 0x00000161
srli t0, t0, 7     # t0 = 0x00000001
li t1, 0xaabf790c  #
srli t2, t1, 25    # t2 = 0x00000055
srli t3, t1, 16    # t3 = 0x0000aabf
srli t4, t1, 18    # t4 = 0x00002aaf
sw t0, 0(s0)
sw t2, 4(s0)
sw t3, 8(s0)
sw t4, 12(s0)
la s0,_test_end #end_program