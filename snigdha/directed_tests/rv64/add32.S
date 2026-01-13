//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : add_instruction
//   Date created : 11/11/2025
//***********************************************************************************
//   Description: addition of 2 32-bit value
//***********************************************************************************
 
#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32M
RVTEST_CODE_BEGIN

	start:
		li	x5,	0xffffffff
		li	x6,	1

	test1:
		add	x7,	x5,	x6

		TEST_PASSFAIL
RVTEST_CODE_END

	.data
RVTEST_DATA_BEGIN
	TEST_DATA
	.word	0x06627912
RVTEST_DATA_END

