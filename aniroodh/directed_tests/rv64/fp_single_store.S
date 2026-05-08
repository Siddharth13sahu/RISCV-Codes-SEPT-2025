//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item :	fp_store_single

//   Date created : 24/02/2026

//***********************************************************************************
//   Description: Storing the floating point value after performing operations,
//						then convert it to integer then store the value in memory. 
//						Looping the program for 5 times.
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

	li	gp,	3
	
//Addresses for test data
initialize:	
	la x5,	inp_data
	
	li	x8,	0x80002500
	li	x9,	0
	li	x31,	5
	
load_fp_value:
	flw	f0,	0(x5)
	flw	f1,	4(x5)
	flw	f2,	8(x5)
	flw	f3,	12(x5)
	flw	f4,	16(x5)
	flw	f5,	20(x5)

flw_test:
	add_single:
	fadd.s	f28,	f0,	f1
	fsw	f28,	0(x8)
	fcvt.w.s	x10,	f28
	sw	x10,	4(x8)
	
	sub_single:
	fsub.s	f28,	f0,	f1
	fsw	f28,	8(x8)
	fcvt.w.s	x10,	f28
	sw	x10,	12(x8)

	mul_single:
	fmul.s	f28,	f0,	f1
	fsw	f28,	16(x8)
	fcvt.w.s	x10,	f28
	sw	x10,	20(x8)

	div_single:
	fdiv.s	f28,	f0,	f1
	fsw	f28,	24(x8)
	fcvt.w.s	x10,	f28
	sw	x10,	28(x8)	

	fmv_single:
	lw	x6,	24(x5)
	fmv.w.x	f29,	x6	
	fsw	f29,	32(x8)
	fcvt.w.s	x10,	f29
	sw	x10,	36(x8)

	loop:
	addi	x9,	x9,	1
	bne	x9,	x31,	flw_test

TEST_PASSFAIL

RVTEST_CODE_END

.data

RVTEST_DATA_BEGIN
  TEST_DATA














inp_data:
  .float	496.59	//f0  0
  .float	273.372	//f1  4
  .float	68.21		//f2  8
  .float	95.64		//f3  12
  .float	806.546	//f4  16
  .float	60.00		//f5  20
  .word 0x4234eb85   // 24 
  .word 0x29df2fb1
  .word 0x558f5366
  .word 0x584944fc  
  .word 0x17010699
  .word 0x29df2fb1
  .word 0x06627912  
  .word 0x6133a31e
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

inp_float:
  .float 2.5
  .float 3.5
  .float 4.5
  .float 5.5

RVTEST_DATA_END




