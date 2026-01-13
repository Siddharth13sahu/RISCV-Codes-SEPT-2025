//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : csr_instruction
//   Date created : 12/12/2025
//***********************************************************************************
//   Description: 
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

start:

	li	x1,1
	li	x2,3
	li	x3,5

test1:	

	csrr	x7,	mhartid
	csrr	x8,	mvendorid
	csrr	x9,	mimpid
	csrr	x10,marchid
//	csrr	x11,mconfigptr

TEST_PASSFAIL
RVTEST_CODE_END

.data
RVTEST_DATA_BEGIN
TEST_DATA
RVTEST_DATA_END

 
