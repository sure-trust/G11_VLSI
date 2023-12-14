`timescale 1ns / 1ps


module minor2(wr_en,rd_en,w_clk,w_rst,data_in,data_out,fifo_full,
              fifo_empty,rd_clk,rd_rst
    );
    parameter d_width=8;
    parameter address=33;
    input wr_en,rd_en,w_clk,w_rst,rd_clk,rd_rst;
  
    input [d_width-1:0]data_in;
    output reg [d_width-1:0]data_out;
    output reg fifo_full,fifo_empty;
    reg [address:0]wr_ptr;
    reg [address:0]rd_ptr;
    reg [address:0]wq_ptr;
    reg [address:0]rdq_ptr;
    reg [address:0]w_m;
    reg [address:0]r_m;
    reg [address:0]w_m1;
    reg [address:0]r_m1;
    reg [address-1:0]w_addr;
    reg [address-1:0]rd_addr;
    reg [d_width-1:0]fifo[0:address-1];
    reg w_en2;
    ////////////////////write circuitry with full
    always @(posedge w_clk)
        begin
            if(w_rst)
            begin
                wr_ptr<=7'b0;fifo_full=0;w_m=7'b0;r_m1=7'b0;w_addr=0;wq_ptr=7'b0;
                end
            else
            begin
                fifo_full=(wr_ptr[address] !=wq_ptr[address] )&(wr_ptr[address-1:0]==wq_ptr[address-1:0]);
                if(wr_ptr >=address)
                begin
                fifo_full=1;
                end
                if(fifo_full==1 &&fifo_empty==1) wr_ptr=0;
                 
            end
    end
   ///////////////read circuitry with empty 
    always@(posedge rd_clk)
    begin
        if(rd_rst)
        begin
            rd_ptr=0;fifo_empty=1;w_m1=7'b0;r_m=7'b0;rd_addr=7'b0;rdq_ptr=7'b0;data_out=0;
            end
        else
            begin
                fifo_empty=(rdq_ptr[address-1:0]==rd_ptr[address-1:0]);
                if(rd_ptr>=address) begin
                fifo_empty=1;
                end
                        if(fifo_full==1 &&fifo_empty==1) rd_ptr=0;
    end
    
    end
    ///////////fifo memmory
//    initial fifo[7:0][5:0]=7'b0;
    always@(posedge w_clk)
    begin
    w_en2= wr_en&(~fifo_full);
    if(w_en2==1'b1)
    begin
        fifo[w_addr]<=data_in;
        wr_ptr=wr_ptr+1;
        w_addr=wr_ptr[address-1:0];
        
        end
    
    end
always@(posedge rd_clk)
begin
    if(rd_en==1'b1)
    begin
    data_out<=fifo[rd_addr];
    rd_ptr=rd_ptr+1;
    rd_addr=rd_ptr[address-1:0];
    end
    
    end
//binary to gray conversion at write circuitry
    integer i;
always@(wr_ptr)
begin
w_m[address-1]=wr_ptr[address-1];
for(i=address-2;i>=0;i=i-1)
begin
w_m[i]=wr_ptr[i]^wr_ptr[i+1];
end

end
//sync circuit
reg [address-1:0]w1;
initial w1=0; /////////////sync a4(w_m,w_m1,rd_clk,rd_rst);
integer j;
always@(w_m)
begin

for(j=0;j<address-1;j=j+1)
begin

dflipflop(w_m[j],rd_clk,rd_rst,w1[j]);

dflipflop(w1[j],rd_clk,rd_rst,w_m1[j]);
end
end

//gray to binary for write_ptr at read circuitry
always@(w_m1) //g2b a5(rdq_ptr,w_m1);
begin
rdq_ptr[address-1]=w_m1[address-1];
for(i=address-2;i>=0;i=i-1)
begin
rdq_ptr[i]=w_m1[i]^rdq_ptr[i+1];
end
end
//binary to gray at red circuitry

always@(rd_ptr)
begin
r_m[address-1]=rd_ptr[address-1];
for(i=address-2;i>=0;i=i-1)
begin
r_m[i]=rd_ptr[i]^rd_ptr[i+1];
end
end
//sync circuit

reg [address-1:0]w2; 
initial w2=0;  //////////sync a7(r_m,r_m1,w_clk,w_rst);
integer k;
always @(r_m)
begin
for(k=0;k<address-1;k=k+1)
begin
dflipflop(r_m[k],w_clk,w_rst,w2[k]);
dflipflop(w2[k],w_clk,w_rst,r_m1[k]);
end
end

//gray to binary for read_ptr at write circuitry
   
always@(r_m1)               //g2b a8(wq_ptr,r_m1);
begin
wq_ptr[address-1]=r_m1[address-1];
for(i=address-2;i>=0;i=i-1)
begin
wq_ptr[i]=r_m1[i]^wq_ptr[i+1];
end
end
   

task dflipflop(
input d,clk,rst,
output reg y);

if(rst && clk)
    y=0;
else if((~rst) &&clk)
begin
    y=d;
end

endtask
endmodule