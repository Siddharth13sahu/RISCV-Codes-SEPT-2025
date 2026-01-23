//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Auroshree Anuvab Raj
 
//   Item : rv64i- r and i type instruction
 
//   Date created : 11/07/2025
 
//***********************************************************************************
//   Description: all i type and r type instructions in the rv64i instruction set
//***********************************************************************************
 
 
#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV64M
RVTEST_CODE_BEGIN
  li gp, 3
 
 
start:
//the testintention isto sub,addimmediate with a negative number
 
 
Test1:
	la  	x10,	val
	lw  	x5,	0(x10)
	lwu 	x6,	0(x10)

Test2:	//load and store
	la 	x28,	inp_data
	ld 	x29,	0(x28)	//load 64-bit data from memory[x28] into x29
	sd 	x29,	8(x28)	//store x29 in the memory[x28+4]
 
 

  TEST_PASSFAIL
RVTEST_CODE_END
  .data
	val: .word  0xFFFFFFF0            //4294967280(unsigned) -16(signed)
//num: .dword 0x1122334455667788    //8 byte data
RVTEST_DATA_BEGIN
 
 
  TEST_DATA
 
inp_data:
  .dword 0x1122334455667788
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
