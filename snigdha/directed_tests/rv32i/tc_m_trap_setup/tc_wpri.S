//****************************************************************************************
//   Copyright 2025 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : tc_wpri 
//   Date created : 12/01/2025
//****************************************************************************************
//   Description: WPRI bits are write-preserved and read-ignored; software must preserve 
//   them on write and must never rely on their read value. 
//****************************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

start:
	li	x5,(1<<0)

	csrr	x6, mstatus
	and	x7, x6, x5	//preserve the original wpri bit
	xor	x8, x6, x5	//attempt to modify the wpri bit
	csrw	mstatus,x8
	csrr	x8, mstatus

TEST_PASSFAIL
RVTEST_CODE_END

.data
RVTEST_DATA_BEGIN
TEST_DATA
RVTEST_DATA_END

