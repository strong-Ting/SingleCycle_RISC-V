wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/DICS/M10912039/RISC-V/SingleCycle_RISC-V/fpga/wave.fsdb}
wvGetSignalOpen -win $_nWave1
wvOpenFile -win $_nWave1 \
           {/home/DICS/M10912039/RISC-V/SingleCycle_RISC-V/fpga/novas.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/altera_generic_pll_functions"
wvGetSignalSetScope -win $_nWave1 "/test"
wvGetSignalSetScope -win $_nWave1 "/test/RAM_2PORT_inst"
wvGetSignalSetScope -win $_nWave1 "/test/RAM_2PORT_inst/altsyncram_component"
wvGetSignalSetScope -win $_nWave1 \
           "/test/RAM_2PORT_inst/altsyncram_component/m_default"
wvGetSignalSetScope -win $_nWave1 \
           "/test/RAM_2PORT_inst/altsyncram_component/m_default/altsyncram_inst"
wvSetPosition -win $_nWave1 {("G1" 2)}
wvSetPosition -win $_nWave1 {("G1" 2)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test/RAM_2PORT_inst/altsyncram_component/m_default/altsyncram_inst/mem_data\[0:65535\]} \
{/test/RAM_2PORT_inst/altsyncram_component/m_default/altsyncram_inst/mem_data_b\[0:65535\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 2 )} 
wvSetPosition -win $_nWave1 {("G1" 2)}
wvGetSignalSetScope -win $_nWave1 \
           "/test/RAM_2PORT_inst/altsyncram_component/m_default/altsyncram_inst/mem"
wvGetSignalSetScope -win $_nWave1 \
           "/test/RAM_2PORT_inst/altsyncram_component/m_default/altsyncram_inst/dev"
wvGetSignalSetScope -win $_nWave1 \
           "/test/RAM_2PORT_inst/altsyncram_component/m_default/altsyncram_inst/mem"
wvGetSignalSetScope -win $_nWave1 \
           "/test/RAM_2PORT_inst/altsyncram_component/m_default/altsyncram_inst/dev"
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvExpandBus -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 65538)}
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 0
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1661
wvScrollUp -win $_nWave1 296
wvScrollUp -win $_nWave1 986
wvScrollUp -win $_nWave1 494
wvScrollUp -win $_nWave1 394
wvScrollUp -win $_nWave1 987
wvScrollUp -win $_nWave1 987
wvScrollUp -win $_nWave1 394
wvScrollUp -win $_nWave1 296
wvScrollUp -win $_nWave1 691
wvScrollUp -win $_nWave1 493
wvScrollUp -win $_nWave1 296
wvScrollUp -win $_nWave1 395
wvScrollUp -win $_nWave1 493
wvScrollUp -win $_nWave1 296
wvScrollUp -win $_nWave1 592
wvScrollUp -win $_nWave1 296
wvScrollUp -win $_nWave1 296
wvScrollUp -win $_nWave1 296
wvScrollUp -win $_nWave1 197
wvScrollUp -win $_nWave1 197
wvScrollUp -win $_nWave1 99
wvScrollUp -win $_nWave1 197
wvScrollUp -win $_nWave1 395
wvScrollUp -win $_nWave1 493
wvScrollUp -win $_nWave1 592
wvScrollUp -win $_nWave1 888
wvScrollUp -win $_nWave1 2072
wvScrollUp -win $_nWave1 1184
wvScrollUp -win $_nWave1 2367
wvScrollUp -win $_nWave1 1283
wvScrollUp -win $_nWave1 1578
wvScrollUp -win $_nWave1 1579
wvScrollUp -win $_nWave1 1874
wvScrollUp -win $_nWave1 1875
wvScrollUp -win $_nWave1 2664
wvScrollUp -win $_nWave1 2367
wvScrollUp -win $_nWave1 1480
wvScrollUp -win $_nWave1 987
wvScrollUp -win $_nWave1 1085
wvScrollUp -win $_nWave1 1184
wvScrollUp -win $_nWave1 789
wvScrollUp -win $_nWave1 2960
wvScrollUp -win $_nWave1 1085
wvScrollUp -win $_nWave1 1480
wvScrollUp -win $_nWave1 1283
wvScrollUp -win $_nWave1 887
wvScrollUp -win $_nWave1 987
wvScrollUp -win $_nWave1 1480
wvScrollUp -win $_nWave1 986
wvScrollUp -win $_nWave1 987
wvScrollUp -win $_nWave1 1282
wvScrollUp -win $_nWave1 691
wvScrollUp -win $_nWave1 493
wvScrollUp -win $_nWave1 691
wvScrollUp -win $_nWave1 493
wvScrollUp -win $_nWave1 395
wvScrollUp -win $_nWave1 690
wvScrollUp -win $_nWave1 494
wvScrollUp -win $_nWave1 789
wvScrollUp -win $_nWave1 296
wvScrollUp -win $_nWave1 296
wvScrollUp -win $_nWave1 888
wvScrollUp -win $_nWave1 592
wvScrollUp -win $_nWave1 888
wvScrollUp -win $_nWave1 690
wvScrollUp -win $_nWave1 1283
wvScrollUp -win $_nWave1 592
wvScrollUp -win $_nWave1 394
wvScrollUp -win $_nWave1 198
wvScrollUp -win $_nWave1 493
wvScrollUp -win $_nWave1 296
wvScrollUp -win $_nWave1 296
wvScrollUp -win $_nWave1 197
wvScrollUp -win $_nWave1 99
wvScrollUp -win $_nWave1 99
wvScrollUp -win $_nWave1 197
wvScrollUp -win $_nWave1 197
wvScrollUp -win $_nWave1 99
wvScrollUp -win $_nWave1 296
wvScrollUp -win $_nWave1 690
wvScrollUp -win $_nWave1 198
wvScrollDown -win $_nWave1 789
wvScrollDown -win $_nWave1 1184
wvScrollDown -win $_nWave1 99
wvScrollDown -win $_nWave1 690
wvScrollDown -win $_nWave1 198
wvScrollDown -win $_nWave1 1183
wvScrollDown -win $_nWave1 296
wvScrollDown -win $_nWave1 99
wvScrollDown -win $_nWave1 493
wvScrollDown -win $_nWave1 198
wvScrollDown -win $_nWave1 197
wvScrollDown -win $_nWave1 296
wvScrollDown -win $_nWave1 296
wvScrollDown -win $_nWave1 197
wvScrollDown -win $_nWave1 99
wvScrollDown -win $_nWave1 99
wvScrollDown -win $_nWave1 295
wvScrollDown -win $_nWave1 296
wvScrollDown -win $_nWave1 99
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 1085
wvScrollDown -win $_nWave1 493
wvScrollDown -win $_nWave1 296
wvScrollDown -win $_nWave1 197
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 493
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 394
wvScrollDown -win $_nWave1 198
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 690
wvScrollDown -win $_nWave1 1086
wvScrollDown -win $_nWave1 1677
wvScrollDown -win $_nWave1 1874
wvScrollDown -win $_nWave1 2072
wvScrollDown -win $_nWave1 2269
wvScrollDown -win $_nWave1 2466
wvScrollDown -win $_nWave1 2270
wvScrollDown -win $_nWave1 1775
wvScrollDown -win $_nWave1 1776
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 493
wvScrollDown -win $_nWave1 493
wvScrollDown -win $_nWave1 691
wvScrollDown -win $_nWave1 691
wvScrollDown -win $_nWave1 1381
wvScrollDown -win $_nWave1 1578
wvScrollDown -win $_nWave1 1085
wvScrollDown -win $_nWave1 1776
wvScrollDown -win $_nWave1 1973
wvScrollDown -win $_nWave1 2664
wvScrollDown -win $_nWave1 1677
wvScrollDown -win $_nWave1 987
wvScrollDown -win $_nWave1 1184
wvScrollDown -win $_nWave1 2072
wvScrollDown -win $_nWave1 1381
wvScrollDown -win $_nWave1 690
wvScrollDown -win $_nWave1 494
wvScrollDown -win $_nWave1 888
wvScrollDown -win $_nWave1 690
wvScrollDown -win $_nWave1 1085
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 691
wvScrollDown -win $_nWave1 493
wvScrollDown -win $_nWave1 691
wvScrollDown -win $_nWave1 296
wvScrollDown -win $_nWave1 888
wvScrollDown -win $_nWave1 493
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 690
wvScrollDown -win $_nWave1 296
wvScrollDown -win $_nWave1 691
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 296
wvScrollDown -win $_nWave1 296
wvScrollDown -win $_nWave1 394
wvScrollDown -win $_nWave1 296
wvScrollDown -win $_nWave1 99
wvSelectSignal -win $_nWave1 {( "G1" 65538 )} 
wvExpandBus -win $_nWave1 {("G1" 65538)}
wvScrollUp -win $_nWave1 2367
wvScrollUp -win $_nWave1 789
wvScrollUp -win $_nWave1 1974
wvScrollUp -win $_nWave1 1579
wvScrollUp -win $_nWave1 789
wvScrollUp -win $_nWave1 987
wvScrollUp -win $_nWave1 789
wvScrollUp -win $_nWave1 790
wvScrollUp -win $_nWave1 1184
wvScrollUp -win $_nWave1 1579
wvScrollUp -win $_nWave1 789
wvScrollUp -win $_nWave1 1974
wvScrollUp -win $_nWave1 1184
wvScrollUp -win $_nWave1 592
wvScrollUp -win $_nWave1 395
wvScrollUp -win $_nWave1 789
wvScrollUp -win $_nWave1 592
wvScrollUp -win $_nWave1 198
wvScrollUp -win $_nWave1 592
wvScrollUp -win $_nWave1 197
wvScrollUp -win $_nWave1 395
wvScrollUp -win $_nWave1 987
wvScrollUp -win $_nWave1 986
wvScrollUp -win $_nWave1 592
wvScrollUp -win $_nWave1 1777
wvScrollUp -win $_nWave1 789
wvScrollUp -win $_nWave1 592
wvScrollUp -win $_nWave1 987
wvScrollUp -win $_nWave1 987
wvScrollUp -win $_nWave1 1973
wvScrollUp -win $_nWave1 592
wvScrollUp -win $_nWave1 2171
wvScrollUp -win $_nWave1 987
wvScrollUp -win $_nWave1 1381
wvScrollUp -win $_nWave1 790
wvScrollUp -win $_nWave1 592
wvScrollUp -win $_nWave1 1184
wvScrollUp -win $_nWave1 789
wvScrollUp -win $_nWave1 592
wvScrollUp -win $_nWave1 987
wvScrollUp -win $_nWave1 395
wvScrollUp -win $_nWave1 197
wvScrollUp -win $_nWave1 3553
wvScrollUp -win $_nWave1 394
wvScrollUp -win $_nWave1 790
wvScrollUp -win $_nWave1 789
wvScrollUp -win $_nWave1 592
wvScrollUp -win $_nWave1 592
wvScrollUp -win $_nWave1 987
wvScrollUp -win $_nWave1 1382
wvScrollUp -win $_nWave1 1381
wvScrollUp -win $_nWave1 592
wvScrollUp -win $_nWave1 987
wvScrollUp -win $_nWave1 987
wvScrollUp -win $_nWave1 1184
wvScrollUp -win $_nWave1 1973
wvScrollUp -win $_nWave1 1579
wvScrollUp -win $_nWave1 1777
wvScrollUp -win $_nWave1 1973
wvScrollUp -win $_nWave1 1382
wvScrollUp -win $_nWave1 1184
wvScrollUp -win $_nWave1 394
wvScrollUp -win $_nWave1 2369
wvScrollUp -win $_nWave1 789
wvScrollUp -win $_nWave1 987
wvScrollUp -win $_nWave1 789
wvScrollUp -win $_nWave1 987
wvScrollUp -win $_nWave1 1184
wvScrollUp -win $_nWave1 1382
wvScrollUp -win $_nWave1 2171
wvScrollUp -win $_nWave1 1381
wvScrollUp -win $_nWave1 592
wvScrollUp -win $_nWave1 395
wvScrollDown -win $_nWave1 4144
wvScrollDown -win $_nWave1 790
wvScrollDown -win $_nWave1 789
wvScrollDown -win $_nWave1 1184
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 197
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 2171
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 197
wvScrollDown -win $_nWave1 3158
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 987
wvScrollDown -win $_nWave1 394
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 197
wvScrollUp -win $_nWave1 986
wvScrollUp -win $_nWave1 197
wvScrollUp -win $_nWave1 790
wvScrollUp -win $_nWave1 197
wvScrollUp -win $_nWave1 987
wvScrollUp -win $_nWave1 197
wvScrollUp -win $_nWave1 790
wvScrollUp -win $_nWave1 197
wvScrollUp -win $_nWave1 197
wvScrollUp -win $_nWave1 790
wvScrollUp -win $_nWave1 197
wvScrollUp -win $_nWave1 198
wvScrollUp -win $_nWave1 592
wvScrollUp -win $_nWave1 197
wvScrollUp -win $_nWave1 197
wvScrollDown -win $_nWave1 1183
wvScrollDown -win $_nWave1 987
wvScrollDown -win $_nWave1 198
wvScrollDown -win $_nWave1 197
wvScrollUp -win $_nWave1 16
wvScrollUp -win $_nWave1 379
wvScrollUp -win $_nWave1 187
wvSelectSignal -win $_nWave1 {( "G1" 65538 )} 
wvSelectSignal -win $_nWave1 {( "G1" 65539 )} 
wvSelectSignal -win $_nWave1 {( "G1" 65539 )} 
wvSetPosition -win $_nWave1 {("G1" 65539)}
wvExpandBus -win $_nWave1 {("G1" 65539)}
wvSetPosition -win $_nWave1 {("G1" 131106)}
wvScrollUp -win $_nWave1 3
wvSelectSignal -win $_nWave1 {( "G1" 65539 )} 
wvSelectSignal -win $_nWave1 {( "G1" 65539 )} 
wvSetPosition -win $_nWave1 {("G1" 65539)}
wvCollapseBus -win $_nWave1 {("G1" 65539)}
wvSetPosition -win $_nWave1 {("G1" 65539)}
wvSetPosition -win $_nWave1 {("G1" 131074)}
wvSelectSignal -win $_nWave1 {( "G1" 65538 )} 
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 2741
wvScrollDown -win $_nWave1 197
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 394
wvScrollDown -win $_nWave1 198
wvScrollDown -win $_nWave1 394
wvScrollDown -win $_nWave1 198
wvScrollDown -win $_nWave1 197
wvScrollDown -win $_nWave1 1776
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 197
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 197
wvScrollDown -win $_nWave1 3158
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 789
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 1382
wvScrollDown -win $_nWave1 1381
wvScrollDown -win $_nWave1 790
wvScrollDown -win $_nWave1 986
wvScrollDown -win $_nWave1 790
wvScrollDown -win $_nWave1 197
wvScrollDown -win $_nWave1 198
wvScrollDown -win $_nWave1 197
wvScrollDown -win $_nWave1 3158
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 987
wvScrollDown -win $_nWave1 394
wvScrollDown -win $_nWave1 790
wvScrollDown -win $_nWave1 789
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 789
wvScrollDown -win $_nWave1 987
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 986
wvScrollDown -win $_nWave1 1184
wvScrollDown -win $_nWave1 1185
wvScrollDown -win $_nWave1 986
wvScrollDown -win $_nWave1 790
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 986
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 394
wvScrollDown -win $_nWave1 198
wvScrollDown -win $_nWave1 197
wvScrollDown -win $_nWave1 197
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 987
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 790
wvScrollDown -win $_nWave1 789
wvScrollDown -win $_nWave1 987
wvScrollDown -win $_nWave1 789
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 394
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 197
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 197
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 197
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 790
wvScrollDown -win $_nWave1 197
wvScrollDown -win $_nWave1 197
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 198
wvScrollDown -win $_nWave1 197
wvScrollDown -win $_nWave1 987
wvScrollDown -win $_nWave1 197
wvScrollDown -win $_nWave1 197
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 394
wvScrollDown -win $_nWave1 593
wvScrollDown -win $_nWave1 592
wvScrollDown -win $_nWave1 197
wvScrollDown -win $_nWave1 1776
wvScrollDown -win $_nWave1 198
wvScrollDown -win $_nWave1 197
wvScrollDown -win $_nWave1 987
wvScrollDown -win $_nWave1 394
wvScrollDown -win $_nWave1 395
wvScrollDown -win $_nWave1 395
wvScrollUp -win $_nWave1 789
wvScrollUp -win $_nWave1 790
wvScrollUp -win $_nWave1 1184
wvScrollUp -win $_nWave1 1776
wvScrollUp -win $_nWave1 3947
wvScrollUp -win $_nWave1 2566
wvScrollUp -win $_nWave1 5131
wvScrollUp -win $_nWave1 5526
wvScrollUp -win $_nWave1 5723
wvScrollUp -win $_nWave1 4145
wvScrollUp -win $_nWave1 2171
wvScrollUp -win $_nWave1 4736
wvScrollUp -win $_nWave1 5131
wvScrollUp -win $_nWave1 1974
wvScrollUp -win $_nWave1 5526
wvScrollUp -win $_nWave1 2763
wvScrollUp -win $_nWave1 2171
wvScrollUp -win $_nWave1 2565
wvScrollUp -win $_nWave1 2566
wvScrollUp -win $_nWave1 3355
wvScrollUp -win $_nWave1 3158
wvScrollUp -win $_nWave1 3355
wvScrollUp -win $_nWave1 3157
wvScrollUp -win $_nWave1 1185
wvScrollUp -win $_nWave1 1578
wvScrollUp -win $_nWave1 987
wvScrollUp -win $_nWave1 1184
wvScrollUp -win $_nWave1 1579
wvScrollUp -win $_nWave1 2368
wvScrollUp -win $_nWave1 2566
wvScrollUp -win $_nWave1 2171
wvScrollUp -win $_nWave1 2368
wvScrollUp -win $_nWave1 1974
wvScrollUp -win $_nWave1 1776
wvScrollUp -win $_nWave1 1381
wvScrollUp -win $_nWave1 1382
wvScrollUp -win $_nWave1 2566
wvScrollUp -win $_nWave1 1578
wvScrollUp -win $_nWave1 987
wvScrollUp -win $_nWave1 1184
wvScrollUp -win $_nWave1 1382
wvScrollUp -win $_nWave1 1184
wvScrollUp -win $_nWave1 1973
wvScrollUp -win $_nWave1 1974
wvScrollUp -win $_nWave1 789
wvScrollUp -win $_nWave1 790
wvScrollUp -win $_nWave1 1184
wvScrollUp -win $_nWave1 789
wvScrollUp -win $_nWave1 1382
wvScrollUp -win $_nWave1 1381
wvScrollUp -win $_nWave1 1382
wvScrollUp -win $_nWave1 592
wvScrollUp -win $_nWave1 1184
wvScrollUp -win $_nWave1 1184
wvScrollUp -win $_nWave1 790
wvScrollUp -win $_nWave1 1578
wvScrollUp -win $_nWave1 987
wvScrollUp -win $_nWave1 395
wvScrollUp -win $_nWave1 789
wvScrollUp -win $_nWave1 1184
wvScrollUp -win $_nWave1 987
wvScrollUp -win $_nWave1 592
wvScrollUp -win $_nWave1 592
wvScrollUp -win $_nWave1 198
wvScrollUp -win $_nWave1 1776
wvScrollUp -win $_nWave1 592
wvScrollUp -win $_nWave1 395
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvScrollDown -win $_nWave1 1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test"
wvGetSignalSetScope -win $_nWave1 "/test/RAM_1PORT_inst"
wvSetPosition -win $_nWave1 {("G2" 5)}
wvSetPosition -win $_nWave1 {("G2" 5)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/test/RAM_1PORT_inst/address\[15:0\]} \
{/test/RAM_1PORT_inst/clock} \
{/test/RAM_1PORT_inst/data\[31:0\]} \
{/test/RAM_1PORT_inst/q\[31:0\]} \
{/test/RAM_1PORT_inst/wren} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 1 2 3 4 5 )} 
wvSetPosition -win $_nWave1 {("G2" 5)}
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/test/RAM_1PORT_inst/altsyncram_component"
wvGetSignalSetScope -win $_nWave1 \
           "/test/RAM_1PORT_inst/altsyncram_component/m_default"
wvGetSignalSetScope -win $_nWave1 \
           "/test/RAM_1PORT_inst/altsyncram_component/m_default/altsyncram_inst"
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/test/RAM_1PORT_inst/address\[15:0\]} \
{/test/RAM_1PORT_inst/clock} \
{/test/RAM_1PORT_inst/data\[31:0\]} \
{/test/RAM_1PORT_inst/q\[31:0\]} \
{/test/RAM_1PORT_inst/wren} \
{/test/RAM_1PORT_inst/altsyncram_component/m_default/altsyncram_inst/mem_data\[0:65535\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 6 )} 
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
}
wvAddSignal -win $_nWave1 -group {"G2" \
{/test/RAM_1PORT_inst/address\[15:0\]} \
{/test/RAM_1PORT_inst/clock} \
{/test/RAM_1PORT_inst/data\[31:0\]} \
{/test/RAM_1PORT_inst/q\[31:0\]} \
{/test/RAM_1PORT_inst/wren} \
{/test/RAM_1PORT_inst/altsyncram_component/m_default/altsyncram_inst/mem_data\[0:65535\]} \
}
wvAddSignal -win $_nWave1 -group {"G3" \
}
wvSelectSignal -win $_nWave1 {( "G2" 6 )} 
wvSetPosition -win $_nWave1 {("G2" 6)}
wvGetSignalClose -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 6 )} 
wvExpandBus -win $_nWave1 {("G2" 6)}
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 1
wvScrollUp -win $_nWave1 2157
wvScrollUp -win $_nWave1 888
wvScrollUp -win $_nWave1 2960
wvScrollUp -win $_nWave1 1776
wvScrollUp -win $_nWave1 1776
wvScrollUp -win $_nWave1 1677
wvScrollUp -win $_nWave1 2960
wvScrollUp -win $_nWave1 1974
wvScrollUp -win $_nWave1 1578
wvScrollUp -win $_nWave1 1283
wvScrollUp -win $_nWave1 2269
wvScrollUp -win $_nWave1 1973
wvScrollUp -win $_nWave1 1480
wvScrollUp -win $_nWave1 1283
wvScrollUp -win $_nWave1 1381
wvScrollUp -win $_nWave1 1283
wvScrollUp -win $_nWave1 1480
wvScrollUp -win $_nWave1 2467
wvScrollUp -win $_nWave1 1085
wvScrollUp -win $_nWave1 1677
wvScrollUp -win $_nWave1 789
wvScrollUp -win $_nWave1 592
wvScrollUp -win $_nWave1 1283
wvScrollUp -win $_nWave1 1184
wvScrollUp -win $_nWave1 987
wvScrollUp -win $_nWave1 888
wvScrollUp -win $_nWave1 1480
wvScrollUp -win $_nWave1 1776
wvScrollUp -win $_nWave1 1480
wvScrollUp -win $_nWave1 2367
wvScrollUp -win $_nWave1 1776
wvScrollUp -win $_nWave1 2072
wvScrollUp -win $_nWave1 691
wvScrollUp -win $_nWave1 296
wvScrollUp -win $_nWave1 592
wvScrollUp -win $_nWave1 296
wvScrollUp -win $_nWave1 888
wvScrollUp -win $_nWave1 987
wvScrollUp -win $_nWave1 592
wvScrollUp -win $_nWave1 1085
wvScrollUp -win $_nWave1 1677
wvScrollUp -win $_nWave1 1480
wvScrollUp -win $_nWave1 691
wvScrollUp -win $_nWave1 98
wvScrollUp -win $_nWave1 987
wvScrollUp -win $_nWave1 99
wvScrollUp -win $_nWave1 197
wvScrollUp -win $_nWave1 197
wvScrollUp -win $_nWave1 99
wvScrollUp -win $_nWave1 888
wvScrollUp -win $_nWave1 296
wvScrollUp -win $_nWave1 395
wvScrollUp -win $_nWave1 394
wvScrollUp -win $_nWave1 198
wvScrollUp -win $_nWave1 296
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 6 )} 
wvSetPosition -win $_nWave1 {("G2" 6)}
wvCollapseBus -win $_nWave1 {("G2" 6)}
wvSetPosition -win $_nWave1 {("G2" 6)}
wvSelectSignal -win $_nWave1 {( "G2" 6 )} 
wvSelectSignal -win $_nWave1 {( "G2" 5 )} 
wvSelectSignal -win $_nWave1 {( "G2" 6 )} 
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvSelectSignal -win $_nWave1 {( "G2" 4 )} 
wvSelectSignal -win $_nWave1 {( "G2" 6 )} 
wvSelectSignal -win $_nWave1 {( "G2" 6 )} 
