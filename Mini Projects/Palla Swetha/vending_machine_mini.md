`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// Create Date:    16:14:03 11/27/2023 
// Design Name: 
// Module Name:    vending_machine_mini 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
// Dependencies: 
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//////////////////////////////////////////////////////////////////////////////////
module vending_machine_mini (output reg Bottled_water,Cola_Can,Diet_soda_can,
		Snack_Sized_chips,Chocolate_Bars,Granola_bars,Trail_Mix,Fruit_snacks,
		Energy_Drinks,Iced_tea_can,Coffee_Bottle,Fruit_Juice_Boxes,Pre_packaged_sandwiches,
		Pretzels,Popcorn,Cheese_crackers,Nuts,Rice_Cakes,Gummy_Candies,Protein_Bars,Cookies,
		Yogurt_Cups,Fresh_Fruit_Cups,Cup_Cakes,Muffins,Cheese_Sticks,Gum,Fruit_Smoothies_Bottles,
		Salads,Hard_Boiled_Eggs,Pita_chips_with_hummus,Fruit_pies,Bottled_iced_coffee,
		Rice_crispy_treats,Cheese_and_cracker_packs,Fruit_flavored_water,Vegetable_sticks_with_dip,
		Bagels_with_cream_cheese,Protein_shakes,Instant_noodles,
		output reg [5:0]change,input clk,reset,input [5:0]select_product,input [5:0]coin);
reg [2:0] present_state;
reg [2:0] next_state;
parameter  s0=3'b000,
			  s5=3'b001,
			  s10=3'b010,
			  s15=3'b011,
			  s20=3'b100,
			  s25=3'b101,
			  s30=3'b110;

always @(*)
begin 
	if(reset)
		present_state=s0;
	else
		present_state=next_state;
end

always @(*)
   if(select_product==6'b000000)
	begin
	//always @(*)
	case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Bottled_water=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Bottled_water<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Bottled_water<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Bottled_water<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
	      Bottled_water<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Bottled_water<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Bottled_water<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Bottled_water<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Bottled_water<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
		   Bottled_water<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Bottled_water<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Bottled_water<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Bottled_water<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Bottled_water<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
		   Bottled_water<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Bottled_water<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Bottled_water<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end
		
		
	else if (select_product==6'b000001)
//	always @(*)
	begin
	case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Cola_Can=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Cola_Can<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Cola_Can<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Cola_Can<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Cola_Can<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Cola_Can<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
		   Cola_Can<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
		   Cola_Can<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
		    Cola_Can<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Cola_Can<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Cola_Can<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Cola_Can<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Cola_Can<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Cola_Can<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Cola_Can<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Cola_Can<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Cola_Can<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end


	else if (select_product==6'b000010)
	//always @(*)
	begin
	case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Diet_soda_can=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Diet_soda_can<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Diet_soda_can<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Diet_soda_can<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Diet_soda_can<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Diet_soda_can<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
		   Diet_soda_can<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Diet_soda_can<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Diet_soda_can<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Diet_soda_can<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Diet_soda_can<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Diet_soda_can<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Diet_soda_can<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Diet_soda_can<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Diet_soda_can<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Diet_soda_can<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Diet_soda_can<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end
	
	else if (select_product==6'b000011)
//	always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Snack_Sized_chips<=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Snack_Sized_chips<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Snack_Sized_chips<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Snack_Sized_chips<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Snack_Sized_chips<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Snack_Sized_chips<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Snack_Sized_chips<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Snack_Sized_chips<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Snack_Sized_chips<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Snack_Sized_chips<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Snack_Sized_chips<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Snack_Sized_chips<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Snack_Sized_chips<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Snack_Sized_chips<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Snack_Sized_chips<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Snack_Sized_chips<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Snack_Sized_chips<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end
	else if (select_product==6'b000100)
//	always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Chocolate_Bars<=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Chocolate_Bars<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Chocolate_Bars<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Chocolate_Bars<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Chocolate_Bars<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Chocolate_Bars<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Chocolate_Bars<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Chocolate_Bars<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Chocolate_Bars<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Chocolate_Bars<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Chocolate_Bars<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Chocolate_Bars<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Chocolate_Bars<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Chocolate_Bars<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Chocolate_Bars<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Chocolate_Bars<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Chocolate_Bars<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end
		
	else if (select_product==6'b000101)
//always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Granola_bars<=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Granola_bars<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Granola_bars<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Granola_bars<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Granola_bars<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Granola_bars<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Granola_bars<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Granola_bars<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Granola_bars<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Granola_bars<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Granola_bars<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Granola_bars<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Granola_bars<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Granola_bars<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Granola_bars<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Granola_bars<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Granola_bars<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end
	else if (select_product==6'b000110)
	

//always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Trail_Mix<=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Trail_Mix<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Trail_Mix<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Trail_Mix<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Trail_Mix<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Trail_Mix<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Trail_Mix<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Trail_Mix<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Trail_Mix<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Trail_Mix<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Trail_Mix<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Trail_Mix<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Trail_Mix<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Trail_Mix<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Trail_Mix<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Trail_Mix<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Trail_Mix<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end

	else if (select_product==6'b000111)
//	always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Fruit_snacks<=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Fruit_snacks<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Fruit_snacks<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Fruit_snacks<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Fruit_snacks<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Fruit_snacks<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Fruit_snacks<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Fruit_snacks<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Fruit_snacks<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Fruit_snacks<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Fruit_snacks<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Fruit_snacks<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Fruit_snacks<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Fruit_snacks<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Fruit_snacks<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Fruit_snacks<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Fruit_snacks<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end
	else if (select_product==6'b001000)
	//always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Energy_Drinks<=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Energy_Drinks<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Energy_Drinks<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Energy_Drinks<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Energy_Drinks<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Energy_Drinks<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Energy_Drinks<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Energy_Drinks<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Energy_Drinks<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Energy_Drinks<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Energy_Drinks<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Energy_Drinks<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Energy_Drinks<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Energy_Drinks<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Energy_Drinks<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Energy_Drinks<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Energy_Drinks<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end
		
		
	else if (select_product==6'b001001)
//	always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Iced_tea_can<=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Iced_tea_can<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Iced_tea_can<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Iced_tea_can<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Iced_tea_can<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Iced_tea_can<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Iced_tea_can<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Iced_tea_can<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Iced_tea_can<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Iced_tea_can<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Iced_tea_can<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Iced_tea_can<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Iced_tea_can<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Iced_tea_can<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Iced_tea_can<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Iced_tea_can<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Iced_tea_can<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end
		
	else if (select_product==6'b001010)
	//always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Coffee_Bottle<=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Coffee_Bottle<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Coffee_Bottle<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Coffee_Bottle<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Coffee_Bottle<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Coffee_Bottle<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Coffee_Bottle<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Coffee_Bottle<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Coffee_Bottle<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Coffee_Bottle<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Coffee_Bottle<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Coffee_Bottle<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Coffee_Bottle<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Coffee_Bottle<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Coffee_Bottle<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Coffee_Bottle<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Coffee_Bottle<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end
	else if (select_product==6'b001011)
//	always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Fruit_Juice_Boxes=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Fruit_Juice_Boxes<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Fruit_Juice_Boxes<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Fruit_Juice_Boxes<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Fruit_Juice_Boxes<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Fruit_Juice_Boxes<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Fruit_Juice_Boxes<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Fruit_Juice_Boxes<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Fruit_Juice_Boxes<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Fruit_Juice_Boxes<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Fruit_Juice_Boxes<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Fruit_Juice_Boxes<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Fruit_Juice_Boxes<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Fruit_Juice_Boxes<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Fruit_Juice_Boxes<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Fruit_Juice_Boxes<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Fruit_Juice_Boxes<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end
	else if (select_product==6'b001100)
	//always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Pre_packaged_sandwiches<=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Pre_packaged_sandwiches<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Pre_packaged_sandwiches<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Pre_packaged_sandwiches<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Pre_packaged_sandwiches<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Pre_packaged_sandwiches<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Pre_packaged_sandwiches<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Pre_packaged_sandwiches<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Pre_packaged_sandwiches<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Pre_packaged_sandwiches<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Pre_packaged_sandwiches<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Pre_packaged_sandwiches<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Pre_packaged_sandwiches<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Pre_packaged_sandwiches<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Pre_packaged_sandwiches<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Pre_packaged_sandwiches<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Pre_packaged_sandwiches<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end

	else if (select_product==6'b001101)
//	always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Pretzels<=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Pretzels<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Pretzels<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Pretzels<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Pretzels<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Pretzels<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Pretzels<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Pretzels<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Pretzels<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Pretzels<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Pretzels<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Pretzels<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Pretzels<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Pretzels<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Pretzels<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Pretzels<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Pretzels<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end
	else if (select_product==6'b001110)
	//always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Popcorn<=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Popcorn<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Popcorn<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Popcorn<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Popcorn<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Popcorn<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Popcorn<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Popcorn<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Popcorn<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Popcorn<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Popcorn<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Popcorn<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Popcorn<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Popcorn<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Popcorn<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Popcorn<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Popcorn<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end
	else if (select_product==6'b001111)
//	always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Cheese_crackers<=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Cheese_crackers<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Cheese_crackers<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Cheese_crackers<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Cheese_crackers<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Cheese_crackers<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Cheese_crackers<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Cheese_crackers<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Cheese_crackers<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Cheese_crackers<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Cheese_crackers<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Cheese_crackers<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Cheese_crackers<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Cheese_crackers<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Cheese_crackers<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Cheese_crackers<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Cheese_crackers<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end
	else if (select_product==6'b010000)
	

//always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Nuts<=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Nuts<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Nuts<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Nuts<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Nuts<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Nuts<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Nuts<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Nuts<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Nuts<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Nuts<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Nuts<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Nuts<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Nuts<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Nuts<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Nuts<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Nuts<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Nuts<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
	end
	else if (select_product==6'b010001)
//always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Rice_Cakes<=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Rice_Cakes<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Rice_Cakes<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Rice_Cakes<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Rice_Cakes<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Rice_Cakes<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Rice_Cakes<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Rice_Cakes<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Rice_Cakes<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Rice_Cakes<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Rice_Cakes<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Rice_Cakes<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Rice_Cakes<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Rice_Cakes<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Rice_Cakes<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Rice_Cakes<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Rice_Cakes<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end
	else if (select_product==6'b010010)
	//always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Gummy_Candies<=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Gummy_Candies<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Gummy_Candies<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Gummy_Candies<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Gummy_Candies<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Gummy_Candies<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Gummy_Candies<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Gummy_Candies<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Gummy_Candies<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Gummy_Candies<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Gummy_Candies<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Gummy_Candies<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Gummy_Candies<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Gummy_Candies<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Gummy_Candies<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Gummy_Candies<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Gummy_Candies<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end
	else if (select_product==6'b010011)
//	always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Protein_Bars<=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Protein_Bars<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Protein_Bars<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Protein_Bars<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Protein_Bars<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Protein_Bars<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Protein_Bars<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Protein_Bars<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Protein_Bars<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Protein_Bars<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Protein_Bars<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Protein_Bars<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Protein_Bars<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Protein_Bars<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Protein_Bars<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Protein_Bars<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Protein_Bars<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end
		
	else if (select_product==6'b010100)
	//always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Cookies=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Cookies<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Cookies<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Cookies<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Cookies<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Cookies<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Cookies<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Cookies<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Cookies<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Cookies<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Cookies<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Cookies<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Cookies<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Cookies<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Cookies<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Cookies<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Cookies<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end
	else if (select_product==6'b010101)
	

//always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Yogurt_Cups<=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Yogurt_Cups<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Yogurt_Cups<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Yogurt_Cups<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Yogurt_Cups<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Yogurt_Cups<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Yogurt_Cups<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Yogurt_Cups<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Yogurt_Cups<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Yogurt_Cups<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Yogurt_Cups<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Yogurt_Cups<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Yogurt_Cups<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Yogurt_Cups<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Yogurt_Cups<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Yogurt_Cups<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Yogurt_Cups<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end

else if (select_product==6'b010110)
//always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Fresh_Fruit_Cups=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Fresh_Fruit_Cups<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Fresh_Fruit_Cups<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Fresh_Fruit_Cups<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Fresh_Fruit_Cups<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Fresh_Fruit_Cups<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Fresh_Fruit_Cups<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Fresh_Fruit_Cups<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Fresh_Fruit_Cups<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Fresh_Fruit_Cups<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Fresh_Fruit_Cups<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Fresh_Fruit_Cups<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Fresh_Fruit_Cups<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Fresh_Fruit_Cups<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Fresh_Fruit_Cups<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Fresh_Fruit_Cups<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Fresh_Fruit_Cups<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end
	else if (select_product==6'b010111)
//	always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Cup_Cakes<=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Cup_Cakes<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Cup_Cakes<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Cup_Cakes<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Cup_Cakes<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Cup_Cakes<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Cup_Cakes<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Cup_Cakes<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Cup_Cakes<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Cup_Cakes<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Cup_Cakes<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Cup_Cakes<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Cup_Cakes<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Cup_Cakes<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Cup_Cakes<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Cup_Cakes<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Cup_Cakes<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end
	else if (select_product==6'b011000)
	

//always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Muffins<=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Muffins<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Muffins<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Muffins<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Muffins<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Muffins<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Muffins<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Muffins<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Muffins<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Muffins<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Muffins<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Muffins<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Muffins<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Muffins<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Muffins<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Muffins<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Muffins<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end

	else if (select_product==6'b011001)
//	always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Cheese_Sticks<=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Cheese_Sticks<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Cheese_Sticks<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Cheese_Sticks<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Cheese_Sticks<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Cheese_Sticks<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Cheese_Sticks<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Cheese_Sticks<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Cheese_Sticks<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Cheese_Sticks<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Cheese_Sticks<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Cheese_Sticks<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Cheese_Sticks<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Cheese_Sticks<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Cheese_Sticks<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Cheese_Sticks<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Cheese_Sticks<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end
	else if (select_product==6'b011010)
	

//always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Gum<=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Gum<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Gum<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Gum<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Gum<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
				Gum<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Gum<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Gum<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Gum<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Gum<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Gum<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Gum<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Gum<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Gum<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Gum<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Gum<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Gum<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end


	else if (select_product==6'b011011)
//	always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Fruit_Smoothies_Bottles<=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Fruit_Smoothies_Bottles<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Fruit_Smoothies_Bottles<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Fruit_Smoothies_Bottles<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Fruit_Smoothies_Bottles<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Fruit_Smoothies_Bottles<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Fruit_Smoothies_Bottles<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Fruit_Smoothies_Bottles<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Fruit_Smoothies_Bottles<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Fruit_Smoothies_Bottles<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Fruit_Smoothies_Bottles<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Fruit_Smoothies_Bottles<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Fruit_Smoothies_Bottles<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Fruit_Smoothies_Bottles<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Fruit_Smoothies_Bottles<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Fruit_Smoothies_Bottles<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Fruit_Smoothies_Bottles<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end
	else if (select_product==6'b011100)
	//always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Salads=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Salads<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Salads<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Salads<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Salads<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Salads<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Salads<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Salads<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Salads<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Salads<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Salads<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Salads<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Salads<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Salads<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Salads<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Salads<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Salads<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end
	else if (select_product==6'b011101)
	

//always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Hard_Boiled_Eggs=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Hard_Boiled_Eggs<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Hard_Boiled_Eggs<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Hard_Boiled_Eggs<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Hard_Boiled_Eggs<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Hard_Boiled_Eggs<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Hard_Boiled_Eggs<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Hard_Boiled_Eggs<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Hard_Boiled_Eggs<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Hard_Boiled_Eggs<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Hard_Boiled_Eggs<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Hard_Boiled_Eggs<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Hard_Boiled_Eggs<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Hard_Boiled_Eggs<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Hard_Boiled_Eggs<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Hard_Boiled_Eggs<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Hard_Boiled_Eggs<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end


	else if (select_product==6'b011110)
	

//always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Pita_chips_with_hummus<=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Pita_chips_with_hummus<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Pita_chips_with_hummus<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Pita_chips_with_hummus<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Pita_chips_with_hummus<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Pita_chips_with_hummus<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Pita_chips_with_hummus<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Pita_chips_with_hummus<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Pita_chips_with_hummus<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Pita_chips_with_hummus<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Pita_chips_with_hummus<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Pita_chips_with_hummus<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Pita_chips_with_hummus<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Pita_chips_with_hummus<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Pita_chips_with_hummus<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Pita_chips_with_hummus<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Pita_chips_with_hummus<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end


	else if (select_product==6'b011111)
//	always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Fruit_pies=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Fruit_pies<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Fruit_pies<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Fruit_pies<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Fruit_pies<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Fruit_pies<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Fruit_pies<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Fruit_pies<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Fruit_pies<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Fruit_pies<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Fruit_pies<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Fruit_pies<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Fruit_pies<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Fruit_pies<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Fruit_pies<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Fruit_pies<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Fruit_pies<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end
	else if (select_product==6'b100000)
	//always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Bottled_iced_coffee=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Bottled_iced_coffee<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Bottled_iced_coffee<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Bottled_iced_coffee<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Bottled_iced_coffee<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Bottled_iced_coffee<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Bottled_iced_coffee<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Bottled_iced_coffee<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Bottled_iced_coffee<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Bottled_iced_coffee<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Bottled_iced_coffee<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Bottled_iced_coffee<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Bottled_iced_coffee<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Bottled_iced_coffee<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Bottled_iced_coffee<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Bottled_iced_coffee<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Bottled_iced_coffee<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end
	else if (select_product==6'b100001)
	

//always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Rice_crispy_treats=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Rice_crispy_treats<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Rice_crispy_treats<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Rice_crispy_treats<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Rice_crispy_treats<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Rice_crispy_treats<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Rice_crispy_treats<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Rice_crispy_treats<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Rice_crispy_treats<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Rice_crispy_treats<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Rice_crispy_treats<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Rice_crispy_treats<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Rice_crispy_treats<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Rice_crispy_treats<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Rice_crispy_treats<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Rice_crispy_treats<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Rice_crispy_treats<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end


	else if (select_product==6'b100010)
	

//always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Cheese_and_cracker_packs<=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Cheese_and_cracker_packs<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Cheese_and_cracker_packs<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Cheese_and_cracker_packs<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Cheese_and_cracker_packs<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Cheese_and_cracker_packs<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Cheese_and_cracker_packs<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Cheese_and_cracker_packs<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Cheese_and_cracker_packs<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Cheese_and_cracker_packs<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Cheese_and_cracker_packs<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Cheese_and_cracker_packs<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Cheese_and_cracker_packs<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Cheese_and_cracker_packs<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Cheese_and_cracker_packs<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Cheese_and_cracker_packs<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Cheese_and_cracker_packs<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end

	else if (select_product==6'b100011)
//	always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Fruit_flavored_water<=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Fruit_flavored_water<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Fruit_flavored_water<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Fruit_flavored_water<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Fruit_flavored_water<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Fruit_flavored_water<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Fruit_flavored_water<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Fruit_flavored_water<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Fruit_flavored_water<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Fruit_flavored_water<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Fruit_flavored_water<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Fruit_flavored_water<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Fruit_flavored_water<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Fruit_flavored_water<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Fruit_flavored_water<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Fruit_flavored_water<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Fruit_flavored_water<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end
		
else if (select_product==6'b100100)
//always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Vegetable_sticks_with_dip=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Vegetable_sticks_with_dip<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Vegetable_sticks_with_dip<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Vegetable_sticks_with_dip<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Vegetable_sticks_with_dip<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Vegetable_sticks_with_dip<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Vegetable_sticks_with_dip<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Vegetable_sticks_with_dip<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Vegetable_sticks_with_dip<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Vegetable_sticks_with_dip<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Vegetable_sticks_with_dip<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Vegetable_sticks_with_dip<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Vegetable_sticks_with_dip<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Vegetable_sticks_with_dip<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Vegetable_sticks_with_dip<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Vegetable_sticks_with_dip<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Vegetable_sticks_with_dip<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
end
	
else if (select_product==6'b100101)
//always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Bagels_with_cream_cheese=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Bagels_with_cream_cheese<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Bagels_with_cream_cheese<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Bagels_with_cream_cheese<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Bagels_with_cream_cheese<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Bagels_with_cream_cheese<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Bagels_with_cream_cheese<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Bagels_with_cream_cheese<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Bagels_with_cream_cheese<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Bagels_with_cream_cheese<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Bagels_with_cream_cheese<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Bagels_with_cream_cheese<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Bagels_with_cream_cheese<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Bagels_with_cream_cheese<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Bagels_with_cream_cheese<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Bagels_with_cream_cheese<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Bagels_with_cream_cheese<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end

	else if (select_product==6'b100110)
	//always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Protein_shakes=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Protein_shakes<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Protein_shakes<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Protein_shakes<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Protein_shakes<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Protein_shakes<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Protein_shakes<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Protein_shakes<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Protein_shakes<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Protein_shakes<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Protein_shakes<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Protein_shakes<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Protein_shakes<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Protein_shakes<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Protein_shakes<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Protein_shakes<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Protein_shakes<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end
	else if (select_product==6'b100111)
//	always @(*)
begin
case(present_state)
	s0:begin
		if(coin==6'd5 )
			begin
			next_state=s5;
			end
		else if(coin==6'd10)
			next_state=s10;
		else if(coin==6'd20)
			next_state=s20;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd20;
			Instant_noodles=1'b1;
			end
		end
	s5:begin
		if(coin==6'd5 )
			begin
			next_state=s10;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd20)
			next_state=s25;
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd25;
			Instant_noodles<=1'b1;
			end
		end
	s10:begin
		if(coin==6'd5)
			begin
			next_state=s15;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s20;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=0;
			Instant_noodles<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd30;
			Instant_noodles<=1'b1;
			end
		end

	s15:begin
		if(coin==6'd5 )
			begin
			next_state=s20;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd5;
			Instant_noodles<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd35;
			Instant_noodles<=1'b1;
			end
		end
		
	s20:begin
		if(coin==6'd5)
			begin
			next_state=s25;
		
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=0;
			Instant_noodles<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd10;
			Instant_noodles<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd40;
			Instant_noodles<=1'b1;
			end
		end

	s25:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=0;
			Instant_noodles<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd5;
			Instant_noodles<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=6'd15;
			Instant_noodles<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Instant_noodles<=1'b1;
			end
		end
	s30:begin
		if(coin==6'd5)
			begin
			next_state=s0;
			change<=6'd5;
			Instant_noodles<=1'b1;
			end
		else if(coin==6'd10)
			begin
			next_state=s0;
			change<=6'd10;
			Instant_noodles<=1'b1;
			end
		else if(coin==6'd20)
			begin
			next_state=s0;
			change<=20;
			Instant_noodles<=1'b1;
			end
		else if (coin==6'd50)
			begin
			next_state=s0;
			change<=6'd50;
			Instant_noodles<=1'b1;
			end
		end
	default:
		next_state=s0;
		endcase
		end
	
endmodule
