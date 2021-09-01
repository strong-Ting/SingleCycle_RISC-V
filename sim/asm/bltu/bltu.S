la s0, _test_start
########################
li t0, 0xf
li t1, 0xe
bltu t0, t1, end
li t0, 0x1
li t1, 0x1 #

end:
    sw t0, 0(s0)
    sw t1, 4(s0)
    sw zero, 8(s0)
    sw zero, 12(s0)
    la s0,_test_end #end_program