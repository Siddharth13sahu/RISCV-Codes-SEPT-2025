//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item : slli_srli_srai_instruction

//   Date created : 11/11/2025

//***********************************************************************************
//   Description: logical shift left instruction with an immediate value 
//***********************************************************************************

#include "test_macros.h"

#include "riscv_test.h"
 
RVTEST_RV64M

RVTEST_CODE_BEGIN


	start:
 
		li x7,0xffaaccdd21232123

		Test1:
		slli x29,x7,4

		Test2:
		srli x30,x7,4


		Test3:
		srai x31,x7,6

 
	TEST_PASSFAIL
 
RVTEST_CODE_END
 
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END

