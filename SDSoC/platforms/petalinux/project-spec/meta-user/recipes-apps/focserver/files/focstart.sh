#!/bin/sh

# This is to be used only during debugging

start()
{
	# Set Flux Sp
	devmem 0x43c00044 32 0
	# Set Flux Kp
	devmem 0x43c00048 32 0xFFFFF000
	# Set Flux Ki
	devmem 0x43c0004C 32 0
	# Set Torque Sp
	devmem 0x43c00050 32 100
	# Set Torque Kp
	devmem 0x43c00054 32 256
	# Set Torque Ki
	devmem 0x43c00058 32 0
	# Set RPM Sp
	# CCW ~3000
	devmem 0x43c0005C 32 0xFFFFF448
	# CW ~3000
	#devmem 0x43c0005C 32 0xFFFFF448
	# Set RPM Kp
	devmem 0x43c00060 32 100
	# Set RPM Ki
	devmem 0x43c00064 32 0xFFFFFFF6
	# Set Angle correction
	devmem 0x43c00068 32 719
	# Set Vd
	devmem 0x43c0006C 32 0xFFFFE300
	# Set Vq
	devmem 0x43c00070 32 0xFFFFC100
	# Decimate
	devmem 0x43c00074 32 0
	# Trigger
	devmem 0x43c00078 32 0
	# Monitor
	devmem 0x43c0007C 32 0


	# Motor OFF
	devmem 0x43c00040 32 0
	# Start rotate to find encoder index
	devmem 0x43c00040 32 6
	sleep 1
	# Start speed loop
	devmem 0x43c00040 32 1
}

stop ()
{
	devmem 0x43c00040 32 0
}

restart ()
{
	stop
	sleep 2
	start
}


case "$1" in
	start)
		start; ;;
	stop)
		stop; ;;
	restart)
		restart; ;;
	*)
		echo "Usage: $0 {start|stop|restart}"
		exit 1
esac
exit $?

