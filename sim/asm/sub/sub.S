la s0, _test_start
########################
li t0, 0x00000000 # 0
li t1, 0xffffffff # -1
sub t0, t0, t1    # t0 = 1
sub t0, t0, t1    # t0 = 2
sub t0, t0, t1    # t0 = 3
sub t0, t0, t1    # t0 = 4
sub t0, t0, t1    # t0 = 5
li t1, 0xfffffffd # -3
sub t0, t1, t0    # t0 = -8
sub t0, t1, t0    # t0 = 5
sub t0, t1, t0    # t0 = -8
sub t0, t1, t0    # t0 = 5
sub t0, t1, t0    # t0 = -8
sw t0, 0(s0)
sw zero, 4(s0)
sw zero, 8(s0)
sw zero, 12(s0)
la s0,_test_end #end_program