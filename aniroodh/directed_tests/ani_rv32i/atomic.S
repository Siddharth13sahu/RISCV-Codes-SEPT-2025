//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item : atomic__instruction

//   Date created : 11/07/2025

//***********************************************************************************
//   Description: atomic load store instruction 
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32M
RVTEST_CODE_BEGIN

	li 	gp, 	3

start:


Test1:								//lr_sc
	la		x5,	inp_data
	addi	x6,	x0,	1
	LABEL:
		lr.w	x7,	(x5)
		add	x7,	x7,	x6
		sc.w 	x11,	x7,	(x5)
		bnez	x11,	LABEL

Test2:								//amoswap
	amoswap.w	x8,	x6,	(x5)
	addi			x6,	x6,	0

Test3:								//amoadd
	amoadd.w		x9,	x6,	(x5)

Test4:								//amoxor
	amoxor.w		x18,	x6,	(x5)

Test5:								//amoand
	amoand.w		x19,	x6,	(x5)

Test6:								//amoor
	amoor.w		x20,	x6,	(x5)
	amoswap.w	x28,	x8,	(x5)

Test7:								//amomin
	amomin.w		x21,	x6,	(x5)	

Test8:								//amomin
	amominu.w	x22,	x6,	(x5)
	amoswap.w	x29,	x21,	(x5)

Test9:								//amomin
	amomax.w		x23,	x6,	(x5)
	amoswap.w	x30,	x8,	(x5)

Test10:								//amomin
	amomaxu.w	x24,	x6,	(x5)


  TEST_PASSFAIL

RVTEST_CODE_END
  .data

RVTEST_DATA_BEGIN
  
  TEST_DATA

inp_data:

  .word 0xABCD1234

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


