`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:05:00 12/09/2020 
// Design Name: 
// Module Name:    DM 
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
module DM(
    input wire LW,
    input wire SW,
    input wire [31:0] MemAddr,
    input wire [31:0] MemData,
    input wire [31:0] PC,
    input wire clk,
    input wire rst,
    input wire [31:0] DM_OUT
    );
	reg [31:0] DM [0:1023];
	integer i;
	initial begin
		for(i = 0; i <= 1023; i = i + 1) begin
			DM[i] = 0;
		end
	end
	always @(posedge clk) begin
		if(rst == 1) begin
			for(i = 0; i <= 1023; i = i + 1) begin
				DM[i] <= 0;
			end
		end
		else begin
			if(SW == 1) begin
				DM[MemAddr[11:2]] <= MemData;
				$display("%d@%h: *%h <= %h", $time, PC, MemAddr,MemData);
			end
		end
	end
	assign DM_OUT = (LW == 1) ? DM[MemAddr[11:2]] : 0;
endmodule
