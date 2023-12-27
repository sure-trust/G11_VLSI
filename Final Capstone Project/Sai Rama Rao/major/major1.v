`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.12.2023 11:00:53
// Design Name: 
// Module Name: major1
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


module major1 #(parameter items=64,itemsize=6)(
input clk,
	input rstn,
	// Apb
	input pclk,
    input prstn,
	input [31:0] paddr,
	input pwrite,
	input psel,
	input [31:0] pwdata,
	output [31:0] prdata,
//	output pready,
  //Note interface
	input i_valid,
	input [6:0]note_val,
	//Item interface
	input item_valid,
	input [itemsize-1:0] item_code,
	//Output
	output  reg o_valid,
	output reg [itemsize-1:0]output_item,
	output reg [15:0] note_change
    );
   
    reg [31:0]item_cfg[items-1:0];
    reg item_dispensed;
    reg [itemsize-1:0]item_selected;
    reg item_validr,item_rising;
    reg i_validr,i_rising;
    reg [16:0]amount;
    reg [15:0]item_value;
    
    ///apb
    genvar i;
    generate
    for(i=0;i<64;i=i+1)
    begin
    always @(posedge pclk or negedge prstn)
    begin
    if(!prstn)
    begin
    item_cfg[i]<={8'd0,8'd100,16'ha};
    end//endif
    else
    begin
    if(psel & pwrite & paddr[5:0]==i)
    begin
    
    item_cfg[i]<=pwdata;
    end
    else if(item_dispensed)
    begin
    item_cfg[item_selected][23:16]<= item_cfg[item_code][23:16]-1'b1;
    item_cfg[item_selected][31:24]<=item_cfg[item_selected][31:24]+1'b1;
    end
    end//else 
    end//always
    end//for
    endgenerate
    assign prdata=item_cfg[paddr[5:0]];
///////// item selection
always @(posedge item_valid)
begin
if(!rstn)
item_validr<=0;
else
item_validr<=1'b1;
end
    always@(posedge clk or negedge rstn)
    begin
        if(!rstn) item_selected<={6{1'b1}};
        else begin
            if(item_validr) begin
                item_selected<=item_code;item_validr=0;
                item_value<=item_cfg[item_code][15:0];
            end
            else if(item_dispensed)
                begin
                item_selected<={6{1'b1}};
                end
        end
    end
    //
always @(posedge i_valid)
begin
if(!rstn)
i_validr<=0;
else
if((note_val==7'd5) ||(note_val==7'd10) || (note_val==7'd20) || (note_val==7'd50) || (note_val==7'd100))
i_validr<=1'b1;
end 
always @(posedge clk or negedge rstn)
begin
    if(!rstn)
        begin 
        amount<=0;
        o_valid <= 1'b0;
        output_item <= {itemsize{1'b0}};
        note_change <= 'h0;
        item_dispensed<=1'b0;
        end
    else
        begin
        o_valid <= 1'b0;
        output_item <= {itemsize{1'b0}};
        note_change <= 16'b0;
        item_dispensed<=1'b0;
        if(i_validr)
        begin
            if(item_cfg[item_selected][23:16]>0)
            begin
                o_valid<=1'b0;
                output_item<={itemsize{1'b1}};
                i_validr<=0;
                item_dispensed<=1'b0;
                note_change<=amount;
            end
            if((amount + note_val) >=item_value)
            begin
                o_valid<=1'b1;
                output_item<=item_selected;
                i_validr<=0;
                item_dispensed<=1'b1;
                note_change<=(amount+note_val)-item_value;
            end
            else
            begin
             amount<=amount+ note_val;
             i_validr<=0;
            end
            
        
        end
        end
end
endmodule
