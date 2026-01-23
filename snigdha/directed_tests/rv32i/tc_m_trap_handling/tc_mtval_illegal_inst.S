//****************************************************************************************
//   Copyright 2025 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : tc_mcause_illegal_inst
//   Date created : 12/01/2025
//***********************************************************************************
//   Description: Perform an illegal instruction exception and read the mtval value. 
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

start:
	la	t0, trap_handler
    	csrw 	mtvec, t0

	csrc	mhartid, x1
	j	after_trap

trap_handler:
    	csrr	t0, mcause
    	csrr 	t1, mepc

    	addi 	t1, t1, 4
    	csrw 	mepc, t1
	csrr	t2,mtval

after_trap:
	mret

TEST_PASSFAIL
RVTEST_CODE_END

.data
RVTEST_DATA_BEGIN
TEST_DATA

RVTEST_DATA_END
