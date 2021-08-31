la s0, _test_start
########################
li t0,100
li t1,954
mul t0,t0,t1 # t0 = 0x000174a8
sw t0,0(s0)
addi s0,s0,4
li t0,-49
li t1,25 
mul t0,t0,t1 # t0 = 0xfffffb37
sw t0,0(s0)
addi s0,s0,4
li t0,-32
li t1,-954
mul t0,t0,t1 #t0 = 0x00007740
sw t0,0(s0)
sw zero,4(s0)
la s0,_test_end #end_program