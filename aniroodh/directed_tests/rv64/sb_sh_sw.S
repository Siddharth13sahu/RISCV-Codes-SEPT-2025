//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item : sb_sh_sw_instruction

//   Date created : 11/07/2025

//***********************************************************************************
//   Description: subtraction instruction 
//***********************************************************************************

#include "test_macros.h"

#include "riscv_test.h"
 
RVTEST_RV32M

RVTEST_CODE_BEGIN

start:
initialise:
	li		gp,	3
	li		x5,	0x12349876  //data to be stored
	li		x8,	0x80002000  //initialise the registers with addrs
	li		x9,	0x80002004 
	li		x18,	0x80002008 	
		
Test1:
	sb		x5,	0(x8) // store byte

Test2:
	sh		x5,	0(x9) //store halfword

	Test3:
	sw		x5,	0(x18) //store word
	
	TEST_PASSFAIL
 
RVTEST_CODE_END
 
	.data 
	
RVTEST_DATA_BEGIN

	TEST_DATA
 
RVTEST_DATA_END
