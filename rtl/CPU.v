module CPU(
    input clk,
    input rst,
    output wire [31:0] instr_mem_addr,
    output wire instr_mem_read,
    input [31:0] instr_mem_data_r,
    output [31:0]data_mem_addr,
    output wire data_mem_read,
    output wire [3:0] data_mem_write,
    input [31:0] data_mem_data_r,
    output [31:0] data_mem_data_w 
);


wire [31:0] I_type_imm = {20'd0,instr_mem_data_r[31:20]};
wire [31:0] S_type_imm = {20'd0,instr_mem_data_r[31:25],instr_mem_data_r[11:7]};

wire [31:0] S_type_imm_signed_extend = {{20{instr_mem_data_r[31]}},instr_mem_data_r[31:25],instr_mem_data_r[11:7]};
wire [31:0] I_type_imm_signed_extend = {{20{instr_mem_data_r[31]}},instr_mem_data_r[31:20]};
wire [19:0] U_type_imm = {instr_mem_data_r[31:12]};
wire [31:0] B_type_imm = {{19{instr_mem_data_r[31]}},instr_mem_data_r[31],instr_mem_data_r[7],instr_mem_data_r[30:25],instr_mem_data_r[11:8],1'b0};
wire [31:0] J_type_imm = {{11{instr_mem_data_r[31]}}, instr_mem_data_r[31], instr_mem_data_r[19:12], instr_mem_data_r[20], instr_mem_data_r[30:21], 1'b0};
//declare

//control
wire [3:0] aluSel;
wire aluSrc1Sel;
wire [2:0] aluSrc2Sel;
wire [2:0] wbSel;
wire [2:0] pcSel;
wire rd_write;
//pc
wire [31:0] pc;
reg [31:0] next_pc;
wire [31:0] pc_add_4 = instr_mem_addr + 32'd4;
//regfile
wire [31:0] rs1_data,
            rs2_data;
reg [31:0] rd_data;
//alu
wire [31:0] alu_out;
wire [31:0] alu_rs1;
reg [31:0] alu_rs2;
//branch
wire branch;


//control
control control_inst(
    .opcode(instr_mem_data_r[6:0]),
    .funct3(instr_mem_data_r[14:12]),
    .funct7(instr_mem_data_r[31:25]),
    .instr_mem_read(instr_mem_read),
    .data_mem_read(data_mem_read),
    .data_mem_write(data_mem_write),
    .rd_write (rd_write),
    .aluSel(aluSel),
    .aluSrc1Sel(aluSrc1Sel),
    .aluSrc2Sel(aluSrc2Sel),
    .wbSel(wbSel),
    .pcSel(pcSel)
);

//PC
assign instr_mem_addr = pc;
//PC mux
always@(*) begin
    case(pcSel)
        3'd0: next_pc = pc_add_4;
        3'd1: next_pc = alu_out;
        3'd2: begin
            if(branch) next_pc = alu_out;
            else next_pc = pc_add_4;
        end
        default: next_pc = pc_add_4;
    endcase
end

PC PC_inst(
    .clk (clk),
    .rst (rst),
    .next_pc(next_pc),
    .pc(pc)
);

branchCtrl branch_inst(
    .opcode(instr_mem_data_r[6:0]),
    .funct3(instr_mem_data_r[14:12]),
    .rs1_data(rs1_data),
    .rs2_data(rs2_data),
    .branch(branch)
);



//regfile
always@(*) begin
    case(wbSel)
        3'd0: rd_data = alu_out;
        3'd1: rd_data = data_mem_data_r;
        3'd2: rd_data = next_pc + 32'd4; 
        3'd3: rd_data = {{24{data_mem_data_r[7]}},data_mem_data_r[7:0]};
        3'd4: rd_data = {{16{data_mem_data_r[15]}},data_mem_data_r[15:0]};
        3'd5: rd_data = {24'd0,data_mem_data_r[7:0]};
        3'd6: rd_data = {16'd0,data_mem_data_r[15:0]};
        default: rd_data = 32'd0;
    endcase
end

regfile regfile_inst(
    .clk (clk),
    .rst (rst),
    .rs1_addr (instr_mem_data_r[19:15]),
    .rs2_addr (instr_mem_data_r[24:20]),
    .rd_addr (instr_mem_data_r[11:7]),
    .rd_data (rd_data),
    .rd_write (rd_write),
    .rs1_data (rs1_data),
    .rs2_data (rs2_data)
);

//alu
assign alu_rs1 = (aluSrc1Sel == 1'd0) ? rs1_data : pc;
always@(*) begin
    case (aluSrc2Sel)
        3'd0: alu_rs2 = rs2_data;
        3'd1: alu_rs2 = S_type_imm_signed_extend;
        3'd2: alu_rs2 = I_type_imm_signed_extend;
        3'd3: alu_rs2 = {U_type_imm,12'd0};
        3'd4: alu_rs2 = I_type_imm;
        3'd5: alu_rs2 = B_type_imm;
        3'd6: alu_rs2 = J_type_imm;
        default: alu_rs2 = 32'd0;
    endcase
end

alu alu_inst(
    .rs1_data(alu_rs1),
    .rs2_data(alu_rs2),
    .aluSel(aluSel),
    .alu_out(alu_out)
);

//data mem
assign data_mem_addr = alu_out;
assign data_mem_data_w = rs2_data;


endmodule