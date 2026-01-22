//****************************************************************************************
//   Copyright 2025 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : tc_misa_32MF 
//   Date created : 12/01/2025
//****************************************************************************************
//   Description: Misa is a machine-mode CSR that describes which ISA features 
//		  the processor implements. 
 //****************************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32MF
RVTEST_CODE_BEGIN

start:
	csrr	t0,	misa

TEST_PASSFAIL
RVTEST_CODE_END

.data
RVTEST_DATA_BEGIN
TEST_DATA
RVTEST_DATA_END

