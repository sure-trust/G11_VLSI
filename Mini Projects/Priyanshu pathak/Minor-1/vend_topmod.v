`timescale 1ns / 1ps
module vend_topmod(
        input clk,
        input rst,
        input [4:0]items, //one-hot(5 items)[tub, wrapper, plastic-bottle, can, packet]
        input [3:0]coins, //one-hot(4 coins)[50, 20, 10, 5]
        output [4:0] ps, //present state - to track coins(useful for testing/debugging)
        output reg [4:0] change,
        output reg rem_coins_enter 
    );
    
    parameter [4:0] s_5   = 5'b00000,
                    s_10  = 5'b00001,
                    s_15  = 5'b00010,
                    s_20  = 5'b00011,
                    s_25  = 5'b00100,
                    s_30  = 5'b00101,
                    s_35  = 5'b00110,
                    s_40  = 5'b00111,
                    s_45  = 5'b01000,
                    s_50  = 5'b01001,
                    s_55  = 5'b01010,
                    s_60  = 5'b01011,
                    s_65  = 5'b01100,
                    s_70  = 5'b01101,
                    s_75  = 5'b01110,
                    s_80  = 5'b01111,
                    s_85  = 5'b10000,
                    s_90  = 5'b10001,
                    s_95  = 5'b10010,
                    s_100 = 5'b10011,
                    s_105 = 5'b10100,
                    idle  = 5'b10101; //hex 15
          
      reg [4:0] s, ns;
      wire item_sel = | items[4:0]; //OR of all bits...if any of items[] bit is high means an item is selected
      
      always @* begin  //state trsn logic
      if(~item_sel)begin
        case (s)
            idle: begin
                if (coins[0])
                    ns <= s_5;
                else if (coins[1])
                    ns <= s_10;
                else if (coins[2])
                    ns <= s_20;
                else if (coins[3])
                    ns <= s_50;
                else
                    ns <= idle;
            end
            
            s_5: begin
                if (coins[0])
                    ns <= s_10;
                else if (coins[1])
                    ns <= s_15;
                else if (coins[2])
                    ns <= s_25;
                else if (coins[3])
                    ns <= s_55;
                else
                    ns <= s_5;
            end
            
            s_10: begin
                if (coins[0])
                    ns <= s_15;
                else if (coins[1])
                    ns <= s_20;
                else if (coins[2])
                    ns <= s_30;
                else if (coins[3])
                    ns <= s_60;
                else
                    ns <= s_10;
            end
            
            s_15: begin
                if (coins[0])
                    ns <= s_20;
                else if (coins[1])
                    ns <= s_25;
                else if (coins[2])
                    ns <= s_35;
                else if (coins[3])
                    ns <= s_65;
                else
                    ns <= s_15;
            end
            
            s_20: begin
                if (coins[0])
                    ns <= s_25;
                else if (coins[1])
                    ns <= s_30;
                else if (coins[2])
                    ns <= s_40;
                else if (coins[3])
                    ns <= s_70;
                else
                    ns <= s_20;
            end
            
            s_25: begin
                if (coins[0])
                    ns <= s_30;
                else if (coins[1])
                    ns <= s_35;
                else if (coins[2])
                    ns <= s_45;
                else if (coins[3])
                    ns <= s_75;
                else
                    ns <= s_25;
            end
            
            s_30: begin
                if (coins[0])
                    ns <= s_35;
                else if (coins[1])
                    ns <= s_40;
                else if (coins[2])
                    ns <= s_50;
                else if (coins[3])
                    ns <= s_80;
                else
                    ns <= s_30;
            end
            
            s_35: begin
                if (coins[0])
                    ns <= s_40;
                else if (coins[1])
                    ns <= s_45;
                else if (coins[2])
                    ns <= s_55;
                else if (coins[3])
                    ns <= s_85;
                else
                    ns <= s_35;
            end
            
            s_40: begin
                if (coins[0])
                    ns <= s_45;
                else if (coins[1])
                    ns <= s_50;
                else if (coins[2])
                    ns <= s_60;
                else if (coins[3])
                    ns <= s_90;
                else
                    ns <= s_40;
            end
            
            s_45: begin
                if (coins[0])
                    ns <= s_50;
                else if (coins[1])
                    ns <= s_55;
                else if (coins[2])
                    ns <= s_65;
                else if (coins[3])
                    ns <= s_95;
                else
                    ns <= s_45;
            end
            
            s_50: begin
                if (coins[0])
                    ns <= s_55;
                else if (coins[1])
                    ns <= s_60;
                else if (coins[2])
                    ns <= s_70;
                else if (coins[3])
                    ns <= s_100;
                else
                    ns <= s_50;
            end
            
            s_55: begin
                if (coins[0])
                    ns <= s_60;
                else if (coins[1])
                    ns <= s_65;
                else if (coins[2])
                    ns <= s_75;
                else if (coins[3])
                    ns <= s_105;
                else
                    ns <= s_55;
            end
            
            s_60: begin
                ns <= idle;
            end
            
            s_65: begin
                ns <= idle;
            end
            
            s_70: begin
                ns <= idle;
            end
            
            s_75: begin
                ns <= idle;
            end
            
            s_80: begin
                ns <= idle;
            end
            
            s_85: begin
                ns <= idle;
            end
            
            s_90: begin
                ns <= idle;
            end
            
            s_95: begin
                ns <= idle;
            end
            
            s_100: begin
                ns <= idle;
            end
            
            s_105: begin
                ns <= idle;
            end
            
            default: begin
                ns <= idle;
            end
        endcase
     end
     else ns <= idle;
   end


   always @ (posedge clk)
     begin
        if (rst)
            s <= idle;
        else
            s <= ns;
     end
  
 always @*
     begin
        if (item_sel)
        begin
            case (s)
                idle: begin
                    rem_coins_enter <= 1'b0;
                    change <= 4'b0;
                end
                s_5: begin
                    rem_coins_enter <= 1'b1;
                    change <= 5'b0;
                end
                s_10: begin
                    rem_coins_enter <= 1'b1;
                    change <= 5'b0;
                end
                s_15:begin
                    if (items[3])
                        rem_coins_enter <= 1'b0;
                    else
                        rem_coins_enter <= 1'b1;
                        
                    change <= 5'b0;
                end
                s_20:begin
                    if (items[3])
                        rem_coins_enter <= 1'b0;
                    else
                        rem_coins_enter <= 1'b1;
                        
                    change <= 5'b00001;
                end
                s_25:begin
                    if (items[3] | items[2])
                        rem_coins_enter <= 1'b0;
                    else
                        rem_coins_enter <= 1'b1;
                        
                    if (items[3])
                        change <= 5'b00010;
                    else if (items[2])
                        change <= 5'b00000;
                    else
                        change <= 4'b0;
                end
                s_30:begin
                    if (items[3] | items[2] | items[0])
                        rem_coins_enter <= 1'b0;
                    else
                        rem_coins_enter <= 1'b1;
                        
                    if (items[3])
                        change <= 5'b00011;
                    else if (items[2])
                        change <= 5'b00001;
                    else if (items[0])
                        change <= 5'b00000;
                    else
                        change <= 5'b00000;
                end
                s_35:begin
                    if (items[3] | items[2] | items[0])
                        rem_coins_enter <= 1'b0;
                    else
                        rem_coins_enter <= 1'b1;
                        
                    if (items[3])
                        change <= 5'b00100;
                    else if (items[2])
                        change <= 5'b00010;
                    else if (items[0])
                        change <= 5'b00001;
                    else
                        change <= 5'b00000;
                end
                s_40:begin
                    if (|items[3:0])
                        rem_coins_enter <= 1'b0;
                    else
                        rem_coins_enter <= 1'b1;
                        
                    if (items[3])
                        change <= 5'b00101;
                    else if (items[2])
                        change <= 5'b00011;
                    else if (items[0])
                        change <= 5'b00010;
                    else if (items[1])
                        change <= 5'b00000;
                    else
                        change <= 5'b00000;
                end
                s_45:begin
                    if (|items[3:0])
                        rem_coins_enter <= 1'b0;
                    else
                        rem_coins_enter <= 1'b1;
                        
                    if (items[3])
                        change <= 5'b00110;
                    else if (items[2])
                        change <= 5'b00100;
                    else if (items[0])
                        change <= 5'b00011;
                    else if (items[1])
                        change <= 5'b00001;
                    else
                        change <= 5'b00000;
                end
                s_50:begin
                    if (|items[3:0])
                        rem_coins_enter <= 1'b0;
                    else
                        rem_coins_enter <= 1'b1;
                        
                    if (items[3])
                        change <= 5'b00111;
                    else if (items[2])
                        change <= 5'b00101;
                    else if (items[0])
                        change <= 5'b00100;
                    else if (items[1])
                        change <= 5'b00010;
                    else
                        change <= 5'b00000;
                end
                s_55:begin
                    if (|items[3:0])
                        rem_coins_enter <= 1'b0;
                    else
                        rem_coins_enter <= 1'b1;
                        
                    if (items[3])
                        change <= 5'b1000;
                    else if (items[2])
                        change <= 5'b00110;
                    else if (items[0])
                        change <= 5'b00101;
                    else if (items[1])
                        change <= 5'b00011;
                    else
                        change <= 5'b00000;
                end
                s_60:begin
                        rem_coins_enter <= 1'b0;

                    if (items[3])
                        change <= 5'b01001;
                    else if (items[2])
                        change <= 5'b00111;
                    else if (items[0])
                        change <= 5'b00110;
                    else if (items[1])
                        change <= 5'b00100;
                    else if (items[4])
                        change <= 5'b00000;
                    else
                        change <= 5'b00000;
                end
                s_65:begin
                        rem_coins_enter <= 1'b0;
                        
                    if (items[3])
                        change <= 5'b01010;
                    else if (items[2])
                        change <= 5'b01000;
                    else if (items[0])
                        change <= 5'b00111;
                    else if (items[1])
                        change <= 5'b00101;
                    else if (items[4])
                        change <= 5'b00001;
                    else
                        change <= 5'b00000;
                end
                s_70:begin
                        rem_coins_enter <= 1'b0;
                    if (items[3])
                        change <= 5'b01011;
                    else if (items[2])
                        change <= 5'b01001;
                    else if (items[0])
                        change <= 5'b01000;
                    else if (items[1])
                        change <= 5'b00110;
                    else if (items[4])
                        change <= 5'b00010;
                    else
                        change <= 5'b00000;
                end
                s_75:begin
                        rem_coins_enter <= 1'b0;
                    if (items[3])
                        change <= 5'b01100;
                    else if (items[2])
                        change <= 5'b01010;
                    else if (items[0])
                        change <= 5'b01001;
                    else if (items[1])
                        change <= 5'b00111;
                    else if (items[4])
                        change <= 5'b00011;
                    else
                        change <= 5'b00000;
                end
                s_80:begin
                        rem_coins_enter <= 1'b0;  
                    if (items[3])
                        change <= 5'b01101;
                    else if (items[2])
                        change <= 5'b01011;
                    else if (items[0])
                        change <= 5'b01010;
                    else if (items[1])
                        change <= 5'b01000;
                    else if (items[4])
                        change <= 5'b00100;
                    else
                        change <= 5'b00000;
                end
                s_85:begin
                    
                        rem_coins_enter <= 1'b0;
                    
                    
                        
                    if (items[3])
                        change <= 5'b01110;
                    else if (items[2])
                        change <= 5'b01100;
                    else if (items[0])
                        change <= 5'b01011;
                    else if (items[1])
                        change <= 5'b01001;
                    else if (items[4])
                        change <= 5'b00101;
                    else
                        change <= 5'b00000;
                end
                s_90:begin
                    
                        rem_coins_enter <= 1'b0;  
                    if (items[3])
                        change <= 5'b01111;
                    else if (items[2])
                        change <= 5'b01101;
                    else if (items[0])
                        change <= 5'b01100;
                    else if (items[1])
                        change <= 5'b01010;
                    else if (items[4])
                        change <= 5'b00110;
                    else
                        change <= 5'b00000;
                end
                s_95:begin
                    
                        rem_coins_enter <= 1'b0;  
                    if (items[3])
                        change <= 5'b10000;
                    else if (items[2])
                        change <= 5'b01110;
                    else if (items[0])
                        change <= 5'b01101;
                    else if (items[1])
                        change <= 5'b01011;
                    else if (items[4])
                        change <= 5'b00111;
                    else
                        change <= 5'b00000;
                end
                s_100:begin
                    
                        rem_coins_enter <= 1'b0;  
                    if (items[3])
                        change <= 5'b10001;
                    else if (items[2])
                        change <= 5'b01111;
                    else if (items[0])
                        change <= 5'b01110;
                    else if (items[1])
                        change <= 5'b01100;
                    else if (items[4])
                        change <= 5'b01000;
                    else
                        change <= 5'b00000;
                end
                s_105:begin
                    
                        rem_coins_enter <= 1'b0;  
                    if (items[3])
                        change <= 5'b10010;
                    else if (items[2])
                        change <= 5'b10000;
                    else if (items[0])
                        change <= 5'b01111;
                    else if (items[1])
                        change <= 5'b01101;
                    else if (items[4])
                        change <= 5'b01001;
                    else
                        change <= 5'b00000;
                end
            endcase
           end
         else
        begin
         rem_coins_enter <= 1'b0;
         change <= 4'b0000;
        end
     end
     
assign ps = s;   
      
      
endmodule
