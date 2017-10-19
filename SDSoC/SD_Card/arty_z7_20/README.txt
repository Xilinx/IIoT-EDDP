Platform: arty_z7_20_foc
Application: B:/SVN/cores/2017.1/design/TEC0053/workspace_sdx/arty_z7_20/Debug/_sds/swstubs/arty_z7_20.elf


Instructions for ARTY Z7:

1. Copy the contents of this directory to an SD card
2. Modify init.sh and focserver.conf to suit your needs.
   The FOC server will start automatically if there is no init.sh.
3. Power up the Arty Z7 10 board and note the IP address (either DHCP logs or
   serial console). If there are no DHCP server answering, default of
   192.168.42.123 will be used after 10 second timeout.
4. Point a web browser to the IP address of the board. A FOC control panel appears.
5. Click button "Motor" to start the motor.
6. To enable live charts, enable checkbox "Live charts". 
