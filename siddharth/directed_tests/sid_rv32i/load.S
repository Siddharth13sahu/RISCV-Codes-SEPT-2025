//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Siddharth Sahu 
 
//   Item :  load 32 bit no.
//   Date created : 11/07/2025
 
//***********************************************************************************
//   Description: Testcase says about load and store operations of rv32i isa 
//***********************************************************************************


#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV32M
RVTEST_CODE_BEGIN

testcase: 
	li x5, 0xffff
	addi x5, x5, 0x123 

trial_store:
	li x5, 0x80002008
	//lui x5, 0x80000
	addi x6, x0, 0x100
//	sw x6, 0(x5)
	
trial_load: 
	ld x7, 0(x5)
la x10, inp_data
     
  
load: 
	lw x8, 0(x5)
	lh x8, 0(x5)
	lb x8, 0(x5)
 	lhu x8, 0(x5)
	lbu x8, 0(x5)

store:
	li x8, 0x12345678
	sw x8, 0(x5)
	sh x8, 4(x5)
	sb x8, 8(x5)

 
  TEST_PASSFAIL
 
RVTEST_CODE_END
 
  .data
 
RVTEST_DATA_BEGIN
  TEST_DATA
 
 
inp_data:
  .word 0x06627912
  .word 0x06627912
  .dword 0xffffabcdb849a4dc
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
