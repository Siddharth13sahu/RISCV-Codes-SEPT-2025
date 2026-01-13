//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : interrupt handling
//   Date created : 8/01/2026
//***********************************************************************************
//   Description: 
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

start1:
	li	t0, (1<<3)			//mie disable
    	csrc	mstatus, t0

	li	t0, (1<<7)			//machine timer (mtie)
	csrs	mie, t0

	li	t0, (1<<3)
	csrs	mstatus, t0			//mie enable

	la	t0, trap_handler
	csrw	mtvec,t0


loop:
	j	loop

trap_handler:
	csrr	t0, mcause
	csrr	t1, mepc

	

    	addi	t1, t1, 4
    	csrw	mepc, t1

	mret

 TEST_PASSFAIL

RVTEST_CODE_END

	.data
RVTEST_DATA_BEGIN
	TEST_DATA

RVTEST_DATA_END



