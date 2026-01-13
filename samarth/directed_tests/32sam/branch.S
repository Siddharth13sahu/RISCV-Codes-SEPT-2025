//*********************************************************************
//	Copyright 2025 Scaledge India Pvt Ltd - ALl RIghts REserved.
//	Owner: Samarth Patnaik
// 	Item : fc_rv32i_isa
//	Date created : 11/07/2025
//*********************************************************************
//	Description : Testcase says dividing two values using arithematic right shift
//*********************************************************************
#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32U
RVTEST_CODE_BEGIN

test_case_1:
	li x1, 10
	li x2, 20
	li x3, -10
	
	beq x1,x3,beq_taken
	li x4,0

	bne x1,x2,bne_taken
	li x4,0

	blt x1,x3,blt_taken
	li x4,0
	
	bltu x1,x3,bltu_taken
	li x4,0

	bgeu x1,x2,bgeu_taken
	li x4,0

	bge x1,x3,bge_taken
	li x4,0

beq_taken: 
	li x4,1
bne_taken: 
	li x4,1
blt_taken: 
	li x4,1
bltu_taken: 
	li x4,1
bgeu_taken: 
	li x4,1
bge_taken: 
	li x4,1


  TEST_PASSFAIL

RVTEST_CODE_END

func:
	li x2,2
	jalr x0,x1,0

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
