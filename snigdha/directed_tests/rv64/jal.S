//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan 
//   Item : jal_instruction
//   Date created : 07/11/2025
//***********************************************************************************
//   Description: Testcase says 
//***********************************************************************************
 
#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32M
RVTEST_CODE_BEGIN

		li	x7,	3

	start:
		jal		ra,	label
		addi	x5,	x7,	5

	label:
		addi	x6,	x0,	6

		TEST_PASSFAIL
RVTEST_CODE_END

	.data
RVTEST_DATA_BEGIN
	TEST_DATA
	.word	0x06627912
RVTEST_DATA_END
