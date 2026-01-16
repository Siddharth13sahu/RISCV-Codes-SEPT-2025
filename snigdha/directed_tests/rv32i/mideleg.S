//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : mideleg
//   Date created : 9/01/2026
//***********************************************************************************
//   Description: Delegation of trap to s mode
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

start1:
	li	t0, (1<<1)		//ssip
    	csrw	mideleg, t0
 
    	la	t0, s_trap_handler
    	csrw	stvec, t0

    	li	t0, (1<<3)
    	csrs	mstatus, t0

	li	t0, (1<<11)
	csrs	mstatus, t0

    	la	t0, s_mode_start
    	csrw	mepc, t0

   	mret

s_mode_start:
	li	t0, (1<<1)
	csrs	sie, t0

	li	t0, (1<<1)
	csrs	sip, t0

trap_start:
	wfi
	nop

s_trap_handler:
	csrr	t0, scause
	li	t1,	1
	bne	t0, t1, s_trap_exit

	li	t0, (1<<1)
	csrc	sip, t0 

s_trap_exit:
	sret

 TEST_PASSFAIL

RVTEST_CODE_END

	.data
RVTEST_DATA_BEGIN
	TEST_DATA

RVTEST_DATA_END



