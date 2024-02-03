`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 15.12.2023 19:44:14
// Design Name: 
// Module Name: asynchronousfifo_tb
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


`timescale 1ns/1ns

module AsyncFIFO_TestBench();


parameter DATA_WIDTH=8;
reg w_clk,r_clk, rst_n, wr_en, rd_en;
reg [DATA_WIDTH-1:0] data_in, data_out;
wire empty, full;

AsyncFIFO_Top uut (
  .w_clk(w_clk),
  .r_clk(r_clk),
  .rst_n(rst_n),
  .wr_en(wr_en),
  .data_in(data_in),
  .data_out(data_out),
  .empty(empty),
  .full(full)
);

initial begin
  // Initialize inputs
 w_clk = 0;
 r_clk=0;
  rst_n = 0;
  wr_en = 0;
  rd_en = 0;
  data_in = 8'b0;

  // Apply reset
  #10 rst_n = 1;

  //  Write and Read
  #10 wr_en = 1; data_in = 8'b10101010; // Write data
  #10 wr_en = 0; // Stop writing

  #10 rd_en = 1; // Start reading
 

 

  #10 $stop; // Stop the simulation
end



endmodule
