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
	li	t0,(1<<0)
	csrr	t0,mstatus
	csrs	mstatus,t0

TEST_PASSFAIL
RVTEST_CODE_END

.data
RVTEST_DATA_BEGIN
TEST_DATA
RVTEST_DATA_END

