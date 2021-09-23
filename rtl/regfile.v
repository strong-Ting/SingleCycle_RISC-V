module regfile(
    input clk,
    input rst,
    input [4:0] rs1_addr,
    input [4:0] rs2_addr,
    input [4:0] rd_addr, //write addr
    input [31:0] rd_data,
    input rd_write,
    output wire [31:0] rs1_data,rs2_data
);

reg [31:0] regFile [31:1];

assign rs1_data = (rs1_addr == 5'd0) ? 32'd0 : regFile[rs1_addr];
assign rs2_data = (rs2_addr == 5'd0) ? 32'd0 : regFile[rs2_addr];

integer i;
always@(posedge clk or posedge rst) begin
    if(rst) begin
        for(i=1;i<=31;i=i+1) begin
            regFile[i] <= 32'd0;
        end
    end
    else begin
        if(rd_write && rd_addr != 5'd0) begin
            regFile[rd_addr] <= rd_data;
        end
    end
end

endmodule