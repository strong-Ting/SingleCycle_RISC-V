la s0, _test_start
########################
li t0, 0xfffff000  #
la t1, 0x14
jalr t1, t1, 0     # jump to 0x14
ori t0, t0, 1      # t0 = 0xfffff001 // Shouldn't be execute
jalr t1, t1, 4     # (0x14) 
ori t0, t0, 4      # t0 = 0xfffff004 // Shouldn't be execute
jalr t1, t1, 4     # jump
ori t0, t0, 16     # t0 = 0xfffff010 // Shouldn't be execute
sw t0, 0(s0)       # t0 = 0xfffff000
sw zero, 4(s0)
sw zero, 8(s0)
sw zero, 12(s0)
la s0,_test_end #end_program