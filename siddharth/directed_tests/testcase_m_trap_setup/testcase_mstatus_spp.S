//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Siddharth Sahu 
 
//   Item : test_mstatus_spp
//   Date created : 15/01/2026
 
//***********************************************************************************
//   Description: Testcase says about the mode jump from S->U
//***********************************************************************************


#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64SF
RVTEST_CODE_BEGIN

  
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
 
 
