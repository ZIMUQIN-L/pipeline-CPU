`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:04:43 12/09/2020 
// Design Name: 
// Module Name:    IM 
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
module IM(
    input wire[31:0] PC,
    output wire[31:0] IM_OUT
    );
	reg [31:0] IM [0:4095];
	initial begin
		$readmemh("code.txt", IM);
	end
	wire [31:0] pc = PC - 32'h00003000;
	assign IM_OUT = IM[pc[13:2]];


endmodule
