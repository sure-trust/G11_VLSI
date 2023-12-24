// Number of items                 -> K = 64
// Depth of configuration memory   -> K = 64
// Item code width                 -> $clog2(K) = 6  
// Item code is nothing but address specified for a particular item
// note_val width                  -> N = 7 (when ₹100 is acceptable)

module TOP #(parameter K = 16, N = 6)(
        // General Interface
        input clk,
        input rstn,

        // APB Interface for Configuration
        input pclk,
        input [15:0] paddr,
        input prstn,
        input [31:0] pwdata,
        output [31:0] prdata,
        input pwrite,

        // Coin Interface
        input i_valid,
        input [N-1:0] note_val,    

        // Item Select Interface
        input item_valid,
        input [K-1:0] item_code,

        // Output Interface
        output o_valid,
        output [K-1:0] output_item,
        output [K-1:0] note_exchange
);

        parameter [3:0] idle                    = 4'b0000,
                        config_mode             = 4'b0001,
                        wait_for_item_selection = 4'b0010,
                        item_availablity_test   = 4'b0011,
                        item_not_available      = 4'b0100,
                        wait_for_money_input    = 4'b0101,
                        money_input             = 4'b0110,
                        change_calculation      = 4'b0111,
                        item_change_dispenser   = 4'b1000,
                        acc_to_change           = 4'b1001,
                        reset_change_dispenser  = 4'b1010;

        
        reg [3:0] state, next_state;

        // Signal item_available indicates availibitly of item
        wire item_available;

        // Signals x=y, x<y, x>y indicate whether entered amount(accumulated) 
        // x is less than equal-to or greater than expected amount y 
        wire x_equals_y, x_less_y, x_greater_y;

        // reg accumulator, item_val, change
        reg [15:0] accumulator, itme_val, change;

        always @ (*)
        begin
                case (state)
                idle : begin
                        if (!rstn)
                                next_state <= idle;
                        else if (rstn && prstn)
                                next_state <= config_mode;
                        else if (rstn && !prstn)
                                next_state <= wait_for_item_selection;
                        else
                                next_state <= idle;
                end
                config_mode: begin
                        if (!rstn)
                                next_state <= idle;
                        else if (rstn && !prstn)
                                next_state <= wait_for_item_selection;
                        else
                                next_state <= config_mode;     
                end
                wait_for_item_selection: begin
                        if (!rstn)
                                next_state <= idle;
                        else if (rstn && prstn && !item_valid)
                                next_state <= config_mode;
                        else if (rstn && !prstn && item_valid)
                               next_state <= item_availablity_test;
                        else
                                next_state <= wait_for_item_selection
                end
                item_availablity_test: begin
                        if (!rstn)
                                next_state <= idle;
                        else if (item_available && rstn)
                                next_state <= wait_for_money_input;
                        else if (!item_available && rstn)
                                next_state <= item_not_available;
                        else
                                next_state <= item_availablity_test;             
                end
                item_not_available: begin
                        next_state <= idle;
                end
                wait_for_money_input: begin
                        if (i_valid)
                                next_state <= money_input;
                        else if (!rstn)
                                next_state <= idle;
                        else
                                next_state <= wait_for_money_input;
                end
                money_input: begin
                        if (!rstn)
                                next_state <= acc_to_change;
                        else if (!x_less_y | x_greater_y | x_equals_y)
                                next_state <= change_calculation;
                        else
                                next_state <= change_calculation;
                end
                change_calculation: begin
                        if (!rstn)
                                next_state <= acc_to_change;
                        else
                                next_state <= item_change_dispenser;     
                end
                item_change_dispenser: begin
                        if (!rstn)
                                next_state <= acc_to_change;
                        else
                                next_state <= idle;
                end
                acc_to_change: begin
                        next_state <= reset_change_dispenser;
                end
                reset_change_dispenser: begin
                        next_state <= idle;
                end
                default: begin
                        next_state <= idle;
                end
                endcase
        end

        always @ (posedge clk)
        begin
                state <= next_state;
        end

        




endmodule
