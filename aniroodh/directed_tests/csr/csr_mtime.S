//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Aniroodh Patnaik 
//   Item : CSR mtime & mtimecmp
//   Date created : 5/01/2026
//***********************************************************************************
//   Description: 
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64MF
RVTEST_CODE_BEGIN

start:
    // Install trap handler
    
    la	x5,	m_trap_handler
    csrw	mtvec,	x5

    // Enable machine timer interrupt
    csrr	x5, 	mie
    ori	x5, 	x5, (1 << 7)     //MTIE
    csrw	mie, 	x5

    // Enable global interrupts
    csrr	x5,	mstatus
    ori	x5,	x5,	(1 << 3)   //MIE
    csrw	mstatus,	x5

    // Program MTIMECMP
    li	x6,	0x0200BFF8       // MTIME
    ld	x7,	0(x6)            // current time

    li	x28, 	100              // delay
    add	x7,	x7, 	x28

    li	x29, 	0x02004000       // MTIMECMP hart 0
    sd	x7, 	0(x29)

wait:
	wfi
	j		wait                	  // wait for timer interrupt


m_trap_handler:
   csrr	x5,	mcause
   csrr	x6,	mepc

    // Check for machine timer interrupt
   li	x7,	0x8000000000000007
   bne	x5,	x7,	trap_fail

    // Re-arm timer 
	li	x28,	0x0200BFF8
   ld	x29,	0(x28)

   li	x30,	1000
   add	x29,	x29,	x30

   li	x31,	0x02004000
   sd	x29,	0(x31)
	
	la		x6,	after_time
 	csrw	mepc,	x6


   // Skip interrupted instruction
//	addi	x6,	x6,	4
//	csrw	mepc,	x6
	
	mret

after_time:
	j	after_time

trap_fail:
   j	trap_fail

TEST_PASSFAIL
RVTEST_CODE_END

.data
RVTEST_DATA_BEGIN
  TEST_DATA
 
inp_data:
  .word 0xDEADBEEF
  .word 0x12345678
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

