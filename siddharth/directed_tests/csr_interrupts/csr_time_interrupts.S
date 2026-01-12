//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Siddharth Sahu 
 
//   Item : timer interrupt


//   Date created : 11/07/2025
 
//***********************************************************************************
//   Description: Generating timer interrupt
//***********************************************************************************


#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64MF
RVTEST_CODE_BEGIN

.equ MTIME, 0x0200bff8
.equ MTIMECMP, 0x02004000


test_initial_read:

    csrr x7, mstatus
    csrwi mstatus, 0x8 //for MIE bit
    csrr x7, mstatus
    
    csrr x7, mie
    li x8, 0x80      // for MTIE bit
    csrw mie, x8
    csrr x7, mie
    
test_mip:
    csrr x7, mip
    li x5, 0xff
    csrw mip, x5 
    csrr x7, mip
    

    la x9, etrap
    csrw mtvec, x9

    li x5, MTIME
    //li x7, 0x100
    ld x8, 0x0(x5)
    
    li x6, MTIMECMP
    
    nop
    nop
    nop
    nop

    sd x8, 0x0(x6)

    li x5, MTIME
    ld x8, 0x0(x5)
loop:
    wfi
    csrr x10, mip
    beqz x10, loop

    nop
    nop
    la x9, pass
    csrw mepc,x9
    li x11, 0x80000004
    csrw mtvec, x11

.align 4
etrap: 
      csrr x5, mcause
      la x9, pass
      csrw mepc,x9
      li x5, MTIME
      ld x8, 0x0(x5)
      csrr x10, mip
      csrr x10, mstatus
      csrwi mie, 0x0
      csrr x10, mie
      li x11, 0x80000004
      csrw mtvec, x11
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

