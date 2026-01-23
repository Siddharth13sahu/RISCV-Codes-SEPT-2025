//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Auroshree Anuvab Raj 
//   Item : CSR Read
//   Date created : 11/07/2025
//***********************************************************************************
//   Description: The following testcase is about generating a timer interrupt and handle it in m mode and then observe the value change in mcause
//***********************************************************************************


#include "test_macros.h"
#include "riscv_test.h"

.equ MTIME,     0x0200BFF8
.equ MTIMECMP,  0x02004000

RVTEST_RV64MF
RVTEST_CODE_BEGIN
 
start:

//set up mtvec
la		x5,		trap_handler
csrw	mtvec,	x5

//check the initial value of mcause
csrr	x6,	mcause

//enable machine timer
li		x6,	(1<<7)
csrw	mie,	x6

//enable global interrupt
csrr	x6,	mstatus
ori	x6,	x6,	(1<<3) 	//mie field
csrw	mstatus,		x6

//program timer(mtimecmp)
li		x7,		MTIME
ld		x8,		0(x7)		//x8=current time
li		x9,		100
add	x8,	x8,	x9		//x8=time when interrupt happens
li		x7,	MTIMECMP		
sd		x8,	0(x7)

wait_loop:
wfi
addi	x18,	x18,	1		//interrupt counter
j	wait_loop

trap_handler:
csrr	x6,	mcause
li		x7,	0x1000000000000007
bne	x6,	x7,	handle_except

handle_interrupt:
li		x7,	7	//mti status
andi	x8,	x6,	0xff 			//masking off lower 8 bits to get only value 7 for comparison
beq	x8,	x7,	timer_interrupt
j	trap_exit

timer_interrupt:
li		x7,	MTIME
ld		x8,	0(x7)
li		x9,	100
add	x8,	x8,	x9
li		x7,	MTIMECMP
sd		x8,	0(x7)
j	trap_exit

handle_except:
j	handle_except

trap_exit:
mret


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

