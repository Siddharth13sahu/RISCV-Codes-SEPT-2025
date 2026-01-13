//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : bltu_instruction
//   Date created : 07/11/2025
//***********************************************************************************
//   Description: Testcase says 
//***********************************************************************************
 
#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32M
RVTEST_CODE_BEGIN

    start:
        li	x5,	5
        li	x6,	10
       
    test1:
        bltu	x5,	x6,	taken
        li	x7,	1

    taken:
        li	x7,	2         

		TEST_PASSFAIL
RVTEST_CODE_END

    .data
RVTEST_DATA_BEGIN
    TEST_DATA
    .word	0x12345678
RVTEST_DATA_END

