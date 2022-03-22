`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:15:49 12/10/2020 
// Design Name: 
// Module Name:    gener_half 
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
module gener_half(
    input wire [31:0] DM_OUT,
    input wire [31:0] ALU_OUT,
    output wire [31:0] HALFS,
    output wire [31:0] HALFU
    );
	assign HALFS = (ALU_OUT[1] == 1'b0) ? {{16{DM_OUT[15]}}, DM_OUT[15:0]} :
	               (ALU_OUT[1] == 1'b1) ? {{16{DM_OUT[31]}}, DM_OUT[31:16]} :
				   0;
	assign HALFU = (ALU_OUT[1] == 1'b0) ? {{16{1'b0}}, DM_OUT[15:0]} :
	               (ALU_OUT[1] == 1'b1) ? {{16{1'b0}}, DM_OUT[31:16]} : 
				   0;


endmodule
`default_nettype none