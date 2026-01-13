//****************************************************************************************

//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.

//   Owner: Aniroodh Patnaik

//   Item : floating_point_instructions

//   Date created : 13/11/2025

//***********************************************************************************
//   Description: floating load_store instruction 
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64MF
RVTEST_CODE_BEGIN

	li 	gp, 	3

start:
	initialise:
	li		x5,	0x41200000
	li		x6,	0xc1200000
	li		x7,	0x3f666666
	

Test1:									//fcvt.l.s	(32-bit floating-point value -> 64-bit signed integer)
	
    fmv.w.x  f1, x5
    fcvt.l.s x28, f1       

Test2:
    fmv.w.x  f2, x6
    fcvt.l.s x29, f2					

Test3:
    fmv.w.x  f3, x7
    fcvt.l.s x30, f3	

Test4:									//fcvt.lu.s(32-bit floating-point -> 64-bit unsigned integer)
	 fmv.w.x  f4, x5
    fcvt.lu.s x10, f4     

Test5:
    li x6,	0x3f800000      		//1.0
    fmv.w.x  f5, x6
    fcvt.lu.s x11, f5     

Test6:
    li x7,	0xc1200000      # -10.0
    fmv.w.x  f6, x7
    fcvt.lu.s x12, f6      # expect 0 (invalid)

Test7:
    li x5,	0x7f800000      # +inf
    fmv.w.x  f7,	x5
    fcvt.lu.s x13, f7      # expect 0

Test8:
	li	x6,	1234567890123
	li	x7,	-125643548245
	fcvt.s.l	f0,	x6
	fcvt.s.l	f1,	x7

Test9:
	fcvt.s.lu	f2,	x6
	fcvt.s.lu	f3,	x7
	


	TEST_PASSFAIL

RVTEST_CODE_END
  .data
  
RVTEST_DATA_BEGIN
  
  TEST_DATA

inp_data:

  .word 0xABCD1234

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



