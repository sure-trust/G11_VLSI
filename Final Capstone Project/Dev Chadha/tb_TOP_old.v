`timescale 1ns/1ps
module TOP_tb;

  // Parameters
  localparam  K = 64;
  localparam  N = 7;
  localparam D = 6;

  //Ports
  reg  clk;
  reg  rstn;
  reg  pclk;
  reg [15:0] paddr;
  reg  prstn;
  reg [31:0] pwdata;
  wire [31:0] prdata;
  reg  pwrite;
  reg  i_valid;
  reg [N-1:0] note_val;
  reg  item_valid;
  reg [D-1:0] item_code;
  wire  o_valid;
  wire [D-1:0] output_item;
  wire [N-1:0] note_exchange;

  TOP # (
    .K(K),
    .N(N),
    .D(D)
  )
  TOP_inst (
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
    .note_exchange(note_exchange)
  );

  // General Interface

  // System clk
  always #5  clk = ! clk ;

  // pclk
  always #50 pclk = ! pclk;
  
  initial begin
    clk <= 1;
    pclk <= 1;
    // resets
    #10;
    rstn <= 0;
    prstn <= 0;
    #10;
    rstn <= 1;
    prstn <= 1;
    #500;
    prstn <= 0;

    // Initial values of signals
    i_valid <= 1'b0;
    item_valid <= 1'b0;
  end

  // Stimulus
  initial begin
    #20;
    // APB Interface for configuration
    // APB interface will be active for 500ns
    pwrite <= 1'b1;
    paddr <= 16'h0000;
    pwdata <= {8'd0, 8'd100, 16'h000A};
    #100;
    paddr <= 16'h0001;
    pwdata <= {8'd0, 8'd100, 16'h0014};
    #100;
    paddr <= 16'h0002;
    pwdata <= {8'd0, 8'd100, 16'h0028};
    #100;
    paddr <= 16'h0003;
    pwdata <= {8'd0, 8'd100, 16'h0032};
    #100;
    paddr <= 16'h0004;
    pwdata <= {8'd0, 8'd100, 16'h0046};
    #100;
    pwrite <= 1'b0;
    paddr <= 16'h0000;
    pwdata <= 32'b0;

    // Arbitrary delay
    #50;

    // Item selection interface
//    item_valid <= 1'b1;
//    item_code <= 7'b0;
//    #20;                      //  Check for 10ns as well
//    item_valid <= 1'b0;

//    // Arbitrary delay
//    #50;

//    // Money input interface
//    i_valid <= 1'b1;
//    note_val <= 7'b000_0101;
//    #20;

//    i_valid <= 1'b0;
//    #20;
//    i_valid <= 1'b1;
//    note_val <= 7'b000_0101;
//    #20;
    
    item_valid <= 1'b1;
    item_code <= 6'b00_0001;
    #20;                      //  Check for 10ns as well
    item_valid <= 1'b0;

    // Arbitrary delay
    #50;

    // Money input interface
    i_valid <= 1'b1;
    note_val <= 7'h32;
    #20;

    i_valid <= 1'b0;
    #20;
//    i_valid <= 1'b1;
//    note_val <= 7'b000_0101;
//    #20;

    // Arbitrary delay
    #500;
    $finish();
  end
	
  // VCD Files
    initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule