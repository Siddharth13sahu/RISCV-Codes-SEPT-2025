//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item : beq_bne_blt_bge_instruction

//   Date created : 11/07/2025

//***********************************************************************************
//   Description: subtraction instruction 
//***********************************************************************************

#include "test_macros.h"

#include "riscv_test.h"
 
RVTEST_RV32M

RVTEST_CODE_BEGIN

	start:
		initialise:
		li 	gp,	3
		li 	x5,	-5
		li 	x6,	10
		li 	x28,	5
	
		Test1:
		bltu 	x5,	x6,	not_eq
		addi 	x7,	x0,	1

		Test4:
		bgeu 	x5,	x6,	equal

		not_eq:
		addi 	x7,	x0,	2  
		
		equal:
		addi 	x7,	x0,	3
	
	TEST_PASSFAIL
 
RVTEST_CODE_END
 
	.data 
	
RVTEST_DATA_BEGIN

	TEST_DATA
 
RVTEST_DATA_END
