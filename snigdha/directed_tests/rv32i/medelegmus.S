//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : delegation
//   Date created : 6/01/2026
//***********************************************************************************
//   Description: Generate trap in u mode and handle in s mode
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

start1:
	li	t0, (1<<8)
   	csrw	medeleg, t0
 
    	la	t0, s_trap_handler
    	csrw	stvec, t0

    	li	t0, (1<<11)
    	csrs	mstatus, t0

    	la  t0, s_mode_start
    	csrw	mepc, t0

    	mret

s_mode_start:
	li	t0, (1<<8)
	csrc	sstatus, t0

	la	t0, u_mode_start
	csrw	sepc, t0

	sret

u_mode_start:
	nop
	ecall
	nop

s_trap_handler:
	csrr	t0, scause
	li	t1,	9
	bne	t0, t1, s_trap_exit

	csrr 	t0, sepc
	addi	t0, t0, 4
	csrw	sepc, t0

s_trap_exit:
	sret

 TEST_PASSFAIL

RVTEST_CODE_END

	.data
RVTEST_DATA_BEGIN
	TEST_DATA

RVTEST_DATA_END



