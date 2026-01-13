//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : add_instruction
//   Date created : 07/11/2025
//***********************************************************************************
//   Description: Testcase says 
//***********************************************************************************
 
#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV32M
RVTEST_CODE_BEGIN
 
start: 
	li	x6,	4000
	li	x7,	10
	li	x8,	20

test1:
	add	x10, x6, x7

test2:
	add	x11, x8, x6  

test3:
	addi x29, x6, 6 

test4: 
	addi x30, x8, -12  

  TEST_PASSFAIL
 
RVTEST_CODE_END
 
  .data
 
RVTEST_DATA_BEGIN
  TEST_DATA
  .word	0x06627912
RVTEST_DATA_END
