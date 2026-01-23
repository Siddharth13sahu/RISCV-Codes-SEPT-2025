//****************************************************************************************
//   Copyright 2025 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : tc_mcause_load_addr_misalign
//   Date created : 12/01/2025
//***********************************************************************************
//   Description: Perform an load address misalign exception and read the mcause value. 
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

start1:
	li	t0, (1<<4)
	csrw	medeleg, t0
 
	la	t0, trap_handler
	csrw	mtvec,t0

trap_start:
	li	t1, 5
	li	t0, 0x80000000
	lw	t1, 1(t0)

	nop

trap_handler:
	csrr	t0, mcause
	li	t1, 4
	bne	t0, t1, trap_exit

	csrr	t0, mepc
	csrr	t1, mtval

trap_exit:
	mret

TEST_PASSFAIL
RVTEST_CODE_END

.data
RVTEST_DATA_BEGIN
TEST_DATA

RVTEST_DATA_END
