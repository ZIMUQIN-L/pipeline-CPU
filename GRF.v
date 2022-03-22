`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:12:53 12/09/2020 
// Design Name: 
// Module Name:    GRF 
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
module GRF(
    input wire [4:0] A1,
    input wire [4:0] A2,
    input wire [4:0] A3,
    input wire clk,
    input wire rst,
    input wire [31:0] WD,
    input wire WE,
    output wire [31:0] RD1,
    output wire [31:0] RD2,
    input wire [31:0] PC
    );
	reg [31:0] grf[0:31];
	integer i;
	initial begin
		for(i = 0; i<= 31; i = i+1)begin
			grf[i] = 0;
		end
	end
	always @(posedge clk) begin
		if( rst == 1) begin
			for(i = 0; i<=31; i = i+1)begin
				grf[i] <= 0;
			end
		end
		else begin
			if(WE == 1)begin
				grf[A3] <= WD;
				$display("%d@%h: $%d <= %h", $time, PC, A3, WD);
			end
		end
		grf[0] <= 0;
	end
	assign RD1 = grf[A1];
	assign RD2 = grf[A2];

endmodule
