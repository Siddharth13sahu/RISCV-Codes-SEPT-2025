//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Auroshree Anuvab Raj 

//   Item : CSR Read

//   Date created : 11/07/2025

//***********************************************************************************
//   Description: generate a testcase for load address misallignment exception and observe the value of mcause 
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV64MF
RVTEST_CODE_BEGIN
 
start:

//install m mode trap handler
handle_in_m:
la		x5,	m_trap_handle
csrw	mtvec,	x5

//mode m->u
csrr	x6,	mstatus
li		x7,	~(3<<11)
and	x6,	x6,	x7
csrw	mstatus,		x6

la		x8,	user_entry
csrw	mepc,	x8
mret

user_entry:
la 	x9,	inp_data
lw 	x10,	1(x9)			//load misalignment
u_after:
j 		u_after

m_trap_handle:
csrr	x5,	mtval
csrr	x6,	mepc
csrr	x7,	mcause
li		x6,	0x4
beq	x6,	x7,	continue
ecall

continue:
lw		x8,	0(x6)
andi	x8,	x8,	3
addi	x9,	x9,	3
beq	x8,	x9,	inst_4
addi	x8,	x8,	2
j		mepc_set
inst_4:
addi	x8,	x8,	4

mepc_set:
csrw	mepc,	x8
mret


      
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

