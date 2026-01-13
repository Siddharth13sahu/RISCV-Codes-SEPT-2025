#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

start:
   // Initialise trap handler
   la	x5,	m_trap_handler
   csrw	mtvec,	x5

   // Enable Machine Software Interrupt
   li	x6,	(1 << 3)        // MSIE bit
   csrw	mie,	x6

   // Enable global interrupts
   li	x6,	(1 << 3)        // MIE bit in mstatus
   csrw	mstatus,	x6

   // Trigger software interrupt
   li	x9,	0x02000000      // MSIP hart 0
   li	x6,	1
   sw	x6,	0(x9)           // MSIP = 1
	lw	x7,	0(x9)

//wait:
//	wfi
//	addi	x8,	x8,	1
//   j		wait                  // wait for interrupt

m_trap_handler:
   csrr	x5,	mcause
   csrr	x6,	mepc
	bgez	x5,	exception

handle_interrupt:
	li		x7,	3
	andi	x8,	x6,	0xff
	beq	x8,	x7,	soft_intrp
	j		trap_exit

soft_intrp:
	mv	x6,	x9
	li		x18,	0
	sw		x18,	0(x6)
	j		trap_exit

exception:
	j	exception

   // Clear MSIP 
   //li	x3,	0x02000000
   //sw	x0,	0(x3)

   // Skip interrupted instruction
   //addi	x6,	x6,	4
   //csrw	mepc,	x6

trap_exit:
   mret

TEST_PASSFAIL
RVTEST_CODE_END
  .data
RVTEST_DATA_BEGIN
  TEST_DATA

inp_data:
  .float 100.25						 	//0
  .float 200.50						 	//4
  .dword 0x00000000 						//8
  .float -200.50 							//10
  .float -200.50 							//10
  .dword 0xabcdef6612345678 			//14
  .word 0x584944fc
  .word 0x558f5366
  .word 0x558f5366
  .word 0x29df2fb1
  .word 0x29df2fb1
  .word 0x40053e92
  .word 0x40053e92
  .word 0x17010699
  .word 0x17010699
  .word 0x594b9169
  .word 0x594b9169
  .word 0x64cd11c7
  .word 0x64cd11c7
  .word 0x6133a31e
  .word 0x6133a31e
  .word 0x2a9e3a3d
  .word 0x2a9e3a3d
  .word 0x59f86117
  .word 0x59f86117
  .word 0x39214611
  .word 0x39214611
  .word 0x6ec633f5
  .word 0x6ec633f5
  .word 0x4910a7b3
  .word 0x4910a7b3
  .word 0x3392ec72
  .word 0x3392ec72
  .word 0x6c3af175
  .word 0x6c3af175
  .word 0x74555adb
  .word 0x74555adb
  .word 0x360a50f7
  .word 0x360a50f7
  .word 0x39febbec
  .word 0x39febbec
  .word 0x28cb8c74
  .word 0x28cb8c74
RVTEST_DATA_END

