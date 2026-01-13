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

read_mstatus:
	csrr x1, mstatus
store_mepc:
	la x2, sv_entry
	csrw mepc, x2
change_priv:
	li t0, ~(3<<11)
	and x1,x1,t0  //clear the 2-bits
	li t1, (1<<11)
	or x1,x1,t1   //set the 2-bits (01)
	csrw mstatus, x1
read_medeleg:
	csrr t2, medeleg
	li t3, 0x200
write_medeleg:	
	csrw medeleg, t3
	mret

sv_entry:
	csrr x3, sstatus
	la x4, sv_traphandler
	csrw stvec, x4
	ecall

sv_traphandler:
	csrr x4, scause
		
	
	
	

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
