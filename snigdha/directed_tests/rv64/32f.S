//**************************************************************************************** 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan 
//   Item : 32f_instruction 
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
	flw	f6,	0(x5)
	fsw	f6,	8(x5)

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
	fcvt.s.w	f1,	x6
	fcvt.s.w	f2,	x5
	fcvt.s.w	f3,	x7
	fcvt.s.w	f12,x8
	fcvt.s.w	f15,x9
	fcvt.s.wu	f20,x8

	fcvt.w.s	x20,f12
	fcvt.wu.s	x21,f12

test5:
	fmadd.s		f5,	f3,	f2,	f1
	fmsub.s		f6,	f3,	f2,	f1
	fnmsub.s	f4,	f1,	f2,	f3
	fnmadd.s	f7,	f1,	f2,	f3
	fadd.s		f8,	f3,	f2	
	fsub.s		f9,	f1,	f2
	fmul.s		f10,f2,	f3	
	fdiv.s		f11,f3,	f1
	fsqrt.s		f13,f12

test6:
	fsgnj.s		f14, f12, f15		 
	fsgnjn.s	f16, f12, f15 
	fsgnjx.s	f17, f12, f15
	fmax.s 		f18, f12, f15
	fmin.s 		f19, f12, f15
	feq.s		x23, f12, f15
	flt.s		x24, f12, f15
	fle.s		x25, f12, f15
	fclass.s	x26, f12

test7:
	fcvt.l.s	x5,	f1
	fcvt.lu.s	x5,	f2
	fcvt.s.l	f3,	x6	
	fcvt.s.lu	f3,	x6



	TEST_PASSFAIL
RVTEST_CODE_END

	.data
RVTEST_DATA_BEGIN
	TEST_DATA
dta:
	.word	0x06627912
RVTEST_DATA_END
