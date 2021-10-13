module paralelo_serial
(
    input clk_4f,
    input clk_32f,
    input [7:0] data_in,
    input valid_in,
    input reset,
    output reg [7:0] data2send,
    output reg data_out
);
reg [2:0] selector1;
reg [2:0] selector2;
    /*always @(posedge clk_4f) 
    begin
        if (reset == 0) 
        begin
            if(valid_in == 1) 
            begin
                data2send <= data_in;
            end
            else 
            begin
                data2send <= 8'hBC;
            end
        end
        
        else 
        begin
            data2send <= 8'h00;
        end
    end*/

    always @(posedge clk_32f) 
    begin
        if (reset == 0) 
        begin
            if(valid_in == 1) 
            begin
                selector1 <= 0;
                data2send <= data_in;
                case (selector1)
                    0: data_out <= data_in[7];
                    1: data_out <= data_in[6];
                    2: data_out <= data_in[5];
                    3: data_out <= data_in[4];
                    4: data_out <= data_in[3];
                    5: data_out <= data_in[2];
                    6: data_out <= data_in[1];
                    7: 
                    begin
                        data_out <= data_in[0];
                        selector1 <= 0;
                    end
                endcase
                selector1 <= selector1 + 1;
            end
            else 
            begin
                selector2 <= 0;
                data2send <= 8'hBC;
                case (selector1)
                    0: data_out <= 1;
                    1: data_out <= 0;
                    2: data_out <= 1;
                    3: data_out <= 1;
                    4: data_out <= 1;
                    5: data_out <= 1;
                    6: data_out <= 0;
                    7: 
                    begin
                        data_out <= 0;
                        selector2 <= 0;
                    end
                endcase
                selector2 <= selector2 + 1;
            end
        end
        
        else 
        begin
            data_out <= 8'h00;
            {selector1, selector2} <= 0;
            data2send <= 8'h00;
        end
    end
endmodule