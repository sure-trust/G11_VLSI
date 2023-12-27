module change_calculator #(parameter N = 7) (
    input rstn,
    input [15:0] accumulator,
    input [15:0] item_val,
    input change_calculator_en,
    output [N-1:0] change
);
    reg [15:0] change_reg;
    always @(*) begin
      if (!rstn)
            change_reg <= 0;
        else if (change_calculator_en)
            change_reg <= accumulator - item_val;
        else
            change_reg <= change_reg;
    end

    assign change = change_reg [N-1:0];
    
endmodule