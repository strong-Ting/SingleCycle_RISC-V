la s0, _test_start
########################
li t0, 0xfffff000  #
jal t1,end
addi t0,t0,1

sw t0, 0(s0)
sw zero, 4(s0)
sw zero, 8(s0)
sw zero, 12(s0)
la s0,_test_end #end_program

end:
    sw t0, 0(s0)
    sw zero, 4(s0)
    sw zero, 8(s0)
    sw zero, 12(s0)
    la s0,_test_end #end_program