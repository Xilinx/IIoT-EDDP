
#ifndef AXI_REG32_H
#define AXI_REG32_H


/****************** Include Files ********************/
#include "xil_types.h"
#include "xstatus.h"

#define RR0_OFFSET 0
#define RR1_OFFSET 4
#define RR2_OFFSET 8
#define RR3_OFFSET 12
#define RR4_OFFSET 16
#define RR5_OFFSET 20
#define RR6_OFFSET 24
#define RR7_OFFSET 28
#define RR8_OFFSET 32
#define RR9_OFFSET 36
#define RR10_OFFSET 40
#define RR11_OFFSET 44
#define RR12_OFFSET 48
#define RR13_OFFSET 52
#define RR14_OFFSET 56
#define RR15_OFFSET 60
#define WR0_OFFSET 64
#define WR1_OFFSET 68
#define WR2_OFFSET 72
#define WR3_OFFSET 76
#define WR4_OFFSET 80
#define WR5_OFFSET 84
#define WR6_OFFSET 88
#define WR7_OFFSET 92
#define WR8_OFFSET 96
#define WR9_OFFSET 100
#define WR10_OFFSET 104
#define WR11_OFFSET 108
#define WR12_OFFSET 112
#define WR13_OFFSET 116
#define WR14_OFFSET 120
#define WR15_OFFSET 124


/**************************** Type Definitions *****************************/
/**
 *
 * Write a value to a AXI_REG32 register. A 32 bit write is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is written.
 *
 * @param   BaseAddress is the base address of the AXI_REG32device.
 * @param   RegOffset is the register offset from the base to write to.
 * @param   Data is the data written to the register.
 *
 * @return  None.
 *
 * @note
 * C-style signature:
 * 	void AXI_REG32_mWriteReg(u32 BaseAddress, unsigned RegOffset, u32 Data)
 *
 */
#define AXI_REG32_mWriteReg(BaseAddress, RegOffset, Data) \
  	Xil_Out32((BaseAddress) + (RegOffset), (u32)(Data))

/**
 *
 * Read a value from a AXI_REG32 register. A 32 bit read is performed.
 * If the component is implemented in a smaller width, only the least
 * significant data is read from the register. The most significant data
 * will be read as 0.
 *
 * @param   BaseAddress is the base address of the AXI_REG32 device.
 * @param   RegOffset is the register offset from the base to write to.
 *
 * @return  Data is the data from the register.
 *
 * @note
 * C-style signature:
 * 	u32 AXI_REG32_mReadReg(u32 BaseAddress, unsigned RegOffset)
 *
 */
#define AXI_REG32_mReadReg(BaseAddress, RegOffset) \
    Xil_In32((BaseAddress) + (RegOffset))

/************************** Function Prototypes ****************************/
/**
 *
 * Run a self-test on the driver/device. Note this may be a destructive test if
 * resets of the device are performed.
 *
 * If the hardware system is not built correctly, this function may never
 * return to the caller.
 *
 * @param   baseaddr_p is the base address of the AXI_REG32 instance to be worked on.
 *
 * @return
 *
 *    - XST_SUCCESS   if all self-test code passed
 *    - XST_FAILURE   if any self-test code failed
 *
 * @note    Caching must be turned off for this function to work.
 * @note    Self test may fail if data memory and device are not on the same bus.
 *
 */
XStatus AXI_REG32_Reg_SelfTest(void * baseaddr_p);

#endif // AXI_REG32_H
