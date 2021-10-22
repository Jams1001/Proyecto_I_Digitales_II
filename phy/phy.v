`include "phy_rx.v"
`include "phy_tx.v"

module phy(
    input  [31:0] input_bus,
    input  valid,
    input  reset, 
    input  clk,
    input  clk2,
    input  clk4,
    input  clk32,

    output [31:0] output_bus
);

// cables internos
wire serial_o0, serial_o1;

phy_tx transmisor(/*AUTOINST*/
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

phy_rx receptor(/*AUTOINST*/
		// Outputs
		.output_bus		(output_bus[31:0]),
		// Inputs
		.serial_o0		(serial_o0),
		.serial_o1		(serial_o1),
		.reset			(reset),
		.clk			(clk),
		.clk2			(clk2),
		.clk4			(clk4),
		.clk32			(clk32));

endmodule
