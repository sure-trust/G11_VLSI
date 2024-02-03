module vending_mach (
	input clk,
	input rstn,
	// Apb
	input pclk,
  input prstn,
	input [31:0] paddr,
	input pwrite,
	input psel,
	input [31:0] pwdata,
	output [31:0] prdata,
	
	input i_valid,
	input note_val,
	//Item interface
	input item_valid,
	input [5:0] item_code,
	//Output
	output reg o_valid,
	output reg output_item,
	output reg [15:0] note_change
);

reg[31:0]item_cfg[63:0];
reg item_dispensed;
reg[5:0] item_selected;
reg item_valid_r;
wire item_valid_rising_edge;
reg i_valid_r;
wire i_valid_rising_edge;
reg [31:0] note_val_count;
wire [15:0] current_item_val;


// ----------------------------
//Extract the APB interface
//Program the registers based on the APB protocol
genvar i;
generate
   for (i=0; i<64; i=i+1) begin
      always @(posedge pclk or negedge prstn) begin
      	if (!prstn) begin
          item_cfg[i] <= {8'd0, 8'd100, 16'hA} ;
      	end // if
				else begin
					if (psel & pwrite & (paddr[5:0] == i)) begin
						item_cfg[i] <= pwdata;
					end
					else if (item_dispensed && (item_dispensed == i)) begin
						item_cfg[i][23:16] <= item_cfg[i][23:16] - 1'b1;
						item_cfg[i][31:24] <= item_cfg[i][31:24] + 1'b1;
					end
				end // else
      end //always
   end //for
endgenerate
assign prdata = item_cfg[paddr[5:0]];
// APB configuration ends here
// ----------------------------



// ----------------------------
//Item Selection starts here

//Edge detection on item_valid
assign item_valid_rising_edge = !item_valid_r && item_valid;
always @(posedge clk or negedge rstn) begin
	if (!rstn) begin
		item_valid_r <= 'b0;
	end //if
	else begin
		item_valid_r <= item_valid;
	end //else
end //always

// Item selected logic to sample item code from input based on an item_valid
// edge detection
// and clear the item_selected after the item is dispensed
always @(posedge clk or negedge rstn) begin
	if (!rstn) begin
		item_selected <= {6{1'b1}}; // assuming all 1's is not valid item
	end //if
	else begin
		if (item_valid_rising_edge) begin
			item_selected <= item_code;
		end //if
		else if (item_dispensed) begin // clear the item_selected only after the item is dispensed
			item_selected <= {6{1'b1}};
		end
	end //else
end //always
// Item selection ends here
// ----------------------------

// Note value accumlation to determine the respective item can be dispensed or not

//Edge detection on i_valid
assign current_item_val = item_cfg[item_selected][15:0];
assign i_valid_rising_edge = !i_valid_r && i_valid;
always @(posedge clk or negedge rstn) begin
	if (!rstn) begin
		i_valid_r <= 'b0;
	end //if
	else begin
		if (((note_val == 7'd5) || (note_val == 7'd10) || 
			              (note_val == 7'd20) || (note_val == 7'd50)|| (note_val == 7'd100) )) begin
		   i_valid_r <= i_valid;
		 end //if i valid with valid notes
		 else begin
			 i_valid_r <= 'b0;
		 end // else
	end //else
end //always

//Note value counter to see if the accumulated value is meeting the required
	//item price
always @(posedge clk or negedge rstn)begin
	if (!rstn) begin
		note_val_count <= 0;
		o_valid <= 1'b0;
		output_item <= 1'b0;
		note_change <= 'h0;
	end //if
	else begin
		o_valid <= 'b0;
		output_item <= 'b0;
		note_change <= 'h0;
		if (i_valid_rising_edge) begin // i_valid is having an edge
			if (note_val_count + note_val > current_item_val ) begin //if
//				the current count + new note val is exceeding the item_val
          o_valid<= 1'b1;
		  output_item <= 1'b1;
		note_change <= (note_val_count + note_val) - current_item_val;
			end
		end
	end //else
end //always


endmodule
