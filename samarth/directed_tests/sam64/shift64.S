# See LICENSE.vyoma for more details 

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32U
RVTEST_CODE_BEGIN

	li x5,2
	li x6,-16
	li x28, 0x12345678
	li x29,-256
test_slli: 
	slli x5,x5,2
test_srli:
	srli x5,x5,2
test_srai:
	srai x6,x6,2
test_slliw:
	slliw x28,x28,4
test_srliw:
	srliw x28,x28,4
test_sraiw:
	sraiw x29,x29,4
test_sllw:
	li x28, 0x12345678
	li x30, 4
	sllw x28, x28, x30 
test_srlw:
	srlw x28, x28, x30 
test_sraw:
	li x29, -256
	sraw x29, x29, x30 
	

  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA

doub_data:
  .dword 0x1122334455667788

inp_data:
  .word 0x06627912
  .word 0x06927812
  .word 0x584944fc
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


