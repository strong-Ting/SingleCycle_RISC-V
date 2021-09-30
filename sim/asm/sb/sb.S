la s0, _test_start
########################
li t0, 0
sw t0, 0(s0) #avoid unknown
sw t0, 4(s0)
sw t0, 8(s0)
sw t0, 12(s0)
li t0, 0x0000010f  #
li t1, 0x000001f0  #
li t2, 0x00000111  #
li t3, 0x00000133  #
sb t0, 0(s0)
sb t1, 4(s0)
sb t2, 8(s0)
sb t3, 12(s0)
la s0,_test_end #end_program