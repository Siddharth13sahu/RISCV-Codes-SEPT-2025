//****************************************************************************************
//   Copyright 2025 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : tc_load_addr_misalign
//   Date created : 13/01/2026
//***********************************************************************************
//   Description: Load address misaligned exception delegation
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

start1:
	la   	t0, s_trap_handler
   	csrw 	stvec, t0

    	li	t0, (1<<4)
	csrw	medeleg, t0

	csrr	t0, mstatus
	li	t1, (3<<11)
	csrc	mstatus,t1

	li	t1, (1<<11)
	csrs	mstatus,t1

	la	t0, s_mode_start
	csrw	mepc, t0
	
	mret
	
s_mode_start:
	li	t1, 5
	li	t0, 0x80000000
	lw	t1, 1(t0)
	
	nop

s_trap_handler:
	csrr	t0, scause
	li	t1, 4
	bne	t0, t1, trap_exit

	csrr	t0, sepc
	csrr	t1, stval

	addi	t0, t0, 4
	csrw	sepc,t0

trap_exit:
	sret

 TEST_PASSFAIL

RVTEST_CODE_END

	.data
RVTEST_DATA_BEGIN
	TEST_DATA
RVTEST_DATA_END

