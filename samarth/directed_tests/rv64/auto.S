# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32UF
RVTEST_CODE_BEGIN

  li gp, 3
  la x1, inp_data
  la x6, inp_double
  li x6,0xaabb 
  
  lw x4, 0(x1)
  lr.w.aq x5,(x1)
  
  //sc.w x8,x6,(x1)

  sc.w.rl x4,x6,(x1)



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
RVTEST_DATA_END

