//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Siddharth Sahu 
 
//   Item : rv64a insts 
//   Date created : 12/11/2025
 
//***********************************************************************************
//   Description: Testcase says about the atomic inst based on RV64A 
//***********************************************************************************


#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV32U
RVTEST_CODE_BEGIN

load:
	li x5, 0x80002000
	lr.d x6, (x5)

store: 
	li x6, 0xffffffff
	sc.d x7, x6, (x5)

atomic:
	
	li x6, 0x12345678
	amoswap.d x7, x6, (x5)
	amoadd.d x7, x6, (x5)
	amoxor.d x7, x6, (x5)
	amoor.d x7, x6, (x5)
	amoand.d x7, x6, (x5)
	amomin.d x7, x6, (x5)
	amomax.d x7, x6, (x5)
	amominu.d x7, x6, (x5)
	amomaxu.d x7, x6, (x5)

	
	

  
 
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




