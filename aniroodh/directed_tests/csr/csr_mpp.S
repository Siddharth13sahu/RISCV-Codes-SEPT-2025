//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Aniroodh Patnaik 
//   Item : CSR_mpp
//   Date created : 28/12/2025
//***********************************************************************************
//   Description: 
//***********************************************************************************
 
 
#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV64MF
RVTEST_CODE_BEGIN

Initialize:
    csrr	x20,	mstatus

Test_1_clear_MPP:                                 
    
	 li   x5,	~(3<<11)
    and	x20,	x20,	x5
    
Test_2_set_MPP:                              
    
	 li   x5,	(1<<11)						// S=2'b01
	 or	x20,	x20,	x5
    
Test_3_Write_back_mstatus:                                 
    csrw	mstatus,	x5              		// 


Test_4_set_supervisor:
    la	x6,	super
	 csrw	mepc,	x6

	 mret
	 		

super:                                
	 li	x7,	0
    csrr	x5,	sstatus             		// 


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


