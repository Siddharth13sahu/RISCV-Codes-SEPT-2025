//*********************************************************************
//	Copyright 2026 Scaledge India Pvt Ltd - ALl RIghts REserved.
//	Owner: Samarth Patnaik
// 	Item : csr_scause_ld
//	Date created : 20/01/2026
//*********************************************************************
//	Description : Testcase shows the behaviour of scause register when a Load Address misaligned is generated in S-mode.
//*********************************************************************
#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64MF
RVTEST_CODE_BEGIN

test_read:
	csrr x1, mcause
test_store_mepc:
	la x2, test_sv_entry
	csrw mepc, x2
test_mtvec:
	la x1, trap_handler
	csrw mtvec, x1
test_mode_change:
	csrr x1, mstatus
	li x2, ~(3<<11)
	and x1,x2,x1
	li x3, (1<<11)	//S-Mode
	or x1, x3,x1
	csrw mstatus, x1
	mret

test_sv_entry:
	la x1, trap_handler
	csrw stvec, x1

test_trap_gen:
	li x1, 0
	lw x2, -1(x1) 	//ld Address misaligned

.align 4
trap_handler:
	la x1, test_pass
	csrw mepc, x1	
	csrr x5, mcause
	li x6, 4		//Load exception
	bne x6, x5, test_fail
	li x1, 0x80000004
	csrw mtvec, x1
	mret
.align 4
test_pass:
	ecall

test_fail:
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
