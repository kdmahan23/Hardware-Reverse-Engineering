
import spidev
import time
import sys
import argparse

def fun1():

        spi = spidev.SpiDev()
        #Connects to the specified SPI device 
        spi.open(0, 0) #open(bus,device)

        try:
                #create an empty list named 'arr'
                arr = []

                #creates a list of size 2050
                for d in range(2050):
                        #adds hex value to end of list
                        arr.append(0x00)

                #8-bit READ instruction
                arr[0] = 0x03 

                #16-bit address
                arr[1] = 0x00
                arr[2] = 0x00

                #sets out equal to the values recieved from the SPI device
                out = spi.xfer2(arr)

                #Disconnects from the SPI device.
                spi.close()

                #creates empty list called 'cArr'
                cArr = []

                for d in range(3, 2050):
                        #adds the value of out[d] to end of cArr
                        cArr.append(out[d])

                #changes the values of cArr to bytes and 
                Arr = bytes(cArr)

                #Open file named 'file.bin' for writing in binary 
                file = open("file.bin", "wb")

                try:
                        #writes Arr to the open file
                        file.write(Arr)
                finally:
                        #closes file
                        file.close()

        except KeyboardInterrupt:
                #Disconnects from the SPI device.
                spi.close()

        return

def fun2(value):

        spi = spidev.SpiDev()

        #Connects to the specified SPI device 
        spi.open(0, 0)#open(bus,device)

        try:
                #WREN instruction 
                val1 = [0x06]

                #WRSR instruction
                val2 = [0x01, value] #writes value to status register

                #RDSR
                val3 = [0x05, 0x00] #reads status register at the address 0x00

                spi.writebytes(val1)

                spi.writebytes(val2)
                time.sleep(2)

                out = spi.xfer2(val3)

                #Disconnects from the SPI device
                spi.close()

                #prints 
                print(out)

        except KeyboardInterrupt:
                #Disconnects from the SPI device
                spi.close()

        return

def fun3():

        spi = spidev.SpiDev()

        #Connects to the specified SPI device 
        spi.open(0, 0)#open(bus,device)

        try:
                val1 = [0x05, 0x00]

                #Set 'out' equal
                out = spi.xfer2(val1)

                #Disconnects from the SPI device.
                spi.close()

                print(out)

        except KeyboardInterrupt:
                #Disconnects from the SPI device.
                spi.close()

        return

def main():

        parser = argparse.ArgumentParser("sci_com")
        parser.add_argument("-f2", help = "Writes value to Status Register and then checks to see if value was successfully wriiten", nargs = 1, type = int)
        parser.add_argument("-f3", help = "Prints contents of Status Register", action="store_true")
        parser.add_argument("-f1", help = "Reads entire memory and prints binary to file", action="store_true")
        args = parser.parse_args()

        if args.f1:
                print ("Running this")
                fun1()

        elif args.f3:
                print ("Running that")
                fun3()

        elif args.f2:
                print ("Running yes", args.f2[0])
                input = args.f2[0]
                fun2(input)

        else:
                print("Invalid input, check -h")

        return

main()