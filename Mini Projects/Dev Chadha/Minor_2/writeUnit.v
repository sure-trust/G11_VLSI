module writeUnit #(parameter N = 16, depth = 16'b0110_1000_0000_0000)(
        input wrClk,
        input wrEn,
        input wrRst,
        input [N-1:0] rdPtr,
        output [N-1:0]wrPtr,
        output reg fifoFull
    );
    
    // Fifo depth is 26kb => 16'b0110_1000_0000_0000
    // Number of bits required to address this memory is 15
    // Since we are designing a FIFO, we take an extra bit address full/empty functionality
    
    reg [N-1:0]counter;
    
    always @ (posedge wrClk or posedge wrRst)
    begin
        if (wrRst)
            counter <= 0;
        else if (!wrRst && wrEn && !fifoFull && (counter[N-2:0] < depth-1))
        begin
            counter[N-2:0] <= counter[N-2:0] + 1;
            counter[N-1] <= counter[N-1];
        end
        else if (!wrRst && wrEn && !fifoFull && (counter[N-2:0] == depth-1))
        begin
            counter[N-2:0] <= 0;
            counter[N-1] <= ~counter[N-1];
        end
        else
            counter <= counter;
    end
    
    always @ (*)
    begin
        if ((wrPtr[N-1] != rdPtr[N-1]) && (wrPtr[N-2:0] == rdPtr[N-2:0]))
            fifoFull = 1'b1;
        else
            fifoFull = 1'b0;
    end
    
    assign wrPtr = counter;
    
endmodule
