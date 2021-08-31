la s0, _test_start
########################
li t0, 0xffffffff # -1
li t1, 0x00000001 # 1
slt t0, t0, t1    # t0 = 1
slt t0, t0, t1    # t0 = 0
slt t0, t0, t1    # t0 = 1
slt t0, t0, t1    # t0 = 0
slt t0, t0, t1    # t0 = 1
li t1, 0xffffffff # -1
slt t0, t1, t0    # t0 = 1
slt t0, t1, t0    # t0 = 1
slt t0, t1, t0    # t0 = 1
slt t0, t1, t0    # t0 = 1
slt t0, t1, t0    # t0 = 1
sw t0, 0(s0)
sw zero, 4(s0)
sw zero, 8(s0)
sw zero, 12(s0)
la s0,_test_end #end_program