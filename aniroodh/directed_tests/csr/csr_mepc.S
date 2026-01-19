//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Aniroodh Patnaik 
//   Item : test_mepc_rd_wr
//   Date created : 
//***********************************************************************************
//   Description: to read and write the mepc handling the trap
//***********************************************************************************
 
 
#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV64MF
RVTEST_CODE_BEGIN

	li		gp,	3
Initialize:
   csrr		x20,	mstatus
	la		x5,	trp_handle
	csrw		mtvec,	x5

Test_1_trp_trigger:                                 
    
	ecall	
	li   	gp,	1
	j		end_trp
    
trp_handle:                              
    
	csrr		x6,	mcause
	csrr		x7,	mepc

	addi		x7,	x7,	4
	csrw		mepc,	x7

	mret

end_trp:
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


