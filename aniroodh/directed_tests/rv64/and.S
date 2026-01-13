//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item : and_instruction

//   Date created : 11/07/2025

//***********************************************************************************
//   Description: perform "and" instruction between the registers  
//***********************************************************************************

#include "test_macros.h"

#include "riscv_test.h"
 
RVTEST_RV64M

RVTEST_CODE_BEGIN


start:
 
	li 	x4,	0x1210
	li 	x5,	0x0115
	li 	x6,	0x0115

test1:
	and 	x30,	x4,	x5

test2:
	and 	x31,	x6,	x5
 
TEST_PASSFAIL
 
RVTEST_CODE_END
 
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
