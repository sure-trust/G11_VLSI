`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.10.2023 11:28:55
// Design Name: 
// Module Name: vendingmachine_minor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module vendingmachine_minor(out,change,money,clock,sel,reset,extramoney

    );
    input [6:0]money;    
   
    input clock;
    input[6:0]sel;
    input reset;
    input [6:0]extramoney;
    output reg out;
    output reg [6:0]change;
    reg[3:0]ps,ns;
    reg [1:0] wrappers;
    reg [1:0]plasticbottles;
    reg [1:0]packets;
    reg [1:0]cans;
    reg [1:0]plastictub;
    parameter [6:0]money_5=6'd5;
    parameter [6:0]money_10=6'd10;
    parameter [6:0] money_20=6'd20;
    parameter [6:0]money_50=6'd50;
    parameter [3:0]sel_wrappers=3'b000;    
    parameter [3:0]sel_plasticbottles=3'b001;   
    parameter [3:0]sel_packets=3'b010;    
    parameter [3:0]sel_cans=3'b011;    
    parameter[3:0] sel_plastictubs=3'b100;   
    parameter[3:0] idle=3'b000;
    parameter[3:0] fifteen=3'b001;
    parameter [3:0]twentyfive=3'b010;
    parameter [3:0]thirty=3'b011;
    parameter [3:0]fourty=3'b100;
    parameter [3:0]sixty=3'b101;
  
    parameter Chocolate_bars=7'd000;
    parameter Granola_bars=7'd001;
    parameter Snack_sized_chips=7'd002;
    parameter Gummy_candies=7'd003;
    parameter Protein_bars=7'd004;
    parameter Cookies=7'd005;
    
   parameter Bottledwater=7'd006;
    parameter Coffee_Bottle=7'd007; 
    parameter Fruit_smoothies_Bottles=7'd008;
    parameter Fruit_flavored_water=7'd009;
      
    parameter Trail_mix=7'd010;
    parameter Fruit_snacks=7'd011;
    parameter Pretzels=7'd012;
    parameter Popcorn=7'd013;
    parameter Cheese_crackers=7'd014;
    parameter Cupcakes=7'd015;
    parameter Muffins=7'd016;
    parameter Cheese_sticks=7'd017;
    parameter Pita_chips_with_hummus=7'd018;
    
    parameter Cheese_and_cracker_packs=7'd019;
    parameter Rice_crispy_treats=7'd020;
    
     parameter ColaCan=7'd021;
     parameter Dietsoda_can=7'd022;
     parameter Energy_drinks=7'd023;
     parameter Iced_tea_can=7'd024;
    parameter Bottled_iced_coffee=7'd025;
    parameter Protein_shakes=7'd026; 
   
    parameter Fruit_juice_boxes=7'd027;
    parameter Pre_packaged_sandwiches=7'd028;
    
    
    parameter Nuts=7'd029;
    parameter Rice_cakes=7'd030;
    parameter Yogurt_cups=7'd031;
    parameter Fresh_fruit_cups=7'd032;
    parameter Gum=7'd033;
    parameter Salads=7'd034;
    parameter Hard_boiled_eggs=7'd035;
    parameter Fruit_pies=7'd036;
     parameter Vegetable_sticks_with_dip=7'd037;
    parameter Bagels_with_cream_cheese=7'd038; 
    parameter Instant_noodles=7'd03;
    
    reg [3:0]select_item;
     parameter idle1=4'b1000;
     always@(posedge clock)
        if(reset)
          begin
             ns<=idle;
          end
          else
             ps<=ns;
     always @(*)
     begin 
  if(sel==Chocolate_bars |sel==Granola_bars |sel==Gummy_candies |sel==Protein_bars |sel==Cookies |sel==Gum )
  begin
  select_item=sel_wrappers;
  end
 if(sel==Bottledwater |sel==Coffee_Bottle |sel==Fruit_smoothies_Bottles | sel==Fruit_flavored_water)
  begin
  select_item=sel_plasticbottles;
  end
  if(sel==Snack_sized_chips | sel==Trail_mix |sel==Fruit_snacks |sel==Pretzels| sel==Popcorn|sel==Cheese_crackers |sel==Nuts|sel==Cupcakes|sel==Muffins |sel==Cheese_sticks |sel==Pita_chips_with_hummus |sel==Rice_crispy_treats |sel==Cheese_and_cracker_packs)
  begin
  select_item<=sel_packets;
  end
  if(sel==ColaCan |sel== Dietsoda_can | sel==Energy_drinks | sel==Iced_tea_can |sel==Bottled_iced_coffee| sel==Protein_shakes)
  begin
  select_item<=sel_cans;
  end
  if(sel==Fruit_juice_boxes | sel==Pre_packaged_sandwiches | sel==Rice_cakes |sel==Yogurt_cups|sel==Fresh_fruit_cups| sel== Salads |sel==Hard_boiled_eggs |sel==Fruit_pies |sel==Vegetable_sticks_with_dip |sel==Bagels_with_cream_cheese|sel==Instant_noodles);
   begin
  select_item<=sel_plastictubs;
  end
  end
    
  
        
        
    always@(posedge clock)
    begin
   
    case(ps)
   
    idle:
     
   if(money==money_5&&sel==sel_wrappers)
        ns<=fifteen;
   else if(money==money_5&&sel==sel_plasticbottles)
        ns<=twentyfive;
   else if(money==money_5&&sel==sel_packets)
        ns<=thirty;
   else if(money==money_5&&sel==sel_cans)
        ns<=fourty;
   else if(money==money_5&&sel==sel_plastictubs)
        ns<=sixty;
   else if(money==money_10&&sel==sel_wrappers)
        ns<=fifteen;
   else if(money==money_10&&sel==sel_plasticbottles)
        ns<=twentyfive;
   else if(money==money_10&&sel==sel_packets)
        ns<=thirty;
   else if(money==money_10&&sel==sel_cans)
        ns<=fourty;
   else if(money==money_10&&sel==sel_plastictubs)
        ns<=sixty;
   else if(money==money_20&&sel==sel_wrappers)
        ns<=fifteen;
   else if(money==money_20&&sel==sel_plasticbottles)
        ns<=twentyfive;
   else if(money==money_20&&sel==sel_packets)
        ns<=thirty;
   else if(money==money_20&&sel==sel_cans)
        ns<=fourty;
   else if(money==money_20&&sel==sel_plastictubs)
        ns<=sixty;  
   else if(money==money_50&&sel==sel_wrappers)
        ns<=fifteen;
   else if(money==money_50&&sel==sel_plasticbottles)
        ns<=twentyfive;
   else if(money==money_50&&sel==sel_packets)
        ns<=thirty;
   else if(money==money_50&&sel==sel_cans)
        ns<=fourty;
   else if(money==money_50&&sel==sel_plastictubs)
        ns<=sixty;  
                        
   fifteen:
            
          if(money==money_5&&sel==sel_wrappers)
               ns<=fifteen;
          else if(money==money_5&&sel==sel_plasticbottles)
               ns<=twentyfive;
          else if(money==money_5&&sel==sel_packets)
               ns<=thirty;
          else if(money==money_5&&sel==sel_cans)
               ns<=fourty;
          else if(money==money_5&&sel==sel_plastictubs)
               ns<=sixty;
          else if(money==money_10&&sel==sel_wrappers)
               ns<=fifteen;
          else if(money==money_10&&sel==sel_plasticbottles)
               ns<=twentyfive;
          else if(money==money_10&&sel==sel_packets)
               ns<=thirty;
          else if(money==money_10&&sel==sel_cans)
               ns<=fourty;
          else if(money==money_10&&sel==sel_plastictubs)
               ns<=sixty;
          else if(money==money_20&&sel==sel_wrappers)
               ns<=fifteen;
          else if(money==money_20&&sel==sel_plasticbottles)
               ns<=twentyfive;
          else if(money==money_20&&sel==sel_packets)
               ns<=thirty;
          else if(money==money_20&&sel==sel_cans)
               ns<=fourty;
          else if(money==money_20&&sel==sel_plastictubs)
               ns<=sixty;  
          else if(money==money_50&&sel==sel_wrappers)
               ns<=fifteen;
          else if(money==money_50&&sel==sel_plasticbottles)
               ns<=twentyfive;
          else if(money==money_50&&sel==sel_packets)
               ns<=thirty;
          else if(money==money_50&&sel==sel_cans)
               ns<=fourty;
          else if(money==money_50&&sel==sel_plastictubs)
               ns<=sixty;  
  twentyfive:           
   
    if(money==money_5&&sel==sel_wrappers)
       ns<=fifteen;
  else if(money==money_5&&sel==sel_plasticbottles)
       ns<=twentyfive;
  else if(money==money_5&&sel==sel_packets)
       ns<=thirty;
  else if(money==money_5&&sel==sel_cans)
       ns<=fourty;
  else if(money==money_5&&sel==sel_plastictubs)
       ns<=sixty;
  else if(money==money_10&&sel==sel_wrappers)
       ns<=fifteen;
  else if(money==money_10&&sel==sel_plasticbottles)
       ns<=twentyfive;
  else if(money==money_10&&sel==sel_packets)
       ns<=thirty;
  else if(money==money_10&&sel==sel_cans)
       ns<=fourty;
  else if(money==money_10&&sel==sel_plastictubs)
       ns<=sixty;
  else if(money==money_20&&sel==sel_wrappers)
       ns<=fifteen;
  else if(money==money_20&&sel==sel_plasticbottles)
       ns<=twentyfive;
  else if(money==money_20&&sel==sel_packets)
       ns<=thirty;
  else if(money==money_20&&sel==sel_cans)
       ns<=fourty;
  else if(money==money_20&&sel==sel_plastictubs)
       ns<=sixty;  
  else if(money==money_50&&sel==sel_wrappers)
       ns<=fifteen;
  else if(money==money_50&&sel==sel_plasticbottles)
       ns<=twentyfive;
  else if(money==money_50&&sel==sel_packets)
       ns<=thirty;
  else if(money==money_50&&sel==sel_cans)
       ns<=fourty;
  else if(money==money_50&&sel==sel_plastictubs)
       ns<=sixty;
       
  thirty:
  
    if(money==money_5&&sel==sel_wrappers)
       ns<=fifteen;
  else if(money==money_5&&sel==sel_plasticbottles)
       ns<=twentyfive;
  else if(money==money_5&&sel==sel_packets)
       ns<=thirty;
  else if(money==money_5&&sel==sel_cans)
       ns<=fourty;
  else if(money==money_5&&sel==sel_plastictubs)
       ns<=sixty;
  else if(money==money_10&&sel==sel_wrappers)
       ns<=fifteen;
  else if(money==money_10&&sel==sel_plasticbottles)
       ns<=twentyfive;
  else if(money==money_10&&sel==sel_packets)
       ns<=thirty;
  else if(money==money_10&&sel==sel_cans)
       ns<=fourty;
  else if(money==money_10&&sel==sel_plastictubs)
       ns<=sixty;
  else if(money==money_20&&sel==sel_wrappers)
       ns<=fifteen;
  else if(money==money_20&&sel==sel_plasticbottles)
       ns<=twentyfive;
  else if(money==money_20&&sel==sel_packets)
       ns<=thirty;
  else if(money==money_20&&sel==sel_cans)
       ns<=fourty;
  else if(money==money_20&&sel==sel_plastictubs)
       ns<=sixty;  
  else if(money==money_50&&sel==sel_wrappers)
       ns<=fifteen;
  else if(money==money_50&&sel==sel_plasticbottles)
       ns<=twentyfive;
  else if(money==money_50&&sel==sel_packets)
       ns<=thirty;
  else if(money==money_50&&sel==sel_cans)
       ns<=fourty;
  else if(money==money_50&&sel==sel_plastictubs)
       ns<=sixty;
       
  fourty:
  
   if(money==money_5&&sel==sel_wrappers)
       ns<=fifteen;
  else if(money==money_5&&sel==sel_plasticbottles)
       ns<=twentyfive;
  else if(money==money_5&&sel==sel_packets)
       ns<=thirty;
  else if(money==money_5&&sel==sel_cans)
       ns<=fourty;
  else if(money==money_5&&sel==sel_plastictubs)
       ns<=sixty;
  else if(money==money_10&&sel==sel_wrappers)
       ns<=fifteen;
  else if(money==money_10&&sel==sel_plasticbottles)
       ns<=twentyfive;
  else if(money==money_10&&sel==sel_packets)
       ns<=thirty;
  else if(money==money_10&&sel==sel_cans)
       ns<=fourty;
  else if(money==money_10&&sel==sel_plastictubs)
       ns<=sixty;
  else if(money==money_20&&sel==sel_wrappers)
       ns<=fifteen;
  else if(money==money_20&&sel==sel_plasticbottles)
       ns<=twentyfive;
  else if(money==money_20&&sel==sel_packets)
       ns<=thirty;
  else if(money==money_20&&sel==sel_cans)
       ns<=fourty;
  else if(money==money_20&&sel==sel_plastictubs)
       ns<=sixty;  
  else if(money==money_50&&sel==sel_wrappers)
       ns<=fifteen;
  else if(money==money_50&&sel==sel_plasticbottles)
       ns<=twentyfive;
  else if(money==money_50&&sel==sel_packets)
       ns<=thirty;
  else if(money==money_50&&sel==sel_cans)
       ns<=fourty;
  else if(money==money_50&&sel==sel_plastictubs)
       ns<=sixty;
       
  sixty:
  
   if(money==money_5&&sel==sel_wrappers)
       ns<=fifteen;
  else if(money==money_5&&sel==sel_plasticbottles)
       ns<=twentyfive;
  else if(money==money_5&&sel==sel_packets)
       ns<=thirty;
  else if(money==money_5&&sel==sel_cans)
       ns<=fourty;
  else if(money==money_5&&sel==sel_plastictubs)
       ns<=sixty;
  else if(money==money_10&&sel==sel_wrappers)
       ns<=fifteen;
  else if(money==money_10&&sel==sel_plasticbottles)
       ns<=twentyfive;
  else if(money==money_10&&sel==sel_packets)
       ns<=thirty;
  else if(money==money_10&&sel==sel_cans)
       ns<=fourty;
  else if(money==money_10&&sel==sel_plastictubs)
       ns<=sixty;
  else if(money==money_20&&sel==sel_wrappers)
       ns<=fifteen;
  else if(money==money_20&&sel==sel_plasticbottles)
       ns<=twentyfive;
  else if(money==money_20&&sel==sel_packets)
       ns<=thirty;
  else if(money==money_20&&sel==sel_cans)
       ns<=fourty;
  else if(money==money_20&&sel==sel_plastictubs)
       ns<=sixty;  
  else if(money==money_50&&sel==sel_wrappers)
       ns<=fifteen;
  else if(money==money_50&&sel==sel_plasticbottles)
       ns<=twentyfive;
  else if(money==money_50&&sel==sel_packets)
       ns<=thirty;
  else if(money==money_50&&sel==sel_cans)
       ns<=fourty;
  else if(money==money_50&&sel==sel_plastictubs)
       ns<=sixty;
  default:ns<=idle;
  endcase
  ps<=ns;
    end
    always@(ps,money)
    begin
     if(reset)
        ps<=idle;
        else
     case(ps)
     idle:begin
                      wrappers<=1'b0;
                      plasticbottles<=1'b0;
                      packets<=1'b0;
                      cans<=1'b0;
                      plastictub<=1'b0;
                      change=1'b0;
                      out=1'b0;
                      end
  fifteen:begin
                      if(money==money_5)
                         begin
                         wrappers<=1'b0;
                         plasticbottles<=1'b0;
                         packets<=1'b0;
                         cans<=1'b0;
                         plastictub<=1'b0;
                         change=6'd5;
                         out<=0;
                                   if(extramoney==money_10)
                                    begin
                                    wrappers<=1'b1;
                                    plasticbottles<=1'b0;
                                    packets<=1'b0;
                                    cans<=1'b0;
                                    plastictub<=1'b0;  
                                    out<=1'b1;  
                                    change=6'd0;                    
                                    end
                                   
                                    
                                   else if(extramoney==money_20)
                                     begin
                                     wrappers<=1'b1;
                                     plasticbottles<=1'b0;
                                     packets<=1'b0;
                                     cans<=1'b0;
                                     plastictub<=1'b0;            
                                     out<=1'b1;    
                                     change=6'd10;        
                                     end
                                    
                                     
                           end
                      else if(money==money_10)
                          begin
                          wrappers<=1'b0;
                          plasticbottles<=1'b0;
                          packets<=1'b0;
                          cans<=1'b0;
                          plastictub<=1'b0;
                          change<=6'd10;
                          out=1'b0;
                                           if(extramoney==money_5)
                                           begin
                                           wrappers<=1'b1;
                                           plasticbottles<=1'b0;
                                           packets<=1'b0;
                                           cans<=1'b0;
                                           plastictub<=1'b0;        
                                           out<=1'b1;     
                                           change=6'd0;           
                                           end
                                           
                                          if(extramoney==money_10)
                                            begin
                                           wrappers<=1'b1;
                                           plasticbottles<=1'b0;
                                           packets<=1'b0;
                                           cans<=1'b0;
                                           plastictub<=1'b0;
                                           out=1'b1;                        
                                        
                                           change=6'd5;
                                           end
                                           
 
                          end
                          else if(money==money_20)
                          begin
                          wrappers<=1'b1;
                          plasticbottles<=1'b0;
                          packets<=1'b0;
                          cans<=1'b0;
                          plastictub<=1'b0;
                          out<=1'b1;
                          change=6'd5;
                          end
                          else if(money==money_50)
                          begin
                          wrappers<=1'b1;
                          plasticbottles<=1'b0;
                          packets<=1'b0;
                          cans<=1'b0;
                          plastictub<=1'b0;
                          out<=1'b1;
                          change=6'd35;
                          end
                          end
twentyfive:begin  
                          if(money==money_5)
                          begin
                          wrappers<=1'b0;
                          plasticbottles<=1'b0;
                          packets<=1'b0;
                          cans<=1'b0;
                          plastictub<=1'b0;
                          out<=1'b0;
                                      if(extramoney==money_20)
                                       begin
                                       wrappers<=1'b0;
                                       plasticbottles<=1'b1;
                                       packets<=1'b0;
                                       cans<=1'b0;
                                       plastictub<=1'b0;     
                                       out<=1'b1;                   
                                      
                                       change=6'd0;
                                       end
                                       if(extramoney==money_50)
                                        begin
                                       wrappers<=1'b0;
                                       plasticbottles<=1'b1;
                                       packets<=1'b0;
                                       cans<=1'b0;
                                       plastictub<=1'b0;
                                       out=1'b1;                        
                                      
                                       change=6'd30;
                                       
                                        end
                          end
                          else if(money==money_10)
                          begin
                          wrappers<=1'b0;
                          plasticbottles<=1'b0;
                          packets<=1'b0;
                          cans<=1'b0;
                          plastictub<=1'b0;      
                          out<=1'b0;
                          change<=6'd10;                 
                                        if(extramoney==money_20)
                                         begin
                                         wrappers<=1'b0;
                                         plasticbottles<=1'b1;
                                         packets<=1'b0;
                                         cans<=1'b0;
                                         plastictub<=1'b0;   
                                         out<=1'b1;                     
                                         
                                         change=6'd5;
                                         end
                          end
                          else if(money==money_20)
                          begin
                          wrappers<=1'b0;
                          plasticbottles<=1'b0;
                          packets<=1'b0;
                          cans<=1'b0;
                          plastictub<=1'b0;
                          out<=1'b0;
                          change<=6'd20;
                                         if(extramoney==money_5)
                                         begin
                                         wrappers<=1'b0;
                                         plasticbottles<=1'b1;
                                         packets<=1'b0;
                                         cans<=1'b0;
                                         plastictub<=1'b0;  
                                         out<=1'b1;                      
                                         change=6'd0;
                                         end
                                         if(extramoney==money_10)
                                          begin
                                         wrappers<=1'b0;
                                         plasticbottles<=1'b1;
                                         packets<=1'b0;
                                         cans<=1'b0;
                                         plastictub<=1'b0;
                                         out<=1'b1;                        
                                           change=6'd5;
                                           end
                          end
                          else if(money==money_50)
                          begin
                          wrappers<=1'b0;
                          plasticbottles<=1'b1;
                          packets<=1'b0;
                          cans<=1'b0;
                          plastictub<=1'b0;
                          change=6'd25;
                          out<=1'b0;
                          end
                          end
 thirty:begin
                      if(money==money_5)
                             begin
                             wrappers<=1'b0;
                             plasticbottles<=1'b0; 
                             packets<=1'b0;
                             cans<=1'b0;
                             plastictub<=1'b0;
                             out<=1'b0;
                             change<=6'd5;
                                   if(extramoney==money_50)
                                       begin
                                    wrappers<=1'b0;
                                    plasticbottles<=1'b0;
                                    packets<=1'b1;
                                   cans<=1'b0;
                                  plastictub<=1'b0;
                                  out<=1'b1;                        
                                 change=6'd25;
                                 end
                             end
                          else if(money==money_10)
                              begin
                              wrappers<=1'b0;
                              plasticbottles<=1'b0;
                              packets<=1'b0;
                              cans<=1'b0;
                              plastictub<=1'b0;
                              out<=1'b0;
                               if(extramoney==money_20)
                                 begin
                                 wrappers<=1'b0;
                                 plasticbottles<=1'b0;
                                 packets<=1'b1;
                                 cans<=1'b0;
                                 plastictub<=1'b0;
                                 out<=1'b1;                        
                                change=6'd0;
                                end
                              if(extramoney==money_50)
                               begin
                              wrappers<=1'b0;
                              plasticbottles<=1'b0;
                              packets<=1'b1;
                              cans<=1'b0;
                              plastictub<=1'b0;
                              out<=1'b1;                        
                              
                              change=6'd30;
                              end
                              end
                           else if(money==money_20)
                              begin
                              wrappers<=1'b0;
                              plasticbottles<=1'b0;
                              packets<=1'b0;
                              cans<=1'b0;
                              plastictub<=1'b0;
                              out<=1'b0;
                               if(extramoney==money_10)
                                 begin
                                 wrappers<=1'b0;
                                 plasticbottles<=1'b0;
                                 packets<=1'b1;
                                 cans<=1'b0;
                                 plastictub<=1'b0;
                                 out<=1'b1;                        
                              change=6'd0;
                              end
                              if(extramoney==money_20)
                               begin
                              wrappers<=1'b0;
                              plasticbottles<=1'b0;
                              packets<=1'b1;
                              cans<=1'b0;
                              plastictub<=1'b0;     
                              out<=1'b1;                   
                              end
                              change=6'd10;
                              end
                              else if(money==money_50)
                              begin
                              wrappers<=1'b0;
                              plasticbottles<=1'b0;
                              packets<=1'b1;
                              cans<=1'b0;
                              plastictub<=1'b0;
                              change=6'd20;
                              out<=1'b1;
                              end
                              end 
   fourty:begin
                      if(money==money_5)
                                 begin
                                 wrappers<=1'b0;
                                 plasticbottles<=1'b0;
                                 packets<=1'b0;
                                 cans<=1'b0;
                                 plastictub<=1'b0;
                                 out<=1'b0;
                                 change<=6'd0;
                                 if(extramoney==money_50)
                                 begin
                                 wrappers<=1'b0;
                                 plasticbottles<=1'b0;
                                 packets<=1'b0;
                                 cans<=1'b1;
                                 plastictub<=1'b0;
                                 out<=1'b1;                        
                                 change=6'd15;
                                 end
                                 end
                              else if(money==money_10)
                                  begin
                                  wrappers<=1'b0;
                                  plasticbottles<=1'b0;
                                  packets<=1'b0;
                                  cans<=1'b0;
                                  plastictub<=1'b0;
                                  out<=1'b0;
                                  change<=6'd0;
                                  if(extramoney==money_50)
                                  begin
                                  wrappers<=1'b0;
                                  plasticbottles<=1'b0;
                                  packets<=1'b0;
                                  cans<=1'b1;
                                  plastictub<=1'b0;
                                  out<=1'b1;                        
                                  change=6'd20;
                                  end
                                  end
                                 else if(money==money_20)
                                  begin
                                  wrappers<=1'b0;
                                  plasticbottles<=1'b0;
                                  packets<=1'b0;
                                  cans<=1'b0;
                                  plastictub<=1'b0;
                                  out<=1'b0;
                                  if(extramoney==money_20)
                                   begin
                                  wrappers<=1'b0;
                                  plasticbottles<=1'b0;
                                  packets<=1'b0;
                                  cans<=1'b1;
                                  plastictub<=1'b0; 
                                  out<=1'b1;                     
                                  
                                  change=6'd0;
                                  end
                                 if(extramoney==money_50)
                                    begin
                                    wrappers<=1'b0;
                                    plasticbottles<=1'b0;
                                    packets<=1'b0;
                                    cans<=1'b1;
                                    plastictub<=1'b0;
                                    out<=1'b1;                        
                                    
                                  change=6'd20;
                                  end
                                  end
                                  else if(money==money_50)
                                  begin
                                  wrappers<=1'b0;
                                  plasticbottles<=1'b0;
                                  packets<=1'b0;
                                  cans<=1'b1;
                                  plastictub<=1'b0;
                                  out<=1'b1;
                                  change=6'd10;
                                  end
                                  end          
  sixty:begin                      
                                  if(money==money_5)
                                  begin
                                  wrappers<=1'b0;
                                  plasticbottles<=1'b0;
                                  packets<=1'b0;
                                  cans<=1'b0;
                                  plastictub<=1'b0;
                                  change=6'd5;
                                  out<=1'b0;
                                  end
                               else if(money==money_10)
                                   begin
                                   wrappers<=1'b0;
                                   plasticbottles<=1'b0;
                                   packets<=1'b0;
                                   cans<=1'b0;
                                   plastictub<=1'b0;
                                   out<=1'b0;
                                   change<=6'd10;
                                   if(extramoney==money_50)
                                      begin
                                      wrappers<=1'b0;
                                      plasticbottles<=1'b0;
                                      packets<=1'b0;
                                      cans<=1'b0;
                                      plastictub<=1'b1;
                                      out<=1'b1;                        
                                     change=6'd0;
                                   end
                                   end
                                else if(money==money_20)
                                   begin
                                   wrappers<=1'b0;
                                   plasticbottles<=1'b0;
                                   packets<=1'b0;
                                   cans<=1'b0;
                                   plastictub<=1'b0;
                                   out<=1'b0;
                                   change<=6'd20;
                                   if(extramoney==money_50)
                                   begin
                                   wrappers<=1'b0;
                                   plasticbottles<=1'b0;
                                   packets<=1'b0;
                                   cans<=1'b0;
                                   plastictub<=1'b1;
                                   out<=1'b1;                        
                                    change=6'd10;
                                   end
                                   end
                                   else if(money==money_50)
                                   begin
                                   wrappers<=1'b0;
                                   plasticbottles<=1'b0;
                                   packets<=1'b0;
                                   cans<=1'b0;
                                   plastictub<=1'b0;
                                   out<=1'b0;
                                   change<=6'd50;
                                   if(extramoney==money_10)
                                   begin
                                   wrappers<=1'b0;
                                   plasticbottles<=1'b0;
                                   packets<=1'b0;
                                   cans<=1'b0;
                                   plastictub<=1'b1; 
                                   out=1'b1;                       
                              
                                   change=6'd0;
                                   end
                                   end
                                   end                     
              
     endcase
     
    end
    
          
               
         
    
endmodule
