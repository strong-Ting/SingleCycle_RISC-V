la s0, _test_start
########################
li t0, 0xfffffffe   # large positive number
sltiu t0, t0, -1    # t0 = 1 (< 0xffffffff)
sltiu t0, t0, 1000  # t0 = 1
sltiu t0, t0, -2000 # t0 = 1
sltiu t0, t0, -255  # t0 = 1
sltiu t0, t0, 1     # t0 = 0
li t1, 0xaaaabbbb   # large positive number
sltiu t2, t1, -876  # t2 = 1
sltiu t3, t1, 555   # t3 = 0
sltiu t4, t1, -1996 # t4 = 1
sltiu t5, t1, 0     # t5 = 0
sltiu t6, t1, -922  # t6 = 1
sw t0, 0(s0)
sw t2, 4(s0)
sw t3, 8(s0)
sw t4, 12(s0)
la s0,_test_end #end_program