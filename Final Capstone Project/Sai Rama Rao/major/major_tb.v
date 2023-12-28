`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.12.2023 16:47:15
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


module major_tb #(parameter items=64,itemsize=6)();

  reg clk;
	reg rstn;
	
	reg pclk;
    reg prstn;
	reg [31:0] paddr;
	reg pwrite;
	reg psel;
	reg [31:0] pwdata;
	wire [31:0] prdata;

	reg i_valid;
	reg [6:0]note_val;
	reg item_valid;
	reg [itemsize-1:0]item_code;
	
	wire   o_valid;
	wire  [itemsize-1:0]output_item;
	wire [15:0] note_change;
	major1 dut(clk,rstn,pclk,prstn,paddr,pwrite,psel,pwdata,prdata,i_valid,note_val,item_valid,item_code,o_valid,output_item,note_change);
	initial
	begin
	clk=0;pclk=0;
	prstn=0;rstn=0;i_valid=0;item_valid=0;
	#50 prstn=1;
	paddr=0; pwrite=1'b1;psel=1'b1;
	pwdata={7'b0,7'd100,16'd150};
	#50 pwrite=1'b0;
	#10 rstn=1'b1;
	#10 item_valid=1'b1;item_code=0;
	#10 i_valid=1'b1;note_val=7'd100;
	#5 i_valid=1'b0;
	#10 i_valid=1'b1;note_val=7'd100;
	
	
	end
	always #50 pclk=~pclk;
	always #5 clk=~clk;
endmodule