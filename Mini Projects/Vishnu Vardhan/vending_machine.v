`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.11.2023 13:39:15
// Design Name: 
// Module Name: vending_machine
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


module vending_machine(
    input [2:0]in, //000=0 ,001=5, 010=10, 011=20, 100=50
    input clk,
    input rst,
    input [2:0] product_select,  //000=15rs , 001=25rs , 010 = 30rs, 011= 40rs, 100=60rs
    output reg out,
    output reg [2:0]change
    );
    parameter s0=7'b0000000;
    parameter s1=7'b0000101;
    parameter s2=7'b0001010;
    parameter s3=7'b0001111;
    parameter s4=7'b0010100;
    parameter s5=7'b0011001;
    parameter s6=7'b0011110;
    parameter s7=7'b0100011;
    parameter s8=7'b0101000;
    parameter s9=7'b0101101;
    parameter s10=7'b0110010;
    parameter s11=7'b0110111;
    reg [6:0] ps,ns;
    always@(posedge clk) //for 15rs product
    begin 
    if(rst)
    begin 
        ns=0;
        ns=0;
        change=2'b00;
    end
    else
    ps=ns;
    if(product_select==3'b000) 
    begin
        case(ps) //for 15rs product
            s0:if(in==3'b000)
                begin
                ns=s0;out=0;change=0;
                end
                else if(in==3'b001)
                begin 
                ns=s1;out=0;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s2;out=0;change=0;
                end
                else if(in==3'b011)
                begin 
                ns=s0;out=1;change=5;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=35;
                end
            s1:if(in==3'b000)
                begin
                ns=s0;out=0;change=5;
                end
                else if(in==3'b001)
                begin 
                ns=s2;out=0;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s0;out=1;change=0;
                end
                else if(in==3'b011)
                begin 
                ns=s0;out=1;change=10;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=40;
                end
            s2:if(in==3'b000)
                begin
                ns=s0;out=0;change=10;
                end
                else if(in==3'b001)
                begin 
                ns=s0;out=1;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s0;out=1;change=5;
                end
                else if(in==3'b011)
                begin 
                ns=s0;out=1;change=15;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=45;
                end
        endcase
    end
    else if(product_select==3'b001) 
    begin
        case(ps) //for 25rs product
            s0:if(in==3'b000)
                begin
                ns=s0;out=0;change=0;
                end
                else if(in==3'b001)
                begin 
                ns=s1;out=0;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s2;out=0;change=0;
                end
                else if(in==3'b011)
                begin 
                ns=s3;out=0;change=0;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=25;
                end
            s1:if(in==3'b000)
                begin
                ns=s0;out=0;change=5;
                end
                else if(in==3'b001)
                begin 
                ns=s2;out=0;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s3;out=1;change=0;
                end
                else if(in==3'b011)
                begin 
                ns=s0;out=1;change=0;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=30;
                end
            s2:if(in==3'b000)
                begin
                ns=s0;out=0;change=10;
                end
                else if(in==3'b001)
                begin 
                ns=s3;out=0;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s4;out=0;change=0;
                end
                else if(in==3'b011)
                begin 
                ns=s0;out=1;change=5;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=35;
                end
            s3:if(in==3'b000)
                begin
                ns=s0;out=0;change=15;
                end
                else if(in==3'b001)
                begin 
                ns=s4;out=0;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s0;out=1;change=0;
                end
                else if(in==3'b011)
                begin 
                ns=s0;out=1;change=10;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=40;
                end
            s4:if(in==3'b000)
                begin
                ns=s0;out=0;change=20;
                end
                else if(in==3'b001)
                begin 
                ns=s0;out=1;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s0;out=1;change=5;
                end
                else if(in==3'b011)
                begin 
                ns=s0;out=1;change=15;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=45;
                end
        endcase
    end
    else if(product_select==3'b010) 
    begin
        case(ps) //for 30rs product
            s0:if(in==3'b000)
                begin
                ns=s0;out=0;change=0;
                end
                else if(in==3'b001)
                begin 
                ns=s1;out=0;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s2;out=0;change=0;
                end
                else if(in==3'b011)
                begin 
                ns=s4;out=0;change=0;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=20;
                end
            s1:if(in==3'b000)
                begin
                ns=s0;out=0;change=5;
                end
                else if(in==3'b001)
                begin 
                ns=s2;out=0;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s3;out=1;change=0;
                end
                else if(in==3'b011)
                begin 
                ns=s5;out=1;change=0;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=25;
                end
            s2:if(in==3'b000)
                begin
                ns=s0;out=0;change=10;
                end
                else if(in==3'b001)
                begin 
                ns=s3;out=0;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s4;out=0;change=0;
                end
                else if(in==3'b011)
                begin 
                ns=s0;out=1;change=5;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=30;
                end
            s3:if(in==3'b000)
                begin
                ns=s0;out=0;change=15;
                end
                else if(in==3'b001)
                begin 
                ns=s4;out=0;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s5;out=1;change=0;
                end
                else if(in==3'b011)
                begin 
                ns=s0;out=1;change=5;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=25;
                end
            s4:if(in==3'b000)
                begin
                ns=s0;out=0;change=20;
                end
                else if(in==3'b001)
                begin 
                ns=s5;out=1;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s0;out=1;change=0;
                end
                else if(in==3'b011)
                begin 
                ns=s0;out=1;change=10;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=40;
                end
            s5:if(in==3'b000)
                begin
                ns=s0;out=0;change=25;
                end
                else if(in==3'b001)
                begin 
                ns=s0;out=1;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s0;out=1;change=5;
                end
                else if(in==3'b011)
                begin 
                ns=s0;out=1;change=15;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=45;
                end
        endcase
    end
    else if(product_select==3'b011) 
    begin
        case(ps) //for 40rs product
            s0:if(in==3'b000)
                begin
                ns=s0;out=0;change=0;
                end
                else if(in==3'b001)
                begin 
                ns=s1;out=0;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s2;out=0;change=0;
                end
                else if(in==3'b011)
                begin 
                ns=s4;out=0;change=0;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=10;
                end
            s1:if(in==3'b000)
                begin
                ns=s0;out=0;change=5;
                end
                else if(in==3'b001)
                begin 
                ns=s2;out=0;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s3;out=1;change=0;
                end
                else if(in==3'b011)
                begin 
                ns=s5;out=1;change=0;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=15;
                end
            s2:if(in==3'b000)
                begin
                ns=s0;out=0;change=10;
                end
                else if(in==3'b001)
                begin 
                ns=s3;out=0;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s4;out=0;change=0;
                end
                else if(in==3'b011)
                begin 
                ns=s6;out=0;change=0;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=20;
                end
            s3:if(in==3'b000)
                begin
                ns=s0;out=0;change=15;
                end
                else if(in==3'b001)
                begin 
                ns=s4;out=0;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s5;out=1;change=0;
                end
                else if(in==3'b011)
                begin 
                ns=s7;out=0;change=0;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=25;
                end
            s4:if(in==3'b000)
                begin
                ns=s0;out=0;change=20;
                end
                else if(in==3'b001)
                begin 
                ns=s5;out=0;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s6;out=0;change=0;
                end
                else if(in==3'b011)
                begin 
                ns=s0;out=1;change=0;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=30;
                end
            s5:if(in==3'b000)
                begin
                ns=s0;out=0;change=25;
                end
                else if(in==3'b001)
                begin 
                ns=s6;out=0;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s7;out=0;change=0;
                end
                else if(in==3'b011)
                begin 
                ns=s0;out=1;change=5;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=35;
                end
            s6:if(in==3'b000)
                begin
                ns=s0;out=0;change=30;
                end
                else if(in==3'b001)
                begin 
                ns=s7;out=0;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s0;out=1;change=0;
                end
                else if(in==3'b011)
                begin 
                ns=s0;out=1;change=10;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=40;
                end
            s7:if(in==3'b000)
                begin
                ns=s0;out=0;change=35;
                end
                else if(in==3'b001)
                begin 
                ns=s0;out=1;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s0;out=1;change=5;
                end
                else if(in==3'b011)
                begin 
                ns=s0;out=1;change=15;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=45;
                end
        endcase
    end
    else if(product_select==3'b100) 
    begin
        case(ps) //for 60rs product
            s0:if(in==3'b000)
                begin
                ns=s0;out=0;change=0;
                end
                else if(in==3'b001)
                begin 
                ns=s1;out=0;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s2;out=0;change=0;
                end
                else if(in==3'b011)
                begin 
                ns=s4;out=0;change=0;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=0;change=50;
                end
            s1:if(in==3'b000)
                begin
                ns=s0;out=0;change=5;
                end
                else if(in==3'b001)
                begin 
                ns=s2;out=0;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s3;out=0;change=0;
                end
                else if(in==3'b011)
                begin 
                ns=s5;out=0;change=0;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=55;
                end
            s2:if(in==3'b000)
                begin
                ns=s0;out=0;change=10;
                end
                else if(in==3'b001)
                begin 
                ns=s3;out=0;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s4;out=0;change=0;
                end
                else if(in==3'b011)
                begin 
                ns=s6;out=0;change=0;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=0;
                end
            s3:if(in==3'b000)
                begin
                ns=s0;out=0;change=15;
                end
                else if(in==3'b001)
                begin 
                ns=s4;out=0;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s5;out=1;change=0;
                end
                else if(in==3'b011)
                begin 
                ns=s7;out=0;change=0;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=5;
                end
            s4:if(in==3'b000)
                begin
                ns=s0;out=0;change=20;
                end
                else if(in==3'b001)
                begin 
                ns=s5;out=0;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s6;out=0;change=0;
                end
                else if(in==3'b011)
                begin 
                ns=s8;out=0;change=0;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=10;
                end
            s5:if(in==3'b000)
                begin
                ns=s0;out=0;change=25;
                end
                else if(in==3'b001)
                begin 
                ns=s6;out=0;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s7;out=0;change=0;
                end
                else if(in==3'b011)
                begin 
                ns=s9;out=0;change=0;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=15;
                end
            s6:if(in==3'b000)
                begin
                ns=s0;out=0;change=30;
                end
                else if(in==3'b001)
                begin 
                ns=s7;out=0;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s8;out=0;change=0;
                end
                else if(in==3'b011)
                begin 
                ns=s10;out=0;change=0;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=20;
                end
            s7:if(in==3'b000)
                begin
                ns=s0;out=0;change=35;
                end
                else if(in==3'b001)
                begin 
                ns=s8;out=0;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s9;out=0;change=5;
                end
                else if(in==3'b011)
                begin 
                ns=s11;out=0;change=1;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=25;
                end
             s8:if(in==3'b000)
                begin
                ns=s0;out=0;change=40;
                end
                else if(in==3'b001)
                begin 
                ns=s9;out=0;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s10;out=0;change=0;
                end
                else if(in==3'b011)
                begin 
                ns=s0;out=1;change=0;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=30;
                end
              s9:if(in==3'b000)
                begin
                ns=s0;out=0;change=45;
                end
                else if(in==3'b001)
                begin 
                ns=s10;out=0;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s11;out=0;change=0;
                end
                else if(in==3'b011)
                begin 
                ns=s0;out=1;change=5;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=35;
                end
              s10:if(in==3'b000)
                begin
                ns=s0;out=0;change=50;
                end
                else if(in==3'b001)
                begin 
                ns=s11;out=0;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s0;out=1;change=0;
                end
                else if(in==3'b011)
                begin 
                ns=s0;out=1;change=10;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=40;
                end
              s11:if(in==3'b000)
                begin
                ns=s0;out=0;change=55;
                end
                else if(in==3'b001)
                begin 
                ns=s0;out=1;change=0;
                end
                else if(in==3'b010)
                begin 
                ns=s0;out=1;change=5;
                end
                else if(in==3'b011)
                begin 
                ns=s0;out=1;change=15;
                end
                else if(in==3'b100)
                begin 
                ns=s0;out=1;change=45;
                end
        endcase
    end
    end
endmodule
