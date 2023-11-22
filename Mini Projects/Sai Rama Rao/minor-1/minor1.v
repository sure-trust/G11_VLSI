`timescale 1ns / 1ps

module minor1(
input [5:0]item,
input [6:0]amount,
input clk,rst,
output reg add_more,
output reg [5:0]fproduct,
output reg [7:0]change
    );
    reg product;
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
parameter packet=3'b001;
parameter can=3'b010;
parameter bottle=3'b011;
parameter wrapper=3'b101;
parameter plastictub=3'b101;

parameter Bottledwater=6'b000001;//1
parameter Cola=6'b00010;//2
parameter Dietsoda=6'b000011;//3
parameter Snacksizedchips=6'b00100;//4
parameter Chocolatebars=6'b00101;//5
parameter Granolabars=6'b00110;//6
parameter Trailmix=6'b00111;//7
parameter Fruitsnacks=6'b01000;//8
parameter Energydrinks=6'b01001;//9
parameter Icedtea=6'b1010;//10
parameter Coffee=6'b1011;//11
parameter Fruitjuiceboxes=6'b1100;//12
parameter Prepackagedsandwiches=6'b1101;//13
parameter Pretzels=6'b1110;//14
parameter Popcorn=6'b1111;//15
parameter Cheesecrackers=6'b10000;//16
parameter Nuts=6'b10001;//17
parameter Ricecakes=6'b10010;//18
parameter Gummycandies=6'b10011;//19
parameter Proteinbars=6'b10100;//20
parameter Cookies=6'b10101;//21
parameter Yogurtcups=6'b10110;//22
parameter Freshfruitcups=6'b10111;//23
parameter Cupcakes=6'b11000;//24
parameter Muffins=6'b11001;//25
parameter Cheesesticks=6'b11010;//26
parameter Gum=6'b11011;//27
parameter FruitsmoothiesBottles=6'b11100;//28
parameter Salads=6'b11101;//29
parameter Hardboiledeggs=6'b11110;//30
parameter Pitachipswithhummus=6'b11111;//31
parameter Fruitpies=6'b100000;//32
parameter Icedcoffee=6'b100001;//33
parameter Ricecrispytreats=6'b100010;//34
parameter Cheeseandcrackerpacks=6'b100011;//35
parameter Fruitflavoredwater=6'b100100;//36
parameter Vegetablestickswithdip=6'b100101;//37
parameter Bagelswithcreamcheese=6'b100110;//38
parameter Proteinshakes=6'b100111;//39
parameter Instantnoodles=6'b101000;//40
reg [6:0]s;
reg [2:0]sitem;
parameter idle1=3'b000;
always@(*)
begin
if(item==Snacksizedchips | item==Trailmix |item==Fruitsnacks |item==Pretzels| item==Popcorn|item==Cheesecrackers |item==Nuts|item==Cupcakes|item==Muffins |item==Cheesesticks |item==Pitachipswithhummus |item==Ricecrispytreats |item==Cheeseandcrackerpacks)
begin
sitem<=packet;
end
if(item==Cola |item==Dietsoda | item==Energydrinks | item==Icedtea |item==Icedcoffee| item==Proteinshakes)
begin
sitem<=can;
end
if(item==Chocolatebars |item==Granolabars |item==Gummycandies |item==Proteinbars |item==Cookies |item==Gum )
begin
sitem=wrapper;
end
if(item==Bottledwater |item==Coffee |item==FruitsmoothiesBottles | item==Fruitflavoredwater)
begin
sitem=bottle;
end
if(item==Fruitjuiceboxes | item==Prepackagedsandwiches | item==Ricecakes |item==Yogurtcups|item==Freshfruitcups| item== Salads |item==Hardboiledeggs |item==Fruitpies |item==Vegetablestickswithdip |item==Bagelswithcreamcheese|item==Instantnoodles)
begin
sitem=plastictub;
end
end
always@(posedge clk)
begin
 if(rst)
       begin
            s<=idle;
            product=0;add_more=0;change=7'd0;
       end //if end
    else
      begin
      
        case(sitem)
        idle1:begin 
        product=0;change=7'd0;fproduct=6'd0;
        end
            packet:case(s)
                       idle:begin
                                product<=0;
                                s<=s0;add_more=0;change=7'd0;
                            end
                       s0: begin
                           case(amount)
                               7'd0:begin
                                     s<=s0;product=0;change=7'b0;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s1;product=0;change=7'b0;add_more=1;
                                  end
                               7'd10:begin
                                    s<=s2;product=0;change=7'b0;add_more=1;
                                    end
                               7'd20:begin
                                    s<=s4;product=0;change=7'b0;add_more=1;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd20;add_more=0;
                                  end
                             
                           endcase
                           end
                       s1:begin
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd5;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s2;product=0;change=7'd0;add_more=1;
                                  end
                               7'd10:begin
                                    s<=s3;product=0;change=7'd0;add_more=1;
                                    end
                               7'd20:begin
                                    s<=s5;product=0;change=7'd0;add_more=1;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd25;add_more=0;
                                  end
                               default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                           endcase
                           end
                       s2:begin
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd10;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s3;product=0;change=7'd0;add_more=1;
                                  end
                               7'd10:begin
                                    s<=s4;product=0;change=7'd0;add_more=1;
                                    end
                               7'd20:begin
                                    s<=s0;product=1;change=7'd0;add_more=0;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd30;add_more=0;
                                  end
                             default:begin
                               s<=s0;product=0;change=7'd0;
                               end
                           endcase
                           end
                       s3:begin
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd15;add_more=1;
                                  end
                                7'd5:begin
                                    s<=s4;product=0;change=7'd0;add_more=1;
                                  end
                               7'd10:begin
                                    s<=s5;product=0;change=7'd0;add_more=1;
                                    end
                               7'd20:begin
                                    s<=s0;product=1;change=7'd5;add_more=0;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd35;add_more=0;
                                  end
                               default:begin
                               s<=s0;product=0;change=7'd0;
                               end
                           endcase
                           end
                      s4:begin
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd20;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s5;product=0;change=7'd0;add_more=1;
                                  end
                               7'd10:begin
                                    s<=s0;product=1;change=7'd0;add_more=0;
                                    end
                               7'd20:begin
                                    s<=s0;product=1;change=7'd10;add_more=0;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd40;add_more=0;
                                  end
                               default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                          
                           endcase
                           end
                       s5:begin
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd25;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s0;product=1;change=7'd0;add_more=0;
                                  end
                               7'd10:begin
                                    s<=s0;product=1;change=7'd5;add_more=0;
                                    end
                               7'd20:begin
                                    s<=s0;product=1;change=7'd15;add_more=0;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd45;add_more=0;
                                  end
                             default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                           endcase
                           end
                        default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                   endcase
           can:case(s)
                       idle:begin
                                product<=0;
                                s<=s0;change=7'd0;add_more=0;
                            end
                       s0: begin
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s1;product=0;change=7'd0;add_more=1;
                                  end
                               7'd10:begin
                                    s<=s2;product=0;change=7'd0;add_more=1;
                                    end
                               7'd20:begin
                                    s<=s4;product=0;change=7'd0;add_more=1;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd10;add_more=0;
                                  end
                               default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                             
                           endcase
                           end
                       s1:begin  //5
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd5;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s2;product=0;change=7'd0;add_more=1;
                                  end
                               7'd10:begin
                                    s<=s3;product=0;change=7'd0;add_more=1;
                                    end
                               7'd20:begin
                                    s<=s5;product=0;change=7'd0;add_more=1;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd15;add_more=0;
                                  end
                              default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                           endcase
                           end
                       s2:begin//10
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd10;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s3;product=0;change=7'd0;add_more=1;
                                  end
                               7'd10:begin
                                    s<=s4;product=0;change=7'd0;add_more=1;
                                    end
                               7'd20:begin
                                    s<=s6;product=0;change=7'd0;add_more=1;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd20;add_more=0;
                                  end
                               default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                           endcase
                           end
                       s3:begin//15
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd15;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s4;product=0;change=7'd0;add_more=1;
                                  end
                              7'd10:begin
                                    s<=s5;product=0;change=7'd0;add_more=1;
                                    end
                               7'd20:begin
                                    s<=s7;product=0;change=7'd0;add_more=1;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd25;add_more=0;
                                  end
                              default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                           endcase
                           end
                      s4:begin//20
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd20;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s5;product=0;change=7'd0;add_more=1;
                                  end
                               7'd10:begin
                                    s<=s6;product=0;change=7'd0;add_more=1;
                                    end
                               7'd20:begin
                                    s<=s0;product=1;change=7'd0;add_more=0;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd30;add_more=0;
                                  end
                               default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                           endcase
                           end
                       s5:begin//25
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd25;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s6;product=0;change=7'd0;add_more=1;
                                  end
                               7'd10:begin
                                    s<=s7;product=0;change=7'd0;add_more=1;
                                    end
                               7'd20:begin
                                    s<=s0;product=1;change=7'd5;add_more=0;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd35;add_more=0;
                                  end
                               default:begin
                               s<=s0;product=0;add_more=0;
                               end
                           endcase
                           end
                        s6:begin//30
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd30;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s7;product=0;change=7'd0;add_more=1;
                                  end
                               7'd10:begin
                                    s<=s0;product=1;change=7'd0;add_more=0;
                                    end
                               7'd20:begin
                                    s<=s0;product=1;change=7'd10;add_more=0;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd40;add_more=0;
                                  end
                               default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                           endcase
                           end
                        s7:begin//35
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd35;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s0;product=1;change=7'd0;add_more=0;
                                  end
                               7'd10:begin
                                    s<=s0;product=1;change=7'd5;add_more=0;
                                    end
                               7'd20:begin
                                    s<=s0;product=1;change=7'd15;add_more=0;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd45;add_more=0;
                                  end
                               default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                           endcase
                           end
                       default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                   endcase
            bottle:case(s)
                       idle:begin
                                product<=0;change=7'd0;add_more=0;
                                s<=s0;
                            end
                       s0: begin//0
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s1;product=0;change=7'd0;add_more=1;
                                  end
                               7'd10:begin
                                    s<=s2;product=0;change=7'd0;add_more=1;
                                    end
                               7'd20:begin
                                    s<=s4;product=0;change=7'd0;add_more=1;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd25;add_more=0;
                                  end
                             default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                           endcase
                           end
                       s1:begin  //5
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd5;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s2;product=0;change=7'd0;add_more=1;
                                  end
                               7'd10:begin
                                    s<=s3;product=0;change=7'd0;add_more=1;
                                    end
                               7'd20:begin
                                    s<=s0;product=1;change=7'd0;add_more=0;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd30;add_more=0;
                                  end
                               default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                           endcase
                           end
                       s2:begin
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0; change=7'd10; add_more=0;
                                  end
                                7'd5:begin
                                    s<=s3;product=0;change=7'd0;add_more=1;
                                  end
                               7'd10:begin
                                    s<=s4;product=0;change=7'd0;add_more=1;
                                    end
                               7'd20:begin
                                    s<=s0;product=1;change=7'd5;add_more=0;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd35;add_more=0;
                                  end
                              default:begin
                               s<=s0;product=0;add_more=0;add_more=0;
                               end
                           endcase
                           end
                       s3:begin//15
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd15;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s4;product=0;change=7'd0;add_more=1;
                                  end
                               7'd10:begin
                                    s<=s0;product=1;change=7'd0;add_more=0;
                                    end
                               7'd20:begin
                                    s<=s7;product=1;change=7'd10;add_more=0;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd40;add_more=0;
                                  end
                               default:begin
                               s<=s0;product=0;add_more=0;
                               end
                           endcase
                           end
                      s4:begin//20
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd20;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s0;product=1;change=7'd0;add_more=0;
                                  end
                               7'd10:begin
                                    s<=s0;product=1;change=7'd5;add_more=0;
                                    end
                               7'd20:begin
                                    s<=s0;product=1;change=7'd15;add_more=0;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd45;add_more=0;
                                  end
                              default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                           endcase
                           end
                        default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                     endcase
          wrapper:case(s)
                       idle:begin
                                product<=0;change=7'd0;add_more=0;
                                s<=s0;
                            end
                       s0: begin
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s1;product=0;change=7'd0;add_more=1;
                                  end
                               7'd10:begin
                                    s<=s2;product=0;change=7'd0;add_more=1;
                                    end
                               7'd20:begin
                                    s<=s0;product=1;change=7'd5;add_more=0;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd35;add_more=0;
                                  end
                               default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                             
                           endcase
                           end
                       s1:begin  //5
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd5;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s2;product=0;change=7'd0;add_more=1;
                                  end
                               7'd10:begin
                                    s<=s0;product=1;change=7'd0;add_more=0;
                                    end
                               7'd20:begin
                                    s<=s0;product=1;change=7'd10;add_more=0;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd40;add_more=0;
                                  end
                                default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                           endcase
                           end
                       s2:begin
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd10;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s0;product=1;change=7'd0;add_more=0;
                                  end
                               7'd10:begin
                                    s<=s0;product=1;change=7'd5;add_more=0;
                                    end
                               7'd20:begin
                                    s<=s0;product=1;change=7'd15;add_more=0;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd45;add_more=0;
                                  end
                                default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                           endcase
                           end
                        default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                 endcase
            plastictub:case(s)
                       idle:begin
                                product<=0;
                                s<=s0;change=7'd0;add_more=0;
                            end
                       s0: begin
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd0;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s1;product=0;change=7'd0;add_more=1;
                                  end
                               7'd10:begin
                                    s<=s2;product=0;change=7'd0;add_more=1;
                                    end
                               7'd20:begin
                                    s<=s4;product=0;change=7'd0;add_more=1;
                                  end
                               7'd50:begin
                                    s<=s10;product=0;change=7'd0;add_more=1;
                                  end
                             default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                           endcase
                           end
                       s1:begin  //5
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd5;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s2;product=0;change=7'd0;add_more=1;
                                  end
                               7'd10:begin
                                    s<=s3;product=0;change=7'd0;add_more=1;
                                    end
                               7'd20:begin
                                    s<=s5;product=0;change=7'd0;add_more=1;
                                  end
                               7'd50:begin
                                    s<=s11;product=0;change=7'd0;add_more=1;
                                  end
                              default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                           endcase
                           end
                       s2:begin
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd10;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s3;product=0;change=7'd0;add_more=1;
                                  end
                               7'd10:begin
                                    s<=s4;product=0;change=7'd0;add_more=1;
                                    end
                               7'd20:begin
                                    s<=s6;product=0;change=7'd0;add_more=1;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd0;add_more=0;
                                  end
                              default:begin
                               s<=s0;product=0;add_more=0;
                               end
                           endcase
                           end
                       s3:begin//15
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd15;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s4;product=0;change=7'd0;add_more=1;
                                  end
                               7'd10:begin
                                    s<=s5;product=0;change=7'd0;add_more=1;
                                    end
                               7'd20:begin
                                    s<=s7;product=0;change=7'd0;add_more=1;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd5;add_more=0;
                                  end
                               default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                           endcase
                           end
                      s4:begin
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd20;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s5;product=0;change=7'd0;add_more=1;
                                  end
                               7'd10:begin
                                    s<=s6;product=0;change=7'd0;add_more=1;
                                    end
                               7'd20:begin
                                    s<=s8;product=0;change=7'd0;add_more=1;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd10;add_more=0;
                                  end
                               default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                           endcase
                           end
                       s5:begin
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd25;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s6;product=0;change=7'd0;add_more=1;
                                  end
                               7'd10:begin
                                    s<=s7;product=0;change=7'd0;add_more=1;
                                    end
                               7'd20:begin
                                    s<=s9;product=0;change=7'd0;add_more=1;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd15;add_more=0;
                                  end
                              default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                           endcase
                           end
                        s6:begin
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd30;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s7;product=0;change=7'd0;add_more=1;
                                  end
                               7'd10:begin
                                    s<=s8;product=0;change=7'd0;add_more=1;
                                    end
                               7'd20:begin
                                    s<=s10;product=0;change=7'd0;add_more=1;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd20;add_more=0;
                                  end
                               default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                           endcase
                           end
                    s7:begin
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd35;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s8;product=0;change=7'd0;add_more=1;
                                  end
                               7'd10:begin
                                    s<=s9;product=0;change=7'd0;add_more=1;
                                    end
                               7'd20:begin
                                    s<=s11;product=0;change=7'd0;add_more=1;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd25;add_more=0;
                                  end
                              default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                           endcase
                           end
                 s8:begin
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd40;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s9;product=0;change=7'd0;add_more=1;
                                  end
                               7'd10:begin
                                    s<=s10;product=0;change=7'd0;add_more=1;
                                    end
                               7'd20:begin
                                    s<=s0;product=1;change=7'd0;add_more=0;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd30;add_more=0;
                                  end
                               default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                           endcase
                           end
                   s9:begin
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd45;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s10;product=0;change=7'd0;add_more=1;
                                  end
                               7'd10:begin
                                    s<=s11;product=0;change=7'd0;add_more=1;
                                    end
                               7'd20:begin
                                    s<=s0;product=1;change=7'd5;add_more=0;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd35;add_more=0;
                                  end
                               default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                           endcase
                           end
                   s10:begin
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd50;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s11;product=0;change=7'd0;add_more=1;
                                  end
                               7'd10:begin
                                    s<=s0;product=1;change=7'd0;add_more=0;
                                    end
                               7'd20:begin
                                    s<=s0;product=1;change=7'd10;add_more=0;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd40;add_more=0;
                                  end
                              default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                           endcase
                           end
                    s11:begin
                           case(amount)
                                7'd0:begin
                                     s<=s0;product=0;change=7'd55;add_more=0;
                                  end
                                7'd5:begin
                                    s<=s0;product=1;change=7'd0;add_more=0;
                                  end
                               7'd10:begin
                                    s<=s0;product=1;change=7'd5;add_more=0;
                                    end
                               7'd20:begin
                                    s<=s0;product=1;change=7'd15;add_more=0;
                                  end
                               7'd50:begin
                                    s<=s0;product=1;change=7'd45;add_more=0;
                                  end
                              default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                           endcase
                           end
                           default:begin
                               s<=s0;product=0;change=7'd0;add_more=0;
                               end
                   endcase
            default:begin
                    s<=s0;product=0;change=7'd0;
                    end
        endcase
        if(product==1)
        begin
        fproduct=item;
        sitem=idle1;
        
        end
        
end //else end

end //always end

endmodule