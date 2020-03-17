FOC SOURCE CODE - Xilinx Vitis design flow Update
===============
Date: 03.16.2020  
The IIoT-EDDP Repository has been update to include new hardware support as well as Xilinx's latest design flow  
Hardware support added: Ultra96 v1 and v2  
Software support added: Xilinx Vitis https://www.xilinx.com/products/design-tools/vitis.html  

SUPPORT
=======
See the EDDP-EDPS Support Forum at http://trenz.org/EDDPsupport , please.

HARDWARE
=======
ARTY Z7 7010 Based EDDP Kit
1. EDDP Motor Control Kit with Motor & Power Supplies - https://shop.trenz-electronic.de/en/TEC0053-04-K1-EDDP-Motor-Control-Kit-with-Motor-Power-Supplies

Ultra96 Version 1 or Ultra96 Version 2 Based EDDP Kit
1.	PMOD adapter - https://shop.trenz-electronic.de/en/TEP0006-01-Ultra96-Pmod-Adapter
2.	Power stage board - https://shop.trenz-electronic.de/en/TEC0053-04-EDPS-Power-Stage
3.	BLDC Motor with mounted encoder - https://shop.trenz-electronic.de/en/28170-BLDC-Motor-with-mounted-Encoder-1000SI
4. Ultra96 V2 - https://www.avnet.com/shop/us/products/avnet-engineering-services/aes-ultra96-v2-g-3074457345638646173/  
Note: Ultra96 V1 has been discoutinued by Avnet but Vitis project for the same has been included in this repo to benefit user who own the version 1 hardware


QUICKSTART
==========
Requirements:
1. TEC0053 with a motor, connected to desired board.   
(Pmod Adapter is needed if using Ultra96v1 or Ultra96v2)
2. Network connectivity, preferrably DHCP server.
3. Micro-USB cable and serial terminal program.
4. Web browser.

USB serial console parameters: baud rate 115200, 8 bits, no parity.

Steps to start motor:
1. Copy files from Vitis/app_arty_7z_10/preBuilt_sd_card to the SD card 
2. Modify init.sh and focserver.conf to suit your needs.
3. Power up the board and note the IP address (either DHCP logs or
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
Vitis/app_arty_7z_10  | FOC Vitis boot files for Arty Z7 10 board
Vitis/arty_zy_10_foc_pkg  | Vitis Hardware Platform Project for Arty Z7 7010 (Make directory)
Vitis/app_ultra96_foc/pre-built  | FOC Vitis boot files for Ultra96v1 board
Vitis/Ultra96_foc_pkg  | Vitis Hardware Platform Project for Ultra96v1 (Make directory)
Vitis/app_ultra96v2_foc/pre-built  | FOC Vitis boot files for Ultra96v2 board
Vitis/Ultra96v2_foc_pkg  | Vitis Hardware Platform Project for Ultra96v2 (Make directory)
SD_Card_Kit			| Contents of the SD card accompanying the EDDP Kit
ui				| Web user interface source code

IMPORTANT NOTES
===============
* Some parameters can be changed only by changing the source code for the FOC Sample Application, most notably the encoder resolution and number of poles of the motor.
* The Petalinux project for the SDSoC version of the FOC implementation has to have the hardware definition file re-imported from the completed SDSoC Application Project when the hardware address for the FOC IP core changes.
* The embedded linux program "focserver" has to be modified accordingly and the Petalinux project has to be rebuilt after changing register layout in the FOC implementation.
