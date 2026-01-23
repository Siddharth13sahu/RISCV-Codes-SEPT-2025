//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Auroshree Anuvab Raj 
//   Item : CSR Read
//   Date created : 11/07/2025
//***********************************************************************************
//   Description: The following testcase is about observing the default value of mstatus.xs and changing it's values to observe the effect
//***********************************************************************************



#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64MF
RVTEST_CODE_BEGIN

start:
	

set1:
	la		x5,	inp_data
	csrr	x6,	mstatus		//fs[14:13]=11 xs[16:15]=00
	
	addi	x7,	x7,	0
	csrr	x6,	mstatus

	li		x7,	(1<<15)
	or		x6,	x6,	x7
	csrw	mstatus,		x6

	csrr	x6,	mstatus
		

 
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

