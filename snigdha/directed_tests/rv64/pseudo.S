//**************************************************************************************** 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved. 
//   Owner: Snigdharani Pradhan 
//   Item : pseudo_instruction 
//   Date created : 20/11/2025 
//***********************************************************************************
//   Description: pseudo instructions 
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

test1:
	la	x5,	test5

test2:
	j 	test3

	nop
	li	x7,	20
	mv	x8,	x7
	not	x8,	x7
	neg	x8,	x7
	negw	x8,	x7
	sext.w	x8,	x7
	seqz	x8,	x7
	snez	x8,	x7
	sltz	x8,	x7
	sgtz	x8,	x7

test3:
	jal	test4

	fmv.s	f1,	f2			
	fabs.s	f1,	f2
	fneg.s	f1,	f2
	fmv.d	f1,	f2
	fabs.d	f1,	f2
	fneg.d	f1,	f2

test4:
	jr	x5
		
	beqz	x6,	test1	
	bnez	x6,	test1
	blez	x6,	test1
	bgez	x6,	test1
	bltz	x6,	test1
	bgtz	x6,	test1

test5:
	la	x10,	test6	
	jalr	x10

	bgt	x9,	x11,	test6	
	ble	x9,	x11,	test6
	bgtu	x9,	x11,	test6
	bleu	x9,	x11,	test6

test6:
	li x12,	50

	TEST_PASSFAIL
RVTEST_CODE_END

	.data
RVTEST_DATA_BEGIN
	TEST_DATA
dta:
	.word 0x12345678

dat:
	.word 0
RVTEST_DATA_END
 
