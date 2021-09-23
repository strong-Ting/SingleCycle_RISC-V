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

wire [11:0] S_type_imm = {instr_mem_data_r[31:25],instr_mem_data_r[11:7]};
wire [11:0] I_type_imm = instr_mem_data_r[31:20];
wire [19:0] U_type_imm = instr_mem_data_r[31:12];

//declare

//control
wire [3:0] aluSel;
wire aluSrc1Sel;
wire [1:0] aluSrc2Sel;
wire [1:0] wbSel;
wire [2:0] pcSel;
wire rd_write;
//pc
wire [31:0] pc;
wire [31:0] next_pc;
wire [31:0] pc_add_4 = instr_mem_addr + 32'd4;
//regfile
wire [31:0] rs1_data,
            rs2_data;
reg [31:0] rd_data;
//alu
wire [31:0] alu_out;
wire [31:0] alu_rs1;
reg [31:0] alu_rs2;

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
assign next_pc = pc_add_4;
PC PC_inst(
    .clk (clk),
    .rst (rst),
    .next_pc(next_pc),
    .pc(pc)
);



//regfile
always@(*) begin
    case(wbSel)
    2'd0: rd_data = alu_out;
    2'd1: rd_data = data_mem_data_r;
    2'd2: rd_data = pc_add_4; 
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
assign alu_rs1 = (aluSrc1Sel == 1'd0) ? rs1_data : {12'd0,U_type_imm};
always@(*) begin
    case (aluSrc2Sel)
        2'd0: alu_rs2 = rs2_data;
        2'd1: alu_rs2 = {20'd0,S_type_imm};
        2'd2: alu_rs2 = {20'd0,I_type_imm};
        2'd3: alu_rs2 = pc;
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