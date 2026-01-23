//****************************************************************************************
//   Copyright 2025 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : tc_stval_illegal_inst
//   Date created : 16/01/2025
//***********************************************************************************
//   Description: illegal instruction exception generation and  reading of stval value. 
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

start:
	la   	t0, s_trap_handler
   	csrw 	stvec, t0

    	li	t0, (1<<2)
	csrw	medeleg, t0

	csrr	t0, mstatus
	li	t1, (3<<11)
	csrc	mstatus,t1

	li	t1, (1<<11)
	csrs	mstatus,t1

	la	t0, s_mode_start
	csrw	mepc, t0
	
	mret					//enter s-mode

s_mode_start:
    	# cause an exception
    	csrc	mhartid, x1			//illegal instruction

s_trap_handler:
    	csrr	t0, scause
    	csrr  	t1, sepc
    	csrr	t2, stval

    	addi	t1, t1, 4
    	csrw 	sepc, t1

after_trap:
   	sret

TEST_PASSFAIL
RVTEST_CODE_END

.data
RVTEST_DATA_BEGIN
TEST_DATA

RVTEST_DATA_END
