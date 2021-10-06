`timescale 1ns/1ns

`include "generador_de_relojes.v" 
`include "tester.v" 

module testbench; 

	wire CLK, CLK2, CLK4, CLK8, CLK16, CLK32; 

generador_de_relojes generador_de_relojesINST(/*AUTOINST*/
					      // Outputs
					      .CLK2		(CLK2),
					      .CLK4		(CLK4),
					      .CLK8		(CLK8),
					      .CLK16		(CLK16),
					      .CLK32		(CLK32),
					      // Inputs
					      .CLK		(CLK));

tester testerINST(/*AUTOINST*/
		  // Outputs
		  .CLK			(CLK),
		  // Inputs
		  .CLK2			(CLK2),
		  .CLK4			(CLK4),
		  .CLK8			(CLK8),
		  .CLK16		(CLK16),
		  .CLK32		(CLK32));

endmodule
