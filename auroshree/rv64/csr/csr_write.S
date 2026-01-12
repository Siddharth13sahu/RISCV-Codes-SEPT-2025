#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64MF
RVTEST_CODE_BEGIN

start:
	

set1:
	csrr	x5,	mstatus
	li		x9,	0xf
	csrr	x5,	misa
	//csrw	misa,	x9

	csrr	x6,	marchid
	
	csrr	x7,	mvendorid
	
	csrr	x8,	mimpid
	
	csrr	x5,	mhartid
	
	csrr	x6,	mstatus
	csrc	mstatus,	x9

set2:
	csrr	x5,	mstatus
	//csrr	x6,	mconfigptr
	//csrw	mconfigptr,	x9
	//csrr	x6,	mconfigptr

	

 
  TEST_PASSFAIL
 
RVTEST_CODE_END
 
  .data
 
RVTEST_DATA_BEGIN
  TEST_DATA
 inp_data:
	.word	0xDEADBEEF
 
RVTEST_DATA_END
