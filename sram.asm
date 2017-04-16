INCLUDE "includes.asm"

SECTION "SRAM0", SRAM, BANK [0]

SECTION "SRAM1", SRAM, BANK [1]

SECTION "SRAM2", SRAM, BANK [2]

SECTION "SRAM3", SRAM [$a002], BANK [3]
sAllocatableBlock1:: alloc_block s3_a002
	ds $1ffe - 5
