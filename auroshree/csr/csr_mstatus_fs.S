//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Auroshree Anuvab Raj 
//   Item : CSR Read
//   Date created : 11/07/2025
//***********************************************************************************
//   Description: The following testcase is about observing the default value of mstatus.fs bits and changing it's value to it then observing it's behaviour 
//***********************************************************************************


#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64MF
RVTEST_CODE_BEGIN

start:
	

set1:
	la		x5,	inp_data
	csrr	x6,	mstatus		//fs[14:13]=10 xs[16:15]=01
	
	fadd.d	f2,	f1,	f0
	csrr	x6,	mstatus
	li		x7,	~(3<<13)
	and	x6,	x6,	x7		//fs[14:13]=00
	csrw	mstatus,		x6
	//fadd.d	f2,	f1,	f0
	csrr	x6,	mstatus
	li		x7,	(1<<13)
	or		x6,	x6,	x7
	csrw	mstatus,		x6
	fadd.d	f2,	f1,	f0
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
