la s0, _test_start
########################
li t0, 0x12345678 # 
li t1, 0xffffffff # 
and t0, t0, t1    # t0 = 0x12345678
and t0, t0, t1    # t0 = 0x12345678
and t0, t0, t1    # t0 = 0x12345678
and t0, t0, t1    # t0 = 0x12345678
and t0, t0, t1    # t0 = 0x12345678
li t1, 0xf0f0f0f0 # 
and t0, t1, t0    # t0 = 0x10305070
and t0, t1, t0    # t0 = 0x10305070
and t0, t1, t0    # t0 = 0x10305070
and t0, t1, t0    # t0 = 0x10305070
and t0, t1, t0    # t0 = 0x10305070
sw t0, 0(s0)
sw zero, 4(s0)
sw zero, 8(s0)
sw zero, 12(s0)
la s0,_test_end #end_program