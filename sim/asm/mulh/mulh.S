la s0, _test_start
########################
li t0,9999999
li t1,9999999
mulh t0,t0,t1 # t0 = 0x00005af3
sw t0,0(s0)
addi s0,s0,4
li t0,-999999
li t1,999752
mulh t0,t0,t1 # t0 = 0xffffff17
sw t0,0(s0)
addi s0,s0,4
li t0,-999999
li t1,-999563
mulh t0,t0,t1 # t0 = 0x000000e8
sw t0,0(s0)
sw zero, 4(s0)
la s0,_test_end #end_program