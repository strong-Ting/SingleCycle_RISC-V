la s0, _test_start
########################
li t0,0x0000008f
sw t0,0(s0)
lb t0,0(s0)
sw t0, 0(s0)

li t0,0x0000007f
sw t0,4(s0)
lb t0,4(s0)
sw t0,4(s0)

li t0,0x0000ff7f
sw t0,8(s0)
lb t0,8(s0)
sw t0,8(s0)

li t0,0xffffff7f
sw t0,8(s0)
lb t0,8(s0)
sw t0, 12(s0)
la s0,_test_end #end_program