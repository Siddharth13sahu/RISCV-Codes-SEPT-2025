//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item : div_divu_instruction

//   Date created : 11/07/2025

//***********************************************************************************
//   Description: division operation between the registers
//***********************************************************************************

#include "test_macros.h"

#include "riscv_test.h"
 
RVTEST_RV32M

RVTEST_CODE_BEGIN


start:
 
	li		x6,	-20
	li		x7,	10
	li		x8,	66

test1:
	div	x28,	x6,	x7

test2:
	div	x29,	x8,	x7

test3:
	divu	x30, 	x6,	x7

test4:
	divu	x31,	x8,	x7

 
TEST_PASSFAIL
 
RVTEST_CODE_END
 
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END

