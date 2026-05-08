//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item :	store operation

//   Date created :

//***********************************************************************************
//   Description:  
//***********************************************************************************

#include "test_macros.h"

#include "riscv_test.h"
 
RVTEST_RV64M

RVTEST_CODE_BEGIN

	start:
		initialise:
		li gp, 3
		la x6, inp_data
		li x18, 0x80002140			// initialise the end addr
		li x8, 0x80002100  			// initialise the registers with starting addr

		Test1:
		ld x5, 0(x6)
		sd x5, 0(x8)
		ld x5, 8(x6)
		sd x5, 8(x8)

		addi x6, x6, 16

		label:
		addi x8, x8, 16
		bne x8, x18, Test1	
		addi x28, x28, 2	

	
	TEST_PASSFAIL
 
RVTEST_CODE_END

.data
	
RVTEST_DATA_BEGIN

	TEST_DATA

inp_data:
  .word 0xABCD1234
  .word 0x06627912
  .word 0x06627913
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



