//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Siddharth Sahu 
 
//   Item : testcase_mtval_ecall
//   Date created : 19/01/2026
 
//***********************************************************************************
//   Description: Testcase says value in mtval after ecall
//***********************************************************************************


#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64MF
RVTEST_CODE_BEGIN

float: 
      li x4,0x80002000
      
      la x9, etrap
      csrw mtvec, x9

      ld x6, 0x19(x4) 
      
	  nop
	  nop
	  nop
	  nop

checker:
  add x4, x0, 0xb

  beq x5, x4, label_pass

  jal x1, fail

.align 4     
etrap: 
      csrr x5, mcause
      csrr x5, mtval
      la x9, checker
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
  .word 0x28cb8c74
  .word 0x28cb8c74
 
RVTEST_DATA_END









