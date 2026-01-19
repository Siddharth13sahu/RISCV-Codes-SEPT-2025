//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Aniroodh Patnaik 
//   Item : test_mideleg_smode_soft
//   Date created : 11/07/2025
//***********************************************************************************
//   Description: 
//***********************************************************************************


#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV64MF
RVTEST_CODE_BEGIN

code_start:
	
	trap_handler_ini:
	
	la		x5,	m_trap
	csrw	mtvec,	x5

	la		x5,	s_trap
	csrw	stvec,	x5

	set_software_interrupt:
	li		x5,	0
	li		x5,	(1<<1)
	csrw	mideleg,	x5

	enanle_interrupt:
	li		x5,	0
	li		x5,	(1<<1)
	csrw	sie,	x5

	enable_gobal_interrupt:
	csrr	x6,	sstatus			//set sie in sstatus
	ori	x6,	x6,	(1<<1)
	csrw	sstatus,		x6
	
	csrr	x5,	mstatus
	li		x6,	~(3<<11)
	and	x5,	x5,	x6			//clear MPP
	li		x6,	(1<<11)			//MPP set to S mode
	or		x5,	x5,	x6
	csrw	mstatus,		x5
	
	la		x5,	s_intrp
	csrw	mepc,	x5
	mret

	s_intrp:
	li		x5,	(1<<1)
	csrs	sip,	x5					//set SSIP

	wait:
	wfi
	j		wait


	s_trap:
	csrr	x5,	scause
	csrr	x6,	sepc

	li		x7,	(1<<1)
	csrc	sip,	x7

	addi	x6,	x6,	4
	csrw	sepc,	x6
	sret

	m_trap:
	j		m_trap

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

