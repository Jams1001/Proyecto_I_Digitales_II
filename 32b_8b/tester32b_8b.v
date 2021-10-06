
module tester(
    output reg clk_4f,
    input wire clk_f,
    output reg [31:0] data_in,
    output reg valid_in,
    input wire valid_out,
    input wire [7:0] data_out);

// Definición del clk 
always #5 clk_4f <= ~clk_4f; 

initial begin    
    clk_4f <= 0; valid_in <= 0;
    end
    
initial begin

    $dumpfile("resultados.vcd");   
    $dumpvars;
    
    // Lista de datos a que se le pasa a cada entrada 
    @(posedge clk_f) valid_in <= 1; data_in <= 32'hFFFBBFFF;
    @(posedge clk_f)  data_in <= 32'hDDDDDDDD;
    @(posedge clk_f) valid_in <= 0; data_in <= 32'hAAAAAAAA;
    @(posedge clk_f) valid_in <= 1; data_in <= 32'hDD000003;
    @(posedge clk_f) valid_in <= 0;

    #50 $finish;
end
endmodule
