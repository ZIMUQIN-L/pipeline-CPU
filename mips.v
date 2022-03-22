`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:45:21 12/12/2020 
// Design Name: 
// Module Name:    mips 
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
module mips(
    input wire clk,
    input wire reset
    );
	wire rst;
	assign rst = reset;
	wire [31:0] INSTR;
	wire BRANCH;
	wire[1:0] NPC_SEL;
	wire en_pc = 1'b1;
	wire en_fd = 1'b1;
	wire [1:0] A3_SEL;
	wire [2:0] WD_SEL;
	wire WE;
	wire A_SEL;
	wire EXT_SEL;
	wire [2:0] B_SEL;
	wire [3:0] ALU_SEL;
	wire SW;
	wire LW;
	wire w;
	wire W_SEL;
	wire [1:0] MUL_SEL;
	wire HL_SEL;
	wire start;
	wire bne, blez, bgtz, bltz, bgez, beq;
	wire stall;
	wire Tnew_0, Tnew_1, Tnew_2;
	wire [1:0] Tnew;
	wire [1:0] Tuse_rs;
	wire [1:0] Tuse_rt;
	
	`define Tnew0 2'b00
	`define Tnew1 2'b01
	`define Tnew2 2'b10
	
	assign Tnew = (Tnew_0 == 1) ? `Tnew0:
				  (Tnew_1 == 1) ? `Tnew1:
				  (Tnew_2 == 1) ? `Tnew2:
				  0;
						
	datapath DATA(clk, rst, BRANCH, NPC_SEL, A3_SEL, WD_SEL, WE, A_SEL, 
			 EXT_SEL, B_SEL, ALU_SEL, SW, LW,  w, W_SEL, MUL_SEL, HL_SEL, start,
			 bne, blez, bgtz, bltz, bgez, beq, Tnew, Tuse_rs, Tuse_rt, INSTR);
	controller CONT(INSTR, NPC_SEL, A3_SEL, WD_SEL, WE, A_SEL, B_SEL, ALU_SEL, EXT_SEL,
			   w, W_SEL, MUL_SEL, HL_SEL, start, SW, LW, BRANCH, bne, blez, bgtz, bltz, bgez,
			   beq, Tnew_0, Tnew_1, Tnew_2, Tuse_rs, Tuse_rt);

endmodule
