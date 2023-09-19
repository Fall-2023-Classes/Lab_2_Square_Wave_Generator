`timescale 1ns / 1ps
module upcounter
    #(parameter N = 4)
    (    
        input logic clk, 
        input logic rst,
        input logic [N - 1:0] num,
        output logic max_tick,
        output logic [N - 1:0] q
    );
        
    logic [7:0] r_next, r_reg;
    
    always_ff @(posedge clk, posedge rst)
    begin
        if (rst)
            r_reg <= 0;
        else
            r_reg <= r_next;
    end
    
    assign r_next = (r_reg == (num*10)-1) ? 0: r_reg + 1;
                                   
    assign q = num;
    
    assign max_tick = (r_reg == (num*10)-1) ? 1'b1: 1'b0;
endmodule