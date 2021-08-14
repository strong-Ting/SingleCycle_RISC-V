// Please include verilog file if you write module in other file
module CPU(
    input             clk,
    input             rst,
    input      [31:0] data_out,
    input      [31:0] instr_out,
    output            instr_read,
    output            data_read,
    output     [31:0] instr_addr,
    output     [31:0] data_addr,
    output reg [3:0]  data_write,
    output reg [31:0] data_in
);

/* Add your design */

// PC related
reg [31:0] pc_in;
wire [31:0] pc_out;
assign instr_read = 1'b1; // always read the instruction
assign instr_addr = pc_out;
PC PC(
	.clk(clk),
	.rst(rst),
	.pc_in(pc_in),
	.pc_out(pc_out)
);

// Decoder related
wire [2:0] ImmType;
wire RegWrite/*, isBranch*/, PCtoRegSrc, ALUSrc, RDSrc/*, MemRead*/, MemWrite, MemtoReg;
wire [1:0] isBranch;
wire [2:0] ALUOP;
Decoder Decoder(
	.opcode(instr_out[6:0]),
	.Funct3(instr_out[14:12]),
	.ImmType(ImmType),
	.RegWrite(RegWrite),
	.isBranch(isBranch),
	.PCtoRegSrc(PCtoRegSrc),
	.ALUSrc(ALUSrc),
	.RDSrc(RDSrc),
	.MemRead(data_read), // (MemRead),
	.MemWrite(MemWrite), // (MemWrite), 
	.MemtoReg(MemtoReg),
	.ALUOP(ALUOP)
);

// ImmGen related
wire [31:0] Imm;
ImmGen ImmGen(
	.instr_out(instr_out),
	.ImmType(ImmType),
	.Imm(Imm)
);

//ALUCtrl related
wire [3:0] ALUCtrl;
ALUCtrl ALUControl(
	.ALUOP(ALUOP),
	.Funct7(instr_out[31:25]),
	.Funct3(instr_out[14:12]),
	.ALUCtrl(ALUCtrl)
);

// Register related
wire [31:0] rs1_data;
wire [31:0] rs2_data;
wire [31:0] rd_data;
Register Register(
	.clk(clk),
	.rst(rst),
	.rs1_addr(instr_out[19:15]),
	.rs2_addr(instr_out[24:20]),
	.rd_addr(instr_out[11:7]),
	.rd_data(rd_data), //need to fix, wire WB
	.RegWrite(RegWrite),
	.rs1_data(rs1_data),
	.rs2_data(rs2_data)
);

// mux and wire before ALU
wire [31:0] pc4;
assign pc4 = pc_out + 31'b100;

wire [31:0] pcimm;
assign pcimm = pc_out + Imm;

wire [31:0] pc_to_reg;
assign pc_to_reg = PCtoRegSrc? pcimm:pc4;

wire [31:0] rs2_data_alu; // final rs2_data
assign rs2_data_alu = ALUSrc? rs2_data:Imm;

// ALU related
wire ZeroFlag;
wire [31:0] alu_out;
ALU ALU(
	.rs1_data(rs1_data),
	.rs2_data(rs2_data_alu),
	.ALUCtrl(ALUCtrl),
	.ZeroFlag(ZeroFlag),
	.alu_out(alu_out)
);

// mux and wire after ALU
wire [31:0] pc_or_alu_out;
assign pc_or_alu_out = RDSrc? pc_to_reg:alu_out;

//DM related
assign data_addr = alu_out;
//assign data_in = rs2_data;

//Awesome
/*From JiaWei start*/
always@(*) begin
    data_write = 4'b0;
    if(MemWrite)begin
        case(instr_out[14:12]) // Funct3   
        	// byte
            3'b000:data_write[data_addr[1:0]]=1'b1;
            // half
            3'b001:data_write[{data_addr[1],1'b0}+:2] = 2'b11;
            //word
            default:data_write = 4'b1111; 
        endcase 
    end
end

always@(*) begin
    data_in = 32'b0;
    case(instr_out[14:12]) // Funct3
    		// byte
            3'b000:data_in[{data_addr[1:0],3'b0}+:8] = rs2_data[7:0];
            // half
            3'b001:data_in[{data_addr[1],4'b0}+:16]= rs2_data[15:0];
            // word
            default:data_in = rs2_data; 
    endcase
end
/*From JiaWei end*/

reg [31:0] mem_out;

always@(*) begin
	case(instr_out[14:12]) // Funct3
		// bs
		3'b000: mem_out = {{24{data_out[7]}}, data_out[7:0]};
		// hs
		3'b001: mem_out = {{16{data_out[15]}}, data_out[15:0]};
		// bu
		3'b100: mem_out = {24'b0, data_out[7:0]};
		// hu
		3'b101: mem_out = {16'b0, data_out[15:0]};
		// word
		default: mem_out = data_out;
	endcase
end

// write back rigester
assign rd_data = MemtoReg? mem_out:pc_or_alu_out;

//BranchCtrl
// 00 PC+4
// 01 PCIMM
// 10 alu_out
wire [1:0] BranchCtrl;
BranchCtrl BranchControl(
	.isBranch(isBranch),
	.ZeroFlag(ZeroFlag),
	.alu_out(alu_out),
	.Funct3(instr_out[14:12]),
	.BranchCtrl(BranchCtrl)
);

//pc_in
always@(*) begin
	case(BranchCtrl)
		2'b00: pc_in = pc4;
		2'b01: pc_in = pcimm;
		2'b10: pc_in = alu_out;
		default: pc_in = pc4;
	endcase
end
endmodule
/*---------------------------------------------------------------------------------------------------------*/
/*------PC begin------*/
module PC(clk, rst, pc_in, pc_out);
input clk, rst;
input [31:0] pc_in;
output reg [31:0] pc_out;

reg [1:0] enWrite;

always @(posedge clk or posedge rst) begin
	if (rst) begin
		pc_out <= 32'b0;
	end
	else begin
		if(enWrite == 2'b10)
			pc_out <= pc_in;
	end
end

always @(posedge clk or posedge rst) begin
	if (rst) begin
		enWrite <= 2'b0;
	end
	else begin
		case(enWrite)
			2'b10: enWrite <= 2'b0;
			default: enWrite <= enWrite + 2'b1;
		endcase
	end
end
endmodule
/*------PC end------*/

/*------Decoder begin------*/
module Decoder(opcode, Funct3, ImmType, RegWrite, isBranch, PCtoRegSrc, ALUSrc, RDSrc, MemRead, MemWrite, MemtoReg, ALUOP);
input [6:0] opcode;
input [2:0] Funct3;
output reg [2:0] ImmType;
// 000 R-type
// 001 I-type
// 010 S-type
// 011 B-type
// 100 U-type
// 101 J-type

output reg RegWrite/*, isBranch*/, PCtoRegSrc, ALUSrc, RDSrc, MemRead, MemWrite, MemtoReg;
output reg [1:0] isBranch;
// 00 NONE
// 01 JALR
// 10 B-type
// 11 JAL
output reg [2:0] ALUOP;
// 000 R-type
// 001 I-type
// 010 add
// 011 sub
// 100 U-type

always@(*) begin
	case(opcode)
		7'b0110011: begin // R-type
			ImmType		= 3'b000;
			RegWrite 	= 1'b1;
			isBranch 	= 2'b00;
			PCtoRegSrc 	= 1'b0; // need to check
			ALUSrc		= 1'b1;
			RDSrc 		= 1'b0; // need to check
			MemRead 	= 1'b0;
			MemWrite 	= 1'b0;
			MemtoReg 	= 1'b0;
			ALUOP		= 3'b000;
		end
		7'b0000011: begin // I-type
			ImmType		= 3'b001;
			RegWrite 	= 1'b1;
			isBranch 	= 2'b00;
			PCtoRegSrc 	= 1'b0; // need to check
			ALUSrc		= 1'b0;
			RDSrc 		= 1'b0; // need to check
			MemRead 	= 1'b1;
			MemWrite 	= 1'b0;
			MemtoReg 	= 1'b1;
			ALUOP		= 3'b010;
		end
		7'b0010011: begin // I-type
			ImmType		= 3'b001;
			RegWrite 	= 1'b1;
			isBranch 	= 2'b00;
			PCtoRegSrc 	= 1'b0; // need to check
			ALUSrc		= 1'b0;
			RDSrc 		= 1'b0;
			MemRead 	= 1'b0;
			MemWrite 	= 1'b0;
			MemtoReg 	= 1'b0;
			ALUOP		= 3'b001;
		end
		7'b1100111: begin // I-type
			ImmType		= 3'b001;
			RegWrite 	= 1'b1;
			isBranch 	= 2'b01; // need to fix
			PCtoRegSrc 	= 1'b0; // rd = PC + 4
			ALUSrc		= 1'b0;
			RDSrc 		= 1'b1; // rd = PC + 4
			MemRead 	= 1'b0;
			MemWrite 	= 1'b0;
			MemtoReg 	= 1'b0;
			ALUOP		= 3'b010;
		end
		7'b0100011: begin // S-type
			ImmType		= 3'b010;
			RegWrite 	= 1'b0;
			isBranch 	= 2'b00;
			PCtoRegSrc 	= 1'b0;
			ALUSrc		= 1'b0;
			RDSrc 		= 1'b0;
			MemRead 	= 1'b0;
			MemWrite 	= 1'b1;
			MemtoReg 	= 1'b0;
			ALUOP		= 3'b010;
			// case(Funct3)
			// 	3'b000: MemWrite = 4'b0001; // BYTE
			// 	3'b001: MemWrite = 4'b0011; // HALF
			// 	default: MemWrite = 4'b1111; // WORD
			// endcase
		end
		7'b1100011: begin // B-type
			ImmType		= 3'b011;
			RegWrite 	= 1'b0;
			isBranch 	= 2'b10; // need to fix
			PCtoRegSrc 	= 1'b1;
			ALUSrc		= 1'b1;
			RDSrc 		= 1'b0;
			MemRead 	= 1'b0;
			MemWrite 	= 1'b0;
			MemtoReg 	= 1'b0;
			ALUOP		= 3'b011;
		end
		7'b0010111: begin // U-type
			ImmType		= 3'b100;
			RegWrite 	= 1'b1;
			isBranch 	= 2'b00;
			PCtoRegSrc 	= 1'b1;
			ALUSrc		= 1'b0;
			RDSrc 		= 1'b1;
			MemRead 	= 1'b0;
			MemWrite 	= 1'b0;
			MemtoReg 	= 1'b0;
			ALUOP		= 3'b010;
		end
		7'b0110111: begin // U-type
			ImmType		= 3'b100;
			RegWrite 	= 1'b1;
			isBranch 	= 2'b00;
			PCtoRegSrc 	= 1'b1;
			ALUSrc		= 1'b0;
			RDSrc 		= 1'b0;
			MemRead 	= 1'b0;
			MemWrite 	= 1'b0;
			MemtoReg 	= 1'b0;
			ALUOP		= 3'b100; // need to fix, rd = imm
		end
		7'b1101111: begin // J-type
			ImmType		= 3'b101;
			RegWrite 	= 1'b1;
			isBranch 	= 2'b11; // need to fix
			PCtoRegSrc 	= 1'b0; // rd = PC + 4
			ALUSrc		= 1'b0;
			RDSrc 		= 1'b1;
			MemRead 	= 1'b0;
			MemWrite 	= 1'b0;
			MemtoReg 	= 1'b0;
			ALUOP		= 3'b010;
		end
	endcase
end
endmodule
/*------Decoder end------*/

/*------ImmGen start------*/
// 000 R-type
// 001 I-type
// 010 S-type
// 011 B-type
// 100 U-type
// 101 J-type

module ImmGen(instr_out, ImmType, Imm);
input  [31:0] 	instr_out;
input  [2:0]	ImmType;
output reg [31:0]	Imm;

always @(*) begin
	case(ImmType)
		3'b001: begin // I-type
			if((instr_out[6:0] == 7'b0010011) && instr_out[14:12] == 3'b101 && instr_out[31:25] == 7'b0100000)
				Imm = {27'b0, instr_out[24:20]};
			else
				Imm = {{20{instr_out[31]}}, instr_out[31:20]};
		end
		3'b010: begin // S-type
			Imm = {{20{instr_out[31]}}, instr_out[31:25], instr_out[11:7]};
		end
		3'b011: begin // B-type
			Imm = {{19{instr_out[31]}}, instr_out[31], instr_out[7], instr_out[30:25], instr_out[11:8], 1'b0};
		end
		3'b100: begin // U-type
			Imm = {instr_out[31:12], 12'b0};
		end
		3'b101: begin
			Imm = {{11{instr_out[31]}}, instr_out[31], instr_out[19:12], instr_out[20], instr_out[30:21], 1'b0};
		end
		default: begin
			Imm = 32'b0;
		end
	endcase
end
endmodule
/*------ImmGen end------*/

/*------ALUCtrl start------*/
// 000 R-type
// 001 I-type
// 010 add
// 011 sub
// 100 U-type
module ALUCtrl(ALUOP, Funct7, Funct3, ALUCtrl);
input [2:0] ALUOP;
input [6:0] Funct7;
input [2:0] Funct3;
output reg [3:0] ALUCtrl;

parameter [3:0] ADD 	= 4'b0000,
				SUB 	= 4'b0001,
				SLL 	= 4'b0010,
				SLT 	= 4'b0011,
				SLTU 	= 4'b0100,
				XOR 	= 4'b0101,
				SRL 	= 4'b0110,
				SRA 	= 4'b0111,
				OR 		= 4'b1000,
				AND 	= 4'b1001,
				MUL 	= 4'b1010,
				MULH 	= 4'b1011,
				MULHU 	= 4'b1100,
				IMM 	= 4'b1101; // for "rd = imm"

always @(*) begin
	// MemWidth = WORD;
	case(ALUOP)
		3'b000: begin // R-type
			case(Funct3)
				3'b000: begin // ALUCtrl = (Funct7 == 7'b0000000)? ADD:SUB;
					case(Funct7)
						7'b0100000: ALUCtrl = SUB;
						7'b0000001: ALUCtrl = MUL;
						default: 	ALUCtrl = ADD;
					endcase
				end
				3'b001: ALUCtrl = (Funct7 == 7'b0000000)? SLL:MULH;
				3'b010: ALUCtrl = SLT;
				3'b011: ALUCtrl = (Funct7 == 7'b0000000)? SLTU:MULHU;
				3'b100: ALUCtrl = XOR;
				3'b101: ALUCtrl = (Funct7 == 7'b0000000)? SRL:SRA;
				3'b110: ALUCtrl = OR;
				3'b111: ALUCtrl = AND;
			endcase
		end
		3'b001: begin // I-type except LW
			case(Funct3)
				3'b000: ALUCtrl = ADD;
				3'b010: ALUCtrl = SLT;
				3'b011: ALUCtrl = SLTU;
				3'b100: ALUCtrl = XOR;
				3'b110: ALUCtrl = OR;
				3'b111: ALUCtrl = AND;
				3'b001: ALUCtrl = SLL;
				3'b101: ALUCtrl = (Funct7 == 7'b0000000)? SRL:SRA;
			endcase
		end
		3'b010: begin // LW
			ALUCtrl = ADD;
		end
		3'b011: begin // B-type
			case(Funct3)
				3'b000: ALUCtrl = SUB; // rs1 == rs2
				3'b001:	ALUCtrl = SUB; // rs1 != rs2
				3'b100: ALUCtrl = SLT;
				3'b101: ALUCtrl = SLT;
				3'b110: ALUCtrl = SLTU;
				3'b111: ALUCtrl = SLTU;
				default: ALUCtrl = SUB;
			endcase
		end
		3'b100: begin // U-type
			ALUCtrl = IMM;
		end
		default: begin // unused
			ALUCtrl = ADD;
		end
	endcase
end
endmodule
/*------ALUCtrl end------*/

/*------RegisterFile start------*/
module Register(clk, rst, rs1_addr, rs2_addr, rd_addr, rd_data, RegWrite, rs1_data, rs2_data);
input clk, rst;
input [4:0] rs1_addr, rs2_addr, rd_addr;
input [31:0] rd_data;
input RegWrite;
output [31:0] rs1_data, rs2_data;

reg [31:0] register [31:0];
reg [2:0] enWrite; // for each instr 2 cycles

assign rs1_data = register[rs1_addr];
assign rs2_data = register[rs2_addr];

integer i;
always@(posedge clk or posedge rst) begin
	if(rst) begin
		for(i = 0; i < 32; i = i + 1)
			register[i] <= 32'b0;
	end
	else begin
		if(RegWrite && (enWrite == 2'b10))
			register[rd_addr] <= (rd_addr == 0)? 32'b0:rd_data; // need to fix 0 register
	end
end

always @(posedge clk or posedge rst) begin
	if (rst) begin
		enWrite <= 2'b0;
	end
	else begin
		case(enWrite)
			2'b10: enWrite <= 2'b0;
			default: enWrite <= enWrite + 2'b1;
		endcase
	end
end
endmodule
/*------RegisterFile end------*/

/*------ALU start------*/
module ALU(rs1_data, rs2_data, ALUCtrl, ZeroFlag, alu_out);
input [31:0] rs1_data, rs2_data;
input [3:0] ALUCtrl;
output ZeroFlag;
output reg [31:0] alu_out;

wire signed [31:0] signed_rs1_data, signed_rs2_data;
assign signed_rs1_data = rs1_data;
assign signed_rs2_data = rs2_data;

wire [63:0] mul_result, signed_mul_result;
assign mul_result = rs1_data * rs2_data;
assign signed_mul_result = signed_rs1_data * signed_rs2_data;

assign ZeroFlag = ~|alu_out; 

parameter [3:0] ADD 	= 4'b0000,
				SUB 	= 4'b0001,
				SLL 	= 4'b0010,
				SLT 	= 4'b0011,
				SLTU 	= 4'b0100,
				XOR 	= 4'b0101,
				SRL 	= 4'b0110,
				SRA 	= 4'b0111,
				OR 		= 4'b1000,
				AND 	= 4'b1001,
				MUL 	= 4'b1010,
				MULH 	= 4'b1011,
				MULHU 	= 4'b1100,
				IMM 	= 4'b1101; // for "rd = imm"

always@(*) begin
	case(ALUCtrl)
		ADD: 	alu_out = rs1_data + rs2_data;
		SUB: 	alu_out = rs1_data - rs2_data;
		SLL: 	alu_out = rs1_data << rs2_data[4:0];
		SLT: 	alu_out = (signed_rs1_data < signed_rs2_data)? 32'b1:32'b0;
		SLTU: 	alu_out = (rs1_data < rs2_data)? 32'b1:32'b0;
		XOR: 	alu_out = rs1_data ^ rs2_data;
		SRL: 	alu_out = rs1_data >> rs2_data[4:0];
		SRA: 	alu_out = signed_rs1_data >>> rs2_data[4:0];
		OR: 	alu_out = rs1_data | rs2_data;
		AND: 	alu_out = rs1_data & rs2_data;
		MUL: 	alu_out = signed_mul_result[31:0];
		MULH: 	alu_out = signed_mul_result[63:32];
		MULHU: 	alu_out = mul_result[63:32];
		IMM: 	alu_out = rs2_data;
	endcase
end
endmodule
/*------ALU end------*/

/*------BranchCtrl start------*/
module BranchCtrl(isBranch, ZeroFlag, alu_out, Funct3, BranchCtrl);
input [1:0] isBranch;
// 00 NONE
// 01 JALR
// 10 B-type
// 11 JAL
input ZeroFlag;
input [31:0] alu_out;
input [2:0] Funct3;

output reg [1:0] BranchCtrl;
// 00 PC+4
// 01 PCIMM
// 10 alu_out
parameter [1:0] PC4    = 2'b00,
				PCIMM  = 2'b01,
				ALUOUT = 2'b10;

always@(*) begin
	case(isBranch)
		2'b01: BranchCtrl = ALUOUT;
		2'b10: begin
			case(Funct3)
				3'b000: BranchCtrl = ZeroFlag? PCIMM:PC4;
				3'b001: BranchCtrl = (~ZeroFlag)? PCIMM:PC4;
				3'b100: BranchCtrl = (|alu_out)? PCIMM:PC4;
				3'b101: BranchCtrl = (~|alu_out)? PCIMM:PC4;
				3'b110: BranchCtrl = (|alu_out)? PCIMM:PC4;
				3'b111: BranchCtrl = (~|alu_out)? PCIMM:PC4;
			endcase
		end
		2'b11: BranchCtrl = PCIMM;
		default: BranchCtrl = PC4;
	endcase
end
endmodule
/*------BranchCtrl end------*/



