writetext: MACRO
	ld hl, (\1_Pointer - TextTreeBitstreams) / 2
	call PrintText_20
	ENDM

writetext_yesorno: MACRO
	ld hl, (\1_Pointer - TextTreeBitstreams) / 2
	call PrintTextWithYesNoBox_20
	ENDM
