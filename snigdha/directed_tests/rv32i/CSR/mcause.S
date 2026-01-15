//****************************************************************************************
//   Copyright 2025 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : mcause
//   Date created : 13/01/2026
//***********************************************************************************
//   Description: 
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

start1:
//	li	t0, (1<<11)
	li	t0, (1<<3)

	csrw	medeleg, t0
 
	la	t0, trap_handler
	csrw	mtvec,t0

trap_start:
//	ecall
//  ebreak
	nop

trap_handler:
	csrr	t0, mcause
//	li	t1,	11
	li  t1, 3
	bne	t0, t1, trap_exit

	csrr	t0, mepc
	addi	t0, t0, 4
	csrw	mepc, t0

trap_exit:
	mret

 TEST_PASSFAIL

RVTEST_CODE_END

	.data
RVTEST_DATA_BEGIN
	TEST_DATA
RVTEST_DATA_END

