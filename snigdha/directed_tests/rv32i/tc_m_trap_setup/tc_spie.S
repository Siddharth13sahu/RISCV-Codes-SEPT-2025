//****************************************************************************************
//   Copyright 2025 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : tc_spie 
//   Date created : 12/01/2025
//****************************************************************************************
//   Description: 
//  
 //****************************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

start:
	csrr	t0, spie

	li	t0, (1<<5)
	csrw	sstatus,t0
	csrs	sstatus,t0

TEST_PASSFAIL
RVTEST_CODE_END

.data
RVTEST_DATA_BEGIN
TEST_DATA
RVTEST_DATA_END

