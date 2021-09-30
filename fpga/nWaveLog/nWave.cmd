wvSetPosition -win $_nWave1 {("G1" 0)}
wvOpenFile -win $_nWave1 \
           {/home/DICS/M10912039/RISC-V/SingleCycle_RISC-V/fpga/novas.fsdb}
wvGetSignalOpen -win $_nWave1
wvGetSignalSetScope -win $_nWave1 "/altera_generic_pll_functions"
wvGetSignalSetScope -win $_nWave1 "/test"
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 1)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test/clk} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 1 )} 
wvSetPosition -win $_nWave1 {("G1" 1)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvSetPosition -win $_nWave1 {("G1" 4)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test/clk} \
{/test/address_a\[15:0\]} \
{/test/data_a\[31:0\]} \
{/test/q_a\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 2 3 4 )} 
wvSetPosition -win $_nWave1 {("G1" 4)}
wvGetSignalSetScope -win $_nWave1 "/test/rom_inst"
wvSetPosition -win $_nWave1 {("G1" 7)}
wvSetPosition -win $_nWave1 {("G1" 7)}
wvAddSignal -win $_nWave1 -clear
wvAddSignal -win $_nWave1 -group {"G1" \
{/test/clk} \
{/test/address_a\[15:0\]} \
{/test/data_a\[31:0\]} \
{/test/q_a\[31:0\]} \
{/test/rom_inst/address\[15:0\]} \
{/test/rom_inst/clock} \
{/test/rom_inst/q\[31:0\]} \
}
wvAddSignal -win $_nWave1 -group {"G2" \
}
wvSelectSignal -win $_nWave1 {( "G1" 5 6 7 )} 
wvSetPosition -win $_nWave1 {("G1" 7)}
wvGetSignalSetScope -win $_nWave1 "/test/rom_inst/altsyncram_component"
wvGetSignalSetScope -win $_nWave1 "/test/rom_inst/altsyncram_component/m_default"
wvGetSignalSetScope -win $_nWave1 \
           "/test/rom_inst/altsyncram_component/m_default/altsyncram_inst"
wvGetSignalSetScope -win $_nWave1 \
           "/test/rom_inst/altsyncram_component/m_default/altsyncram_inst/dev"
wvGetSignalSetScope -win $_nWave1 \
           "/test/rom_inst/altsyncram_component/m_default/altsyncram_inst/mem"
wvGetSignalSetScope -win $_nWave1 \
           "/test/rom_inst/altsyncram_component/m_default/altsyncram_inst/dev"
wvGetSignalSetScope -win $_nWave1 \
           "/test/rom_inst/altsyncram_component/m_default/altsyncram_inst"
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvResizeWindow -win $_nWave1 0 30 1920 1017
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvResizeWindow -win $_nWave1 2460 285 960 332
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvResizeWindow -win $_nWave1 0 30 1920 1017
wvSetCursor -win $_nWave1 8.178138 -snap {("G1" 4)}
wvSetCursor -win $_nWave1 100.240601 -snap {("G1" 2)}
wvSetCursor -win $_nWave1 200.247542 -snap {("G1" 1)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvZoomOut -win $_nWave1
wvResizeWindow -win $_nWave1 0 30 1920 1017
wvSelectSignal -win $_nWave1 {( "G1" 5 )} 
wvSetPosition -win $_nWave1 {("G1" 5)}
wvSetPosition -win $_nWave1 {("G1" 6)}
wvMoveSelected -win $_nWave1
wvSetPosition -win $_nWave1 {("G1" 6)}
wvSetCursor -win $_nWave1 102.147633 -snap {("G1" 5)}
wvSetCursor -win $_nWave1 200.789055 -snap {("G1" 7)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 50.956943 -snap {("G1" 7)}
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvSetCursor -win $_nWave1 126.457367 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 48.151973 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 150.065859 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 201.256549 -snap {("G1" 7)}
wvSetCursor -win $_nWave1 249.174775 -snap {("G1" 6)}
wvResizeWindow -win $_nWave1 916 413 960 332
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvResizeWindow -win $_nWave1 0 30 1920 1017
wvResizeWindow -win $_nWave1 390 199 960 332
wvDisplayGridCount -win $_nWave1 -off
wvGetSignalClose -win $_nWave1
wvReloadFile -win $_nWave1
wvResizeWindow -win $_nWave1 0 23 1920 1017
wvCloseFile -win $_nWave1
wvDisplayGridCount -win $_nWave1 -off
wvTpfCloseForm -win $_nWave1
wvGetSignalClose -win $_nWave1
