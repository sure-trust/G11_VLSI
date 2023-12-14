module testbench();

    reg wrClk, rdClk, wrRst, rdRst, wrEn, rdEn;
    reg [7:0] wrData;
    wire [7:0] rdData;
    wire fifoFull, fifoEmpty;

    // Instantiate the module under test
    FIFO_Async_top #(16) dut (
        .wrClk(wrClk),
        .rdClk(rdClk),
        .wrRst(wrRst),
        .rdRst(rdRst),
        .wrData(wrData),
        .rdData(rdData),
        .wrEn(wrEn),
        .rdEn(rdEn),
        .fifoFull(fifoFull),
        .fifoEmpty(fifoEmpty)
    );

    // Clock generation
    always begin
        wrClk = 1'b0;
        #5; // Adjust delay based on your clock frequency
        wrClk = 1'b1;
        #5; // Adjust delay based on your clock frequency
    end

    always begin
        rdClk = 1'b0;
        #7; // Adjust delay based on your clock frequency
        rdClk = 1'b1;
        #7; // Adjust delay based on your clock frequency
    end

    initial begin
        // Initialize/reset signals
        wrRst = 1'b1;
        rdRst = 1'b1;
        wrEn = 1'b0;
        rdEn = 1'b0;
        wrData = 8'h00;

        // Release reset after some time
        #20;
        wrRst = 1'b0;
        rdRst = 1'b0;

        // Test scenario
        // Write some data into the FIFO
        wrEn = 1'b1;
        wrData = 8'hAA;
        #20;
        wrData = 8'hBB;
        #20;
        wrData = 8'hCC;
        #20;
        wrEn = 1'b0;

        // Read from the FIFO
        rdEn = 1'b1;
        #40;
        rdEn = 1'b0;

        // Add more test cases as needed...

        // Finish simulation
        #100;
        $finish;
    end

endmodule
