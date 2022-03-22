`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   18:19:45 12/28/2020
// Design Name:   MUDI
// Module Name:   C:/.Xilinx/xilinx/P6/MUDI_TB.v
// Project Name:  P6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MUDI
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MUDI_TB;

	// Inputs
	reg [31:0] D1;
	reg [31:0] D2;
	reg clk;
	reg rst;
	reg start;
	reg [1:0] MUL_SEL;
	reg W_SEL;
	reg w;

	// Outputs
	wire busy;
	wire [31:0] HI;
	wire [31:0] LO;

	// Instantiate the Unit Under Test (UUT)
	MUDI uut (
		.D1(D1), 
		.D2(D2), 
		.clk(clk), 
		.rst(rst), 
		.start(start), 
		.MUL_SEL(MUL_SEL), 
		.W_SEL(W_SEL), 
		.w(w), 
		.busy(busy), 
		.HI(HI), 
		.LO(LO)
	);

	initial begin
		// Initialize Inputs
		D1 = 0;
		D2 = 0;
		clk = 1;
		rst = 1;
		start = 0;
		MUL_SEL = 0;
		W_SEL = 0;
		w = 0;

		// Wait 100 ns for global reset to finish
		#20
		rst = 0;
		#100;
        start = 1;
		D1 = 8217;
		D2 = 8720;
		MUL_SEL = 2'b00;
		#20
		start = 0;
		// Add stimulus here

	end
    always #10 clk = ~clk;  
endmodule

