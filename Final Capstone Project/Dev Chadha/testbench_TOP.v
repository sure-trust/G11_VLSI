// Test Plan
//-----------
// Machine configuration for 10 items
// 4-test Cases
// Test Case 1- Item purchase with no change expected- Tested
// Test Case 2- Item purchase with change expected- Tested
// Test Case 3- Purchasing all items of one type- Item Not Available case- Tested
// Test Case 4- Reset Interrupt at money-input state- Yet to test
`timescale 1ns/1ps
module testbench_TOP ();
    
    // Parameters
    localparam  K = 64;         // Machine Configured for 64 items
    localparam  N = 7;          // Notes of denomination ₹100 are also accepted
    localparam  D = 6;          // D = $clog2(K) = 6

    // Port Declaration
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

    // System clk
    always #5  clk = !clk ;

    // pclk (APB interface)
    always #50 pclk = !pclk;

    // Loop Variable
    integer i,j;

    // Config memory of testbench
    reg [31:0] config_mem_tb [0:9];
    
    task initial_values;
    begin
        clk <= 1'b1;
        rstn <= 1'b1;  // Active Low
        pclk <= 1'b1;
        prstn <= 1'b0; // Active Low- Configuration is done only when, prstn is 1
        paddr <= 'b0;
        pwdata <= 'b0;
        pwrite <= 1'b0;
        item_valid <= 1'b0;
        item_code <= 'b0;
        i_valid <= 1'b0;
        note_val <= 'b0;
        // Config memory data- need to automate this
      	config_mem_tb[0] <= 32'b00000000_00000011_00000000_00101000;
      	config_mem_tb[1] <= 32'b00000000_00000011_00000000_00101000;
      	config_mem_tb[2] <= 32'b00000000_00000011_00000000_01010000;
      	config_mem_tb[3] <= 32'b00000000_00001010_00000000_00010100;
        config_mem_tb[4] <= 32'b00000000_00001010_00000000_00010100;
        config_mem_tb[5] <= 32'b00000000000000001000000010010100;
        config_mem_tb[6] <= 32'b00000000000000001000000000111100;
        config_mem_tb[7] <= 32'b00000000000000001000000100000101;
        config_mem_tb[8] <= 32'b00000000000000001000000011110000;
        config_mem_tb[9] <= 32'b00000000000000001000000001010000;
    end
    endtask

    task reset;
    begin 
        rstn <= 1'b0;
        #10;
        rstn <= 1'b1;
    end
    endtask

    // Synchronization issues
    task configure_machine;
    begin
        prstn <= 1'b1;
        #20;
      for (i = 0; i < 10; i=i+1) 
        begin
            pwrite <= 1'b1;
            paddr <= i;
            pwdata <= config_mem_tb[i];
            #100;
        end
        pwrite <= 1'b0;
        paddr <= 'b0;
        pwdata <= 'b0;
        prstn <= 1'b0;
    end
    endtask

    task item_purchase_with_no_change;
    begin
        // item selection -------------
        item_valid <= 1'b1;
        item_code <= 7'b1;
        #20;                      //  Check for 10ns as well
        item_valid <= 1'b0;
      	item_code <= 7'b0;
        // Arbitrary delay
        #50;
        // Money input ---------------
        // Cost of item is 40₹
        i_valid <= 1'b1;
        note_val <= 7'b0010100;     // First 20₹
        #20;
        i_valid <= 1'b0;
      	note_val <= 7'b0;
        #20;
        i_valid <= 1'b1;
        note_val <= 7'b0010100;     // Second ₹20
        #20;
      	i_valid <= 1'b0;
      	note_val <= 7'b0;
    end
    endtask

    task item_purchase_with_change;
    begin
        // item selection -------------
        item_valid <= 1'b1;
        item_code <= 7'd2;
        #20;                      //  Check for 10ns as well
        item_valid <= 1'b0;
      	item_code <= 7'b0;
        // Arbitrary delay
        #50;
        // Money input ---------------
        // Cost of item is 40₹
        i_valid <= 1'b1;
        note_val <= 7'b1100100;     // Added 100₹, ₹20 change is expected
        #20;
        i_valid <= 1'b0;
      	note_val <= 7'b0;
    end
    endtask
  
  	task item_exhausted_without_change;
    begin
      // item selection -------------
      item_valid <= 1'b1;
      item_code <= 7'd3;
      #20;                      //  Check for 10ns as well
      item_valid <= 1'b0;
      item_code <= 7'b0;
      // Arbitrary delay
      #30;
      // Money input ---------------
      // Cost of item is 40₹
      i_valid <= 1'b1;
      note_val <= 7'b0010100;     // Added 40₹, ₹0 change is expected
      #20;
      note_val <= 7'b0;
      i_valid <= 1'b0;
    end
    endtask
  
  	task item_exhausted_with_change;
    begin
      // item selection -------------
      item_valid <= 1'b1;
      item_code <= 7'd4;
      #20;                      //  Check for 10ns as well
      item_valid <= 1'b0;
      item_code <= 7'b0;
      // Arbitrary delay
      #30;
      // Money input ---------------
      // Cost of item is 40₹
      i_valid <= 1'b1;
      note_val <= 7'b0101000;     // Added 40₹, ₹0 change is expected
      #20;
      note_val <= 7'b0;
      i_valid <= 1'b0;
    end
    endtask

    initial begin
        initial_values;
        #10;
        reset;
        #50;
        configure_machine;
        #50;
        item_purchase_with_no_change;
      	#100;
        item_purchase_with_change;
        #100;
      	for (j = 0; j<15 ; j++) begin
         item_exhausted_without_change;
         #80;
       	end
      	#20;
      	for (j = 0; j<15 ; j++) begin
         item_exhausted_with_change;
         #80;
       	end
        $finish();
    end
  
  // VCD Files
    initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end

endmodule