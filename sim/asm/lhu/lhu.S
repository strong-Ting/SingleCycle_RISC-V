la s0, _test_start
########################
li t0,0xf0008fff
sw t0,0(s0)
lhu t0,0(s0)
sw t0, 0(s0)

li t0,0xf0007fff
sw t0,4(s0)
lhu t0,4(s0)
sw t0,4(s0)

sw zero, 8(s0)
sw zero, 12(s0)
la s0,_test_end #end_program