//****************************************************************************************
//   Copyright 2025 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : mie 
//   Date created : 12/01/2025
//****************************************************************************************
//   Description: Mie is a machine-mode CSR that controls which interrupts are allowed 
		  to be taken in M-mode.
 //****************************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

start:
	csrr	t0, mie

	li   	t0, (1<<7)      # MTIE
	csrs	mie,t0

	li	t0, (1<<3)
	csrw	mstatus,t0
	csrs	mstatus,t0

TEST_PASSFAIL
RVTEST_CODE_END

.data
RVTEST_DATA_BEGIN
TEST_DATA
RVTEST_DATA_END

 
