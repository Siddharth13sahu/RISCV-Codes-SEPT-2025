//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : mode change
//   Date created : 5/01/2026
//***********************************************************************************
//   Description: changing of privilege modes from m to s to u
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

start1:
    li		t0, (1<<11)		//mpp=01(supervisor)
    csrs	mstatus, t0

    la		t0, s_mode_start	//entry of s-mode
    csrw	mepc, t0		

    mret				//return to lower privilege


s_mode_start:
    li		t0, (1<<8)		
    csrc	sstatus, t0		//spp=0(user)

    la		t0, u_mode_start	//entry of u-mode
    csrw	sepc, t0

    sret


u_mode_start:
    nop
//  j u_mode_start    

 TEST_PASSFAIL

RVTEST_CODE_END

	.data
RVTEST_DATA_BEGIN
	TEST_DATA

RVTEST_DATA_END



