# See LICENSE.vyoma for more details 

//#include "test_macros.h"
//#include "riscv_test.h"

RVTEST_RV64M
RVTEST_CODE_BEGIN

  li gp, 3
  li x1, 20

  li x5,2
  csrs misa,x5



init:             
                  li x0, 0x80000000
                  li x1, 0x7
                  li x2, 0xd28b74e1
                  li x3, 0x0
                  li x4, 0x80000000
                  li x5, 0x85f08ea
                  li x6, 0xf
                  li x7, 0xfa836763
                  li x8, 0x80000000
                  li x9, 0x80000000
                  li x10, 0xff7e8d26
                  li x11, 0xf696999d
                  li x12, 0x2
                  li x13, 0x0
                  li x14, 0xafe9c96c
                  li x15, 0x3
                  li x16, 0x80000000
                  li x17, 0xf92c9e7c
                  li x18, 0xff095826
                  li x19, 0xf209087f
                  li x20, 0xd
                  li x21, 0x470bd7a2
                  li x22, 0x80000000
                  li x23, 0xf1349728
                  li x24, 0xf4089e25
                  li x25, 0x80000000
                  li x26, 0x1
                  li x27, 0x80000000
                  li x28, 0x80000000
                  li x29, 0x0
                  li x30, 0x5347d856
                  li x31, 0xf20cf6fa
                  la x28, user_stack_end
main:             li           s7, 0x0 #start riscv_cuzco_directed_instr_lib_1
                  li           a0, 0x0
                  li           a3, 0x0
                  li           s3, 0x26777fb2e1ffd1e0
                  li           gp, 0x6dfafedd663bb3dc
                  li           t1, 0x4bf816b8ee2d3b46
                  li           a6, 0x0
                  li           t5, 0x0
                  li           s0, 0xffffffffffffffff
                  li           ra, 0x0
                  sh2add       t1, s3, gp
                  rem          a6, ra, gp
                  add          t1, ra, s0
                  sub          ra, s0, a3
                  nop
                  sh1add.uw    s7, a6, a3
                  lui          gp, 936265
                  addi         a0, t5, -1817
                  sub          s0, s7, s7
                  divu         a3, ra, s0
                  subw         a0, ra, s3
                  mulhu        s3, s7, s3
                  add          gp, gp, t5
                  mul          t1, s3, t1
                  nop
                  divuw        gp, s3, a6
                  addi         s0, a6, -1308
                  divuw        t5, s0, s0
                  mul          s0, t5, a6
                  sh1add.uw    t1, s3, ra
                  mulhu        a0, a0, gp
                  sub          s0, t1, a3
                  mulh         s3, s0, t5
                  sh3add       t1, gp, a6
                  mul          s7, a3, s7
                  add          a3, a0, t5
                  remw         a6, a0, s3
                  mulhu        a6, s3, a0
                  sub          s3, s7, t1
                  remw         a3, t1, s3
                  divuw        s3, s3, a6
                  mulhu        a6, t1, a6
                  add.uw       t5, ra, a3
                  lui          gp, 722994
                  sh2add.uw    gp, gp, a3
                  add          gp, gp, s7
                  addw         ra, ra, s0
                  sh2add       t1, gp, s3
                  sub          t5, t1, s0
                  subw         s7, t1, t5
                  mulhsu       a0, t1, a0
                  subw         t5, ra, s0
                  nop
                  sub          a0, gp, s3
                  sh3add.uw    a3, t1, s3
                  remw         s0, a3, a6
                  mulh         a0, s0, ra
                  mulhu        s7, gp, ra
                  auipc        s7, 903810
                  mulhu        a0, s7, t5
                  addi         a6, a0, 2011
                  mulh         t1, a3, a3
                  sh3add.uw    s7, s0, a0
                  rem          s0, s7, a3
                  addiw        ra, t5, 1400
                  addiw        gp, t5, -619
                  addiw        s7, ra, -449
                  add          gp, t5, a0
                  sh1add.uw    a3, s0, s3
                  addi         ra, ra, -1262
                  add.uw       gp, t5, t5
                  rem          s0, s7, s7
                  remuw        a6, ra, t1
                  rem          s3, s0, ra
                  divuw        s3, gp, a0
                  mul          s7, s7, t5
                  sh1add.uw    s3, ra, ra
                  addiw        a0, s3, -432
                  div          t5, a3, a3
                  addi         gp, gp, -83
                  mulhu        ra, s3, s0
                  sh2add       gp, a0, gp
                  mulhsu       t5, a3, a3
                  sh3add.uw    a6, a0, s7
                  sh1add       a6, a3, a0
                  auipc        t1, 499874
                  sh2add       s7, s7, a0
                  lui          a3, 528208
                  mulhu        a6, s0, a3
                  addi         gp, s0, 1353
                  remuw        s7, ra, a6
                  addw         gp, a6, a6
                  divu         s3, s3, s3
                  mulw         t5, ra, t1
                  auipc        ra, 787326
                  addi         a6, s7, 1164
                  divw         t1, a3, gp
                  div          ra, gp, ra
                  divu         gp, s3, ra
                  mulhu        s3, a0, gp
                  sh3add       a3, a0, a6
                  nop
                  sh2add.uw    ra, s0, gp
                  divw         a0, t1, t1
                  lui          s3, 159246
                  auipc        gp, 200233
                  remuw        ra, s7, t1
                  rem          ra, a3, a3
                  sh1add.uw    s0, a0, gp
                  sh3add       a0, ra, s7
                  sh3add.uw    ra, ra, a3
                  remw         s0, s7, a6
                  sh3add       ra, ra, a6
                  add          gp, a6, ra
                  addi         a6, ra, 1561
                  subw         a6, t5, t5
                  remu         t5, s3, s7
                  sh3add       a0, t1, s0
                  mulhsu       t1, a0, s3
                  addi         ra, ra, -941
                  divu         t5, s7, gp
                  sh1add       t1, a0, a6
                  mul          a0, s3, t5
                  sh3add       s0, gp, t1
                  divw         gp, a3, a3
                  addw         a0, s0, a3
                  lui          a0, 869977
                  sh2add.uw    ra, a3, t5
                  mulw         t1, s3, gp
                  sub          t5, s7, s3
                  remw         t5, t1, ra
                  addi         a0, s3, 1956
                  sh3add       t1, a3, a3
                  nop
                  addiw        t1, a0, -954
                  rem          s0, ra, s0
                  sh1add       a6, gp, s7
                  remu         t1, t5, t5
                  add.uw       a0, gp, t5
                  add          ra, s7, a6
                  sh3add       ra, t1, ra
                  mulw         a3, s3, t1
                  remu         gp, t1, t5
                  sh2add       s7, s3, s0
                  nop
                  addw         t1, gp, a0
                  add.uw       s7, s7, t5
                  mulh         a0, t5, s7
                  remuw        s0, a6, s0
                  sh1add.uw    a3, t5, a6
                  rem          s7, s3, s0
                  sub          gp, s0, s0
                  auipc        gp, 667572
                  sh2add       s7, t5, s7
                  remu         a0, s0, gp
                  divu         t5, t5, s3
                  remw         t5, t5, a0
                  add          s7, ra, a0
                  sub          a3, t1, a0
                  remw         ra, ra, a3
                  add          a6, s7, s7
                  mul          ra, s0, t1
                  add.uw       a6, s0, a3
                  mul          t1, t1, a0
                  sh3add       a6, t1, t5
                  mulw         ra, a0, gp
                  sh3add.uw    ra, ra, a3
                  addw         s7, ra, a6
                  add          a3, ra, t5
                  rem          gp, s7, gp
                  divu         a3, gp, s0
                  remuw        s0, a3, t1
                  addw         s3, t1, s7
                  sh3add       s7, a0, s0
                  remu         a3, ra, s7
                  rem          a3, a0, a3
                  sh3add       a0, a3, s3
                  sub          a6, a6, gp
                  div          a3, ra, t5
                  lui          a6, 490667
                  divu         a3, s3, gp
                  rem          s7, t5, ra
                  mul          a0, ra, ra
                  remuw        ra, ra, t1
                  mulh         s3, t1, t1
                  sh3add       t5, ra, gp
                  remw         gp, a3, t1
                  addi         s0, gp, -990
                  mul          s7, t1, s3
                  divw         t5, s7, gp
                  addi         a3, t1, 1966
                  auipc        gp, 658712
                  divu         a0, a0, a6
                  divw         ra, a6, t1
                  remu         s7, a3, t1 #end riscv_cuzco_directed_instr_lib_1
                  nop
                  mulhu        s4, t4, s6
                  sh1add       t6, t0, a4
                  addi         s8, tp, -857
                  srai         t0, zero, 31
                  xori         a4, a7, 1395
                  mulh         ra, s5, a7
                  slliw        t5, s2, 4
                  add          s10, s7, tp
                  mulhsu       s7, s4, s7
                  mulw         s8, tp, s10
                  csrrci       s2, 0x340, 18
                  xor          ra, t4, t3
                  divw         gp, tp, s8
                  add.uw       s10, s4, a1
                  srli         s10, s6, 45
                  srl          t2, t5, s4
                  addi         a4, s2, 656
                  add          a0, a6, t5
                  auipc        t0, 897285
                  slti         t1, s0, -1657
                  sll          s4, zero, tp
                  slt          a1, a4, s0
                  srai         t1, a1, 59
                  sh2add       a0, s5, s10
                  sllw         a1, a3, a0
                  slt          sp, t0, a5
                  mulw         ra, s11, s11
                  csrrc        a6, 0x340, t4
                  sh2add.uw    a4, a2, tp
                  srl          s4, gp, s9
                  mulw         t1, s7, t3
                  remu         s11, tp, s7
                  sraw         s0, a2, a7
                  remuw        ra, s6, a7
                  sra          s9, s9, t0
                  srli         s4, a1, 44
                  sh1add.uw    t2, s0, s3
                  sra          s11, s1, sp
                  mulhsu       a5, t5, a0
                  divuw        gp, a6, sp
                  lui          s4, 269390
                  nop
                  divuw        t0, a5, a1
                  slt          s2, a6, a4
                  auipc        t0, 480727
                  sub          t4, a5, t2
                  remuw        s11, s9, gp
                  sh2add.uw    s8, sp, t1
                  andi         s3, a2, -1264
                  csrrc        gp, 0x340, s3
                  addw         a3, t1, s11
                  sh2add       a3, t1, a0
                  and          a6, s9, s6
                  sraiw        s10, gp, 16
                  addi         a3, sp, -1428
                  mul          s3, s4, s4
                  xori         s3, a7, 1505
                  sra          s5, a6, tp
                  sh1add.uw    s1, s9, s9
                  slliw        s1, gp, 6
                  srli         s9, a7, 31
                  divw         a0, s5, a6
                  nop
                  subw         a2, a0, t4
                  slliw        tp, s6, 16
                  csrrwi       a1, 0x340, 25
                  divu         s0, s4, ra
                  lui          s1, 485
                  sh3add.uw    s3, s2, s3
                  remuw        s2, a6, t6
                  sh1add.uw    a0, a5, zero
                  andi         a6, zero, 604
                  slti         s4, s8, -352
                  xori         s5, s0, 967
                  xori         zero, s9, -482
                  addi         t5, sp, -1388
                  sh3add.uw    s2, s8, s8
                  srliw        s2, t5, 17
                  sh1add       zero, s3, s5
                  divu         s9, t5, a2
                  addw         t2, s2, s10
                  slt          ra, ra, t4
                  remw         a0, s10, s8
                  remuw        a4, t3, a0
                  srl          a4, t1, a1
                  addiw        zero, a3, -1057
                  auipc        s8, 574299
                  xor          a6, s7, s1
                  divu         s4, ra, t0
                  divuw        tp, t1, a7
                  csrrci       sp, 0x340, 10
                  lui          a5, 1000368
                  csrrwi       t5, 0x340, 3
                  sh3add       a1, s4, t6
                  xori         t1, a2, -74
                  sraw         s9, zero, t5
                  srl          a5, a7, s6
                  csrrsi       tp, 0x340, 0
                  ori          s5, sp, -463
                  divuw        s7, s8, a3
                  add          s1, a5, gp
                  sllw         ra, t4, s9
                  mul          gp, a5, s3
                  csrrs        s10, 0x340, t5
                  divuw        s2, a6, ra
                  sub          a6, s0, a0
                  mulh         s3, s6, a0
                  divuw        a3, s9, tp
                  add.uw       a3, a5, sp
                  addiw        a2, t1, 2044
                  xor          s9, tp, s8
                  mulhu        t4, s2, tp
                  andi         s2, t3, 942
                  ori          tp, s2, -1660
                  remuw        s0, s11, s3
                  sraw         t2, tp, t6
                  slt          s5, s5, t3
                  slti         t5, a1, -1015
                  ori          t6, gp, 1599
                  sh1add       t4, s5, a3
                  csrrc        s2, 0x340, zero
                  sh1add.uw    sp, t4, s10
                  sh3add       s5, gp, t0
                  andi         s10, t2, 1058
                  sltu         t0, a0, ra
                  div          s4, a1, s6
                  add          s9, gp, t1
                  slliw        a5, s3, 29
                  csrrc        gp, 0x340, s1
                  srliw        zero, a2, 11
                  remu         a2, s10, s8
                  srl          a2, s4, zero
                  csrrsi       t0, 0x340, 0
                  nop
                  divw         s4, s9, t4
                  sh3add       a0, s8, gp
                  addi         s4, t2, -1394
                  rem          a5, s11, s7
                  srai         t1, a3, 6
                  sltu         gp, s7, t4
                  divu         zero, s4, s8
                  xori         s1, a2, -1269
                  add          s3, s8, t2
                  csrrci       s1, 0x340, 0
                  addi         s11, t6, -1725
                  sra          s4, t4, s7
                  srlw         a4, gp, s8
                  sraw         t1, s7, s7
                  slliw        t0, sp, 26
                  divuw        a0, a5, a7
                  or           s1, s7, s7
                  add.uw       ra, sp, s11
                  sh2add       a4, s3, t1
                  rem          s0, sp, a3
                  divu         s7, s0, s5
                  xori         a2, ra, -1117
                  divw         s5, s6, s2
                  slli         gp, s9, 23
                  srlw         sp, s9, t5
                  sh3add.uw    s11, s5, s6
                  ori          s8, s7, 52
                  sh2add.uw    t2, s9, t1
                  nop
                  divuw        sp, sp, t0
                  srl          tp, s9, t1
                  add          s8, t5, s5
                  sllw         t1, s4, s10
                  sh2add       s8, t0, t1
                  subw         s11, a3, a0
                  sh3add       a5, s11, s0
                  srlw         s0, s9, s2
                  divu         s11, a1, zero
                  csrrwi       t6, 0x340, 4
                  addiw        t6, t3, 1879
                  slt          s2, s3, s4
                  andi         a1, a3, 1986
                  mul          s0, a3, a6
                  csrrwi       s1, 0x340, 23
                  ori          gp, t5, 118
                  remuw        t1, s5, s1
                  csrrs        gp, 0x340, t6
                  remuw        t0, t6, s10
                  div          a1, a5, a3
                  csrrc        t0, 0x340, t6
                  slli         t2, s0, 7
                  srli         s3, t2, 1
                  sllw         t1, sp, t0
                  lui          t5, 716350
                  addiw        a5, s4, -2014
                  csrrsi       t1, 0x340, 0
                  auipc        a4, 379773
                  srli         a1, a6, 49
                  csrrci       a1, 0x340, 16
                  div          a4, gp, sp
                  slli         s3, t0, 35
                  slliw        s2, s7, 5
                  remuw        t0, t4, s9
                  csrrc        a0, 0x340, a7
                  and          s3, s7, s2
                  sra          s5, a6, s2
                  and          a4, a6, gp
                  remu         t2, s10, t1
                  divw         t0, t3, s5
                  sraw         s0, sp, s8
                  slliw        t0, s9, 20
                  sraiw        s3, s10, 23
                  csrrs        s5, 0x340, s11
                  remu         s4, a5, a2
                  divw         zero, s7, s1
                  srai         t0, s9, 20
                  sh1add       a2, a3, sp
                  sh2add       a0, ra, a1
                  divuw        a0, a5, zero
                  andi         s7, ra, -367
                  addi         a4, ra, -1458
                  srli         tp, a6, 11
                  csrrsi       s3, 0x340, 14
                  lui          tp, 916622
                  xor          t2, t6, a6
                  mulhsu       zero, a2, gp
                  csrrci       tp, 0x340, 0
                  sll          t4, s1, a2
                  slt          s2, t4, s1
                  divu         s4, s0, s4
                  csrrs        t2, 0x340, s11
                  sltiu        s11, s11, 1314
                  auipc        t1, 509236
                  srli         a4, a2, 63
                  addw         a5, s4, s8
                  lui          a5, 276683
                  srliw        s3, s7, 18
                  sh2add.uw    tp, s11, a6
                  csrrsi       tp, 0x340, 0
                  sub          s0, a2, s10
                  div          a5, a4, s3
                  lui          zero, 330873
                  remuw        s1, t1, tp
                  sub          t6, tp, t0
                  div          zero, s8, sp
                  sltiu        a5, s10, 541
                  csrrci       sp, 0x340, 30
                  or           tp, s11, t3
                  srl          s7, t2, s11
                  addi         a3, t6, -2030
                  xori         s11, a6, 326
                  sllw         s5, s5, t5
                  mulh         a4, s9, a0
                  slliw        sp, t2, 27
                  or           a3, a2, s10
                  slt          s4, s6, zero
                  remuw        a5, s2, s10
                  slli         s10, s8, 15
                  divuw        a6, t1, sp
                  srliw        s1, s11, 26
                  sh2add.uw    s3, a4, s7
                  rem          t6, a5, s9
                  srai         a2, a7, 46
                  sraw         s4, s0, s7
                  addi         t0, s0, 694
                  srli         s4, s10, 0
                  sh1add.uw    t6, a5, sp
                  srlw         a6, a2, a3
                  csrrs        s1, 0x340, s10
                  sh2add.uw    a0, t1, t6
                  andi         s1, sp, -879
                  ori          ra, gp, 2036
                  rem          t2, t2, gp
                  csrrsi       a5, 0x340, 6
                  nop
                  sh1add       a3, t1, s0
                  remu         s0, s10, zero
                  nop
                  srliw        s10, a4, 11
                  srliw        s11, t3, 27
                  sh2add       t2, s0, s6
                  sh3add       a4, zero, a3
                  xori         a4, s2, -942
                  slt          t0, tp, s11
                  sll          a6, t0, t3
                  xor          sp, t4, a5
                  addw         s2, a2, s0
                  addw         tp, a6, a1
                  nop
                  sh2add.uw    s9, s7, a0
                  mulhu        a1, a5, ra
                  remw         a6, gp, s2
                  csrrs        s2, 0x340, ra
                  srai         a2, s11, 54
                  sltiu        a1, zero, 294
                  slti         tp, s4, -1722
                  srli         a4, a5, 41
                  lui          a4, 582601
                  sraiw        s0, s7, 18
                  srli         a3, s9, 62
                  sltiu        s0, ra, -1842
                  csrrwi       tp, 0x340, 12
                  csrrsi       s3, 0x340, 0
                  csrrs        s7, 0x340, t1
                  srliw        s7, gp, 6
                  sraiw        a5, t3, 31
                  sh3add.uw    a0, sp, sp
                  xori         s5, a0, 328
                  sh1add       a2, a5, a3
                  sh2add       t0, t2, zero
                  remuw        t0, t6, s9
                  rem          s9, sp, s5
                  slli         s4, s8, 51
                  slliw        t1, t4, 12
                  mulw         s11, s3, s1
                  csrrsi       s10, 0x340, 0
                  srai         s9, a6, 44
                  mulhu        s9, t1, s2
                  div          t2, a6, s6
                  addiw        t1, tp, 1455
                  auipc        gp, 232632
                  srliw        t0, s8, 5
                  andi         a4, a6, -1335
                  auipc        s1, 921217
                  sh2add       a1, s4, s1
                  slt          s8, t0, zero
                  subw         s10, s4, s10
                  mulhsu       zero, sp, t2
                  csrrc        s8, 0x340, ra
                  remuw        s3, a3, sp
                  divuw        s11, s4, a3
                  slliw        a0, s2, 15
                  srlw         a5, a3, s3
                  sll          t5, gp, a2
                  nop
                  mul          a5, s11, a4
                  addi         a6, s0, -796
                  add.uw       s0, t5, a3
                  nop
                  mul          s5, sp, t4
                  auipc        a0, 843046
                  sh1add       a2, s3, t2
                  and          s2, s3, t0
                  sllw         s10, s0, s2
                  slliw        a4, s9, 14
                  sh3add.uw    tp, t0, s7
                  sraw         t2, a7, a0
                  slt          a2, t3, s1
                  sraiw        a4, s8, 18
                  srliw        a6, t0, 27
                  rem          a6, t1, s6
                  slti         a2, a5, 1375
                  subw         s11, a0, a6
                  remuw        zero, t5, a2
                  slt          t1, a1, s1
                  mulw         a5, a6, zero
                  ori          t5, s3, 1872
                  slli         ra, t1, 8
                  sll          s0, s7, ra
                  sh3add       a3, a7, s8
                  divuw        sp, s11, a7
                  and          t6, a0, sp
                  slt          t2, s5, sp
                  slliw        a1, s4, 9
                  slliw        zero, s7, 11
                  nop
                  srlw         a1, a1, s1
                  sh3add.uw    a5, tp, s0
                  csrrsi       s7, 0x340, 24
                  addi         s3, s9, -371
                  addiw        t6, t4, -502
                  csrrwi       s11, 0x340, 3
                  divuw        zero, s7, t6
                  sra          s2, s1, s5
                  sh1add.uw    s5, a7, t3
                  csrrci       sp, 0x340, 28
                  srliw        s10, a3, 30
                  sh3add       s2, a1, a3
                  divuw        t0, t1, t1
                  csrrsi       tp, 0x340, 24
                  slliw        a6, t0, 19
                  sllw         s2, t0, s8
                  sh3add.uw    s0, a5, ra
                  divuw        a1, s4, s2
                  addiw        gp, t6, 948
                  sraw         a4, s4, a0
                  or           t4, t2, a2
                  divw         s8, t5, a4
                  sllw         ra, ra, ra
                  sraw         s4, a7, t5
                  sub          s10, s7, s3
                  remw         tp, s0, s4
                  srai         a5, t6, 2
                  slliw        a2, s2, 19
                  csrrw        a6, 0x340, t6
                  slli         t1, s11, 15
                  sraiw        a3, ra, 9
                  nop
                  lui          a2, 425051
                  or           s1, s9, a1
                  sraw         t5, a3, a3
                  sh1add       a0, s3, s3
                  srliw        a6, a1, 19
                  mulhsu       sp, a0, t0
                  sh1add.uw    s5, s8, s11
                  csrrsi       s3, 0x340, 0
                  sra          a5, s10, s3
                  csrrw        a1, 0x340, t4
                  srliw        t1, s2, 18
                  addw         s9, s3, a0
                  slli         s9, t4, 49
                  sh1add.uw    a1, t4, t6
                  sllw         s1, t0, s1
                  slliw        a4, sp, 1
                  srliw        s8, s7, 1
                  remuw        zero, s4, a7
                  slliw        s1, s9, 6
                  remw         a2, t4, a6
                  srl          t2, s10, t3
                  sltiu        t1, t3, 1256
                  divw         a6, zero, s5
                  sh3add.uw    s7, t0, s10
                  srliw        t2, s10, 4
                  nop
                  divuw        s9, a6, a1
                  sltiu        s10, a7, 566
                  sltiu        s1, a6, -1468
                  sllw         s0, t3, t2
                  srai         s11, t0, 12
                  add          s10, s7, s11
                  addiw        s2, sp, 1516
                  lui          a0, 506307
                  sh2add       t0, s0, t5
                  remw         t2, s11, t3
                  csrrsi       s5, 0x340, 0
                  srli         a1, tp, 26
                  csrrsi       a0, 0x340, 0
                  mul          tp, a3, ra
                  divw         s11, s10, s5
                  rem          a4, s2, s9
                  addiw        s7, t4, 2
                  li           sp, 0x7fa2de93915acc25 #start riscv_cuzco_directed_instr_lib_0
                  li           s3, 0x8000000000000000
                  li           a6, 0xffffffffffffffff
                  li           a3, 0x8ab7209d5dd7d3c5
                  li           s8, 0xffffffffffffffff
                  li           a0, 0x0
                  li           s10, 0xffffffffffffffff
                  li           s4, 0x0
                  li           t5, 0xffffffffffffffff
                  li           t6, 0x8000000000000000
                  divu         a3, s10, s4
                  mul          s4, s10, s4
                  sh3add.uw    s3, s10, t6
                  add          s4, t5, t5
                  addi         t6, s4, 1164
                  remu         sp, s8, s8
                  sh3add.uw    a6, sp, s10
                  addiw        t6, a3, 1067
                  mulhsu       sp, t5, a6
                  mulhsu       a3, a0, s3
                  remu         s8, s8, s3
                  mulh         s3, s8, a6
                  divw         s8, t5, a6
                  sh3add       s10, s8, s8
                  add          t6, t5, s10
                  mulhsu       a0, t6, a6
                  addw         s3, s3, s4
                  mulhu        s10, s8, sp
                  lui          t6, 139616
                  sh1add.uw    t6, s4, a0
                  lui          t5, 511497
                  sh3add.uw    a0, a0, s4
                  lui          a6, 402583
                  divuw        sp, s8, t6
                  remu         sp, s10, a0
                  sh1add       s8, s3, t5
                  nop
                  sh1add       t5, s3, s10
                  mulw         s10, s10, t5
                  sh2add.uw    t5, s10, a6
                  nop
                  divuw        a0, a0, t6
                  sub          a6, t6, a6
                  mulhu        s4, s3, t5
                  sh2add.uw    s10, sp, a6
                  remu         t5, a6, sp
                  divu         a0, sp, sp
                  addw         s4, a6, s4
                  divuw        a0, t6, t5
                  divuw        s8, s4, s10
                  sh2add.uw    sp, s4, s8
                  nop
                  mulhu        a6, s3, a6
                  div          s4, s4, a3
                  sh3add       s4, t5, a6
                  remw         sp, a6, s8
                  divw         a0, sp, a0
                  divw         s4, s8, s3
                  sub          a3, s8, t5
                  rem          s4, a3, sp
                  divu         a6, a6, sp
                  mul          a0, sp, s3
                  remuw        t5, t6, a6
                  sh2add.uw    t5, s10, a3
                  addi         s10, a3, -1514
                  add          s10, sp, a0
                  sh3add       a6, sp, t5
                  remw         t6, a6, s3
                  sh1add.uw    s4, s10, a6
                  add          a3, s8, a6
                  nop
                  mulhu        s4, sp, sp
                  divu         s10, a6, t5
                  mulhu        s10, sp, t6
                  addiw        sp, s3, 1160
                  remuw        s8, t6, a3
                  mulhu        s3, s8, a3
                  mulhu        s4, a0, t5
                  sh1add.uw    t6, sp, t5
                  mulh         a0, a6, t5
                  sh1add.uw    s4, s3, t6
                  mul          t6, sp, s4
                  sh3add       a3, sp, a0
                  mulh         s8, sp, s10
                  mulhu        t5, s3, a0
                  mulhu        s10, s8, a0
                  mulhsu       a3, a6, sp
                  sh1add       t6, s10, s3
                  divw         t6, s3, s8
                  add          t6, a0, s3
                  sh1add       s4, sp, s4
                  mulhu        a3, t6, a6
                  add.uw       t5, s3, s8
                  sh2add.uw    s8, a0, s8
                  addw         a0, s10, s4
                  addiw        a6, a3, 726
                  divuw        a3, s8, s3
                  mulh         a6, s4, t5
                  remuw        t6, s3, s10
                  mulh         s3, s8, s4
                  divuw        sp, a3, a3
                  subw         a6, sp, s4
                  subw         s4, s4, a3
                  mulhsu       t5, a3, s3
                  subw         s10, sp, s10
                  divw         s4, a0, a6
                  addi         sp, s10, -295
                  sh2add.uw    s3, a0, s10
                  mulh         s4, s3, s10
                  remu         a3, a0, t6
                  lui          s8, 144834
                  sh3add.uw    a6, sp, a3
                  subw         s3, t6, a6
                  sub          a0, s8, t5
                  add.uw       a3, s8, s4
                  auipc        s10, 430257
                  divuw        t6, a6, s3
                  sh1add.uw    t6, sp, a3
                  mulh         t5, t5, a3
                  div          s3, sp, s4
                  sub          s10, s3, a3
                  auipc        s3, 250889
                  remuw        t5, sp, s10
                  addi         t5, sp, -1440
                  add          a6, t6, sp
                  mulw         s8, s3, s8
                  subw         a0, s10, t6
                  sub          sp, a3, t5
                  add.uw       a0, s4, a3
                  divw         s4, a3, a3
                  subw         a0, s4, a6
                  lui          sp, 1047254
                  addiw        sp, s10, 614
                  lui          s8, 269719
                  lui          s8, 370007
                  remuw        a6, s10, sp
                  mulh         a6, a0, s10
                  sh3add.uw    t6, t6, a6
                  sh2add       s10, t6, t5
                  rem          a6, s4, a6
                  remw         a6, a0, s3
                  remuw        s4, sp, t5
                  mulhsu       s8, s4, a0
                  lui          a3, 938346
                  subw         s10, t6, s3
                  subw         s4, sp, s10
                  mulhsu       s4, s8, s3
                  nop
                  sh2add       s4, a6, a0
                  divu         a3, t5, s3
                  nop
                  sh1add       a6, a3, a0
                  div          s4, a6, t6
                  divu         t6, t5, t5
                  div          s3, t5, a0
                  mulw         t5, t6, a3
                  add.uw       s10, s8, s4
                  addi         s8, s10, -234
                  mul          s4, s8, t5
                  sub          s10, a3, t5
                  add          sp, sp, s10
                  subw         s3, a6, s3
                  add          s3, s3, a0
                  remw         s3, t5, t6
                  sh2add.uw    s4, a6, s8
                  sh2add       s8, s8, t5
                  sh2add       s3, t5, sp
                  add          s10, a0, s10
                  remw         s4, t5, sp
                  sh1add       s8, s3, a0
                  mulhsu       s3, a6, s8
                  add          s10, sp, a6
                  mulhu        s10, t6, a3
                  mul          s3, sp, t5
                  divw         s3, t5, a0
                  addw         a6, t5, s4
                  mul          s3, s3, a3
                  add          s3, a3, s8
                  remw         s3, sp, t5
                  sh2add.uw    sp, s10, t5
                  sh3add.uw    a3, t6, a3
                  nop
                  add          t5, s3, sp
                  sh1add.uw    s3, s8, s10
                  remw         s8, a6, t6
                  sh3add.uw    t6, t5, s10
                  addi         s4, s10, -384
                  mulhsu       a3, s4, s8
                  subw         s8, a0, a0
                  add          s8, s10, t5
                  divu         a6, s3, s3
                  mulh         s4, s10, s3
                  nop
                  divu         a3, s4, t6
                  addw         s3, t6, s10
                  remu         s3, a6, a6
                  sh2add       s8, s3, sp
                  addw         t6, sp, a0
                  subw         t6, a3, a0
                  remu         t6, s10, t5
                  div          t6, s10, a0
                  sh1add.uw    sp, sp, t5
                  remu         sp, a0, s4
                  remuw        sp, a0, s10
                  mulhu        a3, s10, s4
                  addiw        sp, t5, 1219
                  mulhsu       s10, t6, a0
                  sh2add.uw    a3, t5, a0
                  sh3add       a6, t6, s10
                  sh1add.uw    t5, sp, s4
                  mulw         a0, a0, s8
                  mulh         a6, s10, s4
                  sh3add       a3, a3, a6
                  sh3add.uw    t6, a3, a3
                  add.uw       s3, s4, t6
                  remu         t6, sp, a3
                  subw         t5, s3, t5
                  div          t6, s10, s10
                  divu         t6, s8, s8
                  mulh         sp, s10, a0
                  lui          a6, 905524
                  sh2add.uw    s10, a6, s4
                  add          t5, s4, s8
                  mulhu        a6, t6, t6
                  remuw        t5, t5, s10
                  sh1add       t6, s4, s8
                  sh2add.uw    s8, a3, t5
                  mulhsu       t5, a0, a3
                  subw         a3, a6, a6
                  nop
                  auipc        t5, 338678
                  div          a0, a3, sp
                  sub          s4, t6, a3
                  sh3add.uw    s8, s3, s4
                  addw         a6, a6, s4
                  nop
                  mulh         t5, sp, s4 #end riscv_cuzco_directed_instr_lib_0
                  sh3add.uw    a0, a2, s10
                  srai         s11, s6, 59
                  sllw         t2, a2, s1
                  addi         a5, t5, -1925
                  mul          a5, s11, s0
                  sh3add       a6, gp, s4
                  andi         s2, a7, -109
                  nop
                  csrrci       a0, 0x340, 3
                  sll          a4, s4, ra
                  sraiw        t6, a2, 21
                  remu         a6, s11, gp
                  addi         tp, t4, 1233
                  slti         a4, s4, 1366
                  sra          s5, t2, t5
                  csrrs        tp, 0x340, s9
                  sltu         t2, t0, s4
                  csrrsi       s1, 0x340, 10
                  xor          gp, s7, s1
                  srai         a6, s3, 4
                  sraw         t2, s4, s5
                  ori          sp, tp, -1266
                  sltiu        s11, a0, 1199
                  srli         zero, a0, 34
                  sllw         t5, t6, s10
                  remu         a6, s5, tp
                  sltiu        t6, s8, 1892
                  csrrci       t5, 0x340, 0
                  mulhu        a4, s1, t3
                  divw         s8, s10, s7
                  sra          s1, sp, a1
                  andi         s9, s7, 1758
                  slli         zero, s0, 23
                  addw         t1, s5, s0
                  ori          t2, t2, 809
                  nop
                  sub          a2, s1, s11
                  divu         s7, a6, t0
                  sllw         tp, s10, s6
                  srai         a5, s6, 49
                  sltiu        t1, a4, -56
                  addiw        t1, t4, 1957
                  sh1add.uw    tp, s7, a3
                  remw         a1, a7, s0
                  csrrc        a3, 0x340, s4
                  sraiw        a3, a7, 0
                  div          sp, gp, s5
                  srli         a4, zero, 60
                  xor          t2, a5, s6
                  csrrs        t0, 0x340, s0
                  csrrs        s11, 0x340, s8
                  sh2add.uw    s5, a2, s11
                  sh2add       tp, s4, a5
                  sltiu        t5, s7, -665
                  sh3add       a1, a4, zero
                  sh2add.uw    t1, s9, s7
                  subw         a0, t2, a6
                  sh1add.uw    a3, sp, t0
                  nop
                  mul          a3, a4, zero
                  xor          a2, a0, s4
                  and          a4, a0, t3
                  or           zero, s2, a2
                  sh1add       s2, sp, s10
  #add x10, x7, x6
  #beq x10, x9, flw_test
  TEST_PASSFAIL

RVTEST_CODE_END

  .data

RVTEST_DATA_BEGIN
  TEST_DATA


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












