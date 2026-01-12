//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Siddharth Sahu 
 
//   Item : arithmatic float
//   Date created : 11/07/2025
 
//***********************************************************************************
//   Description: Testcase says floating point instructions based on RV32F ISA
//***********************************************************************************


#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64MF
RVTEST_CODE_BEGIN

load:
	li x5,0x80002000
	//fld f0, 0x8(x5)
	//fld f1, 0x8(x5)
	fld f0, 0(x5)
	fld f2, 0x8(x5)
	
	fcvt.w.d x10, f0	

	//fld f0, 0(x5)
	//fld f1, 0x8(x5)
	fld f4, 0x10(x5)
	fld f6, 0x10(x5)
	


arithmatic:
	
	fadd.d f4, f2, f0
sub:
	fsub.d f4, f2, f0
mul:	fmul.d f4, f2, f0
div:	fdiv.d f4, f2, f0
sqrt:	fsqrt.d f4, f0


fused_multiply:
	
	fmadd.d  f6, f4, f2, f0
	fmsub.d  f6, f4, f2, f0
	fnmadd.d f6, f4, f2, f0
	fnmsub.d f6, f4, f2, f0
	

signed_inject_negative:

	fsgnj.d  f6, f2, f0
	fsgnjn.d f6, f2, f0
	fsgnjx.d f6, f2, f0



//int to float
	addi x8, x0, 0x64
	fcvt.s.d f6, f2
	fcvt.d.s f6, f2
	
	addi x8, x0, -1
	fcvt.d.wu f6, x8
	fcvt.d.w  f6, x8

//float to int
	
	flw f6, 0x18(x5)
	fcvt.w.d x8, f6
	
	fcvt.wu.d x8, f6


store:
	fsd f6, 0(x5)  

comparison:
	
	feq.d x8, f2, f0
	flt.d x8, f2, f0
	fle.d x8, f2, f0	
	
	fclass.d x9, f0
	fclass.d x9, f6
	
	fsd f6, 0(x5)  
	fclass.d x9, f6
	
	fsd f6, 0x20(x5)  
	fclass.d x9, f6
	

  
 
TEST_PASSFAIL
 
RVTEST_CODE_END
 
  .data
 
RVTEST_DATA_BEGIN
  TEST_DATA
 
 
inp_data:
  .double 100.25   //8 (0-7)
  .double 200.50   //10 (8-f)
  .dword 0x0000000000000000  //18 (10-17)
  .double -200.50 //1f  (18-1f)
  .word 0x584944fc  // 24 (20-23)
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



