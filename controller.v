`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:41:23 12/11/2020 
// Design Name: 
// Module Name:    controller 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
 module controller(
    input wire [31:0] INSTR,
    output wire [1:0] NPC_SEL,
    output wire [1:0] A3_SEL,
    output wire [2:0] WD_SEL,
    output wire WE,
    output wire A_SEL,
    output wire [2:0] B_SEL,
    output wire [3:0] ALU_SEL,
    output wire EXT_SEL,
	output wire w,
	output wire W_SEL,
	output wire [1:0] MUL_SEL,
	output wire HL_SEL,
	output wire start,
    output wire SW1,
    output wire LW1,
	output wire BRANCH,
	output wire bne,
	output wire blez, 
	output wire bgtz, 
	output wire bltz, 
	output wire bgez, 
	output wire beq,
	output wire Tnew_0,
	output wire Tnew_1,
	output wire Tnew_2,
	output wire [1:0] Tuse_rs,
	output wire [1:0] Tuse_rt
    );
	// R TYPE
	`define R 6'b000000
	`define ADDU 6'b100001
	`define ADD 6'b100000
	`define SUB 6'b100010
	`define SUBU 6'b100011
	`define AND 6'b100100
	`define OR 6'b100101
	`define XOR 6'b100110
	`define NOR 6'b100111
	`define SLT 6'b101010
	`define SLTU 6'b101011
	`define SLL 6'b000000
	`define SRL 6'b000010
	`define SRA 6'b000011
	`define SLLV 6'b000100
	`define SRLV 6'b000110
	`define SRAV 6'b000111
	`define JR 6'b001000
	`define JALR 6'b001001
	//other types
	`define ADDI 6'b001000
	`define ADDIU 6'b001001
	`define ANDI 6'b001100
	`define XORI 6'b001110
	`define SLTI 6'b001010
	`define SLTIU 6'b001011
	`define BNE 6'b000101
	`define BLEZ 6'b000110
	`define BGTZ 6'b000111
	`define BLTZ_BGEZ 6'b000001
	`define LUI 6'b001111
	`define ORI 6'b001101
	`define BEQ 6'b000100
	`define LW 6'b100011
	`define SW 6'b101011
	`define J 6'b000010
	`define JAL 6'b000011
	`define LH 6'b100001
	`define LHU 6'b100101
	
	`define BGEZ 5'b00001
	`define BLTZ 5'b00000
	
	`define SB 6'b101000
	`define SH 6'b101001
	`define LB 6'b100000
	`define LBU 6'b100100
	//the mulu and div module
	
	`define MFHI 6'b010000
	`define MFLO 6'b010010
	`define MTHI 6'b010001
	`define MTLO 6'b010011
	`define MULT 6'b011000
	`define MULTU 6'b011001
	`define DIV 6'b011010
	`define DIVU 6'b011011
	
	wire [5:0] op;
	wire [5:0] func;
	wire [4:0] btype;
	wire addu, add, sub, subu, and_, or_, xor_, nor_, 
		 addi, addiu, andi, xori, slt, slti, sltiu, sltu, lui, sll, srl, sra, 
		 ori, lw, sllv, srlv, srav, jr, sw, j, jal, sb, sh, lb, lbu,
		 lh, lhu, jalr, mfhi, mflo, mthi, mtlo, mult, multu, div, divu;
		 
	assign op = INSTR[31:26];
	assign func = INSTR[5:0];
	assign btype = INSTR[20:16];
	
	assign addu = ((op == `R)&&(func == `ADDU));
	assign add = (op == `R)&&(func == `ADD);
	assign sub = (op == `R) && (func == `SUB);
	assign subu = (op == `R) && (func == `SUBU);
	assign and_ = (op == `R) && (func == `AND);
	assign or_ = (op == `R) && (func == `OR);
	assign xor_ = (op == `R) && (func == `XOR);
	assign nor_ = (op == `R) && (func == `NOR);
	assign addi = (op == `ADDI);
	assign addiu = (op == `ADDIU);
	assign andi = (op == `ANDI);
	assign xori = (op == `XORI);
	assign slt = (op == `R) &&( func == `SLT);
	assign slti = (op == `SLTI);
	assign sltiu = (op == `SLTIU);
	assign sltu = (op == `R) && ( func == `SLTU);
	assign bne = (op == `BNE);
	assign blez = (op == `BLEZ);
	assign bgtz = (op == `BGTZ);
	assign bltz = (op == `BLTZ_BGEZ) && (btype == `BLTZ);
	assign bgez = (op == `BLTZ_BGEZ) && (btype == `BGEZ);
	assign lui = (op == `LUI);
	assign sll = (op == `R) &&( func == `SLL);
	assign srl = (op == `R) &&(func == `SRL);
	assign sra = (op == `R) && ( func == `SRA);
	assign ori = ( op == `ORI);
	assign beq = (op == `BEQ);
	assign lw = (op == `LW);
	assign sllv = (op == `R) &&( func == `SLLV);
	assign srlv = (op == `R) && (func == `SRLV);
	assign srav = (op == `R) && (func == `SRAV);
	assign jr = (op == `R) &&( func == `JR);
	assign sw = (op == `SW);
	assign j = (op == `J);
	assign jal = (op == `JAL);
	assign lh = (op == `LH);
	assign lhu = (op == `LHU);
	assign jalr = (op == `R) &&(func == `JALR);
	assign mfhi = (op == `R) && (func == `MFHI);
	assign mflo = (op == `R) && (func == `MFLO);
	assign mthi = (op == `R) && (func == `MTHI);
	assign mtlo = (op == `R) && (func == `MTLO);
	assign mult = (op == `R) && (func == `MULT);
	assign multu = (op == `R) && (func == `MULTU);
	assign div = (op == `R) && (func == `DIV);
	assign divu = (op == `R) && (func == `DIVU);
	assign sb = (op == `SB);
	assign sh = (op == `SH);
	assign lb = (op == `LB);
	assign lbu = (op == `LBU);
	
	// the controller
	assign NPC_SEL[0] = bne| blez|bgtz| bltz| bgez| beq| j| jal;
	assign NPC_SEL[1] = jr| j| jal| jalr;
	assign A3_SEL[0] = addi| addiu| andi| xori| slti| sltiu| lui| ori| lw| lh| lhu| lb| lbu;
	assign A3_SEL[1] = jal;
	assign WD_SEL[0] = lui| jal| jalr;
	assign WD_SEL[1] = lw| jal| jalr| lh| lhu| lb| lbu;
	assign WD_SEL[2] = mflo| mfhi;
	assign WE = addu| add| sub| subu| and_| or_| xor_| nor_|
				addi| addiu| andi| xori| slt| slti|
				sltiu| sltu| lui| sll| srl| sra|
				ori| lw| sllv| srlv| srav| jal| lh|
				lhu| lb| lbu| jalr| mflo| mfhi;
	assign A_SEL = sll|srl| sra| sllv| srlv| srav;
	assign B_SEL[0] = addi| addiu| andi| xori|
					  slti| sltiu| ori|lw| sllv| 
					  srlv| srav| sw| lh| lhu| sb| sh| lb| lbu;
	assign B_SEL[1] = sll| srl| sra| sllv| srlv| srav;
	assign B_SEL[2] = 1'b0;
	assign ALU_SEL[0] = sub|subu| or_| nor_| sltiu| sltu|
						srl| ori| srlv;
	assign ALU_SEL[1] = and_| or_| andi| slt| slti| sltiu| sltu|
						sra| ori| srav;
	assign ALU_SEL[2] = xor_| nor_| xori| slt| slti| sltiu| sltu;
	assign ALU_SEL[3] = sll| srl| sra| sllv| srlv| srav;
	assign EXT_SEL = addi| addiu| slti| sltiu| lw|lh|lhu| sw| sb| sh| lb| lbu;
	assign w = mthi| mtlo;
	assign W_SEL = mthi;
	assign MUL_SEL[0] = multu| divu;
	assign MUL_SEL[1] = div| divu;
	assign HL_SEL = mfhi;
	assign start = multu| mult| div| divu;
	assign SW1 = sw| sb| sh;
	assign LW1 = lw| lh| lhu| lb| lbu;
	assign BRANCH = beq| bne| blez| bgtz| bltz| bgez;
	
	assign Tnew_0 = jal| jalr| lui;
	assign Tnew_1 = addu| add| sub| subu| and_| or_|
					xor_| nor_| addi| addiu| andi| xori|
					slt| slti| sltiu| sltu|  sll| srl| ori|
					sllv| srlv| srav| mflo| mfhi| sra;
	assign Tnew_2 = lw| lh| lhu| lb| lbu;
	
	//stall
	wire Tuse_rt_0, Tuse_rt_1, Tuse_rt_2;
	wire Tuse_rs_0, Tuse_rs_1;
	
	assign Tuse_rs_0 = bne| blez| bgtz| bltz| bgez| beq| jr| j| jal| jalr;
	assign Tuse_rs_1 = addu| add| sub| subu| and_| or_| xor_| nor_|
					   addi| addiu| andi| xori| slt| slti| sltiu| sltu|
					   sll| srl| sra| ori| lw| sllv| srlv| srav| sw| lh|
					   lhu| sb| sh| lb| lbu| mtlo| mthi| mult| multu| div| divu;
	assign Tuse_rt_0 = bne| blez| bgtz| bltz| bgez| beq| jr| j| jal| jalr;
	assign Tuse_rt_1 = addu| add| sub| subu| and_| or_| xor_| nor_|
					   addi| addiu| andi| xori| slt| slti| sltiu| sltu|
					   sll| srl| sra| ori| lw| sllv| srlv| srav| lh|
					   lhu| lb| lbu| mult| multu| div| divu;
	assign Tuse_rt_2 = sw| sh| sb;
	
	`define Tuse_rs_0 2'b00
	`define Tuse_rs_1 2'b01
	`define Tuse_rt_0 2'b00
	`define Tuse_rt_1 2'b01
	`define Tuse_rt_2 2'b10
	
	assign Tuse_rs = (Tuse_rs_0) ? `Tuse_rs_0 :
					 (Tuse_rs_1) ? `Tuse_rs_1 :
					 2'b11;
	assign Tuse_rt = (Tuse_rt_0) ? `Tuse_rt_0 :
					 (Tuse_rt_1) ? `Tuse_rt_1 :
					 (Tuse_rt_2) ? `Tuse_rt_2 :
					 2'b11;
endmodule
`default_nettype none