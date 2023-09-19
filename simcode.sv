`timescale 1ns / 1ps
module simcode
    #(parameter R = 4)
    ();
    
    logic clck; 
    logic resetsw;
    logic [R - 1:0] a;
    logic [R - 1:0] b;
    logic out;
    logic [R-1:0] maxcount;
    
    always
    begin
        clck = 1'b0;
        #1;
        clck = 1'b1;
        #1;
    end
    
    square_wave_gen uut1 (clck, resetsw, a, b, out, maxcount);
    
    initial
    begin
        resetsw = 1'b1;
        #10
        resetsw = 1'b0;
        a = 4'b0001;
        b = 4'b0001;
    end
    
endmodule
