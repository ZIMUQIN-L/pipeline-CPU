`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:36:03 12/09/2020 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input wire [31:0] A,
    input wire [31:0] B,
    input wire [3:0] ALU_SEL,
    output wire[31:0] ALU_OUT
    );
	assign ALU_OUT = (ALU_SEL == 4'b0000) ? A + B:
	                 (ALU_SEL == 4'b0001) ? A - B:
					 (ALU_SEL == 4'b0010) ? A & B:
					 (ALU_SEL == 4'b0011) ? A | B:
					 (ALU_SEL == 4'b0100) ? A ^ B:
					 (ALU_SEL == 4'b0101) ? (~(A | B)):
					 (ALU_SEL == 4'b0110) ? ($signed(A) < $signed(B)):
					 (ALU_SEL == 4'b0111) ? (A < B):
					 (ALU_SEL == 4'b1000) ? (A << B[4:0]):
					 (ALU_SEL == 4'b1001) ? (A >> B[4:0]):
					 (ALU_SEL == 4'b1010) ? $signed($signed(A) >>> B[4:0]):
					 0;

endmodule
