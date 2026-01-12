//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Auroshree Anuvab Raj
 
//   Item : rv32i- branch instruction
 
//   Date created : 11/10/2025
 
//***********************************************************************************
//   Description: all branch instruction
//***********************************************************************************
 
 
#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV32M
RVTEST_CODE_BEGIN
  li gp, 3
 
 
start:
//the testintention isto sub,addimmediate with a negative number

Test1:                  //beq
	addi	x5, x0, 10
	addi	x6, x0, 10
	beq 	x5, x6, equal_label
	addi 	x7, x0, 5       # skipped
	equal_label:
	addi 	x7, x0, 99

Test2:                  //bne
	addi 	x5, x0, 13
	addi 	x6, x0, 10
	bne  	x5, x6, not_equal
	addi 	x7, x0, 15       # skipped
	not_equal:
	addi 	x7, x0, 81

Test3:                  //blt
	addi 	x5, x0, -12
	addi 	x6, x0, 11
	blt  	x5, x6, less
	addi 	x7, x0, 5       # skipped
	less:
	addi 	x7, x0, 99

Test4:                 //bge
	addi 	x5, x0, -6
	addi 	x6, x0, -7
	bge  	x5, x6, greater_equal
	addi 	x7, x0, 5       # skipped
	greater_equal:
	addi 	x7, x0, 99

Test5:                //bltu
	addi 	x5, x0, -5
	addi 	x6, x0, 4
	bltu	x5, x6, less_label
	addi 	x7, x0, 5       # skipped
	less_label:
	addi 	x7, x0, 99

Test6:                //bgeu
	addi	x5, x0, -2
	addi	x6, x0, -1
	bgeu	x5, x6, big_label
	addi	x7, x0, 5       # skipped
	big_label:
	addi	x7, x0, 99
 
 

  TEST_PASSFAIL
RVTEST_CODE_END
  .data
RVTEST_DATA_BEGIN
  
  TEST_DATA
 
inp_data:
  .word 0x06627912
  .word 0x06627912
  .word 0x584944fc
  .word 0x584944fc
  .word 0x558f5366
  .word 0x558f5366
  .word 0x29df2fb1
  .word 0x29df2fb1
  .word 0x40053e92
  .word 0x40053e92
  .word 0x17010699
  .word 0x17010699
  .word 0x594b9169
  .word 0x594b9169
  .word 0x64cd11c7
  .word 0x64cd11c7
  .word 0x6133a31e
  .word 0x6133a31e
  .word 0x2a9e3a3d
  .word 0x2a9e3a3d
  .word 0x59f86117
  .word 0x59f86117
  .word 0x39214611
  .word 0x39214611
  .word 0x6ec633f5
  .word 0x6ec633f5
  .word 0x4910a7b3
  .word 0x4910a7b3
  .word 0x3392ec72
  .word 0x3392ec72
  .word 0x6c3af175
  .word 0x6c3af175
  .word 0x74555adb
  .word 0x74555adb
  .word 0x360a50f7
  .word 0x360a50f7
  .word 0x39febbec
  .word 0x39febbec
  .word 0x28cb8c74
  .word 0x28cb8c74
RVTEST_DATA_END
