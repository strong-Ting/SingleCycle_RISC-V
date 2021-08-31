la s0, _test_start
########################
li t0, 0xffffffff # 
li t1, 0xf0f0f0f0 # 
xor t0, t0, t1    # t0 = 0x0f0f0f0f
xor t0, t0, t1    # t0 = 0xffffffff
xor t0, t0, t1    # t0 = 0x0f0f0f0f
xor t0, t0, t1    # t0 = 0xffffffff
xor t0, t0, t1    # t0 = 0x0f0f0f0f
li t1, 0x77777777 # 
xor t0, t1, t0    # t0 = 0x78787878
xor t0, t1, t0    # t0 = 0x0f0f0f0f
xor t0, t1, t0    # t0 = 0x78787878
xor t0, t1, t0    # t0 = 0x0f0f0f0f
xor t0, t1, t0    # t0 = 0x78787878
sw t0, 0(s0)
sw zero, 4(s0)
sw zero, 8(s0)
sw zero, 12(s0)
la s0,_test_end #end_program