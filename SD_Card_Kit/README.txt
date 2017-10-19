Introduction
------------

A small demo for the EDDP Kit, that permits rotating the motor in either direction.

See the following link for more information about EDDP:
http://trenz.org/EDDP


Requirements
------------
An assembled EDDP Kit is required to run the demo, in particular, the following:
1. Arty Z7 10 as the Controller board.
2. TEC0053 with the TEC0060, reference motor and reference load.


Instructions
------------

1. Copy the files to an SD card, pop the card into the Arty Z7 10 board.
2. Make sure that the jumper J4 is in the position "SD" in order for the Arty Z7 to boot from the SD card.
3. Check that the jumper JP5 matches the power source.
4. Power up the assembled EDDP Kit


The buttons on the Arty Z7 10 board have the following functions:
Button  | Function
--------+---------------------------
BTN3    | Search for the location of the 0 position of the encoder
BTN2    | Rotate motor counter-clockwise at 3000 RPM
BTN1    | Rotate motor clockwise at 3000 RPM


The USB UART port (next to the Ethernet connector) of the Arty Z7 10 functions
as a virtual serial port at the baud rate of 115200. A terminal program can be
used to observe the status messages of the following:
* Operating mode
* Actual speed of the rotor, in RPM
* The stator current, in mA.
