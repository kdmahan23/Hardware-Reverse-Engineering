## Kayla Mahan
# HRE Lab 4 - Protocol Decoding
# HRE S20
------------------------------------------------
## Collaboration Statement

## Summary
The purpose of this lab was to familiarize students with one of the protocols discussed in class. Given a data capture, students will decode and research the protocol and answer questions on it. Students will also emulate basic sensor functionality in Python. 

### Protocol basics
**Q1: What communications protocol is present? How can you tell based on the capture? Apply the correct analyzer to decode the protocol and verify that you are correct?**  
- I2C
- There are only 2 channels present in the capture. One for clock and one for the transmission. The other protocols need more channels
    ![Protocol Verify](./protocol.PNG)  

**Q2: Identify one transmission within the capture. How do you know when the transmission starts and when it stops?**
- ![Transmissions](./transmission.png) 
- Starts: SDA goes low before clk
- Stops: SDA goes high after clk

**Q3: How many total transmissions are there in this capture (including attempted transmissions)?**
- 30 total transmissions

**Q4: What is the clock frequency? How can you tell?**  
- 100 kHz
- The logic analyzer computes the frequency 


### Deep Dive
**Q5: What does the sensor do (what does it measure)? Explain the process.**  
- Measures moisture and temperature of the soil
- The sensor uses a built in capacitive touch measurement system present in the ATSAMD10 chip for moisture and the internal temperature sensor on the microcontroller for temperature.

**Q6: What does the device connect to for operation? How do you use the device? What is he default address of the device**  
- It uses an I2C interface so that it can be used with almost any microcontroller. 
- Can be connected by a 4-pin JST-PH cable to a microcontroller or single board computer
- Then all you have to do after connecting is run their Arduino or CircuitPython code to read the temperature and capacitive measurement.
- Default address is 0x36

**Q7: What are the codes sent to the sensor to get measurements back? What measurement values are sent back (what's the format)?**
- Moisture:
    - Send:
        - ![](./write(moisture).png)
        - TOUCH_BASE (0x0f)
        - TOUCH_CHANNEL_OFFSET (0x10)
    - Receive
        - ![Code](./capture.png)
        - TOUCH_BASE (0x0f)
        - Moisture
        - Percent sign
        - Format (short)
- Temperature: 
    - Send:
        - ![](./write(temp).png)
        - STATUS_BASE (0x00)
        - STATUS_TEMP (0x04)
    - Receive:
        - ![](./read(temp).png)
        - STATUS_BASE (0x00)
        - Temp (number before decimal)
        - Temp (number after decimal)
        - Format (unsigned int)

**Q8: Do you think the communications could be easily spoofed? Why or why not?**
- The code would be incredibly easy to spoof. It is easy to capture and analyze the communication. It's simple hexadecimal code that doesn't seem to be encrypted. 

**Q9: Is there anything else you learned about the protocol while doing research?**

