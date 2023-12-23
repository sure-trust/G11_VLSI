`timescale 1ns / 1ps
module vending_machine(
input rst,clk,
//input [4:0] selectitem,
input [8:0]item,
input [6:0]amount,
output reg [7:0]change,
output reg product,
output reg add_more,
output reg [7:0] outcome
);
 parameter idle=7'd0;
 parameter s0=7'd1;
 parameter s1=7'd5;
 parameter s2=7'd10;
 parameter s3=7'd15;
 parameter s4=7'd20;
 parameter s5=7'd25;
 parameter s6=7'd30;
 parameter s7=7'd35;
 parameter s8=7'd40;
 parameter s9=7'd45;
 parameter s10=7'd50;
 parameter s11=7'd55;
 parameter s12=7'd60;
 parameter packet=4'b0001;
 parameter cans=4'b0010;
 parameter wrapper=4'b0101;
 parameter plastictub=4'b0011;
 parameter plastic_bottle=4'b0110;
 //////item decalrations////
parameter Bottledwater=7'd100;
parameter ColaCan=7'd101;
parameter Dietsoda_can=7'd102;
parameter Snack_sized_chips=7'd103;
parameter Chocolate_bars=7'd104;
parameter Granola_bars=7'd105;
parameter Trail_mix=7'd106;
parameter Fruit_snacks=7'd107;
parameter Energy_drinks=7'd108;
parameter Iced_tea_can=7'd109;
parameter Coffee_Bottle=7'd110;
parameter Fruit_juice_boxes=7'd111;
parameter Pre_packaged_sandwiches=7'd112;
parameter Pretzels=7'd113;
parameter Popcorn=7'd114;
parameter Cheese_crackers=7'd115;
parameter Nuts=7'd116;
parameter Rice_cakes=7'd117;
parameter Gummy_candies=7'd118;
parameter Protein_bars=7'd119;
parameter Cookies=7'd120;
parameter Yogurt_cups=7'd121;
parameter Fresh_fruit_cups=7'd122;
parameter Cupcakes=7'd123;
parameter Muffins=7'd124;
parameter Cheese_sticks=7'd125;
parameter Gum=7'd70;
parameter Fruit_smoothies_Bottles=7'd71;
parameter Salads=7'd72;
parameter Hard_boiled_eggs=7'd73;
parameter Pita_chips_with_hummus=7'd74;
parameter Fruit_pies=7'd75;
parameter Bottled_iced_coffee=7'd76;
parameter Rice_crispy_treats=7'd77;
parameter Cheese_and_cracker_packs=7'd78;
parameter Fruit_flavored_water=7'd79;
parameter Vegetable_sticks_with_dip=7'd80;
parameter Bagels_with_cream_cheese=7'd81;
parameter Protein_shakes=7'd82;
parameter Instant_noodles=7'd83;
//parameter Cheese_and_cracker_packs=7'd84;
//parameter Fruit_flavored_water=7'd85;
//parameter Vegetable_sticks_with_dip=7'd86;
//parameter Bagels_with_cream_cheese=7'd87;
//parameter Protein_shakes=7'd88;
//parameter Instant_noodles=7'd89;
//parameter Cheese_and_cracker_packs=7'd90;
//parameter Fruit_flavored_water=7'd91;
//parameter Vegetable_sticks_with_dip=7'd92;
//parameter Bagels_with_cream_cheese=7'd93;
//parameter protein_shakes=7'd94;
//parameter Instant_noodles=7'd95;
reg [3:0]select_item;
 reg [6:0]s;
 parameter idle1=4'b1000;
 always @(*)
 begin 
if(item==Snack_sized_chips | item==Trail_mix |item==Fruit_snacks |item==Pretzels| item==Popcorn|item==Cheese_crackers |item==Nuts|item==Cupcakes|item==Muffins |item==Cheese_sticks |item==Pita_chips_with_hummus |item==Rice_crispy_treats |item==Cheese_and_cracker_packs)
begin
select_item<=packet;
end
if(item==ColaCan |item== Dietsoda_can | item==Energy_drinks | item==Iced_tea_can |item==Bottled_iced_coffee| item==Protein_shakes)
begin
select_item<=cans;
end
if(item==Chocolate_bars |item==Granola_bars |item==Gummy_candies |item==Protein_bars |item==Cookies |item==Gum )
begin
select_item=wrapper;//15
end
if(item==Bottledwater |item==Coffee_Bottle |item==Fruit_smoothies_Bottles | item==Fruit_flavored_water)
begin
select_item=plastic_bottle;
end
if(item==Fruit_juice_boxes | item==Pre_packaged_sandwiches | item==Rice_cakes |item==Yogurt_cups|item==Fresh_fruit_cups| item== Salads |item==Hard_boiled_eggs |item==Fruit_pies |item==Vegetable_sticks_with_dip |item==Bagels_with_cream_cheese|item==Instant_noodles)
begin
select_item=plastictub;
end
end
 always @(posedge clk)
    begin   
        if(rst)
             begin 
                s<=idle;
                     product<=0;add_more=0;change=7'd0;
        end//if end
         else 
           begin
         
           case(select_item)
               idle1:begin
               product<=0;add_more=0;change=7'd0;outcome=0;
               end
                   wrapper:begin
                   case(s)
                     
                        idle: begin
                            s<=s0;
                                product<=0;add_more=0;change=7'd0;
                            end
                       s0: begin////0
                          case(amount)
                                7'd0:begin
                                    s<=s0;product=0;add_more=1;
                                     end
                                7'd5:begin
                                    s<=s1;product=0;add_more=1;change=7'd0;
                                     end
                                7'd10:begin
                                    s<=s2;product=0;add_more=1;change=7'd0;
                                     end
                                7'd20:begin
                                    s<=s0;product=1;add_more=0;change=7'd5;
                                     end
                                7'd50:begin
                                    s<=s0;product=1;add_more=0;change=7'd35;
                                     end
                                default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                     end
                          endcase
                   end
                   ////5rs -state s1
                    s1:
                     begin
                              case(amount)
                                    7'd0:begin
                                        s<=s0;product=0;add_more=1;change=7'd5;
                                         end
                                    7'd5:begin
                                        s<=s2;product=0;add_more=1;change=7'd0;
                                         end
                                    7'd10:begin
                                        s<=s0;product=1;add_more=0;change=7'd0;
                                         end
                                    7'd20:begin
                                        s<=s0;product=1;add_more=0;change=7'd5;
                                         end
                                    7'd50:begin
                                        s<=s0;product=1;add_more=0;change=7'd35;
                                         end
                                    default:begin
                                        s<=s0;product=0;change=7'd0;add_more=0;
                                         end
                              endcase
                    end
 
                    ///10rs state
                    s2:
                        begin
                             case(amount)
                                    7'd0:begin
                                    s<=s0;product=0;add_more=1;change=7'd10;
                                    end
                                    7'd5:begin
                                    s<=s0;product=1;add_more=0;change=7'd0;
                                    end
                                    7'd10:begin
                                    s<=s0;product=1;add_more=0;change=7'd5;
                                    end
                                    7'd20:begin
                                    s<=s0;product=1;add_more=0;change=7'd15;
                                    end
                                    7'd50:begin
                                    s<=s0;product=1;add_more=0;change=7'd45;
                                    end
                                     default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                     end
                             endcase
                       end
                             default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                              end  
                     endcase///for wrapper end case
                       if(product== 1)
                       begin                       
                       outcome=item;
                       select_item=idle1;
                       end
                                          
                       
                       
                    end//for wrapper begin -end
                     
                     
//>>>>>>>>>>>>>>>>>>>>>>>>>>>>plastic_bottle>>>>>>>>>.>>>>>>>>>>>>>>>>>//25rs


                      plastic_bottle:begin
                     case(s)
                        idle: begin
                            s<=s0;
                                product<=0;add_more=0;change=7'd0;
                            end
                            ////0rs state0----25rs
                        s0: begin
                          case(amount)
                                7'd0:begin
                                    s<=s0;product=0;add_more=1;
                                     end
                                7'd5:begin
                                    s<=s1;product=0;add_more=1;change=7'd0;
                                     end
                                7'd10:begin
                                    s<=s2;product=0;add_more=1;change=7'd0;
                                     end
                                7'd20:begin
                                    s<=s4;product=0;add_more=1;change=7'd0;
                                     end
                                7'd50:begin
                                    s<=s0;product=1;add_more=0;change=7'd25;
                                     end
                                default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                     end
                          endcase
                   end
                   //// 5rs amount --state1---25rs cost
                   s1:
                     begin
                              case(amount)
                                    7'd0:begin
                                        s<=s0;product=0;add_more=1;change=7'd5;
                                         end
                                    7'd5:begin
                                        s<=s2;product=0;add_more=1;change=7'd0;
                                         end
                                    7'd10:begin
                                        s<=s3;product=0;add_more=1;change=7'd0;
                                         end
                                    7'd20:begin
                                        s<=s0;product=1;add_more=0;change=7'd0;
                                         end
                                    7'd50:begin
                                        s<=s0;product=1;add_more=0;change=7'd25;
                                         end
                                    default:begin
                                        s<=s0;product=0;change=7'd0;add_more=0;
                                         end
                              endcase
                    end
                    ////10rs amount-state2----25rs
                    s2:
                        begin
                             case(amount)
                                    7'd0:begin
                                    s<=s0;product=0;add_more=1;change=7'd10;
                                    end
                                    7'd5:begin
                                    s<=s3;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd10:begin
                                    s<=s4;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd20:begin
                                    s<=s0;product=1;add_more=0;change=7'd5;
                                    end
                                    7'd50:begin
                                    s<=s0;product=1;add_more=0;change=7'd35;
                                    end
                                     default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                     end
                                   
                             endcase
                       end
                       /////15rs amount----- state3 ---25rs
                       s3://15rs
                        begin
                             case(amount)
                                    7'd0:begin
                                    s<=s0;product=0;add_more=1;change=7'd15;
                                    end
                                    7'd5:begin
                                    s<=s4;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd10:begin
                                    s<=s0;product=1;add_more=0;change=7'd0;
                                    end
                                    7'd20:begin
                                    s<=s0;product=1;add_more=0;change=7'd10;
                                    end
                                    7'd50:begin
                                    s<=s0;product=1;add_more=0;change=7'd45;
                                    end
                                     default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                     end
                             endcase
                       end
                       s4://20rs
                        begin
                             case(amount)
                                    7'd0:begin
                                    s<=s0;product=0;add_more=1;change=7'd20;
                                    end
                                    7'd5:begin
                                    s<=s0;product=1;add_more=0;change=7'd0;
                                    end
                                    7'd10:begin
                                    s<=s0;product=1;add_more=0;change=7'd5;
                                    end
                                    7'd20:begin
                                    s<=s0;product=1;add_more=0;change=7'd15;
                                    end
                                    7'd50:begin
                                    s<=s0;product=1;add_more=0;change=7'd45;
                                    end
                                     default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                     end
                             endcase
                       end
                       
                             default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                              end 
                            endcase//for case of plastic bottle endcase
                            if(product== 1)
                                 begin
                                outcome=item;
                                select_item=idle1;

                                end
                            end///for plastic bottle begin end 
                            
                            
           //>>>>>>>>>>>>>>>>>>>>packet-30rs>>>>>>>>>>>>>>>>>>>>>>>>>>                
                            packet:begin
                     case(s)
                        idle: begin
                            s<=s0;
                                product<=0;add_more=0;change=7'd0;
                            end
                            ////0rs state0----30rs
                        s0: begin
                          case(amount)
                                7'd0:begin
                                    s<=s0;product=0;add_more=1;
                                     end
                                7'd5:begin
                                    s<=s1;product=0;add_more=1;change=7'd0;
                                     end
                                7'd10:begin
                                    s<=s2;product=0;add_more=1;change=7'd0;
                                     end
                                7'd20:begin
                                    s<=s4;product=0;add_more=1;change=7'd0;
                                     end
                                7'd50:begin
                                    s<=s0;product=1;add_more=0;change=7'd20;
                                     end
                                default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                     end
                          endcase
                   end
                   //// 5rs amount --state1---30rs cost
                   s1:
                     begin
                              case(amount)
                                    7'd0:begin
                                        s<=s0;product=0;add_more=1;change=7'd5;
                                         end
                                    7'd5:begin
                                        s<=s2;product=0;add_more=1;change=7'd0;
                                         end
                                    7'd10:begin
                                        s<=s3;product=0;add_more=1;change=7'd0;
                                         end
                                    7'd20:begin
                                        s<=s5;product=0;add_more=1;change=7'd0;
                                         end
                                    7'd50:begin
                                        s<=s0;product=1;add_more=0;change=7'd20;
                                         end
                                    default:begin
                                        s<=s0;product=0;change=7'd0;add_more=0;
                                         end
                              endcase
                    end
                    ////10rs amount-state2----30rs
                    s2:
                        begin
                             case(amount)
                                    7'd0:begin
                                    s<=s0;product=0;add_more=1;change=7'd10;
                                    end
                                    7'd5:begin
                                    s<=s3;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd10:begin
                                    s<=s4;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd20:begin
                                    s<=s0;product=1;add_more=0;change=7'd0;
                                    end
                                    7'd50:begin
                                    s<=s0;product=1;add_more=0;change=7'd20;
                                    end
                                     default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                     end
                                   
                             endcase
                       end
                       /////15rsamount----- state3 ---30rs
                       s3://15
                        begin
                             case(amount)
                                    7'd0:begin
                                    s<=s4;product=0;add_more=1;change=7'd15;
                                    end
                                    7'd5:begin
                                    s<=s4;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd10:begin
                                    s<=s5;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd20:begin
                                    s<=s0;product=1;add_more=0;change=7'd5;
                                    end
                                    7'd50:begin
                                    s<=s0;product=1;add_more=0;change=7'd35;
                                    end
                                     default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                     end
                             endcase
                       end
                      //////state 4 30rs-packet 20rs amount
                        s4://20
                        begin
                             case(amount)
                                    7'd0:begin
                                    s<=s4;product=0;add_more=1;change=7'd20;
                                    end
                                    7'd5:begin
                                    s<=s5;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd10:begin
                                    s<=s0;product=1;add_more=0;change=7'd0;
                                    end
                                    7'd20:begin
                                    s<=s0;product=1;add_more=0;change=7'd10;
                                    end
                                    7'd50:begin
                                    s<=s0;product=1;add_more=0;change=7'd40;
                                    end
                                     default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                     end
                             endcase
                       end
                        s5://25
                        begin
                             case(amount)
                                    7'd0:begin
                                    s<=s4;product=0;add_more=1;change=7'd25;
                                    end
                                    7'd5:begin
                                    s<=s0;product=1;add_more=0;change=7'd0;
                                    end
                                    7'd10:begin
                                    s<=s0;product=1;add_more=0;change=7'd5;
                                    end
                                    7'd20:begin
                                    s<=s0;product=1;add_more=0;change=7'd15;
                                    end
                                    7'd50:begin
                                    s<=s0;product=1;add_more=0;change=7'd45;
                                    end
                                     default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                     end
                             endcase
                       end
                             default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                              end 
                            endcase//for case of packet endcase
                            if(product== 1)
                                 begin
                                outcome=item;
                                select_item=idle1;

                                end
                            end///for packet begin end 
                            
                            
                            
   //>>>>>>>>>>>>>>>>>>>>cans-40rs>>>>>>>>>>>>>>>>>>>>>>>>>>                
           cans:begin
                     case(s)
                        idle: begin
                            s<=s0;
                                product<=0;add_more=0;change=7'd0;
                            end
                            ////0rs state0----40rs
                        s0: begin
                          case(amount)
                                7'd0:begin
                                    s<=s0;product=0;add_more=1;
                                     end
                                7'd5:begin
                                    s<=s1;product=0;add_more=1;change=7'd0;
                                     end
                                7'd10:begin
                                    s<=s2;product=0;add_more=1;change=7'd0;
                                     end
                                7'd20:begin
                                    s<=s4;product=0;add_more=1;change=7'd0;
                                     end
                                7'd50:begin
                                    s<=s0;product=1;add_more=0;change=7'd10;
                                     end
                                default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                     end
                          endcase
                   end
                   //// 5rs amount --state1---40rs cost
                   s1://5rs
                     begin
                              case(amount)
                                    7'd0:begin
                                        s<=s0;product=0;add_more=1;change=7'd5;
                                         end
                                    7'd5:begin
                                        s<=s2;product=0;add_more=1;change=7'd0;
                                         end
                                    7'd10:begin
                                        s<=s3;product=0;add_more=1;change=7'd0;
                                         end
                                    7'd20:begin
                                        s<=s5;product=0;add_more=1;change=7'd0;
                                         end
                                    7'd50:begin
                                        s<=s0;product=1;add_more=0;change=7'd15;
                                         end
                                    default:begin
                                        s<=s0;product=0;change=7'd0;add_more=0;
                                         end
                              endcase
                    end
                    ////10rs amount-state2----40rs
                    s2://10
                        begin
                             case(amount)
                                    7'd0:begin
                                    s<=s0;product=0;add_more=1;change=7'd10;
                                    end
                                    7'd5:begin
                                    s<=s3;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd10:begin
                                    s<=s4;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd20:begin
                                    s<=s6;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd50:begin
                                    s<=s0;product=1;add_more=0;change=7'd20;
                                    end
                                     default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                     end
                                   
                             endcase
                       end
                       /////15rsamount----- state3 ---40rs
                       s3://15
                        begin
                             case(amount)
                                    7'd0:begin
                                    s<=s0;product=0;add_more=1;change=7'd15;
                                    end
                                    7'd5:begin
                                    s<=s4;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd10:begin
                                    s<=s5;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd20:begin
                                    s<=s7;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd50:begin
                                    s<=s0;product=1;add_more=0;change=7'd25;
                                    end
                                     default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                     end
                             endcase
                       end
                      //////state 4 40rs cans 20rs amount
                        s4://20
                        begin
                             case(amount)
                                    7'd0:begin
                                    s<=s0;product=0;add_more=1;change=7'd20;
                                    end
                                    7'd5:begin
                                    s<=s5;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd10:begin
                                    s<=s6;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd20:begin
                                    s<=s0;product=1;add_more=0;change=7'd0;
                                    end
                                    7'd50:begin
                                    s<=s0;product=1;add_more=0;change=7'd30;
                                    end
                                     default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                     end
                             endcase
                       end
                        s5://25
                        begin
                             case(amount)
                                    7'd0:begin
                                    s<=s0;product=0;add_more=1;change=7'd25;
                                    end
                                    7'd5:begin
                                    s<=s6;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd10:begin
                                    s<=s7;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd20:begin
                                    s<=s0;product=1;add_more=0;change=7'd5;
                                    end
                                    7'd50:begin
                                    s<=s0;product=1;add_more=0;change=7'd35;
                                    end
                                     default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                     end
                             endcase
                       end
                       //////state5 40rs-cans 30rs amount
                        s6://30
                        begin
                             case(amount)
                                    7'd0:begin
                                    s<=s0;product=0;add_more=1;change=7'd30;
                                    end
                                    7'd5:begin
                                    s<=s7;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd10:begin
                                    s<=s0;product=1;add_more=0;change=7'd0;
                                    end
                                    7'd20:begin
                                    s<=s0;product=1;add_more=0;change=7'd10;
                                    end
                                    7'd50:begin
                                    s<=s0;product=1;add_more=0;change=7'd30;
                                    end
                                     default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                     end
                             endcase
                       end
                        s7://35
                        begin
                             case(amount)
                                    7'd0:begin
                                    s<=s0;product=0;add_more=1;change=7'd35;
                                    end
                                    7'd5:begin
                                    s<=s0;product=1;add_more=0;change=7'd0;
                                    end
                                    7'd10:begin
                                    s<=s0;product=1;add_more=0;change=7'd5;
                                    end
                                    7'd20:begin
                                    s<=s0;product=1;add_more=0;change=7'd15;
                                    end
                                    7'd50:begin
                                    s<=s0;product=1;add_more=0;change=7'd45;
                                    end
                                     default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                     end
                             endcase
                       end
                       
                             default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                              end 
                              endcase//for case of packet endcase
                              if (product== 1)
                                 begin
                                outcome=item;
                                select_item=idle1;
                                end
                            end///for packet begin end 
                            
 //>>>>>>>>>> plastictub>>>>>>>>>>>>>>>>>>>>>.                      
                   plastictub:begin
                     case(s)
                        idle: begin
                            s<=s0;
                                product<=0;add_more=0;change=7'd0;
                            end
                            ////0rs state0----60rs
                        s0: begin
                          case(amount)
                                7'd0:begin
                                    s<=s0;product=0;add_more=1;
                                     end
                                7'd5:begin
                                    s<=s1;product=0;add_more=1;change=7'd0;
                                     end
                                7'd10:begin
                                    s<=s2;product=0;add_more=1;change=7'd0;
                                     end
                                7'd20:begin
                                    s<=s4;product=0;add_more=1;change=7'd0;
                                     end
                                7'd50:begin
                                    s<=s12;product=1;add_more=0;change=7'd0;
                                     end
                                default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                     end
                          endcase
                   end
                   //// 5rs amount --state1---60rs cost
                   s1://5rs
                     begin
                              case(amount)
                                    7'd0:begin
                                        s<=s0;product=0;add_more=1;change=7'd5;
                                         end
                                    7'd5:begin
                                        s<=s2;product=0;add_more=1;change=7'd0;
                                         end
                                    7'd10:begin
                                        s<=s3;product=0;add_more=1;change=7'd0;
                                         end
                                    7'd20:begin
                                        s<=s5;product=0;add_more=1;change=7'd0;
                                         end
                                    7'd50:begin
                                        s<=s11;product=0;add_more=1;change=7'd0;
                                         end
                                    default:begin
                                        s<=s0;product=0;change=7'd0;add_more=0;
                                         end
                              endcase
                    end
                    ////10rs amount-state2----40rs
                    s2://10
                        begin
                             case(amount)
                                    7'd0:begin
                                    s<=s0;product=0;add_more=1;change=7'd10;
                                    end
                                    7'd5:begin
                                    s<=s3;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd10:begin
                                    s<=s4;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd20:begin
                                    s<=s6;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd50:begin
                                    s<=s0;product=1;add_more=0;change=7'd0;
                                    end
                                     default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                     end
                                   
                             endcase
                       end
                       /////15rsamount----- state3 ---40rs
                       s3://15
                        begin
                             case(amount)
                                    7'd0:begin
                                    s<=s0;product=0;add_more=1;change=7'd15;
                                    end
                                    7'd5:begin
                                    s<=s4;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd10:begin
                                    s<=s5;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd20:begin
                                    s<=s7;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd50:begin
                                    s<=s0;product=1;add_more=0;change=7'd5;
                                    end
                                     default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                     end
                             endcase
                       end
                      //////state 4 40rs cans 20rs amount
                        s4://20
                        begin
                             case(amount)
                                    7'd0:begin
                                    s<=s0;product=0;add_more=1;change=7'd20;
                                    end
                                    7'd5:begin
                                    s<=s5;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd10:begin
                                    s<=s6;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd20:begin
                                    s<=s8;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd50:begin
                                    s<=s0;product=1;add_more=0;change=7'd10;
                                    end
                                     default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                     end
                             endcase
                       end
                        s5://25
                        begin
                             case(amount)
                                    7'd0:begin
                                    s<=s0;product=0;add_more=1;change=7'd25;
                                    end
                                    7'd5:begin
                                    s<=s6;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd10:begin
                                    s<=s7;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd20:begin
                                    s<=s0;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd50:begin
                                    s<=s0;product=1;add_more=0;change=7'd15;
                                    end
                                     default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                     end
                             endcase
                       end
                       //////state5 40rs-cans 30rs amount
                        s6://30
                        begin
                             case(amount)
                                    7'd0:begin
                                    s<=s0;product=0;add_more=1;change=7'd30;
                                    end
                                    7'd5:begin
                                    s<=s7;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd10:begin
                                    s<=s8;product=1;add_more=0;change=7'd0;
                                    end
                                    7'd20:begin
                                    s<=s12;product=0;add_more=0;change=7'd0;
                                    end
                                    7'd50:begin
                                    s<=s0;product=1;add_more=0;change=7'd20;
                                    end
                                     default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                     end
                             endcase
                       end
                        s7://35
                        begin
                             case(amount)
                                    7'd0:begin
                                    s<=s0;product=0;add_more=1;change=7'd35;
                                    end
                                    7'd5:begin
                                    s<=s8;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd10:begin
                                    s<=s9;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd20:begin
                                    s<=s11;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd50:begin
                                    s<=s0;product=1;add_more=0;change=7'd25;
                                    end
                                     default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                     end
                             endcase
                       end
                          s8://40
                        begin
                             case(amount)
                                    7'd0:begin
                                    s<=s0;product=0;add_more=1;change=7'd40;
                                    end
                                    7'd5:begin
                                    s<=s9;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd10:begin
                                    s<=s10;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd20:begin
                                    s<=s0;product=1;add_more=0;change=7'd0;
                                    end
                                    7'd50:begin
                                    s<=s0;product=1;add_more=0;change=7'd30;
                                    end
                                     default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                     end
                             endcase
                       end
                          s9://45
                        begin
                             case(amount)
                                    7'd0:begin
                                    s<=s0;product=0;add_more=1;change=7'd45;
                                    end
                                    7'd5:begin
                                    s<=s10;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd10:begin
                                    s<=s11;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd20:begin
                                    s<=s0;product=1;add_more=0;change=7'd5;
                                    end
                                    7'd50:begin
                                    s<=s0;product=1;add_more=0;change=7'd35;
                                    end
                                     default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                     end
                             endcase
                       end
                       s10://50
                        begin
                             case(amount)
                                    7'd0:begin
                                    s<=s0;product=0;add_more=1;change=7'd50;
                                    end
                                    7'd5:begin
                                    s<=s11;product=0;add_more=1;change=7'd0;
                                    end
                                    7'd10:begin
                                    s<=s0;product=1;add_more=0;change=7'd0;
                                    end
                                    7'd20:begin
                                    s<=s0;product=1;add_more=0;change=7'd10;
                                    end
                                    7'd50:begin
                                    s<=s0;product=1;add_more=0;change=7'd40;
                                    end
                                     default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                     end
                             endcase
                       end
                      s11://55
                        begin
                             case(amount)
                                    7'd0:begin
                                    s<=s0;product=0;add_more=1;change=7'd55;
                                    end
                                    7'd5:begin
                                    s<=s0;product=1;add_more=1;change=7'd0;
                                    end
                                    7'd10:begin
                                    s<=s0;product=1;add_more=0;change=7'd5;
                                    end
                                    7'd20:begin
                                    s<=s0;product=1;add_more=0;change=7'd15;
                                    end
                                    7'd50:begin
                                    s<=s0;product=1;add_more=0;change=7'd45;
                                    end
                                     default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                     end
                             endcase
                       end
                       
                             default:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                              end 
                            endcase//for case of packet endcase
                             if(product== 1)
                                 begin
                               outcome=item;
                              select_item=idle1;
                              end
                            end///for packet begin end 
                default:begin
                s<=s0 ;product=0;change=7'd0;add_more=0;
                end 
            endcase/// for item endcase
           end////for else     
end
endmodule
