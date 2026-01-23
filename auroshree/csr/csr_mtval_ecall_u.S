

//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Auroshree Anuvab Raj 
//   Item : CSR Read
//   Date created : 11/07/2025
//***********************************************************************************
//   Description: The following testcase is about generating a ecall trap in u mode and handling in m mode and observing the value of mtval 
//***********************************************************************************


#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV64MF
RVTEST_CODE_BEGIN
 
start:


//install m trap handler
la		x5,	m_trap_handle
csrw	mtvec,	x5

//mode m->s
csrr	x6,	mstatus
li		x7,	~(3<<11)
and	x6,	x6,	x7		//mpp=u
csrw	mstatus,		x6

la		x8,	user_entry
csrw	mepc,	x8
mret

user_entry:
addi 	x12,	x12,	1
ecall

//if ecall fails
u_after:
j 		u_after


m_trap_handle:
csrr	x5,	mcause
csrr	x6,	mepc
csrr	x7,	mtval
li		x8,	0x8
beq	x8,	x5,	continue
ecall

continue:
addi	x6,	x6,	4
csrw	mepc,	x6
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

