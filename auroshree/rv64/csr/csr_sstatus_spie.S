

//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Auroshree Anuvab Raj 
//   Item : CSR Read
//   Date created : 11/07/2025
//***********************************************************************************
//   Description: The following testcase is about observing the changing value of sstatus.spie by generating a timer interrupt in s mode and handling it in s mode
//***********************************************************************************



#include "test_macros.h"
#include "riscv_test.h"

.equ MTIME,     0x0200BFF8
.equ MTIMECMP,  0x02004000

RVTEST_RV64MF
RVTEST_CODE_BEGIN
 
start:
//delegate interrupt
li		x7,	(1<<5)		//supervisor time interrupt=5
csrw	mideleg,	x7
csrr	x7,	mideleg

//set up mtvec
la		x5,		trap_handler
csrw	mtvec,	x5
la		x5,		s_trap_handler
csrw	stvec,	x5

//mode change
li		x9,	(5<<5)
csrw	mie,	x9
csrr	x6,	mstatus
li		x7,	~(3<<11)
and	x6,	x6,	x7
li		x7,	(1<<11)
or	x6,	x6,	x7
csrw	mstatus,		x6

la		x8,	supervisor
csrw	mepc,	x8
mret

supervisor:
//enable machine timer
li		x6,	(1<<5)	//stie
csrw	sie,	x6

//enable global interrupt
csrr	x6,	sstatus
ori	x6,	x6,	(1<<1) 	//sie bit is enabled
csrw	sstatus,		x6

//program timer(mtimecmp)
li		x7,		MTIME
ld		x8,		0(x7)		//x8=current time
li		x9,		100
add	x8,	x8,	x9		//x8=time when interrupt happens
li		x7,	MTIMECMP		
sd		x8,	0(x7)

wait_loop:
csrr	x6,	sstatus
csrr	x7,	sie
wfi
addi	x18,	x18,	1		
j	wait_loop

s_trap_handler:
csrr	x6,	scause
bgez	x6,	s_handle_except	//msb=0--->exception

handle_interrupt:
li		x7,	5	
andi	x8,	x6,	0xff 			
beq	x8,	x7,	timer_interrupt
j	trap_exit

timer_interrupt:
csrr	x10,	scause	
csrr	x11,	sstatus				//check the sie bit
andi	x12,	x11,	(1<<5)      //masking off
bnez	x12,	continue
ecall

continue:
li		x7,	MTIME
ld		x8,	0(x7)
li		x9,	100
add	x8,	x8,	x9
li		x7,	MTIMECMP
sd		x8,	0(x7)
j	trap_exit

s_handle_except:
j	s_handle_except

trap_handler:
j	trap_handler

trap_exit:
sret


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


