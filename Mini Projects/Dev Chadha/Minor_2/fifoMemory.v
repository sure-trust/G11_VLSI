module fifoMemory#(parameter N = 16, depth = 16'b0110_1000_0000_0000)(
        input wrClk,
        input rdClk,
        input [N-1:0] wrPtr,
        input [N-1:0] rdPtr,
        input wrEn,
        //input rdEn,          -- Not sure whether to use or not
        input [7:0] wrData,
        output reg [7:0] rdData
    );
    
    // Declaring memory
    reg [7:0] RAM [0:depth-1];
    
    //
    always @ (posedge wrClk)
    begin
        if (wrEn)
            RAM [wrPtr] <= wrData;
        else
            RAM [wrPtr] <= RAM[wrPtr];
    end
    
    always @ (posedge rdClk)
    begin
        rdData <= RAM[rdPtr];
    end
    
endmodule
