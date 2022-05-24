## Karson Mahan
# HRE Lab 5 - I SPI
# HRE S20
------------------------------------------------
## Collaboration Statement

## Summary
The purpose of this lab was to provide students with familiarity on the Serial Peripheral Interface. 

### Microchip EEPROM IC
**Q1: While we are talking about EEPROM, what is it? Compare it to the other types of ROM and explain the benefits and drawbacks of EEPROM.**  
- Electrically Erasable Programmable Read-Only Memory
    - Non-volatile memory used to store relatively small amounts of data but allowing individual bytes to be erased and reprogrammed. 
    - Developed to overcome drawbacks of EPROM
- Advantages:
    - Erasure is electrical and immediate
    - Possible to erase entire contents or a particular byte per selection
    - Easy to program and erase contents without having to remove it from the board
    - Additional equipment isn't necessary to change contents
    - Possible to reprogram infinite number of times
- Disadvantages:
    - Requires different voltages for erasing, reading, and writing data
    - Limited data retention time period
    - External serial type requires a long time to access
    - Expensive compared to PROM and EPROM

**Q2:What is the operating voltage of the EEPROM? Explain why it is important to stay within this operating range (what could be effects of under-voltage and over-voltage).**
- 2.5 - 5.5V

**Q3:One of the features provided by this IC is built-in write protection. What is write protection and why might it be important?**
- The ability of a hardware or software program to prevent new information from being written or old information from being changed
- Helps prevent data from being accidentally erased or written over 

**Q4:The EEPROM uses SPI as a means of communication. What is SPI? What are some of its characteristics? Explain some of the +/-s of using it.**
- Serial Peripheral Interface
    - interface bus commonly used to send data between microcontrollers and small peripherals
    - uses separate clock and data lines, along with a select line to choose which device to talk to 
- Advantages: 
    - Simple hardware interfacing
    - Faster than asynchronous
    - Supports multiple slaves
    - Supports full duplex
- Disadvantages:
    - Requires more signal lines than other communication methods
    - Communication must be well-defined in advance
    - Supports only one master device
    - No error checking protocol

**Q5:Explain the different pin functionalities for SPI on the IC. Do you think this would be a Master or Slave device? Why?**
- CS:Chip Select Input
    - Used to select or deselect device

- SO:Serial Data Output
    - Used to transfer data out of the pin

- WP:Write-Protect Pin
    - Used in conjunction with the WPEN bit in the Status Register to prohibit writes to the nonvolatile bits in the Status Register

- SI:Serial Data Input
    - Used to transfer data into the device

- SCK:Serial Clock Input
    - Used to synchronize the communication between a master and the device

- HOLD:Hold Input
    - Used to suspend transmission to the device while in the middle of a serial sequence without having to retransmit the entire sequence again

- This would be a slave device because it can be selected. SPI supports multiple slave devices but only one master. It also has SCK 
which syncs the device with the master

**Q6: Going into the operation, how do the read and write sequences work? What is the write enable latch for? Feel free to include the figures from the data sheet in your readme along with your explanation. Explain how you would set up a read and write to the IC.**
- Read
    - Device is selected by pulling CS low
    - 8-bit read instruction is transmitted, followed by the 16-bit address (the five MSBs of the address are don't care bits)
    - Data stored in memory at the selected address is shifted out on the SO pin
        - Data stored in memory at the next address can be read sequentially by continuing to provide clock pulses
    - Internal address pointer is automatically incremented to the next higher address after each byte of data is shifted out
        - When highest address is reached (07FFh), address counter rolls over to address 0000h allowing the read cycle to be continued indefinitely
    - Read operation is terminated by raising the CS pin

- Write
    - Write enable latch must be set by issuing the WREN instruction
        - The latch is to enable/disable write operations
            - This is part of the write protection
        - Set CS low, then clocking out the proper instruction
        - After all eight bits of the instruction are transmitted, the CS must be brought high to set the write enable latch
    - Set CS to low
    - Issue a WRITE instruction, followed by the 16-bit address (the five MSBs of the address are don't care bits), then the data to be written
        - Up to 16 bytes or 32 bytes of data can be sent to the device before a write cycle is necessary
            - Only restriction is that all the bytes must reside in the same page
    - Bring CS high after the Least Significant bit (D0) of the nth data byte has been clocked in
        - If CS is brought high any other time, the write operation will not be completed
    - Write enable latch is reset after a write cycle


### IC Interaction
**Q7: Identify what fun1/fun2/fun3 do. How do you know?**
- fun1 : Reads the entire memory and writes the binary to a file

- fun2 : Writes value to Status Register and then checks to see if value was successfully written

- fun3 : Prints the contents of the status register

- Most of what the functions are doing can be done by comparing the hex values to the binary instructions in the data sheet


**Q8:What is the first for loop in fun1 used for? Why is the range of size 2050?**
- Adds items to the list 'arr' until list reaches the size of 2050
- To make sure to get the entire memory of the IC 

**Q9:How many SPI devices can a Raspberry Pi support at one time? How do you know?**
- 2 SPI devices
- A Raspberry Pi supports 2 chip select lines to interface with 2 SPI devices
- I looked this up online

**Q10:How would you connect EEPROM ICs to a Raspberry Pi?**
- Connect to the appropriate bus found on the datasheet

## Conclusion
- I learned a lot about SPI and how it is used to communicate. I also learned a lot about EEPROMs.