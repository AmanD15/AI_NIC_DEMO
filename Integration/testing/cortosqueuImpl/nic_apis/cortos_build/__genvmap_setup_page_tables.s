.section .text.pagetablesetup
.global page_table_setup
page_table_setup:
   set PAGE_TABLE_BASE, %g1
   !PTD: context=0, index=0, level=0, child_p_addr=0x400, p_addr=0x800
   ! *(PAGE_TABLE_BASE + 0x800) = ptd(PAGE_TABLE_BASE + 0x400)
   ! make PTD from 0x400
   set 0x400, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x800, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTD: context=0, index=0, level=1, child_p_addr=0x200, p_addr=0x400
   ! *(PAGE_TABLE_BASE + 0x400) = ptd(PAGE_TABLE_BASE + 0x200)
   ! make PTD from 0x200
   set 0x200, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x400, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTD: context=0, index=0, level=2, child_p_addr=0x0, p_addr=0x200
   ! *(PAGE_TABLE_BASE + 0x200) = ptd(PAGE_TABLE_BASE + 0x0)
   ! make PTD from 0x0
   set 0x0, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x200, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTE: context=0, index=0, level=3,  ppnr=0x0, p_addr=0x0, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x0) = 0x8a (pte)
   set 0x8a, %g2
   set 0x0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=1, level=3,  ppnr=0x1000, p_addr=0x4, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x4) = 0x18a (pte)
   set 0x18a, %g2
   set 0x4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=2, level=3,  ppnr=0x2000, p_addr=0x8, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x8) = 0x28a (pte)
   set 0x28a, %g2
   set 0x8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=3, level=3,  ppnr=0x3000, p_addr=0xc, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0xc) = 0x38a (pte)
   set 0x38a, %g2
   set 0xc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=4, level=3,  ppnr=0x4000, p_addr=0x10, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x10) = 0x48a (pte)
   set 0x48a, %g2
   set 0x10, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=5, level=3,  ppnr=0x5000, p_addr=0x14, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x14) = 0x58a (pte)
   set 0x58a, %g2
   set 0x14, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=6, level=3,  ppnr=0x6000, p_addr=0x18, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x18) = 0x68a (pte)
   set 0x68a, %g2
   set 0x18, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=7, level=3,  ppnr=0x7000, p_addr=0x1c, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x1c) = 0x78a (pte)
   set 0x78a, %g2
   set 0x1c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=8, level=3,  ppnr=0x8000, p_addr=0x20, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x20) = 0x88a (pte)
   set 0x88a, %g2
   set 0x20, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=9, level=3,  ppnr=0x9000, p_addr=0x24, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x24) = 0x98a (pte)
   set 0x98a, %g2
   set 0x24, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=10, level=3,  ppnr=0xa000, p_addr=0x28, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x28) = 0xa8a (pte)
   set 0xa8a, %g2
   set 0x28, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=11, level=3,  ppnr=0xb000, p_addr=0x2c, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x2c) = 0xb8a (pte)
   set 0xb8a, %g2
   set 0x2c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=12, level=3,  ppnr=0xc000, p_addr=0x30, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x30) = 0xc8a (pte)
   set 0xc8a, %g2
   set 0x30, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=13, level=3,  ppnr=0xd000, p_addr=0x34, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x34) = 0xd8a (pte)
   set 0xd8a, %g2
   set 0x34, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=14, level=3,  ppnr=0xe000, p_addr=0x38, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x38) = 0xe8e (pte)
   set 0xe8e, %g2
   set 0x38, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=15, level=3,  ppnr=0xf000, p_addr=0x3c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x3c) = 0xf8e (pte)
   set 0xf8e, %g2
   set 0x3c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=16, level=3,  ppnr=0x10000, p_addr=0x40, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x40) = 0x108e (pte)
   set 0x108e, %g2
   set 0x40, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=17, level=3,  ppnr=0x11000, p_addr=0x44, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x44) = 0x110e (pte)
   set 0x110e, %g2
   set 0x44, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=18, level=3,  ppnr=0x12000, p_addr=0x48, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x48) = 0x128e (pte)
   set 0x128e, %g2
   set 0x48, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=19, level=3,  ppnr=0x13000, p_addr=0x4c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x4c) = 0x138e (pte)
   set 0x138e, %g2
   set 0x4c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=20, level=3,  ppnr=0x14000, p_addr=0x50, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x50) = 0x148e (pte)
   set 0x148e, %g2
   set 0x50, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=21, level=3,  ppnr=0x15000, p_addr=0x54, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x54) = 0x158e (pte)
   set 0x158e, %g2
   set 0x54, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=22, level=3,  ppnr=0x16000, p_addr=0x58, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x58) = 0x168e (pte)
   set 0x168e, %g2
   set 0x58, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=23, level=3,  ppnr=0x17000, p_addr=0x5c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x5c) = 0x178e (pte)
   set 0x178e, %g2
   set 0x5c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=24, level=3,  ppnr=0x18000, p_addr=0x60, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x60) = 0x188e (pte)
   set 0x188e, %g2
   set 0x60, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=25, level=3,  ppnr=0x19000, p_addr=0x64, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x64) = 0x198e (pte)
   set 0x198e, %g2
   set 0x64, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=26, level=3,  ppnr=0x1a000, p_addr=0x68, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x68) = 0x1a8e (pte)
   set 0x1a8e, %g2
   set 0x68, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=27, level=3,  ppnr=0x1b000, p_addr=0x6c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x6c) = 0x1b8e (pte)
   set 0x1b8e, %g2
   set 0x6c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=28, level=3,  ppnr=0x1c000, p_addr=0x70, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x70) = 0x1c8e (pte)
   set 0x1c8e, %g2
   set 0x70, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=29, level=3,  ppnr=0x1d000, p_addr=0x74, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x74) = 0x1d8e (pte)
   set 0x1d8e, %g2
   set 0x74, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=30, level=3,  ppnr=0x1e000, p_addr=0x78, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x78) = 0x1e8e (pte)
   set 0x1e8e, %g2
   set 0x78, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=31, level=3,  ppnr=0x1f000, p_addr=0x7c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x7c) = 0x1f8e (pte)
   set 0x1f8e, %g2
   set 0x7c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=32, level=3,  ppnr=0x20000, p_addr=0x80, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x80) = 0x208e (pte)
   set 0x208e, %g2
   set 0x80, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=33, level=3,  ppnr=0x21000, p_addr=0x84, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x84) = 0x218e (pte)
   set 0x218e, %g2
   set 0x84, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=34, level=3,  ppnr=0x22000, p_addr=0x88, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x88) = 0x228e (pte)
   set 0x228e, %g2
   set 0x88, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=35, level=3,  ppnr=0x23000, p_addr=0x8c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8c) = 0x238e (pte)
   set 0x238e, %g2
   set 0x8c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=36, level=3,  ppnr=0x24000, p_addr=0x90, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x90) = 0x248e (pte)
   set 0x248e, %g2
   set 0x90, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=37, level=3,  ppnr=0x25000, p_addr=0x94, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x94) = 0x258e (pte)
   set 0x258e, %g2
   set 0x94, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=38, level=3,  ppnr=0x26000, p_addr=0x98, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x98) = 0x268e (pte)
   set 0x268e, %g2
   set 0x98, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=39, level=3,  ppnr=0x27000, p_addr=0x9c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x9c) = 0x278e (pte)
   set 0x278e, %g2
   set 0x9c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=40, level=3,  ppnr=0x28000, p_addr=0xa0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xa0) = 0x288e (pte)
   set 0x288e, %g2
   set 0xa0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=41, level=3,  ppnr=0x29000, p_addr=0xa4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xa4) = 0x298e (pte)
   set 0x298e, %g2
   set 0xa4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=42, level=3,  ppnr=0x2a000, p_addr=0xa8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xa8) = 0x2a8e (pte)
   set 0x2a8e, %g2
   set 0xa8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=43, level=3,  ppnr=0x2b000, p_addr=0xac, cacheable=0x1, acc=0x4
   ! *(PAGE_TABLE_BASE + 0xac) = 0x2b92 (pte)
   set 0x2b92, %g2
   set 0xac, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=44, level=3,  ppnr=0x2c000, p_addr=0xb0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xb0) = 0x2c8e (pte)
   set 0x2c8e, %g2
   set 0xb0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=45, level=3,  ppnr=0x2d000, p_addr=0xb4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xb4) = 0x2d8e (pte)
   set 0x2d8e, %g2
   set 0xb4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=46, level=3,  ppnr=0x2e000, p_addr=0xb8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xb8) = 0x2e8e (pte)
   set 0x2e8e, %g2
   set 0xb8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=47, level=3,  ppnr=0x2f000, p_addr=0xbc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xbc) = 0x2f8e (pte)
   set 0x2f8e, %g2
   set 0xbc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=48, level=3,  ppnr=0x30000, p_addr=0xc0, cacheable=0x1, acc=0x4
   ! *(PAGE_TABLE_BASE + 0xc0) = 0x3092 (pte)
   set 0x3092, %g2
   set 0xc0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=32, level=3,  ppnr=0x20000, p_addr=0x80, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x80) = 0x2016 (pte)
   set 0x2016, %g2
   set 0x80, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=33, level=3,  ppnr=0x21000, p_addr=0x84, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x84) = 0x2116 (pte)
   set 0x2116, %g2
   set 0x84, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=34, level=3,  ppnr=0x22000, p_addr=0x88, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x88) = 0x2216 (pte)
   set 0x2216, %g2
   set 0x88, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=35, level=3,  ppnr=0x23000, p_addr=0x8c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x8c) = 0x2316 (pte)
   set 0x2316, %g2
   set 0x8c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=36, level=3,  ppnr=0x24000, p_addr=0x90, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x90) = 0x2416 (pte)
   set 0x2416, %g2
   set 0x90, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=37, level=3,  ppnr=0x25000, p_addr=0x94, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x94) = 0x2516 (pte)
   set 0x2516, %g2
   set 0x94, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=38, level=3,  ppnr=0x26000, p_addr=0x98, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x98) = 0x2616 (pte)
   set 0x2616, %g2
   set 0x98, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=39, level=3,  ppnr=0x27000, p_addr=0x9c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x9c) = 0x2716 (pte)
   set 0x2716, %g2
   set 0x9c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=40, level=3,  ppnr=0x28000, p_addr=0xa0, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xa0) = 0x2816 (pte)
   set 0x2816, %g2
   set 0xa0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=41, level=3,  ppnr=0x29000, p_addr=0xa4, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xa4) = 0x2916 (pte)
   set 0x2916, %g2
   set 0xa4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=42, level=3,  ppnr=0x2a000, p_addr=0xa8, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xa8) = 0x2a16 (pte)
   set 0x2a16, %g2
   set 0xa8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=43, level=3,  ppnr=0x2b000, p_addr=0xac, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xac) = 0x2b16 (pte)
   set 0x2b16, %g2
   set 0xac, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=44, level=3,  ppnr=0x2c000, p_addr=0xb0, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xb0) = 0x2c16 (pte)
   set 0x2c16, %g2
   set 0xb0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=45, level=3,  ppnr=0x2d000, p_addr=0xb4, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xb4) = 0x2d16 (pte)
   set 0x2d16, %g2
   set 0xb4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=46, level=3,  ppnr=0x2e000, p_addr=0xb8, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xb8) = 0x2e16 (pte)
   set 0x2e16, %g2
   set 0xb8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=47, level=3,  ppnr=0x2f000, p_addr=0xbc, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xbc) = 0x2f16 (pte)
   set 0x2f16, %g2
   set 0xbc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=48, level=3,  ppnr=0x30000, p_addr=0xc0, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xc0) = 0x3016 (pte)
   set 0x3016, %g2
   set 0xc0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=49, level=3,  ppnr=0x31000, p_addr=0xc4, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xc4) = 0x3116 (pte)
   set 0x3116, %g2
   set 0xc4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=50, level=3,  ppnr=0x32000, p_addr=0xc8, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xc8) = 0x3216 (pte)
   set 0x3216, %g2
   set 0xc8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=51, level=3,  ppnr=0x33000, p_addr=0xcc, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xcc) = 0x3316 (pte)
   set 0x3316, %g2
   set 0xcc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=52, level=3,  ppnr=0x34000, p_addr=0xd0, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xd0) = 0x3416 (pte)
   set 0x3416, %g2
   set 0xd0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=53, level=3,  ppnr=0x35000, p_addr=0xd4, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xd4) = 0x3516 (pte)
   set 0x3516, %g2
   set 0xd4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=54, level=3,  ppnr=0x36000, p_addr=0xd8, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xd8) = 0x3616 (pte)
   set 0x3616, %g2
   set 0xd8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=55, level=3,  ppnr=0x37000, p_addr=0xdc, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xdc) = 0x3716 (pte)
   set 0x3716, %g2
   set 0xdc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=56, level=3,  ppnr=0x38000, p_addr=0xe0, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xe0) = 0x3816 (pte)
   set 0x3816, %g2
   set 0xe0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=57, level=3,  ppnr=0x39000, p_addr=0xe4, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xe4) = 0x3916 (pte)
   set 0x3916, %g2
   set 0xe4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=58, level=3,  ppnr=0x3a000, p_addr=0xe8, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xe8) = 0x3a16 (pte)
   set 0x3a16, %g2
   set 0xe8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=59, level=3,  ppnr=0x3b000, p_addr=0xec, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xec) = 0x3b16 (pte)
   set 0x3b16, %g2
   set 0xec, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=60, level=3,  ppnr=0x3c000, p_addr=0xf0, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xf0) = 0x3c16 (pte)
   set 0x3c16, %g2
   set 0xf0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=61, level=3,  ppnr=0x3d000, p_addr=0xf4, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xf4) = 0x3d16 (pte)
   set 0x3d16, %g2
   set 0xf4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=62, level=3,  ppnr=0x3e000, p_addr=0xf8, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xf8) = 0x3e16 (pte)
   set 0x3e16, %g2
   set 0xf8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=63, level=3,  ppnr=0x3f000, p_addr=0xfc, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0xfc) = 0x3f16 (pte)
   set 0x3f16, %g2
   set 0xfc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTD: context=0, index=1, level=2, child_p_addr=0x100, p_addr=0x204
   ! *(PAGE_TABLE_BASE + 0x204) = ptd(PAGE_TABLE_BASE + 0x100)
   ! make PTD from 0x100
   set 0x100, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x204, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTE: context=0, index=0, level=3,  ppnr=0x40000, p_addr=0x100, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x100) = 0x4016 (pte)
   set 0x4016, %g2
   set 0x100, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=1, level=3,  ppnr=0x41000, p_addr=0x104, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x104) = 0x4116 (pte)
   set 0x4116, %g2
   set 0x104, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=2, level=3,  ppnr=0x42000, p_addr=0x108, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x108) = 0x4216 (pte)
   set 0x4216, %g2
   set 0x108, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=3, level=3,  ppnr=0x43000, p_addr=0x10c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x10c) = 0x4316 (pte)
   set 0x4316, %g2
   set 0x10c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=4, level=3,  ppnr=0x44000, p_addr=0x110, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x110) = 0x4416 (pte)
   set 0x4416, %g2
   set 0x110, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=5, level=3,  ppnr=0x45000, p_addr=0x114, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x114) = 0x4516 (pte)
   set 0x4516, %g2
   set 0x114, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=6, level=3,  ppnr=0x46000, p_addr=0x118, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x118) = 0x4616 (pte)
   set 0x4616, %g2
   set 0x118, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=7, level=3,  ppnr=0x47000, p_addr=0x11c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x11c) = 0x4716 (pte)
   set 0x4716, %g2
   set 0x11c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=8, level=3,  ppnr=0x48000, p_addr=0x120, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x120) = 0x4816 (pte)
   set 0x4816, %g2
   set 0x120, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=9, level=3,  ppnr=0x49000, p_addr=0x124, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x124) = 0x4916 (pte)
   set 0x4916, %g2
   set 0x124, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=10, level=3,  ppnr=0x4a000, p_addr=0x128, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x128) = 0x4a16 (pte)
   set 0x4a16, %g2
   set 0x128, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=11, level=3,  ppnr=0x4b000, p_addr=0x12c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x12c) = 0x4b16 (pte)
   set 0x4b16, %g2
   set 0x12c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=12, level=3,  ppnr=0x4c000, p_addr=0x130, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x130) = 0x4c16 (pte)
   set 0x4c16, %g2
   set 0x130, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=13, level=3,  ppnr=0x4d000, p_addr=0x134, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x134) = 0x4d16 (pte)
   set 0x4d16, %g2
   set 0x134, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=14, level=3,  ppnr=0x4e000, p_addr=0x138, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x138) = 0x4e16 (pte)
   set 0x4e16, %g2
   set 0x138, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=15, level=3,  ppnr=0x4f000, p_addr=0x13c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x13c) = 0x4f16 (pte)
   set 0x4f16, %g2
   set 0x13c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=16, level=3,  ppnr=0x50000, p_addr=0x140, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x140) = 0x5016 (pte)
   set 0x5016, %g2
   set 0x140, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=17, level=3,  ppnr=0x51000, p_addr=0x144, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x144) = 0x5116 (pte)
   set 0x5116, %g2
   set 0x144, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=255, level=1,  ppnr=0xff000000, p_addr=0x7fc, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x7fc) = 0xff00016 (pte)
   set 0xff00016, %g2
   set 0x7fc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   retl;
   nop;
! done: page_table_setup
! start: set context-table-pointer = PAGE_TABLE_BASE + 0x800
.global set_context_table_pointer
set_context_table_pointer:
   set PAGE_TABLE_BASE, %g1
   set 0x800, %g5
   add %g5, %g1, %g2
   srl  %g2, 0x4, %g2
   or  %g2, 0x1, %g2
   set 0x100, %g3
   sta %g2, [%g3] 0x4
   retl;
   nop;
! done: set  context-table-pointer
.align 1024
PAGE_TABLE_BASE: .skip 3072
