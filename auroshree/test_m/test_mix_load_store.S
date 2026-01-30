
//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Auroshree Anuvab Raj

//   Item : rv64- load byte

//   Date created : 01/19/2026

//***********************************************************************************
//   Description: mixed load and store with walking address from address range of 0x80000000 - 0x80002000
//***********************************************************************************


#include "test_macros.h"
 
#include "riscv_test.h"
RVTEST_RV64M
 
RVTEST_CODE_BEGIN




start: 
li		x10,	0x80000000		//start address
li		x11,	0x80002000		//end address
Test1:
li		x5,	0x80000000
li		x6,	0xDEADBEEF12345678
li		x7,	0x11225588
li		x8,	0x3333
li		x9,	0xAA
load_store_mix:
//store
sd		x6,	0(x5)
sw		x7,	6(x5)
sh		x8,	2(x5)
sb		x9,	1(x5)
//load
ld		x12,	0(x5)
lw		x13,	4(x5)
lh		x14,	2(x5)
lb		x15,	1(x5)
addi	x5,	x5,	8		//maximum overlap
addi	x6,	x6,	3
addi	x7,	x7,	3
addi	x8,	x8,	3
addi	x9,	x9,	3
bltu	x5,	x11,		load_store_mix




 
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


