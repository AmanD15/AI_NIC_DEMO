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
   !PTD: context=0, index=64, level=1, child_p_addr=0x0, p_addr=0x500
   ! *(PAGE_TABLE_BASE + 0x500) = ptd(PAGE_TABLE_BASE + 0x0)
   ! make PTD from 0x0
   set 0x0, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x500, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTE: context=0, index=0, level=2,  ppnr=0x40000000, p_addr=0x0, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x0) = 0x400008a (pte)
   set 0x400008a, %g2
   set 0x0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=1, level=2,  ppnr=0x40040000, p_addr=0x4, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x4) = 0x400408a (pte)
   set 0x400408a, %g2
   set 0x4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=2, level=2,  ppnr=0x40080000, p_addr=0x8, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x8) = 0x400808a (pte)
   set 0x400808a, %g2
   set 0x8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=3, level=2,  ppnr=0x400c0000, p_addr=0xc, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0xc) = 0x400c08a (pte)
   set 0x400c08a, %g2
   set 0xc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=4, level=2,  ppnr=0x40100000, p_addr=0x10, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x10) = 0x401008a (pte)
   set 0x401008a, %g2
   set 0x10, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=5, level=2,  ppnr=0x40140000, p_addr=0x14, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x14) = 0x401408a (pte)
   set 0x401408a, %g2
   set 0x14, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=6, level=2,  ppnr=0x40180000, p_addr=0x18, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x18) = 0x401808a (pte)
   set 0x401808a, %g2
   set 0x18, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=7, level=2,  ppnr=0x401c0000, p_addr=0x1c, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x1c) = 0x401c08a (pte)
   set 0x401c08a, %g2
   set 0x1c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=8, level=2,  ppnr=0x40200000, p_addr=0x20, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x20) = 0x402008a (pte)
   set 0x402008a, %g2
   set 0x20, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=9, level=2,  ppnr=0x40240000, p_addr=0x24, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x24) = 0x402408a (pte)
   set 0x402408a, %g2
   set 0x24, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=10, level=2,  ppnr=0x40280000, p_addr=0x28, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x28) = 0x402808a (pte)
   set 0x402808a, %g2
   set 0x28, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=11, level=2,  ppnr=0x402c0000, p_addr=0x2c, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x2c) = 0x402c08a (pte)
   set 0x402c08a, %g2
   set 0x2c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=12, level=2,  ppnr=0x40300000, p_addr=0x30, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x30) = 0x403008a (pte)
   set 0x403008a, %g2
   set 0x30, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=13, level=2,  ppnr=0x40340000, p_addr=0x34, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x34) = 0x403408a (pte)
   set 0x403408a, %g2
   set 0x34, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=14, level=2,  ppnr=0x40380000, p_addr=0x38, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x38) = 0x403808a (pte)
   set 0x403808a, %g2
   set 0x38, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=15, level=2,  ppnr=0x403c0000, p_addr=0x3c, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x3c) = 0x403c08a (pte)
   set 0x403c08a, %g2
   set 0x3c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=16, level=2,  ppnr=0x40400000, p_addr=0x40, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x40) = 0x404008a (pte)
   set 0x404008a, %g2
   set 0x40, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=17, level=2,  ppnr=0x40440000, p_addr=0x44, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x44) = 0x404408a (pte)
   set 0x404408a, %g2
   set 0x44, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=18, level=2,  ppnr=0x40480000, p_addr=0x48, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x48) = 0x404808a (pte)
   set 0x404808a, %g2
   set 0x48, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=19, level=2,  ppnr=0x404c0000, p_addr=0x4c, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x4c) = 0x404c08a (pte)
   set 0x404c08a, %g2
   set 0x4c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=20, level=2,  ppnr=0x40500000, p_addr=0x50, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x50) = 0x405008a (pte)
   set 0x405008a, %g2
   set 0x50, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=21, level=2,  ppnr=0x40540000, p_addr=0x54, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x54) = 0x405408a (pte)
   set 0x405408a, %g2
   set 0x54, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=22, level=2,  ppnr=0x40580000, p_addr=0x58, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x58) = 0x405808a (pte)
   set 0x405808a, %g2
   set 0x58, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=23, level=2,  ppnr=0x405c0000, p_addr=0x5c, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x5c) = 0x405c08a (pte)
   set 0x405c08a, %g2
   set 0x5c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=24, level=2,  ppnr=0x40600000, p_addr=0x60, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x60) = 0x406008a (pte)
   set 0x406008a, %g2
   set 0x60, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=25, level=2,  ppnr=0x40640000, p_addr=0x64, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x64) = 0x406408a (pte)
   set 0x406408a, %g2
   set 0x64, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=26, level=2,  ppnr=0x40680000, p_addr=0x68, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x68) = 0x406808a (pte)
   set 0x406808a, %g2
   set 0x68, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=27, level=2,  ppnr=0x406c0000, p_addr=0x6c, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x6c) = 0x406c08a (pte)
   set 0x406c08a, %g2
   set 0x6c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=28, level=2,  ppnr=0x40700000, p_addr=0x70, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x70) = 0x407008a (pte)
   set 0x407008a, %g2
   set 0x70, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=29, level=2,  ppnr=0x40740000, p_addr=0x74, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x74) = 0x407408a (pte)
   set 0x407408a, %g2
   set 0x74, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=30, level=2,  ppnr=0x40780000, p_addr=0x78, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x78) = 0x407808a (pte)
   set 0x407808a, %g2
   set 0x78, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=31, level=2,  ppnr=0x407c0000, p_addr=0x7c, cacheable=0x1, acc=0x2
   ! *(PAGE_TABLE_BASE + 0x7c) = 0x407c08a (pte)
   set 0x407c08a, %g2
   set 0x7c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=32, level=2,  ppnr=0x40800000, p_addr=0x80, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x80) = 0x408008e (pte)
   set 0x408008e, %g2
   set 0x80, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=33, level=2,  ppnr=0x40840000, p_addr=0x84, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x84) = 0x408408e (pte)
   set 0x408408e, %g2
   set 0x84, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=34, level=2,  ppnr=0x40880000, p_addr=0x88, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x88) = 0x408808e (pte)
   set 0x408808e, %g2
   set 0x88, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=35, level=2,  ppnr=0x408c0000, p_addr=0x8c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x8c) = 0x408c08e (pte)
   set 0x408c08e, %g2
   set 0x8c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=36, level=2,  ppnr=0x40900000, p_addr=0x90, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x90) = 0x409008e (pte)
   set 0x409008e, %g2
   set 0x90, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=37, level=2,  ppnr=0x40940000, p_addr=0x94, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x94) = 0x409408e (pte)
   set 0x409408e, %g2
   set 0x94, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=38, level=2,  ppnr=0x40980000, p_addr=0x98, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x98) = 0x409808e (pte)
   set 0x409808e, %g2
   set 0x98, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=39, level=2,  ppnr=0x409c0000, p_addr=0x9c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x9c) = 0x409c08e (pte)
   set 0x409c08e, %g2
   set 0x9c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=40, level=2,  ppnr=0x40a00000, p_addr=0xa0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xa0) = 0x40a008e (pte)
   set 0x40a008e, %g2
   set 0xa0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=41, level=2,  ppnr=0x40a40000, p_addr=0xa4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xa4) = 0x40a408e (pte)
   set 0x40a408e, %g2
   set 0xa4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=42, level=2,  ppnr=0x40a80000, p_addr=0xa8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xa8) = 0x40a808e (pte)
   set 0x40a808e, %g2
   set 0xa8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=43, level=2,  ppnr=0x40ac0000, p_addr=0xac, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xac) = 0x40ac08e (pte)
   set 0x40ac08e, %g2
   set 0xac, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=44, level=2,  ppnr=0x40b00000, p_addr=0xb0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xb0) = 0x40b008e (pte)
   set 0x40b008e, %g2
   set 0xb0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=45, level=2,  ppnr=0x40b40000, p_addr=0xb4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xb4) = 0x40b408e (pte)
   set 0x40b408e, %g2
   set 0xb4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=46, level=2,  ppnr=0x40b80000, p_addr=0xb8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xb8) = 0x40b808e (pte)
   set 0x40b808e, %g2
   set 0xb8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=47, level=2,  ppnr=0x40bc0000, p_addr=0xbc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xbc) = 0x40bc08e (pte)
   set 0x40bc08e, %g2
   set 0xbc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=48, level=2,  ppnr=0x40c00000, p_addr=0xc0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc0) = 0x40c008e (pte)
   set 0x40c008e, %g2
   set 0xc0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=49, level=2,  ppnr=0x40c40000, p_addr=0xc4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc4) = 0x40c408e (pte)
   set 0x40c408e, %g2
   set 0xc4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=50, level=2,  ppnr=0x40c80000, p_addr=0xc8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xc8) = 0x40c808e (pte)
   set 0x40c808e, %g2
   set 0xc8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=51, level=2,  ppnr=0x40cc0000, p_addr=0xcc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xcc) = 0x40cc08e (pte)
   set 0x40cc08e, %g2
   set 0xcc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=52, level=2,  ppnr=0x40d00000, p_addr=0xd0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd0) = 0x40d008e (pte)
   set 0x40d008e, %g2
   set 0xd0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=53, level=2,  ppnr=0x40d40000, p_addr=0xd4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd4) = 0x40d408e (pte)
   set 0x40d408e, %g2
   set 0xd4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=54, level=2,  ppnr=0x40d80000, p_addr=0xd8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xd8) = 0x40d808e (pte)
   set 0x40d808e, %g2
   set 0xd8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=55, level=2,  ppnr=0x40dc0000, p_addr=0xdc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xdc) = 0x40dc08e (pte)
   set 0x40dc08e, %g2
   set 0xdc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=56, level=2,  ppnr=0x40e00000, p_addr=0xe0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xe0) = 0x40e008e (pte)
   set 0x40e008e, %g2
   set 0xe0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=57, level=2,  ppnr=0x40e40000, p_addr=0xe4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xe4) = 0x40e408e (pte)
   set 0x40e408e, %g2
   set 0xe4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=58, level=2,  ppnr=0x40e80000, p_addr=0xe8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xe8) = 0x40e808e (pte)
   set 0x40e808e, %g2
   set 0xe8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=59, level=2,  ppnr=0x40ec0000, p_addr=0xec, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xec) = 0x40ec08e (pte)
   set 0x40ec08e, %g2
   set 0xec, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=60, level=2,  ppnr=0x40f00000, p_addr=0xf0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xf0) = 0x40f008e (pte)
   set 0x40f008e, %g2
   set 0xf0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=61, level=2,  ppnr=0x40f40000, p_addr=0xf4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xf4) = 0x40f408e (pte)
   set 0x40f408e, %g2
   set 0xf4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=62, level=2,  ppnr=0x40f80000, p_addr=0xf8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xf8) = 0x40f808e (pte)
   set 0x40f808e, %g2
   set 0xf8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=63, level=2,  ppnr=0x40fc0000, p_addr=0xfc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0xfc) = 0x40fc08e (pte)
   set 0x40fc08e, %g2
   set 0xfc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=65, level=1,  ppnr=0x41000000, p_addr=0x504, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x504) = 0x410008e (pte)
   set 0x410008e, %g2
   set 0x504, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTD: context=0, index=66, level=1, child_p_addr=0x100, p_addr=0x508
   ! *(PAGE_TABLE_BASE + 0x508) = ptd(PAGE_TABLE_BASE + 0x100)
   ! make PTD from 0x100
   set 0x100, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x508, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTE: context=0, index=0, level=2,  ppnr=0x42000000, p_addr=0x100, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x100) = 0x420008e (pte)
   set 0x420008e, %g2
   set 0x100, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=1, level=2,  ppnr=0x42040000, p_addr=0x104, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x104) = 0x420408e (pte)
   set 0x420408e, %g2
   set 0x104, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=2, level=2,  ppnr=0x42080000, p_addr=0x108, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x108) = 0x420808e (pte)
   set 0x420808e, %g2
   set 0x108, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=3, level=2,  ppnr=0x420c0000, p_addr=0x10c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x10c) = 0x420c08e (pte)
   set 0x420c08e, %g2
   set 0x10c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=4, level=2,  ppnr=0x42100000, p_addr=0x110, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x110) = 0x421008e (pte)
   set 0x421008e, %g2
   set 0x110, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=5, level=2,  ppnr=0x42140000, p_addr=0x114, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x114) = 0x421408e (pte)
   set 0x421408e, %g2
   set 0x114, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=6, level=2,  ppnr=0x42180000, p_addr=0x118, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x118) = 0x421808e (pte)
   set 0x421808e, %g2
   set 0x118, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=7, level=2,  ppnr=0x421c0000, p_addr=0x11c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x11c) = 0x421c08e (pte)
   set 0x421c08e, %g2
   set 0x11c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=8, level=2,  ppnr=0x42200000, p_addr=0x120, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x120) = 0x422008e (pte)
   set 0x422008e, %g2
   set 0x120, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=9, level=2,  ppnr=0x42240000, p_addr=0x124, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x124) = 0x422408e (pte)
   set 0x422408e, %g2
   set 0x124, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=10, level=2,  ppnr=0x42280000, p_addr=0x128, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x128) = 0x422808e (pte)
   set 0x422808e, %g2
   set 0x128, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=11, level=2,  ppnr=0x422c0000, p_addr=0x12c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x12c) = 0x422c08e (pte)
   set 0x422c08e, %g2
   set 0x12c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=12, level=2,  ppnr=0x42300000, p_addr=0x130, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x130) = 0x423008e (pte)
   set 0x423008e, %g2
   set 0x130, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=13, level=2,  ppnr=0x42340000, p_addr=0x134, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x134) = 0x423408e (pte)
   set 0x423408e, %g2
   set 0x134, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=14, level=2,  ppnr=0x42380000, p_addr=0x138, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x138) = 0x423808e (pte)
   set 0x423808e, %g2
   set 0x138, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=15, level=2,  ppnr=0x423c0000, p_addr=0x13c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x13c) = 0x423c08e (pte)
   set 0x423c08e, %g2
   set 0x13c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=16, level=2,  ppnr=0x42400000, p_addr=0x140, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x140) = 0x424008e (pte)
   set 0x424008e, %g2
   set 0x140, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=17, level=2,  ppnr=0x42440000, p_addr=0x144, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x144) = 0x424408e (pte)
   set 0x424408e, %g2
   set 0x144, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=18, level=2,  ppnr=0x42480000, p_addr=0x148, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x148) = 0x424808e (pte)
   set 0x424808e, %g2
   set 0x148, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=19, level=2,  ppnr=0x424c0000, p_addr=0x14c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x14c) = 0x424c08e (pte)
   set 0x424c08e, %g2
   set 0x14c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=20, level=2,  ppnr=0x42500000, p_addr=0x150, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x150) = 0x425008e (pte)
   set 0x425008e, %g2
   set 0x150, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=21, level=2,  ppnr=0x42540000, p_addr=0x154, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x154) = 0x425408e (pte)
   set 0x425408e, %g2
   set 0x154, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=22, level=2,  ppnr=0x42580000, p_addr=0x158, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x158) = 0x425808e (pte)
   set 0x425808e, %g2
   set 0x158, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=23, level=2,  ppnr=0x425c0000, p_addr=0x15c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x15c) = 0x425c08e (pte)
   set 0x425c08e, %g2
   set 0x15c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=24, level=2,  ppnr=0x42600000, p_addr=0x160, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x160) = 0x426008e (pte)
   set 0x426008e, %g2
   set 0x160, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=25, level=2,  ppnr=0x42640000, p_addr=0x164, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x164) = 0x426408e (pte)
   set 0x426408e, %g2
   set 0x164, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=26, level=2,  ppnr=0x42680000, p_addr=0x168, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x168) = 0x426808e (pte)
   set 0x426808e, %g2
   set 0x168, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=27, level=2,  ppnr=0x426c0000, p_addr=0x16c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x16c) = 0x426c08e (pte)
   set 0x426c08e, %g2
   set 0x16c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=28, level=2,  ppnr=0x42700000, p_addr=0x170, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x170) = 0x427008e (pte)
   set 0x427008e, %g2
   set 0x170, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=29, level=2,  ppnr=0x42740000, p_addr=0x174, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x174) = 0x427408e (pte)
   set 0x427408e, %g2
   set 0x174, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=30, level=2,  ppnr=0x42780000, p_addr=0x178, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x178) = 0x427808e (pte)
   set 0x427808e, %g2
   set 0x178, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=31, level=2,  ppnr=0x427c0000, p_addr=0x17c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x17c) = 0x427c08e (pte)
   set 0x427c08e, %g2
   set 0x17c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=32, level=2,  ppnr=0x42800000, p_addr=0x180, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x180) = 0x428008e (pte)
   set 0x428008e, %g2
   set 0x180, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=33, level=2,  ppnr=0x42840000, p_addr=0x184, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x184) = 0x428408e (pte)
   set 0x428408e, %g2
   set 0x184, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=34, level=2,  ppnr=0x42880000, p_addr=0x188, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x188) = 0x428808e (pte)
   set 0x428808e, %g2
   set 0x188, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=35, level=2,  ppnr=0x428c0000, p_addr=0x18c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x18c) = 0x428c08e (pte)
   set 0x428c08e, %g2
   set 0x18c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=36, level=2,  ppnr=0x42900000, p_addr=0x190, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x190) = 0x429008e (pte)
   set 0x429008e, %g2
   set 0x190, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=37, level=2,  ppnr=0x42940000, p_addr=0x194, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x194) = 0x429408e (pte)
   set 0x429408e, %g2
   set 0x194, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=38, level=2,  ppnr=0x42980000, p_addr=0x198, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x198) = 0x429808e (pte)
   set 0x429808e, %g2
   set 0x198, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=39, level=2,  ppnr=0x429c0000, p_addr=0x19c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x19c) = 0x429c08e (pte)
   set 0x429c08e, %g2
   set 0x19c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=40, level=2,  ppnr=0x42a00000, p_addr=0x1a0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1a0) = 0x42a008e (pte)
   set 0x42a008e, %g2
   set 0x1a0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=41, level=2,  ppnr=0x42a40000, p_addr=0x1a4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1a4) = 0x42a408e (pte)
   set 0x42a408e, %g2
   set 0x1a4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=42, level=2,  ppnr=0x42a80000, p_addr=0x1a8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1a8) = 0x42a808e (pte)
   set 0x42a808e, %g2
   set 0x1a8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=43, level=2,  ppnr=0x42ac0000, p_addr=0x1ac, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1ac) = 0x42ac08e (pte)
   set 0x42ac08e, %g2
   set 0x1ac, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=44, level=2,  ppnr=0x42b00000, p_addr=0x1b0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1b0) = 0x42b008e (pte)
   set 0x42b008e, %g2
   set 0x1b0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=45, level=2,  ppnr=0x42b40000, p_addr=0x1b4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1b4) = 0x42b408e (pte)
   set 0x42b408e, %g2
   set 0x1b4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=46, level=2,  ppnr=0x42b80000, p_addr=0x1b8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1b8) = 0x42b808e (pte)
   set 0x42b808e, %g2
   set 0x1b8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=47, level=2,  ppnr=0x42bc0000, p_addr=0x1bc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1bc) = 0x42bc08e (pte)
   set 0x42bc08e, %g2
   set 0x1bc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=48, level=2,  ppnr=0x42c00000, p_addr=0x1c0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1c0) = 0x42c008e (pte)
   set 0x42c008e, %g2
   set 0x1c0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=49, level=2,  ppnr=0x42c40000, p_addr=0x1c4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1c4) = 0x42c408e (pte)
   set 0x42c408e, %g2
   set 0x1c4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=50, level=2,  ppnr=0x42c80000, p_addr=0x1c8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1c8) = 0x42c808e (pte)
   set 0x42c808e, %g2
   set 0x1c8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=51, level=2,  ppnr=0x42cc0000, p_addr=0x1cc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1cc) = 0x42cc08e (pte)
   set 0x42cc08e, %g2
   set 0x1cc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=52, level=2,  ppnr=0x42d00000, p_addr=0x1d0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1d0) = 0x42d008e (pte)
   set 0x42d008e, %g2
   set 0x1d0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=53, level=2,  ppnr=0x42d40000, p_addr=0x1d4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1d4) = 0x42d408e (pte)
   set 0x42d408e, %g2
   set 0x1d4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=54, level=2,  ppnr=0x42d80000, p_addr=0x1d8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1d8) = 0x42d808e (pte)
   set 0x42d808e, %g2
   set 0x1d8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=55, level=2,  ppnr=0x42dc0000, p_addr=0x1dc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1dc) = 0x42dc08e (pte)
   set 0x42dc08e, %g2
   set 0x1dc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=56, level=2,  ppnr=0x42e00000, p_addr=0x1e0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1e0) = 0x42e008e (pte)
   set 0x42e008e, %g2
   set 0x1e0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=57, level=2,  ppnr=0x42e40000, p_addr=0x1e4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1e4) = 0x42e408e (pte)
   set 0x42e408e, %g2
   set 0x1e4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=58, level=2,  ppnr=0x42e80000, p_addr=0x1e8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1e8) = 0x42e808e (pte)
   set 0x42e808e, %g2
   set 0x1e8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=59, level=2,  ppnr=0x42ec0000, p_addr=0x1ec, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1ec) = 0x42ec08e (pte)
   set 0x42ec08e, %g2
   set 0x1ec, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=60, level=2,  ppnr=0x42f00000, p_addr=0x1f0, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1f0) = 0x42f008e (pte)
   set 0x42f008e, %g2
   set 0x1f0, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=61, level=2,  ppnr=0x42f40000, p_addr=0x1f4, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1f4) = 0x42f408e (pte)
   set 0x42f408e, %g2
   set 0x1f4, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=62, level=2,  ppnr=0x42f80000, p_addr=0x1f8, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1f8) = 0x42f808e (pte)
   set 0x42f808e, %g2
   set 0x1f8, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=63, level=2,  ppnr=0x42fc0000, p_addr=0x1fc, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x1fc) = 0x42fc08e (pte)
   set 0x42fc08e, %g2
   set 0x1fc, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTD: context=0, index=67, level=1, child_p_addr=0x300, p_addr=0x50c
   ! *(PAGE_TABLE_BASE + 0x50c) = ptd(PAGE_TABLE_BASE + 0x300)
   ! make PTD from 0x300
   set 0x300, %g4
   add %g1, %g4, %g4
   srl %g4, 0x4, %g4
   or  %g4, 0x1, %g4
   ! g4 contains PTD 
   set 0x50c, %g5
   add %g5, %g1, %g3
   st %g4, [%g3]
   ! g4 stored into [g3] 
   !PTE: context=0, index=0, level=2,  ppnr=0x43000000, p_addr=0x300, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x300) = 0x430008e (pte)
   set 0x430008e, %g2
   set 0x300, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=1, level=2,  ppnr=0x43040000, p_addr=0x304, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x304) = 0x430408e (pte)
   set 0x430408e, %g2
   set 0x304, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=2, level=2,  ppnr=0x43080000, p_addr=0x308, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x308) = 0x430808e (pte)
   set 0x430808e, %g2
   set 0x308, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=3, level=2,  ppnr=0x430c0000, p_addr=0x30c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x30c) = 0x430c08e (pte)
   set 0x430c08e, %g2
   set 0x30c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=4, level=2,  ppnr=0x43100000, p_addr=0x310, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x310) = 0x431008e (pte)
   set 0x431008e, %g2
   set 0x310, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=5, level=2,  ppnr=0x43140000, p_addr=0x314, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x314) = 0x431408e (pte)
   set 0x431408e, %g2
   set 0x314, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=6, level=2,  ppnr=0x43180000, p_addr=0x318, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x318) = 0x431808e (pte)
   set 0x431808e, %g2
   set 0x318, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=7, level=2,  ppnr=0x431c0000, p_addr=0x31c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x31c) = 0x431c08e (pte)
   set 0x431c08e, %g2
   set 0x31c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=8, level=2,  ppnr=0x43200000, p_addr=0x320, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x320) = 0x432008e (pte)
   set 0x432008e, %g2
   set 0x320, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=9, level=2,  ppnr=0x43240000, p_addr=0x324, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x324) = 0x432408e (pte)
   set 0x432408e, %g2
   set 0x324, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=10, level=2,  ppnr=0x43280000, p_addr=0x328, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x328) = 0x432808e (pte)
   set 0x432808e, %g2
   set 0x328, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=11, level=2,  ppnr=0x432c0000, p_addr=0x32c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x32c) = 0x432c08e (pte)
   set 0x432c08e, %g2
   set 0x32c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=12, level=2,  ppnr=0x43300000, p_addr=0x330, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x330) = 0x433008e (pte)
   set 0x433008e, %g2
   set 0x330, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=13, level=2,  ppnr=0x43340000, p_addr=0x334, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x334) = 0x433408e (pte)
   set 0x433408e, %g2
   set 0x334, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=14, level=2,  ppnr=0x43380000, p_addr=0x338, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x338) = 0x433808e (pte)
   set 0x433808e, %g2
   set 0x338, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=15, level=2,  ppnr=0x433c0000, p_addr=0x33c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x33c) = 0x433c08e (pte)
   set 0x433c08e, %g2
   set 0x33c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=16, level=2,  ppnr=0x43400000, p_addr=0x340, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x340) = 0x434008e (pte)
   set 0x434008e, %g2
   set 0x340, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=17, level=2,  ppnr=0x43440000, p_addr=0x344, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x344) = 0x434408e (pte)
   set 0x434408e, %g2
   set 0x344, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=18, level=2,  ppnr=0x43480000, p_addr=0x348, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x348) = 0x434808e (pte)
   set 0x434808e, %g2
   set 0x348, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=19, level=2,  ppnr=0x434c0000, p_addr=0x34c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x34c) = 0x434c08e (pte)
   set 0x434c08e, %g2
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
   !PTE: context=0, index=0, level=3,  ppnr=0x43500000, p_addr=0x200, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x200) = 0x435008e (pte)
   set 0x435008e, %g2
   set 0x200, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=1, level=3,  ppnr=0x43501000, p_addr=0x204, cacheable=0x0, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x204) = 0x435010e (pte)
   set 0x435010e, %g2
   set 0x204, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=2, level=3,  ppnr=0x43502000, p_addr=0x208, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x208) = 0x435028e (pte)
   set 0x435028e, %g2
   set 0x208, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=3, level=3,  ppnr=0x43503000, p_addr=0x20c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x20c) = 0x435038e (pte)
   set 0x435038e, %g2
   set 0x20c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=4, level=3,  ppnr=0x43504000, p_addr=0x210, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x210) = 0x435048e (pte)
   set 0x435048e, %g2
   set 0x210, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=5, level=3,  ppnr=0x43505000, p_addr=0x214, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x214) = 0x435058e (pte)
   set 0x435058e, %g2
   set 0x214, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=6, level=3,  ppnr=0x43506000, p_addr=0x218, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x218) = 0x435068e (pte)
   set 0x435068e, %g2
   set 0x218, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=7, level=3,  ppnr=0x43507000, p_addr=0x21c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x21c) = 0x435078e (pte)
   set 0x435078e, %g2
   set 0x21c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=8, level=3,  ppnr=0x43508000, p_addr=0x220, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x220) = 0x435088e (pte)
   set 0x435088e, %g2
   set 0x220, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=9, level=3,  ppnr=0x43509000, p_addr=0x224, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x224) = 0x435098e (pte)
   set 0x435098e, %g2
   set 0x224, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=10, level=3,  ppnr=0x4350a000, p_addr=0x228, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x228) = 0x4350a8e (pte)
   set 0x4350a8e, %g2
   set 0x228, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=11, level=3,  ppnr=0x4350b000, p_addr=0x22c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x22c) = 0x4350b8e (pte)
   set 0x4350b8e, %g2
   set 0x22c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=12, level=3,  ppnr=0x4350c000, p_addr=0x230, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x230) = 0x4350c8e (pte)
   set 0x4350c8e, %g2
   set 0x230, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=13, level=3,  ppnr=0x4350d000, p_addr=0x234, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x234) = 0x4350d8e (pte)
   set 0x4350d8e, %g2
   set 0x234, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=14, level=3,  ppnr=0x4350e000, p_addr=0x238, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x238) = 0x4350e8e (pte)
   set 0x4350e8e, %g2
   set 0x238, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=15, level=3,  ppnr=0x4350f000, p_addr=0x23c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x23c) = 0x4350f8e (pte)
   set 0x4350f8e, %g2
   set 0x23c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=16, level=3,  ppnr=0x43510000, p_addr=0x240, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x240) = 0x435108e (pte)
   set 0x435108e, %g2
   set 0x240, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=17, level=3,  ppnr=0x43511000, p_addr=0x244, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x244) = 0x435118e (pte)
   set 0x435118e, %g2
   set 0x244, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=18, level=3,  ppnr=0x43512000, p_addr=0x248, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x248) = 0x435128e (pte)
   set 0x435128e, %g2
   set 0x248, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=19, level=3,  ppnr=0x43513000, p_addr=0x24c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x24c) = 0x435138e (pte)
   set 0x435138e, %g2
   set 0x24c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=20, level=3,  ppnr=0x43514000, p_addr=0x250, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x250) = 0x435148e (pte)
   set 0x435148e, %g2
   set 0x250, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=21, level=3,  ppnr=0x43515000, p_addr=0x254, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x254) = 0x435158e (pte)
   set 0x435158e, %g2
   set 0x254, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=22, level=3,  ppnr=0x43516000, p_addr=0x258, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x258) = 0x435168e (pte)
   set 0x435168e, %g2
   set 0x258, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=23, level=3,  ppnr=0x43517000, p_addr=0x25c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x25c) = 0x435178e (pte)
   set 0x435178e, %g2
   set 0x25c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=24, level=3,  ppnr=0x43518000, p_addr=0x260, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x260) = 0x435188e (pte)
   set 0x435188e, %g2
   set 0x260, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=25, level=3,  ppnr=0x43519000, p_addr=0x264, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x264) = 0x435198e (pte)
   set 0x435198e, %g2
   set 0x264, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=26, level=3,  ppnr=0x4351a000, p_addr=0x268, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x268) = 0x4351a8e (pte)
   set 0x4351a8e, %g2
   set 0x268, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=27, level=3,  ppnr=0x4351b000, p_addr=0x26c, cacheable=0x1, acc=0x4
   ! *(PAGE_TABLE_BASE + 0x26c) = 0x4351b92 (pte)
   set 0x4351b92, %g2
   set 0x26c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=28, level=3,  ppnr=0x4351c000, p_addr=0x270, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x270) = 0x4351c8e (pte)
   set 0x4351c8e, %g2
   set 0x270, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=29, level=3,  ppnr=0x4351d000, p_addr=0x274, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x274) = 0x4351d8e (pte)
   set 0x4351d8e, %g2
   set 0x274, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=30, level=3,  ppnr=0x4351e000, p_addr=0x278, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x278) = 0x4351e8e (pte)
   set 0x4351e8e, %g2
   set 0x278, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=31, level=3,  ppnr=0x4351f000, p_addr=0x27c, cacheable=0x1, acc=0x3
   ! *(PAGE_TABLE_BASE + 0x27c) = 0x4351f8e (pte)
   set 0x4351f8e, %g2
   set 0x27c, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=32, level=3,  ppnr=0x43520000, p_addr=0x280, cacheable=0x1, acc=0x4
   ! *(PAGE_TABLE_BASE + 0x280) = 0x4352092 (pte)
   set 0x4352092, %g2
   set 0x280, %g5
   add %g5, %g1, %g3
   st %g2, [%g3]
   !PTE: context=0, index=65, level=1,  ppnr=0x41000000, p_addr=0x504, cacheable=0x0, acc=0x5
   ! *(PAGE_TABLE_BASE + 0x504) = 0x4100016 (pte)
   set 0x4100016, %g2
   set 0x504, %g5
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
