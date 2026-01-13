//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item : sra_instruction

//   Date created : 11/07/2025

//***********************************************************************************
//   Description: arithmetic shift right instruction
//***********************************************************************************


#include "test_macros.h"

#include "riscv_test.h"
 
RVTEST_RV32M

RVTEST_CODE_BEGIN


start:
 
	li 	x4,	10
	li 	x6,	-7
	li 	x5,	2	

test1:
	sra 	x30,	x4,	x5

test2:
	sra 	x31,	x6,	x5
 
TEST_PASSFAIL
 
RVTEST_CODE_END
 
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
