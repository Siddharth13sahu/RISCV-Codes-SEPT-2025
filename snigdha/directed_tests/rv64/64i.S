//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : 64i_instruction
//   Date created : 07/11/2025
//***********************************************************************************
//   Description: Base integer instructions of 64 bits 
//***********************************************************************************
 
#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64M
RVTEST_CODE_BEGIN
 
start: 
	li	x6,	40
	li	x7,	10
	li	x8,	20
	la	x5,	dta
	lwu	x12,	0(x5)

test1:
	addw		x10, x6, x7
	subw		x10, x6, x7


test2:
	sraw		x6,	x7,	x8
	sllw		x7,	x12,	x6
	srlw		x6,	x12,	x8

test3:
	addiw		x29, 	x6, 	6 

test4:
	slliw		x6,	x12, 2
	sraiw		x6,	x12, 2
	srliw		x6,	x12, 2

test5:
	slli		x6,	x12, 2
	srai		x6,	x12, 2
	srli		x6,	x12, 2


test6:
	ld		x7,	0(x5)
	sd		x7,	0(x5)


  TEST_PASSFAIL
 
RVTEST_CODE_END
 
  .data
 
RVTEST_DATA_BEGIN
  TEST_DATA
  dta:
  .word	0x0662791212345678
RVTEST_DATA_END
