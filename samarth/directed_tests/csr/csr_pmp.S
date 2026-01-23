//*********************************************************************
//	Copyright 2026 Scaledge India Pvt Ltd - ALl RIghts REserved.
//	Owner: Samarth Patnaik
// 	Item : test_misa_read_32M
//	Date created : 19/01/2026
//*********************************************************************
//	Description : Testcase on reading default value of misa in RV32M.
//*********************************************************************
#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32M
RVTEST_CODE_BEGIN

read_misa:
	csrr x5, misa
	csrr x1, pmpcfg0

write_misa:
	li x1, (1<<2)
	csrw misa, x1
	li x1, (1<<4)
	csrw misa, x1

write_reserved:
	li x2, (1<<9)
	csrw misa, x2

test_final_read:
	csrr x1, misa

  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA

RVTEST_DATA_END
