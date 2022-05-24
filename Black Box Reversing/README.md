## Karson Mahan
# HRE Project 1 - Black Box Reversing 
# HRE S20
------------------------------------------------
## Collaboration
Oren Hills  
Matthew Ray

## Summary
The purpose of this lab was to simulate a "black box" reversing project. The project was designed to test the knowledge gained throughout the HRE course thus far.

## Components
**Full board**
![](imgs/fullboard.png)

**Counters/Dividers**
![](imgs/Counter.png)

**Timer**
![](imgs/Timer.png)

**1-to-4 selectors/multiplexers**
![](imgs/1to4.png)

**NAND**
![](imgs/NAND.png)

**OR**
![](imgs/OR.png)

**NOR**
![](imgs/NOR.png)

**AND**
![](imgs/AND.png)

**Transistors**
![](imgs/transistors.png)


## Traces
**LED 1**
![](imgs/led1.png)

![](imgs/trace1.png)

**LED 2**
![](imgs/led2.png)

![](imgs/trace2.png)

**LED 3**
![](imgs/led3.png)

![](imgs/trace3.png)

**LED 4**
![](imgs/led4.png)

![](imgs/trace4.png)

**LED 5**
![](imgs/led5.png)

![](imgs/trace5.png)

**LED 6**
![](imgs/led6.png)

![](imgs/trace6.png)

LED 6 uses a dual 1-to-4 data selectors/multiplexers. This chip contains inverters and drivers to supply full binary decoding data selection to the AND-OR gates. 
The 3-state outputs can interface with and drive data lines of bus-organized systems. With all but one of the common outputs disabled (at a high-impedance state), the low impedance of the single enabled output will drive the bus line to a high or low logic level.

**LED 7**
![](imgs/led7.png)

![](imgs/trace7.png)

**LED 8**
![](imgs/led8.png)

![](imgs/trace8.png)

## Truth Tables
![](imgs/truth1.png)

![](imgs/truth2.png)

![](imgs/truth3.png)

![](imgs/truth4.png)

![](imgs/truth5.png)

![](imgs/truth6.png)

![](imgs/truth7.png)

![](imgs/truth8.png)

![](imgs/seg7truth.png)

## LED Logic
- LED 1 : A + D  
- LED 2 : B * D
- LED 3 : !A * !C
- LED 4 : !B * !C
- LED 5 : C + !A * D + !B * D
- LED 6 : !A * !B + !A * D + !B * C
- LED 7 : A * B + !A + !B
- LED 8 : !btn2 + !C + !D
- Segment Display :  
    - Turn On : D
    - Reset Count : btn3
    - Stop Count : B


## Conclusion
Tracing is difficult, but it was very fun to try. 
Learning about the black box was very interesting and fun 
