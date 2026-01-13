#include "test_macros.h"
#include "riscv_test.h"

.equ MSIP,  0x02000000

RVTEST_RV64MF
RVTEST_CODE_BEGIN
 
start:

//set up mtvec
la		x5,		trap_handler
csrw	mtvec,	x5

//enable machine software interrupt
li		x6,	(1<<3)
csrw	mie,	x6

//enable global interrupt
csrr	x6,	mstatus
ori	x6,	x6,	(1<<3) 	//mie field
csrw	mstatus,		x6

//trigger software interrupt
li		x6,	MSIP
li		x7,	1
sw		x7,	0(x6)

wait_loop:
wfi
addi	x18,	x18,	1		//interrupt counter
j	wait_loop

trap_handler:
csrr	x6,	mcause
bgez	x6,	handle_except	//msb=0--->exception

handle_interrupt:
li		x7,	3	//mti status
andi	x8,	x6,	0xff 			//masking off lower 8 bits to get only value 7 for comparison
beq	x8,	x7,	software_interrupt
j	trap_exit

software_interrupt:
li		x6,	MSIP
li		x9,	0
sw		x9,	0(x6)
j	trap_exit

handle_except:
j	handle_except

trap_exit:
mret


TEST_PASSFAIL
RVTEST_CODE_END
  .data
RVTEST_DATA_BEGIN
  TEST_DATA

inp_data:
  .word 0xDEADBEEF
  .word 0x12345678
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
