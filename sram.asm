INCLUDE "includes.asm"

SECTION "SRAM0", SRAM, BANK [0]

SECTION "SRAM1", SRAM, BANK [1]

SECTION "Save Game", SRAM [$a300], BANK [1]
	array sSavedWarehouse, 1, 28, 170 ; a300

sSaveGame::
sSaveBlock1:: ds $214 ; b598
sSaveBlock1End::
sSaveBlock2:: ds $a0 ; b7ac
sSaveBlock2End::
sSaveBlock3:: ds $dc ; b84c
sSaveBlock3End::
sSaveBlock4:: ds $fa ; b928
sSaveBlock4End::
sSaveGameEnd:: ; ba22

	short sCheckSum ; ba22

	array sSRAMRobots, 1, 4, 47 ; ba24

SECTION "Robopon Title", SRAM [$bae0], BANK [1]
	array sSavedRoboponTitle, 7, 1, 1

SECTION "SRAM2", SRAM, BANK [2]
	array sRoboponTitle, 7, 1, 1
	array sWarehouse, 1, 28, 170 ; a007
	array s2_b29f, 1, 4, $351 ; b29f

SECTION "SRAM3", SRAM [$a002], BANK [3]
sHeap:: alloc_block s3_a002
	ds $1ffe - 5
