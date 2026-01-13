//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item : mulw_divw_divuw_remw_remuw_instruction

//   Date created : 11/07/2025

//***********************************************************************************
//   Description: multiplication, division, remainder operation between the registers
//***********************************************************************************

#include "test_macros.h"

#include "riscv_test.h"
 
RVTEST_RV64M

RVTEST_CODE_BEGIN


start:
 
	li		x6,	-20
	li		x7,	10
	li		x8,	66

Test1:
	mulw	x5,	x8,	x7	

test2:
	divw	x28,	x6,	x7

test3:
	divw	x29,	x8,	x7

test4:
	divuw	x30, 	x6,	x7

test5:
	divuw	x31,	x8,	x7

test6:
	remw	x5,	x6,	x7

test7:
	remuw	x28,	x6,	x7

test8:
	remuw	x29,	x8,	x7
 
TEST_PASSFAIL
 
RVTEST_CODE_END
 
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END

