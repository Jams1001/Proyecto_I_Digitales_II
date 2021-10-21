module serial_paralelo
(
	input clk_4f,
	input clk_32f,
    input reset,
	input data_in,
	output reg active, //activa cuando BC counter = 4
	output reg valid_out,
	//output reg [7:0] data2send,
	output reg [7:0] data_out
	);

    integer BC_counter;		//contador de BCs
	
	//integer counter;		//Contador de 0 a 7 para ir sacando valores
	reg [7:0] data2send2;

    always @(posedge clk_32f) 
    begin
		if (reset==0)
        begin	//importante para sincronizar
			data_out [7:0]<= 8'b00000000;
			valid_out <= 0;
			active <= 0;
			BC_counter <= 0;
			//counter <= 0;
			data2send <= 0;
		end
        else
        begin
			BC_counter <= 0;
			data2send <= {data2send[6:0], data_in};
			if(data2send==8'hBC && BC_counter < 4)
			begin
				BC_counter <= BC_counter + 1;
				active <= 0;
				valid_out <= 0;
				valid_out <= 8'h00;
			end

			else if(data2send==8'hBC && BC_counter >= 4)
			begin
				active <= 1;
				valid_out <= 0;
				valid_out <= 8'h00;
			end
			else if(data2send!=8'hBC && BC_counter >= 4)
			begin
				active <= 1;
				valid_out <= 1;
				valid_out <= data2send;
			end
        end
    end
endmodule