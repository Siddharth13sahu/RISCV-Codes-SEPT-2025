//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item : ld_lwu_instruction

//   Date created : 11/07/2025

//***********************************************************************************
//   Description: subtraction instruction 
//***********************************************************************************

#include "test_macros.h"

#include "riscv_test.h"
 
RVTEST_RV64M

RVTEST_CODE_BEGIN
 
	li gp, 3

	start: 
		
		Test1:
		la		x5,	load_data
		ld		x6,	0(x5) 		// load double word

		Test2:
		lwu 	x7,	0(x5)			//load word_unsigned

	TEST_PASSFAIL
 
RVTEST_CODE_END
 
	.data 
	load_data: .dword 0xf44523981156ff23

RVTEST_DATA_BEGIN

	TEST_DATA
 
RVTEST_DATA_END

