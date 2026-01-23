//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Siddharth Sahu 
 
//   Item : Machine information Registers CSRs read and write
//   Date created : 11/07/2025
 
//***********************************************************************************
//   Description: Testcase says about Machine information Registers CSRs read and write
//***********************************************************************************


#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64MF
RVTEST_CODE_BEGIN

test: 
      li x4,0x80002000
	    fld f0, 0x8(x4)
	    fld f1, 0x8(x4)
	    flw f0, 0(x4)
	    flw f1, 0x4(x4)
     
      li x6, 0x12345678
	    amoswap.d x7, x6, (x4)
      
      csrr x5, marchid
      csrr x5, mvendorid
      csrr x5, mimpid
      csrr x5, mhartid
      csrr x5, misa

      li x6, (1<<7)
      or x5, x5, x6
      csrw misa, x5


      li x5, 0xffff
      csrw mie, x5
      csrw mip, x5
      csrw sie, x5
      csrw sip, x5
      csrw sepc, x5

      csrr x5, mie
      csrr x5, mip
      csrr x5, sie
      csrr x5, sip
      csrr x5, sepc

      csrr x5, pmpcfg0
      j pass


  
 
TEST_PASSFAIL
 
RVTEST_CODE_END
 
  .data
 
RVTEST_DATA_BEGIN
  TEST_DATA
 
 
inp_data:
  .float 100.25
  .float 200.50
  .dword 0x0000000000000000
  .float -200.50
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



