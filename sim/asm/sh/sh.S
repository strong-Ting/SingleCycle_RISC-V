la s0, _test_start
########################
li t0, 0
sw t0, 0(s0) #avoid unknown
sw t0, 4(s0)
sw t0, 8(s0)
sw t0, 12(s0)
li t0, 0x0000000f  #
li t1, 0x000000f0  #
li t2, 0x00000011  #
li t3, 0x00000133  #
sh t0, 0(s0)
sh t1, 4(s0)
sh t2, 8(s0)
sh t3, 12(s0)
la s0,_test_end #end_program