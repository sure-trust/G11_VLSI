`define DEPTH 8
`define WIDTH 8
`define WPTR $clog2(`DEPTH)
//depth = name 1st+last
//Priyanshu ---> P+U=37kB
//address bus width = log2(37kb/8) = log2(4736) ~= 13 add bus ==> so width of ptr = 14
//+databus = 8bits
//+brute force syncronizers
//+bin to gray n vice versa
//                 __________
//  wr_clk--------|>        <|------rd_clk
//  wr_en ------->|          |<-----rd_en
// wr_rst ------->|          |<-----rd_rst
//wr_data ===/===>|          |
//                |          |===/==> rd_data
//                |          |------> full
//                |          |------> empty
//                |__________|


`timescale 1ns / 1ps  
module async_fifo
  (
    input wr_clk,        //-----------
    input wr_en,
    input [`WIDTH-1:0]wr_data, //write system
    input wr_rst,     //----------
    input rd_clk,
    input rd_en,        //read system
    input rd_rst,
    output reg [`WIDTH-1:0]rd_data, //---------
    output full,   //some status signal for debugging
    output empty
  );

  reg [`WIDTH-1 : 0]mem[0:`DEPTH-1];
  reg [`WPTR:0]rd_ptr, wr_ptr;
//  wire [`WPTR-1:0]rd_add, wr_add;
  wire [`WPTR:0] gray_wr_ptr, gray_rd_ptr,   //rd/wr ptr to gray code
       sync_gray_wr_ptr, sync_gray_rd_ptr, // that wr/rd ptr in gray code through 2ff syncronizers
       sync_wr_ptr, sync_rd_ptr; //and...back to binary

  //READ PTR
  b2g inst(rd_ptr, gray_rd_ptr); //conv it to gray
  syncro inst1(wr_clk, wr_rst, gray_rd_ptr, sync_gray_rd_ptr);//send it to write side through 2ff syncronizer
  g2b inst2(sync_gray_rd_ptr, sync_rd_ptr);


  //WRITE PTR
  b2g inst3(wr_ptr, gray_wr_ptr); //conv it to gray
  syncro inst4(rd_clk, rd_rst, gray_wr_ptr, sync_gray_wr_ptr);//send it to read side through 2ff syncronizer
  g2b inst5(sync_gray_wr_ptr, sync_wr_ptr);
   
   always @(posedge wr_clk or posedge wr_rst)
  begin
    if(wr_rst)
    begin
      wr_ptr <= 0; 
    end
    else if(!full && wr_en)
    begin
      mem[wr_ptr]<=wr_data;
      wr_ptr <= (wr_ptr+1)%(1 << (`WPTR+1));
    end
  end
  
    always @(posedge rd_clk or posedge rd_rst)
  begin
    if(rd_rst)
    begin
      rd_ptr <= 0;
    end
    else if(!empty && rd_en)
    begin
      rd_data <= mem[rd_ptr];
      rd_ptr <= (rd_ptr+1)%(1 << (`WPTR+1));
    end
  end

    //empty and full conditions
  assign empty = (rd_ptr == sync_wr_ptr) ? 1'b1 : 1'b0;
  assign full  = ({~(sync_rd_ptr[`WPTR]),sync_rd_ptr[(`WPTR-1):0]} == wr_ptr) ? 1'b1 : 1'b0;


endmodule
  
 

//--------------bin to gray conv----
//ptr changes often...gray code to avoid metastability
module b2g(bin, gray);
  input [`WPTR:0]bin;
  output [`WPTR:0]gray;

  genvar i;
  generate
    for(i=0; i<`WPTR; i=i+1)
    begin
      assign  gray[i] = bin[i] ^ bin[i+1];
    end
  endgenerate
  assign gray[`WPTR]=bin[`WPTR];
endmodule

//-------------gray to binary conv----
module g2b(gray, binary);
  input [`WPTR:0]gray;
  output [`WPTR:0]binary;
  genvar i;
    generate
      for (i = `WPTR; i > 0; i=i-1)
    begin : xor_tag
        xor (binary[i-1], binary[i], gray[i-1]);
    end
    endgenerate
    
  assign binary[`WPTR] = gray[`WPTR];
endmodule


//--------2ff synchronizers-----
//ptrs are transferred using these synchronizers
//rd_ptr txr to write system and vice-versa
module syncro(clk,rst,d,q);
  input clk;
  input rst;
  input [`WPTR:0]d;
  output reg [`WPTR:0]q;

  reg [`WPTR:0]q0;
  always @(posedge clk)
  begin
    if(rst)
    begin
      q0<=0;
      q<=0;
    end
    else
    begin
      q0<=d;
      q<=q0;
    end
  end
endmodule