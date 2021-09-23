module control(
    input [6:0] opcode,
    input [2:0] funct3,
    input [6:0] funct7,
    output wire instr_mem_read,
    output reg data_mem_read,
    output reg [3:0] data_mem_write,
    output reg rd_write,

    output reg [3:0] aluSel,
    output reg aluSrc1Sel,
    output reg [1:0] aluSrc2Sel,
    output reg [1:0] wbSel,
    output reg [2:0] pcSel
);
assign instr_mem_read = 1'd1;

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
                RS1 = 4'd14;

always@(*) begin
    
    case(opcode)
        7'b0110011: begin //R type
            aluSrc1Sel = 1'd0;
            aluSrc2Sel = 2'd0;
            data_mem_read = 1'd0;
            data_mem_write = 4'd0;
            wbSel = 2'd0;
            pcSel = 3'd0;
            rd_write = 1'd1;
            case(funct3)
                3'b000: begin 
                    case(funct7) 
                        7'b0000000: aluSel = ADD;
                        7'b0100000: aluSel = SUB;
                        default: aluSel = NONE;
                    endcase
                end
                3'b001: begin
                    case(funct7) 
                        7'b0000000: aluSel = SLL;
                        default: aluSel = NONE;
                    endcase
                end
                3'b010: begin
                    case(funct7) 
                        7'b0000000: aluSel = SLT;
                        default: aluSel = NONE;
                    endcase
                end
                3'b011: begin
                    case(funct7) 
                        7'b0000000: aluSel = SLTU;
                        default: aluSel = NONE;
                    endcase
                end
                3'b100: begin
                    case(funct7) 
                        7'b0000000: aluSel = XOR;
                        default: aluSel = NONE;
                    endcase
                end
                3'b101: begin
                    case(funct7) 
                        7'b0000000: aluSel = SRL;
                        7'b0100000: aluSel = SRA;
                        default: aluSel = NONE;
                    endcase
                end
                3'b110: begin
                    case(funct7) 
                        7'b0000000: aluSel = OR;
                        default: aluSel = NONE;
                    endcase
                end
                3'b111: begin
                    case(funct7) 
                        7'b0000000: aluSel = AND;
                        default: aluSel = NONE;
                    endcase
                end
                default: aluSel = NONE;
            endcase
        end
        7'b0000011: begin //I-type
        end
        7'b0010011: begin //I-type
            aluSrc1Sel = 1'd0;
            aluSrc2Sel = 2'd2;
            data_mem_read = 1'd0;
            data_mem_write = 4'b0000;
            wbSel = 2'd0;
            pcSel = 3'd0;
            case(funct3)
                3'b000: aluSel = ADD;
                default: aluSel = ADD;
            endcase
            rd_write = 1'd1;
        end
        7'b1100111: begin //I-type
        end
        7'b0100011: begin //S-type
            aluSrc1Sel = 1'd0;
            aluSrc2Sel = 2'd1;
            data_mem_read = 1'd0;
            data_mem_write = 4'b1111;
            wbSel = 2'd1;
            pcSel = 3'd0;
            aluSel = ADD;
            rd_write = 1'd0;
        end
        7'b1100011: begin //B-type
        end
        7'b0010111: begin //U-type
        end
        7'b0110111: begin //U-type
            aluSrc1Sel = 1'd1;
            aluSrc2Sel = 2'd0;
            data_mem_read = 1'd0;
            data_mem_write = 4'd0;
            wbSel = 2'd0;
            pcSel = 3'd0;
            aluSel = RS1;
            rd_write = 1'd1;
        end
        7'b1101111: begin //I-type
        end
        default: begin
            data_mem_read = 1'd0;
            data_mem_write = 4'd0;
            aluSel = NONE;
            aluSrc1Sel = 1'd0;
            aluSrc2Sel = 2'd0;
            wbSel = 2'd0;
            pcSel = 3'd0;
            rd_write = 1'd0;
        end
    endcase
end

endmodule