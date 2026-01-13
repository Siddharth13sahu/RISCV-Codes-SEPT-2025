//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : mul_div_64_instruction
//   Date created : 11/07/2025
//***********************************************************************************
//   Description: Testcase says mul and div instruction in RV64 
//***********************************************************************************
 
 #include "test_macros.h"
 #include "riscv_test.h"

 RVTEST_RV64M
 RVTEST_CODE_BEGIN

	start:
		li	x5,	-15
		li	x6,	2

	test1:
		mulw	x7,	x5,	x6

	test2:
		divw	x8,	x5,	x6

	test3:
		divuw	x9,	x5,	x6

	test4:
		remw	x10, x5, x6

	test5:
		remuw	x11, x5, x6

 		TEST_PASSFAIL
 RVTEST_CODE_END

 	.data
RVTEST_DATA_BEGIN
	TEST_DATA
	.word	0x06627912
RVTEST_DATA_END
