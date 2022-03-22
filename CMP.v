`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:24:41 12/09/2020 
// Design Name: 
// Module Name:    CMP 
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
module CMP(
    input wire bne,
    input wire blez,
    input wire bgtz,
    input wire bltz,
    input wire bgez,
    input wire beq,
    input wire [31:0] A,
    input wire [31:0] B,
    output wire true
    );
	assign true = ((A == B) && beq) |
	              ((A != B) && bne) |
				  (($signed(A) >= 0) && bgez) |
				  (($signed(A) > 0) && bgtz) |
				  (($signed(A) <= 0) && blez) |
				  (($signed(A) < 0) && bltz);


endmodule
