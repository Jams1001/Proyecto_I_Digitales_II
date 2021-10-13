`timescale 1ns/1ns

`include "32b_8b_estruc.v" 
`include "32b_8b.v" 
`include "tester32b_8b.v" 
`include "generador_relojes.v"

module testbench; 

	wire clk_f, clk_4f, valid_in, valid_out; 
    wire [31:0] data_in;
    wire [7:0] data_out, data_out_estruc ;

// Instancia utilizando modelo conductual 
conv_32b_8b convertidor1(
					      .clk_f		(clk_f),
					      .clk_4f		(clk_4f),
                          .data_in  (data_in),
                          .data_out  (data_out),
                          .valid_in  (valid_in),
                          .valid_out  (valid_out));

// Instancia utilizando modelo estructural sintetizado
conv_32b_8b_estruc convertidor2(
					      .clk_f		(clk_f),
					      .clk_4f		(clk_4f),
                          .data_in  (data_in),
                          .data_out  (data_out_estruc),
                          .valid_in  (valid_in),
                          .valid_out  (valid_out));

// Instancia para el tester 
tester tester1(
					      .clk_f		(clk_f),
					      .clk_4f		(clk_4f),
                          .data_in  (data_in),
                          .data_out  (data_out),
                          .valid_in  (valid_in),
                          .valid_out  (valid_out));

// Instancia para el generador de relojes
// Se seleccionan solamente las señales necesarias 
generador_de_relojes generador_de_relojesINST(

					      .CLK4		(clk_f),
					      .CLK		(clk_4f));
endmodule

