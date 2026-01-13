//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : 32i_instruction
//   Date created : 07/11/2025
//***********************************************************************************
//   Description: Base integer instructions of 32 bits 
//***********************************************************************************
 
#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV32M
RVTEST_CODE_BEGIN
 
start: 
	li	x6,	40
	li	x7,	10
	li	x8,	20
	la	x5,	dta
	lw	x12,	0(x5)

test1:
	add		x10, x6, x7
	sub		x10, x6, x7

	addi		x10, x10, 2

test2:
	sra		x6,	x7,	x8
	sll		x7,	x12,	x6
	srl		x6,	x12,	x8

test3:
	slt		x7,	x12,	x8
	sltu		x7,	x12, 	x6

test4:
	and		x9,	x7,	x8
	or		x8,	x12,	x6
	xor		x7,	x12,	x6

test5:
	addi		x29, 	x6, 	6 

test6:
	slti		x7,	x12, 7
	sltiu		x8,	x6,  10

test7:
	xori		x6,	x7,	1111
	andi		x8,	x6,	1111
	ori		x9,	x8,	1000

test8:
	slli		x6,	x12, 2
	srai		x6,	x12, 2
	srli		x6,	x12, 2

test9:
	lb		x7,	0(x5)
	lw		x7,	0(x5)
	lh		x7,	0(x5)
	lbu		x7,	0(x5)
	lhu		x7,	0(x5)

test10:		
	sw		x12,	0(x5);
	sh		x12,	0(x5);
	sb		x12,	0(x5);

test11:
	lui		x5,	0x12345
	auipc		x5,	0x12345

test12:
	jal		ra,	label1
	addi		x5,	x7,	5

label1:
	addi		x6,	x0,	6

test13:
	la		x8,	label2
	jalr		ra,	0(x8)

	addi		x7,	x5,	5

label2:
	add		x8,	x5,	x7


  TEST_PASSFAIL
 
RVTEST_CODE_END
 
  .data
 
RVTEST_DATA_BEGIN
  TEST_DATA
  dta:
  .word	0x06627912
RVTEST_DATA_END
