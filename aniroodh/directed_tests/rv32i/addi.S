#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV32U
RVTEST_CODE_BEGIN
 
test1:
  li x6, 1
  addi x7, x6, 2       # x7 = 3
 
test2:
  li x6, 12345
  addi x7, x6, 512   # x7 = 66666
 
test3:
  li x6, 0xABCDEF01
  addi x7, x6, 0       # x7 = 0xABCDEF01
 
test4:
  li x6, 0x7FFFFFFF
  addi x7, x6, 1       # x7 = 0x80000000 (overflow wrap= "wraps around" the 32-bit limit, continuing from the opposite end of the signed range.)
 
test5:
  li x6, -5
  addi x7, x6, 5       # x7 = 0
 
TEST_PASSFAIL
 
RVTEST_CODE_END
 
RVTEST_DATA_BEGIN
  TEST_DATA
RVTEST_DATA_END
