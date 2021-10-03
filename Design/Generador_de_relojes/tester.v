module tester(
    output reg CLK,
    input wire CLK2,
    input wire CLK4,
    input wire CLK8,
    input wire CLK16,
    input wire CLK32);
always #1 CLK <= ~CLK;

initial begin    
    CLK <= 0;
    end
    
initial begin
    $dumpfile("resultados.vcd");   
    $dumpvars;
    #200 $finish; 
end
endmodule