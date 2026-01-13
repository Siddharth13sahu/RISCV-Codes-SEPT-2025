# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32UF
RVTEST_CODE_BEGIN

  li gp, 3
  la x16, inp_data
  li x27, 0xaabb 

 
lr.w.aq x21,(x16)
sc.d.aq x15,x27,(x16)



  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


inp_data:
  .word 5
  .word 6
  .word 7
inp_double:
  .double 40
  .double 50
  .double 60
inp_float:
  .float 2.5
  .float 3.5
  .float 4.5
RVTEST_DATA_END


