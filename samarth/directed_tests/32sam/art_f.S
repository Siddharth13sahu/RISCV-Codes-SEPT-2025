//*********************************************************************
//	Copyright 2025 Scaledge India Pvt Ltd - ALl RIghts REserved.
//	Owner: Samarth Patnaik
// 	Item : fc_rv32f_isa
//	Date created : 13/07/2025
//*********************************************************************
//	Description : Testcase says arithematic caluclation of different floating bit registers 
//*********************************************************************
#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32UF
RVTEST_CODE_BEGIN

	la x1, sample
	flw f1, 0(x1)
	flw f2, 4(x1)
	flw f3, 8(x1)
test_fmadd.s:
	fmadd.s f5, f1,f2,f3
test_fmsub.s:
	fmsub.s f5, f1,f2,f3	
test_fnmadd.s:
	fnmadd.s f6,f1,f2,f3
test_fnmsub.s:
	fnmsub.s f6, f1,f2,f3
test_fadd.s:
	fadd.s f7, f1, f2
test_fsub.s:
	fsub.s f7, f1, f3
test_fmul.s:
	fmul.s f8, f2, f3
test_fdiv.s:
	fdiv.s f8, f3, f1
test_fsqrt.s:	
	fsqrt.s f9, f1
  TEST_PASSFAIL

RVTEST_CODE_END
  .data
RVTEST_DATA_BEGIN
  TEST_DATA
sample:
  .word 0x007fffff
  .word 0x00400000
  .float 12.12
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
