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
		addi x18, x18, 0x8000213F		// initialise the end addr
		li x8, 0x80002100  			// initialise the registers with starting addr

		Test1:
		lb x5, 0(x6)
		sb x5, 0(x8)
		lb x5, 1(x6)
		sb	x5, 1(x8)
		lb	x5, 2(x6)
		sb x5, 2(x8)		
		lb	x5, 3(x6)
		sb	x5, 3(x8)
		lb	x5, 4(x6)
		sb	x5, 4(x8)
		lb	x5, 5(x6)
		sb	x5, 5(x8)
		lb	x5, 6(x6)
		sb	x5, 6(x8)	
		lb	x5, 7(x6)
		sb	x5, 7(x8)
		lb	x5, 8(x6)
		sb	x5, 8(x8)
		lb	x5, 9(x6)
		sb	x5, 9(x8)
		lb x5, 10(x6)
		sb x5, 10(x8)		
		lb x5, 11(x6)
		sb	x5, 11(x8)
		lb	x5, 12(x6)
		sb	x5, 12(x8)
		lb	x5, 13(x6)
		sb	x5, 13(x8)
		lb	x5, 14(x6)
		sb	x5, 14(x8)
		lb	x5, 15(x6)
		sb	x5, 15(x8)

		label:
		addi x8, x8, 1
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
  .word 0x06627912
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


