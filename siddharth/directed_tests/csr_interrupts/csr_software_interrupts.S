//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Siddharth Sahu 
 
//   Item : software interrupt

//          ------------------FAILED, as spike is getting terminated b4 the loop completely iterated

//   Date created : 11/07/2025
 
//***********************************************************************************
//   Description: Generating software interrupt
//***********************************************************************************


#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64MF
RVTEST_CODE_BEGIN

test: 
      csrr x7, mstatus
      csrwi mstatus, 0x8
      csrr x7, mstatus
      
      csrr x7, mie
      csrwi mie, 0x8
      csrr x7, mie


      li x4,0x80002000
      
      la x9, etrap
      csrw mtvec, x9
      
      li x10, 0xffffff

branch1:
      addi x10, x10, -1
      csrr x11, mip
      bnez x10, loop1
      j label_pass


label:
      add x4, x0, 2

      beq x5, x4, label_pass

      jal x1, fail

.align 4
etrap: 
      csrr x5, mcause
      la x9, label
      //csrr x9,mepc
      //li x11,0x4
      //add x9,x9,x11
      csrw mepc,x9
      mret

label_pass:
      nop
      nop
      li x10,0x80000004
      csrw mtvec,x10 
      jal x1, pass


loop1:
      addi x10, x10, -1
      li x12, 0x10
      j branch1



  
 
TEST_PASSFAIL
 
RVTEST_CODE_END
 
  .data
 
RVTEST_DATA_BEGIN
  TEST_DATA
 
 
inp_data:
  .float 100.25 //0
  .float 200.50 //4
  .dword 0x00000000 //8
  .float -200.50 //10
  .float -200.50 //10
  .dword 0xabcdef6612345678 //14
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








