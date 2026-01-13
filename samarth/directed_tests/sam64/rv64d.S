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
la x2, long_data
test_fcvt.l.d:
	fld f1, 0(x1)
	fcvt.l.d x3,f1
test_fcvt.lu.d:
	fld f1, 24(x1)
	fcvt.lu.d x3,f1
test_fcvt.d.l:
	ld x3, 0(x2)
	fcvt.d.l f1,x3
test_fcvt.d.lu:
	ld x3, 0(x2)
	fcvt.d.lu f1,x3
test_fmv.x.d:
	fld f1, 0(x1)
	fmv.x.d x4,f1
test_fmv.d.x:
	ld x3, 0(x2)
	fmv.d.x f1,x3


  TEST_PASSFAIL

RVTEST_CODE_END
  .data
RVTEST_DATA_BEGIN
  TEST_DATA
long_data:
  .dword 0x1234567898765432
sample:
  .double 4.99270
  .double 4
  .double 12.11232
  .double -20.9987
sample_s:
  .float 5.553
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
