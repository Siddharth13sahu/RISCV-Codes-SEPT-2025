//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : misa csr_instruction
//   Date created : 8/01/2026
//***********************************************************************************
//   Description: Checking of isa extensions in misa 
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

test1:
	csrr	t0, misa

	li	t1, (1<<12)
	and 	t2, t0, t1

	li	t1, (1<<2)
	and	t3, t0, t1

	li	t1, (1<<8)
	and	t4, t0, t1

TEST_PASSFAIL
RVTEST_CODE_END

.data
RVTEST_DATA_BEGIN
	TEST_DATA
RVTEST_DATA_END

 
