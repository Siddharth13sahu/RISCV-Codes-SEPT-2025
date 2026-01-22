//****************************************************************************************
//   Copyright 2025 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : tc_mpie 
//   Date created : 12/01/2025
//****************************************************************************************
//   Description:MPIE is a single-bit field in the mstatus CSR that records whether
// machine-mode interrupts were enabled before a trap.   
 //****************************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

start:
	csrr	t0, mstatus

	li	t0, (1<<7)
	csrw	mstatus,t0
	csrs	mstatus,t0

TEST_PASSFAIL
RVTEST_CODE_END

.data
RVTEST_DATA_BEGIN
TEST_DATA
RVTEST_DATA_END

