module phy_rx_tester(
    output reg serial_o0,
    output reg serial_o1,
    output reg clk32,
    output reg reset, 
    input wire [31:0] output_bus);
    
    
    always #1 clk32 <= ~clk32;

    // Condición inicial para todas las posibles pruebas.
    initial 
    begin    
    clk32 <= 0;
    serial_o0 <= 0;
    serial_o1 <= 0;
    reset <= 1;
    end

    // Aquí se mandan las señales estratégicamente para cumplir con la solución.
    initial begin
    $dumpfile("phy_rx.vcd");   
    $dumpvars;
    @(posedge clk32)
    reset <= 0 ;
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1; 
    @(posedge clk32) serial_o0 <= 0; serial_o1 <= 0;  
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1; 
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;  
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;
    @(posedge clk32) serial_o0 <= 0; serial_o1 <= 0; 
    @(posedge clk32) serial_o0 <= 0; serial_o1 <= 0;

    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1; 
    @(posedge clk32) serial_o0 <= 0; serial_o1 <= 0;  
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1; 
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;  
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;
    @(posedge clk32) serial_o0 <= 0; serial_o1 <= 0; 
    @(posedge clk32) serial_o0 <= 0; serial_o1 <= 0;

    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1; 
    @(posedge clk32) serial_o0 <= 0; serial_o1 <= 0;  
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1; 
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;  
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;
    @(posedge clk32) serial_o0 <= 0; serial_o1 <= 0; 
    @(posedge clk32) serial_o0 <= 0; serial_o1 <= 0;

    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1; 
    @(posedge clk32) serial_o0 <= 0; serial_o1 <= 0;  
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1; 
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;  
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;
    @(posedge clk32) serial_o0 <= 0; serial_o1 <= 0; 
    @(posedge clk32) serial_o0 <= 0; serial_o1 <= 0;

    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;  
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1; 
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;  
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1; 
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;  
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;

    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1; 
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;  
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;
    @(posedge clk32) serial_o0 <= 0; serial_o1 <= 0; 
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;  
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1; 
    @(posedge clk32) serial_o0 <= 0; serial_o1 <= 0;

    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;  
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1; 
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;  
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1; 
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;  
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;

    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1; 
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;  
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;
    @(posedge clk32) serial_o0 <= 0; serial_o1 <= 0; 
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;  
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1; 
    @(posedge clk32) serial_o0 <= 0; serial_o1 <= 0;

    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1; 
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;  
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;
    @(posedge clk32) serial_o0 <= 0; serial_o1 <= 0; 
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;  
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1; 
    @(posedge clk32) serial_o0 <= 0; serial_o1 <= 0;
  
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1; 
    @(posedge clk32) serial_o0 <= 0; serial_o1 <= 0;  
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1; 
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;  
    @(posedge clk32) serial_o0 <= 1; serial_o1 <= 1;
    @(posedge clk32) serial_o0 <= 0; serial_o1 <= 0; 
    @(posedge clk32) serial_o0 <= 0; serial_o1 <= 0;
    #100 $finish;    
    end
endmodule
