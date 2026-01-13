//*********************************************************************
//	Copyright 2025 Scaledge India Pvt Ltd - ALl RIghts REserved.
//	Owner: Samarth Patnaik
// 	Item : fc_rv32i_isa
//	Date created : 11/07/2025
//*********************************************************************
//	Description : Testcase about mstatus, multiple operations
//*********************************************************************
#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64MF
RVTEST_CODE_BEGIN

.equ MTIME, 0x200bff8
.equ MTIMECMP, 0x2004000

test_read_mie:
	la x1, test_trap
	csrw mtvec, x1
	csrr x2, mie 
	
test_set_mie:
	li x3, (1<<7)
	csrw mie, x3  //for mie

	csrr x4, mstatus
    	li x5, (1<<3)
    	or x4, x4, x5
    	csrw mstatus, x4 //mie for mstatus
	
test_intr_gen:
	li t0, MTIME
	ld x1, 0(t0)
	li x2, 1000
	add x2, x2,x1
	li t1, MTIMECMP
	sd x2, 0(t1)

test_wait_intr:
	wfi
	j test_wait_intr
	
.align 4
test_trap:
	csrr x5, mcause
	li x3,1234 // trap generated indefinitely

test_clear_trap:
	csrw mie, x0
	li x1, 0x80000004
	csrw mtvec, x1
	



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
