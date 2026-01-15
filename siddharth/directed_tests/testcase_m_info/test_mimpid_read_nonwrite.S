//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Siddharth Sahu 
 
//   Item : test_mimpid_read_nonwrite
//   Date created : 13/01/2026
 
//***********************************************************************************
//   Description: Testcase says about that mimpid is read-only csr
//***********************************************************************************


#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64MF
RVTEST_CODE_BEGIN


test_case:
      
      csrr x5, mimpid
      li x6, 0x1234
      csrw mimpid, x6 //non_writable
      csrr x5, mimpid
      

 
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






