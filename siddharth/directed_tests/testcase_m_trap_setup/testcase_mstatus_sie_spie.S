//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Siddharth Sahu 
 
//   Item : test_mstatus_sie_spie and test_mideleg_timer_interrupt
//   Date created : 15/01/2026
 
//***********************************************************************************
//   Description: Testcase says about that interrupt generated and handled in S-mode
//***********************************************************************************


#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64MF
RVTEST_CODE_BEGIN


.equ MTIME, 0x0200bff8
.equ MTIMECMP, 0x02004000


machine_entry:

    csrr x7, mstatus
    li x5, 0x80a
    or x5, x5, x7
    csrw mstatus, x5 //for SIE bit and MPP for S mode
    csrr x7, mstatus
      
    la x9, supervisor_entry
    csrw mepc,x9

    li x5, 0x20
    csrw mideleg, x5
    csrr x7, mideleg

    
    csrr x7, mie
    li x8, 0x20      //for STIE bit
    csrw mie, x8
    csrr x7, mie
    
    mret


    
supervisor_entry:    
    
    csrr x7, sstatus
    li x5, 0x02
    or x5, x5, x7
    csrw sstatus, x5 //for SIE bit 
    csrr x7, sstatus
    
    li x8, 0x20      //for STIE bit
    csrw sie, x8      //for STIE bit of sie
    csrr x7, sie


    la x9, etrap
    csrw stvec, x9
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
    csrr x10, sip
    beqz x10, loop

    nop
    nop
    la x9, pass
    csrw mepc,x9
    li x11, 0x80000004
    csrw mtvec, x11

.align 4
etrap: 
      csrr x5, scause
      la x9, pass
      csrw sepc,x9
      li x5, MTIME
      ld x8, 0x0(x5)
      csrr x10, sip
      csrr x10, sstatus
      csrwi sie, 0x0
      csrr x10, sie
      li x11, 0x80000004
      csrw stvec, x11
      sret

      

 
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







