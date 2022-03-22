`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:31:55 12/09/2020 
// Design Name: 
// Module Name:    NPC 
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
module NPC(
    input wire[31:0] INSTR,
    input wire[31:0] RD1,
    input wire[31:0] PC,
    input wire[1:0] NPC_SEL,
    input wire BRANCH,
    input wire TRUE,
    output wire[31:0] NPC
    );
	reg [31:0] tpc;
	reg [31:0] NPC1;
	always @(*) begin
		if(BRANCH & TRUE)
			tpc = PC + {{14{INSTR[15]}}, INSTR[15:0], {2{1'b0}}};
		else
			tpc = PC + 4;
		case(NPC_SEL)
			2'b00: NPC1 = PC + 4;
			2'b01: NPC1 = tpc;
			2'b10: NPC1 = RD1;
			2'b11: NPC1 = {INSTR[31:28], INSTR[25:0], {2{1'b0}}};
		endcase
	end
	assign NPC = NPC1;

endmodule
