`timescale 1ns/1ns

`include "ochoBit_32Bit.v" 
`include "tester8b_32b.v" 
`include "generador_relojes.v"

module testbench; 

	wire clk_f, clk_4f, valid_in, valid_out; 
    wire [7:0] data_in;
    wire [31:0] data_out;

ochoBit_32Bit convertidor(/*AUTOINST*/
			// Outputs
			.valid_out	(valid_out),
			.data_out	(data_out[31:0]),
			// Inputs
			.clk_4f		(clk_4f),
			.clk_f		(clk_f),
			.data_in	(data_in[7:0]),
			.valid_in	(valid_in));

tester8b_32b tester1(/*AUTOINST*/
		     // Outputs
		     .clk_4f		(clk_4f),
		     .data_in		(data_in[7:0]),
		     .valid_in		(valid_in),
		     // Inputs
		     .clk_f		(clk_f),
		     .valid_out		(valid_out),
		     .data_out		(data_out[31:0]));

generador_de_relojes generador_de_relojesINST(
					      .CLK4		(clk_f),  // Salida CLK4 (cuatro veces periodo de CLK)
					      .CLK		(clk_4f)); // CLK con frec*4 es entrada de generador
endmodule

