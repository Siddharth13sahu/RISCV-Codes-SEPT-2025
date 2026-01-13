//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item : lb_lh_lw_instruction

//   Date created : 11/07/2025

//***********************************************************************************
//   Description: subtraction instruction 
//***********************************************************************************

#include "test_macros.h"

#include "riscv_test.h"
 
RVTEST_RV32M

RVTEST_CODE_BEGIN
 
		li 	gp, 	3

	start: 
		
		Test1:
		la 	x5,	load_data
		lb 	x6, 	0(x5) 		// load byte

		Test2:
		lh 	x7, 	0(x5)			//load halfword

		Test3:
		lw 	x28,	0(x5) 	//load word

	TEST_PASSFAIL
 
RVTEST_CODE_END
 
	.data 
	load_data: .byte 0x64,0x45,0x23,0x98

RVTEST_DATA_BEGIN

	TEST_DATA
 
RVTEST_DATA_END
