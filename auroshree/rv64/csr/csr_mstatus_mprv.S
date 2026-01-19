//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Auroshree Anuvab Raj 
//   Item : CSR Read
//   Date created : 11/07/2025
//***********************************************************************************
//   Description: The following testcase is about observing the default value of mstatus.mprv and changing it's value to oberve the effect 
//***********************************************************************************



#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64MF
RVTEST_CODE_BEGIN

start:
	

set1:
	la		x5,	inp_data

	
//	la		x7,	0x80000000
	lw		x6,	0(x5)
	csrr	x6,	mstatus	
	li		x7,	(1<<17)
	or		x6,	x6,	x7		//set mprv to 1
	csrw	mstatus,	x6
	csrr	x6,	mstatus

	li		x7,	~(3<<11)
	and	x6,	x6,	x7		//set mpp to 00
	csrw	mstatus,	x6
	
	lw		x7,	0(x5)
	
	
			

 
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


