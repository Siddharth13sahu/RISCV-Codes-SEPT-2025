//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Siddharth Sahu 
 
//   Item : test_sstatus_fs
//   Date created : 20/01/2026
 
//***********************************************************************************
//   Description: Testcase says about variation of FS bit in sstatus.
//***********************************************************************************


#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64MF
RVTEST_CODE_BEGIN


machine_entry:
      
      csrr x5, mstatus
      li   x6, ~(3 << 11)   //mstatus.mpp=2'b01 for jump to S-mode 
      and  x5, x5, x6       //mstatus.mpp=2'b00 for jump to U-mode
      
      li   x6, (1 << 11)
      or   x5, x5, x6
      
      la   x4, supervisor_entry
      csrw mepc, x4
      
      mret

  
supervisor_entry:
      csrr x5, sstatus

      li x4,0x80002000
	    fld f0, 0x8(x4)
	    fld f1, 0x8(x4)
	    flw f0, 0(x4)
	    flw f1, 0x4(x4)
     
      csrr x5, sstatus
      
      ld x6, 0x18(x4) 
	    amoswap.d x7, x6, (x4)

 j pass     

 
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







    

