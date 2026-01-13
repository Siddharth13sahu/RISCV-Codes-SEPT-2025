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

RVTEST_RV64UF
RVTEST_CODE_BEGIN

la x1, sample
flw f1, 0(x1)
li x3, 20
test_fcvt.l.s:
	fcvt.l.s x5, f3
test_fcvt.lu.s:
	fcvt.lu.s x5, f3
test_fcvt.s.l:
	fcvt.s.l f5, x3
test_fcvt.s.lu:
	fcvt.s.lu f5, x3
  TEST_PASSFAIL

RVTEST_CODE_END
  .data
RVTEST_DATA_BEGIN
  TEST_DATA
sample:
  .float 4.0
  .float 3.67
  .float -1242.12
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
