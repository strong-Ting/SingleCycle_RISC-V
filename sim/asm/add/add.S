li t0, 0xffffffff # -1
li t1, 0xffffffff # -1
add t0, t0, t1    # t0 = -2
add t0, t0, t1    # t0 = -3
add t0, t0, t1    # t0 = -4
add t0, t0, t1    # t0 = -5
add t0, t0, t1    # t0 = -6
li t1, 0xfffffffe # -2
add t0, t1, t0    # t0 = -8
add t0, t1, t0    # t0 = -10
add t0, t1, t0    # t0 = -12
add t0, t1, t0    # t0 = -14
add t0, t1, t0    # t0 = -16
sw t0, 0(s0)
addi s0, s0, 4