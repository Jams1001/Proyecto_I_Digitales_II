module flipflop_t(
    input wire T, CLK,
    output reg Q);
    
    initial begin    
    Q <= 1'b0;
    end
	always @(posedge CLK) begin
        if (T) begin
            Q <= ~Q;
        end  
        else begin
            Q <= Q;
        end 
    end
endmodule

module generador_de_relojes( 
    input wire CLK,
    output wire CLK2, CLK4, CLK8, CLK16, CLK32);

    wire EN1;
    wire EN2;
    wire EN3;
    wire EN4;

    and and0(EN1, CLK2, 1'b1);
    and and0(EN2, CLK4, EN1);
    and and0(EN3, CLK8, EN2);
    and and0(EN4, CLK16, EN3);

    flipflop_t ff0(.T(1'b1), .CLK(CLK), .Q(CLK2));
    flipflop_t ff1(.T(EN1), .CLK(CLK), .Q(CLK4));
    flipflop_t ff2(.T(EN2), .CLK(CLK), .Q(CLK8));
    flipflop_t ff3(.T(EN3), .CLK(CLK), .Q(CLK16));
    flipflop_t ff4(.T(EN4), .CLK(CLK), .Q(CLK32));

endmodule
