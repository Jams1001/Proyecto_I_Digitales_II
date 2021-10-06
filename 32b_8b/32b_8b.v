module conv_32b_8b ( input wire clk_4f,
                input wire clk_f,
                input wire [31:0] data_in,
                input wire valid_in,
                output reg valid_out,
                output reg [7:0] data_out   
);

reg [2:0]contador; // Se crea un registro interno para tener un control de cuales 
                   // datos pasar a la salida

/*
initial begin
    contador = 0; 
end
*/

always @(posedge clk_4f)begin

    if (valid_in == 1)begin // Si valid_in está en 1 se empieza a pasar los datos
      valid_out <= valid_in; // Se pasa primero valid_in a valid_out
     if(contador == 0)begin
        data_out <= data_in [31:24]; // Primeros 8 bits a la salida
        contador = contador + 1; // Aumento del contador 
     end

     else if (contador == 1)begin
         data_out <= data_in [23:16]; // Segundos 8 bits a la salida
         contador = contador + 1; // Aumento del contador
     end

     else if (contador == 2)begin
         data_out <= data_in [15:8]; // Terceros 8 bits a la salida
         contador = contador + 1; // Aumento del contador
     end

     else if (contador == 3)begin
         data_out <= data_in [7:0]; // Últimos 8 bits a la salida
         contador = 0;  // Se reinicia el contador 
     end
    end
    else if(valid_in == 0)begin // Condición para cuando valid_in se encuentre en 0 
        valid_out <= valid_in; // Se pasa la señal de valid_in a valid_out
        data_out <= 8'b00000000;  // Se pasa una señal "basura" a data_out
        contador = 0;  // Se reinicia el contador             
    end
end
    
endmodule
