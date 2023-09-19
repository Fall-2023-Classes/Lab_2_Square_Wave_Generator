`timescale 1ns / 1ps
module square_wave_gen
    #(parameter N = 4)
    (    
        input logic clock, 
        input logic reset,
        input logic [N - 1:0] m,
        input logic [N - 1:0] n,
        output logic outsignal,
        output logic [N-1:0] max_count
    );
    
    logic [N-1:0] to_counter;
    logic done_counting, tff_out;
    
    mux uiu1 
    (
        outsignal,
        m,
        n,
        to_counter
    );
    
    upcounter uiu2 
    (    
        clock, 
        reset,
        to_counter,
        done_counting,
        max_count
    );
    
    tff uiu3 
    (
        clock, //onboard oscillator (period 10ns)
        reset,
        done_counting,
        tff_out
    );
       
    assign outsignal = tff_out;
    
endmodule
