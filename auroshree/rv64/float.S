//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Auroshree Anuvab Raj
 
//   Item : rv64f- float single precision instruction
 
//   Date created : 11/13/2025
 
//***********************************************************************************
//   Description: all single precision floating point instruction
//***********************************************************************************
 
 
#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV64MF
RVTEST_CODE_BEGIN
  li gp, 3
 
 
start:
//the testintention isto sub,addimmediate with a negative number


Test1:	//flw_fsw fcvt.s.w fadd.s
	la				x5,	inp_data
	flw			f0,	0(x5)
	li				x6,	3
	fcvt.s.w		f1,	x6						//convert int to float
	fadd.s		f0,	f0,	f1
	fsw			f0,	0(x5)
	
Test2:	//fmadd.s fmsub.s fnmadd.s fnmsub.s
	la				x5,	inp_data
	flw			f0,	0(x5)							//f0=237.24
	flw			f1,	4(x5)							//f1=100.91
	flw			f2,	8(x5)							//f2=23.456
	fmadd.s		f3,	f0,	f1,	f2				//f3=(f0*f1)+f2
	fmsub.s		f4,	f0,	f1,	f2				//f4=(f0*f1)-f2
	fnmadd.s		f5,	f0,	f1,	f2				//f5=-((f0*f1)+f2)
	fnmsub.s		f6,	f0,	f1,	f2				//f6=-((f0*f1)-f2)

Test3: 	//fadd.s fsub.s fmul.s fdiv.s fsqrt.s
	la				x5,	inp_data
	flw			f0,	12(x5)
	flw			f1,	16(x5)
	fadd.s		f2,	f1,	f0	
	fsub.s		f3,	f1,	f0	
	fmul.s		f4,	f1,	f0	
	fdiv.s		f5,	f1,	f0	
	fsqrt.s		f6,	f0	

Test4:	//fsgnj.s fsgnjn.s fsgnjx.s
	la				x5,	inp_data
	flw			f0,	20(x5)	//f0=7
	flw			f1,	24(x5)	//f1=-5
	fsgnj.s		f2,	f0,	f1							//value of f0 and sign of f1
	fsgnjn.s		f3,	f1,	f0							//value of f1 with inverted sign of f0
	fsgnjx.s		f4,	f0,	f1							//value of f0 with xor of sign of f0 and f1

Test5:	//fcvt.w.s fcvt.wu.s fcvt.s.w fcvt.s.wu 
																//fcvt.w.s---> convert float to signed int32		//fcvt.wu.s---> convert float to unsigned int32
																//fcvt.s.w---> convert signed int32 to float		//fcvt.s.wu---> convert unsigned int32 to float
	la				x5,	inp_data
	flw			f0,	24(x5)
	flw			f1,	(x5)
	fcvt.w.s		x6,	f0
	fcvt.wu.s	x7,	f0									//x7=0 as unsigned can't represent negative
	fcvt.wu.s	x7,	f1
	addi			x28,	x0,	-19
	fcvt.s.w		f2,	x6
	fcvt.s.wu	f3,	x28
	fcvt.s.wu	f3,	x7
	
Test6:	//fmv.x.w(float-->integer) fmv.w.x(integer-->float)
	la				x5,	inp_data
	flw			f0,	20(x5)
	fmv.x.w		x6,	f0
	fmv.w.x		f1,	x6

Test7: 	//feq.s flt.s fle.s fmin.s fmax.s
	la				x5,	inp_data
	flw			f0,	28(x5)	//f0=5
	flw			f1,	20(x5)	//f1=7
	flw			f2,	24(x5)	//f2=-5.5
	feq.s			x6,	f1,	f2
	flt.s			x7,	f2,	f1
	fle.s			x8,	f2,	f0
	fmax.s		f3,	f2,	f0
	fmin.s		f4,	f2,	f0

Test8:	//fclass.s
	la				x5,	inp_data
	flw			f0,	20(x5)
	flw			f1,	24(x5)
	fclass.s		x6,	f0	
	fclass.s		x7,	f1

Test9:	// fcvt.l.s fcvt.lu.s fcvt.s.l fcvt.s.lu
															//	FCVT.L.S		(float				-->int(signed 64))
															// FCVT.LU.S	(float				-->int(unsigned 64))
															// FCVT.S.L		(int(signed 64)	-->float(32)) 
															// FCVT.S.LU	(int(unsigned 64)	-->float(32))
	la				x5,	inp_data
	flw			f0,	(x5)		//237.24
	flw			f1,	20(x5)  	//7
	flw			f2,	24(x5)	//-5.5
	fcvt.l.s		x6,	f0
	fcvt.l.s		x7,	f2
	fcvt.lu.s	x8,	f1
	fcvt.lu.s	x9,	f2
	addi			x28,	x0,	-98
	addi			x29,	x0,	100
	fcvt.s.l		f3,	x28
	fcvt.s.lu	f4,	x28
	fcvt.s.lu	f5,	x29





  TEST_PASSFAIL
RVTEST_CODE_END
  .data
RVTEST_DATA_BEGIN
  
  TEST_DATA
 
inp_data:
  .float 234.24		//436a3d71 	//0
  .float 100.91		//42c9d1ec	//4
  .float 23.456		//41bba5e3	//8
  .float	1.2			//3f99999a	//12
  .float 1.3			//3fa66666	//16
  .float 7.0			//40e00000	//20
  .float -5.5			//c0a00000	//24
  .float 5.0			//40a00000	//28
  .dword 0xDEADBEEFDEADBEEF
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
