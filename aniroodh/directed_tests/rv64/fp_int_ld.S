
#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64UF
RVTEST_CODE_BEGIN

	li	gp,	3
initialize:	
//Addresses for test data
	la	x5,	val1 
	la	x6,	val2
	la	x7,	val3
	la	x28,	val4
	la	x29,	val5
	la	x30,	val6
	la	x31,	int_data
	
	li	x8,	0x80002500
floating_load:
	flw	f0,	0(x5)
	flw	f1,	0(x6)
	fld	f2,	0(x7)
	fld	f3,	0(x28)
	flw	f4,	4(x31)
	
interger_load:	
	ld	x9,	0(x29)
	ld	x18,	0(x31)
	lb	x19,	2(x5)
	lb	x20,	10(x31)
	lh	x21,	12(x31)

mix_load:
	flw	f0,	0(x5)
	lb	x20,	10(x31)
	flw	f1,	0(x6)
	lw	x21,	16(x31)
	fld	f2,	0(x7)
	ld	x22,	24(x31)



TEST_PASSFAIL

RVTEST_CODE_END

.data

RVTEST_DATA_BEGIN
  TEST_DATA

inp_data:
  val1:	.float	496.59	//f0
  val2:	.float	273.372	//f1
  val3:	.double	751.61	//f2
  val4:	.double	-236.65	//f3
  val5:	.float	806.546	//f4
  val6:	.float	62.00		//f5
int_data:
  .word 0x06627912
  .word 0xACBDEFEF
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

inp_float:
  .float 2.5
  .float 3.5
  .float 4.5
  .float 5.5

RVTEST_DATA_END

