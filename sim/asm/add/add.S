la s0, _test_start
########################
addi t0,zero,-1 # -1
addi t1,zero,-1 # -1
add t0, t0, t1    # t0 = -2
add t0, t0, t1    # t0 = -3
add t0, t0, t1    # t0 = -4
add t0, t0, t1    # t0 = -5
add t0, t0, t1    # t0 = -6
addi t1,zero,-2 # -2
add t0, t1, t0    # t0 = -8
add t0, t1, t0    # t0 = -10
add t0, t1, t0    # t0 = -12
add t0, t1, t0    # t0 = -14
add t0, t1, t0    # t0 = -16
sw t0, 0(s0)
sw zero, 4(s0)
sw zero, 8(s0)
sw zero, 12(s0)
la s0,_test_end #end_program