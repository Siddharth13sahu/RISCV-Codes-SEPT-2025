//*********************************************************************
//	Copyright 2025 Scaledge India Pvt Ltd - ALl RIghts REserved.
//	Owner: Samarth Patnaik
// 	Item : fc_rv32i_isa
//	Date created : 11/07/2025
//*********************************************************************
//	Description : Testcase says the use of loading and storing in RV32A, in a loop for all the values
//*********************************************************************
#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32U
RVTEST_CODE_BEGIN
	li x28,0
test_case_1:	
	la x1,inp_data
	add x1,x1,x28
	lr.d x2, 0(x1)
	addi x2, x2, 4
	sc.d x3, x2, 0(x1)
	addi x28,x28,4
	beq x3,x0,test_case_1


  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA
sample:
  .dword 0x12345673
inp_data:
  .dword 0x06627912
  .dword 0x06627912
  .dword 0x584944fc
  .dword 0x584944fc
  .dword 0x558f5366
  .dword 0x558f5366
  .dword 0x29df2fb1
  .dword 0x29df2fb1
  .dword 0x40053e92
  .dword 0x40053e92
  .dword 0x17010699
  .dword 0x17010699
  .dword 0x594b9169
  .dword 0x594b9169
  .dword 0x64cd11c7
  .dword 0x64cd11c7
  .dword 0x6133a31e
  .dword 0x6133a31e
  .dword 0x2a9e3a3d
  .dword 0x2a9e3a3d
  .dword 0x59f86117
  .dword 0x59f86117
  .dword 0x39214611
  .dword 0x39214611
  .dword 0x6ec633f5
  .dword 0x6ec633f5
  .dword 0x4910a7b3
  .dword 0x4910a7b3
  .dword 0x3392ec72
  .dword 0x3392ec72
  .dword 0x6c3af175
  .dword 0x6c3af175
  .dword 0x74555adb
  .dword 0x74555adb
  .dword 0x360a50f7
  .dword 0x360a50f7
  .dword 0x39febbec
  .dword 0x39febbec
  .dword 0x28cb8c74
  .dword 0x28cb8c74

RVTEST_DATA_END
