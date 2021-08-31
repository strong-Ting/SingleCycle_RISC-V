la s0, _test_start
########################
li t0, 0x87654321 #
li t1, 0x00000004 #
sra t0, t0, t1    # t0 = 0xf8765432
sra t0, t0, t1    # t0 = 0xff876543
sra t0, t0, t1    # t0 = 0xfff87654
sra t0, t0, t1    # t0 = 0xffff8765
sra t0, t0, t1    # t0 = 0xfffff876
li t1, 0x77777777 #
sra t0, t1, t0    # t0 = 0x000001dd
sra t0, t1, t0    # t0 = 0x00000003
sra t0, t1, t0    # t0 = 0x0eeeeeee
sra t0, t1, t0    # t0 = 0x0001dddd
sra t0, t1, t0    # t0 = 0x00000003
sw t0, 0(s0)
sw zero, 4(s0)
sw zero, 8(s0)
sw zero, 12(s0)
la s0,_test_end #end_program