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
	la		x5,	val1
	la		x7,	val2
	la		x18,	val3
	la		x19,	val4
	la		x20,	val5
	la		x21,	val6
	li		x6,	0x80002000


Test1:									//fld_fsd
	
	fld	f0,	0(x5)
	fld	f1,	0(x7)
	fld	f2,	0(x18)
	fld	f3,	0(x19)
	fld	f4,	0(x20)
	fld	f5,	0(x21)

	fsd 	f0,	0(x6)
	
Test2:									//add
	fadd.d	f28,	f0,	f1

Test3:									//sub
	fsub.d	f28,	f0,	f1			//high-low
	fsub.d	f29,	f1,	f0			//low-high

Test4:
	fmadd.d	f30,	f2,	f1,	f0	//f30=(f2*f1)+f0
	fmsub.d	f31,	f2,	f1,	f0	//f31=(f2*f1)-f0

Test5:
	fnmadd.d	f28,	f2,	f1,	f0	//f28=(-f2*f1)+f0
	fnmsub.d	f29,	f2,	f1,	f0	//f29=(-f2*f1)-f0

Test6:
	fmul.d	f30,	f2,	f1			//f30= f2*f1
	fdiv.d	f31,	f2,	f1			//f31= f2/f1

Test7:
	fsqrt.d	f30,	f0					//f30= sqrt(f0)
	
Test8:
	fsgnj.d	f28,	f4,	f3			//floating point sign inject (sign of rs2, mag of rs1)
	fsgnj.d	f28,	f3,	f4			
	fsgnjn.d	f29,	f4,	f3			//floating point sign invert inject (invert sign of rs2, mag of rs1)
	fsgnjx.d	f30,	f4,	f3			//floating point sign inject XOR (invert sign only if sign buts of rs1 & rs2 are opposite)
	
Test9:
	fmin.s	f28,	f3,	f1			//f28= min(f3,f1)
	fmax.s	f29,	f2,	f4			//f29= max(f2,f4)

Test10:
	fcvt.d.s	f30,	f3					//x30= single precision float -> double precision float
	fcvt.d.s	f31,	f2					//x31= single precision float -> double precision float


Test11:
	fcvt.wu.d	x28,	f3				//x28= float -> int
	fcvt.wu.d	x29,	f2				//x29= float -> int


Test12:
	fmv.x.d	x30,	f3					//x30= store the value of f3 in bits as it is(float bits)
	fmv.x.d	x31,	f4

Test13:
	feq.d		x28,	f3,	f3			//x28= set x28 to 1 if rs1 & rs2 is equal
	flt.d		x29,	f4,	f1			//x30= set x29 to 1 if rs1 is less than rs2
	fle.d		x30,	f3,	f4			//x31= set x30 to 1 if rs1 is less equal to f4


Test14:									//xclass
	fclass.d	x28,	f3				
	fclass.d	x29,	f4					
	fclass.d	x30,	f5				
	
Test15:
	li			x8,	-1
	li			x9,	133
	fcvt.d.w	f28,	x8					//x30= int -> float
	fcvt.d.w	f29,	x9					//x31= int -> float

Test16:
	fcvt.d.wu	f30,	x8				//x30= int -> float (unsigned)
	fcvt.d.wu	f31,	x9				//x31= int -> float (unsigned)


Test17:
	fmv.d.x	f30,	x8					//x30= stores the exact interpreted integer value of x8 as float
	fmv.d.x	f31,	x9					//x31= stores the exact interpreted integer value of x8 as float

Test18:
	fcvt.d.lu	f30,	x8				//x30= long_int -> float (unsigned)
	fcvt.d.lu	f31,	x9				//x31= long_int -> float (unsigned)

Test19:
	fcvt.lu.d	x30,	f2				//x30= int -> float (unsigned)
	fcvt.lu.d	x31,	f3				//x31= int -> float (unsigned)

	TEST_PASSFAIL

RVTEST_CODE_END
  .data
  val1:	.double	496.59	//f0
  val2:	.double	273.372	//f1
  val3:	.double	751.61	//f2
  val4:	.double	-236.65	//f3
  val5:	.double	806.546	//f4
  val6:	.double	0.00		//f5

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



