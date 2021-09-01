la s0, _test_start
########################
li t0, 0x00000001 #
ori t0, t0, 444   # t0 = 0x000001bd
ori t0, t0, 1765  # t0 = 0x000007fd
ori t0, t0, -291  # t0 = 0xfffffffd
ori t0, t0, 156   # t0 = 0xfffffffd
ori t0, t0, 1282  # t0 = 0xffffffff
li t1, 0x00000783 # t1 = 1923
ori t2, t1, 285   # t2 = 0x0000079f
ori t3, t1, -164  # t3 = 0xffffffdf
ori t4, t1, -1766 # t4 = 0xffffff9b
sw t0, 0(s0)
sw t2, 4(s0)
sw t3, 8(s0)
sw t4, 12(s0)
la s0,_test_end #end_program