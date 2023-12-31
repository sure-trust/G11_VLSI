# Final Capstone Project- SURE Trust Vending Machine

This project is about RTL design of a Vending Machine with the following interfaces:
- General Interface-
  - `clk`: 100 MHz system clock
  - `rstn`: Active low asynchronous reset signal
- APB Interface for Configuration-
  - `pclk`: 10 MHz APB bus clock
  - `paddr`: 16-bit APB bus address
  - `prstn`: Active low asynchronous reset for the APB interface
  - `pwdata`: 32-bit write data
  - `prdata`: 32-bit read data
  - `pwrite`: Write enable signal
- Coin interface
  - `i_valid`: Valid signal indicating the insertion of a coin
  - `note_val`: Bus carrying the value of the inserted coin (size depends on parameter)
-  Item Select Interface
    - `item_valid`: Valid signal indicating item selection
    - `item_code`: Bus carrying the selected item code
- Output Interface
  - `o_valid`: Valid signal indicating the availability of output data
  - `output_item`: Bus carrying the selected item code
  - `note_change`: Bus carrying the amount of change in rupees
 

### Block Diagram

<p align="center">
  <img src="https://github.com/devchadha-jmi/G11_VLSI/assets/82091082/665860c6-3d42-41a1-b803-a1e24ecdc50a">
</p>


### Controlling- State Machine

<p align="center">
  <img src="https://github.com/devchadha-jmi/G11_VLSI/assets/82091082/0784cd6a-3c8c-4761-89a5-acfa950f0c9c" width="800" alt="Image">
</p>



### Money Calculator

<p align="center">
  <img src="https://github.com/devchadha-jmi/G11_VLSI/assets/82091082/d190497a-7143-481d-89d5-9d574bcc9503" width="400" alt="Image">
</p>


### Change Calculator

<p align="center">
  <img src="https://github.com/devchadha-jmi/G11_VLSI/assets/82091082/646a51e2-c698-463b-9716-09828d947925" width="400" alt="Image">
</p>


### Files in this submission
```
.
├── README.md
├── TOP.v
├── change_calculator.v
├── config_mem.v
├── money_calculator.v
├── tb_TOP_old.v
└── testbench_TOP.v
```

- **README.md**- This markdown file has the project report.
- **TOP.v**- This is the top module, this has instantiation of `config_mem.v`, `change_calculator.v`, `money_calculator.v` along with the controlling **Finite State Machine**.
- **change_calculator.v**- This module is responsible for change calculation, depending if the accumulated amount is more than item_val, change is calculated accordingly.
- **config_mem.v**- This memory array carries the configuration data of the machine given by the machine owner.
- **money_calculator.v**- This module is responsible for accumulating the amount entered by the user.
- **tb_TOP_old.v**- This testbench is a simpler version that was used for basic debugging. This provided basic stimulus to the DUT.
- **testbench_TOP.v**- Two test scenariors have been checked using modern verilog concepts like tasks and functions in this testbench.


### Waveforms

#### Configuring the memory

This task configures the vending machine by loading 32-bit value to first 10 locations of the memory

```
task configure_machine;
    begin
        prstn <= 1'b1;
        #20;
      for (i = 0; i < 10; i=i+1) 
        begin
            pwrite <= 1'b1;
            paddr <= i;
            pwdata <= config_mem_tb[i];
            #100;
        end
        pwrite <= 1'b0;
        paddr <= 'b0;
        pwdata <= 'b0;
        prstn <= 1'b0;
    end
    endtask
```

The configuration data was stored in `reg [31:0] config_mem_tb [0:9];`, well this approach is not so good. I will use `readmemb` function to import this configuring data from a text file.
```
// Config memory data- need to automate this
      	config_mem_tb[0] <= 32'b00000000_00000011_00000000_00101000;
      	config_mem_tb[1] <= 32'b00000000_00000011_00000000_00101000;
      	config_mem_tb[2] <= 32'b00000000_00000011_00000000_01010000;
      	config_mem_tb[3] <= 32'b00000000_00001010_00000000_00010100;
        config_mem_tb[4] <= 32'b00000000_00001010_00000000_00010100;
        config_mem_tb[5] <= 32'b00000000000000001000000010010100;
        config_mem_tb[6] <= 32'b00000000000000001000000000111100;
        config_mem_tb[7] <= 32'b00000000000000001000000100000101;
        config_mem_tb[8] <= 32'b00000000000000001000000011110000;
        config_mem_tb[9] <= 32'b00000000000000001000000001010000;
```
- APB Interface is active during the memory configuration-
  -  `paddr` varies from 0 to 9.
  -  `prstn` is inactive.
  -  `pwdata` comes from the `config_mem_tb`
  -  `pwrite` goes high during the configuring state.
  -   Other signals are tied to zero.

![image](https://github.com/devchadha-jmi/G11_VLSI/assets/82091082/9a42903b-2457-4daa-aa61-acd825f20ef1)

#### Item Purchase with no change

```
task item_purchase_with_no_change;
    begin
        // item selection -------------
        item_valid <= 1'b1;
        item_code <= 7'b1;
        #20;                      //  Check for 10ns as well
        item_valid <= 1'b0;
      	item_code <= 7'b0;
        // Arbitrary delay
        #50;
        // Money input ---------------
        // Cost of item is 40₹
        i_valid <= 1'b1;
        note_val <= 7'b0010100;     // First 20₹
        #20;
        i_valid <= 1'b0;
      	note_val <= 7'b0;
        #20;
        i_valid <= 1'b1;
        note_val <= 7'b0010100;     // Second ₹20
        #20;
      	i_valid <= 1'b0;
      	note_val <= 7'b0;
    end
    endtask
```

- All relevant signals show expected behaviour
- Item cost is ₹40 and ₹20 coin is added twice. Hence, no change is expected.

![image](https://github.com/devchadha-jmi/G11_VLSI/assets/82091082/e096d1be-c319-479a-81d1-43059dec20a5)

#### Item purchase with change

```
task item_purchase_with_change;
    begin
        // item selection -------------
        item_valid <= 1'b1;
        item_code <= 7'd2;
        #20;                      //  Check for 10ns as well
        item_valid <= 1'b0;
      	item_code <= 7'b0;
        // Arbitrary delay
        #50;
        // Money input ---------------
        // Cost of item is 40₹
        i_valid <= 1'b1;
        note_val <= 7'b1100100;     // Added 100₹, ₹20 change is expected
        #20;
        i_valid <= 1'b0;
      	note_val <= 7'b0;
    end
    endtask
```

- All relevant signals show expected behaviour
- Item cost is ₹80 and ₹100 coin is added. Hence, ₹20 change is expected and recieved too.

![image](https://github.com/devchadha-jmi/G11_VLSI/assets/82091082/be1b4b0d-44ba-48b4-a2c2-d1e2170aed4c)


#### Item exhausted (without change purchase)

```
task item_exhausted_without_change;
    begin
      // item selection -------------
      item_valid <= 1'b1;
      item_code <= 7'd3;
      #20;                      //  Check for 10ns as well
      item_valid <= 1'b0;
      item_code <= 7'b0;
      // Arbitrary delay
      #30;
      // Money input ---------------
      // Cost of item is 40₹
      i_valid <= 1'b1;
      note_val <= 7'b0010100;     // Added 40₹, ₹0 change is expected
      #20;
      note_val <= 7'b0;
      i_valid <= 1'b0;
    end
    endtask
```

The task is invoked in a loop
```
for (j = 0; j<15 ; j++) begin
         item_exhausted_without_change;
         #80;
       	end
```
- Number of items available is 10, after 10 iterations, the item is unavailable hence, no output is retured in that scenario.
- Since, the item is unavailable, the system enters into iten not available state and then jumps to idle state.

![image](https://github.com/devchadha-jmi/G11_VLSI/assets/82091082/4c7b2593-97e5-4bb2-859e-e7e4c392dc26)



## To Do

- More test cases are to be added
    - Reset Interrupt in money input state
- Default memory config data is not supported yet.
- Code cleaning
- Automate test bench, use `readmemb` function to import 32-bit data, currently, it has been added directly into the testbench. 


