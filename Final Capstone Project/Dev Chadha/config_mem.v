module config_mem #(parameter K = 64, D = 6)( 
                    input pclk,                 //  Write CLK
                    input system_clk,           //  Read CLK
                    input [15:0] paddr,         //  Write Address
  					input [D-1:0] rdaddr,        //  Read Address (from system)
                    input prstn,                //  Write Control
                    input config_state_write_enable,  //  This is a write control signal from system, enabling config_mem write only in config_mode state
                    input [31:0] pwdata,        //  Write Data 
                    output reg [31:0] prdata,       //  Data read to APB Interface
                    output reg [31:0] rd_data,      //  Data read to System
                    input [31:0] wr_data,       // Updated 32-bit data
                    input pwrite,               //  Write control by APB Interface
                    input rd_en_system,          //  Read enable from system 
                    input wr_en_system          //  Write enable from system to update 32-bit data
                    );
 
        // Declaring memory
        reg [31:0] config_mem [K-1:0];

        always @ (posedge pclk)
        begin
            if (prstn && pwrite && config_state_write_enable) begin
                config_mem[paddr] <= pwdata;
                prdata <= 32'b0;
            end
            else if (prstn && !pwrite) begin
                prdata <= config_mem[paddr];
            end
            else
                prdata <= 32'b0;
        end

        always @(posedge system_clk) begin
            if (rd_en_system)
                rd_data <= config_mem[rdaddr];
            else if (wr_en_system) begin
                config_mem[rdaddr] <= wr_data;
                // rd_data <= 32'b0;
            end
          else
            rd_data <= rd_data;
        end
                
                
endmodule