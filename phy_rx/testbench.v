`timescale 1ns/1ns

`include "phy_rx.v" 
`include "phy_rx_tester.v"
`include "generador_de_relojes.v"

module testbench; 

	wire [31:0] output_bus;
	wire valid, reset, clk, clk2, clk4, clk32, serial_o0, serial_o1;

phy_rx phy_rxINST(/*AUTOINST*/
		  // Outputs
		  .output_bus		(output_bus[31:0]),
		  // Inputs
		  .serial_o0		(serial_o0),
		  .serial_o1		(serial_o1),
		  .reset		(reset),
		  .clk			(clk),
		  .clk2			(clk2),
		  .clk4			(clk4),
		  .clk32		(clk32));

phy_rx_tester phy_rx_testerINST(/*AUTOINST*/
				// Outputs
				.serial_o0	(serial_o0),
				.serial_o1	(serial_o1),
				.clk32		(clk32),
				.reset		(reset),
				// Inputs
				.output_bus	(output_bus[31:0]));

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
