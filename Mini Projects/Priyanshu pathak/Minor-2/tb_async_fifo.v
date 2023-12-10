`timescale 1ns / 1ps

module tb_async_fifo;

  // Parameters
  `define DEPTH 8
  `define WIDTH 8

  // Signals
  reg wr_clk, rd_clk, wr_en, rd_en, wr_rst, rd_rst;
  reg [`WIDTH-1:0] wr_data;
  wire [`WIDTH-1:0] rd_data;
  wire full, empty;

  // Instantiate async_fifo module
  async_fifo uut (
    .wr_clk(wr_clk),
    .rd_clk(rd_clk),
    .wr_en(wr_en),
    .wr_data(wr_data),
    .wr_rst(wr_rst),
    .rd_en(rd_en),
    .rd_rst(rd_rst),
    .rd_data(rd_data),
    .full(full),
    .empty(empty)
  );

  // Clock generation
  initial begin
    
    rd_clk = 0;
    forever #10 rd_clk = ~rd_clk;
  
    
  end
  initial begin
    wr_clk = 0;
  
    forever #5 wr_clk = ~wr_clk;
    
  end

  // Stimulus
  initial begin
    wr_en = 0;
    wr_rst = 0;
    rd_en = 0;
    rd_rst = 0;
    wr_data = 8'b00000000;

    // Reset
    #20 wr_rst = 1;
    #20 wr_rst = 0;
    #20 rd_rst = 1;
    #20 rd_rst = 0;

    // Write and read operations
    #20 wr_en = 1; wr_data = 8'b11001100; // Write data
    #20 wr_en = 1; wr_data = 8'b10101010; // Write more data

    #20 rd_en = 1; // Read data
    #20 rd_en = 0; // Stop reading

    // Add more test cases as needed

    // End simulation
    #100 $finish;
  end
// VCD Files
    initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
