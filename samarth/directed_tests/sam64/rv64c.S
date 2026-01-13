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

RVTEST_RV32UF
RVTEST_CODE_BEGIN

la x12, sample
la x2, sample
test_c.ld:
	c.ld x8, 0(x12)
test_c.subw:
	li x13, 100
	c.subw x8, x13
test_c.addiw:
	c.addiw x13,27
test_c.addw:
	c.addw x13,x15
test_c.sd:
	c.sd x9, 16(x12)
test_c.ldsp:
	c.ldsp x3, 0(x2) 
test_c.sdsp:	
	li x3,100
	c.sdsp x3, 0(x2)
  TEST_PASSFAIL

RVTEST_CODE_END
  .data
RVTEST_DATA_BEGIN
  TEST_DATA
sample:
  .dword 12343
inp_data:
  .word 0x06627912
  .word 0x06627379
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
