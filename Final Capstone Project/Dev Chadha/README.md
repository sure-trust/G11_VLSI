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
