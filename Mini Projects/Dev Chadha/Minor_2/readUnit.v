module readUnit#(parameter N = 16, depth = 16'b0110_1000_0000_0000)(
        input rdClk,
        input rdEn,
        input rdRst,
        input [N-1:0] wrPtr,
        output [N-1:0]rdPtr,
        output reg fifoEmpty      
    );
    
    // Fifo depth is 26kb => 16'b0110_1000_0000_0000
    // Number of bits required to address this memory is 15
    // Since we are designing a FIFO, we take an extra bit address full/empty functionality
    
    reg [N-1:0]counter;
    
    always @ (posedge rdClk or posedge rdRst)
    begin
        if (rdRst)
            counter <= 0;
        else if (!rdRst && rdEn && !fifoEmpty && (counter[N-2:0] < depth-1))
        begin
            counter[N-2:0] <= counter[N-2:0] + 1;
            counter[N-1] <= counter[N-1];
        end
        else if (!rdRst && rdEn && !fifoEmpty && (counter[N-2:0] == depth-1))
        begin
            counter[N-2:0] <= 0;
            counter[N-1] <= ~counter[N-1];
        end
        else
            counter <= counter;
    end
    
    always @ (*)
    begin
        if ((wrPtr[N-1] == rdPtr[N-1]) && (wrPtr[N-2:0] == rdPtr[N-2:0]))
            fifoEmpty = 1'b1;
        else
            fifoEmpty = 1'b0;
    end
    
    assign rdPtr = counter;
    
endmodule
