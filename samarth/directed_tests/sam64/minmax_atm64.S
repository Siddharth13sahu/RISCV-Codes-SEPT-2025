//*********************************************************************
//	Copyright 2025 Scaledge India Pvt Ltd - ALl RIghts REserved.
//	Owner: Samarth Patnaik
// 	Item : fc_rv32i_isa
//	Date created : 11/07/2025
//*********************************************************************
//	Description : Testcase says the logical operations between two values.
//*********************************************************************
#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32U
RVTEST_CODE_BEGIN

test_case_1:
	la x1, inp_data
	li x2, 0x03131222
	li x3, 0xffffff12
	amomin.d x5, x2, (x1)
test_case_2:
	ADDI x1,x1,4
	amomax.d x5, x2, (x1)
test_case_3:
	ADDI x1,x1,4
	amominu.d x5, x3,(x1)
test_case_4:
	ADDI x1,x1,4
	amomaxu.d x5, x3,(x1)

  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


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
