la s0, _test_start
########################
li t0, 0x12345678 # 
li t1, 0xfedcba98 # 
or t0, t0, t1     # t0 = 0xfefcfef8
or t0, t0, t1     # t0 = 0xfefcfef8
or t0, t0, t1     # t0 = 0xfefcfef8
or t0, t0, t1     # t0 = 0xfefcfef8
or t0, t0, t1     # t0 = 0xfefcfef8
li t1, 0x62400285 # 
or t0, t1, t0     # t0 = 0xfefcfefd
or t0, t1, t0     # t0 = 0xfefcfefd
or t0, t1, t0     # t0 = 0xfefcfefd
or t0, t1, t0     # t0 = 0xfefcfefd
or t0, t1, t0     # t0 = 0xfefcfefd
sw t0, 0(s0)
sw zero, 4(s0)
sw zero, 8(s0)
sw zero, 12(s0)
la s0,_test_end #end_program