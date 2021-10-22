`include "un_striping.v"
`include "serial_paralelo.v" 
`include "ochoBit_32Bit.v"

module phy_rx(
    input serial_o0,
    input serial_o1,
    input  reset, 
	input  clk, 
    input  clk2,
    input  clk4,
    input  clk32,
    output [31:0] output_bus);

wire [31:0] lane_0_rx, lane_1_rx;
wire  [7:0] paralelo0, paralelo1;  	// salida de serial paralelo
wire valid_0, valid_1;				// para pasar bits de valid a unstripping
wire validS_0, validS_1;			// Para bits de serial a 8-32

serial_paralelo serial_paraleloINST0(/*AUTOINST*/
				    // Outputs
				    //.active		(active),
				    .valid_out		(validS_0),
				    .data_out		(paralelo0[7:0]),
				    // Inputs
				    .clk_4f		(clk4),
				    .clk_32f		(clk32),
				    .reset		(reset),
				    .data_in		(serial_o0));
serial_paralelo serial_paraleloINST1(/*AUTOINST*/
				     // Outputs
				     //.active		(active),
				     .valid_out		(validS_1),
				     .data_out		(paralelo1[7:0]),
				     // Inputs
				     .clk_4f		(clk4),
				     .clk_32f		(clk32),
				     .reset		(reset),
				     .data_in		(serial_o1));

ochoBit_32Bit ochoBit_32BitINST0(/*AUTOINST*/
				 // Outputs
				 .valid_out		(valid_0),
				 .data_out		(lane_0_rx[31:0]),
				 // Inputs
				 .clk_4f		(clk4),
				 .clk_f			(clk),
				 .data_in		(paralelo0[7:0]),
				 .valid_in		(validS_0));

ochoBit_32Bit ochoBit_32BitINST1(/*AUTOINST*/
				 // Outputs
				 .valid_out		(valid_1),
				 .data_out		(lane_1_rx[31:0]),
				 // Inputs
				 .clk_4f		(clk4),
				 .clk_f			(clk),
				 .data_in		(paralelo1[7:0]),
				 .valid_in		(validS_1));

un_striping un_stripingINST(/*AUTOINST*/
			    // Outputs
			    .data_out		(output_bus[31:0]),
			    //.valid_out		(valid_out),
			    // Inputs
			    .clk_2f		(clk2),
			    .lane_0		(lane_0_rx[31:0]),
			    .lane_1		(lane_1_rx[31:0]),
			    .valid_0		(valid_0),
			    .valid_1		(valid_1),
			    .reset		(reset));


endmodule
