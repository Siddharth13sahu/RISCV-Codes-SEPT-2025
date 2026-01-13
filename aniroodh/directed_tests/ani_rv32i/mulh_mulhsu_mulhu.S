//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item : mulh_mulhsu_mulhu_instruction

//   Date created : 11/07/2025

//***********************************************************************************
//   Description: multiplication operation between registers 
//***********************************************************************************

#include "test_macros.h"

#include "riscv_test.h"
 
RVTEST_RV32M

RVTEST_CODE_BEGIN


start:
 	
	li			x5,	50
	li			x6,	-20
	li 		x7,	10
	li 		x8,	0x12345678

Test1:
	mulhsu 	x28,	x5,	x7

Test2:
	mulhsu 	x29,	x6,	x7

Test3:
	mulhu 	x30,	x5,	x7

Test4:
	mulh 		x31,	x8,	x7

	TEST_PASSFAIL
 
RVTEST_CODE_END


 
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END


