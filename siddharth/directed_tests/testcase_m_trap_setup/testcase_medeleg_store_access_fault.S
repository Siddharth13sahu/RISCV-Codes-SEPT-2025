//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Siddharth Sahu 
 
//   Item : testcase_medeleg_store_access_fault 
//   Date created : 19/01/2026
 
//***********************************************************************************
//   Description: Testcase says creating and handling store access fault in S-mode
//***********************************************************************************


#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64M
RVTEST_CODE_BEGIN

machine_entry:
      
      la   x4, supervisor_entry
      csrw mepc, x4
      
      csrr x5, mstatus
      li   x6, ~(3 << 11)   //mstatus.mpp=2'b01 for jump to S-mode 
      and  x5, x5, x6       //mstatus.mpp=2'b00 for jump to U-mode
      li   x6, (1 << 11)
      or   x5, x5, x6
      csrw mstatus, x5
 
      csrr x10, medeleg
      li x9, 0x80 
      or x10, x10, x9

      csrw medeleg, x10
      csrr x15, medeleg

      la x10, m_exp_handler
      csrw mtvec, x10

      mret 

checker:
  add x4, x0, 7

  beq x5, x4, label_pass

  jal x1, fail

supervisor_entry:
      csrr x5, sstatus 
      
      la x10, s_exp_handler
      csrw stvec, x10
      
store_misaligned_addr:
      li x4, 0x80002000

      sw x5, -19(x4)

      
no_exception:
      nop
      nop
      jal x0,label_pass


.align 4
s_exp_handler:
      la x9, checker
      csrr x5,scause
      csrr x12,sepc        
      //addi x12,x12,4      

      csrw sepc, x9

      sret

label_pass:
      li x10,0x80000004
      csrw stvec,x10 
      jal x1, pass

m_exp_handler:
      
      li x10,0x80000004
      csrw mtvec,x10 
      la x9, fail
      csrw mepc, x9

      mret
      

      

  
 
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







