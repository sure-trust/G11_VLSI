`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.12.2023 14:38:37
// Design Name: 
// Module Name: major_tb
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


module major_tb();
reg clk;
reg rstn;
reg pclk;
reg prstn;
reg[31:0] paddr;
reg pwrite;
reg psel;
reg[31:0] pwdata;
 wire [31:0] prdata;
reg i_valid;
reg note_val;
//Item interface
reg item_valid;
reg [5:0] item_code;
//Output
wire  o_valid;
wire output_item;
wire [15:0] note_change;
major  dut(.clk(clk),.rstn(rstn),.pclk(pclk),.prstn(prstn),.paddr(paddr),.pwrite(pwrite),.psel(psel),.pwdata(pwdata),
.prdata(prdata),.i_valid(i_valid),.note_val(note_val),.item_valid(item_valid),.item_code(item_code),
.o_valid(o_valid),.output_item(output_item),.note_change(note_change));

always #5 clk <= !clk;
always #10 pclk <=!pclk;
initial begin
clk<=1;
pclk<=1;
i_valid=0;
rstn<=0;
prstn<=0;
end
initial begin
paddr=16'h0000;
pwrite=1'b1;
psel=1'b1;
pwdata={8'd0, 8'd100, 16'hA};
note_val=7'b0001010;
item_valid=1'b1;
item_code=1'b1;
end


endmodule
