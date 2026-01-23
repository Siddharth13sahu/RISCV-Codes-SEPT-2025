//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Auroshree Anuvab Raj 
//   Item : CSR Read
//   Date created : 11/07/2025
//***********************************************************************************
//   Description: The following testcase is about observing the default value of mvendorid and writing a random value to it and checking it's updated value 
//***********************************************************************************


#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64MF
RVTEST_CODE_BEGIN

start:
	

read:
	csrr	x7,	mvendorid

write:
	li		x6,	0xffffffffffffffff
	csrw	mvendorid,	x6
	csrr	x7,	mvendorid

	

 
  TEST_PASSFAIL
 
RVTEST_CODE_END
 
  .data
 
RVTEST_DATA_BEGIN
  TEST_DATA
 inp_data:
	.word	0xDEADBEEF
 
RVTEST_DATA_END

