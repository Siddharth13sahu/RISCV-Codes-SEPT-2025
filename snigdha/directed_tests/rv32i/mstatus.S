//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : modified csr_instruction
//   Date created : 12/12/2025
//***********************************************************************************
//   Description: 
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

test1:
	li   t0, (1<<3)			//mie
    	csrs mstatus, t0

   	li   t0, (1<<7)			//mpie
    	csrs mstatus, t0

    	li   t0, (3<<11)		//mpp
    	csrs mstatus, t0

    	li   t0, (3<<13)		//fs
    	csrs mstatus, t0

    	li   t0, (1<<18)		//SUM
    	csrs mstatus, t0

    	csrr t1, mstatus


	TEST_PASSFAIL
RVTEST_CODE_END

.data
RVTEST_DATA_BEGIN
TEST_DATA
RVTEST_DATA_END

 
