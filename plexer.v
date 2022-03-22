`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:00:45 12/10/2020 
// Design Name: 
// Module Name:    plexer 
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
module A3_plexer(
	input wire[31:0] INSTR_W,
	input wire [1:0] A3_SEL,
	output wire [4:0] A3
    );
	assign A3 = (A3_SEL == 2'b00) ? INSTR_W[15:11] :
				(A3_SEL == 2'b01) ? INSTR_W[20:16] :
				(A3_SEL == 2'b10) ? 5'b11111:
				0;

endmodule

module WD_plexer(
	input wire [31:0] ALU_OUT_W,
	input wire [31:0] EXT_OUT_W,
	input wire [31:0] DM_OUT_W,
	input wire [31:0] PC_W,
	input wire [31:0] MUDI_OUT_W,
	input wire [2:0] WD_SEL,
	output wire [31:0] WD
	);
	assign WD = (WD_SEL == 3'b000) ? ALU_OUT_W :
				(WD_SEL == 3'b001) ? EXT_OUT_W<<16 :
				(WD_SEL == 3'b010) ? DM_OUT_W :
				(WD_SEL == 3'b011) ? PC_W + 8 :
				(WD_SEL == 3'b100) ? MUDI_OUT_W :
				0;
	
endmodule

module A_plexer(
	input wire [31:0] RD1_E,
	input wire [31:0] RD2_E,
	input wire A_SEL_E,
	output wire [31:0] A
	);
	assign A = (A_SEL_E == 1'b0) ? RD1_E :
			   (A_SEL_E == 1'b1) ? RD2_E :
			   0;
endmodule

module B_plexer(
	input wire [31:0] RD1_E,
	input wire [31:0] RD2_E,
	input wire [31:0] EXT_OUT_E,
	input wire [31:0] INSTR_E,
	input wire [2:0] B_SEL_E,
	output wire [31:0] B
	);
	assign B = (B_SEL_E == 3'b000) ? RD2_E :
			   (B_SEL_E == 3'b001) ? EXT_OUT_E :
			   (B_SEL_E == 3'b010) ? {{27{1'b0}}, INSTR_E[10:6]} :
			   (B_SEL_E == 3'b011) ? RD1_E :
			   0;
endmodule

module MD_plexer(
	input wire [31:0] HI,
	input wire [31:0] LO,
	input wire HL_SEL,
	output wire [31:0] MUDI_OUT_E
	);
	assign MUDI_OUT_E = (HL_SEL == 1'b0) ? LO :
						(HL_SEL == 1'b1) ? HI :
						0;
endmodule
