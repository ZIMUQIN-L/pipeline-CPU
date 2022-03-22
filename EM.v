`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:08:48 12/10/2020 
// Design Name: 
// Module Name:    EM 
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
module EM(
    input wire clk,
    input wire en,
    input wire rst,
    input wire [31:0] PC_E,
    input wire [31:0] INSTR_E,
    input wire [31:0] RD1_E,
    input wire [31:0] RD2_E,
    input wire [31:0] EXT_OUT_E,
	input wire [31:0] ALU_OUT_E,
	input wire [31:0] MUDI_OUT_E, 
    input wire [0:0] LW_E,
    input wire [0:0] SW_E,
    input wire [4:0] A3_E,
    input wire [2:0] WD_SEL_E,
    input wire [0:0] WE_E,
	input wire [1:0] Tnew_E,
    output reg [31:0] PC_M,
    output reg [31:0] INSTR_M,
    output reg [31:0] RD1_M,
    output reg [31:0] RD2_M,
    output reg [31:0] EXT_OUT_M,
	output reg [31:0] ALU_OUT_M,
	output reg [31:0] MUDI_OUT_M, 
    output reg [4:0] A3_M,
    output reg [2:0] WD_SEL_M,
    output reg [0:0] WE_M,
    output reg [0:0] LW_M,
    output reg [0:0] SW_M,
	output reg [1:0] Tnew_M
    );
	initial begin
		RD1_M = 0;
			RD2_M = 0;
			EXT_OUT_M = 0;
			ALU_OUT_M = 0;
			MUDI_OUT_M = 0;
			PC_M = 0;
			INSTR_M = 0;
			A3_M = 0;
			WD_SEL_M = 0;
			WE_M = 0;
			SW_M = 0;
			LW_M = 0;
			Tnew_M = 0;
	end
	always @(posedge clk) begin
		if(rst == 1) begin
			RD1_M <= 0;
			RD2_M <= 0;
			EXT_OUT_M <= 0;
			ALU_OUT_M <= 0;
			MUDI_OUT_M <= 0;
			PC_M <= 0;
			INSTR_M <= 0;
			A3_M <= 0;
			WD_SEL_M <= 0;
			WE_M <= 0;
			SW_M <= 0;
			LW_M <= 0;
			Tnew_M <= 0;
		end
		else if (en == 1) begin
			RD1_M <= RD1_E;
			RD2_M <= RD2_E;
			EXT_OUT_M <= EXT_OUT_E;
			ALU_OUT_M <= ALU_OUT_E;
			MUDI_OUT_M <= MUDI_OUT_E;
			PC_M <= PC_E;
			INSTR_M <= INSTR_E;
			A3_M <= A3_E;
			WD_SEL_M <= WD_SEL_E;
			WE_M <= WE_E;
			SW_M <= SW_E;
			LW_M <= LW_E;
			if(Tnew_E >= 1)
				Tnew_M <= Tnew_E -1;
			else 
				Tnew_M <= Tnew_E;
		end
		else begin
			RD1_M <= RD1_M;
			RD2_M <= RD2_M;
			EXT_OUT_M <= EXT_OUT_M;
			ALU_OUT_M <= ALU_OUT_M;
			MUDI_OUT_M <= MUDI_OUT_M;
			PC_M <= PC_M;
			INSTR_M <= INSTR_M;
			A3_M <= A3_M;
			WD_SEL_M <= WD_SEL_M;
			WE_M <= WE_M;
			SW_M <= SW_M;
			LW_M <= LW_M;
			Tnew_M <= Tnew_M;
		end
	end

endmodule
`default_nettype none