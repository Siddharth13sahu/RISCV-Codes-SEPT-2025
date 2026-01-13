//****************************************************************************************
//   Copyright 2023 Scaledge India Pvt Ltd - All Rights Reserved.
//   Owner: Snigdharani Pradhan
//   Item : 32c_instruction
//   Date created : 12/11/2025
//***********************************************************************************
//   Description: compressed instructions 
//***********************************************************************************
 
 #include "test_macros.h"
 #include "riscv_test.h"

 RVTEST_RV64UF
 RVTEST_CODE_BEGIN

 test1:
 	c.addi	x8,	8
	c.addi	x9,	31
 	c.add	x8,	x9
 	c.sub	x8,	x9
 	c.mv	x10,	x9

test2:
	c.beqz	x10, done1

done1:
	li	x11, 10

	c.bnez	x10, done2

done2:
	li	x12, 30

test3:
 	c.li	x8,	7
	c.li	x15,	 8
 	c.xor	x8,	x15
	c.or	x8,	x15	
 	c.and	x8,	x15

test4:
 	c.andi	x11, 15
	c.lui	x13, 5	

test5:
	la  	x8,	dta
	c.lw	x9, 	0(x8)
 	c.sw	x9,	8(x8)
 	
test6:
	li sp, 0x80002000
	c.lwsp	x10,	8(sp)
 	c.swsp	x9,	8(sp)
 	
start:
	li	x8,	20
	li	x9,	36
	li	x10,	50

test7:
	c.slli	x8,	4	
	c.srli	x9,	3
	c.srai	x10,	5

test8:
	c.addi16sp	sp,	32
	c.addi4spn	x9,	sp,	8

    c.nop

	TEST_PASSFAIL
 RVTEST_CODE_END

	.data
 RVTEST_DATA_BEGIN
	TEST_DATA
dta:
	.word 0x12345678
 RVTEST_DATA_END
