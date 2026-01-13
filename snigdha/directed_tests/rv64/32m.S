//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : 32m_instruction
//   Date created : 11/11/2025
//***********************************************************************************
//   Description: Testcase says 
//***********************************************************************************
 
 #include "test_macros.h"
 #include "riscv_test.h"

 RVTEST_RV32M
 RVTEST_CODE_BEGIN

 	start:
		li	x5,	0x12345678
		li	x6,	0x12345678
		li	x9,	0xffffffff

	test1:
		mul		x7,	x5,	x6
		mul		x8,	x6,	x9

	test2:
		mulh	x13, x5, x6
		mulh	x10, x6, x7

	test3:
		mulhsu	x11, x5, x6
		mulhsu	x12, x6, x7

	test4:
		mulhu	x11, x5, x6
		mulhu	x12, x6, x7

	test5:
		li	x5,	-50
		li	x6,	3

	test6:
		div		x7,	x5,	x6
		divu	x8,	x5,	x6
		rem		x9,	x5,	x6
		remu	x10, x5, x6


		TEST_PASSFAIL
RVTEST_CODE_END

	.data
RVTEST_DATA_BEGIN
	TEST_DATA
	.word	0x06627912
RVTEST_DATA_END
