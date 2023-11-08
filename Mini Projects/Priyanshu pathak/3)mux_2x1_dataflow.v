`timescale 1ns / 1ps

module mux_2x1_dataflow(
                    input a,b,sel,
                    output y
                        );
                        
    assign y = (~sel & a)  | (sel & b); 
                     
endmodule
