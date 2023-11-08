`timescale 1ns / 1ps
module mux_2x1_ternery(
                    input a,b,sel,
                    output y
                    );
                    
   assign y = sel ? b : a;
   
 endmodule