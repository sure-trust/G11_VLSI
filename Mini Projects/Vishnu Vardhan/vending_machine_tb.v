`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.11.2023 15:43:55
// Design Name: 
// Module Name: vending_machine_tb
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


module vending_machine_tb();
reg [2:0]in,product_select;
reg clk,rst;
wire out;wire [2:0]change;
vending_machine dut(.in(in),.product_select(product_select),.clk(clk),.rst(rst),.out(out),.change(change));
initial clk=0;
always #2 clk=~clk;
initial 
begin
rst=1; #10;
rst=0;product_select=3'b000;in=3'b010; #2; in=3'b010; #2;in=3'b010; #2;in=3'b010; #2;in=3'b010; #2; $finish();
end
endmodule
