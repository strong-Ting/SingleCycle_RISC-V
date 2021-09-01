la s0, _test_start
########################
li t0, 0xabcdef98  #
andi t0, t0, -333  # t0 = 0xabcdef90
andi t0, t0, -188  # t0 = 0xabcdee00
andi t0, t0, 521   # t0 = 0x00000200
andi t0, t0, -377  # t0 = 0x00000200
andi t0, t0, 853   # t0 = 0x00000200
li t1, 0x12345678  #
andi t2, t1, 2033  # t2 = 0x00000670
andi t3, t1, 218   # t3 = 0x00000058
andi t4, t1, -316  # t4 = 0x12345640
sw t0, 0(s0)
sw t2, 4(s0)
sw t3, 8(s0)
sw t4, 12(s0)
la s0,_test_end #end_program