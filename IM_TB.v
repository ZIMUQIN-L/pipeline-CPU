`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:27:17 12/17/2020
// Design Name:   IM
// Module Name:   C:/.Xilinx/xilinx/P5/IM_TB.v
// Project Name:  P5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: IM
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module IM_TB;

	// Inputs
	reg [31:0] PC;

	// Outputs
	wire [31:0] IM_OUT;

	// Instantiate the Unit Under Test (UUT)
	IM uut (
		.PC(PC), 
		.IM_OUT(IM_OUT)
	);

	initial begin
		// Initialize Inputs
		PC = 0;

		// Wait 100 ns for global reset to finish
		#100;
        #10 PC = PC + 4;
		#10 PC = PC +4;
		#10 PC = PC + 4;
		// Add stimulus here

	end
      
endmodule

