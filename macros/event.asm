ldtext_tree_pointer: MACRO
	ld \1, (\2_Pointer - TextTreeBitstreams) / 2
	ENDM
hltext_tree_pointer EQUS "ldtext_tree_pointer hl,"

scriptcall: MACRO
printt "\1_{script_bank}\n"
	call \1_{script_bank}
	ENDM

writetext: MACRO
	hltext_tree_pointer \1
	scriptcall PrintTextStandard
	ENDM

writenpctext: MACRO
	hltext_tree_pointer \1
	scriptcall PrintTextWithNPCName
	ENDM

writetext_yesorno: MACRO
	hltext_tree_pointer \1
	scriptcall PrintTextWithYesNoBox
	ENDM

writenpctext_yesorno: MACRO
	hltext_tree_pointer \1
	scriptcall PrintTextWithNPCNameAndYesNoBox
	ENDM

script_sleep: MACRO
	ld hl, \1
	scriptcall ScriptSleep
	ENDM

playmusic: MACRO
IF \1 == 0
	xor a
ELSE
	ld a, \1
ENDC
	scriptcall PlayMusic
	ENDM

playsfx: MACRO
IF \1 == 0
	xor a
ELSE
	ld a, \1
ENDC
	scriptcall PlaySFX
	ENDM

checkevent: MACRO
	ld hl, \1
	scriptcall CheckEventFlag
	ENDM

setevent: MACRO
	ld e, 1
	ld hl, \1
	scriptcall EventFlagAction
	ENDM

resetevent: MACRO
	ld e, 0
	ld hl, \1
	scriptcall EventFlagAction
	ENDM

startbattle: MACRO
	ld de, \1
	ld hl, \2
	scriptcall ScriptedBattle
	ENDM

loadwilds: MACRO
	ld e, \1
	ld hl, \2
	scriptcall LoadEncounters
	ENDM

loadwarps: MACRO
	ld e, \1
	ld hl, \2
	scriptcall LoadWarps
	ENDM

loadpeople: MACRO
	ld e, \1
	ld hl, \2
	scriptcall LoadMapObjects
	ENDM

applymovementdata: MACRO
	ld c, \1
	ld de, \2
	ld a, BANK(\2)
	scriptcall ApplyMovementData
	ENDM

loademote: MACRO
	ld c, \1
	ld e, \2
	ld a, \3
	scriptcall LoadEmote
	ENDM

heal: MACRO
	scriptcall RepairRobots
	ENDM

face_player: MACRO
IF \1 == 0
	xor a
ELSE
	ld a, \1
ENDC
	scriptcall FacePlayer
	ENDM

sprite_face: MACRO
	ld e, \1
	ld a, \2
	scriptcall SpriteFace
	ENDM
