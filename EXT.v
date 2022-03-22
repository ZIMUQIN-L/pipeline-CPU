`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:52:12 12/09/2020 
// Design Name: 
// Module Name:    EXT 
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
module EXT(
    input wire EXT_SEL,
    input wire [15:0] IM16,
    output wire [31:0] EXT_OUT
    );
	reg[31:0] sign;
	reg [31:0] unsign;
	always @(*) begin
		unsign = {{16{1'b0}}, IM16};
		  case(IM16[15])
			0: sign = {{16{1'b0}}, IM16};
			1: sign = {{16{1'b1}}, IM16};
		  endcase
	end
	assign EXT_OUT = (EXT_SEL == 0)? unsign : sign;
endmodule
