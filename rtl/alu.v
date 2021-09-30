module alu(
    input [31:0] rs1_data,
    input [31:0] rs2_data,
    input [3:0] aluSel,
    output reg [31:0] alu_out
);
wire signed [31:0] rs1_singed = rs1_data;
wire signed [31:0] rs2_singed = rs2_data;

parameter [3:0] AND = 4'd0,
                OR  = 4'd1,
                ADD = 4'd2,
                SUB = 4'd3,
                SLT = 4'd4,
                XOR = 4'd5,
                SLL = 4'd6,
                SLTU= 4'd7,
                SRL = 4'd8,
                SRA = 4'd9,
                MUL = 4'd10,
                MULH= 4'd11,
                MULHU=4'd12,
                NONE = 4'd13,
                RS1 = 4'd14,
                RS2 = 4'd15;


always@(*) begin
    case(aluSel)
    AND: alu_out = rs1_data & rs2_data;
    OR : alu_out = rs1_data | rs2_data;
    ADD: alu_out = rs1_data + rs2_data;
    SUB: alu_out = rs1_data - rs2_data;
    SLT: alu_out = (rs1_singed < rs2_singed) ? 32'd1 : 32'd0;
    XOR: alu_out = rs1_data ^ rs2_data;
    SLL: alu_out = rs1_data << rs2_data[4:0];
    SLTU: alu_out = (rs1_data < rs2_data) ? 32'd1 : 32'd0;
    SRL: alu_out = rs1_data >> rs2_data[4:0];
    SRA: alu_out = rs1_singed >>> rs2_data[4:0]; //Arithmetic right shift
    NONE: alu_out = 32'd0;
    RS1: alu_out = rs1_data;
    RS2: alu_out = rs2_data;
    default: alu_out = 32'd0;
    endcase
end

endmodule