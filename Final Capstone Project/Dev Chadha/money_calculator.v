module money_calculator #(parameter N = 7)(
    input i_valid,
    input reset,
    input money_calculator_en,
    input [N-1:0] note_val,
    input [15:0] item_val,
    output x_equals_y,
    output x_less_y,
    output x_greater_y,
    output [15:0] accumulator_port
);

    reg [15:0] accumulator;

  always @ (posedge i_valid or negedge reset)
    begin
      if (!reset)
            accumulator <= 16'b0;
        else if (money_calculator_en)
            accumulator <= accumulator + note_val;
        else
            accumulator <= accumulator;
    end

    assign x_equals_y = (accumulator == item_val);
    assign x_less_y = (accumulator < item_val);
    assign x_greater_y = (accumulator > item_val);
    assign accumulator_port = accumulator;

endmodule