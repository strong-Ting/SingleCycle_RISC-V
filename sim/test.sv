`define CYCLE 10
`define END 1000
`define instr "add"
`define HexPath {"./asm/",`instr,"/",`instr,".hex"} 
module test #(parameter Path = "./asm/add/add.hex");

reg clk;
reg [15:0] addr;
reg read;
reg [3:0] write;
reg [31:0] DATA_IN;
wire [31:0] DATA_OUT;

ram  r1(
    .clk(clk),
    .addr(addr),
    .read(read),
    .write(write),
    .DATA_IN(DATA_IN),
    .DATA_OUT(DATA_OUT)
);
initial begin
    string strr = `HexPath;
    $display("%s",`HexPath);
    $readmemh(`HexPath,r1.mem);
end

always #(`CYCLE/2) clk = ~clk;

initial begin
    $fsdbDumpfile("./test.fsdb");
    $fsdbDumpvars;
    $fsdbDumpMDA;
    #(`END) $finish;
end

integer i=0;

initial begin
    clk = 1'd1;
    read = 1'd0;
    write = 4'd0;
    DATA_IN = 32'd0;
    #(`CYCLE);
    for(i=0;i<17;i=i+1) begin
        readTask(i);
    end
    $finish;
end

task readTask;
input [15:0] addrRead;
begin
    read = 1'd1;
    addr = addrRead;
    #(`CYCLE);
    $display("addr:%d DATA_OUT:%h",addr,DATA_OUT);
end
endtask

endmodule