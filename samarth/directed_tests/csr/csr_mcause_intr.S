//*********************************************************************
//	Copyright 2026 Scaledge India Pvt Ltd - ALl RIghts REserved.
//	Owner: Samarth Patnaik
// 	Item : csr_mcause_intr
//	Date created : 19/01/2026
//*********************************************************************
//	Description : Testcase shows the behaviour of mcause register when a timer interrupt is generated in M-mode.
//*********************************************************************
#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64MF
RVTEST_CODE_BEGIN

.equ MTIME, 0x200bff8
.equ MTIMECMP, 0x2004000

test_read:
	csrr x1, mcause

test_mtvec:
	la x1, trap_handler
	csrw mtvec, x1

test_set_mie:
	li x1, (1<<7)
	csrw mie, x1

	li x1, (1<<3)
	csrr x2, mstatus
	or x1, x2, x1
	csrw mstatus, x1

test_intr_gen:
	li t0, MTIME
	ld x1, 0(t0)
	li x2, 100
	add x2, x2,x1
	li t1, MTIMECMP
	sd x2, 0(t1)

test_wait_intr:
	wfi
	j test_wait_intr		

.align 4
trap_handler:
	csrw mie, 0
	la x2, test_pass
	csrw mepc, x2
	csrr x5, mcause
	li x6, (1<<63)
	li x4, 7
	or x6, x6,x4		//Timer Interrupt
	bne x6, x5, test_fail
	mret

test_pass:
	li x1, 0x80000004
	csrw mtvec, x1
	ecall

test_fail:
	li x1, 0x80000004
	csrw mtvec, x1
	ebreak	
	
.align 4	

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
