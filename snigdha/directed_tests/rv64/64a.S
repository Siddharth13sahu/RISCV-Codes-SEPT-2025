//**************************************************************************************** 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved. 
//   Owner: Snigdharani Pradhan
//   Item : 64a_instruction 
//   Date created : 13/11/2025
//***********************************************************************************
//   Description: atomic instructions of 64 bits  
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

start:
	la	x11,	dta
	li	x12,	10

test1: 
	lr.d	x10,	(x11)					
	sc.d	x13,	x12,	(x11)			

test2:
	amoswap.d	x10,	x12,	(x11)		
	amoadd.d	x10,	x12,	(x11)		
	amoxor.d	x10,	x12,	(x11)		
	amoand.d	x10,	x12,	(x11)		
	amoor.d		x10,	x12,	(x11)		

test3:
	amomin.d	x10,	x12,	(x11)
	amominu.d	x15,	x12,	(x11)
	amomax.d	x10,	x12,	(x11)
	amomaxu.d	x15,	x12,	(x11)


	TEST_PASSFAIL
RVTEST_CODE_END

	.data
RVTEST_DATA_BEGIN
	TEST_DATA
dta:
	.word	0x12345678
RVTEST_DATA_END


