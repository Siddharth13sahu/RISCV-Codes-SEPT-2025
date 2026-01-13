//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : jalr_instruction
//   Date created : 07/11/2025
//***********************************************************************************
//   Description: Testcase says 
//***********************************************************************************
 
#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32M
RVTEST_CODE_BEGIN

	start:
		addi	x5,	x0,	3
		la		x8,	label
		jalr	x6,	0(x8)

		addi	x7,	x5,	5

	label:
		add		x8,	x5,	x7

		TEST_PASSFAIL
RVTEST_CODE_END

	.data

RVTEST_DATA_BEGIN
	TEST_DATA
	.word	0x06627912
RVTEST_DATA_END
