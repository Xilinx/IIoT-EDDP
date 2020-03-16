Offset | Access | Description
-------+--------+-------------
+0x00  |  R/W   | Control reg 
	bit 0 - Transfer start (write 1 after 0)
	bit 1 - Data hold
+0x04  |  R/W   | Transfer size register
+0x08  |  R     | Transfers count registers
+0x0C  |  R/W   | Start address register
+0x10  |  R     | Last address register
+0x14  |  R/W   | Pretrigger register
+0x18  |  R     | Datamover status register
+0x1C  |  R/W   | 