`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   17:43:27 11/27/2023
// Design Name:   vending_machine_mini
// Module Name:   /home/rgukt/Desktop/Project_List/vending_machine_mini_tb.v
// Project Name:  Project_List
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vending_machine_mini
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module vending_machine_mini_tb;
	// Inputs
	reg clk;
	reg reset;
	reg [5:0] select_product;
	reg [5:0] coin;

	// Outputs
	wire Bottled_water;
	wire Cola_Can;
	wire Diet_soda_can;
	wire Snack_Sized_chips;
	wire Chocolate_Bars;
	wire Granola_bars;
	wire Trail_Mix;
	wire Fruit_snacks;
	wire Energy_Drinks;
	wire Iced_tea_can;
	wire Coffee_Bottle;
	wire Fruit_Juice_Boxes;
	wire Pre_packaged_sandwiches;
	wire Pretzels;
	wire Popcorn;
	wire Cheese_crackers;
	wire Nuts;
	wire Rice_Cakes;
	wire Gummy_Candies;
	wire Protein_Bars;
	wire Cookies;
	wire Yogurt_Cups;
	wire Fresh_Fruit_Cups;
	wire Cup_Cakes;
	wire Muffins;
	wire Cheese_Sticks;
	wire Gum;
	wire Fruit_Smoothies_Bottles;
	wire Salads;
	wire Hard_Boiled_Eggs;
	wire Pita_chips_with_hummus;
	wire Fruit_pies;
	wire Bottled_iced_coffee;
	wire Rice_crispy_treats;
	wire Cheese_and_cracker_packs;
	wire Fruit_flavored_water;
	wire Vegetable_sticks_with_dip;
	wire Bagels_with_cream_cheese;
	wire Protein_shakes;
	wire Instant_noodles;
	wire [5:0] change;

	// Instantiate the Unit Under Test (UUT)
	vending_machine_mini  uut(
		.Bottled_water(Bottled_water), 
		.Cola_Can(Cola_Can), 
		.Diet_soda_can(Diet_soda_can), 
		.Snack_Sized_chips(Snack_Sized_chips), 
		.Chocolate_Bars(Chocolate_Bars), 
		.Granola_bars(Granola_bars), 
		.Trail_Mix(Trail_Mix), 
		.Fruit_snacks(Fruit_snacks), 
		.Energy_Drinks(Energy_Drinks), 
		.Iced_tea_can(Iced_tea_can), 
		.Coffee_Bottle(Coffee_Bottle), 
		.Fruit_Juice_Boxes(Fruit_Juice_Boxes), 
		.Pre_packaged_sandwiches(Pre_packaged_sandwiches), 
		.Pretzels(Pretzels), 
		.Popcorn(Popcorn), 
		.Cheese_crackers(Cheese_crackers), 
		.Nuts(Nuts), 
		.Rice_Cakes(Rice_Cakes), 
		.Gummy_Candies(Gummy_Candies), 
		.Protein_Bars(Protein_Bars), 
		.Cookies(Cookies), 
		.Yogurt_Cups(Yogurt_Cups), 
		.Fresh_Fruit_Cups(Fresh_Fruit_Cups), 
		.Cup_Cakes(Cup_Cakes), 
		.Muffins(Muffins), 
		.Cheese_Sticks(Cheese_Sticks), 
		.Gum(Gum), 
		.Fruit_Smoothies_Bottles(Fruit_Smoothies_Bottles), 
		.Salads(Salads), 
		.Hard_Boiled_Eggs(Hard_Boiled_Eggs), 
		.Pita_chips_with_hummus(Pita_chips_with_hummus), 
		.Fruit_pies(Fruit_pies), 
		.Bottled_iced_coffee(Bottled_iced_coffee), 
		.Rice_crispy_treats(Rice_crispy_treats), 
		.Cheese_and_cracker_packs(Cheese_and_cracker_packs), 
		.Fruit_flavored_water(Fruit_flavored_water), 
		.Vegetable_sticks_with_dip(Vegetable_sticks_with_dip), 
		.Bagels_with_cream_cheese(Bagels_with_cream_cheese), 
		.Protein_shakes(Protein_shakes), 
		.Instant_noodles(Instant_noodles), 
		.change(change), 
		.clk(clk), 
		.reset(reset), 
		.select_product(select_product), 
		.coin(coin)
	);
always #5 clk=~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 1;
		select_product = 0;
		coin = 0;
		#30 reset=0;
			//select_product=6'b010100;
			coin=6'd50;
			select_product=6'd1;
			

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

