// Number of items                 -> K = 64
// Depth of configuration memory   -> K = 64
// Item code width                 -> $clog2(K) = 6  
// Item code is nothing but address specified for a particular item
// note_val width                  -> N = 7 (when ₹100 is acceptable)

module TOP #(parameter K = 64, N = 7, D = 6)(
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
  	input [D-1:0] item_code,

        // Output Interface
        output reg o_valid,
  	output reg [D-1:0] output_item,
        output reg [N-1:0] note_exchange          // Depends on maximum possible change, yet to asses this
);

        parameter [3:0] idle                    = 4'b0000,
                        config_mode             = 4'b0001,
                        wait_for_item_selection = 4'b0010,
                        item_availablity_test   = 4'b0011,
                        item_not_available      = 4'b0100,
                        // wait_for_money_input    = 4'b0101,
                        money_input             = 4'b0110,
                        change_calculation      = 4'b0111,
                        item_change_dispenser   = 4'b1000,
                        acc_to_change           = 4'b1001,
                        reset_change_dispenser  = 4'b1010;

        
        reg [3:0] state, next_state;
        
        // Signals for interfacing config memory
        reg rd_en_system;
        reg wr_en_system;
        reg money_calculator_en;
        reg change_calculator_en;
        reg config_state_write_enable;
        reg [$clog2(K)-1:0] rdaddr;
        wire [31:0] rd_data_wire;
        reg [31:0] rd_data;                     // Stores 32-bit data read from config memory
        reg [31:0] wr_data;
        reg [7:0] byte4, byte3;

        // Signal item_available indicates availibitly of item
        wire item_available = !(rd_data[23:16] == 8'b0);

        // Signals x=y, x<y, x>y indicate whether entered amount(accumulated) 
        // x is less than equal-to or greater than expected amount y 
        wire x_equals_y, x_less_y, x_greater_y;

        // reg accumulator, item_val, change
        reg [15:0] accumulator/*, item_val*/;
        wire [15:0] accumulator_wire;
        reg [N-1:0] change;
        wire [N-1:0] change_wire;

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
                                next_state <= wait_for_item_selection;
                end
                item_availablity_test: begin
                        if (!rstn)
                                next_state <= idle;
                        else if (item_available && rstn)
                                next_state <= money_input;
                        else if (!item_available && rstn)
                                next_state <= item_not_available;
                        else
                                next_state <= item_availablity_test;             
                end
                item_not_available: begin
                        next_state <= idle;
                end
                /*wait_for_money_input: begin
                        if (i_valid)
                                next_state <= money_input;
                        else if (!rstn)
                                next_state <= idle;
                        else
                                next_state <= wait_for_money_input;
                end*/
                money_input: begin
                        if (!rstn)
                                next_state <= acc_to_change;
                        else if (!x_less_y | x_greater_y | x_equals_y)
                                next_state <= change_calculation;
                        else
                                next_state <= money_input;
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

        always @ (posedge clk) begin
                state <= next_state;
        end

        always @(*) begin
                case (state)
                idle: begin
                        o_valid <= 0;
                        output_item <= 0;
                        note_exchange <= 0;
                        rd_en_system <= 0;
                        wr_en_system <= 0;
                        money_calculator_en <= 0;
                        change_calculator_en <= 0;
                        config_state_write_enable <= 0;
                end
                config_mode: begin
                        o_valid <= 0;
                        output_item <= 0;
                        note_exchange <= 0;
                        rd_en_system <= 0;
                        wr_en_system <= 0;
                        money_calculator_en <= 0;
                        change_calculator_en <= 0;
                        config_state_write_enable <= 1;
                end
                wait_for_item_selection: begin
                        o_valid <= 0;
                        output_item <= 0;
                        note_exchange <= 0;
                        rd_en_system <= 0;
                        wr_en_system <= 0;
                        config_state_write_enable <= 0;
                        money_calculator_en <= 0;
                        change_calculator_en <= 0;
                        rdaddr <= item_code;                    // Important to note this value initialization
                end
                item_availablity_test: begin
                        o_valid <= 0;
                        output_item <= 0;
                        note_exchange <= 0;
                        rd_en_system <= 1;
                        rd_data <= rd_data_wire;
                        wr_en_system <= 0;
                        config_state_write_enable <= 0;
                        money_calculator_en <= 0;
                        change_calculator_en <= 0;
                end
                item_not_available: begin
                        o_valid <= 0;
                        output_item <= 0;
                        note_exchange <= 0;
                        rd_en_system <= 0;
                        wr_en_system <= 0;
                        config_state_write_enable <= 0;
                        money_calculator_en <= 0;
                        change_calculator_en <= 0;
                end
                money_input: begin
                        o_valid <= 0;
                        output_item <= 0;
                        note_exchange <= 0;
                        rd_en_system <= 0;
                        wr_en_system <= 0;
                        config_state_write_enable <= 0;
                        money_calculator_en <= 1;
                        change_calculator_en <= 0;
                        accumulator <= accumulator_wire;
                end
                change_calculation: begin
                        o_valid <= 0;
                        output_item <= 0;
                        note_exchange <= 0;
                        rd_en_system <= 0;
                        wr_en_system <= 0;
                        config_state_write_enable <= 0;
                        money_calculator_en <= 0;
                        change_calculator_en <= 1;
                        change <= change_wire;
                        byte4 <= rd_data[31:24]+1;
                        byte3 <= rd_data[23:16]-1;
                end
                item_change_dispenser: begin
                        o_valid <= 1;
                        output_item <= rdaddr;
                        note_exchange <= change;
                        rd_en_system <= 0;
                        wr_en_system <= 1;
                        config_state_write_enable <= 0;
                        money_calculator_en <= 0;
                        change_calculator_en <= 0;
                        wr_data <= {byte4, byte3, rd_data[15:0]};
                end
                acc_to_change: begin
                        o_valid <= 0;
                        output_item <= 0;
                        note_exchange <= 0;
                        rd_en_system <= 0;
                        wr_en_system <= 0;
                        config_state_write_enable <= 0;
                        money_calculator_en <= 0;
                        change_calculator_en <= 0;
                        change <= accumulator;
                end
                reset_change_dispenser: begin
                        o_valid <= 1;
                        output_item <= 0;
                        note_exchange <= change;
                        rd_en_system <= 0;
                        wr_en_system <= 1;
                        config_state_write_enable <= 0;
                        money_calculator_en <= 0;
                        change_calculator_en <= 0;
                end
                default: begin
                        o_valid <= 0;
                        output_item <= 0;
                        note_exchange <= 0;
                        rd_en_system <= 0;
                        wr_en_system <= 0;
                        config_state_write_enable <= 0;
                        money_calculator_en <= 0;
                        change_calculator_en <= 0;
                end
                endcase
        end

        // Instantiate config_mem module
  config_mem #(.K(K), .D(D)) config_mem_inst (
                .pclk(pclk),
                .system_clk(clk),
                .paddr(paddr),
                .rdaddr(rdaddr),
                .prstn(prstn),
                .config_state_write_enable(config_state_write_enable),
                .pwdata(pwdata),
                .prdata(prdata),
                .rd_data(rd_data_wire),
                .wr_data(wr_data),
                .pwrite(pwrite),
                .rd_en_system(rd_en_system),
                .wr_en_system(wr_en_system)
        );

        money_calculator #(.N(7)) money_calc_inst (
                .i_valid(i_valid),
                .reset(rstn),
                .money_calculator_en(money_calculator_en),
                .note_val(note_val),
                .item_val(rd_data[15:0]),
                .x_equals_y(x_equals_y),
                .x_less_y(x_less_y),
                .x_greater_y(x_greater_y),
                .accumulator_port(accumulator_wire)
        );

        change_calculator #(.N(7)) change_calc_inst (
                .rstn(rstn),
                .accumulator(accumulator),
                .item_val(rd_data[15:0]),
                .change_calculator_en(change_calculator_en),
                .change(change_wire)
        );
        
endmodule 