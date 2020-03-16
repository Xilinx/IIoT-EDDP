#!/bin/sh

# This is to be used only during debugging


start()
{
	# Set Flux Sp
	devmem 0xa0000044 32 0
	# Set Flux Kp
	devmem 0xa0000048 32 0xFFFFF000
	# Set Flux Ki
	devmem 0xa000004C 32 0
	# Set Torque Sp
	devmem 0xa0000050 32 100
	# Set Torque Kp
	devmem 0xa0000054 32 256
	# Set Torque Ki
	devmem 0xa0000058 32 0
	# Set RPM Sp
	# CCW ~3000
	devmem 0xa000005C 32 0xFFFFF448
	# CW ~3000
	#devmem 0xa000005C 32 0xFFFFF448
	# Set RPM Kp
	devmem 0xa0000060 32 100
	# Set RPM Ki
	devmem 0xa0000064 32 0xFFFFFFF6
	# Set Angle correction
	devmem 0xa0000068 32 719
	# Set Vd
	devmem 0xa000006C 32 0xFFFFE300
	# Set Vq
	devmem 0xa0000070 32 0xFFFFC100
	# Decimate
	devmem 0xa0000074 32 0
	# Trigger
	devmem 0xa0000078 32 0
	# Monitor
	devmem 0xa000007C 32 0


	# Motor OFF
	devmem 0xa0000040 32 0
	# Start rotate to find encoder index
	devmem 0xa0000040 32 6
	sleep 1
	# Start speed loop
	devmem 0xa0000040 32 1
}

stop ()
{
	devmem 0xa0000040 32 0
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

