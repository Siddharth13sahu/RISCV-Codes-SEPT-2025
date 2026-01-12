//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Siddharth Sahu 
 
//   Item : Compressed 32bit
//   Date created : 20/11/2025
 
//***********************************************************************************
//   Description: Testcase says floating point instructions based on RV32C ISA
//***********************************************************************************


#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64MF
RVTEST_CODE_BEGIN

stack:
	li x2, 0x80002000
	c.lwsp x5, 0x10(x2)
	c.swsp x5, 0x20(x2)

load_store:
	li x8, 0x80002000
	c.lw x9, 0(x8)
	c.sw x9, 0x4(x8)
	
	c.li x9, 0x13
	c.lui x9, 0x15

arith:
	c.sub x9, x8
	c.add x9, x8
	c.or  x9, x8
	c.xor x9, x8
	c.and x9, x8
	c.sub x9, x8

	c.addi x8, 0x3
	c.andi x8, 0xf
	c.addi16sp x2, -160
	//li x2, 0x80002000
	//c.addi4spn x9, 0x8

	c.srli x8, 0x3
	c.slli x8, 0x3
	c.srai x8, 0x3

	c.mv x10, x9


branch_equal: 
	c.beqz x8, label1
	c.nop
	c.li x8, 0xc

branch_not_equal: 
	c.bnez x8, label2
	c.li x8, 0xe

jump1:
//	c.jal label3

jump2:
	la x7, label4 
	c.jalr x7
	
jump3:
	la x7, label5 
	c.jr x7
	


label1:
	c.li x8, 0x5
	c.j branch_not_equal

label2:
	c.li x8, 0x7
	c.j jump1

label3:
	c.li x8, 0x6
	c.j jump2

label4:	
	c.li x8, 0x3
	c.j jump3

label5:	
	c.li x8, 0x2
	c.nop
	
	
 
TEST_PASSFAIL
 
RVTEST_CODE_END
 
  .data
 
RVTEST_DATA_BEGIN
  TEST_DATA
 
 
inp_data:
  .word 0xfff944fc
  .word 0xff800000
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





