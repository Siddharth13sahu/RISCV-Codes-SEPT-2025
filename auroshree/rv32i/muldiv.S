//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Auroshree Anuvab Raj
 
//   Item : rv32m- mul and div instruction
 
//   Date created : 11/10/2025
 
//***********************************************************************************
//   Description: all multipication and division instruction
//***********************************************************************************
 
 
#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV32M
RVTEST_CODE_BEGIN
  li gp, 3
 
 
start:
//the testintention isto sub,addimmediate with a negative number

Test1:      //mul
	addi 	x5, 	x0,	6
	addi 	x6, 	x0, 	-3
	mul	x7, 	x5, 	x6

Test2:      //mulh
	li 	x5, 	0x12345678
	li 	x6, 	0x1000
	mulh 	x7, 	x5, 	x6

Test3:      //mulhsu
	li 		x5, 	-2
	li 		x6, 	0xFFFFFFFF
	mulhsu 	x7, 	x5, 	x6

Test4:      //mulhu
	li 	x5, 	0xFFFFFFFF
	li 	x6, 	0xFFFFFFFF
	mulhu x7, 	x5, 	x6

Test5:      //div
	li 	x5, 	-10
	li 	x6, 	3
	div 	x7, 	x5, 	x6

Test6:      //divu
	li 	x5, 	-10       # 0xFFFFFFF6 unsigned = 4294967286
	li 	x6, 	3
	divu 	x7, 	x5, 	x6

Test7:      //rem
	li 	x5, 	-10
	li 	x6, 	3
	rem 	x7, 	x5, 	x6

Test8:      //remu
	li 	x5, 	-10       # 0xFFFFFFF6
	li 	x6, 	3
	remu 	x7, 	x5, 	x6

 
 

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
