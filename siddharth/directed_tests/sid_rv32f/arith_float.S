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
	fld f0, 0x8(x5)
	fld f1, 0x8(x5)
	flw f0, 0(x5)
	flw f1, 0x4(x5)

	//fld f0, 0(x5)
	//fld f1, 0x8(x5)
	fld f2, 0x8(x5)
	fld f3, 0x8(x5)
	


arithmatic:
	
	fadd.s f2, f1, f0
sub:
	fsub.s f2, f1, f0
mul:	fmul.s f2, f1, f0
div:	fdiv.s f2, f1, f0
sqrt:	fsqrt.s f2, f0


fused_multiply:
	
	fmadd.s f3, f2, f1, f0
	fmsub.s f3, f2, f1, f0
	fnmadd.s f3, f2, f1, f0
	fnmsub.s f3, f2, f1, f0
	

signed_inject_negative:

	fsgnj.s f3, f1, f0
	fsgnjn.s f3, f1, f0
	fsgnjx.s f3, f1, f0


conversion:
//direct bit transfer
	fmv.x.w x7, f1 
	fmv.w.x f3, x7

//int to float
	addi x8, x0, 0x64
	fcvt.s.w f3, x8
	
	addi x8, x0, -1
	fcvt.s.wu f3, x8
	fcvt.s.w f3, x8

//float to int
	
	flw f3, 0x10(x5)
	fcvt.w.s x8, f3
	
	fcvt.wu.s x8, f3


store:
	fsw f3, 0(x5)  

comparison:
	
	feq.s x8, f1, f0
	flt.s x8, f1, f0
	fle.s x8, f1, f0	
	
	fclass.s x9, f0
	fclass.s x9, f3
	
	fsw f3, 0(x5)  
	fclass.s x9, f3
	
	fsw f3, 16(x5)  
	fclass.s x9, f3
	

  
 
TEST_PASSFAIL
 
RVTEST_CODE_END
 
  .data
 
RVTEST_DATA_BEGIN
  TEST_DATA
 
 
inp_data:
  .float 100.25
  .float 200.50
  .dword 0x0000000000000000
  .float -200.50
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


