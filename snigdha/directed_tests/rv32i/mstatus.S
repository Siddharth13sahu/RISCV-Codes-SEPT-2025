//****************************************************************************************
//   Copyright 2025 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : mstatus
//   Date created : 12/12/2025
//***********************************************************************************
//   Description: Read the default value of the mstatus csr
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

test1:
	csrr	t0, mstatus

	li		t1, 0xffffffffffffffff
	csrr	t1, mstatus

	csrw	t1, mstatus

	TEST_PASSFAIL
RVTEST_CODE_END

.data
RVTEST_DATA_BEGIN
TEST_DATA
RVTEST_DATA_END

 
