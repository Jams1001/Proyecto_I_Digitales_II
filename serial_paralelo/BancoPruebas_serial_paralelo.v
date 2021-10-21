`timescale 1ns/1ns
`include "serial_paralelo.v"
`include "probador_serial_paralelo.v"
`include "serial_paralelo_synth.v"
module BancoPruebas_serial_paralelo();
//wire [7:0] data2send;
wire [7:0] data_out,data_out_synth;
wire clk_4f, clk_32f, valid_out, data_in, reset, active, active_synth,valid_out_synth;
        serial_paralelo serial_paralelobp(/*AUTOINST*/
            // Outputs
            .active		    (active),
            .valid_out		(valid_out),
            .data_out		(data_out[7:0]),
            //.data2send      (data2send[7:0]),
            // Inputs
            .reset		    (reset),
            .clk_4f		    (clk_4f),
            .clk_32f		(clk_32f),
            .data_in		(data_in));
		serial_paralelo_synth serial_paralelo_synthbp(/*AUTOINST*/
            // Outputs
            .active		    (active_synth),
            .data_out		(data_out_synth[7:0]),
            //.data2send      (data2send_synth[7:0]),
            .valid_out		(valid_out_synth),
            // Inputs
            .clk_32f		(clk_32f),
            .clk_4f		    (clk_4f),
            .data_in		(data_in),
            .reset		    (reset));
		probador_serial_paralelo probador_serial_paralelobp(/*AUTOINST*/
            // Outputs
            .reset		        (reset),
            .data_in		    (data_in),
            .clk_4f		        (clk_4f),
            .clk_32f		    (clk_32f),
            // Inputs
            //.data2send          (data2send[7:0]),
           // .data2send      (data2send_synth[7:0]),
            .data_out		    (data_out[7:0]),
            .active		        (active),
            .valid_out		    (valid_out),
            .data_out_synth	    (data_out_synth[7:0]),
            .active_synth	    (active_synth),
            .valid_out_synth    (valid_out_synth));
endmodule