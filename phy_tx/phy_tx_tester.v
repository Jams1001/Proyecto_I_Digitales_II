module phy_tx_tester(
    output reg [31:0] input_bus,
    output reg valid,
    output reg reset,
    input wire clk,
    input wire clk2,
    input wire clk4,
    output reg clk32,
    input wire serial_o0,
    input wire serial_o1,
    input wire serial_o0_synth,
    input wire serial_o1_synth);
    
    
    always #1 clk32 <= ~clk32;

    // Condición inicial para todas las posibles pruebas.
    initial 
    begin    
    clk32 <= 0;
    input_bus <= 32'h0;
    valid <= 0;
    reset <= 1;
    end

    // Aquí se mandan las señales estratégicamente para cumplir con la solución.
    initial begin
    $dumpfile("phy_tx.vcd");   
    $dumpvars;
    @(posedge clk2)
    valid <= 1;
    reset <= 0;
    @(posedge clk2)
    @(posedge clk2)
    input_bus <= 32'hF4FFEF7F;
    @(posedge clk2)
    @(posedge clk2)
    input_bus <= 32'hE8EEE4EE;
    @(posedge clk2)
    @(posedge clk2)
    input_bus <= 32'hD4DDD77D;
    @(posedge clk2)
    @(posedge clk2)
    input_bus <= 32'h8CCC1CCC;
    @(posedge clk2)
    #30 $finish;    
    end
endmodule
