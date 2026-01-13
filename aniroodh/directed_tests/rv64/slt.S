//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item : slt_instruction

//   Date created : 11/07/2025

//***********************************************************************************
//   Description: set if less than instruction
//***********************************************************************************


#include "test_macros.h"

#include "riscv_test.h"
 
RVTEST_RV32M

RVTEST_CODE_BEGIN


start:
 
	li 	x4,	2
	li 	x5,	6
	li 	x6,	-19

test1:
	slt 	x30,	x4,	x5

test2:
	slt 	x31,	x6,x	5
 
TEST_PASSFAIL
 
RVTEST_CODE_END
 
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
