#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV32M
RVTEST_CODE_BEGIN
  li gp, 3

start:
//the testintention isto sub,addimmediate with a negative number
 
Test1:      //mul
addi x5, x0, 6
addi x6, x0, -3
mul  x7, x5, x6
 
Test2:      //mulh
li x5, 0x12345678
li x6, 0x1000
mulh x7, x5, x6
 
Test3:      //mulhsu
li x5, -2
li x6, 0xFFFFFFFF
mulhsu x7, x5, x6
 
Test4:      //mulhu
li x5, 0xFFFFFFFF
li x6, 0xFFFFFFFF
mulhu x7, x5, x6
 
Test5:      //div
li x5, -10
li x6, 3
div x7, x5, x6
 
Test6:      //divu
li x5, -10       # 0xFFFFFFF6 unsigned = 4294967286
li x6, 3
divu x7, x5, x6
 
Test7:      //rem
li x5, -10
li x6, 3
rem x7, x5, x6
 
Test8:      //remu
li x5, -10       # 0xFFFFFFF6
li x6, 3
remu x7, x5, x6
 


 
  TEST_PASSFAIL
RVTEST_CODE_END
  .data
RVTEST_DATA_BEGIN
  TEST_DATA

RVTEST_DATA_END
