//****************************************************************************************
//   Copyright 2025 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : tc_mtval_store_addr_misaligned
//   Date created : 13/01/2026
//***********************************************************************************
//   Description: store address misaligned exception is generated and mtval value is read.
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

start1:
	li	t0, (1<<0)
	csrw	medeleg, t0
 
	la	t0, trap_handler
	csrw	mtvec,t0

trap_start:
	li	t1, 5
	li	t0, 0x80000000
	lw	t1, 0(t0)

	sw	t2, 0(t0)
	nop

trap_handler:
	csrr	t0, mcause
	li	t1,	0
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

