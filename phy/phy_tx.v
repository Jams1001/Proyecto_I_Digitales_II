`include "striping.v"
`include "paralelo_serial.v"
`include "conv_32b_8b.v"


module phy_tx(
    input  [31:0] input_bus,
    input  valid,
    input  reset,
    input  clk,
    input  clk2,
    input  clk4,
    input  clk32,
    output serial_o0,
    output serial_o1);

    wire [31:0] lane_0, lane_1;
    wire  [7:0] data_out0, data_out1;
	wire valid_lane0, valid_lane1;  // para valid_out que sale de cada lane
	wire valid_32_0, valid_32_1;

    striping stripingINST(/*AUTOINST*/
			// Outputs
			.lane_0		    (lane_0[31:0]),
			.lane_1		    (lane_1[31:0]),
			.valid_0		(valid_lane0),
			.valid_1		(valid_lane1),
			// Inputs
			.clk_2f		    (clk2),
			.data_in		(input_bus[31:0]),
			.valid_in		(valid),
			.reset		    (reset));
    conv_32b_8b conv_32b_8bINST0(/*AUTOINST*/
			// Outputs
			.valid_out		(valid_32_0),
			.data_out		(data_out0[7:0]),
			// Inputs
			.clk_4f		    (clk4),
			.clk_f			(clk),
			.data_in		(lane_0[31:0]),
			.valid_in		(valid_lane0));
			
    conv_32b_8b conv_32b_8bINST1(/*AUTOINST*/
			// Outputs
			.valid_out		(valid_32_1),
			.data_out		(data_out1[7:0]),
			// Inputs
			.clk_4f		    (clk4),
			.clk_f			(clk),
			.data_in		(lane_1[31:0]),
			.valid_in		(valid_lane1));
    paralelo_serial paralelo_serialINST0(/*AUTOINST*/
			// Outputs
			//.data2send	(data2send[7:0]),
			.data_out		(serial_o0),
			// Inputs
			.clk_4f		    (clk4),
			.clk_32f		(clk32),
			.data_in		(data_out0[7:0]),
			.valid_in		(valid_32_0),
			.reset			(reset));
    paralelo_serial paralelo_serialINST1(/*AUTOINST*/
		     // Outputs
		     //.data2send	(data2send[7:0]),
		     .data_out		(serial_o1),
		     // Inputs
		     .clk_4f		(clk4),
		     .clk_32f		(clk32),
		     .data_in		(data_out1[7:0]),
		     .valid_in		(valid_32_1),
		     .reset			(reset));
endmodule
