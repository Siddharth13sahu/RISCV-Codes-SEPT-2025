//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Auroshree Anuvab Raj
 
//   Item : rv32c and rv64c- compressed instruction
 
//   Date created : 11/20/2025
 
//***********************************************************************************
//   Description: all rv32c and rv64c compressed instruction
//***********************************************************************************
 
 
#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV64MF
RVTEST_CODE_BEGIN
  li gp, 3
 
 
start:
//the testintention isto sub,addimmediate with a negative number

Test1:
	li			x6,	119
	mv			x5,	x6

	li			x7,	-24
	sext.w	x6,	x7
 	
	neg		x8,	x5
	negw		x9,	x5
 
Test2:	// seqz (set if equal to zero)  snez (set if not equal to zero)	sltz (set if less than zero)	sgtz (set if greater than zero)
	li		x5,	0
	seqz	x6,	x5

	addi	x5,	x0,	1
	snez	x7,	x5
	
	addi	x5,	x0,	-4
	sltz	x8,	x5
 	
	addi	x5,	x5,	8
	sgtz	x9,	x5
 
Test3:	//beqz (branch if equal to zero)	bnez (branch if not equal to zero)	blez (branch if less than or equal to zero)	bgez	bltz (branch if less than zero)	bgtz	bgt (branch greater than)	ble (branch if less than or equal)	bgtu	bleu 
	li		x5,	0
	beqz	x5,	label10
	li		x6,	12
label10:
	addi	x6,	x0,	11

	bnez	x6,	label9
	addi	x7,	x0,	32
label9:
	addi	x7,	x0,	0

	blez	x7,	label8
	addi	x8,	x0,	2
label8:	
	addi	x8,	x0,	0

	bgez	x9,	label7
	addi	x10,	x0,	3
label7:
	addi	x11,	x0,	-5

	bltz	x11,	label6
	addi	x12,	x0,	-24
label6:
	addi	x12,	x0,	24

	bgtz	x12,	label5
	addi	x13,	x0,	10
label5:
	addi	x13,	x0,	9

	bgt	x12,	x13,	label4
	addi	x14,	x0,	22
label4:
	addi	x14,	x0,	24

	ble	x14,	x12,	label3
	addi	x15,	x0,	10
label3:
	addi 	x15,	x0,	-2

	bgtu	x15,	x14,	label2
	addi	x16,	x0,	21
label2:
	addi	x16,	x0,	-8

	bleu	x16,	x15,	label1
	addi	x28,	x0,	26
label1:
	addi	x28,	x0,	1


Test4:	//fmv.s	fabs.s	fneg.s	fmv.d	fabs.d	fneg.d
 
 
 
 
 
 
 
 
 TEST_PASSFAIL
RVTEST_CODE_END
  .data
RVTEST_DATA_BEGIN
  
  TEST_DATA
 
inp_data:
  .word 0xDEADBEEF
  .word 0x06627912
  .word 0xabcd1234
  .word 0x584944fc
  .word 0x584944fc
  .word 0x558f5366
  .word 0x558f5366
  .word 0x29df2fb1
  .word 0x29df2fb1
  .word 0x40053e92
  .word 0x40053e92
  .word 0x99999999
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


