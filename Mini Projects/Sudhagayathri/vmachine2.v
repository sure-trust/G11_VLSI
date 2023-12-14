`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.11.2023 18:06:23
// Design Name: 
// Module Name: vmachine2
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


module vmachine2(
    input clk,
    input rst,
    input [6:0]in,    // 5rs,10rs,20rs,50rs
    input [9:0]item,  //40 items      
    output reg out,
    output reg add_still,
    output reg [7:0]change,
    output reg [9:0]productout
    );
    
//parameter declaration
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


//items
parameter idle1=3'b110;
parameter packets=3'b001;    //30rps 
parameter cans=3'b010;       //40rps
parameter p_bottles=3'b011;  //25rps
parameter wrappers=3'b100;   //15rps
parameter p_tub=3'b101;      //60rps


//40 main_items
parameter Bottledwater=8'd61;//1
parameter Cola=8'd62;    //2
parameter Dietsoda=8'd63;//3
parameter Snacksizedchips=8'd64;//4
parameter Chocolatebars=8'd65;//5
parameter Granolabars=8'd66;//6
parameter Trailmix=8'd67;//7
parameter Fruitsnacks=8'd68;//8
parameter Energydrinks=8'd69;//9
parameter Icedtea=8'd70;//10
parameter Coffee=8'd71;//11
parameter Fruitjuiceboxes=8'd72;//12
parameter Prepackagedsandwiches=8'd73;//13
parameter Pretzels=8'd74;//14
parameter Popcorn=8'd75;//15
parameter Cheesecrackers=8'd76;//16
parameter Nuts=8'd77;//17
parameter Ricecakes=8'd78;//18
parameter Gummycandies=8'd79;//19
parameter Proteinbars=8'd80;//20
parameter Cookies=8'd81;//21
parameter Yogurtcups=8'd82;//22
parameter Freshfruitcups=8'd83;//23
parameter Cupcakes=8'd84;//24
parameter Muffins=8'd85;//25
parameter Cheesesticks=8'd86;//26
parameter Gum=8'd87;//27
parameter FruitsmoothiesBottles=8'd88;//28
parameter Salads=8'd89;//29
parameter Hardboiledeggs=8'd90;//30
parameter Pitachipswithhummus=8'd91;//31
parameter Fruitpies=8'd92;//32
parameter BottledIcedcoffee=8'd93;//33
parameter Ricecrispytreats=8'd94;//34
parameter Cheeseandcrackerpacks=8'd95;//35
parameter Fruitflavoredwater=8'd96;//36
parameter Vegetablestickswithdip=8'd97;//37
parameter Bagelswithcreamcheese=8'd98;//38
parameter Proteinshakes=8'd99;//39
parameter Instantnoodles=8'd100;//40


//internal variables declaration
reg [2:0] main_item;
reg [6:0] ns;


// declaring 40 items to main_item
always @ (*)
begin
if(item==Snacksizedchips || item==Trailmix || item==Fruitsnacks || item==Pretzels || item==Popcorn || item==Cheesecrackers || item==Nuts || item==Cupcakes || item==Muffins || item==Cheesesticks || item==Pitachipswithhummus || item==Ricecrispytreats || item==Cheeseandcrackerpacks)
begin
main_item<=packets;   
end
if(item==Cola || item==Dietsoda || item==Energydrinks || item==Icedtea || item==BottledIcedcoffee || item==Proteinshakes)
begin
main_item<=cans;        
end
if(item==Bottledwater || item==Coffee || item==FruitsmoothiesBottles || item==Fruitflavoredwater)
begin
main_item<=p_bottles;            
end
if(item==Chocolatebars || item==Granolabars || item==Gummycandies || item==Proteinbars || item==Cookies || item==Gum )
begin
main_item<=wrappers;              
end
if(item==Fruitjuiceboxes || item==Prepackagedsandwiches || item==Ricecakes || item==Yogurtcups || item==Freshfruitcups || item== Salads || item==Hardboiledeggs || item==Fruitpies || item==Vegetablestickswithdip || item==Bagelswithcreamcheese || item==Instantnoodles)
begin
main_item<=p_tub;          
end

end

//idle logic
always @(posedge clk) 
begin
if (rst)
begin
ns<=idle;out<=0; add_still=0;
            change=7'd0;
end  
else
begin

//logic
case(main_item) 
    idle1: begin
     out<=0;add_still=0;
    change=7'd0;productout=0;
    end 
 packets:begin
 case (ns)                           //for packet--->30rps
  idle:begin  
            ns<=s0;out<=0; add_still=0;
            change=7'd0;
            end 
  s0: begin 
            case(in) 
            7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s1; out=0; add_still= 1; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s2; out=0; add_still= 1; change=7'd0;
                end 
            7'd20: begin                      //20rps
             ns<=s4; out=0; add_still= 1; change=7'd0;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd20;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
        end
  s1: begin 
            case(in) 
            7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s2; out=0; add_still= 1; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s3; out=0; add_still= 1; change=7'd0;
                end 
            7'd20: begin                      //20rps
             ns<=s5; out=0; add_still= 1; change=7'd0;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd25;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
        end
  s2: begin 
            case(in) 
             7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s3; out=0; add_still= 1; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s4; out=0; add_still= 1; change=7'd0;
                end 
            7'd20: begin                      //20rps
             ns<=s0; out=1; add_still= 0; change=7'd0;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd30;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
         end
    s3: begin 
            case(in) 
           7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s4; out=0; add_still= 1; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s5; out=0; add_still= 1; change=7'd0;
                end 
            7'd20: begin                      //20rps
             ns<=s0; out=1; add_still= 0; change=7'd5;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd35;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
         end
     s4: begin 
            case(in) 
            7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s5; out=0; add_still= 1; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s0; out=1; add_still= 0; change=7'd0;
                end 
            7'd20: begin                      //20rps
             ns<=s0; out=1; add_still= 0; change=7'd10;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd40;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
         end
      s5: begin 
            case(in) 
           7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s0; out=1; add_still= 0; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s0; out=1; add_still= 0; change=7'd5;
                end 
            7'd20: begin                      //20rps
             ns<=s0; out=1; add_still= 0; change=7'd15;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd45;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
         end
        
      endcase
     if (out==1)
      begin
     productout=item; 
     main_item=idle1;
     end
     
     end
      
 cans: begin
       case (ns)                            //for cans--->40rps
  idle:begin  
            ns<=s0;out<=0; add_still=0;
            change=7'd0;
            end 
 s0: begin              //0
            case(in) 
            7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s1; out=0; add_still= 1; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s2; out=0; add_still= 1; change=7'd0;
                end 
            7'd20: begin                      //20rps
             ns<=s4; out=0; add_still= 1; change=7'd0;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd10;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
        end
    s1: begin           //5
            case(in) 
            7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s2; out=0; add_still= 1; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s3; out=0; add_still= 1; change=7'd0;
                end 
            7'd20: begin                      //20rps
             ns<=s5; out=0; add_still= 1; change=7'd0;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd15;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
        end
  s2: begin                    //10
            case(in) 
             7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s3; out=0; add_still= 1; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s4; out=0; add_still= 1; change=7'd0;
                end 
            7'd20: begin                      //20rps
             ns<=s6; out=0; add_still= 1; change=7'd0;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd20;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
         end
    s3: begin                //15
            case(in) 
           7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s4; out=0; add_still= 1; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s5; out=0; add_still= 1; change=7'd0;
                end 
            7'd20: begin                      //20rps
             ns<=s7; out=0; add_still= 1; change=7'd0;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd25;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
         end
     s4: begin              //20
            case(in) 
            7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s5; out=0; add_still= 1; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s6; out=0; add_still= 1; change=7'd0;
                end 
            7'd20: begin                      //20rps
             ns<=s0; out=1; add_still= 0; change=7'd0;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd30;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
         end
      s5: begin                   //25
            case(in) 
           7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s6; out=0; add_still= 1; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s7; out=0; add_still= 1; change=7'd0;
                end 
            7'd20: begin                      //20rps
             ns<=s0; out=1; add_still= 0; change=7'd5;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd35;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
         end
       s6: begin                   //30
            case(in) 
            7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s5; out=0; add_still= 1; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s0; out=1; add_still= 0; change=7'd0;
                end 
            7'd20: begin                      //20rps
             ns<=s0; out=1; add_still= 0; change=7'd10;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd40;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
         end
      s7: begin                 //35
            case(in) 
           7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s0; out=1; add_still= 0; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s0; out=1; add_still= 0; change=7'd5;
                end 
            7'd20: begin                      //20rps
             ns<=s0; out=1; add_still= 0; change=7'd15;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd45;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
         end
    
      endcase
      
      if (out==1)
      begin
     productout=item;
     main_item=idle1;
     end
     end
     
  p_bottles:begin
         case (ns)                            //for plastic bottle--->25rps
      idle:begin  
            ns<=s0;out<=0; add_still=0;
            change=7'd0;
            end 
 s0: begin              //0
            case(in) 
            7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s1; out=0; add_still= 1; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s2; out=0; add_still= 1; change=7'd0;
                end 
            7'd20: begin                      //20rps
             ns<=s4; out=0; add_still= 1; change=7'd0;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd25;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
        end
    s1: begin           //5
            case(in) 
            7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s2; out=0; add_still= 1; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s3; out=0; add_still= 1; change=7'd0;
                end 
            7'd20: begin                      //20rps
             ns<=s0; out=1; add_still= 0; change=7'd0;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd30;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
        end
  s2: begin                    //10
            case(in) 
             7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s3; out=0; add_still= 1; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s4; out=0; add_still= 1; change=7'd0;
                end 
            7'd20: begin                      //20rps
             ns<=s0; out=1; add_still= 0; change=7'd5;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd35;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
         end
    s3: begin                //15
            case(in) 
           7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s4; out=0; add_still= 1; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s0; out=1; add_still= 0; change=7'd0;
                end 
            7'd20: begin                      //20rps
             ns<=s0; out=1; add_still= 0; change=7'd10;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd40;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
         end
     s4: begin              //20
            case(in) 
            7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s0; out=1; add_still= 0; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s0; out=1; add_still= 0; change=7'd5;
                end 
            7'd20: begin                      //20rps
             ns<=s0; out=1; add_still= 0; change=7'd15;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd45;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
         end 
         
      endcase
      
      if (out==1)
      begin
     productout=item;
     main_item=idle1;
     end
     end
      
  wrappers:begin
            case (ns)                            //for wrappers--->15rps  
      idle:begin  
            ns<=s0;out<=0; add_still=0;
            change=7'd0;
            end 
 s0: begin              //0
            case(in) 
            7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s1; out=0; add_still= 1; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s2; out=0; add_still= 1; change=7'd0;
                end 
            7'd20: begin                      //20rps
             ns<=s0; out=1; add_still= 0; change=7'd5;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd35;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
        end
    s1: begin           //5
            case(in) 
            7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s2; out=0; add_still= 1; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s0; out=1; add_still= 0; change=7'd0;
                end 
            7'd20: begin                      //20rps
             ns<=s0; out=1; add_still= 0; change=7'd10;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd40;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
        end
  s2: begin                    //10
            case(in) 
             7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s0; out=1; add_still= 0; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s0; out=1; add_still= 0; change=7'd5;
                end 
            7'd20: begin                      //20rps
             ns<=s0; out=1; add_still= 0; change=7'd15;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd45;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
         end 
     endcase
     
     if (out==1)
      begin
     productout=item;
     main_item=idle1;
     end
     
     end
     
 p_tub: begin
        case (ns)                            //for platic tub--->60rps
          idle:begin  
            ns<=s0;out<=0; add_still=0;
            change=7'd0;
            end 
 s0: begin              //0
            case(in) 
            7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s1; out=0; add_still= 1; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s2; out=0; add_still= 1; change=7'd0;
                end 
            7'd20: begin                      //20rps
             ns<=s4; out=0; add_still= 1; change=7'd0;
                end 
            7'd50: begin                      //50rps
             ns<=s10; out=0; add_still= 1; change=7'd0;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
        end
    s1: begin           //5
            case(in) 
            7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s2; out=0; add_still= 1; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s3; out=0; add_still= 1; change=7'd0;
                end 
            7'd20: begin                      //20rps
             ns<=s5; out=0; add_still= 1; change=7'd0;
                end 
            7'd50: begin                      //50rps
             ns<=s11; out=0; add_still= 1; change=7'd0;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
        end
  s2: begin                    //10
            case(in) 
             7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s3; out=0; add_still= 1; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s4; out=0; add_still= 1; change=7'd0;
                end 
            7'd20: begin                      //20rps
             ns<=s6; out=0; add_still= 1; change=7'd0;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd0;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
         end
    s3: begin                //15
            case(in) 
           7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s4; out=0; add_still= 1; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s5; out=0; add_still= 1; change=7'd0;
                end 
            7'd20: begin                      //20rps
             ns<=s7; out=0; add_still= 1; change=7'd0;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd5;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
         end
     s4: begin              //20
            case(in) 
            7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s5; out=0; add_still= 1; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s6; out=0; add_still= 1; change=7'd0;
                end 
            7'd20: begin                      //20rps
             ns<=s8; out=0; add_still= 1; change=7'd0;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd10;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
         end
      s5: begin                   //25
            case(in) 
           7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s6; out=0; add_still= 1; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s7; out=0; add_still= 1; change=7'd0;
                end 
            7'd20: begin                      //20rps
             ns<=s9; out=0; add_still= 1; change=7'd0;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd15;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
         end
       s6: begin                   //30
            case(in) 
            7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s7; out=0; add_still= 1; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s8; out=0; add_still= 1; change=7'd0;
                end 
            7'd20: begin                      //20rps
             ns<=s10; out=0; add_still= 1; change=7'd0;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd20;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
         end
      s7: begin                 //35
            case(in) 
           7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s8; out=0; add_still= 1; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s9; out=0; add_still= 1; change=7'd0;
                end 
            7'd20: begin                      //20rps
             ns<=s11; out=0; add_still= 1; change=7'd0;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd25;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
         end
      s8: begin              //40
            case(in) 
            7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s9; out=0; add_still= 1; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s10; out=0; add_still= 1; change=7'd0;
                end 
            7'd20: begin                      //20rps
             ns<=s0; out=1; add_still= 0; change=7'd0;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd30;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
         end
      s9: begin                   //45
            case(in) 
           7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s10; out=0; add_still= 1; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s11; out=0; add_still= 1; change=7'd0;
                end 
            7'd20: begin                      //20rps
             ns<=s0; out=1; add_still= 0; change=7'd5;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd35;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
         end
       s10: begin                   //50
            case(in) 
            7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s11; out=0; add_still= 1; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s0; out=1; add_still= 0; change=7'd0;
                end 
            7'd20: begin                      //20rps
             ns<=s0; out=1; add_still= 0; change=7'd10;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd40;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
         end
      s11: begin                 //55
            case(in) 
           7'd0: begin               //no input
             ns<=s0; out=0; add_still= 0; change=7'd0;
                end
            7'd5: begin                    //5rps
             ns<=s0; out=1; add_still= 0; change=7'd0;
                end 
            7'd10: begin                       //10rps
             ns<=s0; out=1; add_still= 0; change=7'd5;
                end 
            7'd20: begin                      //20rps
             ns<=s0; out=1; add_still= 0; change=7'd15;
                end 
            7'd50: begin                      //50rps
             ns<=s0; out=1; add_still= 0; change=7'd45;
                end   
            default: begin
             ns<=s0;out=0;add_still=0;change=7'd0;
                  end      
             endcase 
         end
    endcase
    
    if (out==1)
      begin
     productout=item;
     main_item=idle1;
     end
     end
  
default:begin
             ns<=s0;out=0;change=7'd0;add_still=0;
             end
endcase
end
end
endmodule












     


 
