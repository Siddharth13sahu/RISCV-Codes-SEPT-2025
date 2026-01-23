//****************************************************************************************
//   Copyright 2025 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : tc_spp
//   Date created : 12/01/2025
//****************************************************************************************
//   Description: SPP is a field inside the mstatus CSR that records the previous 
//                 privilege mode before entering the mode due to a trap.
//***************************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

start:
	csrr	t0, mstatus		//t0 = 0x0000000a00000080

	li	t1, ~(1<<8)
	and	t0, t0, t1		//clear spp field

	li	t1, (1<<8)		//x1 = 0x0000000000000100
	or	t0, t0, t1		//set new spp field

	csrw	mstatus,t0		//c768_mstatus = 0x0000000a00000180

TEST_PASSFAIL
RVTEST_CODE_END

.data
RVTEST_DATA_BEGIN
TEST_DATA
RVTEST_DATA_END

