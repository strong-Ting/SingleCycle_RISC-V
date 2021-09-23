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

parameter [3:0] AND = 4'b0000,
                OR  = 4'b0001,
                ADD = 4'b0010,
                SUB = 4'b0110,
                SLT = 4'b0111,
                NOR = 4'b1100;

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
                        default: aluSel = ADD;
                    endcase
                end
                //3'b001: begin
                //end
                default: aluSel = 4'd0;
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
            aluSel = ADD;
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
        7'b1101111: begin //I-type
        end
        default: begin
            data_mem_read = 1'd0;
            data_mem_write = 4'd0;
            aluSel = 4'd0;
            aluSrc1Sel = 1'd0;
            aluSrc2Sel = 2'd0;
            wbSel = 2'd0;
            pcSel = 3'd0;
            rd_write = 1'd0;
        end
    endcase
end

endmodule