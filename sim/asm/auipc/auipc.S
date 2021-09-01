la s0, _test_start
########################
auipc t0, 0x00000  # t0 = 0x00000004
auipc t1, 0xfffff  # t1 = 0xfffff008
auipc t2, 0x13579  # t2 = 0x1357900c
sw t0, 0(s0)
sw t1, 4(s0)
sw t2, 8(s0)
sw zero, 12(s0)
la s0,_test_end #end_program