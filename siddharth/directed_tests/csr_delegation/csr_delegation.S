//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Siddharth Sahu 
 
//   Item : Delegation 
//   Date created : 11/07/2025
 
//***********************************************************************************
//   Description: Testcase says floating point instructions based on RV32F ISA
//***********************************************************************************


#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64M
RVTEST_CODE_BEGIN



machine_entry:
      
      //csrr x8, mconfigptr
      la   x4, supervisor_entry
      csrw mepc, x4
      
      csrr x5, mstatus
      li   x6, ~(3 << 11)   //mstatus.mpp=2'b01 for jump to S-mode 
      and  x5, x5, x6       //mstatus.mpp=2'b00 for jump to U-mode
      li   x6, (1 << 11)
      or   x5, x5, x6
      csrw mstatus, x5
 
      csrr x10, medeleg
      li x9, 0x200 
      or x10, x10, x9

      csrw medeleg, x10
      csrr x15, medeleg

      la x10, m_exp_handler
      csrw mtvec, x10

      mret 

supervisor_entry:
      csrr x5, sstatus 
      
      la x10, s_exp_handler
      csrw stvec, x10

      ecall
      nop
      nop
      jal x0,label_pass
.align 4
s_exp_handler:
      la x9, label_pass
      csrr x11,scause
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







