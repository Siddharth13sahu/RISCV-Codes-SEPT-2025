//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item : jal_jalr_instruction

//   Date created : 11/07/2025

//***********************************************************************************
//   Description: subtraction instruction 
//***********************************************************************************

#include "test_macros.h"

#include "riscv_test.h"
 
RVTEST_RV32M

RVTEST_CODE_BEGIN

	start:
		//initialise:
		//li gp,3
		//	
		//Test1:
		//jal x1, target 

		//Target:
		//addi x6, x0, 99    

		//Test2:
		//la x10, target1  
		//jalr x1, 0(x10)       
		//addi x5, x0, 1
		
		//end:
		//ebreak

		//Target1:
		//addi x6, x0, 2

	start:
    	li x5, 10

		Test1:
    	jal x1, target       

    	addi x6, x0, 5
	 	nop

		target:
    	addi x7, x5, 5
    	jalr x0, x1, 0

		Test2:	
    	la x10, func         # load address of func into x10
    	jalr x1, x10, 0      # jump to func, save return addr in x1

    	li x6, 99            # executes after returning from func
    	ebreak               # stop (for simulation)

		func:
    	li x5, 42
    	addi x5, x5, 1       # x5 = 43
    	jalr x0, x1, 0
	
	TEST_PASSFAIL
 
RVTEST_CODE_END
 
	// .data 
	
RVTEST_DATA_BEGIN

	TEST_DATA
 
RVTEST_DATA_END
