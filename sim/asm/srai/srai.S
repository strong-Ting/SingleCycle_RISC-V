la s0, _test_start
########################
li t0, 0xa1b2c3d4  #
srai t0, t0, 5     # t0 = 0xfd0d961e
srai t0, t0, 2     # t0 = 0xff436587
srai t0, t0, 8     # t0 = 0xffff4365
srai t0, t0, 9     # t0 = 0xffffffa1
srai t0, t0, 4     # t0 = 0xfffffffa
li t1, 0xaabf790c  #
srai t2, t1, 13    # t2 = 0xfffd55fb
srai t3, t1, 8     # t3 = 0xffaabf79
sw t0, 0(s0)
sw t1, 4(s0)
sw t2, 8(s0)
sw t3, 12(s0)
la s0,_test_end #end_program