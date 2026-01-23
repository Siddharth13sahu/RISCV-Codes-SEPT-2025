//****************************************************************************************
//   Copyright 2025 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : tc_mie 
//   Date created : 12/01/2025
//****************************************************************************************
//   Description: Mie is a machine-mode CSR that controls which interrupts are allowed 
//		  to be taken in M-mode.
 //****************************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

start:
	csrr	t0, mstatus

	li	t0, (1<<3)
	csrc	mstatus,t0
	csrs	mstatus,t0		//c768_mstatus 0x0000000a00000088

TEST_PASSFAIL
RVTEST_CODE_END

.data
RVTEST_DATA_BEGIN
TEST_DATA
RVTEST_DATA_END

 
