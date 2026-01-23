//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Auroshree Anuvab Raj 
//   Item : CSR Read
//   Date created : 11/07/2025
//***********************************************************************************
//   Description: The following testcase is about observing the changing value of mstatus.mpp by changing mode from m to s then  from s to u
//***********************************************************************************



#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV64MF
RVTEST_CODE_BEGIN
 
start:

mode_m_s:
	csrr	x5,	 mstatus
	li		x6,	~(3<<11)			
	and	x5,	x5,	x6			//mpp=00(u)
	li		x6,	(1<<11)
	or		x5,	x5,	x6			//mpp=01(s)
	csrw	mstatus,		x5
	csrr	x7,	mstatus

	la		x8,	super_entry
	csrw	mepc,	x8
	mret

super_entry:
	csrr	x9,	sstatus	
	li		x6,	~(1<<8)
	and	x9,	x9,	x6
	csrw	sstatus,		x9

	la		x7,	super_entry
	csrw	sepc,	x7
	sret

super_entry:
	s_loop:
	addi	x10,	x10,	1
	j	s_loop

	
      
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

