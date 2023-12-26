module config_mem ( input pclk,                 //  Write CLK
                    input system_clk,           //  Read CLK
                    input [15:0] paddr,         //  Write Address
                    input [15:0] rdaddr,        //  Read Address (from system)
                    input prstn,                //  Write Control 
                    input [31:0] pwdata,        //  Write Data 
                    output [31:0] prdata,       //  Data read to APB Interface
                    output [31:0] rd_data,      //  Data read to System 
                    input pwrite,               //  Write control by APB Interface 
                    );




                
                
endmodule

