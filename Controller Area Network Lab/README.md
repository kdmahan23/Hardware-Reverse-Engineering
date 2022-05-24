## Karson Mahan
# HRE Lab 3 - Virtual CAN
# HRE S20
------------------------------------------------
## Collaboration Statement

## Summary
The purpose of this lab was to introduce students to some of the basics of a Controller Area Network (CAN) interface. Students will use a virtual CAN simulator to understand how a CAN network functions and some of the challenges reverse engineering it.

### Questions/Findings
**Q1: Explain some of the ways to capture/manipulate CAN traffic with ICSim? How are they useful?**  
- candump
    - Dump CAN bus traffic
    - Can be recorded while performing actions and played back by another utility to repeat the action 
- canplayer
    - Can play back recorded bus traffic to perform actions to the car without touching the controls
- cansniffer
    - Dumps CAN bus traffic
    - User can use options to show colored output on the bytes that change inside the packets
    - Can be used to determine which ID and byte controls a particular action within the car
    - Filters are available to help a user, clean up the output to more easily see the byte that changes
- cansend
    - Sends CAN frames
    - Can be used to send a CAN frame with the information gained from the utility 'cansniffer' to perform an action without touching the controls

**Q2: In general, what are CAN identifiers used for and how does the numbering scheme work?**
- CAN identifiers are used to identify the device within the network that sent the packet, to avert packet collisions and to determine priority. 
    - The smaller the identifier, the higher the priority
    - Packet with highest priority will gain access to bus while, while all others switch to "listening" mode

**Q3: Attempt to find the identifier for one or more of the different outputs on the display. Why do you think the identifier corresponds to the output? If you can't, why not?**
- Doors : 19B
- Blinkers : 188 
- Speedometer : ?
    - I don't think I can find this one because the speedometer is always on and the dial is constantly twitching. I'm not sure if this is do to the program itself, or the machine I was running the simulation on.

**Q4: Can you transmit false data and get the output to display? If not, explain how one would go about transmitting false data to something like the speedometer?**  
- Doors : yes
    - I sent a message to change the display of the doors to show that the driver's side rear door was opened.
    - Command-line : cansend vcan0 19B#00000B0000
        - vcan0 - the CAN network
        - 19B - device identifier
        - 00000B0000 - data sent 
- You can send fake data as long as you know the CAN network, the device identifier and the byte that changes when the actions is actually performed

**Q5: Explain why reverse engineering a CAN network is difficult. How could a tool like this be improved to help reverse engineering capabilities?**  
- Reverse engineering is difficult because there is no map of the CAN system or how it is configured
- The ability to rename a specific ID to an actual name, so that a user can keep track of which IDs they have identfied and which still need to be identified

**Q6: In general, how would you evalate the security of CAN? Would you say it's secure? Why or why not?**  
- To evaluate the security, I would spend time identifing all the different device IDs and figuring out which bytes change in response to different inputs, such as unlocking/locking the car. I would then see if I could send fake messages to recieve the same response as the actual input
- CAN is secure and not secure. There is nothing to check to see if a message comes from within the network or not. However, figuring out the IDs and what the messages mean can be rather difficult to impossible

**Q7: If you were hacking a vehicle, how would you access a vehicle's CAN bus?**
- You would need to phyisically find and connect to the CAN bus

## Conclusion
I have a better understanding of the CAN network and how it could be reverse engineered. I also learned some ways that a CAN bus could be hacked.  
