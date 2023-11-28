`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.11.2023 20:12:20
// Design Name: 
// Module Name: vmachine2_tb
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


module vmachine2_tb();
    reg clk,rst;
    reg [6:0]in;
    reg [9:0]item;
    wire out,add_still;
    wire [7:0]change;
    wire [9:0]productout;
    
    initial begin
    rst=1;clk=0;
    end 
    
    vmachine2 a1(clk,rst,in,item,out,add_still,change,productout);
    initial clk=0;
    always #5 clk= ~clk;
    initial begin
    #10
    rst=0;clk=1;
    #20
    in=7'd50;
    item=8'd61;
    #20
    $finish;
    end
endmodule

   

