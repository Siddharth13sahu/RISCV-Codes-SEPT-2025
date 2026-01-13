//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item : sllw_srlw_sraw_instruction

//   Date created : 11/11/2025

//***********************************************************************************
//   Description: logical shift left instruction with an immediate value 
//***********************************************************************************

#include "test_macros.h"

#include "riscv_test.h"
 
RVTEST_RV64M

RVTEST_CODE_BEGIN


start:
 
	li		x7,	0xffaaccdd21232123
	li		x5,	3
	li		x6,	4
	li		x28,	2

Test1:
	sllw	x29,	x7,	x5

Test2:
	srlw 	x30,	x7,	x6


Test3:
	sraw	x31,	x7,	x28

 
	TEST_PASSFAIL
 
RVTEST_CODE_END
 
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
