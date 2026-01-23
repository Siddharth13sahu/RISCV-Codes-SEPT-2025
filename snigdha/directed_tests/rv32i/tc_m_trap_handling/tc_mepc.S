//****************************************************************************************
//   Copyright 2025 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : tc_mepc
//   Date created : 12/01/2025
//***********************************************************************************
//   Description: Perform an exception and read the mepc value and increment it to exit from trap. 
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

after_trap:
	mret

TEST_PASSFAIL
RVTEST_CODE_END

.data
RVTEST_DATA_BEGIN
TEST_DATA

RVTEST_DATA_END
