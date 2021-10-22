module serial_paralelo
(
	input clk_4f,
	input clk_32f,
    input reset,
	input data_in,
	output reg active, //activa cuando BC counter = 4
	output reg valid_out, //activo BC_counter>4 y data2send != 0xBC
	output reg [7:0] data_out
);
integer BC_counter;		//contador de BCs
reg [7:0] data2send;		//guardo mensaje de interés y solo leo en caso importantes
integer counter;		//Contador de 0 a 7 para ir sacando valores
reg [7:0] data2send2;


	always @(posedge clk_32f) begin
		if (reset==1)begin			//Inicializa
			data_out [7:0]<= 8'b00000000;
			valid_out <= 0;
			active <= 0;
			BC_counter <= 0;
			counter <= 0;
			data2send <= 0;
		end
		else if (reset==0) begin
			data2send <= {data2send[6:0], data_in};
			
			if (BC_counter == 4 && counter == 1) 
			begin		//Si BC counter en 4, saca los datos cuando contador llega a 0
				active <= 1;
				if (data2send == 8'hBC && data2send2 != 8'hBC) 
				begin 
					valid_out <= 0;
				end
				else if (data2send != 8'hBC) begin
					data_out <= data2send;
					valid_out <= 1;
				end
			end


			else if (data2send == 8'hBC && BC_counter < 4) 
			begin
				BC_counter <= BC_counter+1;
				valid_out <= 0;
				data_out <= 0;
			end

			else if (data2send != 8'hBC && BC_counter < 4) 
			begin
				active <=0;
				valid_out <= 0;
				data_out <= 0;
			end

			if (counter == 7) begin
				counter <= 0;
			end
			else counter <= counter+1;					// va de 0-7 en un ciclo de 4f
			
			if (counter == 1) data2send2 <= data2send;
		end
	end







/*
reg [7:0] data2send;
reg [3:0] BC_counter; 
reg [3:0] selector1;



    always @(posedge clk_32f) 
    begin
		if (reset==0)
        begin	//importante para sincronizar
			data_out [7:0]<= 8'b00000000;
			valid_out <= 0;
			active <= 0;
			BC_counter <= 4'b0000;
			//counter <= 0;
			data2send <= 8'b00000000;
			//selector1 <= 4'b0000;
		end
        else
        begin
			data2send <= {data2send[6:0], data_in};
			

			if(data2send==8'hBC && BC_counter < 4'b0100)
			begin
				BC_counter <= BC_counter + 1;
				active <= 0;
				valid_out <= 0;
				data_out <= 8'h00;
			end

			else if(data2send==8'hBC && BC_counter >= 4'b0100)
			begin
				active <= 1;
				valid_out <= 0;
				data_out <= 8'h00;
			end
			else if(data2send!=8'hBC && BC_counter >= 4'b0100)
			begin
				active <= 1;
				valid_out <= 1;
				data_out <= data2send;
			end
        end
    end*/
endmodule