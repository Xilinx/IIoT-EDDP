FOC SOURCE CODE
===============
Date: 6.10.2017

SUPPORT
=======
See the EDDP-EDPS Support Forum at http://trenz.org/EDDPsupport , please.

QUICKSTART
==========
Requirements:
1. TEC0053 with a motor, connected to Arty-Z7-10 or Arty-Z7-20 board.
2. Network connectivity, preferrably DHCP server.
3. Micro-USB cable and serial terminal program.
4. Web browser.

USB serial console parameters: baud rate 115200, 8 bits, no parity.

Steps to start motor:
1. Copy files from SDSoC/SD_Card/arty_z7_10 to the SD card
2. Modify init.sh and focserver.conf to suit your needs.
3. Power up the Arty Z7 10 board and note the IP address (either DHCP logs or
   serial console). If there are no DHCP server answering, default of
   192.168.42.123 will be used after 10 second timeout.
4. Point a web browser to the IP address of the board. A FOC control panel appears.
5. Click button "Motor" to start the motor.
6. To enable live charts, enable checkbox "Live charts"


DIRECTORY LISTING
=================

Directories are listed in alphabetical order.


Directory			| Description
--------------------------------|--------------------------------
doc                             | Documentation in the PDF format
focserver			| Embedded linux code, consisting of Network API, Web server and User interface
HLS/ARTY_Z7_FULL		| HLS version of the Vivado FOC project. The Petalinux project is in os/petalinux
HLS/design_hls			| FOC IP cores implemented in Vivado HLS
HLS/SD_Card/arty_z7_10		| HLS version boot files for Arty Z7 10 board
HLS/SD_Card/arty_z7_20		| HLS version boot files for Arty Z7 20 board
SDSoC/platforms/arty_z7_10_foc	| SDSoC Hardware Platform project for Arty Z7 10 board
SDSoC/platforms/arty_z7_20_foc	| SDSoC Hardware Platform project for Arty Z7 20 board
SDSoC/platforms/petalinux	| Petalinux project for the SDSoC version FOC implementation
SDSoC/SD_Card/arty_z7_10	| FOC SDSoC boot files for Arty Z7 10 board
SDSoC/SD_Card/arty_z7_20	| FOC SDSoC boot files for Arty Z7 20 board
SD_Card_Kit			| Contents of the SD card accompanying the EDDP Kit
ui				| Web user interface source code

Miscellaneous notes
===================
* Some parameters can be changed only by changing the source code for the FOC Sample Application, most notably the encoder resolution and number of poles of the motor.
* The files "BOOT.BIN" have been obtained by creating new SDSoC Projects using the sample application "foc" provided in the SDSoC Hardware Platform.
