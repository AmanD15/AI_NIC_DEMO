.section .text.pagetablesetup
.global page_table_setup
page_table_setup:
   set PAGE_TABLE_BASE, %g1
   !PTD: context=0, index=0, level=0, child_p_addr=0x500, p_addr=0x800
   ! *(PAGE_TABLE_BASE + 0x800) = ptd(PAGE_TABLE_BASE + 0x400)
   ! make PTD from 0x500
   set 0x400, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x800, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTD: context=0, index=64, level=1, child_p_addr=0x100, p_addr=0x500
   ! *(PAGE_TABLE_BASE + 0x500) = ptd(PAGE_TABLE_BASE + 0x100)
   ! make PTD from 0x100
   set 0x100, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x500, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTD: context=0, index=0, level=2, child_p_addr=0x0, p_addr=0x100
   ! *(PAGE_TABLE_BASE + 0x100) = ptd(PAGE_TABLE_BASE + 0x0)
   ! make PTD from 0x0
   set 0x0, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x100, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTE: context=0, index=0, level=3,  ppnr=0x40000000, p_addr=0x0, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x0) = 0x400008a (pte)
   set 0x400008a, %g2
   set 0x0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=1, level=3,  ppnr=0x40001000, p_addr=0x4, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x4) = 0x400018a (pte)
   set 0x400018a, %g2
   set 0x4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=2, level=3,  ppnr=0x40002000, p_addr=0x8, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x8) = 0x400028a (pte)
   set 0x400028a, %g2
   set 0x8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=3, level=3,  ppnr=0x40003000, p_addr=0xc, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0xc) = 0x400038a (pte)
   set 0x400038a, %g2
   set 0xc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=4, level=3,  ppnr=0x40004000, p_addr=0x10, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x10) = 0x400048a (pte)
   set 0x400048a, %g2
   set 0x10, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=5, level=3,  ppnr=0x40005000, p_addr=0x14, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x14) = 0x400058a (pte)
   set 0x400058a, %g2
   set 0x14, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=6, level=3,  ppnr=0x40006000, p_addr=0x18, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x18) = 0x400068a (pte)
   set 0x400068a, %g2
   set 0x18, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=7, level=3,  ppnr=0x40007000, p_addr=0x1c, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x1c) = 0x400078a (pte)
   set 0x400078a, %g2
   set 0x1c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=8, level=3,  ppnr=0x40008000, p_addr=0x20, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x20) = 0x400088a (pte)
   set 0x400088a, %g2
   set 0x20, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=9, level=3,  ppnr=0x40009000, p_addr=0x24, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x24) = 0x400098a (pte)
   set 0x400098a, %g2
   set 0x24, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=10, level=3,  ppnr=0x4000a000, p_addr=0x28, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x28) = 0x4000a8a (pte)
   set 0x4000a8a, %g2
   set 0x28, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=11, level=3,  ppnr=0x4000b000, p_addr=0x2c, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x2c) = 0x4000b8a (pte)
   set 0x4000b8a, %g2
   set 0x2c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=12, level=3,  ppnr=0x4000c000, p_addr=0x30, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x30) = 0x4000c8a (pte)
   set 0x4000c8a, %g2
   set 0x30, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=13, level=3,  ppnr=0x4000d000, p_addr=0x34, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x34) = 0x4000d8a (pte)
   set 0x4000d8a, %g2
   set 0x34, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=14, level=3,  ppnr=0x4000e000, p_addr=0x38, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x38) = 0x4000e8a (pte)
   set 0x4000e8a, %g2
   set 0x38, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=15, level=3,  ppnr=0x4000f000, p_addr=0x3c, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x3c) = 0x4000f8a (pte)
   set 0x4000f8a, %g2
   set 0x3c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=16, level=3,  ppnr=0x40010000, p_addr=0x40, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x40) = 0x400108a (pte)
   set 0x400108a, %g2
   set 0x40, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=17, level=3,  ppnr=0x40011000, p_addr=0x44, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x44) = 0x400118a (pte)
   set 0x400118a, %g2
   set 0x44, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=18, level=3,  ppnr=0x40012000, p_addr=0x48, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x48) = 0x400128e (pte)
   set 0x400128e, %g2
   set 0x48, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=19, level=3,  ppnr=0x40013000, p_addr=0x4c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x4c) = 0x400138e (pte)
   set 0x400138e, %g2
   set 0x4c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=20, level=3,  ppnr=0x40014000, p_addr=0x50, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x50) = 0x400148e (pte)
   set 0x400148e, %g2
   set 0x50, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=21, level=3,  ppnr=0x40015000, p_addr=0x54, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x54) = 0x400150e (pte)
   set 0x400150e, %g2
   set 0x54, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=22, level=3,  ppnr=0x40016000, p_addr=0x58, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x58) = 0x400168e (pte)
   set 0x400168e, %g2
   set 0x58, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=23, level=3,  ppnr=0x40017000, p_addr=0x5c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x5c) = 0x400178e (pte)
   set 0x400178e, %g2
   set 0x5c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=24, level=3,  ppnr=0x40018000, p_addr=0x60, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x60) = 0x400188e (pte)
   set 0x400188e, %g2
   set 0x60, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=25, level=3,  ppnr=0x40019000, p_addr=0x64, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x64) = 0x400198e (pte)
   set 0x400198e, %g2
   set 0x64, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=26, level=3,  ppnr=0x4001a000, p_addr=0x68, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x68) = 0x4001a8e (pte)
   set 0x4001a8e, %g2
   set 0x68, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=27, level=3,  ppnr=0x4001b000, p_addr=0x6c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x6c) = 0x4001b8e (pte)
   set 0x4001b8e, %g2
   set 0x6c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=28, level=3,  ppnr=0x4001c000, p_addr=0x70, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x70) = 0x4001c8e (pte)
   set 0x4001c8e, %g2
   set 0x70, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=29, level=3,  ppnr=0x4001d000, p_addr=0x74, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x74) = 0x4001d8e (pte)
   set 0x4001d8e, %g2
   set 0x74, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=30, level=3,  ppnr=0x4001e000, p_addr=0x78, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x78) = 0x4001e8e (pte)
   set 0x4001e8e, %g2
   set 0x78, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=31, level=3,  ppnr=0x4001f000, p_addr=0x7c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x7c) = 0x4001f8e (pte)
   set 0x4001f8e, %g2
   set 0x7c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=32, level=3,  ppnr=0x40020000, p_addr=0x80, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x80) = 0x400208e (pte)
   set 0x400208e, %g2
   set 0x80, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=33, level=3,  ppnr=0x40021000, p_addr=0x84, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x84) = 0x400218e (pte)
   set 0x400218e, %g2
   set 0x84, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=34, level=3,  ppnr=0x40022000, p_addr=0x88, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x88) = 0x400228e (pte)
   set 0x400228e, %g2
   set 0x88, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=35, level=3,  ppnr=0x40023000, p_addr=0x8c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8c) = 0x400238e (pte)
   set 0x400238e, %g2
   set 0x8c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=36, level=3,  ppnr=0x40024000, p_addr=0x90, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x90) = 0x400248e (pte)
   set 0x400248e, %g2
   set 0x90, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=37, level=3,  ppnr=0x40025000, p_addr=0x94, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x94) = 0x400258e (pte)
   set 0x400258e, %g2
   set 0x94, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=38, level=3,  ppnr=0x40026000, p_addr=0x98, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x98) = 0x400268e (pte)
   set 0x400268e, %g2
   set 0x98, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=39, level=3,  ppnr=0x40027000, p_addr=0x9c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x9c) = 0x400278e (pte)
   set 0x400278e, %g2
   set 0x9c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=40, level=3,  ppnr=0x40028000, p_addr=0xa0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xa0) = 0x400288e (pte)
   set 0x400288e, %g2
   set 0xa0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=41, level=3,  ppnr=0x40029000, p_addr=0xa4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xa4) = 0x400298e (pte)
   set 0x400298e, %g2
   set 0xa4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=42, level=3,  ppnr=0x4002a000, p_addr=0xa8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xa8) = 0x4002a8e (pte)
   set 0x4002a8e, %g2
   set 0xa8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=43, level=3,  ppnr=0x4002b000, p_addr=0xac, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xac) = 0x4002b8e (pte)
   set 0x4002b8e, %g2
   set 0xac, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=44, level=3,  ppnr=0x4002c000, p_addr=0xb0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xb0) = 0x4002c8e (pte)
   set 0x4002c8e, %g2
   set 0xb0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=45, level=3,  ppnr=0x4002d000, p_addr=0xb4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xb4) = 0x4002d8e (pte)
   set 0x4002d8e, %g2
   set 0xb4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=46, level=3,  ppnr=0x4002e000, p_addr=0xb8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xb8) = 0x4002e8e (pte)
   set 0x4002e8e, %g2
   set 0xb8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=47, level=3,  ppnr=0x4002f000, p_addr=0xbc, cacheable=0x1, acc=0x4
   ! *(PAGE_TABLE_BASE + 0xbc) = 0x4002f92 (pte)
   set 0x4002f92, %g2
   set 0xbc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=48, level=3,  ppnr=0x40030000, p_addr=0xc0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc0) = 0x400308e (pte)
   set 0x400308e, %g2
   set 0xc0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=49, level=3,  ppnr=0x40031000, p_addr=0xc4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc4) = 0x400318e (pte)
   set 0x400318e, %g2
   set 0xc4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=50, level=3,  ppnr=0x40032000, p_addr=0xc8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc8) = 0x400328e (pte)
   set 0x400328e, %g2
   set 0xc8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=51, level=3,  ppnr=0x40033000, p_addr=0xcc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xcc) = 0x400338e (pte)
   set 0x400338e, %g2
   set 0xcc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=52, level=3,  ppnr=0x40034000, p_addr=0xd0, cacheable=0x1, acc=0x4
   ! *(PAGE_TABLE_BASE + 0xd0) = 0x4003492 (pte)
   set 0x4003492, %g2
   set 0xd0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTD: context=0, index=80, level=1, child_p_addr=0x300, p_addr=0x540
   ! *(PAGE_TABLE_BASE + 0x540) = ptd(PAGE_TABLE_BASE + 0x300)
   ! make PTD from 0x300
   set 0x300, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x540, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTD: context=0, index=0, level=2, child_p_addr=0x204, p_addr=0x300
   ! *(PAGE_TABLE_BASE + 0x300) = ptd(PAGE_TABLE_BASE + 0x200)
   ! make PTD from 0x204
   set 0x200, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x300, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTE: context=0, index=1, level=3,  ppnr=0x50001000, p_addr=0x204, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x204) = 0x5000116 (pte)
   set 0x5000116, %g2
   set 0x204, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=2, level=3,  ppnr=0x50002000, p_addr=0x208, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x208) = 0x5000216 (pte)
   set 0x5000216, %g2
   set 0x208, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=3, level=3,  ppnr=0x50003000, p_addr=0x20c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x20c) = 0x5000316 (pte)
   set 0x5000316, %g2
   set 0x20c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=4, level=3,  ppnr=0x50004000, p_addr=0x210, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x210) = 0x5000416 (pte)
   set 0x5000416, %g2
   set 0x210, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=5, level=3,  ppnr=0x50005000, p_addr=0x214, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x214) = 0x5000516 (pte)
   set 0x5000516, %g2
   set 0x214, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=6, level=3,  ppnr=0x50006000, p_addr=0x218, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x218) = 0x5000616 (pte)
   set 0x5000616, %g2
   set 0x218, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=7, level=3,  ppnr=0x50007000, p_addr=0x21c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x21c) = 0x5000716 (pte)
   set 0x5000716, %g2
   set 0x21c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=8, level=3,  ppnr=0x50008000, p_addr=0x220, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x220) = 0x5000816 (pte)
   set 0x5000816, %g2
   set 0x220, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=9, level=3,  ppnr=0x50009000, p_addr=0x224, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x224) = 0x5000916 (pte)
   set 0x5000916, %g2
   set 0x224, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=10, level=3,  ppnr=0x5000a000, p_addr=0x228, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x228) = 0x5000a16 (pte)
   set 0x5000a16, %g2
   set 0x228, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=11, level=3,  ppnr=0x5000b000, p_addr=0x22c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x22c) = 0x5000b16 (pte)
   set 0x5000b16, %g2
   set 0x22c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=12, level=3,  ppnr=0x5000c000, p_addr=0x230, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x230) = 0x5000c16 (pte)
   set 0x5000c16, %g2
   set 0x230, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=13, level=3,  ppnr=0x5000d000, p_addr=0x234, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x234) = 0x5000d16 (pte)
   set 0x5000d16, %g2
   set 0x234, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=14, level=3,  ppnr=0x5000e000, p_addr=0x238, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x238) = 0x5000e16 (pte)
   set 0x5000e16, %g2
   set 0x238, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=15, level=3,  ppnr=0x5000f000, p_addr=0x23c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x23c) = 0x5000f16 (pte)
   set 0x5000f16, %g2
   set 0x23c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=16, level=3,  ppnr=0x50010000, p_addr=0x240, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x240) = 0x5001016 (pte)
   set 0x5001016, %g2
   set 0x240, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=17, level=3,  ppnr=0x50011000, p_addr=0x244, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x244) = 0x5001116 (pte)
   set 0x5001116, %g2
   set 0x244, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=18, level=3,  ppnr=0x50012000, p_addr=0x248, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x248) = 0x5001216 (pte)
   set 0x5001216, %g2
   set 0x248, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=19, level=3,  ppnr=0x50013000, p_addr=0x24c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x24c) = 0x5001316 (pte)
   set 0x5001316, %g2
   set 0x24c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=20, level=3,  ppnr=0x50014000, p_addr=0x250, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x250) = 0x5001416 (pte)
   set 0x5001416, %g2
   set 0x250, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=21, level=3,  ppnr=0x50015000, p_addr=0x254, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x254) = 0x5001516 (pte)
   set 0x5001516, %g2
   set 0x254, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=22, level=3,  ppnr=0x50016000, p_addr=0x258, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x258) = 0x5001616 (pte)
   set 0x5001616, %g2
   set 0x258, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=23, level=3,  ppnr=0x50017000, p_addr=0x25c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x25c) = 0x5001716 (pte)
   set 0x5001716, %g2
   set 0x25c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=24, level=3,  ppnr=0x50018000, p_addr=0x260, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x260) = 0x5001816 (pte)
   set 0x5001816, %g2
   set 0x260, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=25, level=3,  ppnr=0x50019000, p_addr=0x264, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x264) = 0x5001916 (pte)
   set 0x5001916, %g2
   set 0x264, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=26, level=3,  ppnr=0x5001a000, p_addr=0x268, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x268) = 0x5001a16 (pte)
   set 0x5001a16, %g2
   set 0x268, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=27, level=3,  ppnr=0x5001b000, p_addr=0x26c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x26c) = 0x5001b16 (pte)
   set 0x5001b16, %g2
   set 0x26c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=28, level=3,  ppnr=0x5001c000, p_addr=0x270, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x270) = 0x5001c16 (pte)
   set 0x5001c16, %g2
   set 0x270, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=29, level=3,  ppnr=0x5001d000, p_addr=0x274, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x274) = 0x5001d16 (pte)
   set 0x5001d16, %g2
   set 0x274, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=30, level=3,  ppnr=0x5001e000, p_addr=0x278, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x278) = 0x5001e16 (pte)
   set 0x5001e16, %g2
   set 0x278, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=31, level=3,  ppnr=0x5001f000, p_addr=0x27c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x27c) = 0x5001f16 (pte)
   set 0x5001f16, %g2
   set 0x27c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=32, level=3,  ppnr=0x50020000, p_addr=0x280, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x280) = 0x5002016 (pte)
   set 0x5002016, %g2
   set 0x280, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=33, level=3,  ppnr=0x50021000, p_addr=0x284, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x284) = 0x5002116 (pte)
   set 0x5002116, %g2
   set 0x284, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=34, level=3,  ppnr=0x50022000, p_addr=0x288, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x288) = 0x5002216 (pte)
   set 0x5002216, %g2
   set 0x288, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=35, level=3,  ppnr=0x50023000, p_addr=0x28c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x28c) = 0x5002316 (pte)
   set 0x5002316, %g2
   set 0x28c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=36, level=3,  ppnr=0x50024000, p_addr=0x290, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x290) = 0x5002416 (pte)
   set 0x5002416, %g2
   set 0x290, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=37, level=3,  ppnr=0x50025000, p_addr=0x294, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x294) = 0x5002516 (pte)
   set 0x5002516, %g2
   set 0x294, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=38, level=3,  ppnr=0x50026000, p_addr=0x298, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x298) = 0x5002616 (pte)
   set 0x5002616, %g2
   set 0x298, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=39, level=3,  ppnr=0x50027000, p_addr=0x29c, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x29c) = 0x5002716 (pte)
   set 0x5002716, %g2
   set 0x29c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=40, level=3,  ppnr=0x50028000, p_addr=0x2a0, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2a0) = 0x5002816 (pte)
   set 0x5002816, %g2
   set 0x2a0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=41, level=3,  ppnr=0x50029000, p_addr=0x2a4, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2a4) = 0x5002916 (pte)
   set 0x5002916, %g2
   set 0x2a4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=42, level=3,  ppnr=0x5002a000, p_addr=0x2a8, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2a8) = 0x5002a16 (pte)
   set 0x5002a16, %g2
   set 0x2a8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=43, level=3,  ppnr=0x5002b000, p_addr=0x2ac, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2ac) = 0x5002b16 (pte)
   set 0x5002b16, %g2
   set 0x2ac, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=44, level=3,  ppnr=0x5002c000, p_addr=0x2b0, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2b0) = 0x5002c16 (pte)
   set 0x5002c16, %g2
   set 0x2b0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=45, level=3,  ppnr=0x5002d000, p_addr=0x2b4, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2b4) = 0x5002d16 (pte)
   set 0x5002d16, %g2
   set 0x2b4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=46, level=3,  ppnr=0x5002e000, p_addr=0x2b8, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2b8) = 0x5002e16 (pte)
   set 0x5002e16, %g2
   set 0x2b8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=47, level=3,  ppnr=0x5002f000, p_addr=0x2bc, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2bc) = 0x5002f16 (pte)
   set 0x5002f16, %g2
   set 0x2bc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=48, level=3,  ppnr=0x50030000, p_addr=0x2c0, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2c0) = 0x5003016 (pte)
   set 0x5003016, %g2
   set 0x2c0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=49, level=3,  ppnr=0x50031000, p_addr=0x2c4, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2c4) = 0x5003116 (pte)
   set 0x5003116, %g2
   set 0x2c4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=50, level=3,  ppnr=0x50032000, p_addr=0x2c8, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2c8) = 0x5003216 (pte)
   set 0x5003216, %g2
   set 0x2c8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=51, level=3,  ppnr=0x50033000, p_addr=0x2cc, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2cc) = 0x5003316 (pte)
   set 0x5003316, %g2
   set 0x2cc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=52, level=3,  ppnr=0x50034000, p_addr=0x2d0, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2d0) = 0x5003416 (pte)
   set 0x5003416, %g2
   set 0x2d0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=53, level=3,  ppnr=0x50035000, p_addr=0x2d4, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2d4) = 0x5003516 (pte)
   set 0x5003516, %g2
   set 0x2d4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=54, level=3,  ppnr=0x50036000, p_addr=0x2d8, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2d8) = 0x5003616 (pte)
   set 0x5003616, %g2
   set 0x2d8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=55, level=3,  ppnr=0x50037000, p_addr=0x2dc, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2dc) = 0x5003716 (pte)
   set 0x5003716, %g2
   set 0x2dc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=56, level=3,  ppnr=0x50038000, p_addr=0x2e0, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2e0) = 0x5003816 (pte)
   set 0x5003816, %g2
   set 0x2e0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=57, level=3,  ppnr=0x50039000, p_addr=0x2e4, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2e4) = 0x5003916 (pte)
   set 0x5003916, %g2
   set 0x2e4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=58, level=3,  ppnr=0x5003a000, p_addr=0x2e8, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2e8) = 0x5003a16 (pte)
   set 0x5003a16, %g2
   set 0x2e8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=59, level=3,  ppnr=0x5003b000, p_addr=0x2ec, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2ec) = 0x5003b16 (pte)
   set 0x5003b16, %g2
   set 0x2ec, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=60, level=3,  ppnr=0x5003c000, p_addr=0x2f0, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2f0) = 0x5003c16 (pte)
   set 0x5003c16, %g2
   set 0x2f0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=61, level=3,  ppnr=0x5003d000, p_addr=0x2f4, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2f4) = 0x5003d16 (pte)
   set 0x5003d16, %g2
   set 0x2f4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=62, level=3,  ppnr=0x5003e000, p_addr=0x2f8, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2f8) = 0x5003e16 (pte)
   set 0x5003e16, %g2
   set 0x2f8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=63, level=3,  ppnr=0x5003f000, p_addr=0x2fc, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x2fc) = 0x5003f16 (pte)
   set 0x5003f16, %g2
   set 0x2fc, %g5
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
