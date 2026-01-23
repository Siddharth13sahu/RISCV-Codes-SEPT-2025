//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Auroshree Anuvab Raj 
//   Item : CSR Read
//   Date created : 11/07/2025
//***********************************************************************************
//   Description: The following testcase is about observing the changing value of mstatus.sum
//***********************************************************************************



#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64MF
RVTEST_CODE_BEGIN

start:
	

set1:
	
	
			

 
  TEST_PASSFAIL
 
RVTEST_CODE_END
 
  .data
 
RVTEST_DATA_BEGIN
  TEST_DATA
 inp_data:
	.word	0xDEADBEEF
 	.double	1.5	//3fc00000
	.double	2.4	//4019999a
RVTEST_DATA_END



