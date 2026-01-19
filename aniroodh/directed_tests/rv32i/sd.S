//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item : sb_sh_sw_instruction

//   Date created : 11/07/2025

//***********************************************************************************
//   Description: subtraction instruction 
//***********************************************************************************

#include "test_macros.h"

#include "riscv_test.h"
 
RVTEST_RV64M

RVTEST_CODE_BEGIN

	start:
		initialise:
		li gp, 3
		li x5, 0x12349876acbdef56  //data to be stored
		li x8, 0x80002000  //initialise the registers with addrs
				
		Test1:
		sd x5, 0(x8) // store double_word
	
	TEST_PASSFAIL
 
RVTEST_CODE_END

.data
	
RVTEST_DATA_BEGIN

	TEST_DATA
 
RVTEST_DATA_END
