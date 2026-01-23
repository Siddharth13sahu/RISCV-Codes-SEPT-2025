//****************************************************************************************
 
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
 
//   Owner: Auroshree Anuvab Raj
 
//   Item : rv64d- float double precision instruction
 
//   Date created : 11/13/2025
 
//***********************************************************************************
//   Description: all double precision floating point instruction
//***********************************************************************************
 
 
#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV64MF
RVTEST_CODE_BEGIN
  li gp, 3
 
 
start:
//the testintention isto sub,addimmediate with a negative number


Test1:	//fld_fsd	fcvt.s.d		fadd.d
	la				x5,	inp_data
	fld			f0,	0(x5)
	li				x6,	3
	fcvt.d.l		f1,	x6						//convert int to float
	fadd.d		f0,	f0,	f1
	fsd			f0,	0(x5)
	
Test2:	//fmadd.d fmsub.d fnmadd.d fnmsub.d
	la				x5,	inp_data
	fld			f0,	0(x5)							//f0=237.24
	fld			f1,	8(x5)							//f1=100.91
	fld			f2,	16(x5)						//f2=23.456
	fmadd.d		f3,	f0,	f1,	f2				//f3=(f0*f1)+f2
	fmsub.d		f4,	f0,	f1,	f2				//f4=(f0*f1)-f2
	fnmadd.d		f5,	f0,	f1,	f2				//f5=-((f0*f1)+f2)
	fnmsub.d		f6,	f0,	f1,	f2				//f6=-((f0*f1)-f2)

Test3: 	//fadd.d fsub.d fmul.d fdiv.d fsqrt.d
	la				x5,	inp_data
	fld			f0,	24(x5)
	fld			f1,	32(x5)
	fadd.d		f2,	f1,	f0	
	fsub.d		f3,	f1,	f0	
	fmul.d		f4,	f1,	f0	
	fdiv.d		f5,	f1,	f0	
	fsqrt.d		f6,	f0	

Test4:	//fsgnj.d fsgnjn.d fsgnjx.d
	la				x5,	inp_data
	fld			f0,	40(x5)	//f0=7
	fld			f1,	48(x5)	//f1=-5
	fsgnj.d		f2,	f0,	f1							//value of f0 and sign of f1
	fsgnjn.d		f3,	f1,	f0							//value of f1 with inverted sign of f0
	fsgnjx.d		f4,	f0,	f1							//value of f0 with xor of sign of f0 and f1

Test5:	//fcvt.l.d fcvt.lu.d fcvt.d.l fcvt.d.lu 
																//fcvt.l.d---> convert float to signed int64		//fcvt.lu.d---> convert float to unsigned int64
																//fcvt.d.l---> convert signed int64 to float		//fcvt.d.lu---> convert unsigned int64 to float
	la				x5,	inp_data
	fld			f0,	48(x5)
	fld			f1,	(x5)
	fcvt.l.d		x6,	f0
	fcvt.lu.d	x7,	f0									//x7=0 as unsigned can't represent negative
	fcvt.lu.d	x7,	f1
	addi			x28,	x0,	-19
	fcvt.d.l		f2,	x6
	fcvt.d.lu	f3,	x28
	fcvt.d.lu	f3,	x7

Test6:	//fmv.x.d(float-->integer) fmv.d.x(integer-->float)   (raw 64 bit float into integer)
	la				x5,	inp_data
	fld			f0,	40(x5)
	fmv.x.d		x6,	f0
	fmv.d.x		f1,	x6
	
Test7: 	//feq.d flt.d fle.d fmin.d fmax.d
	la				x5,	inp_data
	fld			f0,	56(x5)	//f0=5
	fld			f1,	40(x5)	//f1=7
	fld			f2,	48(x5)	//f2=-5.5
	feq.d			x6,	f1,	f2
	flt.d			x7,	f2,	f1
	fle.d			x8,	f2,	f0
	fmax.d		f3,	f2,	f0
	fmin.d		f4,	f2,	f0

Test8:	//fclass.d
	la				x5,	inp_data
	fld			f0,	40(x5)
	fld			f1,	48(x5)
	fclass.d		x6,	f0	
	fclass.d		x7,	f1

Test9:	// fcvt.d.s fcvt.s.d fcvt.w.d fcvt.wu.d
															//	FCVT.D.S		(float(32)		-->float(64))
															// FCVT.S.D		(float(64)		-->float(32))
															// FCVT.W.D		(double float	-->int(signed 32)) 
															// FCVT.WU.D	(double float	-->int(unsigned 32))
	la				x5,	inp_data
	fld			f0,	(x5)		//237.24
	fld			f1,	40(x5)  	//7
	fld			f2,	48(x5)	//-5.5
	fcvt.d.s		f6,	f0
	fcvt.s.d		f7,	f2
	fcvt.w.d		x8,	f1
	fcvt.wu.d	x9,	f2
	
	


  TEST_PASSFAIL
RVTEST_CODE_END
  .data
RVTEST_DATA_BEGIN
  
  TEST_DATA
 
inp_data:
  .double 234.24		//436a3d71 	//0
  .double 100.91		//42c9d1ec	//8
  .double 23.456		//41bba5e3	//16
  .double 1.2			//3f99999a	//24
  .double 1.3			//3fa66666	//32
  .double 7.0			//40e00000	//40
  .double -5.5			//c0a00000	//48
  .double 5.0			//40a00000	//56
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
