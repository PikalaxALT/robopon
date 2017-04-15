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
