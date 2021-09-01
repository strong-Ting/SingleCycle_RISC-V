la s0, _test_start
########################
 li t0, 0xffffffff  # -1
slti t0, t0, -1    # t0 = 0
slti t0, t0, 1000  # t0 = 1
slti t0, t0, -2000 # t0 = 0
slti t0, t0, 1     # t0 = 1
slti t0, t0, 1111  # t0 = 1
li t1, 0xfffffc66  # -922
slti t2, t1, -876  # t2 = 1
slti t3, t1, 555   # t3 = 1
slti t4, t1, -1996 # t4 = 0
sw t0, 0(s0)
sw t2, 4(s0)
sw t3, 8(s0)
sw t4, 12(s0)
la s0,_test_end #end_program