module paralelo_serial(input clk_4f,
                        input clk_32f,
                        input [7:0] data_demux_32_8,
                        input valid_demux_32_8,
                        input reset,
                        output reg data_paralelo_serial);

    reg [2:0] selector;
    reg [2:0] selector_2;

    always @(posedge clk_32f) begin

        if (reset == 1) begin
            if(valid_demux_32_8 == 1) begin
                selector <= 0;
                case (selector_2)
                    0: data_paralelo_serial <= data_demux_32_8[7];
                    1: data_paralelo_serial <= data_demux_32_8[6];
                    2: data_paralelo_serial <= data_demux_32_8[5];
                    3: data_paralelo_serial <= data_demux_32_8[4];
                    4: data_paralelo_serial <= data_demux_32_8[3];
                    5: data_paralelo_serial <= data_demux_32_8[2];
                    6: data_paralelo_serial <= data_demux_32_8[1];
                    7: begin
                        data_paralelo_serial <= data_demux_32_8[0];
                        selector_2 <= 0;
                    end
                endcase
                selector_2 <= selector_2 + 1;
            end
            else begin
                selector_2 <= 0;
                case (selector)
                    0: data_paralelo_serial <= 1;
                    1: data_paralelo_serial <= 0;
                    2: data_paralelo_serial <= 1;
                    3: data_paralelo_serial <= 1;
                    4: data_paralelo_serial <= 1;
                    5: data_paralelo_serial <= 1;
                    6: data_paralelo_serial <= 0;
                    7: begin
                        data_paralelo_serial <= 0;
                        selector <= 0;
                    end
                endcase
                selector <= selector + 1;
            end
        end
        
        else begin
            data_paralelo_serial <= 0;
            {selector, selector_2} <= 0;
        end
    end
endmodule