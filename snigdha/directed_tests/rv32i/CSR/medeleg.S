//****************************************************************************************
//   Copyright 2025 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : medeleg
//   Date created : 13/01/2026
//***********************************************************************************
//   Description: read the bits of medeleg csr
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

start1:
	li 		t0,	0xffffffffffffffff
	csrr	t0, medeleg

 TEST_PASSFAIL

RVTEST_CODE_END

	.data
RVTEST_DATA_BEGIN
	TEST_DATA
RVTEST_DATA_END

