//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Auroshree Anuvab Raj

//   Item : rv32i- r-type and i-type instruction

//   Date created : 11/07/2025

//***********************************************************************************
//   Description: arithmatic instruction between two registers and one register and an immediate
//***********************************************************************************
 

# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32U
RVTEST_CODE_BEGIN


start:
	li gp, 3

Test1:         //add
	addi	x5,	x0,	10
	addi 	x6,	x0,	5
	add 	x7,	x5,	x6

Test2:         //sub
	addi	x28,	x0,	24
	addi 	x29,	x0,	32
	sub	x30,	x28,	x29
	sub	x31,	x29,	x28

Test3:         //shift and arithmatic operation
	addi 	x8,	x0,	7
	addi 	x9,	x0,	2
	addi 	x5,	x0,	-3
	sll 	x10,	x8,	x9  	//shift left logical(x8<<x9)
	srl 	x11,	x8,	x9  	//shift right logical(x8>>x9)
	sra 	x12,	x8,	x5  	//shift right arithmatic(x8>>>x5)
	sltu 	x7,	x5,	x8  	//set less than unsigned 
	slt 	x6,	x5,	x8    //set less than signed

Test4:         //logical instruction
	addi 	x5,	x0,	8
	addi 	x7,	x0,	11
	and 	x28,	x5,	x7 
	andi 	x5,	x5,	2
	or 	x29,	x5,	x7
	ori 	x7,	x7,	4
	xor 	x30,	x5,	x7 
	xori 	x31,	x5,	12



                                                                                                                                    






 
  TEST_PASSFAIL

RVTEST_CODE_END


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
  .word 0x00000000
  .word 0x594b9169
  .word 0x594b9169
  .word 0x11111111
  .word 0x64cd11c7
  .word 0x64cd11c7
  .word 0x6133a31e
  .word 0xFFFFFFFF
  .word 0x6133a31e
  .word 0x2a9e3a3d
  .word 0x2a9e3a3d
  .word 0x59f86117
  .word 0x59f86117
  .word 0xDEADBEEF
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
