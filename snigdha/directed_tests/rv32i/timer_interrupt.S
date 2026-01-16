//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : interrupt handling
//   Date created : 8/01/2026
//***********************************************************************************
//   Description:
//   This code implements basic interrupt and exception handling in RISC-V.
//   The processor remains in a wait state using the WFI instruction
//   until an interrupt or exception occurs. On a trap, control is transferred
//   to the trap handler, which checks the mcause register to distinguish between
//   an interrupt and an exception. For exceptions, the program counter (mepc)
//   is incremented to skip the faulting instruction. Execution then returns
//   from the trap using MRET, resuming normal operation.
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
	wfi
//	nop
	j	loop

trap_handler:
	csrr	t0, mcause
	csrr	t0, mtval
	bgez	t0, exception

	j	interrupt

exception:
	csrr	t1, mepc
	addi	t1, t1, 4
	csrw	mepc,t1

interrupt:
	mret

 TEST_PASSFAIL

RVTEST_CODE_END

	.data
RVTEST_DATA_BEGIN
	TEST_DATA

RVTEST_DATA_END



