#include "test_macros.h"
#include "riscv_test.h"
RVTEST_RV64MF
RVTEST_CODE_BEGIN

    csrr x21,	mstatus

                     
    li 	x5,	~(2<<11)
    and	x20,	x20,	x5
    
MPP:                       
    li	x5,	(1<<11)
	 or	x20,	x20,	x5
    
mstatus:                                 
    csrw	mstatus,	x5

setting:
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
 
RVTEST_DATA_END



