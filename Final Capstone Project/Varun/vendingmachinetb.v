`timescale 1ns / 1ps


module vending_machine_tb;

  reg clk;
  reg rstn;
  reg pclk;
  reg [15:0] paddr;
  reg prstn;
  reg [31:0] pwdata;
  reg pwrite;
  reg i_valid;
  reg [15:0] note_val;
  reg item_valid;
  reg [15:0] item_code;

  wire [31:0] prdata;
  wire o_valid;
  wire [15:0] output_item;
  wire [15:0] note_change;

  vending_machine uut (
    .clk(clk),
    .rstn(rstn),
    .pclk(pclk),
    .paddr(paddr),
    .prstn(prstn),
    .pwdata(pwdata),
    .prdata(prdata),
    .pwrite(pwrite),
    .i_valid(i_valid),
    .note_val(note_val),
    .item_valid(item_valid),
    .item_code(item_code),
    .o_valid(o_valid),
    .output_item(output_item),
    .note_change(note_change)
  );

  always begin
    #5 clk = ~clk;
  end

  initial
    begin
    clk = 0;
    rstn = 1;
    pclk = 0;
    paddr = 16'h0;
    prstn = 1;
    pwdata = 32'h0;
    pwrite = 0;
    i_valid = 0;
    note_val = 0;
    item_valid = 0;
    item_code = 16'h0;

 
    #10 rstn = 0;

    #10 rstn = 1;

    #10 paddr = 16'h0;
    #10 pwdata = 32'hABCDE;
    #10 pwrite = 1;
    #10 pwrite = 0;

    #10 paddr = 16'h01;
    #10 pwdata = 32'h12345;
    #10 pwrite = 1;
    #10 pwrite = 0;

    #10 i_valid = 1;
    #10 note_val = 5;
    #10 i_valid = 0;

    #10 item_valid = 1;
    #10 item_code = 1;
    #10 item_valid = 0;

    #10 $finish;
  end

endmodule
