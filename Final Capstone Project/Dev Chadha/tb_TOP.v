
module TOP_tb;

  // Parameters
  localparam  K = 0;
  localparam  N = 0;

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
  reg [K-1:0] item_code;
  wire  o_valid;
  wire [K-1:0] output_item;
  wire [K-1:0] note_exchange;

  TOP # (
    .K(K),
    .N(N)
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

//always #5  clk = ! clk ;

endmodule