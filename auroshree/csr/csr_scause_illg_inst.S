//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Auroshree Anuvab Raj 
//   Item : CSR Read
//   Date created : 11/07/2025
//***********************************************************************************
//   Description: The following testcase is about generating a illegal instruction trap in u mode and handling in s mode and observe the value of scause  
//***********************************************************************************


#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV64MF
RVTEST_CODE_BEGIN
 
start:

//delegate load misalignment
li		x11,	(1<<2)		//exception 2(illegal instruction)
csrw	medeleg,	x11
csrr	x11,	medeleg

//install m and s mode trap handler
handle_in_s:
la		x5,	s_trap_handle
csrw	stvec,	x5
la		x5,	m_trap_handle
csrw	mtvec,	x5

//mode m->s
csrr	x6,	mstatus
li		x7,	~(3<<11)
and	x6,	x6,	x7		//mpp=m->u
li		x7,	(1<<11)
or		x6,	x6,	x7		//mpp=u->s
csrw	mstatus,		x6

la		x8,	super_entry
csrw	mepc,	x8
mret

super_entry:
csrr	x6,	sstatus
li		x7,	~(1<<8)
and	x6,	x6,	x7
csrw	sstatus,		x6

la		x8,	user_entry
csrw	sepc,	x8
sret

user_entry:
csrw	mtvec,	x0

//incase failure
u_after:
j 		u_after


s_trap_handle:
csrr	x5,	scause
li		x6,	2
bne 	x5,	x6,	exit_trap
j		end_case

end_case:
li		x7,	0x80000004
csrw	stvec,	x7

exit_trap:
ecall

m_trap_handle:
j	m_trap_handle


      
TEST_PASSFAIL
RVTEST_CODE_END
  .data
RVTEST_DATA_BEGIN
  TEST_DATA

inp_data:
  .word 0xDEADBEEF
  .word 0x12345678
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



