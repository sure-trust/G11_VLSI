`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.11.2023 12:57:24
// Design Name: 
// Module Name: minor1_tb
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


module minor1_tb();
reg [5:0]item;
reg [6:0]amount;
reg clk,rst;
wire add_more;
wire [5:0]fproduct;
wire [7:0]change;
minor1 dut(item,amount,clk,rst,add_more,fproduct,change);
initial clk=0;
always #5 clk=~clk;
initial 
begin
rst=1;item=6'd4;amount=7'd5;
#10  rst=0;
#20 amount=7'd50;
#50 item=6'd9;amount=7'd5;
#10 amount=7'd20;
#50 $finish;
end

endmodule
