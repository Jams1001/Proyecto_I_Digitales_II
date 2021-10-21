`timescale 1ns/1ns

`include "paralelo_serial.v"
`include "probador_paralelo_serial.v"
`include "paralelo_serial_synth.v"

module BancoPruebas_paralelo_serial;
    wire [7:0] data2send, data_in, data2send_synth;
    wire clk_4f, clk_32f, valid_in, data_out, data_out_synth, reset;

    paralelo_serial paralelo_serialbp(/*AUTOINST*/
            // Outputs
            .data2send		(data2send[7:0]),
            .data_out		(data_out),
            // Inputs
            .clk_4f		    (clk_4f),
            .clk_32f		(clk_32f),
            .data_in		(data_in[7:0]),
            .valid_in		(valid_in),
            .reset		    (reset));

    
    paralelo_serial_synth paralelo_serial_synthbp(/*AUTOINST*/
            // Outputs
            .data2send      (data2send_synth[7:0]),
            .data_out       (data_out_synth),
            // Inputs
            .clk_32f		(clk_32f),
            .clk_4f		    (clk_4f),
            .data_in		(data_in[7:0]),
            .reset		    (reset),
            .valid_in	    (valid_in));


    probador_paralelo_serial probador_paralelo_serialbp(/*AUTOINST*/
            // Outputs
            .reset		        (reset),
            .valid_in		    (valid_in),
            .data_in		    (data_in[7:0]),
            .clk_4f		        (clk_4f),
            .clk_32f		    (clk_32f),
            // Inputs
            .data2send	        (data2send[7:0]),
            .data2send_synth    (data2send_synth[7:0]),
            .data_out		    (data_out),
            .data_out_synth     (data_out_synth));
endmodule