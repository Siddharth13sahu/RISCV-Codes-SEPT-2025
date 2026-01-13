//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : bgeu_instruction
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
			li	x6,	-15
			li	x7,	10
			bgeu	x6,	x7,	label

		label:
			addi	x11, x0, 1

		TEST_PASSFAIL
	RVTEST_CODE_END

		.data
	RVTEST_DATA_BEGIN
		TEST_DATA
		.word	0x06627912
	RVTEST_DATA_END
