module ram #(parameter words = 65536)
(
    input clk,
    input [31:0] addr,
    input read,
    input [3:0] write,
    input [31:0] DATA_IN,
    output reg [31:0] DATA_OUT
);
reg [31:0] mem [0:words-1];
wire [31:0] addrWords = {2'd0,addr[31:2]};

always @(posedge clk) begin
    if(read) DATA_OUT <= mem[addrWords];
end

always @(posedge clk) begin
    if(write[0]) mem[addrWords][7:0] <= DATA_IN[7:0];
    if(write[1]) mem[addrWords][15:8] <= DATA_IN[15:8];
    if(write[2]) mem[addrWords][23:16] <= DATA_IN[23:16];
    if(write[3]) mem[addrWords][31:24] <= DATA_IN[31:24];
end

endmodule