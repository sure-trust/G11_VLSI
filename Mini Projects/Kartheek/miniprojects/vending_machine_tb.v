`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.11.2023 15:30:41
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


module vending_machine_tb( );
//inputs
//reg [4:0] item;
reg[8:0] item;
reg clk,rst;
reg [6:0] amount;
//outputs
wire [7:0] change;
wire add_more;
wire product;
wire [7:0] outcome;

vending_machine dut(.outcome(outcome),.clk(clk),.rst(rst),.item(item),.change(change),.amount(amount),.add_more(add_more),.product(product));
 initial clk=0;
 always #5 clk=~clk;
 initial
 begin
  rst=1;
#10 rst=0;
amount=7'd5;
item=7'd100; 
#100 $finish;
end

endmodule
