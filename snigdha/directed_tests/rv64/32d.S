//**************************************************************************************** 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan 
//   Item : 32d_instruction 
//   Date created : 13/11/2025 
//***********************************************************************************
//   Description: Testcase says 
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32UF
RVTEST_CODE_BEGIN

start:
	la	x5,	dta

test1:
	fld	f6,	0(x5)
	fsd	f6,	8(x5)

test2:
	li	x5,	5
	li	x6,	10
	li	x7,	15
	li	x8,	25
	li	x9,	-30

test3:
	fmv.w.x		f1,	x5
	fmv.w.x		f2,	x6
	fmv.w.x		f3,	x7

	fmv.x.w		x22,f3

test4:
	fcvt.d.w	f1,	x6
	fcvt.d.w	f2,	x5
	fcvt.d.w	f3,	x7
	fcvt.d.w	f12,x8
	fcvt.d.w	f15,x9
	fcvt.d.wu	f20,x8

	fcvt.w.d	x20,f12
	fcvt.wu.d	x21,f12

test5:
	fmadd.d		f5,	f3,	f2,	f1
	fmsub.d		f6,	f3,	f2,	f1
	fnmsub.d	f4,	f1,	f2,	f3
	fnmadd.d	f7,	f1,	f2,	f3
	fadd.d		f8,	f3,	f2	
	fsub.d		f9,	f1,	f2
	fmul.d		f10,f2,	f3	
	fdiv.d		f11,f3,	f1
	fsqrt.d		f13,f12

test6:
	fsgnj.d		f14, f12, f15		 
	fsgnjn.d	f16, f12, f15 
	fsgnjx.d	f17, f12, f15
	fmax.d 		f18, f12, f15
	fmin.d 		f19, f12, f15
	feq.d		x23, f12, f15
	flt.d		x24, f12, f15
	fle.d		x25, f12, f15
	fclass.d	x26, f12

test7:
	fcvt.l.d	x5,	f1
	fcvt.lu.d	x5,	f2
	fmv.x.d		x3,f5
	fcvt.d.l	f3,	x6	
	fcvt.d.lu	f3,	x6
	fmv.d.x		f5,	x3

	TEST_PASSFAIL
RVTEST_CODE_END

	.data
RVTEST_DATA_BEGIN
	TEST_DATA
dta:
	.word 0x06627912
RVTEST_DATA_END
