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

la x2, inp_data
la x8, inp_data
test_c.lwsp:
	c.lwsp x3, (8)(x2)
test_c.swsp:
	li x4, 0x12345678
	c.swsp x4, (8)(x2)
test_c.lw: //8-15
	c.lw x12, 0(x8)
test_c.sw:
	c.sw x12, 4(x8)
test_c.j:
	c.j new
	addi x12,x12,1000
	new:
		addi x12,x12,1
//test_c.jal:
//	c.jal ra,new1
//	li x5,1
//	new1:
//		jr ra
test_c.beqz:
	li x15,0
	c.beqz x15, new2
	li x15,12
 	new2:
		li x15,1
test_c.bnez:
	c.bnez x15, new3
	li x15,20
	new3: 
		li x15,0
test_c.li:
	c.li x8, 31 //any reg
test_c.lui:
	c.lui x9, 12
test_c.addi:
	c.addi x9,30 //x9=x9+(0-32)
test_c.addi16sp:
	c.addi16sp sp,16
//test_c.addi4spn:
//	c.addi4spn x9,16
test_c.slli:
	li x10,10
	c.slli x10, 3
test_c.srli:
	c.srli x10, 3
test_c.srai:
	c.srai x10, 3
test_c.andi:
	c.andi x10, 11
test_c.mv:
	c.mv x5, x10
test_c.add:
	c.add x5,x10
test_c.and:
	li x10, 121
	li x9, 42
	c.and x9, x10
test_c.or:
	li x10, 121
	li x9, 42
	c.or x9, x10
test_c.xor:
	li x10, 121
	li x9, 42
	c.xor x9, x10
test_c.sub:
	li x10, 121
	li x9, 42
	c.sub x9, x10
test_c.nop:
	c.nop
	
  TEST_PASSFAIL

RVTEST_CODE_END
  .data
RVTEST_DATA_BEGIN
  TEST_DATA

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
