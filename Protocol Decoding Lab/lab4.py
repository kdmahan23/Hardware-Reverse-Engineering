# Kayla Mahan
# SRE Lab 4

#!/usr/bin/env python3
from random import randint


code = input("Please enter in 0x0F for moisture reading or 0x00 for temperature reading: ")
print("You entered in " + code)

if code != "0x0F" and code != "0x00":
    print("Code entered is not valid.")
elif code == "0x0F":
    print("Moisture:", randint(200,2000),"%")
elif code == "0x00":
    print("Temperature:", randint(20,30),".",randint(100,200))
