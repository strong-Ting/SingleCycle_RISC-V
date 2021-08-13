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
addi s0, s0, 4