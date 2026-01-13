//*********************************************************************
//	Copyright 2025 Scaledge India Pvt Ltd - ALl RIghts REserved.
//	Owner: Samarth Patnaik
// 	Item : fc_rv32m_isa
//	Date created : 11/07/2025
//*********************************************************************
//	Description : Testcase says multiplication of two 32-bit register values.
//*********************************************************************
#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32U
RVTEST_CODE_BEGIN

test_case_1:
	li x1,1000
	li x7, -5
	li x28, 0x12345678
	li x2, 0x1000
	mul x3,x1,x2
	mulh x4,x28,x2 //same order
	mulhu x5,x28,x2
	mulhsu x6,x28,x2
test_case_2:
	li x1,-3
	li x2,10
	mul x3,x1,x2
	mulh x4,x1,x2
	mulhu x5,x7,x2
	mulhsu x6,x1,x2
test_case_3:
	li x1,0x7FFFFFFF
	li x2,0x6FFFFFFF
	mul x3,x1,x2
	mulh x4,x1,x2
	mulhu x5,x7,x2
	mulhsu x6,x1,x2

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
