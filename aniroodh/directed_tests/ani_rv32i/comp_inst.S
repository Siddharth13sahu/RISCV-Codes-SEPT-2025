//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item : floating_point_instructions

//   Date created : 13/11/2025

//***********************************************************************************
//   Description: compressed_instruction 
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

	li 		gp, 	3
	la			sp,	test_stack_top
start:
initialise:
	la			x5,	inp_data
//	addi		x2,	x2,	-28
	li			x14,	0x0000000080002030


Test1:									//c.lwsp_c.swsp (load-store from stack pointer)
	
	addi		x2,	x2,	-28
	c.swsp	x5,	28(x2)

	c.lwsp	x8,	28(x2)
	c.lwsp	x9,	28(x2)

	addi		x2,	x2,	28
		
Test2:									//load_store
	c.lw		x11,	0(x14)
	c.lw		x12,	4(x14)
	
	add		x13,	x11,	x12

	c.sw		x13,	12(x14)

Test3:									//jump_inst
	la			x8,	label
		
	c.j		label						//c.j
	li			x5,	100
	label:
	addi		x28,	x0,	1

//	c.jal		x1,	label1
	
	la			x9,	foo				//jalr
	c.jalr	x9
	li			x11,	56
	foo:
	li			x11,	10

	la			x6,	label1			//c.jr
	c.jr		x6
	li			x7,	16
	label1:
	li			x7,	20

Test4:									//conditional branch
	li			x10,	0
	c.beqz	x8,	target
	li			x9,	20
	c.beqz	x10,	target
	li			x9,	50
	target:
	li			x9,	60

Test5:									//load_immediate
	c.li		x6,	-2
	c.lui		x9,	3	
	
Test6:									//add_immediate
	c.addi	x30,	5
	c.addi	x31,	-3
	c.addi16sp		x2,	32
//	c.addi4spn		x10,	16
//	c.addi4spn 		x10, 16(x2)

Test7:									//shifting_instructions
	c.slli	x15,	4
	c.srai	x15,	4
	c.srli	x15,	4
	
Test8:									//and_instrucion
	c.andi	x11,	25
	c.and		x10,	x11

Test9:									//add_sub_instruction			
	c.add		x7,	x29
	c.sub		x15,	x10

Test10:									//or_instruction
	c.or		x8,	x8
	c.or		x8,	x9

Test11:
	li			x10,	2
	li			x11,	6

	c.xor		x8,	x8
	c.nop
	c.xor		x10,	x11





RVTEST_CODE_END
  .data
  

RVTEST_DATA_BEGIN
  
  TEST_DATA

inp_data:

  .word 0xABCD1234

  .word 0xFFFFFFFF

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

	.balign
	test_stack:
		.space 256
	test_stack_top:


