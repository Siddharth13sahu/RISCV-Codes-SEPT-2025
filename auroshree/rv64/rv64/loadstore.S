//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Auroshree Anuvab Raj

//   Item : rv32i- load store instruction

//   Date created : 11/07/2025

//***********************************************************************************
//   Description: load and store of data into registers and memory
//***********************************************************************************


#include "test_macros.h"
 
#include "riscv_test.h"
RVTEST_RV32M
 
RVTEST_CODE_BEGIN
  li gp, 3

 .data:
mydata: .byte 0xFF    //defines a byte in the memory


start:
 
//the testintention isto sub,addimmediate with a negative number

Test1:        //logical instruction
addi x5,x0,8
addi x7,x0,11
and x28,x5,x7 
andi x5,x5,2
or x29,x5,x7
ori x7,x7,4
xor x30,x5,x7 
xori x31,x5,12

Test2:
la x3,mydata  //load address of mydata in the register
lb x2,x3   //load byte
lbu x5,x3     //load byte unsigned




 
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
