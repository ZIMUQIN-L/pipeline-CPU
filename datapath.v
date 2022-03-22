`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:21:54 12/10/2020 
// Design Name: 
// Module Name:    datapath 
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
module datapath(
	input wire clk,
	input wire rst,
	input wire BRANCH,
	input wire [1:0] NPC_SEL_D,
	input wire [1:0] A3_SEL_D,
	input wire [2:0] WD_SEL_D,
	input wire WE_D, 
	input wire A_SEL_D,
	input wire EXT_SEL_D,
	input wire [2:0] B_SEL_D,
	input wire [3:0] ALU_SEL_D,
	input wire SW_D,
	input wire LW_D,
	input wire w_D,
	input wire W_SEL_D,
	input wire [1:0] MUL_SEL_D,
	input wire HL_SEL_D,
	input wire start_D,
	input wire bne,
	input wire blez,
    input wire bgtz,
    input wire bltz,
    input wire bgez,
    input wire beq,
	input wire [1:0] Tnew_D,
	input wire [1:0] Tuse_rs,
	input wire [1:0] Tuse_rt,
	output wire [31:0] INSTR
    );
	wire [31:0] PC_D;
	wire [31:0] npc;
	wire [31:0] RD1_D;
	wire [31:0] RD2_D;
	wire [31:0] RD1_E;
	wire [31:0] RD2_E;
	wire [31:0] RD1_M;
	wire [31:0] RD2_M;
	
	wire [31:0] INSTR_D;
	wire [31:0] PC_F;
	wire [31:0] INSTR_F;
	wire true;
	
	wire [31:0] PC_E;
	wire [31:0] INSTR_E;
	wire [31:0] PC_M;
	wire [31:0] INSTR_M;
	wire [31:0] PC_W;
	wire [31:0] INSTR_W;
	wire [31:0] WD;
	
	wire [4:0] A3_D;
	wire [4:0] A3_E;
	wire [4:0] A3_M;
	wire [4:0] A3_W;
	
	wire WE_E;
	wire WE_M;
	wire WE_W;
	
	wire [1:0] Tnew_E;
	wire [1:0] Tnew_M;
	wire [1:0] Tnew_W;
	
	wire [31:0] EXT_OUT_D;
	wire [31:0] EXT_OUT_E;
	wire [31:0] EXT_OUT_M;	
	wire [31:0] EXT_OUT_W;
	
	wire [1:0] A3_SEL_E;
	wire [1:0] A3_SEL_M;
	wire [1:0] A3_SEL_W;
	
	wire [2:0] WD_SEL_E;
	wire [2:0] WD_SEL_M;
	wire [2:0] WD_SEL_W;
	
	wire A_SEL_E;
	
	wire [2:0] B_SEL_E;
	
	wire [3:0] ALU_SEL_E;
	
	// MUDI
	wire w_E;
	wire W_SEL_E;
	wire [1:0] MUL_SEL_E;
	wire HL_SEL_E;
	wire start_E;
	
	wire busy;
	wire [31:0] HI;
	wire [31:0] LO;
	
	wire SW_E;
	wire SW_M;
	wire LW_E;
	wire LW_M;
	
	wire en = 1'b1;
	
	wire [31:0] A;
	wire [31:0] B;
	
	wire [31:0] ALU_OUT_E;
	wire [31:0] ALU_OUT_M;
	wire [31:0] ALU_OUT_W;
	
	wire [31:0] MUDI_OUT_E;
	wire [31:0] MUDI_OUT_M;
	wire [31:0] MUDI_OUT_W;
	
	wire [31:0] DM_OUT_M;
	wire [31:0] DM_OUT_W;
	
	wire [31:0] HALFS_M;
	wire [31:0] HALFU_M;
	wire [31:0] HALFS_W;
	wire [31:0] HALFU_W;
	
	wire [31:0] Hard_E;
	wire [31:0] Hard_M;
	wire [31:0] Hard_W;
	
	wire [31:0] RD1_E_HAZARD;
	wire [31:0] RD2_E_HAZARD;
	wire [31:0] RD1_M_HAZARD;
	wire [31:0] RD2_M_HAZARD;
	wire [31:0] RD2_W_HAZARD;
	
	
	// stall
	wire en_pc;
	wire en_fd;
	wire stall;
	
	wire stall_rs;
	wire stall_rt;
	//here for nop/ never be stalled
	assign stall_rs = ((INSTR_D[25:21] == A3_E && Tuse_rs < Tnew_E && WE_E == 1) |
					  (INSTR_D[25:21] == A3_M && Tuse_rs < Tnew_M && WE_M == 1) |
					  (INSTR_D[25:21] == A3_W && Tuse_rs < Tnew_W && WE_W == 1)) && INSTR_D[25:21] != 5'b00000;
					  
	assign stall_rt = ((INSTR_D[20:16] == A3_E && Tuse_rt < Tnew_E && WE_E == 1) |
					  (INSTR_D[20:16] == A3_M && Tuse_rt < Tnew_M && WE_M == 1) |
					  (INSTR_D[20:16] == A3_W && Tuse_rt < Tnew_W && WE_W == 1))&& INSTR_D[20:16] != 5'b00000;
					  
	assign stall = stall_rs | stall_rt | busy| start_E;
	assign en_pc = !stall;
	assign en_fd = !stall;
	//FD
	assign RD1_E_HAZARD = (INSTR_D[25:21] == 0)? 0 :
					 (INSTR_D[25:21] == A3_E &&Tnew_E == 0 && WE_E == 1) ? Hard_E : 
					 (INSTR_D[25:21] == A3_M &&Tnew_M == 0 && WE_M == 1) ? Hard_M :
					 (INSTR_D[25:21] == A3_W &&Tnew_W == 0 && WE_W == 1) ? Hard_W :
					 RD1_D;
	assign RD2_E_HAZARD = (INSTR_D[20:16] == 0)? 0 :
					 (INSTR_D[20:16] == A3_E &&Tnew_E == 0 && WE_E == 1) ? Hard_E : 
					 (INSTR_D[20:16] == A3_M &&Tnew_M == 0 && WE_M == 1) ? Hard_M :
					 (INSTR_D[20:16] == A3_W &&Tnew_W == 0 && WE_W == 1) ? Hard_W :
					 RD2_D;
					 
    PC pci(clk, rst, en_pc, npc, PC_F);
	NPC npci(INSTR_D, RD1_E_HAZARD, PC_F, NPC_SEL_D, BRANCH, true, npc);
	IM imi(PC_F, INSTR_F);
	
	F_D fdi(PC_F, INSTR_F, clk, rst, en_fd, PC_D, INSTR_D);
	//DE
	
	A3_plexer a3p(INSTR_D, A3_SEL_D, A3_D);
	WD_plexer wdp(ALU_OUT_W, EXT_OUT_W, DM_OUT_W, PC_W, MUDI_OUT_W, WD_SEL_W, WD);
	GRF grfi(INSTR_D[25:21], INSTR_D[20:16], A3_W, clk, rst, WD, WE_W, RD1_D, RD2_D, PC_W);
	
	EXT exti(EXT_SEL_D, INSTR_D[15:0], EXT_OUT_D); 
	CMP cmpi(bne, blez, bgtz, bltz, bgez, beq, RD1_E_HAZARD, RD2_E_HAZARD, true);
	
	DE dei(stall|rst, clk, en, RD1_E_HAZARD, RD2_E_HAZARD, EXT_OUT_D, PC_D, INSTR_D, A3_D, WD_SEL_D, 
		   WE_D, A_SEL_D, B_SEL_D, ALU_SEL_D, w_D, W_SEL_D, MUL_SEL_D, HL_SEL_D, start_D, 
		   SW_D, LW_D, Tnew_D, RD1_E, RD2_E, EXT_OUT_E, PC_E, INSTR_E, A3_E, WD_SEL_E, WE_E, A_SEL_E, B_SEL_E, ALU_SEL_E,
		   w_E, W_SEL_E, MUL_SEL_E, HL_SEL_E, start_E, SW_E, LW_E, Tnew_E);
	
	E_Hazard ehaz(WD_SEL_E, EXT_OUT_E, PC_E, Hard_E);
	//EM
	assign RD1_M_HAZARD = (INSTR_E[25:21] == 0)? 0 :
					 (INSTR_E[25:21] == A3_M &&Tnew_M == 0 && WE_M == 1) ? Hard_M :
					 (INSTR_E[25:21] == A3_W &&Tnew_W == 0 && WE_W == 1) ? Hard_W :
					 RD1_E;
	assign RD2_M_HAZARD = (INSTR_E[20:16] == 0)? 0 :
					 (INSTR_E[20:16] == A3_M &&Tnew_M == 0 && WE_M == 1) ? Hard_M :
					 (INSTR_E[20:16] == A3_W &&Tnew_W == 0 && WE_W == 1) ? Hard_W :
					 RD2_E;
					 
	A_plexer ap(RD1_M_HAZARD, RD2_M_HAZARD, A_SEL_E, A);
	B_plexer bp(RD1_M_HAZARD, RD2_M_HAZARD, EXT_OUT_E, INSTR_E, B_SEL_E, B);
	ALU alui(A, B, ALU_SEL_E, ALU_OUT_E);
	MUDI mudi(RD1_M_HAZARD, RD2_M_HAZARD, clk, rst, start_E, MUL_SEL_E, W_SEL_E, w_E, busy, HI, LO);
	MD_plexer mdp(HI, LO, HL_SEL_E, MUDI_OUT_E);
	
	EM emi(clk, en, rst, PC_E, INSTR_E, RD1_M_HAZARD, RD2_M_HAZARD, EXT_OUT_E, ALU_OUT_E, 
		   MUDI_OUT_E, LW_E, SW_E, A3_E, WD_SEL_E, WE_E, Tnew_E, PC_M, INSTR_M, RD1_M, RD2_M,
		   EXT_OUT_M, ALU_OUT_M, MUDI_OUT_M, A3_M, WD_SEL_M, WE_M, LW_M, SW_M, Tnew_M);
	
	M_Hazard mhaz(WD_SEL_M, EXT_OUT_M, PC_M, ALU_OUT_M, MUDI_OUT_M, Hard_M);
	//MW
	assign RD2_W_HAZARD = (INSTR_M[20:16] == 0)? 0 :
					 (INSTR_M[20:16] == A3_W &&Tnew_W == 0 && WE_W == 1) ? Hard_W :
					 RD2_M;
					 
	DM_ dmi(INSTR_M, ALU_OUT_M, RD2_W_HAZARD, SW_M, LW_M, WE_M, clk, rst, PC_M, DM_OUT_M);
	
	MW mwi(clk, rst, en, A3_M, DM_OUT_M, ALU_OUT_M, WE_M, PC_M, INSTR_M, Tnew_M, MUDI_OUT_M,
	       A3_W, DM_OUT_W, ALU_OUT_W, WE_W, PC_W, INSTR_W, WD_SEL_M, WD_SEL_W, MUDI_OUT_W,
		   EXT_OUT_M, EXT_OUT_W, Tnew_W);
	
	W_Hazard whaz(WD_SEL_W, EXT_OUT_W, PC_W, ALU_OUT_W, DM_OUT_W, MUDI_OUT_W, Hard_W);

	assign INSTR = INSTR_D;
endmodule
`default_nettype none