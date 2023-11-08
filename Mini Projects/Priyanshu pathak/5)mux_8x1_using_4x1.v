`timescale 1ns / 1ps
module mux_8x1_using_4x1( 
                        input [7:0]a, 
                        input [2:0]sel,
                        output y
                        );
       wire w1, w2;
       mux4x1 inst0(a[0], a[1], a[2], a[3], sel[1:0], ~sel[2], w1);
       mux4x1 inst1(a[4], a[5], a[6], a[7], sel[1:0], sel[2], w2);
       assign y = w1 | w2;
endmodule


//------------------
module mux4x1(
             input a,b,c,d,[1:0]sel,en,
             output y
                    );
 wire o1, o2, o3, o4;
 
 assign o1 = ~sel[0] & ~sel[1] & en & a;
  assign o2 = sel[0] & ~sel[1] & en & b;
  assign o3 = ~sel[0] & sel[1] & en & c;
  assign o4 = sel[0] & sel[1] & en & d;
  
  assign y = o1 | o2 | o3 | o4;
  
 endmodule
