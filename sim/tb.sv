`define CYCLE 10
`define END 1000
`define instr "add"
`define HexPath {"./asm/",`instr,"/",`instr,".hex"} 
module test #(parameter Path = "./asm/add/add.hex");

reg clk,rst;

top #(.memWords(100)) dut(
    .clk(clk),
    .rst(rst)
);
initial begin
    $readmemh(`HexPath,dut.IM.mem);
    $readmemh(`HexPath,dut.DM.mem);
end

always #(`CYCLE/2) clk = ~clk;

initial begin
    $fsdbDumpfile("./test.fsdb");
    $fsdbDumpvars;
    $fsdbDumpMDA;
    #(`END) $finish;
end


initial begin
    clk = 1'd1;
    rst = 1'd0;
    #(`CYCLE) rst = 1'd1;
    #(`CYCLE) rst = 1'd0;
    #(`CYCLE);
end



endmodule