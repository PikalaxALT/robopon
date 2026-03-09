INCLUDE "includes.asm"

SECTION "SRAM0", SRAM

SECTION "SRAM1", SRAM

SECTION "Save Game", SRAM
	array sSavedWarehouse, 1, warehouseRobot_SIZEOF, 170 ; a300

sSaveGame::
	save_block_1 sSaveBlock1
sSaveBlock1End::
sSaveBlock2:: ds $a0 ; b7ac
sSaveBlock2End::
sSaveBlock3:: ds $dc ; b84c
sSaveBlock3End::
sSaveBlock4:: ds $fa ; b928
sSaveBlock4End::
sSaveGameEnd:: ; ba22

	short sCheckSum ; ba22

	array sSRAMRobots, 1, NUM_SRAM_ROBOTS, robotBaseStats_SIZEOF ; ba24

SECTION "Robopon Title", SRAM
	array sSavedRoboponTitle, 7, 1, 1

SECTION "SRAM2", SRAM
	array sRoboponTitle, 7, 1, 1
	array sWarehouse, 1, warehouseRobot_SIZEOF, 170 ; a007

	; The EN ROM would overflow this bank by $8d bytes.
	; RGBLINK does not allow this.
IF DEF(LANG_JP)
	array s2_b29f, 1, 4, $351 ; b29f
ELIF DEF(LANG_EN)
s2_b29f::
ENDC

SECTION "SRAM3", SRAM
sHeap:: alloc_block s3_a002
	ds $1ffe - 5
