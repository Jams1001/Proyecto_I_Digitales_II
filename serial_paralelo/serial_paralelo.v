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
integer BC_counter;		// contar al tener 0xBC
reg [7:0] data2send;		
integer counter;	
reg [7:0] data2send2;

	always @(posedge clk_32f) 
	begin
		if (reset==0)begin		//sincronizar en 0
			data_out [7:0]<= 8'b00000000;
			valid_out <= 0;
			active <= 0;
			BC_counter <= 0;
			counter <= 0;
			data2send <= 0;
		end
		else 
		begin
			data2send <= {data2send[6:0], data_in};	
			if (BC_counter > 3 && counter == 1) 
			begin		
				active <= 1; //permanece en alto
				if (data2send == 8'hBC && data2send2 != 8'hBC) 
				begin 
					valid_out <= 8'h00;
				end
				else if (data2send != 8'hBC) 
				begin
					data_out <= data2send;
					valid_out <= 1;
				end
			end

			else if (data2send == 8'hBC && BC_counter < 4) 
			begin
				BC_counter <= BC_counter+1;
				valid_out <= 0;
				data_out <= 8'h00;
			end

			if (counter == 7) 
			begin
				counter <= 0;
			end
			else counter <= counter+1;	//hacer que salga data2send2 en reloj 4f
			if (counter == 1) data2send2 <= data2send;
			
		end
	end
endmodule