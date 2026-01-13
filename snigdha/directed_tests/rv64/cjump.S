//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : c_jump_instruction
//   Date created : 12/11/2025
//***********************************************************************************
//   Description: Testcase says 
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32M
RVTEST_CODE_BEGIN

start:
	li	x5,	30
	c.j	label

label:
	c.jal	x1,	next_label

next_label:
	li	x6,	20
	c.jalr	x1

	TEST_PASSFAIL
RVTEST_CODE_END

	.data
RVTEST_DATA_BEGIN
	TEST_DATA
	.word	0x06627912
RVTEST_DATA_END
