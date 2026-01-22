//****************************************************************************************
//   Copyright 2025 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : tc_marchid
//   Date created : 12/01/2025
//***********************************************************************************
//   Description: Reading from and writing to the machine information register marchid.
//***********************************************************************************

#include "test_macros.h"
#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

start1:
	csrr	x10,	marchid		//0x0000000000000005
	
start2:
	csrw	marchid,x10		//illegal_instruction_exception

TEST_PASSFAIL
RVTEST_CODE_END

.data
RVTEST_DATA_BEGIN
TEST_DATA
RVTEST_DATA_END


