la s0, _test_start
########################
li t0, 0xffffffff #
li t1, 0x75eca864 #
srl t0, t0, t1    # t0 = 0x0fffffff
srl t0, t0, t1    # t0 = 0x00ffffff
srl t0, t0, t1    # t0 = 0x000fffff
srl t0, t0, t1    # t0 = 0x0000ffff
srl t0, t0, t1    # t0 = 0x00000fff
li t1, 0x12345678 #
srl t0, t1, t0    # t0 = 0x00000000
srl t0, t1, t0    # t0 = 0x12345678
srl t0, t1, t0    # t0 = 0x00000012
srl t0, t1, t0    # t0 = 0x0000048d
srl t0, t1, t0    # t0 = 0x000091a2
sw t0, 0(s0)
sw zero, 4(s0)
sw zero, 8(s0)
sw zero, 12(s0)
la s0,_test_end #end_program