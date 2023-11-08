`timescale 1ns / 1ps
module mux_2x1_structural(
                    input a,b,sel,
                    output y
                    );
                    
wire notsel, o1, o2;

not(notsel, sel);
and(o1, sel, b);
and(o2, notsel, a);
or(y, o1, o2);

endmodule