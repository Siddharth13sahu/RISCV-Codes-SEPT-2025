
//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Siddharth Sahu 
 
//   Item : pseudo instructions 
//   Date created : 20/11/2025
 
//***********************************************************************************
//   Description: Testcase says about pseudo insts
//***********************************************************************************


#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64MF
RVTEST_CODE_BEGIN


random: addi x9, x0, 0x0011

test1:
	mv x5, x9    

     
test2:
	la x6, 0x12345678    

  
test3:
	li x6, 0xabcd1234
	sext.w x7, x6     
 

test4:
	neg x7, x6
	nop
	nop
	negw x7, x6     
 

test5:
	li x5, 0
	seqz x6, x5
	
	li x5, 5
	snez x6, x5
	
		
	li x5, -1 
	sltz x6, x5


	li x5, -1
	sgtz x6, x5

float:
	li x7, 0x80002000
	flw f0, 0x0(x7)
	fmv.s f1, f0
	
	li x7, 0x80002004
	flw f0, 0(x7)
	fabs.s f1, f0
	fneg.s f1, f0

	li x7, 0x80002000
	flw f0, 0(x7)
	fmv.d f1, f0
	
	li x7, 0x80002004
	flw f0, 0(x7)
	fabs.d f1, f0
	fneg.d f1, f0


branch1:
	li x5, 0
	beqz x5, label1
	li x6, 0x10

branch2:
	li x5, 1
	bnez x5, label2
	li x6, 0x11

branch3:
	li x5, 1
	bltz x5, label3
	li x6, 0x12

branch4:
	li x5, 1
	bgtz x5, label4
	li x6, 0x13

branch5:
	li x5, 5
	li x4, 3
	bgt x5, x4, label5
	li x6, 0x14

branch6:
	li x5, 5
	li x4, 3
	ble x5, x4, label6
	li x6, 0x15

branch7:
	li x5, -5
	li x4, -3
	bgtu x5, x4, label7
	li x6, 0x16

branch8:
	li x5, -5
	li x4, -3
	bleu x5, x4, label8
	li x6, 0x17


jump1:
	j jump2
	addi x5, x0, 2
	addi x5, x0, 3
	addi x1, x7, 0x13
	ret

jump2:
	auipc x7, 0
	addi x7, x7, -0xa
	jr  x7
	addi x1, x7, 0xc
	addi x5, x0, 5
	addi x5, x0, 6
	j label_stop
	

label1:
	addi x7, x0, 1
	j branch2

label2:
	addi x7, x0, 2
	j branch3

label3:
	addi x7, x0, 3
	j branch4

label4:
	addi x7, x0, 4
	j branch5

label5:
	addi x7, x0, 5
	j branch6

label6:
	addi x7, x0, 6
	j branch5

label7:
	addi x7, x0, 7
	j branch8

label8:
	addi x7, x0, 8
	j jump1

label_stop:
	nop


  TEST_PASSFAIL
 
RVTEST_CODE_END
 
  .data
 
RVTEST_DATA_BEGIN
  TEST_DATA
 
 
inp_data:
  .float 100.50
  .float -50.50
  .word 0x12345678
  .word 0x06627912
  .dword 0xffffabcd584944fc
  .word 0x584944fc
  .word 0x558f5366
  .word 0x558f5366
  .word 0x29df2fb1
  .word 0x360a50f7
  .word 0x360a50f7
  .word 0x39febbec
  .word 0x39febbec
  .word 0x28cb8c74
  .word 0x28cb8c74
 
RVTEST_DATA_END


