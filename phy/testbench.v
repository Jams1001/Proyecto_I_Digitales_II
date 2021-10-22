`timescale 1ns/1ns
`include "phy.v"
`include "phy_synth.v" 
`include "phy_tester.v" 
`include "generador_de_relojes.v"

module testbench; 

	wire [31:0] input_bus, output_bus, output_bus_synth;
	wire valid, reset, clk, clk2, clk4, clk32;


phy phyINST(/*AUTOINST*/
	    // Outputs
	    .output_bus			(output_bus[31:0]),
	    // Inputs
	    .input_bus			(input_bus[31:0]),
	    .valid			(valid),
	    .reset			(reset),
	    .clk			(clk),
	    .clk2			(clk2),
	    .clk4			(clk4),
	    .clk32			(clk32));

phy_synth phyINST_synth(/*AUTOINST*/
	    // Outputs
	    .output_bus			(output_bus_synth[31:0]),
	    // Inputs
	    .input_bus			(input_bus[31:0]),
	    .valid			(valid),
	    .reset			(reset),
	    .clk			(clk),
	    .clk2			(clk2),
	    .clk4			(clk4),
	    .clk32			(clk32));


phy_tester testerINST(/*AUTOINST*/
		      // Outputs
		      .input_bus	(input_bus[31:0]),
		      .valid		(valid),
		      .reset		(reset),
		      .clk32		(clk32),
		      // Inputs
		      .clk		(clk),
		      .clk2		(clk2),
		      .clk4		(clk4),
		      .output_bus	(output_bus[31:0]),
			  .output_bus_synth	(output_bus_synth[31:0]));

generador_de_relojes generador_de_relojesINST(/*AUTOINST*/
					      // Outputs
					      //.CLK16		(CLK16),
					      //.CLK8		(CLK8),
					      .CLK4		(clk4),
					      .CLK2		(clk2),
					      .CLK		(clk),
					      // Inputs
					      .CLK32		(clk32));

endmodule

