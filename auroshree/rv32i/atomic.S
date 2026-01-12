//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Auroshree Anuvab Raj
 
//   Item : rv32a- atomic instruction
 
//   Date created : 11/12/2025
 
//***********************************************************************************
//   Description: all atomic instruction
//***********************************************************************************
 
 
#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV32M
RVTEST_CODE_BEGIN
  li gp, 3
 
 
start:
//the testintention isto sub,addimmediate with a negative number
// registers:
// x5 -> &counter (address)
// x6 -> tmp (old value)
// x7 -> success flag from sc.w
// x8 -> increment (1)


Test1:	//lr.w and sc.w
	la			x5,	inp_data
	addi		x8,	x0,	1
	retry:
		lr.w	x6,	(x5)
		add	x6,	x6,	x8
		sc.w	x7,	x6,	(x5)
		bnez	x7,	retry		
	
Test2:	//amoswap.w
	la				x5,	inp_data
	li				x6,	99
	amoswap.w	x7,	x6,	(x5)

Test3:	//amoadd.w
	la			x5,	inp_data
	li			x6,	2
	amoadd.w	x7,	x6,	(x5)

Test4:	//amoand.w amoxor.w amoor.w
	la			x5,	inp_data
	li			x6,	3
	amoxor.w	x7,	x6,	(x5)
	amoand.w	x28,	x6,	(x5)
	amoor.w	x29,	x6,	(x5)

Test5:	//amomin.w
	la			x5,	inp_data
	li			x6,	13
	amomin.w	x7,	x6,	(x5)

Test6:	//amomax.w
	la			x5,	inp_data
	li			x6,	19
	amomax.w	x7,	x6,	(x5)

Test7:	//amominu.w
	la				x5,	inp_data
	li				x6,	-1
	amominu.w	x7,	x6,	(x5)

Test8:	//amomaxu.w
	la				x5,	inp_data
	li				x6,	-99
	amomaxu.w	x7,	x6,	(x5)

  TEST_PASSFAIL
RVTEST_CODE_END
  .data
RVTEST_DATA_BEGIN
  
  TEST_DATA
 
inp_data:
  .word 0xDEADBEEF
  .word 0x06627912
  .word 0x06627912
  .word 0x584944fc
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
