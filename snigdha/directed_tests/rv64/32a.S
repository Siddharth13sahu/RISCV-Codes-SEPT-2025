//**************************************************************************************** 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved. 
//   Owner: Snigdharani Pradhan
//   Item : 	rv32a_instruction 
//   Date created : 13/11/2025
//***********************************************************************************
//   Description: atomic instructions of 32-bit 
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32M
RVTEST_CODE_BEGIN

start:
	la	x11,	dta
	li	x12,	10

test1: 
	lr.w	x10,	(x11)					//load_reserved
	sc.w	x13,	x12,	(x11)			//store_conditional

test2:
	amoswap.w	x10,	x12,	(x11)		//swap
	amoadd.w	x10,	x12,	(x11)		//add
	amoxor.w	x10,	x12,	(x11)		//xor
	amoand.w	x10,	x12,	(x11)		//and
	amoor.w		x10,	x12,	(x11)		//or

test3:
	amomin.w	x10,	x12,	(x11)
	amominu.w	x15,	x12,	(x11)
	amomax.w	x10,	x12,	(x11)
	amomaxu.w	x15,	x12,	(x11)


	TEST_PASSFAIL
RVTEST_CODE_END

	.data
RVTEST_DATA_BEGIN
	TEST_DATA
dta:
	.word	0x06627912
RVTEST_DATA_END


