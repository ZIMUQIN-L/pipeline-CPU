`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:32:37 12/28/2020 
// Design Name: 
// Module Name:    MUDI 
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
module MUDI(
    input wire [31:0] D1,
    input wire [31:0] D2,
    input wire clk,
    input wire rst,
    input wire start,
    input wire [1:0] MUL_SEL,
	input wire W_SEL,
	input wire w,
    output reg busy,
    output wire [31:0] HI,
    output wire [31:0] LO
    );
	
	reg [31:0] HIGH;
	reg [31:0] LOW;
	reg [3:0] timer = 4'b0;
	reg [63:0] res = 0;
	reg mul_or_div = 0;
	reg [31:0] mod = 0;
	reg [31:0] div = 0;
	initial begin
		busy = 0;
		HIGH = 0;
		LOW = 0;
	end
	always @(posedge clk) begin
		if(rst == 1)begin
			HIGH <= 0;
			LOW <= 0;
			busy <= 0;
		end
		else if (start == 1 && busy == 0) begin
			if(MUL_SEL == 2'b00) begin
				res <= ($signed(D1)) * ($signed(D2));
				mul_or_div <= 1'b0;
			end
			else if (MUL_SEL == 2'b01) begin
				res <= D1 * D2;
				mul_or_div <= 1'b0;
			end
			else if(MUL_SEL == 2'b10) begin
				div <= ($signed(D1))/($signed(D2));
				mod <= ($signed(D1))%($signed(D2));
				mul_or_div <= 1'b1;
			end
			else if(MUL_SEL == 2'b11)begin
				div <= ($unsigned(D1))/($unsigned(D2));
				mod <= ($unsigned(D1))%($unsigned(D2));
				mul_or_div <= 1'b1;
			end
			else begin
				div <= 0;
				mod <= 0;
				res <= 0;
			end
			busy <= 1'b1;
			timer <= timer + 1;
		end
		else if(busy == 1) begin
			if(mul_or_div == 1'b0) begin
				if(timer < 5) 
					timer <= timer + 1;
				else begin
					HIGH <=res[63:32];
					LOW <= res[31:0];
					timer <= 4'b0;
					busy <= 1'b0;
				end
			end
			else begin
				if(timer <10) begin
					timer <= timer + 1;
				end
				else begin
					HIGH <= mod;
					LOW <= div;
					timer <= 4'b0;
					busy <= 1'b0;
				end
			end
		end
		else if(w == 1) begin
			case(W_SEL) 
				1'b0: LOW <= D1;
				1'b1: HIGH <= D1;
				default: begin
					LOW <= LOW;
					HIGH <= HIGH;
				end
			endcase
		end
		else begin
			HIGH <= HIGH;
			LOW <= LOW;
		end
	end
	assign HI = HIGH;
	assign LO = LOW;
endmodule
