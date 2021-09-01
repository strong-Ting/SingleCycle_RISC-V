la s0, _test_start
########################
lui t0, 0x00000    # t0 = 0x00000000
lui t1, 0xfffff    # t1 = 0xfffff000
lui t2, 0x13579    # t2 = 0x13579000
sw t0, 0(s0)
sw t1, 4(s0)
sw t2, 8(s0)
sw zero, 12(s0)
la s0,_test_end #end_program