//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item : sltu_instruction

//   Date created : 11/07/2025

//***********************************************************************************
//   Description: set if less than instruction (unsigned) 
//***********************************************************************************

#include "test_macros.h"

#include "riscv_test.h"
 
RVTEST_RV32M

RVTEST_CODE_BEGIN


start:
 
	li 	x4,	25
	li 	x5,	3
	li 	x6,	-13

test1:
	sltu 	x30,	x4,	x5

test2:
	sltu 	x31,	x6,	x5
 
TEST_PASSFAIL
 
RVTEST_CODE_END
 
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
