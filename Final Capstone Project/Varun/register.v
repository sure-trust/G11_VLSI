`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:13:45 11/02/2023 
// Design Name: 
// Module Name:    register 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module register(clk,wr_en,rd_en,address1,address2,rd_address1,rd_address2,wr_address1,wr_address2
						rd_data1,rd_data2
                                    );
	 input clk;
	 input wr_en;
	 input rd_en;
	 input[4:0]address1;
	 input[4:0]address2;
	 input[31:0]wr_address1;
	 input[15:0]wr_address2;
	 input[31:0]rd_address1;
	 input[15:0]rd_address2;
	 output reg[31:0]rd_data1;
	 output reg[15:0]rd_data2;
	 
reg[31:0]register1[31:16];
reg[15:0]register2[15:0];

always@(posedge clk)
		begin
		if(rd_en&&rd_address1==5'b11111)
				rd_data1<=register1[31];
		else if(rd_en&&rd_address1==5'b01111)
				rd_data2<=register2[15];
		else	
				begin 
				rd_data<=32'b;
				rd_data<=16'b;
				end
		end
always@(negedge clk)
			begin
			if(wr_en)
				register2[15]<=register2[1]^register2[2];
			else
				register2[15]<=register2[15];
				register1[31]<=32'b00100000000000110000100000100001;
				end
		endmodule
