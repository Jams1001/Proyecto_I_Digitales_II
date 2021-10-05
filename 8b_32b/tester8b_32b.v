//`include "generador_relojes.v"

module tester8b_32b(
    output reg clk_4f,
    input wire clk_f,
    output reg [7:0] data_in,
    output reg valid_in,
    input wire valid_out,
    input wire [31:0] data_out);


always #5 clk_4f <= ~clk_4f;

initial begin    
    clk_4f <= 0;
    end
    
initial begin
    $dumpfile("resultados.vcd");   
    $dumpvars;
    
    // Generación de datos de entrada de 8bits, que cambian con reloj 4f
    @(posedge clk_4f) valid_in <= 1; data_in <= 8'hFF; 
    @(posedge clk_4f) valid_in <= 1; data_in <= 8'hFF;
    @(posedge clk_4f) valid_in <= 1; data_in <= 8'hFF;
    @(posedge clk_4f) valid_in <= 1; data_in <= 8'hFF;
    @(posedge clk_4f)  data_in <= 8'hDD;
    @(posedge clk_4f)  data_in <= 8'hDD;
    @(posedge clk_4f)  data_in <= 8'hDD;
    @(posedge clk_4f)  data_in <= 8'hDD;
    @(posedge clk_4f) valid_in <= 0; data_in <= 8'hAA;
    @(posedge clk_4f) valid_in <= 0; data_in <= 8'hAA;
    @(posedge clk_4f) valid_in <= 0; data_in <= 8'hAA;
    @(posedge clk_4f) valid_in <= 0; data_in <= 8'hAA;

    @(posedge clk_4f) valid_in <= 1; data_in <= 8'h00;
    @(posedge clk_4f) valid_in <= 1; data_in <= 8'h00;
    @(posedge clk_4f) valid_in <= 1; data_in <= 8'h00;
    @(posedge clk_4f) valid_in <= 1; data_in <= 8'h03;

    @(posedge clk_4f) valid_in <= 0;

    #70 $finish;
end
endmodule