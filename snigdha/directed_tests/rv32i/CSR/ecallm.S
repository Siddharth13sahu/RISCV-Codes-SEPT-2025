//****************************************************************************************
//   Copyright 2025 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : ecallm
//   Date created : 6/01/2026
//***********************************************************************************
//   Description: ecall in m-mode
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

start1:
	li	t0, (1<<11)
	csrw	medeleg, t0
 
	la	t0, m_trap_handler
	csrw	mtvec, t0

	li	t0, (1<<11)
   	csrs	mstatus, t0

trap_start:
	ecall
	nop

m_trap_handler:
	csrr	t0, mcause
	li	t1,	11
	bne	t0, t1, m_trap_exit

	csrr	t0, sepc
	addi	t0, t0, 4
	csrw	sepc, t0

m_trap_exit:
	mret

 TEST_PASSFAIL

RVTEST_CODE_END

	.data
RVTEST_DATA_BEGIN
	TEST_DATA

RVTEST_DATA_END



