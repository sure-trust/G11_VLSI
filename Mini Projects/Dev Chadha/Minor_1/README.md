# Vending Machine- Minor Project 1

### Problem Statement

You have to study the Vending machine installed in your college. The installed vending machine accepts coins of four denominations only, which are, ₹5, ₹10, ₹20, ₹50. After understanding the functioning of the vending machine controller you have to do the following things:
- Identify your I/Ps and O/Ps clearly. List all of your reasonable assumptions (Report) and give brief description of each. Draw the Block diagram. (Report)
- Draw the state diagram and make the truth table. (Report)
- Briefly explain the functionality of the FSM using the state diagram/table.
- Design the RTL. ('.v 'file on Github, to be posted)

**About Machine:**
-  Denominations (Mentioned above)
-  Machine has 40 different items
-  Your machine is Honest (It will return the change).
-  Five type of Item
    - Packets: ₹30
    - Cans: ₹40
    - Plastic Bottle's: ₹25
    - Wrapper's: ₹15
    - Plastic Tub: ₹60

### Design Details and Assumptions

**Inputs and Output to controller**

|  Signal  |  Description                     |
|----------|----------------------------------|
|  clk     | Clock signal for synchronization |
|  rst     | Reset signal to bring the machine back to idle state |
|  item    | 5-bit one-hot encoded signal to indicate selected item |
|  coin    | 4-bit one-hot encoded signal to indicate entered coin  |
|  change_coins    | 4-bit signal sent to change dispenser, gives number of ₹5 coins to be returned  |
|  enter_more_coins    | 1-bit signal to indicate whether entered money is sufficient to buy the item selected  |
|  state_current    | 4-bit signal to indicate currently entered amount of money |


### Item Description

| Item       | Description       | Value |
|------------|-------------------|-------|
| item[4]    | Pastic tub        | 50    |
| item[3]    | Wrapper           | 15    |
| item[2]    | Plastic bottle    | 25    |
| item[1]    | Can               | 40    |
| item[0]    | Packet            | 30    |

### Coin Description

| Coin       | Value       |
|------------|-------------|
| coin[3]    | 50          |       
| coin[2]    | 20          |       
| coin[1]    | 10          |       
| coin[0]    | 5           |       



<img width="685" alt="image" src="https://github.com/devchadha-jmi/G11_VLSI/assets/82091082/f4e2bcaf-f59e-454b-985e-25a2e66126f7">


**Assumptions:**

1. User buys only one item at a time.
2. A new coin is added at every clock edge. This will lead us to use of a low frequency clock, which is acceptable when we opearte in real situation
3. Machine dispenses change only through ₹5 coins, since, we send no. of ₹5 coins to be dispensed by the dispenser, further functionality can be implemented in coin dispenser to use other coins as well.


**State Diagram:**

<img width="230" alt="image" src="https://github.com/devchadha-jmi/G11_VLSI/assets/82091082/164abb53-0366-4994-95b4-1ecbba650ec0">

<img width="224" alt="image" src="https://github.com/devchadha-jmi/G11_VLSI/assets/82091082/9ed4ff42-0bdf-4491-9384-3e0c57a4e5ea">

### Explaination through Test Cases

**Case 1:**

In this case, Four ₹5 coins are added to the machine, i.e., ₹20 are added to the machine and a ₹15 item is selected. The below given task represents the same.

```
// Stimulus Block
    task Twenty_Added_15_selected;
     begin
     for (i = 0; i <= 4; i = i+1)
     begin
        @ (posedge clk);
        coin <= 4'b0001;
     end
        coin <= 4'b0000;
        item <= 5'b01000;
        #10;
        item <= 5'b00000;
     end
    endtask
```

### Waveforms

<img width="404" alt="image" src="https://github.com/devchadha-jmi/G11_VLSI/assets/82091082/50f80424-6749-4b96-b355-78d614ce9e62">

### Explaination

- For initial 4 cycles, ₹5 coin is available on the coin signal. Therefore, ₹20 is recieved in total. `₹5 = 4'b0001`
- After this, ₹15 item is selected. `₹15 = 5'b01000`
- The state transition can be seen. It travels from `idle` to `state_5` to `state_10` to `state_15` and to `state_20`
- Whenever an item is selected, the machine comes back to `idle` state. Binary equivalents of are given below.
- The corresponding change to be returned is again indicated in the signal. This signal goes to the change dispenser.


**Case 2:**

In this case, Five ₹10 coins are added to the machine, i.e., ₹50 are added to the machine and a ₹15 item is selected. The below given task represents the same.

```
// Stimulus Block
    task Fifty_Added_15_selected;
     begin
     for (i = 0; i <= 5; i = i+1)
     begin
        @ (posedge clk);
        coin <= 4'b0010;
     end
        coin <= 4'b0000;
        item <= 5'b01000;
        #10;
        item <= 5'b00000;
     end
    endtask
```


### Waveforms

<img width="630" alt="image" src="https://github.com/devchadha-jmi/G11_VLSI/assets/82091082/97124504-1eb3-4874-be35-5ba64936ed79">

### Explaination

- For initial 5 cycles, ₹10 coin is available on the coin signal. Therefore, ₹50 is recieved in total. `₹5 = 4'b0010`
- After this, ₹15 item is selected. `₹15 = 5'b01000`
- The state transition can be seen. It travels from `idle` to `state_10` to `state_20` to `state_30` to `state_40` and to `state_50`
- Whenever an item is selected, the machine comes back to `idle` state. Binary equivalents of are given below.
- The corresponding change to be returned is again indicated in the signal. This signal goes to the change dispenser.

## States used and their binary equivalents
```
state_5  = 5'b00000,
state_10 = 5'b00001,
state_15 = 5'b00010,
state_20 = 5'b00011,
state_25 = 5'b00100,
state_30 = 5'b00101,
state_35 = 5'b00110,
state_40 = 5'b00111,
state_45 = 5'b01000,
state_50 = 5'b01001,
state_55 = 5'b01010,
state_60 = 5'b01011,
state_65 = 5'b01100,
state_70 = 5'b01101,
state_75 = 5'b01110,
state_80 = 5'b01111,
state_85 = 5'b10000,
state_90 = 5'b10001,
state_95 = 5'b10010,
state_100 = 5'b10011,
state_105 = 5'b10100,
idle      = 5'b10101;
```
