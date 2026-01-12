//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Auroshree Anuvab Raj
 
//   Item : rv32c and rv64c- compressed instruction
 
//   Date created : 11/20/2025
 
//***********************************************************************************
//   Description: all rv32c and rv64c compressed instruction
//***********************************************************************************
 
 
#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV64M
RVTEST_CODE_BEGIN
  li gp, 3
 
 
start:
//the testintention isto sub,addimmediate with a negative number

	la		sp,	test_stack_top   			//valid ram for sp

Test1:	//c.lwsp c.swsp c.lw c.sw
	la			x5,	inp_data
	addi		x2,	x2,	-28				//sp should never go upward
	c.swsp	x5,	28(sp)
	c.lwsp	x6,	28(x2)					//allowed offset::0, 4, 8, 12, 16, 20, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60
	addi		x2,	x2,	28
	la			x10,	inp_data					//compressed works only in x8-15
	c.lw		x8,	0(x10)
	c.sw		x8,	4(x10)

Test2:	//c.j
	c.j	jump
	li		x5,	100
jump:
	li		x5,	19

Test3:	//c.jr
	la		x6,	target
	c.jr	x6
	li		x7,	10
target:
	li		x7,	20

Test4:	//c.jal
	jal 	ra,	offset    //c.jal only works in rv32c
	li		x8,	100
offset:
	li		x8,	75

Test5:	//c.jalr
	la		x9,	jalr_tar
	c.jalr		x9
	li		x11,	23
jalr_tar:
	li		x11,	20

Test6:	//c.beqz	c.bnez
	li				x10,	0
	c.beqz		x10,	off1
	li				x12,	11
off1:
	li				x12,	45
	c.bnez		x10,	off2
	li				x13,	33
off2:
	li				x13,	12

Test7:	//c.addi	c.addi16sp  c.addi4spn
	li				x10,	100
	c.addi		x10,	-3
	c.addi16sp 	x2,	160				//mutiple of16 upto 256
//	c.addi4spn	x14,	64 				//rd--->{x8-15}   imm==multiple of 4 upto 252

Test8:	//c.slli	c.srli c.srai
	li				x11,	4
	c.slli		x11,	2
	li				x10,	48
	c.srli		x10,	3
	li				x9,	-44
	c.srai		x9,	1

Test9:	//c.andi	c.add	c.and	c.or	c.xor	c.sub
	c.andi	x9,	-14
	c.andi	x8,	14
	c.add		x12,	x9
	c.and		x13,	x8
	c.or		x14,	x12
	c.xor		x15,	x9
	c.sub		x12,	x8
	c.mv		x9,	x8

Test10:	//c.lui		c.li
	c.lui		x10,	12					//in rv64 assembler forbits to take -ve number for some registers  allowed(x1,x2,x3,x4)  Because the compressed LUI immediate is sign-extended, and RV64                                    forbids using c.lui to create a sign-extended 64-bit negative value for most registers.
	c.li		x11,	-20
	

  TEST_PASSFAIL
RVTEST_CODE_END
  .data
RVTEST_DATA_BEGIN
  
  TEST_DATA
 
inp_data:
  .word 0xDEADBEEF
  .word 0x06627912
  .word 0xabcd1234
  .word 0x584944fc
  .word 0x584944fc
  .word 0x558f5366
  .word 0x558f5366
  .word 0x29df2fb1
  .word 0x29df2fb1
  .word 0x40053e92
  .word 0x40053e92
  .word 0x99999999
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


	.balign
	test_stack:
		.space 256
	test_stack_top:
