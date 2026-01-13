//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item : jal_jalr_instruction

//   Date created : 11/07/2025

//***********************************************************************************
//   Description: jal_jalr instruction 
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32M
RVTEST_CODE_BEGIN

	li 	gp, 	3

start:

Test1:         //jal
	jal	x1,	target
	addi	x5,	x0,	50

target:
	addi	x6,	x0,	20
 
Test2:         //jalr
	la 	x5,	func
	jalr	x1,	0(x5)
	li 	x11,	10

func:
	li 	x11,	42
  
  TEST_PASSFAIL

RVTEST_CODE_END
  .data

RVTEST_DATA_BEGIN
  
  TEST_DATA

RVTEST_DATA_END

