la s0, _test_start
########################
li t0, 0x00000001 # 1
li t1, 0x00000001 # 1
sll t0, t0, t1    # t0 = 2
sll t0, t0, t1    # t0 = 4
sll t0, t0, t1    # t0 = 8
sll t0, t0, t1    # t0 = 16
sll t0, t0, t1    # t0 = 32
li t1, 0x00000002 # 2
sll t0, t1, t0    # t0 = 2
sll t0, t1, t0    # t0 = 8
sll t0, t1, t0    # t0 = 512
sll t0, t1, t0    # t0 = 2
sll t0, t1, t0    # t0 = 8
sw t0, 0(s0)
sw zero, 4(s0)
sw zero, 8(s0)
sw zero, 12(s0)
la s0,_test_end #end_program