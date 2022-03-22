`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:39:19 12/20/2020 
// Design Name: 
// Module Name:    DM_ 
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
module DM_(
    input wire [31:0] INSTR,
	input wire [31:0] MemAddr,
    input wire [31:0] MemData,
    input wire SW_p,
    input wire LW_p,
    input wire WE,
    input wire clk,
    input wire rst,
    input wire [31:0] PC,
	output wire [31:0] DM_OUT
    );
	
	`define LB 6'b100000
	`define LBU 6'b100100
	`define LH 6'b100001
	`define LHU 6'b100101
	`define LW 6'b100011
	`define SB 6'b101000
	`define SH 6'b101001
	`define SW 6'b101011
	
	wire [5:0] op;
	assign op = INSTR[31:26];
	wire lb, lbu, lh, lhu, lw, sb, sh, sw;
	
	wire [31:0] DM_O;
	
	assign lb = (op == `LB);
	assign lbu = (op == `LBU);
	assign lh = (op == `LH);
	assign lhu = (op == `LHU);
	assign lw = (op == `LW);
	assign sb = (op == `SB);
	assign sw = (op == `SW);
	assign sh = (op == `SH);
	
	reg [31:0] DM [0:16383];
	integer i;
	initial begin
		for(i = 0; i <= 16383; i = i + 1) begin
			DM[i] = 0;
		end
	end
	always @(posedge clk) begin
		if(rst == 1) begin
			for(i = 0; i <= 1023; i = i + 1) begin
				DM[i] <= 0;
			end
		end
		else if (SW_p ==1 && sb == 1) begin
			case(MemAddr[1:0])
				2'b00:begin
					DM[MemAddr[15:2]] <= {DM[MemAddr[15:2]][31:8], MemData[7:0]};
					$display("%d@%h: *%h <= %h", $time, PC, {MemAddr[31:2], 2'b00},{DM[MemAddr[15:2]][31:8], MemData[7:0]});
					end
				2'b01:begin
					DM[MemAddr[15:2]] <= {DM[MemAddr[15:2]][31:16],MemData[7:0], DM[MemAddr[15:2]][7:0]};
					$display("%d@%h: *%h <= %h", $time, PC, {MemAddr[31:2], 2'b00},{DM[MemAddr[15:2]][31:16],MemData[7:0], DM[MemAddr[15:2]][7:0]});
					end
				2'b10:begin
					DM[MemAddr[15:2]] <= {DM[MemAddr[11:2]][31:24],MemData[7:0], DM[MemAddr[11:2]][15:0]};
					$display("%d@%h: *%h <= %h", $time, PC, {MemAddr[31:2], 2'b00},{DM[MemAddr[15:2]][31:24],MemData[7:0], DM[MemAddr[15:2]][15:0]});
					end
				2'b11:begin
					DM[MemAddr[15:2]] <= {MemData[7:0],DM[MemAddr[15:2]][23:0]};
					$display("%d@%h: *%h <= %h", $time, PC, {MemAddr[31:2], 2'b00},{MemData[7:0],DM[MemAddr[15:2]][23:0]});
					end
			endcase
		end
		else if (SW_p == 1 && sh == 1) begin
			case(MemAddr[1]) 
				1'b0: begin
					DM[MemAddr[15:2]] <= {DM[MemAddr[15:2]][31:16], MemData[15:0]};
					$display("%d@%h: *%h <= %h", $time, PC, {MemAddr[31:2], 2'b00},{DM[MemAddr[15:2]][31:16], MemData[15:0]});
					end
				1'b1: begin
					DM[MemAddr[15:2]] <= {MemData[15:0], DM[MemAddr[15:2]][15:0]};
					$display("%d@%h: *%h <= %h", $time, PC, {MemAddr[31:2], 2'b00},{MemData[15:0], DM[MemAddr[15:2]][15:0]});
					end
			endcase
		end
		else if (SW_p == 1 && sw == 1) begin
			DM[MemAddr[15:2]] <= MemData;
			$display("%d@%h: *%h <= %h", $time, PC, MemAddr, MemData);
		end
		else DM[MemAddr[15:2]] <= DM[MemAddr[15:2]];
	
	end
	
	wire [15:0] DM_H;
	wire [7:0] DM_B;
	assign DM_O = DM[MemAddr[15:2]];
	assign DM_H = (MemAddr[1] == 1'b0) ? DM_O[15:0] :
				  (MemAddr[1] == 1'b1) ? DM_O[31:16] :
				  0;
	assign DM_B = (MemAddr[1:0] == 2'b00) ? DM_O[7:0] :
				  (MemAddr[1:0] == 2'b01) ? DM_O[15:8]:
				  (MemAddr[1:0] == 2'b10) ? DM_O[23:16] :
				  (MemAddr[1:0] == 2'b11) ? DM_O[31:24] :
				  0;
				  
	assign DM_OUT = (LW_p == 1 && lbu == 1) ? {{24{1'b0}}, DM_B} :
					(LW_p == 1 && lb == 1) ? {{24{DM_B[7]}}, DM_B} :
					(LW_p == 1 && lhu == 1) ? {{16{1'b0}}, DM_H} :
					(LW_p == 1 && lh == 1) ? {{16{DM_H[15]}}, DM_H} :
					(LW_p == 1 && lw == 1) ? DM_O :
					0;
endmodule
