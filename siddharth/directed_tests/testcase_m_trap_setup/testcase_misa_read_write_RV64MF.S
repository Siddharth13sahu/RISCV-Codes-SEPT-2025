  
//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Siddharth Sahu 
 
//   Item : test_misa_read_write_RV64MF
//   Date created : 16/01/2026
 
//***********************************************************************************
//   Description: Testcase says about the status of misa registers by varying the architecture and the extensions 
//***********************************************************************************


#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64MF
RVTEST_CODE_BEGIN


float: 
      
      csrr x5, mstatus

      li x4,0x80002000
	    fld f0, 0x8(x4)
	    fld f1, 0x8(x4)
	    flw f0, 0(x4)
	    flw f1, 0x4(x4)
     
      csrr x5, mstatus
      
      ld x6, 0x18(x4) 
	    amoswap.d x7, x6, (x4)
      
test1: 
      ld x6, 0x8(x4) 
      
      csrr x5, misa
      csrw misa, x6
      csrr x5, misa
      
      addi x6, x6, 0x40
      csrw misa, x6
      csrr x5, misa

      li x6, (1<<2) 
      csrw misa, x6
      csrr x5, misa
      
      li x6, (1<<3) 
      csrw misa, x6
      csrr x5, misa
      
      li x6, (1<<4) 
      csrw misa, x6
      csrr x5, misa
      
      csrw misa, x0
      csrr x5, misa
      

 
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




  
