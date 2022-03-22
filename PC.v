`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:02:09 12/09/2020 
// Design Name: 
// Module Name:    PC 
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
module PC(
    input wire clk,
    input wire rst,
    input wire en,
    input wire [31:0] NPC,
    output wire [31:0] PC
    );
	reg [31:0] thpc;
	initial begin
		thpc = 32'h00003000;
	end
	always @(posedge clk) begin
		if(rst == 1) begin
			thpc <= 32'h00003000;
		end
		else begin
			if(en == 1)
				thpc <= NPC;
			else
				thpc <= thpc;
		end
	end
	assign PC = thpc;

endmodule
`default_nettype none