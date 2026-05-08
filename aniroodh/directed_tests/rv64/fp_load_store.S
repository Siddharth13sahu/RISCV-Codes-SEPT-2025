//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item :	fp_store

//   Date created : 24/02/2026

//***********************************************************************************
//   Description: Storing the floating point value after performing operations
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

	li	gp,	3
	
//Addresses for test data
	la	x5,	val1 
	la	x6,	val2
	la	x7,	val3
	la	x28,	val4
	la	x29,	val5
	la	x30,	val6
	
	li	x8,	0x80002500

	flw	f0,	0(x5)
	flw	f1,	0(x6)
	fld	f2,	0(x7)
	fld	f3,	0(x28)
	flw	f4,	0(x29)
	flw	f5,	0(x30)

flw_test:
	add_single_double:
	fadd.s	f28,	f0,	f1
	fcvt.w.s	x10,	f28
	sw	x10,	0(x8)
	fadd.d	f28,	f2,	f3
	fcvt.w.d	x10,	f28
	sd	x10,	8(x8)
	
	sub_single_double:
	fsub.s	f28,	f0,	f1
	fcvt.w.s	x10,	f28
	sw	x10,	16(x8)
	fsub.d	f28,	f2,	f3
	fcvt.w.d	x10,	f28
	sd	x10,	24(x8)

	mul_single_double:
	fmul.s	f28,	f0,	f1
	fcvt.w.s	x10,	f28
	sw	x10,	32(x8)
	fmul.d	f28,	f2,	f3
	fcvt.w.d	x10,	f28
	sd	x10,	40(x8)
	
	div_single_double:
	fdiv.s	f28,	f0,	f1
	fcvt.w.s	x10,	f28
	sw	x10,	48(x8)
	fdiv.d	f28,	f2,	f3
	fcvt.w.d	x10,	f28
	sd	x10,	56(x8)


TEST_PASSFAIL

RVTEST_CODE_END

.data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:
  val1:	.float	496.59	//f0
  val2:	.float	273.372	//f1
  val3:	.double	751.61	//f2
  val4:	.double	-236.65	//f3
  val5:	.float	806.546	//f4
  val6:	.float	0.00		//f5
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

inp_float:
  .float 2.5
  .float 3.5
  .float 4.5
  .float 5.5

RVTEST_DATA_END


