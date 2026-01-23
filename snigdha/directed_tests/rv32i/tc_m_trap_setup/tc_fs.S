//****************************************************************************************
//   Copyright 2025 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : fs
//   Date created : 12/01/2025
//****************************************************************************************
//   Description: 
// 
 //***************************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

start:
	csrr	t0,mstatus

	li	t0, (3<<13)	
	csrc	mstatus,t0	//fs=00	
	
	li	t0, (1<<13)
	csrs	mstatus,t0	//fs=01

	fadd.s	f0, f0, f0

TEST_PASSFAIL
RVTEST_CODE_END

.data
RVTEST_DATA_BEGIN
TEST_DATA
RVTEST_DATA_END

