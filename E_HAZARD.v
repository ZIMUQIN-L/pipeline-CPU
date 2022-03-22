`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:39:10 12/20/2020 
// Design Name: 
// Module Name:    Hazard_plexer 
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
module E_Hazard(
    input wire [2:0] WD_SEL_E,
    input wire [31:0] EXT_OUT_E,
    input wire [31:0] PC_E,
    output wire [31:0] E_HAZARD
    );
	assign E_HAZARD = (WD_SEL_E == 3'b001) ? (EXT_OUT_E << 16) :
					  (WD_SEL_E == 3'b011) ? PC_E + 8 :
					  0;
endmodule


module M_Hazard(
	input wire [2:0] WD_SEL_M,
	input wire [31:0] EXT_OUT_M,
	input wire [31:0] PC_M,
	input wire [31:0] ALU_OUT_M,
	input wire [31:0] MUDI_OUT_M,
	output wire [31:0] M_Hazard
	);
	assign M_Hazard = (WD_SEL_M == 3'b000) ? ALU_OUT_M :
					  (WD_SEL_M == 3'b001) ? EXT_OUT_M << 16 :
					  (WD_SEL_M == 3'b011) ? PC_M + 8 :
					  (WD_SEL_M == 3'b100) ? MUDI_OUT_M :
					  0;
endmodule


module W_Hazard(
	input wire [2:0] WD_SEL_W,
	input wire [31:0] EXT_OUT_W,
	input wire [31:0] PC_W,
	input wire [31:0] ALU_OUT_W,
	input wire [31:0] DM_OUT_W,
	input wire [31:0] MUDI_OUT_W,
	output wire [31:0] W_Hazard
	);
	
	assign W_Hazard = (WD_SEL_W == 3'b000) ? ALU_OUT_W :
					  (WD_SEL_W == 3'b001) ? EXT_OUT_W << 16 :
					  (WD_SEL_W == 3'b010) ? DM_OUT_W :
					  (WD_SEL_W == 3'b011) ? PC_W + 8 :
					  (WD_SEL_W == 3'b100) ? MUDI_OUT_W :
					  0;
endmodule
