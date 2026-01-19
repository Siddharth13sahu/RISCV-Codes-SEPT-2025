//*********************************************************************
//	Copyright 2026 Scaledge India Pvt Ltd - ALl RIghts REserved.
//	Owner: Samarth Patnaik
// 	Item : csr_medeleg_u_ecall
//	Date created : 16/01/26
//*********************************************************************
//	Description : This testcase verifies that the ecall exception is correct delegated from U-Mode to S-Mode using medeleg register.
//********************************************************************
#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64MF
RVTEST_CODE_BEGIN

test_set_medeleg:
    li t0, (1<<80)	//8--> Ecall from U-Mode
    csrw medeleg, t0
    csrr t0, medeleg 	

test_set_stvec:
    la t0, s_trap_handler
    csrw stvec, t0

test_mode_change:
    csrr t0, mstatus
    li t1, ~(3<<11)
    and t0, t0, t1
    //li t1, (1<<11)
    ///or t0, t0, t1
    csrw mstatus, t0

test_set_mepc:
    la t0, s_mode_start
    csrw mepc, t0

    mret

u_mode_start:
    
    ecall
	
    //If test fails
    li t2, 0x99999999
    j end_test 

s_trap_handler:
    csrr t0, scause
    li t1,9
    bne t0, t1, gen

    j end_test

gen:
    ebreak

end_test:
    li t0, 0x80000004
    csrw stvec, t0
    ebreak

  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:
  .word 0x06627912
  .word 0x06627912
  .word 0x584944fc
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
