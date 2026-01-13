//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item : atomic_lr.w_sc.w_instruction

//   Date created : 11/07/2025

//***********************************************************************************
//   Description: atomic load store instruction 
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

	li 	gp, 	3

start:


Test1:									//lr_sc
	la		x5,	inp_data
	addi	x6,	x0,	1
	LABEL:
		lr.d	x7,	(x5)
		add	x7,	x7,	x6
		sc.d 	x11,	x7,	(x5)
		bnez	x11,	LABEL

Test2:									//amoswap
	amoswap.d	x8,	x6,	(x5)
	addi			x6,	x6,	0

Test3:									//amoadd
	amoadd.d		x9,	x6,	(x5)

Test4:									//amoxor
	amoxor.d		x18,	x6,	(x5)

Test5:									//amoand
	amoand.d		x19,	x6,	(x5)

Test6:									//amoor
	amoor.d		x20,	x6,	(x5)
	amoswap.d	x28,	x8,	(x5)

Test7:									//amomin
	amomin.d		x21,	x6,	(x5)	

Test8:									//amomin
	amominu.d	x22,	x6,	(x5)
	amoswap.d	x29,	x21,	(x5)

Test9:									//amomin
	amomax.d		x23,	x6,	(x5)
	amoswap.d	x30,	x8,	(x5)

Test10:									//amomin
	amomaxu.d	x24,	x6,	(x5)


  TEST_PASSFAIL

RVTEST_CODE_END
  .data

RVTEST_DATA_BEGIN
  
  TEST_DATA

inp_data:

  .dword 0xABCD1234ABCD1234

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



