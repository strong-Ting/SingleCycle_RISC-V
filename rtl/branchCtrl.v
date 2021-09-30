module branchCtrl(
    input [6:0] opcode,
    input [2:0] funct3,
    input [31:0] rs1_data,
    input [31:0] rs2_data,
    output reg branch
);

always@(*) begin //branch
    if(opcode == 7'b1100011) begin
        case(funct3)
            3'b000: branch = (rs1_data == rs2_data);
            3'b001: branch = (rs1_data != rs2_data);
            3'b100: branch = ($signed(rs1_data) < $signed(rs2_data));
            3'b101: branch = ($signed(rs1_data) >= $signed(rs2_data));
            3'b110: branch = (rs1_data < rs2_data);
            3'b111: branch = (rs1_data >= rs2_data);
            default: branch = 1'd0;
        endcase
    end
    else branch = 1'd0;
end

endmodule