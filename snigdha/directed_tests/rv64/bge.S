//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : bge_instruction
//   Date created : 07/11/2025
//***********************************************************************************
//   Description: Testcase says 
//***********************************************************************************
 
	#include "test_macros.h"
	#include "riscv_test.h"

	RVTEST_RV32M
	RVTEST_CODE_BEGIN

		li	gp,	3

	start:
		li	x6,	10
		li	x7,	15
		bge	x6,	x7,	label

	label:
		add	x11, x6, x7

		TEST_PASSFAIL
	RVTEST_CODE_END

		.data
	RVTEST_DATA_BEGIN
		TEST_DATA
		.word	0x06627912
	RVTEST_DATA_END

