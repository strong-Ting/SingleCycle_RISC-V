module ram (
    input clk,
    input [15:0] addr,
    input read,
    input write,
    input [31:0] DATA_IN,
    output [31:0] DATA_OUT
);
reg [31:0] mem [0:65535];

initial begin
    $readmemh("./asm/elf.hex",mem);
end

always @(posedge clk) begin
    if(read) DATA_OUT <= mem[addr];
end

always @(posedge clk) begin
    if(write[0]) mem[7:0][addr] <= DATA_IN[7:0];
   // if(write[1]) mem[addr][15:8] <= DATA_IN[15:8];
   // if(write[2]) mem[addr][23:16] <= DATA_IN[23:16];
   // if(write[3]) mem[addr][31:24] <= DATA_IN[31:24];
end

endmodule