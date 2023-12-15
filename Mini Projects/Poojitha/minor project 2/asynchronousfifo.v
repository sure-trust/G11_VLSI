module AsyncFIFO_Top #(parameter DATA_WIDTH = 8)(
  input  r_clk,
  input w_clk,
  input  w_rst_n,
  input  wr_en,
  input  [DATA_WIDTH-1:0] data_in,
  output wire[DATA_WIDTH-1:0] data_out,
  output wire empty,
  output wire full
);
reg [DATA_WIDTH-1:0] data_out_internal;
reg empty_internal, full_internal;
wire wr_addr;
wire rd_en;
wire rd_addr;
wire rst_n;
wire clk_w;
wire clk_r;
FIFO_Memory memory_module (
  .r_clk(r_clk),
  .w_clk(w_clk),
  .data_in(data_in),
  .wr_en(wr_en),
  .wr_addr(wr_addr),
  .data_out(data_out_internal),
  .rd_en(rd_en),
  .rd_addr(rd_addr),
  .empty(empty_internal),
  .full(full_internal)
);

FIFO_Write write_module (
  .w_clk(w_clk),
  .rst_n(rst_n),
  .wr_en(wr_en),
  .data_in(data_in),
  .empty(empty_internal),
  .full(full_internal),
  .wr_addr(wr_addr)
);
Synchronizer sync_rd (
  .clk_w(clk_w),
  .clk_r(clk_r),
  .rst_n(rst_n),
  .data_in(data_in),
  .data_out(data_out)
);

FIFO_Read read_module (
  .r_clk(r_clk),
  .rst_n(rst_n),
  .rd_en(rd_en),
  .data_out(data_out_internal),
  .empty(empty_internal),
  .full(full_internal),
  .rd_addr(rd_addr)
);

assign data_out = data_out_internal;
assign empty = empty_internal;
assign full = full_internal;

endmodule
module FIFO_Write #(parameter DATA_WIDTH=8,ADDR_WIDTH=4,parameter DEPTH=17)(
  input wire w_clk,
  input wire rst_n,
  input wire wr_en,
  input wire [DATA_WIDTH-1:0] data_in,
  output wire empty,
  output wire full,
  output reg [ADDR_WIDTH-1:0] wr_addr
);

reg [DATA_WIDTH-1:0] memory [0:DEPTH-1];
reg [ADDR_WIDTH-1:0] wr_ptr, rd_ptr;
reg [ADDR_WIDTH-1:0] next_wr_ptr;
reg [3:0] count;

assign empty = (count == 0);
assign full = (count == DEPTH);

always @(posedge w_clk or negedge rst_n) begin
  if (~rst_n) begin
    wr_ptr <= 0;
    rd_ptr <= 0;
    count <= 0;
  end else begin
    if (wr_en && ~full) begin
      memory[wr_ptr] <= data_in;
      next_wr_ptr <= wr_ptr + 1;
      count <= count + 1;
    end
  end
end

always @(posedge w_clk or negedge rst_n) begin
  if (~rst_n) begin
    wr_addr <= 0;
  end else begin
    if (wr_en && ~full) begin
      wr_addr <= wr_ptr;
    end
  end
end

endmodule
module FIFO_Read #(parameter DEPTH = 17,DATA_WIDTH = 8,ADDR_WIDTH = 4) (
  input wire r_clk,
  input wire rst_n,
  input wire rd_en,
  output reg [DATA_WIDTH-1:0] data_out,
  output wire empty,
  output wire full,
  output reg [ADDR_WIDTH-1:0] rd_addr
);



reg [DATA_WIDTH-1:0] memory [0:DEPTH-1];
reg [ADDR_WIDTH-1:0] wr_ptr, rd_ptr;
reg [3:0] count;


assign empty = (count == 0);
assign full = (count == DEPTH);

always @(posedge r_clk or negedge rst_n) begin
  if (~rst_n) begin
    wr_ptr <= 0;
    rd_ptr <= 0;
    count <= 0;
  end else begin
    if (rd_en && ~empty) begin
      data_out <= memory[rd_ptr];
      rd_ptr <= rd_ptr + 1;
      count <= count - 1;
    end
  end
end

always @(posedge r_clk or negedge rst_n) begin
  if (~rst_n) begin
    rd_addr <= 0;
  end else begin
    if (rd_en && ~empty) begin
      rd_addr <= rd_ptr;
    end
  end
end

endmodule
module BinaryToGray #(parameter N = 4)(
  input wire [N-1:0] binary,
  output wire [N-1:0] gray
);
genvar i;
generate
  for (i = 1; i < N; i = i + 1) begin
    assign gray[i] = binary[i-1] ^ binary[i-1];
  end
endgenerate

endmodule
module GrayToBinary#(parameter N = 4) (
  input wire [N-1:0] gray,
  output wire [N-1:0] binary
);

assign binary[0] = gray[0];
genvar i;
generate
  for (i = 1; i < N; i = i + 1) begin
    assign binary[i] = binary[i-1] ^ gray[i];
  end
endgenerate

endmodule
module FIFO_Memory #(parameter DEPTH=16,DATA_WIDTH = 8, ADDR_WIDTH = 4)(
  input wire w_clk,
  input wire r_clk,
  input wire rst_n,
  input wire [DATA_WIDTH-1:0] data_in,
  input wire wr_en,
  input wire [ADDR_WIDTH-1:0] wr_addr,
  output reg [DATA_WIDTH-1:0] data_out,
  input wire rd_en,
  input wire [ADDR_WIDTH-1:0] rd_addr,
  output reg empty,
  output reg full
);

reg [DATA_WIDTH-1:0] memory [0:DEPTH-1];

always @(posedge w_clk or negedge rst_n) begin
  if (~rst_n) 
  begin
    memory[wr_addr] <= 0;
    empty <= 1'b1;
    full <= 1'b0;
  end
   else
    begin
    if (wr_en && ~full) 
    begin
      memory[wr_addr] <= data_in;
    end
    end
    end
always @(posedge r_clk)
begin
    if (rd_en && ~empty) 
    begin
      data_out <= memory[rd_addr];
    end

    empty <= (wr_en && ~full) ? 1'b0 : (rd_en && empty) ? 1'b1 : empty;
    full <= (wr_en && full) ? 1'b1 : (rd_en && ~empty) ? 1'b0 : full;
  end


endmodule
module Synchronizer#(parameter N = 8)(
  input wire w_clk,
  input wire r_clk,
  input wire rst_n,
  input wire [N-1:0] data_in,
  output [(N-1):0] synchronized_data
);



reg [N-1:0] ff1;
reg [N-1:0] ff2;

always @(posedge r_clk or posedge rst_n) begin
  if (rst_n)
    ff1 <= 0;
  else
    ff1 <= data_in;
end

always @(posedge w_clk) begin
  ff2 <= ff1;
end

assign synchronized_data = ff2;

endmodule