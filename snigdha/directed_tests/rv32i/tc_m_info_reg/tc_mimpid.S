//****************************************************************************************
//   Copyright 2025 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : tc_mimpid
//   Date created : 12/01/2025
//***********************************************************************************
//   Description: Reading from and writing to the machine information register mimpid.
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

start1:
	csrr	x9,	mimpid		//0x0000000000000000
start2:
	csrw	mimpid,	x9

TEST_PASSFAIL
RVTEST_CODE_END

.data
RVTEST_DATA_BEGIN
TEST_DATA
RVTEST_DATA_END


