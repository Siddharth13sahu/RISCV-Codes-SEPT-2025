//*********************************************************************
//	Copyright 2026 Scaledge India Pvt Ltd - ALl RIghts REserved.
//	Owner: Samarth Patnaik
// 	Item : csr_mstatus_sie_spie
//	Date created : 19/01/2026
//*********************************************************************
//	Description : Testcase about mstatus, verify that the sie and spie bits is set to high when an interrupt is generated.
//*********************************************************************
#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64MF
RVTEST_CODE_BEGIN

.equ MTIME, 0x200bff8
.equ MTIMECMP, 0x2004000

test_read_sie:
	la x1, test_trap
	csrw stvec, x1
	csrr x2, sie 

test_set_mepc:
	la x1, test_s_entry
	csrw mepc, x1
	
test_set_sie:
	li x3, (1<<5)	//stie
	csrw sie, x3  	//for sie

	csrr x4, mstatus
    	li x5, (1<<1)
    	or x4, x4, x5
    	csrw mstatus, x4 //sie globally

test_change_mode:
	li x1, ~(3<<11)
	csrr x2, mstatus
	and x1, x1, x2
	li x2, (1<<11)
	or x1, x1, x2
	csrw mstatus, x1
	mret

test_s_entry:
	csrr x1, sstatus
	li x3, (1<<5)
	csrw sie, x3  //for sie
    	li x5, (1<<1)
    	or x1, x1, x5
    	csrw sstatus, x1 //sie globally
	
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
	csrr x5, sie
	//csrr x6, spie
	csrr x6, sstatus

test_clear_trap:
	csrw sie, x0
	li x1, 0x80000004
	csrw stvec, x1

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
