//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Auroshree Anuvab Raj
 
//   Item : rv64i- shift instruction
 
//   Date created : 11/07/2025
 
//***********************************************************************************
//   Description: all shift instructions in the rv64i instruction set
//***********************************************************************************
 
 
#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV64M
RVTEST_CODE_BEGIN
  li gp, 3
 
 
start:
//the testintention isto sub,addimmediate with a negative number
 
 
Test1:	//slli
	li		x5,	-7
	slli	x6,	x5,	2	//x6=7<<2

Test2:	//srli
	li		x5,	0b10010110	//x5=150
	srli	x6,	x5,	4	//x6=150>>4

Test3:	//srai
	li		x5,	-60		//x5=-60
	srai	x6,	x5,	3	//x6=-60>>>3

Test4:	//slliw
	li		x5,	0x11111111	
	slliw	x6,	x5,	5

Test5:	//srliw
	li		x5,	0xDEADBEEF
	srliw	x6,	x5,	2

Test6:	//sraiw
	li		x5,	0x00000000
	sraiw	x6,	x5,	1

Test7:	//sllw
	li		x5,	0xAABBCCDDEEFF
	li		x7,	2	
	sllw	x6,	x5,	x7

Test8:	//srlw
	li		x5,	0xDEADBEEFBEEFDEAD
	li		x7,	4
	srlw	x6,	x5,	x7

Test9:	//sraw
	li		x5,	0x1111111100000000
	li		x7,	3
	sraw	x6,	x5,	x7

Test10:	//addw
	li		x5,	0xFFFFFFFF
	li		x6,	3
	addw	x7,	x5,	x6

Test11:	//subw
	li		x5,	0x00000000
	li		x6,	5
	subw	x7,	x5,	x6


	
  TEST_PASSFAIL
RVTEST_CODE_END
  .data
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
