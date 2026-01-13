//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item : slli_srli_srai_instruction

//   Date created : 11/07/2025

//***********************************************************************************
//   Description: logical shift left instruction with an immediate value 
//***********************************************************************************

#include "test_macros.h"

#include "riscv_test.h"
 
RVTEST_RV64M

RVTEST_CODE_BEGIN


start:
	li		x5,	0xFFFFFFFF
	li		x6,	0x7FFFFFFF
	li		x8,	0xffffffff
	li		x9,	0x00000001

Test1:
	addiw	x28,	x5,	1

Test2:
	addiw x29,	x5,	-1

Test3:
	addiw x30,	x6,	1

Test4:
	addw	x31,	x5,	x6

Test5:
	subw	x28,	x8,	x9

 
	TEST_PASSFAIL
 
RVTEST_CODE_END
 
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END

