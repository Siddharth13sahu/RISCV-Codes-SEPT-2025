//*********************************************************************
//	Copyright 2026 Scaledge India Pvt Ltd - ALl RIghts REserved.
//	Owner: Samarth Patnaik
// 	Item : csr_mcycle
//	Date created : 22/01/2026
//*********************************************************************
//	Description : Testcase on using mcycle to count the total no.of clock cycles executed
//*********************************************************************
#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64MF
RVTEST_CODE_BEGIN

test_read_mcycle:
	csrr x1, mcycle

test_loop:
	li x2, 20
	add x2,x2,x1
	csrr x3, mcycle
	bge x2, x3, test_loop
	ecall
	

  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA

RVTEST_DATA_END
