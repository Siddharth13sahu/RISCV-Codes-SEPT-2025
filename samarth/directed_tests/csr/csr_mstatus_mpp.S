//*********************************************************************
//	Copyright 2025 Scaledge India Pvt Ltd - ALl RIghts REserved.
//	Owner: Samarth Patnaik
// 	Item :tc_mstatus_mpp
//	Date created : 11/07/2025
//*********************************************************************
//	Description : Testcase about mstatus, changing mode from M -> S -> U.
//*********************************************************************
#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64MF
RVTEST_CODE_BEGIN

test_read_mstatus:
	csrr x1, mstatus

test_store_mepc:
	la x2, test_s_entry
	csrw mepc, x2

test_change_priv_s:
	li t0, ~(3<<11)
	and x1,x1,t0  //clear the 2-bits
	li t1, (1<<11)
	or x1,x1,t1   //set the 2-bits (01)
	csrw mstatus, x1
	mret 
test_s_entry:
	csrr x1, sstatus

	la x2, test_u_entry
	csrw sepc, x2
	
	li t0, ~(3<<11)
	and x1,x1,t0  //clear the 2-bits
	csrw sstatus, x1

	sret

test_u_entry:
	li x2, 0x99999999
	li x2, 0x80000004
	csrw mtvec, x2
	ecall
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
