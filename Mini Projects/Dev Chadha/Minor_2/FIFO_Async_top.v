module FIFO_Async_top#(parameter N = 16)(
    input wrClk,
    input rdClk,
    input wrRst,
    input rdRst,
    input [7:0] wrData,
    output [7:0] rdData,
    input wrEn,
    input rdEn,
    output fifoFull,
    output fifoEmpty
    );
    
    wire wrEnDerived;
    wire [N-1:0] wrPtr;
    wire [N-1:0] rdPtrG2B;
    wire [N-1:0] rdPtrDualFlopSyncOut;
    wire [N-1:0] wrPtrB2G;
    wire [N-1:0] rdPtr;
    wire [N-1:0] wrPtrG2B;
    wire [N-1:0] wrPtrDualFlopSyncOut;
    wire [N-1:0] rdPtrB2G;
    
    fifoMemory uutFifoMemory (
        .wrClk(wrClk),
        .rdClk(rdClk),
        .wrPtr(wrPtr),
        .rdPtr(rdPtr),
        .wrEn(wrEnDerived),
        .wrData(wrData),
        .rdData(rdData)
    );
    
    and (wrEnDerived, wrEn, ~fifoFull);
    
    writeUnit uutWritUnit(
        .wrClk(wrClk),
        .wrEn(wrEn),
        .wrRst(wrRst),
        .rdPtr(rdPtrG2B),
        .wrPtr(wrPtr),
        .fifoFull(fifoFull)
    );
    
    readUnit uutReadUnit(
        .rdClk(rdClk),
        .rdEn(rdEn),
        .rdRst(rdRst),
        .wrPtr(wrPtrG2B),
        .rdPtr(rdPtr),
        .fifoEmpty(fifoEmpty)      
    );
    
    binaryGray uutBinaryGrayWrite (
        .binaryIn(wrPtr),
        .grayOut(wrPtrB2G)
    );
    
    dualFlopSynchronizer uutDualFlopSynchronizerWrite(
        .dataIn(wrPtrB2G),
        .dataOut(wrPtDualFlopSyncOut),
        .clk(rdClk),
        .rst(rdRst)
    );
    
    grayBinary uutGrayBinaryWrite(
        .grayIn(wrPtDualFlopSyncOut),
        .binaryOut(wrPtrG2B)
    );
    
    binaryGray uutBinaryGrayRead (
        .binaryIn(rdPtr),
        .grayOut(rdPtrB2G)
    );
    
    dualFlopSynchronizer uutDualFlopSynchronizerRead(
        .dataIn(rdPtrB2G),
        .dataOut(rdPtDualFlopSyncOut),
        .clk(wrClk),
        .rst(wrRst)
    );
    
    grayBinary uutGrayBinaryRead(
        .grayIn(rdPtDualFlopSyncOut),
        .binaryOut(rdPtrG2B)
    );
           
endmodule
