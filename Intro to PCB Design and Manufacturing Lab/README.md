## Karson Mahan
# HRE Lab 2 - Intro to PCB Design and Manufacturing
# HRE S20
------------------------------------------------
## Collaboration Statement
Heather Snellen

## Summary
The purpose of this lab was to introduce students to the printed circuit board (PCB) design and manufacturing processes.

### Part 1 - PCB Manufacturing

**Three types of PCB manufacturing?**
- Etching  
    - Etching is a "subtractive" method used for the production of printed circuit boards: acid is used to removed unwanted copper from a prefabricated laminate. 

    - Advantages:
        - Etching is inexpensive production process. This allows an individual to etch by themselves, whether at home or in a lab. 
        - Etching is ideal for individuals who have small at home workshop where they produce a very small number of boards.
    - Disadvantages:
        - The first and major disadvantage of etching is the high risk of injury due to chemicals that are used to produce the boards.
        - The next disadvantage is that this process is very complicated, it is a trial and error process. This can be compensated with good machinery as an alternative to doing it by hand, but still requires a lot of practice. 
        - Another disadvantage of etching is the careful disposal of the chemical waste used with the process. 

- Milling  
    - Milling is the construction of PCB circuit board via an aluminum based machine that handles an array of materials given the right spindle to create circuit boards. 

    - Advantages:
        - Quick and simple process with the right machine. This allows anyone to produce a board without constant practice or chemical harm. 
    - Disadvantages:
        - The cost of the machinery that is used for the milling process. Some examples of these machines are the CNC 3020 or the CNC 6040. These machine provide a 30cm by 20cm work area and cost around $300 to $400. This creates a high start up cost for individuals whether they are professionals of hobbyists. 

- Printing
    - Printing circuit boards consist of the use of a 3D printer to create the desired design. this is done by forming lines of conductive material on a non-conductive board. 

    - Advantages:
        - 3D printing a circuit board is a very easy way to create boards that are 99 percent free of human error. 
        - 3D printing allows for greater flexibility in the design process and much faster production of custom test boards. 
        - 3D printing can allow for boards and circuitry with complex shapes that can, for example, more easily fit in specific casings or integrated into larger systems. 
    - Disadvantages:
        - The main disadvantage of printing is that it is very pricy software and equipment needed for this process. 
        - The other disadvantage is the knowledge base of the individual who wants to produce these types of boards.

**Conductive Ink**
- Briefly explain the difference between the conductive ink that Voltera uses and the one discussed in class. Which one do you think is better for making circuits?
    - Voltera uses ink that can conduct and insulate electricity, this differs from conductive ink because it can only be used to conduct the electricity. This is useful with two layer circuit boards because they are able to create bridges on top of existing traces. Conductive ink differs in not only it's composition but also it versatility. Conductive ink as its name implies conducts electricity for a circuit board. This ink can be composed of three different metals such as copper, silver or gold. This conductive ink is more versatile that the Voltera because it can be applied after the main product has been produced. This versatility is not seen with the Voltera ink because the ink works hand in hand with the machine in order to create the proper circuit boards. This doesn't allow for Voltera to add any additional ink to a circuit board, after the initial print. In conclusion, the differences between these two products are their composition and their versatility.
    - Voltera is better suited for making circuits because of the guarantee of connection.

**Drawing wires vs. drawing solder pads**
- Voltera has separate inks for drawing wires and solder pads. Explain how these different inks are used in the different steps when making a PCB and why they have different melting points.

    - When creating a PCB you first want to print the circuit pattern onto a blank FR4 board. Voltera has 2 different kinds of conductive ink to select from, Conductor or Flex Conductor. The melting point of both inks is not determined, however the Voltera website says to solder at a temperature of 180C for the Flex Conductor. There was nothing for the regular conductive ink, but on further research I found a hand-soldering guide that says to set the soldering iron between 180C and 210C.
    
    - Next, you'll dispense solder paste onto a fabricated or V-One printed board. This paste will very from T1 to T8 depending on the board size. Generally a T4 paste is use for standard size circuit boards. This paste is design to have a more adhesive and conductive area for the circuits. Voltera's T4 solder paste has a melting point of 100C.

    - The melting points are so different because who don't want the circuit wires or pads to melt when placing components onto the board.

**What I learned**
- PCB manufacturing can be super simple or super complicated. It can be a fast process or slow process depending on level of expertise. It can be inexpensive or expensive, depending on the technique used. There are a lot of many different combinations of ways to manufacture PCB, I personally would use the printing method because of the quick and precise method to creating the boards, but also because efficiency and effectiveness of the printing process.


### Part 2 - PCB Design 

**Voltage drop and desired current**
- Voltage drop
    - ~3.4V
- Desired current
    - 25mA

**Resistor Values**
- Series
    - Ideal: 88 Ohm
    - Real: 100 Ohm
- Parallel
    - Ideal: 112 Ohm
    - Real: 120 Ohm

**Schematic**
![Schematic](./schematic.png)

**Board**
![Board](./board.png)

## Conclusion
PCB manufacturing is extremely interesting. It would be really fun to be able to play around with a Voltera printer and create my own PCB. It would have been really exciting to print and then build the board we created in this lab. 
There is a lot more to making a PCB than I originally thought.

## Resources/References
~ [Etching](https://fritzing.org/learning/tutorials/pcb-production-tutorials/diy-pcb-etching/)

~ [Milling](https://hackaday.com/2018/01/04/guide-why-etch-when-you-can-mill/)

~ [Printing](https://all3dp.com/2/pcb-3d-printer-all-about-3d-printed-circuit-boards/)

~ [Voltera vs Conductive Ink](https://www.slashgear.com/voltera-brings-the-convenience-of-printing-to-circuit-boards-12368686
)

~ [Conductive Ink](https://interestingengineering.com/what-is-conductive-ink-technology-and-how-is-it-used)

~ [MSDS](https://www.voltera.io/docs/sds/)

~ [Hand Soldering](https://www.voltera.io/docs/hand-soldering/)

~ [Printing the circuit](https://www.voltera.io/docs/hello-world/printing-the-circuit/)

~ [Dispensing solder paste](https://www.voltera.io/docs/hello-world/dispensing-solder-paste/)
