//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Siddharth Sahu 
 
//   Item : arithmatic 
//   Date created : 11/07/2025
 
//***********************************************************************************
//   Description: Testcase says 
//***********************************************************************************


#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV32M
RVTEST_CODE_BEGIN

add:
	lui x5, 0xabcde
	addi x5, x5, 0x123
	
	addi x6, x0, 0x456
	
	add x7, x5, x6

sub:
	sub x7, x6, x5

logical:
	addi x5, x0, 0x123
	addi x6, x0, 0x456

	or x7, x5, x6
	and x7, x5, x6
	xor x7, x5, x6
	
	ori x7, x5, 0x000
	andi x7, x5, 0x000
	xori x7, x5, 0x000

set:
	addi x5, x0, 0x3
	addi x6, x0, 0x5
	
	slt x8, x5, x6
	
	addi x6, x0, -2
	
	slt x8, x5, x6
	sltu x8, x5, x6

	slti x8, x5, -2
	sltiu x8, x5, -2
	

shift:
	lui x5, 0xfffff
	srai x6, x5, 0x2
	addi x7, x0, 2
	sra x6, x5, x7
	
	addi x5, x0, 0x7ff
	srli x6, x5, 2
	slli x6, x5, 2
	srl x6, x5, x7
	sll x6, x5, x7
	

  
 
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

