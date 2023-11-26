module vendingmachine_minor1_tb(

    );
    reg [6:0]money;
    reg [4:0]sel;
    reg clock;
    reg reset;
    reg [6:0]extramoney;
    wire [6:0]change;
    wire  wrappers,plasticbottles,packets,cans,plastictub;
    vendingmachine_minor ee(.money(money),.sel(sel),.clock(clock),.reset(reset),.extramoney(extramoney),.change(change));
     initial begin
     clock = 0;
     end
    
     always #5 clock=~clock;
     initial begin
      reset=0;
      #100 reset=1;
      #150 reset=0;
      end
     
     initial begin
     #10 money=6'd5;sel=3'b000;
         #20 money=6'd5;sel=3'b000;extramoney=6'd10;
         #30 money=6'd5;sel=3'b000;extramoney=6'd20;
         #40 money=6'd10;sel=3'b000;extramoney=6'd5;
         #50 money=6'd10;sel=3'b000;extramoney=6'd10;
         #60 money=6'd20;sel=3'b000;extramoney=6'd0;
         #70 money=6'd50;sel=3'b000;extramoney=6'd0;
         #80 money=6'd5;sel=3'b001;extramoney=6'd10;
         #90 money=6'd5;sel=3'b001;extramoney=6'd20;
         #100 money=6'd10;sel=3'b001;extramoney=6'd5;
         #110 money=6'd10;sel=3'b001;extramoney=6'd10;
         #120 money=6'd10;sel=3'b001;extramoney=6'd10;
         #130 money=6'd20;sel=3'b001;extramoney=6'd00;
         #140 money=6'd50;sel=3'b001;extramoney=6'd00;
         #150 money=6'd05;sel=3'b010;extramoney=6'd20;
         #160 money=6'd05;sel=3'b010;extramoney=6'd50;
         #170 money=6'd10;sel=3'b010;extramoney=6'd20;
         #180 money=6'd20;sel=3'b010;extramoney=6'd05;
         #190 money=6'd20;sel=3'b010;extramoney=6'd10;
         #200 money=6'd50;sel=3'b010;extramoney=6'd00;
         #210 money=6'd5;sel=3'b011;extramoney=6'd50;
         #220 money=6'd10;sel=3'b011;extramoney=6'd20;
         #230 money=6'd10;sel=3'b011;extramoney=6'd50;
         #240 money=6'd20;sel=3'b011;extramoney=6'd20;
         #250 money=6'd20;sel=3'b011;extramoney=6'd10;
         #260 money=6'd50;sel=3'b011;extramoney=6'd00;
         #270 money=6'd5;sel=3'b100;extramoney=6'd50;
         #280 money=6'd5;sel=3'b100;extramoney=6'd50;
         #290 money=6'd10;sel=3'b100;extramoney=6'd50;
         #10 money=6'd20;sel=3'b100;extramoney=6'd20;
         #10 money=6'd20;sel=3'b100;extramoney=6'd50;
         #10 money=6'd50;sel=3'b100;extramoney=6'd00;
         #10 money=6'd5;sel=3'b101;extramoney=6'd00;
         #10 money=6'd10;sel=3'b101;extramoney=6'd50;
         #10 money=6'd20;sel=3'b101;extramoney=6'd50;
    
    #10 money=6'd50;sel=3'b101;extramoney=6'd10;
    
    
    
     end
endmodule