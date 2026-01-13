//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item : rem_remu_instruction

//   Date created : 11/07/2025

//***********************************************************************************
//   Description: remainder operation between registers 
//***********************************************************************************

#include "test_macros.h"

#include "riscv_test.h"
 
RVTEST_RV32M

RVTEST_CODE_BEGIN


start:
 	
	li		x5,	50
	li		x6,	-20
	li 	x7,	10
	li		x30,	6
	
Test1:
	rem	x28,	x5,	x7

Test2:
	remu 	x29,	x6,	x7

Test3:
	rem	x31,	x6,	x30

	TEST_PASSFAIL
 
RVTEST_CODE_END


 
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END

