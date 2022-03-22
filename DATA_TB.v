`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:31:21 12/17/2020
// Design Name:   datapath
// Module Name:   C:/.Xilinx/xilinx/P5/DATA_TB.v
// Project Name:  P5
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: datapath
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DATA_TB;

	// Inputs
	reg clk;
	reg rst;
	reg BRANCH;
	reg [1:0] NPC_SEL_D;
	reg en_pc;
	reg en_fd;
	reg [1:0] A3_SEL_D;
	reg [2:0] WD_SEL_D;
	reg WE_D;
	reg A_SEL_D;
	reg EXT_SEL_D;
	reg [2:0] B_SEL_D;
	reg [3:0] ALU_SEL_D;
	reg SW_D;
	reg LW_D;
	reg bne;
	reg blez;
	reg bgtz;
	reg bltz;
	reg bgez;
	reg beq;
	reg stall;

	// Instantiate the Unit Under Test (UUT)
	datapath uut (
		.clk(clk), 
		.rst(rst), 
		.BRANCH(BRANCH), 
		.NPC_SEL_D(NPC_SEL_D), 
		.en_pc(en_pc), 
		.en_fd(en_fd), 
		.A3_SEL_D(A3_SEL_D), 
		.WD_SEL_D(WD_SEL_D), 
		.WE_D(WE_D), 
		.A_SEL_D(A_SEL_D), 
		.EXT_SEL_D(EXT_SEL_D), 
		.B_SEL_D(B_SEL_D), 
		.ALU_SEL_D(ALU_SEL_D), 
		.SW_D(SW_D), 
		.LW_D(LW_D), 
		.bne(bne), 
		.blez(blez), 
		.bgtz(bgtz), 
		.bltz(bltz), 
		.bgez(bgez), 
		.beq(beq), 
		.stall(stall)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		BRANCH = 0;
		NPC_SEL_D = 0;
		en_pc = 0;
		en_fd = 0;
		A3_SEL_D = 0;
		WD_SEL_D = 0;
		WE_D = 0;
		A_SEL_D = 0;
		EXT_SEL_D = 0;
		B_SEL_D = 0;
		ALU_SEL_D = 0;
		SW_D = 0;
		LW_D = 0;
		bne = 0;
		blez = 0;
		bgtz = 0;
		bltz = 0;
		bgez = 0;
		beq = 0;
		stall = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
    always #20 clk = ~clk;  
endmodule

