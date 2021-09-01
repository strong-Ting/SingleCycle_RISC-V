la s0, _test_start
########################
li t0, 0xffffffff  #
xori t0, t0, 123   # t0 = 0xffffff84
xori t0, t0, -1675 # t0 = 0x000006f1
xori t0, t0, -831  # t0 = 0xfffffa30
xori t0, t0, 2033  # t0 = 0xfffffdc1
xori t0, t0, 1187  # t0 = 0xfffff962
li t1, 0x00000387  # t1 = 903
xori t2, t1, -285  # t2 = 0xfffffd64
xori t3, t1, 164   # t3 = 0x00000323
xori t4, t1, 1766  # t4 = 0x00000561
sw t0, 0(s0)
sw t2, 4(s0)
sw t3, 8(s0)
sw t4, 12(s0)
la s0,_test_end #end_program