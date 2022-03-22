`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:55:55 12/17/2020
// Design Name:   PC
// Module Name:   C:/.Xilinx/xilinx/P5/PC_TB.v
// Project Name:  P5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: PC
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module PC_TB;

	// Inputs
	reg clk;
	reg rst;
	reg en;
	reg [31:0] NPC;

	// Outputs
	wire [31:0] PC;

	// Instantiate the Unit Under Test (UUT)
	PC uut (
		.clk(clk), 
		.rst(rst), 
		.en(en), 
		.NPC(NPC), 
		.PC(PC)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		en = 1;
		NPC = 0;

		// Wait 100 ns for global reset to finish
		#100;
        NPC = 12;
		#20 NPC = 16;
		// Add stimulus here

	end
    always #10 clk = ~clk;
endmodule

