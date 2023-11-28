module vending_machine_tb();
    
    // reg signals to drive inputs
    reg clk, rst;
    reg [3:0] coin;
    reg [4:0] item;
    
    // wire signals to catch outputs
    wire [4:0] change_coins;
    wire enter_more_coins;
    wire [4:0] state_current;
    
    // Design instantiation
    vending_machine_top uut (
        .clk(clk),
        .rst(rst),
        .coin(coin),
        .item(item),
        .change_coins(change_coins),
        .enter_more_coins(enter_more_coins),
        .state_current(state_current));
    
    // Intial Values
    initial begin
        clk <= 1'b1;
        item <= 5'b0;
    end
        
    // clk driver
    always #5 clk <= ~clk;
    
    // Loop Variable
    integer i;
    
    // Task for RESET
    task reset;
    begin
        rst <= 1'b1;
        #10;
        rst <= 1'b0;
    end
    endtask
    
    // Stimulus Block
    task Twenty_Added_15_selected;
     begin
     for (i = 0; i <= 4; i = i+1)
     begin
        @ (posedge clk);
        coin <= 4'b0001;
     end
        coin <= 4'b0000;
        item <= 5'b01000;
        #10;
        item <= 5'b00000;
     end
    endtask
    
    // Stimulus Block
    task Twenty_Five_Added_15_selected;
     begin
     for (i = 0; i <= 5; i = i+1)
     begin
        @ (posedge clk);
        coin <= 4'b0001;
     end
        coin <= 4'b0000;
        item <= 5'b01000;
        #10;
        item <= 5'b00000;
     end
    endtask
    
    // Stimulus Block
    task Thirty_Added_15_selected;
     begin
     for (i = 0; i <= 6; i = i+1)
     begin
        @ (posedge clk);
        coin <= 4'b0001;
     end
        coin <= 4'b0000;
        item <= 5'b01000;
        #10;
        item <= 5'b00000;
     end
    endtask
    
    // Stimulus Block
    task Fifty_Added_15_selected;
     begin
     for (i = 0; i <= 5; i = i+1)
     begin
        @ (posedge clk);
        coin <= 4'b0010;
     end
        coin <= 4'b0000;
        item <= 5'b01000;
        #10;
        item <= 5'b00000;
     end
    endtask
    
    // Stimulus Block
    initial begin
    reset();
    Twenty_Added_15_selected();
    Twenty_Five_Added_15_selected();
    Thirty_Added_15_selected();
    Fifty_Added_15_selected();
    #200;
    $finish();
    end

endmodule