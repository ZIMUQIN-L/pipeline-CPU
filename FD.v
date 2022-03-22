`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:01:44 12/09/2020 
// Design Name: 
// Module Name:    FD 
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
module F_D(
    input wire [31:0] PC_F,
    input wire [31:0] INSTR_F,
	input wire clk,
	input wire rst,
	input wire en,
    output reg [31:0] PC_D,
    output reg [31:0] INSTR_D
    );
	initial begin
		PC_D = 0;
		INSTR_D = 0;
	end 
	always @(posedge clk) begin
		if(rst == 1)begin
			PC_D <= 0;
			INSTR_D <= 0;
		end
		else if(en) begin
			PC_D <= PC_F;
			INSTR_D <= INSTR_F;
		end
		else begin
			PC_D <= PC_D;
			INSTR_D <= INSTR_D;
		end
	end


endmodule
