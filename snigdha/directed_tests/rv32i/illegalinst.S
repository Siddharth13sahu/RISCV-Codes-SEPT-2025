//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : exception
//   Date created : 12/12/2025
//***********************************************************************************
//   Description: exceptions and exception handling
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

start:
    la   t0, trap_handler
    csrw mtvec, t0

    # cause an exception
    csrc mhartid, x1			//illegal instruction
	j after_trap

trap_handler:
    csrr t0, mcause
    csrr t1, mepc
	csrr t0, mtval

    addi t1, t1, 4
    csrw mepc, t1

after_trap:
	mret

TEST_PASSFAIL
RVTEST_CODE_END

.data
RVTEST_DATA_BEGIN
TEST_DATA

RVTEST_DATA_END
