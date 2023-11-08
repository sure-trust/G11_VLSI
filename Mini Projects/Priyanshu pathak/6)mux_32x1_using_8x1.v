module mux_32x1_using_8x1(
                           input [31:0]a,
                           input [4:0]sel,
                           output y
                           );
                           
             wire en0, en1, en2, en3, o0, o1, o2, o3;
             
          assign en0 = ~sel[3] & ~sel[4];
          assign en1 =  sel[3] & ~sel[4];
          assign en2 = ~sel[3] &  sel[4];
          assign en3 =  sel[3] &  sel[4];
                 
                      
       mux8x1 inst0(a[7:0], sel[2:0], en0, o0);
       mux8x1 inst1(a[15:8], sel[2:0], en1, o1);
       mux8x1 inst2(a[23:16], sel[2:0], en2, o2);
       mux8x1 inst3(a[31:24], sel[2:0], en3, o3);
       
       assign y = o0 | o1 | o2 | o3;

endmodule


//--------------------
module mux8x1( 
                        input [7:0]a, 
                        input [2:0]sel,
                        input en,
                        output reg y
                        );

  always @* begin
   if(en) begin
    case(sel)
    3'b000 : y = a[0];
    3'b001 : y = a[1];
    3'b010 : y = a[2];
    3'b011 : y = a[3];
    3'b100 : y = a[4];
    3'b101 : y = a[5];
    3'b110 : y = a[6];
    3'b111 : y = a[7];
     endcase
    end
   else 
    y = 0;
    end
 endmodule
 
 