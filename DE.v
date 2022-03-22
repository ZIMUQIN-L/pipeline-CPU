`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:26:54 12/09/2020 
// Design Name: 
// Module Name:    DE 
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
module DE(
    input wire rst,
    input wire clk,
    input wire en,
    input wire [31:0] RD1_D,
    input wire [31:0] RD2_D,
    input wire [31:0] EXT_OUT_D,
    input wire [31:0] PC_D,
    input wire [31:0] INSTR_D,
	input wire [4:0]A3_D,
	input wire [2:0] WD_SEL_D,
	input wire WE_D,
	input wire A_SEL_D,
	input wire [2:0] B_SEL_D,
	input wire [3:0] ALU_SEL_D,
	input wire w_D,
	input wire W_SEL_D,
	input wire [1:0] MUL_SEL_D,
	input wire HL_SEL_D,
	input wire start_D,
	input wire SW_D,
	input wire LW_D,
	input wire [1:0] Tnew_D,
    output reg [31:0] RD1_E,
    output reg [31:0] RD2_E,
    output reg [31:0] EXT_OUT_E,
    output reg [31:0] PC_E,
    output reg [31:0] INSTR_E,
	output reg [4:0] A3_E,
	output reg [2:0] WD_SEL_E,
	output reg WE_E,
	output reg A_SEL_E,
	output reg [2:0] B_SEL_E,
	output reg [3:0] ALU_SEL_E,
	output reg w_E,
	output reg W_SEL_E,
	output reg [1:0] MUL_SEL_E,
	output reg HL_SEL_E,
	output reg start_E,
	output reg SW_E,
	output reg LW_E,
	output reg [1:0] Tnew_E
    );
	initial begin
			RD1_E = 0;
			RD2_E = 0;
			EXT_OUT_E = 0;
			PC_E = 0;
			INSTR_E = 0;
			A3_E = 0;
			WD_SEL_E = 0;
			WE_E = 0;
			A_SEL_E = 0;
			B_SEL_E = 0;
			ALU_SEL_E = 0;
			w_E = 0;
			W_SEL_E = 0;
			MUL_SEL_E = 0;
			HL_SEL_E = 0;
			start_E = 0;
			SW_E = 0;
			LW_E = 0;
			Tnew_E = 0;
	end
	always @(posedge clk) begin
		if(rst == 1) begin
			RD1_E <= 0;
			RD2_E <= 0;
			EXT_OUT_E <= 0;
			PC_E <= 0;
			INSTR_E <= 0;
			A3_E <= 0;
			WD_SEL_E <= 0;
			WE_E <= 0;
			A_SEL_E <= 0;
			B_SEL_E <= 0;
			ALU_SEL_E <= 0;
			w_E <= 0;
			W_SEL_E <= 0;
			MUL_SEL_E <= 0;
			HL_SEL_E <= 0;
			start_E <= 0;
			SW_E <= 0;
			LW_E <= 0;
			Tnew_E <= 0;
		end
		else if (en == 1) begin
			RD1_E <= RD1_D;
			RD2_E <= RD2_D;
			EXT_OUT_E <= EXT_OUT_D;
			PC_E <= PC_D;
			INSTR_E <= INSTR_D;
			A3_E <= A3_D;
			WD_SEL_E <= WD_SEL_D;
			WE_E <= WE_D;
			A_SEL_E <= A_SEL_D;
			B_SEL_E <= B_SEL_D;
			ALU_SEL_E <= ALU_SEL_D;
			w_E <= w_D;
			W_SEL_E <= W_SEL_D;
			MUL_SEL_E <= MUL_SEL_D;
			HL_SEL_E <= HL_SEL_D;
			start_E <= start_D;
			SW_E <= SW_D;
			LW_E <= LW_D;
			Tnew_E <= Tnew_D;
		end
		else begin
			RD1_E <= RD1_E;
			RD2_E <= RD2_E;
			EXT_OUT_E <= EXT_OUT_E;
			PC_E <= PC_E;
			INSTR_E <= INSTR_E;
			A3_E <= A3_E;
			WD_SEL_E <= WD_SEL_E;
			WE_E <= WE_E;
			A_SEL_E <= A_SEL_E;
			B_SEL_E <= B_SEL_E;
			ALU_SEL_E <= ALU_SEL_E;
			w_E <= w_E;
			W_SEL_E <= W_SEL_E;
			MUL_SEL_E <= MUL_SEL_E;
			HL_SEL_E <= HL_SEL_E;
			start_E <= start_E;
			SW_E <= SW_E;
			LW_E <= LW_E;
			Tnew_E <= Tnew_E;
		end
	end

endmodule
