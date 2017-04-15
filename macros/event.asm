writetext: MACRO
	ld hl, (\1_Pointer - TextTreeBitstreams) / 2
	call PrintTextStandard_20
	ENDM

writenpctext: MACRO
	ld hl, (\1_Pointer - TextTreeBitstreams) / 2
	call PrintTextWithNPCName_20
	ENDM

writetext_yesorno: MACRO
	ld hl, (\1_Pointer - TextTreeBitstreams) / 2
	call PrintTextWithYesNoBox_20
	ENDM

writenpctext_yesorno: MACRO
	ld hl, (\1_Pointer - TextTreeBitstreams) / 2
	call PrintTextWithNPCNameAndYesNoBox_20
	ENDM

script_sleep: MACRO
	ld hl, \1
	call ScriptSleep_20
	ENDM

playmusic: MACRO
IF \1 == 0
	xor a
ELSE
	ld a, \1
ENDC
	call PlayMusic_20
	ENDM

playsfx: MACRO
IF \1 == 0
	xor a
ELSE
	ld a, \1
ENDC
	call PlaySFX_20
	ENDM

checkevent: MACRO
	ld hl, \1
	call CheckEventFlag_20
	ENDM

startbattle: MACRO
	ld de, \1
	ld hl, \2
	call ScriptedBattle_20
	ENDM
