//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item : lui_auipc_instruction

//   Date created : 11/07/2025

//***********************************************************************************
//   Description: subtraction instruction 
//***********************************************************************************

#include "test_macros.h"

#include "riscv_test.h"
 
RVTEST_RV32M

RVTEST_CODE_BEGIN
 
	li 	gp,	3

start:
	
test1:
	lui	x5, 	0x12345

test2:
	auipc	x6, 	0x1

  TEST_PASSFAIL
 
RVTEST_CODE_END
 
 
RVTEST_DATA_BEGIN

  TEST_DATA
 
RVTEST_DATA_END
