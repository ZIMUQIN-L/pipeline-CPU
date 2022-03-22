`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:08:51 12/08/2020 
// Design Name: 
// Module Name:    hello 
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
module hello(
    output [31:0] true,
	output [31:0] true2
    );
	wire [31:0] this;
	wire [31:0] that;
	assign this = 32'b11110000000000001111000000000000;
	assign that = 32'b00000000111111111111111111111111;
	assign true = this < that;
	assign true2 = that < this;


endmodule
