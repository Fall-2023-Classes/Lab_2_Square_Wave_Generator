`timescale 1ns / 1ps
module tff
    (
        input logic clk,
        input logic rst,
        input logic t,
        output logic q
    );
    
    always_ff @(posedge clk, posedge rst)
    begin
        if (rst)
            q <= 1'b0;
        else
            if (t)
                q <= ~q;
            else
                q <= q;
    end
endmodule
