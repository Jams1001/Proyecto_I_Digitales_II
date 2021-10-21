`timescale 1ns/1ns

`include "phy_tx.v" 
`include "phy_tx_tester.v" 
`include "generador_de_relojes.v" 

module testbench; 

	wire [31:0] input_bus;
	wire valid, reset, clk, clk2, clk4, clk32, serial_o0, serial_o1;

phy_tx phy_txINST(/*AUTOINST*/
		  // Outputs
		  .serial_o0		(serial_o0),
		  .serial_o1		(serial_o1),
		  // Inputs
		  .input_bus		(input_bus[31:0]),
		  .valid		(valid),
		  .reset		(reset),
		  .clk			(clk),
		  .clk2			(clk2),
		  .clk4			(clk4),
		  .clk32		(clk32));

phy_tx_tester phy_tx_testerINST(/*AUTOINST*/
				// Outputs
				.input_bus	(input_bus[31:0]),
				.valid		(valid),
				.reset		(reset),
				.clk		(clk),
				// Inputs
				.clk2		(clk2),
				.clk4		(clk4),
				.clk32		(clk32),
				.serial_o0	(serial_o0),
				.serial_o1	(serial_o1));

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
