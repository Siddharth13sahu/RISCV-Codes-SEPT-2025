
//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Siddharth Sahu 
 
//   Item :  load 32 bit no.
//   Date created : 11/07/2025
 
//***********************************************************************************
//   Description: Testcase says about load and store operations of rv32i isa 
//***********************************************************************************


#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV32M
RVTEST_CODE_BEGIN


random: addi x9, x0, 0011

test1:
	addi x5, x0, 5     
	addi x6, x0, 5     
	beq x5, x6, label1 //jump
	addi x7, x0, 1     

     
test2:
	addi x5, x0, 5     
	addi x6, x0, 5     
	bne x5, x6, label2 //no jump
	addi x7, x0, 2     

  
test3:
	addi x5, x0, 5     
	addi x6, x0, 6     
	blt x5, x6, label3 //jump
	addi x7, x0, 3     
 

test4:
	addi x5, x0, 5     
	addi x6, x0, 6     
	bge x5, x6, label4 //no jump
	addi x7, x0, 4     
 

test5:
	addi x5, x0, -5     
	addi x6, x0, -6     
	bgeu x5, x6, label5 //jump
	addi x7, x0, 5     


test6:
	addi x5, x0, -5     
	addi x6, x0, -6     
	bltu x5, x6, label6 // no jump
	addi x7, x0, 6

     
test7:
	jal x1, label7 
	addi x7, x0, 7


test8:
	auipc x5, 0x00
	jalr x1, x5, 0x8
	addi x7, x0, 8   //4
	add x10, x0, 5   //8

	//ebreak	
	add x9, x0, 5    //c
	ret
label1: addi x8, x0, 1
	j test2

label2: addi x8, x0, 2
	j test3

label3: addi x8, x0, 3
	j test4

label4: addi x8, x0, 4
	j test5

label5: addi x8, x0, 5
	j test6

label6: addi x8, x0, 6
	j test7

label7: addi x8, x0, 7
	j test8

	//.org 0x2100
	//addi x8, x0, 8
	//ret 

 

  TEST_PASSFAIL
 
RVTEST_CODE_END
 
  .data
 
RVTEST_DATA_BEGIN
  TEST_DATA
 
 
inp_data:
  .word 0x06627912
  .word 0x06627912
  .dword 0xffffabcd584944fc
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

