//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Aniroodh Patnaik 
//   Item : CSR Read
//   Date created : 11/07/2025
//***********************************************************************************
//   Description: Testcase says floating point instructions based on RV32F ISA
//***********************************************************************************
 
 
#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV64MF
RVTEST_CODE_BEGIN

Initialize:
    csrr	x20,	mstatus

Test_1_write_ZERO:                                 
    
	 li   x5,	0x0
    csrw	mstatus,	x5
    csrr	x6,	mstatus						// Observe x6 

Test_2_write_ones:                              
    
	 li   x5,	-1								// 0xFFFF...FFFF
    csrw	mstatus,	x5
    csrr	x6,	mstatus						// Observe masked legal value

Test_3_Walking_1s:                                 
    li	x7,	0               			// bit index

walk_ones:
    li	x5,	1
    sll	x5,	x5,	x7          		// x5 = 1 << bit 
    csrw	mstatus,	x5
    csrr	x6,	mstatus						// Observe which bits remains unchanged 

    addi	x7,	x7,	1
    li	x8,	64
    blt	x7,	x8,	walk_ones

Test_4_Walking_0s:                                
	 li	x7,	0

walk_zeros:
    li	x5,	-1
    li	x9,	1
    sll	x9,	x9,	x7
    not	x9,	x9              /* ~(1 << bit) */
    and	x5,	x5,	x9

    csrw	mstatus,	x5
    csrr	x6,	mstatus

    addi	x7,	x7,	1
    li	x8,	64
    blt	x7,	x8,	walk_zeros

Test_5_Alternating_patterns:
    
    li	x5,	0xAAAAAAAAAAAAAAAA
    csrw	mstatus,	x5
    csrr	x6,	mstatus

    li	x5,	0x5555555555555555
    csrw	mstatus,	x5
    csrr	x6,	mstatus

Restore_original_mstatus:                           
    csrw	mstatus,	x20

	 TEST_PASSFAIL
RVTEST_CODE_END
  .data
RVTEST_DATA_BEGIN
  TEST_DATA

inp_data:
  .float 100.25						 	//0
  .float 200.50						 	//4
  .dword 0x00000000 						//8
  .float -200.50 							//10
  .float -200.50 							//10
  .dword 0xabcdef6612345678 			//14
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

