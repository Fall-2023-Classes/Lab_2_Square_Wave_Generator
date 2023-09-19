`timescale 1ns / 1ps
module mux    
    #(parameter N = 4)
    (
        input bit sel,
        input logic [N - 1:0] m,
        input logic [N - 1:0] n,
        output logic [N - 1:0] to_counter
    );
    
    always_comb
    begin
        case(sel)
            1'b0: to_counter <= n;
            1'b1: to_counter <= m;
            default: to_counter = 4'b1111;
        endcase
    end
endmodule
