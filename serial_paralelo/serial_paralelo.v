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
			/*case (selector1)
				0: data2send[7] <= data_in;
				1: data2send[6] <= data_in;
				2: data2send[5] <= data_in;
				3: data2send[4] <= data_in;
				4: data2send[3] <= data_in;
				5: data2send[2] <= data_in;
				6: data2send[1] <= data_in;
				7: 
				begin
					data2send[0] <= data_in;
					selector1 <= 0;
				end
			endcase
			selector1 <= selector1 + 1;*/


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
    end
endmodule