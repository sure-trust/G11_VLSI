`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:49:24 11/14/2023 
// Design Name: 
// Module Name:    vendingmachine 
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
module vendingmachine(
  input wire clk,
  input wire rst,
  input wire [1:0] note_input, 
  input wire vend_request,
  input wire item_cost,      
  output reg vend_success,
  output reg[3:0] change_output
);

  reg [3:0] note_value; 
  reg [3:0] balance;    
  reg [3:0] change;     

  parameter IDLE = 2'b00;
  parameter PROCESSING = 2'b01;
  parameter VEND_SUCCESS = 2'b10;

  reg [1:0] state, next_state;

  always @(posedge clk or posedge rst)
  begin
    if (rst)
	 begin
      state <= IDLE;
      note_value <= 4'b0;
      balance <= 4'b0;
      change <= 4'b0;
    end else begin
      state <= next_state;
    end
  end

  always @(*) 
  begin

    next_state = state;
    vend_success = 1'b0;
    change_output = 4'b0;

    case (state)
      IDLE: begin
        if (vend_request) 
		  begin
          
          case (note_input)
            2'b00: note_value = 4'b0101;
            2'b01: note_value = 4'b1010;
            2'b10: note_value = 4'b10100;
            2'b11: note_value = 4'b110010;
          endcase

          balance = balance + note_value;

         
          if (balance >= item_cost)
			 begin
            next_state = PROCESSING;
            balance = balance - item_cost;
          end
        end
      end

      PROCESSING: 
		begin
        
        change = balance;
        balance = 4'b0;
        next_state = VEND_SUCCESS;
      end

      VEND_SUCCESS:
		begin
        
        vend_success = 1'b1;
        change_output = change;
        next_state = IDLE;
      end
    endcase
  end

endmodule


