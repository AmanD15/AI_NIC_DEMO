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
   !PTD: context=0, index=0, level=1, child_p_addr=0x200, p_addr=0x800
   ! *(PAGE_TABLE_BASE + 0x800) = ptd(PAGE_TABLE_BASE + 0x200)
   ! make PTD from 0x200
   set 0x200, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x800, %g5
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
   !PTE: context=0, index=14, level=3,  ppnr=0xe000, p_addr=0x38, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x38) = 0xe8a (pte)
   set 0xe8a, %g2
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
   !PTE: context=0, index=17, level=3,  ppnr=0x11000, p_addr=0x44, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x44) = 0x118e (pte)
   set 0x118e, %g2
   set 0x44, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=18, level=3,  ppnr=0x12000, p_addr=0x48, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x48) = 0x120e (pte)
   set 0x120e, %g2
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
   !PTE: context=0, index=43, level=3,  ppnr=0x2b000, p_addr=0xac, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xac) = 0x2b8e (pte)
   set 0x2b8e, %g2
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
   !PTE: context=0, index=48, level=3,  ppnr=0x30000, p_addr=0xc0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc0) = 0x308e (pte)
   set 0x308e, %g2
   set 0xc0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=49, level=3,  ppnr=0x31000, p_addr=0xc4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc4) = 0x318e (pte)
   set 0x318e, %g2
   set 0xc4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=50, level=3,  ppnr=0x32000, p_addr=0xc8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc8) = 0x328e (pte)
   set 0x328e, %g2
   set 0xc8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=51, level=3,  ppnr=0x33000, p_addr=0xcc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xcc) = 0x338e (pte)
   set 0x338e, %g2
   set 0xcc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=52, level=3,  ppnr=0x34000, p_addr=0xd0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd0) = 0x348e (pte)
   set 0x348e, %g2
   set 0xd0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=53, level=3,  ppnr=0x35000, p_addr=0xd4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd4) = 0x358e (pte)
   set 0x358e, %g2
   set 0xd4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=54, level=3,  ppnr=0x36000, p_addr=0xd8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd8) = 0x368e (pte)
   set 0x368e, %g2
   set 0xd8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=55, level=3,  ppnr=0x37000, p_addr=0xdc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xdc) = 0x378e (pte)
   set 0x378e, %g2
   set 0xdc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=56, level=3,  ppnr=0x38000, p_addr=0xe0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xe0) = 0x388e (pte)
   set 0x388e, %g2
   set 0xe0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=57, level=3,  ppnr=0x39000, p_addr=0xe4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xe4) = 0x398e (pte)
   set 0x398e, %g2
   set 0xe4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=58, level=3,  ppnr=0x3a000, p_addr=0xe8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xe8) = 0x3a8e (pte)
   set 0x3a8e, %g2
   set 0xe8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=59, level=3,  ppnr=0x3b000, p_addr=0xec, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xec) = 0x3b8e (pte)
   set 0x3b8e, %g2
   set 0xec, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=60, level=3,  ppnr=0x3c000, p_addr=0xf0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xf0) = 0x3c8e (pte)
   set 0x3c8e, %g2
   set 0xf0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=61, level=3,  ppnr=0x3d000, p_addr=0xf4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xf4) = 0x3d8e (pte)
   set 0x3d8e, %g2
   set 0xf4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=62, level=3,  ppnr=0x3e000, p_addr=0xf8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xf8) = 0x3e8e (pte)
   set 0x3e8e, %g2
   set 0xf8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=63, level=3,  ppnr=0x3f000, p_addr=0xfc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xfc) = 0x3f8e (pte)
   set 0x3f8e, %g2
   set 0xfc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=1, level=2,  ppnr=0x40000, p_addr=0x204, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x204) = 0x408e (pte)
   set 0x408e, %g2
   set 0x204, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=2, level=2,  ppnr=0x80000, p_addr=0x208, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x208) = 0x808e (pte)
   set 0x808e, %g2
   set 0x208, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=3, level=2,  ppnr=0xc0000, p_addr=0x20c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x20c) = 0xc08e (pte)
   set 0xc08e, %g2
   set 0x20c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=4, level=2,  ppnr=0x100000, p_addr=0x210, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x210) = 0x1008e (pte)
   set 0x1008e, %g2
   set 0x210, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=5, level=2,  ppnr=0x140000, p_addr=0x214, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x214) = 0x1408e (pte)
   set 0x1408e, %g2
   set 0x214, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=6, level=2,  ppnr=0x180000, p_addr=0x218, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x218) = 0x1808e (pte)
   set 0x1808e, %g2
   set 0x218, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=7, level=2,  ppnr=0x1c0000, p_addr=0x21c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x21c) = 0x1c08e (pte)
   set 0x1c08e, %g2
   set 0x21c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTD: context=0, index=8, level=2, child_p_addr=0x100, p_addr=0x220
   ! *(PAGE_TABLE_BASE + 0x220) = ptd(PAGE_TABLE_BASE + 0x100)
   ! make PTD from 0x100
   set 0x100, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x220, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTE: context=0, index=0, level=3,  ppnr=0x200000, p_addr=0x100, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x100) = 0x2008e (pte)
   set 0x2008e, %g2
   set 0x100, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=1, level=3,  ppnr=0x201000, p_addr=0x104, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x104) = 0x2018e (pte)
   set 0x2018e, %g2
   set 0x104, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=2, level=3,  ppnr=0x202000, p_addr=0x108, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x108) = 0x2028e (pte)
   set 0x2028e, %g2
   set 0x108, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=3, level=3,  ppnr=0x203000, p_addr=0x10c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x10c) = 0x2038e (pte)
   set 0x2038e, %g2
   set 0x10c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=4, level=3,  ppnr=0x204000, p_addr=0x110, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x110) = 0x2048e (pte)
   set 0x2048e, %g2
   set 0x110, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=5, level=3,  ppnr=0x205000, p_addr=0x114, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x114) = 0x2058e (pte)
   set 0x2058e, %g2
   set 0x114, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=6, level=3,  ppnr=0x206000, p_addr=0x118, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x118) = 0x2068e (pte)
   set 0x2068e, %g2
   set 0x118, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=7, level=3,  ppnr=0x207000, p_addr=0x11c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x11c) = 0x2078e (pte)
   set 0x2078e, %g2
   set 0x11c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=8, level=3,  ppnr=0x208000, p_addr=0x120, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x120) = 0x2088e (pte)
   set 0x2088e, %g2
   set 0x120, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=9, level=3,  ppnr=0x209000, p_addr=0x124, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x124) = 0x2098e (pte)
   set 0x2098e, %g2
   set 0x124, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=10, level=3,  ppnr=0x20a000, p_addr=0x128, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x128) = 0x20a8e (pte)
   set 0x20a8e, %g2
   set 0x128, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=11, level=3,  ppnr=0x20b000, p_addr=0x12c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x12c) = 0x20b8e (pte)
   set 0x20b8e, %g2
   set 0x12c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=12, level=3,  ppnr=0x20c000, p_addr=0x130, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x130) = 0x20c8e (pte)
   set 0x20c8e, %g2
   set 0x130, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=13, level=3,  ppnr=0x20d000, p_addr=0x134, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x134) = 0x20d8e (pte)
   set 0x20d8e, %g2
   set 0x134, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=14, level=3,  ppnr=0x20e000, p_addr=0x138, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x138) = 0x20e8e (pte)
   set 0x20e8e, %g2
   set 0x138, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=15, level=3,  ppnr=0x20f000, p_addr=0x13c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x13c) = 0x20f8e (pte)
   set 0x20f8e, %g2
   set 0x13c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=16, level=3,  ppnr=0x210000, p_addr=0x140, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x140) = 0x2108e (pte)
   set 0x2108e, %g2
   set 0x140, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=17, level=3,  ppnr=0x211000, p_addr=0x144, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x144) = 0x2118e (pte)
   set 0x2118e, %g2
   set 0x144, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=18, level=3,  ppnr=0x212000, p_addr=0x148, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x148) = 0x2128e (pte)
   set 0x2128e, %g2
   set 0x148, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=19, level=3,  ppnr=0x213000, p_addr=0x14c, cacheable=0x1, acc=0x4
   ! *(PAGE_TABLE_BASE + 0x14c) = 0x21392 (pte)
   set 0x21392, %g2
   set 0x14c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=20, level=3,  ppnr=0x214000, p_addr=0x150, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x150) = 0x2148e (pte)
   set 0x2148e, %g2
   set 0x150, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=21, level=3,  ppnr=0x215000, p_addr=0x154, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x154) = 0x2158e (pte)
   set 0x2158e, %g2
   set 0x154, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=22, level=3,  ppnr=0x216000, p_addr=0x158, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x158) = 0x2168e (pte)
   set 0x2168e, %g2
   set 0x158, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=23, level=3,  ppnr=0x217000, p_addr=0x15c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x15c) = 0x2178e (pte)
   set 0x2178e, %g2
   set 0x15c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=24, level=3,  ppnr=0x218000, p_addr=0x160, cacheable=0x1, acc=0x4
   ! *(PAGE_TABLE_BASE + 0x160) = 0x21892 (pte)
   set 0x21892, %g2
   set 0x160, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=16, level=2,  ppnr=0x400000, p_addr=0x240, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x240) = 0x40016 (pte)
   set 0x40016, %g2
   set 0x240, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=17, level=2,  ppnr=0x440000, p_addr=0x244, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x244) = 0x44016 (pte)
   set 0x44016, %g2
   set 0x244, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=18, level=2,  ppnr=0x480000, p_addr=0x248, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x248) = 0x48016 (pte)
   set 0x48016, %g2
   set 0x248, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=19, level=2,  ppnr=0x4c0000, p_addr=0x24c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x24c) = 0x4c016 (pte)
   set 0x4c016, %g2
   set 0x24c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=20, level=2,  ppnr=0x500000, p_addr=0x250, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x250) = 0x50016 (pte)
   set 0x50016, %g2
   set 0x250, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=21, level=2,  ppnr=0x540000, p_addr=0x254, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x254) = 0x54016 (pte)
   set 0x54016, %g2
   set 0x254, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=22, level=2,  ppnr=0x580000, p_addr=0x258, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x258) = 0x58016 (pte)
   set 0x58016, %g2
   set 0x258, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=23, level=2,  ppnr=0x5c0000, p_addr=0x25c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x25c) = 0x5c016 (pte)
   set 0x5c016, %g2
   set 0x25c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=24, level=2,  ppnr=0x600000, p_addr=0x260, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x260) = 0x60016 (pte)
   set 0x60016, %g2
   set 0x260, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=25, level=2,  ppnr=0x640000, p_addr=0x264, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x264) = 0x64016 (pte)
   set 0x64016, %g2
   set 0x264, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=26, level=2,  ppnr=0x680000, p_addr=0x268, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x268) = 0x68016 (pte)
   set 0x68016, %g2
   set 0x268, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=27, level=2,  ppnr=0x6c0000, p_addr=0x26c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x26c) = 0x6c016 (pte)
   set 0x6c016, %g2
   set 0x26c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=28, level=2,  ppnr=0x700000, p_addr=0x270, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x270) = 0x70016 (pte)
   set 0x70016, %g2
   set 0x270, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=29, level=2,  ppnr=0x740000, p_addr=0x274, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x274) = 0x74016 (pte)
   set 0x74016, %g2
   set 0x274, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=30, level=2,  ppnr=0x780000, p_addr=0x278, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x278) = 0x78016 (pte)
   set 0x78016, %g2
   set 0x278, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=31, level=2,  ppnr=0x7c0000, p_addr=0x27c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x27c) = 0x7c016 (pte)
   set 0x7c016, %g2
   set 0x27c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=32, level=2,  ppnr=0x800000, p_addr=0x280, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x280) = 0x80016 (pte)
   set 0x80016, %g2
   set 0x280, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=33, level=2,  ppnr=0x840000, p_addr=0x284, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x284) = 0x84016 (pte)
   set 0x84016, %g2
   set 0x284, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=34, level=2,  ppnr=0x880000, p_addr=0x288, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x288) = 0x88016 (pte)
   set 0x88016, %g2
   set 0x288, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=35, level=2,  ppnr=0x8c0000, p_addr=0x28c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x28c) = 0x8c016 (pte)
   set 0x8c016, %g2
   set 0x28c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=36, level=2,  ppnr=0x900000, p_addr=0x290, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x290) = 0x90016 (pte)
   set 0x90016, %g2
   set 0x290, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=37, level=2,  ppnr=0x940000, p_addr=0x294, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x294) = 0x94016 (pte)
   set 0x94016, %g2
   set 0x294, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=38, level=2,  ppnr=0x980000, p_addr=0x298, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x298) = 0x98016 (pte)
   set 0x98016, %g2
   set 0x298, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=39, level=2,  ppnr=0x9c0000, p_addr=0x29c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x29c) = 0x9c016 (pte)
   set 0x9c016, %g2
   set 0x29c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=40, level=2,  ppnr=0xa00000, p_addr=0x2a0, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2a0) = 0xa0016 (pte)
   set 0xa0016, %g2
   set 0x2a0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=41, level=2,  ppnr=0xa40000, p_addr=0x2a4, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2a4) = 0xa4016 (pte)
   set 0xa4016, %g2
   set 0x2a4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=42, level=2,  ppnr=0xa80000, p_addr=0x2a8, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2a8) = 0xa8016 (pte)
   set 0xa8016, %g2
   set 0x2a8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=43, level=2,  ppnr=0xac0000, p_addr=0x2ac, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2ac) = 0xac016 (pte)
   set 0xac016, %g2
   set 0x2ac, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=44, level=2,  ppnr=0xb00000, p_addr=0x2b0, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2b0) = 0xb0016 (pte)
   set 0xb0016, %g2
   set 0x2b0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=45, level=2,  ppnr=0xb40000, p_addr=0x2b4, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2b4) = 0xb4016 (pte)
   set 0xb4016, %g2
   set 0x2b4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=46, level=2,  ppnr=0xb80000, p_addr=0x2b8, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2b8) = 0xb8016 (pte)
   set 0xb8016, %g2
   set 0x2b8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=47, level=2,  ppnr=0xbc0000, p_addr=0x2bc, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2bc) = 0xbc016 (pte)
   set 0xbc016, %g2
   set 0x2bc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=48, level=2,  ppnr=0xc00000, p_addr=0x2c0, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2c0) = 0xc0016 (pte)
   set 0xc0016, %g2
   set 0x2c0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=49, level=2,  ppnr=0xc40000, p_addr=0x2c4, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2c4) = 0xc4016 (pte)
   set 0xc4016, %g2
   set 0x2c4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=50, level=2,  ppnr=0xc80000, p_addr=0x2c8, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2c8) = 0xc8016 (pte)
   set 0xc8016, %g2
   set 0x2c8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=51, level=2,  ppnr=0xcc0000, p_addr=0x2cc, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2cc) = 0xcc016 (pte)
   set 0xcc016, %g2
   set 0x2cc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=52, level=2,  ppnr=0xd00000, p_addr=0x2d0, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2d0) = 0xd0016 (pte)
   set 0xd0016, %g2
   set 0x2d0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=53, level=2,  ppnr=0xd40000, p_addr=0x2d4, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2d4) = 0xd4016 (pte)
   set 0xd4016, %g2
   set 0x2d4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=54, level=2,  ppnr=0xd80000, p_addr=0x2d8, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2d8) = 0xd8016 (pte)
   set 0xd8016, %g2
   set 0x2d8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=55, level=2,  ppnr=0xdc0000, p_addr=0x2dc, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2dc) = 0xdc016 (pte)
   set 0xdc016, %g2
   set 0x2dc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=56, level=2,  ppnr=0xe00000, p_addr=0x2e0, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2e0) = 0xe0016 (pte)
   set 0xe0016, %g2
   set 0x2e0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=57, level=2,  ppnr=0xe40000, p_addr=0x2e4, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2e4) = 0xe4016 (pte)
   set 0xe4016, %g2
   set 0x2e4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=58, level=2,  ppnr=0xe80000, p_addr=0x2e8, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2e8) = 0xe8016 (pte)
   set 0xe8016, %g2
   set 0x2e8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=59, level=2,  ppnr=0xec0000, p_addr=0x2ec, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2ec) = 0xec016 (pte)
   set 0xec016, %g2
   set 0x2ec, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=60, level=2,  ppnr=0xf00000, p_addr=0x2f0, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2f0) = 0xf0016 (pte)
   set 0xf0016, %g2
   set 0x2f0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=61, level=2,  ppnr=0xf40000, p_addr=0x2f4, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2f4) = 0xf4016 (pte)
   set 0xf4016, %g2
   set 0x2f4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=62, level=2,  ppnr=0xf80000, p_addr=0x2f8, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2f8) = 0xf8016 (pte)
   set 0xf8016, %g2
   set 0x2f8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=63, level=2,  ppnr=0xfc0000, p_addr=0x2fc, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2fc) = 0xfc016 (pte)
   set 0xfc016, %g2
   set 0x2fc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTD: context=0, index=1, level=1, child_p_addr=0x300, p_addr=0x804
   ! *(PAGE_TABLE_BASE + 0x804) = ptd(PAGE_TABLE_BASE + 0x300)
   ! make PTD from 0x300
   set 0x300, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x804, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTE: context=0, index=0, level=2,  ppnr=0x1000000, p_addr=0x300, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x300) = 0x100016 (pte)
   set 0x100016, %g2
   set 0x300, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=1, level=2,  ppnr=0x1040000, p_addr=0x304, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x304) = 0x104016 (pte)
   set 0x104016, %g2
   set 0x304, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=2, level=2,  ppnr=0x1080000, p_addr=0x308, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x308) = 0x108016 (pte)
   set 0x108016, %g2
   set 0x308, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=3, level=2,  ppnr=0x10c0000, p_addr=0x30c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x30c) = 0x10c016 (pte)
   set 0x10c016, %g2
   set 0x30c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=4, level=2,  ppnr=0x1100000, p_addr=0x310, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x310) = 0x110016 (pte)
   set 0x110016, %g2
   set 0x310, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=5, level=2,  ppnr=0x1140000, p_addr=0x314, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x314) = 0x114016 (pte)
   set 0x114016, %g2
   set 0x314, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=6, level=2,  ppnr=0x1180000, p_addr=0x318, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x318) = 0x118016 (pte)
   set 0x118016, %g2
   set 0x318, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=7, level=2,  ppnr=0x11c0000, p_addr=0x31c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x31c) = 0x11c016 (pte)
   set 0x11c016, %g2
   set 0x31c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=8, level=2,  ppnr=0x1200000, p_addr=0x320, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x320) = 0x120016 (pte)
   set 0x120016, %g2
   set 0x320, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=9, level=2,  ppnr=0x1240000, p_addr=0x324, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x324) = 0x124016 (pte)
   set 0x124016, %g2
   set 0x324, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=10, level=2,  ppnr=0x1280000, p_addr=0x328, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x328) = 0x128016 (pte)
   set 0x128016, %g2
   set 0x328, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=11, level=2,  ppnr=0x12c0000, p_addr=0x32c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x32c) = 0x12c016 (pte)
   set 0x12c016, %g2
   set 0x32c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=12, level=2,  ppnr=0x1300000, p_addr=0x330, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x330) = 0x130016 (pte)
   set 0x130016, %g2
   set 0x330, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=13, level=2,  ppnr=0x1340000, p_addr=0x334, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x334) = 0x134016 (pte)
   set 0x134016, %g2
   set 0x334, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=14, level=2,  ppnr=0x1380000, p_addr=0x338, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x338) = 0x138016 (pte)
   set 0x138016, %g2
   set 0x338, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=15, level=2,  ppnr=0x13c0000, p_addr=0x33c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x33c) = 0x13c016 (pte)
   set 0x13c016, %g2
   set 0x33c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=16, level=2,  ppnr=0x1400000, p_addr=0x340, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x340) = 0x140016 (pte)
   set 0x140016, %g2
   set 0x340, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=17, level=2,  ppnr=0x1440000, p_addr=0x344, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x344) = 0x144016 (pte)
   set 0x144016, %g2
   set 0x344, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=18, level=2,  ppnr=0x1480000, p_addr=0x348, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x348) = 0x148016 (pte)
   set 0x148016, %g2
   set 0x348, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=19, level=2,  ppnr=0x14c0000, p_addr=0x34c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x34c) = 0x14c016 (pte)
   set 0x14c016, %g2
   set 0x34c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=20, level=2,  ppnr=0x1500000, p_addr=0x350, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x350) = 0x150016 (pte)
   set 0x150016, %g2
   set 0x350, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=21, level=2,  ppnr=0x1540000, p_addr=0x354, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x354) = 0x154016 (pte)
   set 0x154016, %g2
   set 0x354, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=22, level=2,  ppnr=0x1580000, p_addr=0x358, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x358) = 0x158016 (pte)
   set 0x158016, %g2
   set 0x358, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=23, level=2,  ppnr=0x15c0000, p_addr=0x35c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x35c) = 0x15c016 (pte)
   set 0x15c016, %g2
   set 0x35c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=24, level=2,  ppnr=0x1600000, p_addr=0x360, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x360) = 0x160016 (pte)
   set 0x160016, %g2
   set 0x360, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=25, level=2,  ppnr=0x1640000, p_addr=0x364, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x364) = 0x164016 (pte)
   set 0x164016, %g2
   set 0x364, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=26, level=2,  ppnr=0x1680000, p_addr=0x368, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x368) = 0x168016 (pte)
   set 0x168016, %g2
   set 0x368, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=27, level=2,  ppnr=0x16c0000, p_addr=0x36c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x36c) = 0x16c016 (pte)
   set 0x16c016, %g2
   set 0x36c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=28, level=2,  ppnr=0x1700000, p_addr=0x370, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x370) = 0x170016 (pte)
   set 0x170016, %g2
   set 0x370, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=29, level=2,  ppnr=0x1740000, p_addr=0x374, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x374) = 0x174016 (pte)
   set 0x174016, %g2
   set 0x374, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=30, level=2,  ppnr=0x1780000, p_addr=0x378, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x378) = 0x178016 (pte)
   set 0x178016, %g2
   set 0x378, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=31, level=2,  ppnr=0x17c0000, p_addr=0x37c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x37c) = 0x17c016 (pte)
   set 0x17c016, %g2
   set 0x37c, %g5
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
