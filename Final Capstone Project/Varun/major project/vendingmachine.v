`timescale 1ns / 1ps
module vending_machine (
  input wire clk,            
  input wire rstn,           
  input wire pclk,           
  input wire [15:0] paddr,    
  input wire prstn,           
  input wire [31:0] pwdata,  
  output wire [31:0] prdata,  
  input wire pwrite,          
  input wire i_valid,         
  input wire [15:0] note_val,  
  input wire item_valid,      
  input wire [15:0] item_code, 
  output wire o_valid,         
  output wire [15:0] output_item, 
  output wire [15:0] note_change 
);
  reg [15:0] vending_machine_cfg;
  reg [15:0] item_cfg [0:63]; 
  reg [15:0] total_rupees_inserted;
  reg [15:0] item_value;

  always @(posedge clk or negedge rstn) 
	begin
    if (~rstn) 
	begin
      total_rupees_inserted <= 0;
      item_value <= 0;
      end	
        else 
	 begin
         if (i_valid) 
	  begin
           total_rupees_inserted <= total_rupees_inserted + note_val;
          end

         if (item_valid) 
	  begin
           item_value <= item_cfg[item_code];
          end

        if (total_rupees_inserted >= item_value) 
	 begin
        o_valid <= 1;
        output_item <= item_code;
        note_change <= total_rupees_inserted - item_value;
        total_rupees_inserted <= 0;
         end  
	 else 
	 begin
        o_valid <= 0;
        output_item <= 16'hFFFF;
        note_change <= 0;
      end
    end
  end

  always @(posedge pclk or negedge prstn) 
   begin
    if (~prstn) 
     begin
      vending_machine_cfg <= 0;
      item_cfg <= 0;
     end 
     else 
      begin
      if (pwrite)
   	begin
        case (paddr)
          16'h00: vending_machine_cfg <= pwdata;
          16'h01: item_cfg[paddr[5:0]] <= pwdata;
          default: 
        endcase
      else 
	begin
        case (paddr)
          16'h00: prdata <= vending_machine_cfg; 
          16'h01: prdata <= item_cfg[paddr[5:0]]; 
          default: 
        endcase
      end
    end
  end
endmodule

