#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64MF
RVTEST_CODE_BEGIN

start:
	

set1:		//load address misaligned
	la		x5,	trap_handle
	csrw	mtvec,	x5

	la		x9,	inp_data
	lw		x12,	1(x9)
	
	after_trap:
		addi	x6,	x0,	1
		j	done_set1
	
	trap_handle:
		csrr	x12,	mepc
		csrr	x11,	mcause
		csrr	x10,	mtval

		lw		x13,	0(x12)
		andi	x13,	x13,	3
		addi	x28,	x28,	3
		beq	x13,	x28,		inst_c
		addi	x13,	x13,	2
		j		mepc_set
		inst_c:
		addi	x13,	x12,	4

		mepc_set:
		csrw	mepc,	x13
		mret
	
	done_set1:

set2:		//store address misaligned
	la		x5,	trap_handler
	csrw	mtvec,	x5

	la		x6,	inp_data
	li		x7,	0x12345678
	sw		x7,	3(x6)
	
	post_trap:
	addi	x8,	x8,	2
	j		done_set2

	trap_handler:
	csrr	x9,	mstatus
	srli	x9,	x9,	11
	csrr	x10,	mepc
	csrr	x11,	mcause
	csrr	x12,	mtval

	lw		x13,	0(x10)
	andi 	x13,	x13,	3
	addi	x28,	x28,	3
	beq	x13,	x28,		instr_c
	addi	x13,	x10,	2
	j		set_mepc
	instr_c:
	addi	x13,	x10,	4

	set_mepc:
	csrw	mepc,	x13
	mret

	done_set2:
 
  TEST_PASSFAIL
 
RVTEST_CODE_END
 
  .data
 
RVTEST_DATA_BEGIN
  TEST_DATA
 inp_data:
	.word	0xDEADBEEF
 	.word 0xBEEFDEAD
RVTEST_DATA_END
