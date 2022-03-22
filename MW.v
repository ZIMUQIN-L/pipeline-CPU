`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:51:36 12/10/2020 
// Design Name: 
// Module Name:    MW 
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
module MW(
    input wire clk,
    input wire rst,
    input wire en,
    input wire [4:0] A3_M,
    input wire [31:0] DM_OUT_M,
    input wire [31:0] ALU_OUT_M,
    input wire WE_M,
    input wire [31:0] PC_M,
    input wire [31:0] INSTR_M,
	input wire [1:0] Tnew_M,
	input wire [31:0] MUDI_OUT_M, 
    output reg [4:0] A3_W,
    output reg [31:0] DM_OUT_W,
    output reg [31:0] ALU_OUT_W,
    output reg WE_W,
    output reg [31:0] PC_W,
    output reg [31:0] INSTR_W,
    input wire [2:0] WD_SEL_M,
    output reg [2:0] WD_SEL_W,
	output reg [31:0] MUDI_OUT_W,
    input wire [31:0] EXT_OUT_M,
    output reg [31:0] EXT_OUT_W,
	output reg [1:0] Tnew_W
    );
	initial begin
			A3_W = 0;
			DM_OUT_W = 0;
			ALU_OUT_W = 0;
			WE_W = 0;
			PC_W = 0;
			INSTR_W = 0;
			WD_SEL_W = 0;
			EXT_OUT_W = 0;
			MUDI_OUT_W = 0;
			Tnew_W = 0;
	end
	always @(posedge clk) begin
		if (rst == 1)begin
			A3_W <= 0;
			DM_OUT_W <= 0;
			ALU_OUT_W <= 0;
			WE_W <= 0;
			PC_W <= 0;
			INSTR_W <= 0;
			WD_SEL_W <= 0;
			EXT_OUT_W <= 0;
			MUDI_OUT_W <= 0;
			Tnew_W <= 0;
		end
		else if(en == 1) begin
			A3_W <= A3_M;
			DM_OUT_W <= DM_OUT_M;
			ALU_OUT_W <= ALU_OUT_M;
			WE_W <= WE_M;
			PC_W <= PC_M;
			INSTR_W <= INSTR_M;
			WD_SEL_W <= WD_SEL_M;
			EXT_OUT_W <= EXT_OUT_M;
			MUDI_OUT_W <= MUDI_OUT_M;
			if(Tnew_M >= 1)
				Tnew_W <= Tnew_M - 1;
			else
				Tnew_W <= Tnew_M;
		end
		else begin
			A3_W <= A3_W;
			DM_OUT_W <= DM_OUT_W;
			ALU_OUT_W <= ALU_OUT_W;
			WE_W <= WE_W;
			PC_W <= PC_W;
			INSTR_W <= INSTR_W;
			WD_SEL_W <= WD_SEL_W;
			EXT_OUT_W <= EXT_OUT_W;
			MUDI_OUT_W <= MUDI_OUT_W;
			Tnew_W <= Tnew_W;
		end
	end

endmodule
`default_nettype none