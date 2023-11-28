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


module vendingmachine_minor(wrappers,plasticbottles,packets,cans,plastictub,change,money,sel,clock,reset,extramoney

    );
    input [6:0]money;    
    input [4:0]sel;
    input clock;
    input reset;
    input [6:0]extramoney;
    output reg wrappers,plasticbottles,packets,cans,plastictub;
    output reg [6:0]change;
    reg[3:0]ps,ns;
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
    
  always@(posedge clock)
   if(reset)
     begin
        ns<=idle;
     end
     else
        ps<=ns;
        
        
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
                      change=money;
                      end
  fifteen:begin
                      if(money==money_5)
                         begin
                         wrappers<=1'b0;
                         plasticbottles<=1'b0;
                         packets<=1'b0;
                         cans<=1'b0;
                         plastictub<=1'b0;
                                   if(extramoney==money_10)
                                    begin
                                    wrappers<=1'b1;
                                    plasticbottles<=1'b0;
                                    packets<=1'b0;
                                    cans<=1'b0;
                                    plastictub<=1'b0;                        
                                    end
                                    else
                                    change=6'd0;
                                    if(extramoney==money_20)
                                     begin
                                     wrappers<=1'b1;
                                     plasticbottles<=1'b0;
                                     packets<=1'b0;
                                     cans<=1'b0;
                                     plastictub<=1'b0;                        
                                     end
                                     else
                                     change=6'd10;
                           end
                      else if(money==money_10)
                          begin
                          wrappers<=1'b0;
                          plasticbottles<=1'b0;
                          packets<=1'b0;
                          cans<=1'b0;
                          plastictub<=1'b0;
                                           if(extramoney==money_5)
                                           begin
                                           wrappers<=1'b1;
                                           plasticbottles<=1'b0;
                                           packets<=1'b0;
                                           cans<=1'b0;
                                           plastictub<=1'b0;                        
                                           end
                                           change=6'd0;
                                          if(extramoney==money_10)
                                            begin
                                           wrappers<=1'b1;
                                           plasticbottles<=1'b0;
                                           packets<=1'b0;
                                           cans<=1'b0;
                                           plastictub<=1'b0;                        
                                           end
                                           change=6'd5;
                                           
 
                          end
                          else if(money==money_20)
                          begin
                          wrappers<=1'b1;
                          plasticbottles<=1'b0;
                          packets<=1'b0;
                          cans<=1'b0;
                          plastictub<=1'b0;
                          change=6'd5;
                          end
                          else if(money==money_50)
                          begin
                          wrappers<=1'b1;
                          plasticbottles<=1'b0;
                          packets<=1'b0;
                          cans<=1'b0;
                          plastictub<=1'b0;
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
                                      if(extramoney==money_20)
                                       begin
                                       wrappers<=1'b0;
                                       plasticbottles<=1'b1;
                                       packets<=1'b0;
                                       cans<=1'b0;
                                       plastictub<=1'b0;                        
                                       end
                                       else
                                       change=6'd0;
                                       if(extramoney==money_50)
                                        begin
                                       wrappers<=1'b0;
                                       plasticbottles<=1'b1;
                                       packets<=1'b0;
                                       cans<=1'b0;
                                       plastictub<=1'b0;                        
                                       end
                                       change=6'd30;
                          end
                          else if(money==money_10)
                          begin
                          wrappers<=1'b0;
                          plasticbottles<=1'b0;
                          packets<=1'b0;
                          cans<=1'b0;
                          plastictub<=1'b0;                       
                                        if(extramoney==money_20)
                                         begin
                                         wrappers<=1'b0;
                                         plasticbottles<=1'b1;
                                         packets<=1'b0;
                                         cans<=1'b0;
                                         plastictub<=1'b0;                        
                                         end
                                         else

                                         change=6'd5;
                          end
                          else if(money==money_20)
                          begin
                          wrappers<=1'b0;
                          plasticbottles<=1'b0;
                          packets<=1'b0;
                          cans<=1'b0;
                          plastictub<=1'b0;
                                         if(extramoney==money_5)
                                         begin
                                         wrappers<=1'b0;
                                         plasticbottles<=1'b1;
                                         packets<=1'b0;
                                         cans<=1'b0;
                                         plastictub<=1'b0;                        
                                         end
                                         else
                                         change=6'd0;
                                         if(extramoney==money_10)
                                          begin
                                         wrappers<=1'b0;
                                         plasticbottles<=1'b1;
                                         packets<=1'b0;
                                         cans<=1'b0;
                                         plastictub<=1'b0;                        
                                         end
                                         change=6'd5;
                          end
                          else if(money==money_50)
                          begin
                          wrappers<=1'b0;
                          plasticbottles<=1'b1;
                          packets<=1'b0;
                          cans<=1'b0;
                          plastictub<=1'b0;
                          change=6'd25;
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
                             if(extramoney==money_50)
                             begin
                             wrappers<=1'b0;
                             plasticbottles<=1'b0;
                             packets<=1'b1;
                             cans<=1'b0;
                             plastictub<=1'b0;                        
                             end
                             else
                             change=6'd25;
                             end
                          else if(money==money_10)
                              begin
                              wrappers<=1'b0;
                              plasticbottles<=1'b0;
                              packets<=1'b0;
                              cans<=1'b0;
                              plastictub<=1'b0;
                               if(extramoney==money_20)
                                 begin
                                 wrappers<=1'b0;
                                 plasticbottles<=1'b0;
                                 packets<=1'b1;
                                 cans<=1'b0;
                                 plastictub<=1'b0;                        
                                 end
                             else
                              change=6'd10;
                              if(extramoney==money_50)
                               begin
                              wrappers<=1'b0;
                              plasticbottles<=1'b0;
                              packets<=1'b1;
                              cans<=1'b0;
                              plastictub<=1'b0;                        
                              end
                              change=6'd30;
                              end
                           else if(money==money_20)
                              begin
                              wrappers<=1'b0;
                              plasticbottles<=1'b0;
                              packets<=1'b0;
                              cans<=1'b0;
                              plastictub<=1'b0;
                               if(extramoney==money_10)
                                 begin
                                 wrappers<=1'b0;
                                 plasticbottles<=1'b0;
                                 packets<=1'b1;
                                 cans<=1'b0;
                                 plastictub<=1'b0;                        
                                 end
                          else
                              change=6'd0;
                              if(extramoney==money_20)
                               begin
                              wrappers<=1'b0;
                              plasticbottles<=1'b0;
                              packets<=1'b1;
                              cans<=1'b0;
                              plastictub<=1'b0;                        
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
                                 if(extramoney==money_50)
                                 begin
                                 wrappers<=1'b0;
                                 plasticbottles<=1'b0;
                                 packets<=1'b0;
                                 cans<=1'b1;
                                 plastictub<=1'b0;                        
                                 end
                                 else
                                 change=6'd15;
                                 end
                              else if(money==money_10)
                                  begin
                                  wrappers<=1'b0;
                                  plasticbottles<=1'b0;
                                  packets<=1'b0;
                                  cans<=1'b0;
                                  plastictub<=1'b0;
                                  if(extramoney==money_50)
                                  begin
                                  wrappers<=1'b0;
                                  plasticbottles<=1'b0;
                                  packets<=1'b0;
                                  cans<=1'b1;
                                  plastictub<=1'b0;                        
                                  end
                                  else
                                  change=6'd20;
                                  end
                               else if(money==money_20)
                                  begin
                                  wrappers<=1'b0;
                                  plasticbottles<=1'b0;
                                  packets<=1'b0;
                                  cans<=1'b0;
                                  plastictub<=1'b0;
                                  if(extramoney==money_20)
                                   begin
                                  wrappers<=1'b1;
                                  plasticbottles<=1'b0;
                                  packets<=1'b0;
                                  cans<=1'b1;
                                  plastictub<=1'b0;                        
                                  end
                                  change=6'd0;
                                 if(extramoney==money_50)
                                    begin
                                    wrappers<=1'b0;
                                    plasticbottles<=1'b0;
                                    packets<=1'b0;
                                    cans<=1'b1;
                                    plastictub<=1'b0;                        
                                    end
                                    else
                                  change=6'd20;
                                  end
                                  else if(money==money_50)
                                  begin
                                  wrappers<=1'b0;
                                  plasticbottles<=1'b0;
                                  packets<=1'b0;
                                  cans<=1'b1;
                                  plastictub<=1'b0;
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
                                  end
                               else if(money==money_10)
                                   begin
                                   wrappers<=1'b0;
                                   plasticbottles<=1'b0;
                                   packets<=1'b0;
                                   cans<=1'b0;
                                   plastictub<=1'b0;
                                   if(extramoney==money_50)
                                      begin
                                      wrappers<=1'b0;
                                      plasticbottles<=1'b0;
                                      packets<=1'b0;
                                      cans<=1'b0;
                                      plastictub<=1'b1;                        
                                      end
                                   else
                                   change=6'd0;
                                   end
                                else if(money==money_20)
                                   begin
                                   wrappers<=1'b1;
                                   plasticbottles<=1'b0;
                                   packets<=1'b0;
                                   cans<=1'b0;
                                   plastictub<=1'b0;
                                   if(extramoney==money_50)
                                   begin
                                   wrappers<=1'b0;
                                   plasticbottles<=1'b0;
                                   packets<=1'b0;
                                   cans<=1'b0;
                                   plastictub<=1'b1;                        
                                   end
                                   else
                                   change=6'd10;
                                   end
                                   else if(money==money_50)
                                   begin
                                   wrappers<=1'b0;
                                   plasticbottles<=1'b0;
                                   packets<=1'b0;
                                   cans<=1'b0;
                                   plastictub<=1'b0;
                                   if(extramoney==money_10)
                                   begin
                                   wrappers<=1'b0;
                                   plasticbottles<=1'b0;
                                   packets<=1'b0;
                                   cans<=1'b0;
                                   plastictub<=1'b1;                        
                                   end
                                   else
                                   change=6'd0;
                                   end
                                   end                     
              
     endcase
     
    end
    
          
               
         
    
endmodule