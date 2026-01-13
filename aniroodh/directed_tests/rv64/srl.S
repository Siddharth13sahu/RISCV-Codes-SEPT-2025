//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item : srl_instruction

//   Date created : 11/07/2025

//***********************************************************************************
//   Description: logical shift left instruction 
//***********************************************************************************

#include "test_macros.h"

#include "riscv_test.h"
 
RVTEST_RV32M

RVTEST_CODE_BEGIN


start:
 
	li 	x4,	51
	li 	x6,	0x78654321
	li 	x5,	4

test1:
	srl 	x7,	x4,	x5

test2:
	srl 	x30,	x6,	x5

TEST_PASSFAIL
 
RVTEST_CODE_END
 
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
