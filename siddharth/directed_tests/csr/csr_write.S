//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Siddharth Sahu 
 
//   Item : CSR write
//   Date created : 11/07/2025
 
//***********************************************************************************
//   Description: Testcase says floating point instructions based on RV32F ISA
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
      
      
      

      ld x6, 0x18(x4) 
      csrr x5, marchid
      //csrw marchid, x6 //non-writable
      //csrr x5, marchid

      csrr x5, mvendorid
      //csrw mvendorid, x6 //non_writable
      //csrr x5, mvendorid
      
      csrr x5, mimpid
      //csrw mimpid, x6 //non_writable
      //csrr x5, mimpid
      
      csrr x5, mhartid
      //csrw mhartid, x6 //non_writable
      //csrr x5, mhartid

      csrr x5, mstatus
      ld x6, 0x8(x4) 
      csrw mstatus, x6
      csrr x5, mstatus
  


 
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




