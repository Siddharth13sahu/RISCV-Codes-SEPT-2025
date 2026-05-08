//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item :	fp_store_int_load

//   Date created : 24/02/2026

//****************************************************************************************
//   Description: Storing the floating point value after performing operations, then 
//						integer loading same value into register from same address. 
//****************************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

	li	gp,	3
	
//Addresses for test data
	
	la x5,	inp_data
	
	li	x8,	0x80002500
	
	flw	f0,	0(x5)
	flw	f1,	4(x5)
	flw	f2,	8(x5)
	flw	f3,	12(x5)
	flw	f4,	16(x5)
	flw	f5,	20(x5)
	flw	f6,	24(x5)

flw_test:
	
	fp_operation:
	fadd.s	f28,	f0,	f1
	fsub.s	f29,	f2,	f3
	fdiv.s	f30,	f3,	f5
	fmul.s	f31,	f6,	f3
	

	fp_store:
	fsw	f28,	0(x8)
	fsw	f29,	4(x8)
	fsw	f30,	8(x8)
	fsw	f31,	12(x8)
	
	int_load:
	lw	x28,	0(x8)
	lw	x29,	4(x8)
	lw	x30,	8(x8)
	lw	x31,	12(x8)

TEST_PASSFAIL

RVTEST_CODE_END

.data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:
//  .float	496.59	//f0
//  .float	273.372	//f1
//  .float	68.21		//f2
//  .float	95.64		//f3
//  .float	806.546	//f4
//  .float	80.00		//f5
  .word 0x06627912
  .word 0x584944fc
  .word 0x06627912
  .word 0x584944fc
  .word 0x558f5366
  .word 0x594b9169
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




