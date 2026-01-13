# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32U
RVTEST_CODE_BEGIN

  li x3, 3
  li x1, 20

  la x5, inp_data 
  mv x6, x0
  lh x6, 2(x5)
  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:
  .word 0x11223344

RVTEST_DATA_END








