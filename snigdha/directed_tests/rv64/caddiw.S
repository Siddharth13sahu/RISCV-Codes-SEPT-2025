//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : c_addiw_instruction
//   Date created : 12/11/2025
//***********************************************************************************
//   Description: Testcase says 
//***********************************************************************************
 
 #include "test_macros.h"
 #include "riscv_test.h"

 RVTEST_RV64M
 RVTEST_CODE_BEGIN

 test1:
 	c.addiw	x8,	8
	c.addiw	x9,	31	

	TEST_PASSFAIL
 RVTEST_CODE_END

	.data
 RVTEST_DATA_BEGIN
	TEST_DATA
	.word
 RVTEST_DATA_END
