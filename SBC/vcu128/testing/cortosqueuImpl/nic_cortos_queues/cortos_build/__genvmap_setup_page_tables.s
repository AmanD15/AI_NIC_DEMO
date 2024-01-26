.section .text.pagetablesetup
.global page_table_setup
page_table_setup:
   set PAGE_TABLE_BASE, %g1
   !PTD: context=0, index=0, level=0, child_p_addr=0x800, p_addr=0xc00
   ! *(PAGE_TABLE_BASE + 0xc00) = ptd(PAGE_TABLE_BASE + 0x800)
   ! make PTD from 0x800
   set 0x800, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0xc00, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTD: context=0, index=0, level=1, child_p_addr=0x0, p_addr=0x800
   ! *(PAGE_TABLE_BASE + 0x800) = ptd(PAGE_TABLE_BASE + 0x0)
   ! make PTD from 0x0
   set 0x0, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x800, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTE: context=0, index=0, level=2,  ppnr=0x0, p_addr=0x0, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x0) = 0x8a (pte)
   set 0x8a, %g2
   set 0x0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=1, level=2,  ppnr=0x40000, p_addr=0x4, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x4) = 0x408a (pte)
   set 0x408a, %g2
   set 0x4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=2, level=2,  ppnr=0x80000, p_addr=0x8, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x8) = 0x808a (pte)
   set 0x808a, %g2
   set 0x8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=3, level=2,  ppnr=0xc0000, p_addr=0xc, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0xc) = 0xc08a (pte)
   set 0xc08a, %g2
   set 0xc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=4, level=2,  ppnr=0x100000, p_addr=0x10, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x10) = 0x1008a (pte)
   set 0x1008a, %g2
   set 0x10, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=5, level=2,  ppnr=0x140000, p_addr=0x14, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x14) = 0x1408a (pte)
   set 0x1408a, %g2
   set 0x14, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=6, level=2,  ppnr=0x180000, p_addr=0x18, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x18) = 0x1808a (pte)
   set 0x1808a, %g2
   set 0x18, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=7, level=2,  ppnr=0x1c0000, p_addr=0x1c, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x1c) = 0x1c08a (pte)
   set 0x1c08a, %g2
   set 0x1c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=8, level=2,  ppnr=0x200000, p_addr=0x20, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x20) = 0x2008a (pte)
   set 0x2008a, %g2
   set 0x20, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=9, level=2,  ppnr=0x240000, p_addr=0x24, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x24) = 0x2408a (pte)
   set 0x2408a, %g2
   set 0x24, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=10, level=2,  ppnr=0x280000, p_addr=0x28, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x28) = 0x2808a (pte)
   set 0x2808a, %g2
   set 0x28, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=11, level=2,  ppnr=0x2c0000, p_addr=0x2c, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x2c) = 0x2c08a (pte)
   set 0x2c08a, %g2
   set 0x2c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=12, level=2,  ppnr=0x300000, p_addr=0x30, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x30) = 0x3008a (pte)
   set 0x3008a, %g2
   set 0x30, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=13, level=2,  ppnr=0x340000, p_addr=0x34, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x34) = 0x3408a (pte)
   set 0x3408a, %g2
   set 0x34, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=14, level=2,  ppnr=0x380000, p_addr=0x38, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x38) = 0x3808a (pte)
   set 0x3808a, %g2
   set 0x38, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=15, level=2,  ppnr=0x3c0000, p_addr=0x3c, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x3c) = 0x3c08a (pte)
   set 0x3c08a, %g2
   set 0x3c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=16, level=2,  ppnr=0x400000, p_addr=0x40, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x40) = 0x4008a (pte)
   set 0x4008a, %g2
   set 0x40, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=17, level=2,  ppnr=0x440000, p_addr=0x44, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x44) = 0x4408a (pte)
   set 0x4408a, %g2
   set 0x44, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=18, level=2,  ppnr=0x480000, p_addr=0x48, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x48) = 0x4808a (pte)
   set 0x4808a, %g2
   set 0x48, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=19, level=2,  ppnr=0x4c0000, p_addr=0x4c, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x4c) = 0x4c08a (pte)
   set 0x4c08a, %g2
   set 0x4c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=20, level=2,  ppnr=0x500000, p_addr=0x50, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x50) = 0x5008a (pte)
   set 0x5008a, %g2
   set 0x50, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=21, level=2,  ppnr=0x540000, p_addr=0x54, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x54) = 0x5408a (pte)
   set 0x5408a, %g2
   set 0x54, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=22, level=2,  ppnr=0x580000, p_addr=0x58, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x58) = 0x5808a (pte)
   set 0x5808a, %g2
   set 0x58, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=23, level=2,  ppnr=0x5c0000, p_addr=0x5c, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x5c) = 0x5c08a (pte)
   set 0x5c08a, %g2
   set 0x5c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=24, level=2,  ppnr=0x600000, p_addr=0x60, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x60) = 0x6008a (pte)
   set 0x6008a, %g2
   set 0x60, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=25, level=2,  ppnr=0x640000, p_addr=0x64, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x64) = 0x6408a (pte)
   set 0x6408a, %g2
   set 0x64, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=26, level=2,  ppnr=0x680000, p_addr=0x68, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x68) = 0x6808a (pte)
   set 0x6808a, %g2
   set 0x68, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=27, level=2,  ppnr=0x6c0000, p_addr=0x6c, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x6c) = 0x6c08a (pte)
   set 0x6c08a, %g2
   set 0x6c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=28, level=2,  ppnr=0x700000, p_addr=0x70, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x70) = 0x7008a (pte)
   set 0x7008a, %g2
   set 0x70, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=29, level=2,  ppnr=0x740000, p_addr=0x74, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x74) = 0x7408a (pte)
   set 0x7408a, %g2
   set 0x74, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=30, level=2,  ppnr=0x780000, p_addr=0x78, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x78) = 0x7808a (pte)
   set 0x7808a, %g2
   set 0x78, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=31, level=2,  ppnr=0x7c0000, p_addr=0x7c, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x7c) = 0x7c08a (pte)
   set 0x7c08a, %g2
   set 0x7c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=32, level=2,  ppnr=0x800000, p_addr=0x80, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x80) = 0x8008e (pte)
   set 0x8008e, %g2
   set 0x80, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=33, level=2,  ppnr=0x840000, p_addr=0x84, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x84) = 0x8408e (pte)
   set 0x8408e, %g2
   set 0x84, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=34, level=2,  ppnr=0x880000, p_addr=0x88, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x88) = 0x8808e (pte)
   set 0x8808e, %g2
   set 0x88, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=35, level=2,  ppnr=0x8c0000, p_addr=0x8c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8c) = 0x8c08e (pte)
   set 0x8c08e, %g2
   set 0x8c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=36, level=2,  ppnr=0x900000, p_addr=0x90, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x90) = 0x9008e (pte)
   set 0x9008e, %g2
   set 0x90, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=37, level=2,  ppnr=0x940000, p_addr=0x94, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x94) = 0x9408e (pte)
   set 0x9408e, %g2
   set 0x94, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=38, level=2,  ppnr=0x980000, p_addr=0x98, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x98) = 0x9808e (pte)
   set 0x9808e, %g2
   set 0x98, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=39, level=2,  ppnr=0x9c0000, p_addr=0x9c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x9c) = 0x9c08e (pte)
   set 0x9c08e, %g2
   set 0x9c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=40, level=2,  ppnr=0xa00000, p_addr=0xa0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xa0) = 0xa008e (pte)
   set 0xa008e, %g2
   set 0xa0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=41, level=2,  ppnr=0xa40000, p_addr=0xa4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xa4) = 0xa408e (pte)
   set 0xa408e, %g2
   set 0xa4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=42, level=2,  ppnr=0xa80000, p_addr=0xa8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xa8) = 0xa808e (pte)
   set 0xa808e, %g2
   set 0xa8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=43, level=2,  ppnr=0xac0000, p_addr=0xac, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xac) = 0xac08e (pte)
   set 0xac08e, %g2
   set 0xac, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=44, level=2,  ppnr=0xb00000, p_addr=0xb0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xb0) = 0xb008e (pte)
   set 0xb008e, %g2
   set 0xb0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=45, level=2,  ppnr=0xb40000, p_addr=0xb4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xb4) = 0xb408e (pte)
   set 0xb408e, %g2
   set 0xb4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=46, level=2,  ppnr=0xb80000, p_addr=0xb8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xb8) = 0xb808e (pte)
   set 0xb808e, %g2
   set 0xb8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=47, level=2,  ppnr=0xbc0000, p_addr=0xbc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xbc) = 0xbc08e (pte)
   set 0xbc08e, %g2
   set 0xbc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=48, level=2,  ppnr=0xc00000, p_addr=0xc0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc0) = 0xc008e (pte)
   set 0xc008e, %g2
   set 0xc0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=49, level=2,  ppnr=0xc40000, p_addr=0xc4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc4) = 0xc408e (pte)
   set 0xc408e, %g2
   set 0xc4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=50, level=2,  ppnr=0xc80000, p_addr=0xc8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc8) = 0xc808e (pte)
   set 0xc808e, %g2
   set 0xc8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=51, level=2,  ppnr=0xcc0000, p_addr=0xcc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xcc) = 0xcc08e (pte)
   set 0xcc08e, %g2
   set 0xcc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=52, level=2,  ppnr=0xd00000, p_addr=0xd0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd0) = 0xd008e (pte)
   set 0xd008e, %g2
   set 0xd0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=53, level=2,  ppnr=0xd40000, p_addr=0xd4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd4) = 0xd408e (pte)
   set 0xd408e, %g2
   set 0xd4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=54, level=2,  ppnr=0xd80000, p_addr=0xd8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd8) = 0xd808e (pte)
   set 0xd808e, %g2
   set 0xd8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=55, level=2,  ppnr=0xdc0000, p_addr=0xdc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xdc) = 0xdc08e (pte)
   set 0xdc08e, %g2
   set 0xdc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=56, level=2,  ppnr=0xe00000, p_addr=0xe0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xe0) = 0xe008e (pte)
   set 0xe008e, %g2
   set 0xe0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=57, level=2,  ppnr=0xe40000, p_addr=0xe4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xe4) = 0xe408e (pte)
   set 0xe408e, %g2
   set 0xe4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=58, level=2,  ppnr=0xe80000, p_addr=0xe8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xe8) = 0xe808e (pte)
   set 0xe808e, %g2
   set 0xe8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=59, level=2,  ppnr=0xec0000, p_addr=0xec, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xec) = 0xec08e (pte)
   set 0xec08e, %g2
   set 0xec, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=60, level=2,  ppnr=0xf00000, p_addr=0xf0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xf0) = 0xf008e (pte)
   set 0xf008e, %g2
   set 0xf0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=61, level=2,  ppnr=0xf40000, p_addr=0xf4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xf4) = 0xf408e (pte)
   set 0xf408e, %g2
   set 0xf4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=62, level=2,  ppnr=0xf80000, p_addr=0xf8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xf8) = 0xf808e (pte)
   set 0xf808e, %g2
   set 0xf8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=63, level=2,  ppnr=0xfc0000, p_addr=0xfc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xfc) = 0xfc08e (pte)
   set 0xfc08e, %g2
   set 0xfc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=8, level=2,  ppnr=0x200000, p_addr=0x20, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x20) = 0x20016 (pte)
   set 0x20016, %g2
   set 0x20, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=9, level=2,  ppnr=0x240000, p_addr=0x24, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x24) = 0x24016 (pte)
   set 0x24016, %g2
   set 0x24, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=10, level=2,  ppnr=0x280000, p_addr=0x28, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x28) = 0x28016 (pte)
   set 0x28016, %g2
   set 0x28, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=11, level=2,  ppnr=0x2c0000, p_addr=0x2c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2c) = 0x2c016 (pte)
   set 0x2c016, %g2
   set 0x2c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=12, level=2,  ppnr=0x300000, p_addr=0x30, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x30) = 0x30016 (pte)
   set 0x30016, %g2
   set 0x30, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=13, level=2,  ppnr=0x340000, p_addr=0x34, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x34) = 0x34016 (pte)
   set 0x34016, %g2
   set 0x34, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=14, level=2,  ppnr=0x380000, p_addr=0x38, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x38) = 0x38016 (pte)
   set 0x38016, %g2
   set 0x38, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=15, level=2,  ppnr=0x3c0000, p_addr=0x3c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x3c) = 0x3c016 (pte)
   set 0x3c016, %g2
   set 0x3c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=16, level=2,  ppnr=0x400000, p_addr=0x40, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x40) = 0x40016 (pte)
   set 0x40016, %g2
   set 0x40, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=17, level=2,  ppnr=0x440000, p_addr=0x44, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x44) = 0x44016 (pte)
   set 0x44016, %g2
   set 0x44, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=18, level=2,  ppnr=0x480000, p_addr=0x48, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x48) = 0x48016 (pte)
   set 0x48016, %g2
   set 0x48, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=19, level=2,  ppnr=0x4c0000, p_addr=0x4c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x4c) = 0x4c016 (pte)
   set 0x4c016, %g2
   set 0x4c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=20, level=2,  ppnr=0x500000, p_addr=0x50, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x50) = 0x50016 (pte)
   set 0x50016, %g2
   set 0x50, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=21, level=2,  ppnr=0x540000, p_addr=0x54, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x54) = 0x54016 (pte)
   set 0x54016, %g2
   set 0x54, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=22, level=2,  ppnr=0x580000, p_addr=0x58, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x58) = 0x58016 (pte)
   set 0x58016, %g2
   set 0x58, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=23, level=2,  ppnr=0x5c0000, p_addr=0x5c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x5c) = 0x5c016 (pte)
   set 0x5c016, %g2
   set 0x5c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=24, level=2,  ppnr=0x600000, p_addr=0x60, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x60) = 0x60016 (pte)
   set 0x60016, %g2
   set 0x60, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=25, level=2,  ppnr=0x640000, p_addr=0x64, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x64) = 0x64016 (pte)
   set 0x64016, %g2
   set 0x64, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=26, level=2,  ppnr=0x680000, p_addr=0x68, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x68) = 0x68016 (pte)
   set 0x68016, %g2
   set 0x68, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=27, level=2,  ppnr=0x6c0000, p_addr=0x6c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x6c) = 0x6c016 (pte)
   set 0x6c016, %g2
   set 0x6c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=28, level=2,  ppnr=0x700000, p_addr=0x70, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x70) = 0x70016 (pte)
   set 0x70016, %g2
   set 0x70, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=29, level=2,  ppnr=0x740000, p_addr=0x74, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x74) = 0x74016 (pte)
   set 0x74016, %g2
   set 0x74, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=30, level=2,  ppnr=0x780000, p_addr=0x78, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x78) = 0x78016 (pte)
   set 0x78016, %g2
   set 0x78, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=31, level=2,  ppnr=0x7c0000, p_addr=0x7c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x7c) = 0x7c016 (pte)
   set 0x7c016, %g2
   set 0x7c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=32, level=2,  ppnr=0x800000, p_addr=0x80, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x80) = 0x80016 (pte)
   set 0x80016, %g2
   set 0x80, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=33, level=2,  ppnr=0x840000, p_addr=0x84, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x84) = 0x84016 (pte)
   set 0x84016, %g2
   set 0x84, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=34, level=2,  ppnr=0x880000, p_addr=0x88, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x88) = 0x88016 (pte)
   set 0x88016, %g2
   set 0x88, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=35, level=2,  ppnr=0x8c0000, p_addr=0x8c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x8c) = 0x8c016 (pte)
   set 0x8c016, %g2
   set 0x8c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=36, level=2,  ppnr=0x900000, p_addr=0x90, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x90) = 0x90016 (pte)
   set 0x90016, %g2
   set 0x90, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=37, level=2,  ppnr=0x940000, p_addr=0x94, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x94) = 0x94016 (pte)
   set 0x94016, %g2
   set 0x94, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=38, level=2,  ppnr=0x980000, p_addr=0x98, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x98) = 0x98016 (pte)
   set 0x98016, %g2
   set 0x98, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=39, level=2,  ppnr=0x9c0000, p_addr=0x9c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x9c) = 0x9c016 (pte)
   set 0x9c016, %g2
   set 0x9c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=40, level=2,  ppnr=0xa00000, p_addr=0xa0, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xa0) = 0xa0016 (pte)
   set 0xa0016, %g2
   set 0xa0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=41, level=2,  ppnr=0xa40000, p_addr=0xa4, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xa4) = 0xa4016 (pte)
   set 0xa4016, %g2
   set 0xa4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=42, level=2,  ppnr=0xa80000, p_addr=0xa8, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xa8) = 0xa8016 (pte)
   set 0xa8016, %g2
   set 0xa8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=43, level=2,  ppnr=0xac0000, p_addr=0xac, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xac) = 0xac016 (pte)
   set 0xac016, %g2
   set 0xac, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=44, level=2,  ppnr=0xb00000, p_addr=0xb0, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xb0) = 0xb0016 (pte)
   set 0xb0016, %g2
   set 0xb0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=45, level=2,  ppnr=0xb40000, p_addr=0xb4, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xb4) = 0xb4016 (pte)
   set 0xb4016, %g2
   set 0xb4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=46, level=2,  ppnr=0xb80000, p_addr=0xb8, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xb8) = 0xb8016 (pte)
   set 0xb8016, %g2
   set 0xb8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=47, level=2,  ppnr=0xbc0000, p_addr=0xbc, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xbc) = 0xbc016 (pte)
   set 0xbc016, %g2
   set 0xbc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=48, level=2,  ppnr=0xc00000, p_addr=0xc0, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xc0) = 0xc0016 (pte)
   set 0xc0016, %g2
   set 0xc0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=49, level=2,  ppnr=0xc40000, p_addr=0xc4, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xc4) = 0xc4016 (pte)
   set 0xc4016, %g2
   set 0xc4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=50, level=2,  ppnr=0xc80000, p_addr=0xc8, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xc8) = 0xc8016 (pte)
   set 0xc8016, %g2
   set 0xc8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=51, level=2,  ppnr=0xcc0000, p_addr=0xcc, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xcc) = 0xcc016 (pte)
   set 0xcc016, %g2
   set 0xcc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=52, level=2,  ppnr=0xd00000, p_addr=0xd0, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xd0) = 0xd0016 (pte)
   set 0xd0016, %g2
   set 0xd0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=53, level=2,  ppnr=0xd40000, p_addr=0xd4, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xd4) = 0xd4016 (pte)
   set 0xd4016, %g2
   set 0xd4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=54, level=2,  ppnr=0xd80000, p_addr=0xd8, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xd8) = 0xd8016 (pte)
   set 0xd8016, %g2
   set 0xd8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=55, level=2,  ppnr=0xdc0000, p_addr=0xdc, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xdc) = 0xdc016 (pte)
   set 0xdc016, %g2
   set 0xdc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=56, level=2,  ppnr=0xe00000, p_addr=0xe0, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xe0) = 0xe0016 (pte)
   set 0xe0016, %g2
   set 0xe0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=57, level=2,  ppnr=0xe40000, p_addr=0xe4, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xe4) = 0xe4016 (pte)
   set 0xe4016, %g2
   set 0xe4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=58, level=2,  ppnr=0xe80000, p_addr=0xe8, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xe8) = 0xe8016 (pte)
   set 0xe8016, %g2
   set 0xe8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=59, level=2,  ppnr=0xec0000, p_addr=0xec, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xec) = 0xec016 (pte)
   set 0xec016, %g2
   set 0xec, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=60, level=2,  ppnr=0xf00000, p_addr=0xf0, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xf0) = 0xf0016 (pte)
   set 0xf0016, %g2
   set 0xf0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=61, level=2,  ppnr=0xf40000, p_addr=0xf4, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xf4) = 0xf4016 (pte)
   set 0xf4016, %g2
   set 0xf4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=62, level=2,  ppnr=0xf80000, p_addr=0xf8, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xf8) = 0xf8016 (pte)
   set 0xf8016, %g2
   set 0xf8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=63, level=2,  ppnr=0xfc0000, p_addr=0xfc, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xfc) = 0xfc016 (pte)
   set 0xfc016, %g2
   set 0xfc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=1, level=1,  ppnr=0x1000000, p_addr=0x804, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x804) = 0x10008e (pte)
   set 0x10008e, %g2
   set 0x804, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTD: context=0, index=2, level=1, child_p_addr=0x100, p_addr=0x808
   ! *(PAGE_TABLE_BASE + 0x808) = ptd(PAGE_TABLE_BASE + 0x100)
   ! make PTD from 0x100
   set 0x100, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x808, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTE: context=0, index=0, level=2,  ppnr=0x2000000, p_addr=0x100, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x100) = 0x20008e (pte)
   set 0x20008e, %g2
   set 0x100, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=1, level=2,  ppnr=0x2040000, p_addr=0x104, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x104) = 0x20408e (pte)
   set 0x20408e, %g2
   set 0x104, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=2, level=2,  ppnr=0x2080000, p_addr=0x108, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x108) = 0x20808e (pte)
   set 0x20808e, %g2
   set 0x108, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=3, level=2,  ppnr=0x20c0000, p_addr=0x10c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x10c) = 0x20c08e (pte)
   set 0x20c08e, %g2
   set 0x10c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=4, level=2,  ppnr=0x2100000, p_addr=0x110, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x110) = 0x21008e (pte)
   set 0x21008e, %g2
   set 0x110, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=5, level=2,  ppnr=0x2140000, p_addr=0x114, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x114) = 0x21408e (pte)
   set 0x21408e, %g2
   set 0x114, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=6, level=2,  ppnr=0x2180000, p_addr=0x118, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x118) = 0x21808e (pte)
   set 0x21808e, %g2
   set 0x118, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=7, level=2,  ppnr=0x21c0000, p_addr=0x11c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x11c) = 0x21c08e (pte)
   set 0x21c08e, %g2
   set 0x11c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=8, level=2,  ppnr=0x2200000, p_addr=0x120, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x120) = 0x22008e (pte)
   set 0x22008e, %g2
   set 0x120, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=9, level=2,  ppnr=0x2240000, p_addr=0x124, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x124) = 0x22408e (pte)
   set 0x22408e, %g2
   set 0x124, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=10, level=2,  ppnr=0x2280000, p_addr=0x128, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x128) = 0x22808e (pte)
   set 0x22808e, %g2
   set 0x128, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=11, level=2,  ppnr=0x22c0000, p_addr=0x12c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x12c) = 0x22c08e (pte)
   set 0x22c08e, %g2
   set 0x12c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=12, level=2,  ppnr=0x2300000, p_addr=0x130, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x130) = 0x23008e (pte)
   set 0x23008e, %g2
   set 0x130, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=13, level=2,  ppnr=0x2340000, p_addr=0x134, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x134) = 0x23408e (pte)
   set 0x23408e, %g2
   set 0x134, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=14, level=2,  ppnr=0x2380000, p_addr=0x138, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x138) = 0x23808e (pte)
   set 0x23808e, %g2
   set 0x138, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=15, level=2,  ppnr=0x23c0000, p_addr=0x13c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x13c) = 0x23c08e (pte)
   set 0x23c08e, %g2
   set 0x13c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=16, level=2,  ppnr=0x2400000, p_addr=0x140, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x140) = 0x24008e (pte)
   set 0x24008e, %g2
   set 0x140, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=17, level=2,  ppnr=0x2440000, p_addr=0x144, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x144) = 0x24408e (pte)
   set 0x24408e, %g2
   set 0x144, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=18, level=2,  ppnr=0x2480000, p_addr=0x148, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x148) = 0x24808e (pte)
   set 0x24808e, %g2
   set 0x148, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=19, level=2,  ppnr=0x24c0000, p_addr=0x14c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x14c) = 0x24c08e (pte)
   set 0x24c08e, %g2
   set 0x14c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=20, level=2,  ppnr=0x2500000, p_addr=0x150, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x150) = 0x25008e (pte)
   set 0x25008e, %g2
   set 0x150, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=21, level=2,  ppnr=0x2540000, p_addr=0x154, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x154) = 0x25408e (pte)
   set 0x25408e, %g2
   set 0x154, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=22, level=2,  ppnr=0x2580000, p_addr=0x158, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x158) = 0x25808e (pte)
   set 0x25808e, %g2
   set 0x158, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=23, level=2,  ppnr=0x25c0000, p_addr=0x15c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x15c) = 0x25c08e (pte)
   set 0x25c08e, %g2
   set 0x15c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=24, level=2,  ppnr=0x2600000, p_addr=0x160, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x160) = 0x26008e (pte)
   set 0x26008e, %g2
   set 0x160, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=25, level=2,  ppnr=0x2640000, p_addr=0x164, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x164) = 0x26408e (pte)
   set 0x26408e, %g2
   set 0x164, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=26, level=2,  ppnr=0x2680000, p_addr=0x168, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x168) = 0x26808e (pte)
   set 0x26808e, %g2
   set 0x168, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=27, level=2,  ppnr=0x26c0000, p_addr=0x16c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x16c) = 0x26c08e (pte)
   set 0x26c08e, %g2
   set 0x16c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=28, level=2,  ppnr=0x2700000, p_addr=0x170, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x170) = 0x27008e (pte)
   set 0x27008e, %g2
   set 0x170, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=29, level=2,  ppnr=0x2740000, p_addr=0x174, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x174) = 0x27408e (pte)
   set 0x27408e, %g2
   set 0x174, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=30, level=2,  ppnr=0x2780000, p_addr=0x178, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x178) = 0x27808e (pte)
   set 0x27808e, %g2
   set 0x178, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=31, level=2,  ppnr=0x27c0000, p_addr=0x17c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x17c) = 0x27c08e (pte)
   set 0x27c08e, %g2
   set 0x17c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=32, level=2,  ppnr=0x2800000, p_addr=0x180, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x180) = 0x28008e (pte)
   set 0x28008e, %g2
   set 0x180, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=33, level=2,  ppnr=0x2840000, p_addr=0x184, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x184) = 0x28408e (pte)
   set 0x28408e, %g2
   set 0x184, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=34, level=2,  ppnr=0x2880000, p_addr=0x188, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x188) = 0x28808e (pte)
   set 0x28808e, %g2
   set 0x188, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=35, level=2,  ppnr=0x28c0000, p_addr=0x18c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x18c) = 0x28c08e (pte)
   set 0x28c08e, %g2
   set 0x18c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=36, level=2,  ppnr=0x2900000, p_addr=0x190, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x190) = 0x29008e (pte)
   set 0x29008e, %g2
   set 0x190, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=37, level=2,  ppnr=0x2940000, p_addr=0x194, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x194) = 0x29408e (pte)
   set 0x29408e, %g2
   set 0x194, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=38, level=2,  ppnr=0x2980000, p_addr=0x198, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x198) = 0x29808e (pte)
   set 0x29808e, %g2
   set 0x198, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=39, level=2,  ppnr=0x29c0000, p_addr=0x19c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x19c) = 0x29c08e (pte)
   set 0x29c08e, %g2
   set 0x19c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=40, level=2,  ppnr=0x2a00000, p_addr=0x1a0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1a0) = 0x2a008e (pte)
   set 0x2a008e, %g2
   set 0x1a0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=41, level=2,  ppnr=0x2a40000, p_addr=0x1a4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1a4) = 0x2a408e (pte)
   set 0x2a408e, %g2
   set 0x1a4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=42, level=2,  ppnr=0x2a80000, p_addr=0x1a8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1a8) = 0x2a808e (pte)
   set 0x2a808e, %g2
   set 0x1a8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=43, level=2,  ppnr=0x2ac0000, p_addr=0x1ac, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1ac) = 0x2ac08e (pte)
   set 0x2ac08e, %g2
   set 0x1ac, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=44, level=2,  ppnr=0x2b00000, p_addr=0x1b0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1b0) = 0x2b008e (pte)
   set 0x2b008e, %g2
   set 0x1b0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=45, level=2,  ppnr=0x2b40000, p_addr=0x1b4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1b4) = 0x2b408e (pte)
   set 0x2b408e, %g2
   set 0x1b4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=46, level=2,  ppnr=0x2b80000, p_addr=0x1b8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1b8) = 0x2b808e (pte)
   set 0x2b808e, %g2
   set 0x1b8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=47, level=2,  ppnr=0x2bc0000, p_addr=0x1bc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1bc) = 0x2bc08e (pte)
   set 0x2bc08e, %g2
   set 0x1bc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=48, level=2,  ppnr=0x2c00000, p_addr=0x1c0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1c0) = 0x2c008e (pte)
   set 0x2c008e, %g2
   set 0x1c0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=49, level=2,  ppnr=0x2c40000, p_addr=0x1c4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1c4) = 0x2c408e (pte)
   set 0x2c408e, %g2
   set 0x1c4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=50, level=2,  ppnr=0x2c80000, p_addr=0x1c8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1c8) = 0x2c808e (pte)
   set 0x2c808e, %g2
   set 0x1c8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=51, level=2,  ppnr=0x2cc0000, p_addr=0x1cc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1cc) = 0x2cc08e (pte)
   set 0x2cc08e, %g2
   set 0x1cc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=52, level=2,  ppnr=0x2d00000, p_addr=0x1d0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1d0) = 0x2d008e (pte)
   set 0x2d008e, %g2
   set 0x1d0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=53, level=2,  ppnr=0x2d40000, p_addr=0x1d4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1d4) = 0x2d408e (pte)
   set 0x2d408e, %g2
   set 0x1d4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=54, level=2,  ppnr=0x2d80000, p_addr=0x1d8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1d8) = 0x2d808e (pte)
   set 0x2d808e, %g2
   set 0x1d8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=55, level=2,  ppnr=0x2dc0000, p_addr=0x1dc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1dc) = 0x2dc08e (pte)
   set 0x2dc08e, %g2
   set 0x1dc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=56, level=2,  ppnr=0x2e00000, p_addr=0x1e0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1e0) = 0x2e008e (pte)
   set 0x2e008e, %g2
   set 0x1e0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=57, level=2,  ppnr=0x2e40000, p_addr=0x1e4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1e4) = 0x2e408e (pte)
   set 0x2e408e, %g2
   set 0x1e4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=58, level=2,  ppnr=0x2e80000, p_addr=0x1e8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1e8) = 0x2e808e (pte)
   set 0x2e808e, %g2
   set 0x1e8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=59, level=2,  ppnr=0x2ec0000, p_addr=0x1ec, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1ec) = 0x2ec08e (pte)
   set 0x2ec08e, %g2
   set 0x1ec, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=60, level=2,  ppnr=0x2f00000, p_addr=0x1f0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1f0) = 0x2f008e (pte)
   set 0x2f008e, %g2
   set 0x1f0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=61, level=2,  ppnr=0x2f40000, p_addr=0x1f4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1f4) = 0x2f408e (pte)
   set 0x2f408e, %g2
   set 0x1f4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=62, level=2,  ppnr=0x2f80000, p_addr=0x1f8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1f8) = 0x2f808e (pte)
   set 0x2f808e, %g2
   set 0x1f8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=63, level=2,  ppnr=0x2fc0000, p_addr=0x1fc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1fc) = 0x2fc08e (pte)
   set 0x2fc08e, %g2
   set 0x1fc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTD: context=0, index=3, level=1, child_p_addr=0x300, p_addr=0x80c
   ! *(PAGE_TABLE_BASE + 0x80c) = ptd(PAGE_TABLE_BASE + 0x300)
   ! make PTD from 0x300
   set 0x300, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x80c, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTE: context=0, index=0, level=2,  ppnr=0x3000000, p_addr=0x300, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x300) = 0x30008e (pte)
   set 0x30008e, %g2
   set 0x300, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=1, level=2,  ppnr=0x3040000, p_addr=0x304, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x304) = 0x30408e (pte)
   set 0x30408e, %g2
   set 0x304, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=2, level=2,  ppnr=0x3080000, p_addr=0x308, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x308) = 0x30808e (pte)
   set 0x30808e, %g2
   set 0x308, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=3, level=2,  ppnr=0x30c0000, p_addr=0x30c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x30c) = 0x30c08e (pte)
   set 0x30c08e, %g2
   set 0x30c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=4, level=2,  ppnr=0x3100000, p_addr=0x310, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x310) = 0x31008e (pte)
   set 0x31008e, %g2
   set 0x310, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=5, level=2,  ppnr=0x3140000, p_addr=0x314, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x314) = 0x31408e (pte)
   set 0x31408e, %g2
   set 0x314, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=6, level=2,  ppnr=0x3180000, p_addr=0x318, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x318) = 0x31808e (pte)
   set 0x31808e, %g2
   set 0x318, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=7, level=2,  ppnr=0x31c0000, p_addr=0x31c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x31c) = 0x31c08e (pte)
   set 0x31c08e, %g2
   set 0x31c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=8, level=2,  ppnr=0x3200000, p_addr=0x320, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x320) = 0x32008e (pte)
   set 0x32008e, %g2
   set 0x320, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=9, level=2,  ppnr=0x3240000, p_addr=0x324, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x324) = 0x32408e (pte)
   set 0x32408e, %g2
   set 0x324, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=10, level=2,  ppnr=0x3280000, p_addr=0x328, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x328) = 0x32808e (pte)
   set 0x32808e, %g2
   set 0x328, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=11, level=2,  ppnr=0x32c0000, p_addr=0x32c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x32c) = 0x32c08e (pte)
   set 0x32c08e, %g2
   set 0x32c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=12, level=2,  ppnr=0x3300000, p_addr=0x330, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x330) = 0x33008e (pte)
   set 0x33008e, %g2
   set 0x330, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=13, level=2,  ppnr=0x3340000, p_addr=0x334, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x334) = 0x33408e (pte)
   set 0x33408e, %g2
   set 0x334, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=14, level=2,  ppnr=0x3380000, p_addr=0x338, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x338) = 0x33808e (pte)
   set 0x33808e, %g2
   set 0x338, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=15, level=2,  ppnr=0x33c0000, p_addr=0x33c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x33c) = 0x33c08e (pte)
   set 0x33c08e, %g2
   set 0x33c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=16, level=2,  ppnr=0x3400000, p_addr=0x340, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x340) = 0x34008e (pte)
   set 0x34008e, %g2
   set 0x340, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=17, level=2,  ppnr=0x3440000, p_addr=0x344, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x344) = 0x34408e (pte)
   set 0x34408e, %g2
   set 0x344, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=18, level=2,  ppnr=0x3480000, p_addr=0x348, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x348) = 0x34808e (pte)
   set 0x34808e, %g2
   set 0x348, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=19, level=2,  ppnr=0x34c0000, p_addr=0x34c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x34c) = 0x34c08e (pte)
   set 0x34c08e, %g2
   set 0x34c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTD: context=0, index=20, level=2, child_p_addr=0x200, p_addr=0x350
   ! *(PAGE_TABLE_BASE + 0x350) = ptd(PAGE_TABLE_BASE + 0x200)
   ! make PTD from 0x200
   set 0x200, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x350, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTE: context=0, index=0, level=3,  ppnr=0x3500000, p_addr=0x200, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x200) = 0x35008e (pte)
   set 0x35008e, %g2
   set 0x200, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=1, level=3,  ppnr=0x3501000, p_addr=0x204, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x204) = 0x35010e (pte)
   set 0x35010e, %g2
   set 0x204, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=2, level=3,  ppnr=0x3502000, p_addr=0x208, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x208) = 0x35028e (pte)
   set 0x35028e, %g2
   set 0x208, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=3, level=3,  ppnr=0x3503000, p_addr=0x20c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x20c) = 0x35038e (pte)
   set 0x35038e, %g2
   set 0x20c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=4, level=3,  ppnr=0x3504000, p_addr=0x210, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x210) = 0x35048e (pte)
   set 0x35048e, %g2
   set 0x210, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=5, level=3,  ppnr=0x3505000, p_addr=0x214, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x214) = 0x35058e (pte)
   set 0x35058e, %g2
   set 0x214, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=6, level=3,  ppnr=0x3506000, p_addr=0x218, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x218) = 0x35068e (pte)
   set 0x35068e, %g2
   set 0x218, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=7, level=3,  ppnr=0x3507000, p_addr=0x21c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x21c) = 0x35078e (pte)
   set 0x35078e, %g2
   set 0x21c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=8, level=3,  ppnr=0x3508000, p_addr=0x220, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x220) = 0x35088e (pte)
   set 0x35088e, %g2
   set 0x220, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=9, level=3,  ppnr=0x3509000, p_addr=0x224, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x224) = 0x35098e (pte)
   set 0x35098e, %g2
   set 0x224, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=10, level=3,  ppnr=0x350a000, p_addr=0x228, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x228) = 0x350a8e (pte)
   set 0x350a8e, %g2
   set 0x228, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=11, level=3,  ppnr=0x350b000, p_addr=0x22c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x22c) = 0x350b8e (pte)
   set 0x350b8e, %g2
   set 0x22c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=12, level=3,  ppnr=0x350c000, p_addr=0x230, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x230) = 0x350c8e (pte)
   set 0x350c8e, %g2
   set 0x230, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=13, level=3,  ppnr=0x350d000, p_addr=0x234, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x234) = 0x350d8e (pte)
   set 0x350d8e, %g2
   set 0x234, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=14, level=3,  ppnr=0x350e000, p_addr=0x238, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x238) = 0x350e8e (pte)
   set 0x350e8e, %g2
   set 0x238, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=15, level=3,  ppnr=0x350f000, p_addr=0x23c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x23c) = 0x350f8e (pte)
   set 0x350f8e, %g2
   set 0x23c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=16, level=3,  ppnr=0x3510000, p_addr=0x240, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x240) = 0x35108e (pte)
   set 0x35108e, %g2
   set 0x240, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=17, level=3,  ppnr=0x3511000, p_addr=0x244, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x244) = 0x35118e (pte)
   set 0x35118e, %g2
   set 0x244, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=18, level=3,  ppnr=0x3512000, p_addr=0x248, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x248) = 0x35128e (pte)
   set 0x35128e, %g2
   set 0x248, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=19, level=3,  ppnr=0x3513000, p_addr=0x24c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x24c) = 0x35138e (pte)
   set 0x35138e, %g2
   set 0x24c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=20, level=3,  ppnr=0x3514000, p_addr=0x250, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x250) = 0x35148e (pte)
   set 0x35148e, %g2
   set 0x250, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=21, level=3,  ppnr=0x3515000, p_addr=0x254, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x254) = 0x35158e (pte)
   set 0x35158e, %g2
   set 0x254, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=22, level=3,  ppnr=0x3516000, p_addr=0x258, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x258) = 0x35168e (pte)
   set 0x35168e, %g2
   set 0x258, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=23, level=3,  ppnr=0x3517000, p_addr=0x25c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x25c) = 0x35178e (pte)
   set 0x35178e, %g2
   set 0x25c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=24, level=3,  ppnr=0x3518000, p_addr=0x260, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x260) = 0x35188e (pte)
   set 0x35188e, %g2
   set 0x260, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=25, level=3,  ppnr=0x3519000, p_addr=0x264, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x264) = 0x35198e (pte)
   set 0x35198e, %g2
   set 0x264, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=26, level=3,  ppnr=0x351a000, p_addr=0x268, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x268) = 0x351a8e (pte)
   set 0x351a8e, %g2
   set 0x268, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=27, level=3,  ppnr=0x351b000, p_addr=0x26c, cacheable=0x1, acc=0x4
   ! *(PAGE_TABLE_BASE + 0x26c) = 0x351b92 (pte)
   set 0x351b92, %g2
   set 0x26c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=28, level=3,  ppnr=0x351c000, p_addr=0x270, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x270) = 0x351c8e (pte)
   set 0x351c8e, %g2
   set 0x270, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=29, level=3,  ppnr=0x351d000, p_addr=0x274, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x274) = 0x351d8e (pte)
   set 0x351d8e, %g2
   set 0x274, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=30, level=3,  ppnr=0x351e000, p_addr=0x278, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x278) = 0x351e8e (pte)
   set 0x351e8e, %g2
   set 0x278, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=31, level=3,  ppnr=0x351f000, p_addr=0x27c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x27c) = 0x351f8e (pte)
   set 0x351f8e, %g2
   set 0x27c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=32, level=3,  ppnr=0x3520000, p_addr=0x280, cacheable=0x1, acc=0x4
   ! *(PAGE_TABLE_BASE + 0x280) = 0x352092 (pte)
   set 0x352092, %g2
   set 0x280, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTD: context=0, index=255, level=1, child_p_addr=0x5fc, p_addr=0xbfc
   ! *(PAGE_TABLE_BASE + 0xbfc) = ptd(PAGE_TABLE_BASE + 0x500)
   ! make PTD from 0x5fc
   set 0x500, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0xbfc, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTD: context=0, index=63, level=2, child_p_addr=0x4c0, p_addr=0x5fc
   ! *(PAGE_TABLE_BASE + 0x5fc) = ptd(PAGE_TABLE_BASE + 0x400)
   ! make PTD from 0x4c0
   set 0x400, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x5fc, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTE: context=0, index=48, level=3,  ppnr=0xffff0000, p_addr=0x4c0, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x4c0) = 0xffff016 (pte)
   set 0xffff016, %g2
   set 0x4c0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=49, level=3,  ppnr=0xffff1000, p_addr=0x4c4, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x4c4) = 0xffff116 (pte)
   set 0xffff116, %g2
   set 0x4c4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=50, level=3,  ppnr=0xffff2000, p_addr=0x4c8, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x4c8) = 0xffff216 (pte)
   set 0xffff216, %g2
   set 0x4c8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=51, level=3,  ppnr=0xffff3000, p_addr=0x4cc, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x4cc) = 0xffff316 (pte)
   set 0xffff316, %g2
   set 0x4cc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=52, level=3,  ppnr=0xffff4000, p_addr=0x4d0, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x4d0) = 0xffff416 (pte)
   set 0xffff416, %g2
   set 0x4d0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=53, level=3,  ppnr=0xffff5000, p_addr=0x4d4, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x4d4) = 0xffff516 (pte)
   set 0xffff516, %g2
   set 0x4d4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=54, level=3,  ppnr=0xffff6000, p_addr=0x4d8, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x4d8) = 0xffff616 (pte)
   set 0xffff616, %g2
   set 0x4d8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=55, level=3,  ppnr=0xffff7000, p_addr=0x4dc, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x4dc) = 0xffff716 (pte)
   set 0xffff716, %g2
   set 0x4dc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=56, level=3,  ppnr=0xffff8000, p_addr=0x4e0, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x4e0) = 0xffff816 (pte)
   set 0xffff816, %g2
   set 0x4e0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=57, level=3,  ppnr=0xffff9000, p_addr=0x4e4, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x4e4) = 0xffff916 (pte)
   set 0xffff916, %g2
   set 0x4e4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=58, level=3,  ppnr=0xffffa000, p_addr=0x4e8, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x4e8) = 0xffffa16 (pte)
   set 0xffffa16, %g2
   set 0x4e8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=59, level=3,  ppnr=0xffffb000, p_addr=0x4ec, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x4ec) = 0xffffb16 (pte)
   set 0xffffb16, %g2
   set 0x4ec, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=60, level=3,  ppnr=0xffffc000, p_addr=0x4f0, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x4f0) = 0xffffc16 (pte)
   set 0xffffc16, %g2
   set 0x4f0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=61, level=3,  ppnr=0xffffd000, p_addr=0x4f4, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x4f4) = 0xffffd16 (pte)
   set 0xffffd16, %g2
   set 0x4f4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=62, level=3,  ppnr=0xffffe000, p_addr=0x4f8, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x4f8) = 0xffffe16 (pte)
   set 0xffffe16, %g2
   set 0x4f8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=63, level=3,  ppnr=0xfffff000, p_addr=0x4fc, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x4fc) = 0xfffff16 (pte)
   set 0xfffff16, %g2
   set 0x4fc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   retl;
   nop;
! done: page_table_setup
! start: set context-table-pointer = PAGE_TABLE_BASE + 0xc00
.global set_context_table_pointer
set_context_table_pointer:
   set PAGE_TABLE_BASE, %g1
   set 0xc00, %g5
   add %g5, %g1, %g2
   srl  %g2, 0x4, %g2
   or  %g2, 0x1, %g2
   set 0x100, %g3
   sta %g2, [%g3] 0x4
   retl;
   nop;
! done: set  context-table-pointer
.align 1024
PAGE_TABLE_BASE: .skip 4096
