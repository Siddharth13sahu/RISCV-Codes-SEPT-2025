//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Siddharth Sahu 
 
//   Item : test_sstatus_spp
//   Date created : 20/01/2026
 
//***********************************************************************************
//   Description: Testcase says about the mode jump from M->S->U
//***********************************************************************************


#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64MF
RVTEST_CODE_BEGIN

       
machine_entry:
      addi x3, x0, 0x1 //control bit, if x3=1, M->S, else M->U 
      
      la   x4, user_entry
      csrw mepc, x4

      csrr x5, mstatus
      li   x6, ~(3 << 11)   //mstatus.mpp=2'b01 for jump to S-mode 
      and  x5, x5, x6       //mstatus.mpp=2'b00 for jump to U-mode
      
      csrr x5, mstatus
      li   x6, ~(1 << 8)    //sstatus.spp=1'b1 for jump to S-mode and 1'b0 for U-mode
      and  x5, x5, x6
      csrw mstatus, x5
      
      bez x3, x0, label

machine_to_super:
      li   x6, (1 << 11)
      or   x5, x5, x6
      
      la   x4, supervisor_entry
      csrw mepc, x4

label:
      csrw mstatus, x5
      csrr x7, mstatus
      
      mret

  
supervisor_entry:
      csrr x5, sstatus

      la x4, user_entry
      csrw sepc, x4

      csrr x5, sstatus
      li   x6, ~(1 << 8)
      and  x5, x5, x6
      csrw sstatus, x5
      csrr x7, sstatus
      
      //csrr x7, mstatus // trying to access M-mode regs
      
      sret


user_entry:
      addi x8, x0, 5

      ret

 
TEST_PASSFAIL
 
RVTEST_CODE_END
 
  .data
 
RVTEST_DATA_BEGIN
  TEST_DATA
 
 
inp_data:
  .float 100.25 //0
  .float 200.50 //4
  .dword 0x00000004 //8
  .float -200.50 //10
  .float -200.50 //10
  .dword 0xffffffffffffffff //14
  .word 0x584944fc
  .word 0x558f5366
  .word 0x558f5366
  
  
 
RVTEST_DATA_END

