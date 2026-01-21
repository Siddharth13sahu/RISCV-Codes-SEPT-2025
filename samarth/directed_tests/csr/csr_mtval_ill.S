//*********************************************************************
//	Copyright 2026 Scaledge India Pvt Ltd - ALl RIghts REserved.
//	Owner: Samarth Patnaik
// 	Item : csr_mtval_ill
//	Date created : 19/01/2025
//*********************************************************************
//	Description : Testcase shows the value of mtval when an illegal exception is generated.
//*********************************************************************
#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64MF
RVTEST_CODE_BEGIN

test_read:
	csrr x1, mcause

test_mtvec:
	la x1, trap_handler
	csrw mtvec, x1

test_ill_exc:
	li x1, 100
	csrw marchid, x1  //Illegal

.align 4
trap_handler:
	la x1, test_pass
	csrw mepc, x1
	csrr x5, mcause
	li x6, 2 	//store Addr Misalogned
	bne x6, x5, test_fail
	mret
test_pass:
	csrr x1,mtval 	//Illegal address value
	li x1, 0x80000004
	csrw mtvec, x1
	ecall

test_fail:
	li x1, 0x80000004
	csrw mtvec, x1
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
