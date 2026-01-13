//*********************************************************************
//	Copyright 2025 Scaledge India Pvt Ltd - ALl RIghts REserved.
//	Owner: Samarth Patnaik
// 	Item : fc_rv32i_isa
//	Date created : 11/07/2025
//*********************************************************************
//	Description : Testcase says the use of loading and storing in RV32A, in a loop for all the values
//*********************************************************************
#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV32UF
RVTEST_CODE_BEGIN

la x1, sample
la x2,sample_s
test_load_store:
	//fld f2, 0(x1)
	//fsd f2, 8(x1)
test_fadd.d:
	fld f1, 0(x1)
	fld f2, 8(x1)
	fadd.d f3,f2,f1
test_fsub.d:
	fsub.d f3,f2,f1
test_fmul.d:
	fmul.d f3,f2,f1
test_fdiv.d:
	fdiv.d f3,f2,f1
test_fmadd.d:
	fld f3, 16(x1)
	fmadd.d f4,f3,f2,f1
test_fmsub.d:
	fld f3, 16(x1)
	fmsub.d f4,f3,f2,f1
test_fnmadd.d:
	fld f3, 16(x1)
	fnmadd.d f4,f3,f2,f1
test_fnmsub.d:
	fld f3, 16(x1)
	fnmsub.d f4,f3,f2,f1
test_sqrt.d:
	fsqrt.d f5, f3
test_fsgnj.d:
	fld f4, 24(x1)   //double load
	fsgnj.d f5, f4,f3
test_fsgnjn.d:
	fsgnjn.d f5, f4,f3
test_fsgnjx.d:
	fsgnjx.d f5, f4,f3
test_fmin.d:
	fmin.d f5,f4,f2
test_fmax.d:
	fmax.d f5,f4,f2
test_fcvt.s.d:
	fcvt.s.d f5,f4
test_fcvt.d.s:
	flw f6,0(x2)     //float load
	fcvt.d.s f5,f6
test_fcvt.w.d:
	fcvt.w.d x5,f4 //-21 upper float value
test_fcvt.wu.d:
	fcvt.wu.d x5,f4
test_fcvt.d.w:
	li x4,25  //word load 
	fcvt.d.w f5,x4
test_fcvt.d.wu:
	li x5, -10
	fcvt.d.wu f5,x5
test_compare:
	feq.d x5,f3,f2
	flt.d x5,f1,f2
	fle.d x5,f2,f3 

  TEST_PASSFAIL

RVTEST_CODE_END
  .data
RVTEST_DATA_BEGIN
  TEST_DATA
sample:
  .double 4.99270
  .double 4
  .double 12.11232
  .double -20.9987
sample_s:
  .float 5.553
inp_data:
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
