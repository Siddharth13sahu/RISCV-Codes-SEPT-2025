//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item : pseudo_instructions

//   Date created : 13/11/2025

//***********************************************************************************
//   Description: pseudo_instruction 
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64MF
RVTEST_CODE_BEGIN

	li 		gp, 	3

start:
initialise:
	la			x5,	val1
	la			x6,	val2
	li			x7,	0x80002070

Test1:									//la_li
	
	la			x8,	inp_data
	li			x9,	0x0000000080002050
		
Test2:									//load
	
	lb			x18,	inp_data
	lh			x19,	inp_data
	lw			x20,	inp_data
	ld			x21,	inp_data

Test3:									//store
	
	sb			x18,	0(x9)
	sh			x19,	4(x9)
	sw			x20,	8(x9)
	sd			x21,	16(x9)

Test4:									//floating load
	
	flw		f0,	0(x5)
	fld		f1,	0(x6)

Test5:									//floating store
	
	fsw		f0,	0(x7)
	fsd		f1,	8(x7)

Test6:									//move_nop
	mv			x28,	x18
	nop

Test7:
	lw			x29,	4(x8)
	not		x30,	x29

Test8:
	neg		x31,	x29
	negw		x28,	x29

Test9:
	li 		x5,	2
	sext.w	x31,	x29
	sext.w	x30,	x5

Test10:
	li 		x5,	0
	li			x6,	-23
	seqz		x31,	x29
	seqz		x28,	x5
	snez		x30,	x5
	sltz		x29,	x6
	sgtz		x31,	x28

Test11:
	la			x5,	val3
	la			x6,	val4
	flw		f3,	0(x5)
	flw		f1,	0(x6)
	fmv.s		f28,	f3
	fabs.s	f4,	f3
	fneg.s	f5,	f0
	fmv.d		f29,	f1
	fabs.d	f6,	f3	
	fneg.d	f7,	f1

Test12:
	li			x5,	0
	beqz		x5,	label10
	li			x6,	12
	label10:
	addi		x6,	x0,	11
 
	bnez		x6,	label9
	addi		x7,	x0,	32
	label9:
	addi		x7,	x0,	0
 
	blez		x7,	label8
	addi		x8,	x0,	2
	label8:	
	addi		x8,	x0,	0
 
	bgez		x9,	label7
	addi		x10,	x0,	3
	label7:
	addi		x11,	x0,	-5
 
	bltz		x11,	label6
	addi		x12,	x0,	-24
	label6:
	addi		x12,	x0,	24
 
	bgtz		x12,	label5
	addi		x13,	x0,	10
	label5:
	addi		x13,	x0,	9
 
	bgt		x12,	x13,	label4
	addi		x14,	x0,	22
	label4:
	addi		x14,	x0,	24
 
	ble		x14,	x12,	label3
	addi		x15,	x0,	10
	label3:
	addi 		x15,	x0,	-2
 
	bgtu		x15,	x14,	label2
	addi		x16,	x0,	21
	label2:
	addi		x16,	x0,	-8
 
	bleu		x16,	x15,	label1
	addi		x28,	x0,	26
	label1:
	addi		x28,	x0,	1




RVTEST_CODE_END
  .data
  val1:	.float	465.39
  val3:	.float	-637.19
  val2:	.float	965.21
  val4:	.double	264.49

RVTEST_DATA_BEGIN
  
  TEST_DATA

inp_data:

  .word 0xABCD1234

  .word 0xFFFFFFFE

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

	


