module alu(
    input [31:0] rs1_data,
    input [31:0] rs2_data,
    input [3:0] aluSel,
    output reg [31:0] alu_out
);

parameter [3:0] AND = 4'b0000,
                OR  = 4'b0001,
                ADD = 4'b0010,
                SUB = 4'b0110,
                SLT = 4'b0111,
                NOR = 4'b1100;


always@(*) begin
    case(aluSel)
    AND: alu_out = rs1_data & rs2_data;
    OR : alu_out = rs1_data | rs2_data;
    ADD: alu_out = rs1_data + rs2_data;
    SUB: alu_out = rs1_data - rs2_data;
    //SLT: alu_out = r
    default: alu_out = 32'd0;
    endcase
end

endmodule