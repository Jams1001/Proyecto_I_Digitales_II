module phy_tester(
    output reg [31:0] input_bus,
    output reg valid,
    output reg reset,
    input wire clk,
    input wire clk2,
    input wire clk4,
    input [31:0] output_bus,
    output reg clk32);
    
    
    always #1 clk32 <= ~clk32;

    // Condición inicial para todas las posibles pruebas.
    initial 
    begin    
    clk32 <= 0;
    input_bus <= 32'h0000BCBC;
    valid <= 0;
    reset <= 1;
    end

    // Aquí se mandan las señales estratégicamente para cumplir con la solución.
    initial begin
    $dumpfile("phy.vcd");   
    $dumpvars;
    //@(posedge clk2)
    //valid <= 1;
    //reset <= 0;
    @(posedge clk4)
    @(posedge clk4)
    valid <= 1;
    reset <= 0;    // bajando reset en segundo posedge clk4 para ajustar señales
    @(posedge clk2)
    //reset_unstripping <= 0;  // bajar reset_unstr en 2do posedge clk2 para ajustar selector
    @(posedge clk2)
    valid <= 1;
    input_bus <= 32'hFFFFFFFF;
    @(posedge clk2)
    input_bus <= 32'hFFFFFFFF;
    @(posedge clk2)
    input_bus <= 32'hF4FFEF7F;
    @(posedge clk2)
    input_bus <= 32'hE8EEE4EE;
    @(posedge clk2)
    input_bus <= 32'hD4DDD77D;
    @(posedge clk2)
    @(posedge clk2)
    input_bus <= 32'h8CCC1CCC;
    @(posedge clk2)
    #150 $finish;    
    end
endmodule
