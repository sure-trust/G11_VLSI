`timescale 1ns / 1ps

module vending_machine_top(
    input clk,
    input rst,
    input [3:0] coin,
    input [4:0] item,
    output reg [4:0] change_coins,
    output reg enter_more_coins,
    output [4:0] state_current
    );
    
    // States travelled when coins are recieved
    parameter [4:0] state_5  = 5'b00000,
                    state_10 = 5'b00001,
                    state_15 = 5'b00010,
                    state_20 = 5'b00011,
                    state_25 = 5'b00100,
                    state_30 = 5'b00101,
                    state_35 = 5'b00110,
                    state_40 = 5'b00111,
                    state_45 = 5'b01000,
                    state_50 = 5'b01001,
                    state_55 = 5'b01010,
                    state_60 = 5'b01011,
                    state_65 = 5'b01100,
                    state_70 = 5'b01101,
                    state_75 = 5'b01110,
                    state_80 = 5'b01111,
                    state_85 = 5'b10000,
                    state_90 = 5'b10001,
                    state_95 = 5'b10010,
                    state_100 = 5'b10011,
                    state_105 = 5'b10100,
                    idle      = 5'b10101;
                    
        reg [4:0] state, next_state;
     
//      Signal Description
//      item
//      item is a 5-bit input, used one-hot encoding for items
//      item[4] <= Pastic tub           50
//      item[3] <= wrapper              15
//      item[2] <= plastic bottle       25
//      item[1] <= can                  40
//      item[0] <= packet               30

//      coin
//      coin is a 4-bit input, used one-hot encoding for coin detection
//      coin[3] <= 50
//      coin[2] <= 20
//      coin[1] <= 10
//      coin[0] <= 5
     
     // Thi signal indicates, an item has been selected and when selected, enter_coin signal should go low               
     wire item_selected = item[4] | item[3] | item[2] | item[1] | item[0]; 
     
     always @ (*)
     begin
        if (!item_selected) begin
        case (state)
            idle: begin
                if (coin[0])
                    next_state <= state_5;
                else if (coin[1])
                    next_state <= state_10;
                else if (coin[2])
                    next_state <= state_20;
                else if (coin[3])
                    next_state <= state_50;
                else
                    next_state <= idle;
            end
            
            state_5: begin
                if (coin[0])
                    next_state <= state_10;
                else if (coin[1])
                    next_state <= state_15;
                else if (coin[2])
                    next_state <= state_25;
                else if (coin[3])
                    next_state <= state_55;
                else
                    next_state <= state_5;
            end
            
            state_10: begin
                if (coin[0])
                    next_state <= state_15;
                else if (coin[1])
                    next_state <= state_20;
                else if (coin[2])
                    next_state <= state_30;
                else if (coin[3])
                    next_state <= state_60;
                else
                    next_state <= state_10;
            end
            
            state_15: begin
                if (coin[0])
                    next_state <= state_20;
                else if (coin[1])
                    next_state <= state_25;
                else if (coin[2])
                    next_state <= state_35;
                else if (coin[3])
                    next_state <= state_65;
                else
                    next_state <= state_15;
            end
            
            state_20: begin
                if (coin[0])
                    next_state <= state_25;
                else if (coin[1])
                    next_state <= state_30;
                else if (coin[2])
                    next_state <= state_40;
                else if (coin[3])
                    next_state <= state_70;
                else
                    next_state <= state_20;
            end
            
            state_25: begin
                if (coin[0])
                    next_state <= state_30;
                else if (coin[1])
                    next_state <= state_35;
                else if (coin[2])
                    next_state <= state_45;
                else if (coin[3])
                    next_state <= state_75;
                else
                    next_state <= state_25;
            end
            
            state_30: begin
                if (coin[0])
                    next_state <= state_35;
                else if (coin[1])
                    next_state <= state_40;
                else if (coin[2])
                    next_state <= state_50;
                else if (coin[3])
                    next_state <= state_80;
                else
                    next_state <= state_30;
            end
            
            state_35: begin
                if (coin[0])
                    next_state <= state_40;
                else if (coin[1])
                    next_state <= state_45;
                else if (coin[2])
                    next_state <= state_55;
                else if (coin[3])
                    next_state <= state_85;
                else
                    next_state <= state_35;
            end
            
            state_40: begin
                if (coin[0])
                    next_state <= state_45;
                else if (coin[1])
                    next_state <= state_50;
                else if (coin[2])
                    next_state <= state_60;
                else if (coin[3])
                    next_state <= state_90;
                else
                    next_state <= state_40;
            end
            
            state_45: begin
                if (coin[0])
                    next_state <= state_50;
                else if (coin[1])
                    next_state <= state_55;
                else if (coin[2])
                    next_state <= state_65;
                else if (coin[3])
                    next_state <= state_95;
                else
                    next_state <= state_45;
            end
            
            state_50: begin
                if (coin[0])
                    next_state <= state_55;
                else if (coin[1])
                    next_state <= state_60;
                else if (coin[2])
                    next_state <= state_70;
                else if (coin[3])
                    next_state <= state_100;
                else
                    next_state <= state_50;
            end
            
            state_55: begin
                if (coin[0])
                    next_state <= state_60;
                else if (coin[1])
                    next_state <= state_65;
                else if (coin[2])
                    next_state <= state_75;
                else if (coin[3])
                    next_state <= state_105;
                else
                    next_state <= state_55;
            end
            
            state_60: begin
                next_state <= idle;
            end
            
            state_65: begin
                next_state <= idle;
            end
            
            state_70: begin
                next_state <= idle;
            end
            
            state_75: begin
                next_state <= idle;
            end
            
            state_80: begin
                next_state <= idle;
            end
            
            state_85: begin
                next_state <= idle;
            end
            
            state_90: begin
                next_state <= idle;
            end
            
            state_95: begin
                next_state <= idle;
            end
            
            state_100: begin
                next_state <= idle;
            end
            
            state_105: begin
                next_state <= idle;
            end
            
            default: begin
                next_state <= idle;
            end
        endcase
        end
        else
        next_state <= idle;
     end
     
     always @ (posedge clk)
     begin
        if (rst)
            state <= idle;
        else
            state <= next_state;
     end
     
     
     always @ (*)
     begin
        if (item_selected)
        begin
            case (state)
                idle: begin
                    enter_more_coins <= 1'b0;
                    change_coins <= 4'b0;
                end
                state_5: begin
                    enter_more_coins <= 1'b1;
                    change_coins <= 5'b0;
                end
                state_10: begin
                    enter_more_coins <= 1'b1;
                    change_coins <= 5'b0;
                end
                state_15:begin
                    if (item[3])
                        enter_more_coins <= 1'b0;
                    else
                        enter_more_coins <= 1'b1;
                        
                    change_coins <= 5'b0;
                end
                state_20:begin
                    if (item[3])
                        enter_more_coins <= 1'b0;
                    else
                        enter_more_coins <= 1'b1;
                        
                    change_coins <= 5'b00001;
                end
                state_25:begin
                    if (item[3] | item[2])
                        enter_more_coins <= 1'b0;
                    else
                        enter_more_coins <= 1'b1;
                        
                    if (item[3])
                        change_coins <= 5'b00010;
                    else if (item[2])
                        change_coins <= 5'b00000;
                    else
                        change_coins <= 4'b0;
                end
                state_30:begin
                    if (item[3] | item[2] | item[0])
                        enter_more_coins <= 1'b0;
                    else
                        enter_more_coins <= 1'b1;
                        
                    if (item[3])
                        change_coins <= 5'b00011;
                    else if (item[2])
                        change_coins <= 5'b00001;
                    else if (item[0])
                        change_coins <= 5'b00000;
                    else
                        change_coins <= 5'b00000;
                end
                state_35:begin
                    if (item[3] | item[2] | item[0])
                        enter_more_coins <= 1'b0;
                    else
                        enter_more_coins <= 1'b1;
                        
                    if (item[3])
                        change_coins <= 5'b00100;
                    else if (item[2])
                        change_coins <= 5'b00010;
                    else if (item[0])
                        change_coins <= 5'b00001;
                    else
                        change_coins <= 5'b00000;
                end
                state_40:begin
                    if (item[3] | item[2] | item[0] | item[1])
                        enter_more_coins <= 1'b0;
                    else
                        enter_more_coins <= 1'b1;
                        
                    if (item[3])
                        change_coins <= 5'b00101;
                    else if (item[2])
                        change_coins <= 5'b00011;
                    else if (item[0])
                        change_coins <= 5'b00010;
                    else if (item[1])
                        change_coins <= 5'b00000;
                    else
                        change_coins <= 5'b00000;
                end
                state_45:begin
                    if (item[3] | item[2] | item[0] | item[1])
                        enter_more_coins <= 1'b0;
                    else
                        enter_more_coins <= 1'b1;
                        
                    if (item[3])
                        change_coins <= 5'b00110;
                    else if (item[2])
                        change_coins <= 5'b00100;
                    else if (item[0])
                        change_coins <= 5'b00011;
                    else if (item[1])
                        change_coins <= 5'b00001;
                    else
                        change_coins <= 5'b00000;
                end
                state_50:begin
                    if (item[3] | item[2] | item[0] | item[1])
                        enter_more_coins <= 1'b0;
                    else
                        enter_more_coins <= 1'b1;
                        
                    if (item[3])
                        change_coins <= 5'b00111;
                    else if (item[2])
                        change_coins <= 5'b00101;
                    else if (item[0])
                        change_coins <= 5'b00100;
                    else if (item[1])
                        change_coins <= 5'b00010;
                    else
                        change_coins <= 5'b00000;
                end
                state_55:begin
                    if (item[3] | item[2] | item[0] | item[1])
                        enter_more_coins <= 1'b0;
                    else
                        enter_more_coins <= 1'b1;
                        
                    if (item[3])
                        change_coins <= 5'b1000;
                    else if (item[2])
                        change_coins <= 5'b00110;
                    else if (item[0])
                        change_coins <= 5'b00101;
                    else if (item[1])
                        change_coins <= 5'b00011;
                    else
                        change_coins <= 5'b00000;
                end
                state_60:begin
                    // if (item[3] | item[2] | item[0] | item[1] | item[4])
                        enter_more_coins <= 1'b0;
                    // else
                    //   enter_more_coins <= 1'b1;
                        
                    if (item[3])
                        change_coins <= 5'b01001;
                    else if (item[2])
                        change_coins <= 5'b00111;
                    else if (item[0])
                        change_coins <= 5'b00110;
                    else if (item[1])
                        change_coins <= 5'b00100;
                    else if (item[4])
                        change_coins <= 5'b00000;
                    else
                        change_coins <= 5'b00000;
                end
                state_65:begin
                    // if (item[3] | item[2] | item[0] | item[1] | item[4])
                        enter_more_coins <= 1'b0;
                    // else
                    //   enter_more_coins <= 1'b1;
                        
                    if (item[3])
                        change_coins <= 5'b01010;
                    else if (item[2])
                        change_coins <= 5'b01000;
                    else if (item[0])
                        change_coins <= 5'b00111;
                    else if (item[1])
                        change_coins <= 5'b00101;
                    else if (item[4])
                        change_coins <= 5'b00001;
                    else
                        change_coins <= 5'b00000;
                end
                state_70:begin
                    // if (item[3] | item[2] | item[0] | item[1] | item[4])
                        enter_more_coins <= 1'b0;
                    // else
                    //   enter_more_coins <= 1'b1;
                        
                    if (item[3])
                        change_coins <= 5'b01011;
                    else if (item[2])
                        change_coins <= 5'b01001;
                    else if (item[0])
                        change_coins <= 5'b01000;
                    else if (item[1])
                        change_coins <= 5'b00110;
                    else if (item[4])
                        change_coins <= 5'b00010;
                    else
                        change_coins <= 5'b00000;
                end
                state_75:begin
                    // if (item[3] | item[2] | item[0] | item[1] | item[4])
                        enter_more_coins <= 1'b0;
                    // else
                    //   enter_more_coins <= 1'b1;
                        
                    if (item[3])
                        change_coins <= 5'b01100;
                    else if (item[2])
                        change_coins <= 5'b01010;
                    else if (item[0])
                        change_coins <= 5'b01001;
                    else if (item[1])
                        change_coins <= 5'b00111;
                    else if (item[4])
                        change_coins <= 5'b00011;
                    else
                        change_coins <= 5'b00000;
                end
                state_80:begin
                    // if (item[3] | item[2] | item[0] | item[1] | item[4])
                        enter_more_coins <= 1'b0;
                    // else
                    //   enter_more_coins <= 1'b1;
                        
                    if (item[3])
                        change_coins <= 5'b01101;
                    else if (item[2])
                        change_coins <= 5'b01011;
                    else if (item[0])
                        change_coins <= 5'b01010;
                    else if (item[1])
                        change_coins <= 5'b01000;
                    else if (item[4])
                        change_coins <= 5'b00100;
                    else
                        change_coins <= 5'b00000;
                end
                state_85:begin
                    // if (item[3] | item[2] | item[0] | item[1] | item[4])
                        enter_more_coins <= 1'b0;
                    // else
                    //   enter_more_coins <= 1'b1;
                        
                    if (item[3])
                        change_coins <= 5'b01110;
                    else if (item[2])
                        change_coins <= 5'b01100;
                    else if (item[0])
                        change_coins <= 5'b01011;
                    else if (item[1])
                        change_coins <= 5'b01001;
                    else if (item[4])
                        change_coins <= 5'b00101;
                    else
                        change_coins <= 5'b00000;
                end
                state_90:begin
                    // if (item[3] | item[2] | item[0] | item[1] | item[4])
                        enter_more_coins <= 1'b0;
                    // else
                    //   enter_more_coins <= 1'b1;
                        
                    if (item[3])
                        change_coins <= 5'b01111;
                    else if (item[2])
                        change_coins <= 5'b01101;
                    else if (item[0])
                        change_coins <= 5'b01100;
                    else if (item[1])
                        change_coins <= 5'b01010;
                    else if (item[4])
                        change_coins <= 5'b00110;
                    else
                        change_coins <= 5'b00000;
                end
                state_95:begin
                    // if (item[3] | item[2] | item[0] | item[1] | item[4])
                        enter_more_coins <= 1'b0;
                    // else
                    //   enter_more_coins <= 1'b1;
                        
                    if (item[3])
                        change_coins <= 5'b10000;
                    else if (item[2])
                        change_coins <= 5'b01110;
                    else if (item[0])
                        change_coins <= 5'b01101;
                    else if (item[1])
                        change_coins <= 5'b01011;
                    else if (item[4])
                        change_coins <= 5'b00111;
                    else
                        change_coins <= 5'b00000;
                end
                state_100:begin
                    // if (item[3] | item[2] | item[0] | item[1] | item[4])
                        enter_more_coins <= 1'b0;
                    // else
                    //   enter_more_coins <= 1'b1;
                        
                    if (item[3])
                        change_coins <= 5'b10001;
                    else if (item[2])
                        change_coins <= 5'b01111;
                    else if (item[0])
                        change_coins <= 5'b01110;
                    else if (item[1])
                        change_coins <= 5'b01100;
                    else if (item[4])
                        change_coins <= 5'b01000;
                    else
                        change_coins <= 5'b00000;
                end
                state_105:begin
                    // if (item[3] | item[2] | item[0] | item[1] | item[4])
                        enter_more_coins <= 1'b0;
                    // else
                    //   enter_more_coins <= 1'b1;
                        
                    if (item[3])
                        change_coins <= 5'b10010;
                    else if (item[2])
                        change_coins <= 5'b10000;
                    else if (item[0])
                        change_coins <= 5'b01111;
                    else if (item[1])
                        change_coins <= 5'b01101;
                    else if (item[4])
                        change_coins <= 5'b01001;
                    else
                        change_coins <= 5'b00000;
                end
            endcase
        end
        else
        begin
        enter_more_coins <= 1'b0;
        change_coins <= 4'b0;
        end
     end
     
     assign state_current = state;
endmodule