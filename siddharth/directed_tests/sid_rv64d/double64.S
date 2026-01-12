//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Siddharth Sahu 
 
//   Item : double precision float
//   Date created : 20/11/2025
 
//***********************************************************************************
//   Description: Testcase says floating point instructions based on RV64D ISA
//***********************************************************************************


#include "test_macros.h"
#include "riscv_test.h"
 
RVTEST_RV64MF
RVTEST_CODE_BEGIN

load:
	li x5,0x80002000
	fld f0, 0x0(x5)
	fld f1, 0x8(x5)
	

	//fld f0, 0(x5)
	//fld f1, 0x8(x5)
	fld f2, 0x10(x5)
	fld f3, 0x10(x5)
	

conversion:

//int to float
	addi x8, x0, 0x64
	fcvt.d.l f3, x8
	
	addi x8, x0, -1
	fcvt.d.lu f3, x8
	fcvt.d.l f3, x8

//float to int
	
	flw f3, 0x10(x5)
	fcvt.l.d x8, f3
	
	fcvt.lu.d x8, f3

class:
	fclass.d x9, f0
	fclass.d x9, f3
	
	
	flw f3, 0x20(x5)
	fclass.d x9, f3    //for NaN
	
	flw f3, 0x24(x5)
	fclass.d x9, f3    //-inf


	fsw f3, 0(x5)  
	fclass.d x9, f3
	
	fsw f3, 16(x5)  
	fclass.d x9, f3

	fmv.x.d x9, f3
	fmv.d.x f5, x8
	

//
//sign 	exp	   mantisaa  
//0	11111111  0000000.....
//1	111 1111 1  0000000.....
//0	11111111  0101100.....

 
TEST_PASSFAIL
 
RVTEST_CODE_END
 
  .data
 
RVTEST_DATA_BEGIN
  TEST_DATA
 
 
inp_data:
  .double 100.25
  .double 200.50
  .dword 0x0000000000000000
  .double -200.50
  .word 0xfff944fc
  .word 0xff800000
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




