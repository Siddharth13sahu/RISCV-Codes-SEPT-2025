//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Aniroodh Patnaik 
//   Item : CSR Read
//   Date created : 11/07/2025
//***********************************************************************************
//   Description: Testcase says floating point instructions based on RV32F ISA
//***********************************************************************************
 
 
#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV64MF
RVTEST_CODE_BEGIN

start:
	la		x5,	m_trap
	csrw	mtvec,	x5

Test1:
	
	csrw	mie,	x0
	csrr	x5,	mie
	bnez	x5,	fail

	li		x6,	(1<<7)		//MTIE
	csrw 	mie,	x6
	csrr	x5,	mie
	bne	x5,	x6,	fail

	//enable gobll interrupts
	csrr	x5,	mstatus
	ori	x5,	x5,	(1<<3)
	csrw	mstatus,	x5
	
	//setting timer
	li		x6,	0x0200bff8      // mtime reg address
	ld		x7,	0(x6)

	li		x28,	100
	add	x7,	x7,	x28

	li		x29,	0x2004000   	//mtimecmp reg addr
	sd		x7,	0(x29)

wait:
	j		wait
 
m_trap:
	csrr	x5,	mcause

	li		x6,	0x8000000000000007
	bne	x5,	x6,	fail

test2:
	csrr	x7,	mip
	li		x28,	(1<<7)		//MTIP
	and	x7,	x7,	x28
	beqz	x7,	fail			//MTIP should be 1

	//clear MTIP by re-arming timer
	li		x29,	0x0200bff8
	ld		x30,	0(x29)
	li		x31,	100
	add	x30,	x30,	x31

	li		x29,	0x02004000
	sd		x30,	0(x29)

	//MTIP should be clear
	csrr	x7,	mip
	and	x7,	x7,	x28
	bnez	x7,	fail
	
	csrr	x5,	mie
	li		x6,	~(1<<7)
	and	x5,	x5,	x7
	csrw	mie,	x5

	jal	x1,	pass

	mret




TEST_PASSFAIL
RVTEST_CODE_END
  .data
RVTEST_DATA_BEGIN
  TEST_DATA

inp_data:
  .float 100.25 //0
  .float 200.50 //4
  .dword 0x00000000 //8
  .float -200.50 //10
  .float -200.50 //10
  .dword 0xabcdef6612345678 //14
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



