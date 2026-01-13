//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item : srai_instruction

//   Date created : 11/07/2025

//***********************************************************************************
//   Description: arithmetic shift right instruction with an immediate value 
//***********************************************************************************

#include "test_macros.h"

#include "riscv_test.h"
 
RVTEST_RV32M

RVTEST_CODE_BEGIN


start:
 
li x6,320
li x7,-230

test1:
srai x30,x6,6

test2:
[100]srai x31,x7,6
[101]srai x31,x7,6
[102]srai x31,x7,6
 
TEST_PASSFAIL
 
RVTEST_CODE_END
 
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
