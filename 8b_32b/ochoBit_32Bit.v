module ochoBit_32Bit ( input wire clk_4f,
                input wire clk_f,
                input wire [7:0] data_in,
                input wire valid_in,
                output reg valid_out,
                output reg [31:0] data_out   
);

reg [2:0]contador;  // contador para mantener 'track' de datos a transmitir

//initial begin
  //  contador = 0;  // Inicializar contador
//end

always @(posedge clk_4f)begin  

    if (valid_in == 1)begin  // si valid_in vale 1, se pasan los datos
      valid_out <= valid_in;  
      
     if(contador == 0)begin
        data_out[31:24] <= data_in [7:0];  // pasar data in de 8b a los 8b MSB de data_out
        contador = contador + 1; 
     end

     else if (contador == 1)begin
         data_out[23:16] <= data_in [7:0];  // pasar siguiente data in a siguientes 8b de data_out
         contador = contador + 1; 
     end

     else if (contador == 2)begin
         data_out[15:8] <= data_in [7:0];  // pasar siguiente data in a siguientes 8b de data_out
         contador = contador + 1; 
     end

     else if (contador == 3)begin
         data_out[7:0] <= data_in [7:0];  // pasar siguiente data in a siguientes 8b de data_out
         contador = 0;  // contador en 0 para pasar los datos al siguiente data_out
     end
    end
    else if(valid_in == 0)begin  // si valid_in está en 0 no se pasan datos a data_out
        valid_out <= valid_in;
        data_out <= 32'bXXXXXXXX;
        contador = 0;  // se resetea contador
    end
end
    
endmodule
